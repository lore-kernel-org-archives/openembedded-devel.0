Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1TxeVQ-0007UY-LL
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 15:07:24 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so3349987eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 05:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=7R9/nLZl5pLPplEv6J8tnKxM0aQAB6ciMpEp5H+sf9Y=;
	b=PhAQHpEGnZ0l2LpkNgNJd9bwa+9JwKyPi76YiDasyCEavBL0RecZwZOaiYAibZ2Rru
	70IqCOl0dVlgQk0V0n9vj0hfhG8R+b1WMC1qoGy9dllAH9wl1y0nfCWh9KoEF7T3MRqE
	8mt6BQDqsuCHrZSk4uipNvQV0zO8gFPtAHpS7p1JnRVateaQ3mpU4G8G4yXsEJ6hNecA
	P02c3+XsMzG557dikKmHDPdY6mHbEPQYJuKHn4chohArVcPSUCB6Sjd/QvGiPpS3s7nV
	FNx8VMCKjVdWD0mdKjYhnJQGb69wzf5MthNqCHGUI92518pigWKuc7QRNS2VpNRlqIrP
	g1qg==
X-Received: by 10.14.225.72 with SMTP id y48mr72358061eep.46.1358862706793;
	Tue, 22 Jan 2013 05:51:46 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b2sm27090001eep.9.2013.01.22.05.51.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 05:51:45 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id DAA43400AD2; Tue, 22 Jan 2013 14:51:32 +0100 (CET)
From: david.c.nystrom@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 14:51:25 +0100
Message-Id: <1358862686-31602-1-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCH] Fix twisted rootfs generation error.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 14:07:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>


Fix for below error:
--
| Configuring packagegroup-core-basic.
| Configuring openflow.
| Configuring criu.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for python-twisted:
|  * 			       python-twisted-bin *
|  * opkg_install_cmd: Cannot install package python-twisted.
| ERROR: Function failed: do_rootfs (see /media/sdb5/eel/build/tmp/work/qemux86_64-poky-linux/cloud-image-controller/1.0-r0/temp/log.do_rootfs.24246 for further information)
ERROR: Task 9 (/media/sdb5/eel/upstream/meta-v2/recipes-extended/images/cloud-image-controller.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4948 tasks of which 4930 didn't need to be rerun and 1 failed.
No currently running tasks (4948 of 4951)
--

python-twisted-bin was empty since _c_urlarg.so was included in python-twisted-protocols,
and python-twisted-bin was not ALLOWED_EMPTY.

David Nyström (1):
  Fixed non-existing twisted-bin package

 .../python/python-twisted_10.2.0.bb                |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.9.5



