Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1Txekf-0007z2-J6
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 15:23:01 +0100
Received: by mail-ea0-f179.google.com with SMTP id d12so2106099eaa.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=6vszk5cWH79IPXJfQJ/wmXvedTgUMj302LiKvpu7eNo=;
	b=r0fBHa/RRQBb3PBlEZSdWZbtq06nK9FgPasxXqiFJ51sbv/ICUK9mvN4SIMyxdFjcX
	95Bv9qE/hTBew7lLHVm4eQushXbVBsC+0ufKZORmJR1hIrtPluQyUs+/+a2iHU5jHpTR
	2kT8awQmBSO7TqSI4BxGQJ37/3MkuhRSxHV0tjloY7NaKsWVj34JRyJH7H1ITzVUHlgq
	UojIxOdv9qoRGZJJJv2+SL/mjuF+97MPLm9+UrossHVJ/3Jg3BpXtHq6k1EsgXumMB/3
	sSkRhIuxU+tdKWraCJp3i+SwtWDFXWcDepk74xQiCQWFFFmM1+eZl6u1WLWKZ7MAcCm7
	aJ/w==
X-Received: by 10.14.203.3 with SMTP id e3mr38271040eeo.9.1358863648609;
	Tue, 22 Jan 2013 06:07:28 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id t4sm8071570eel.0.2013.01.22.06.07.27
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 06:07:27 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6D85A400AD2; Tue, 22 Jan 2013 15:07:15 +0100 (CET)
From: david.c.nystrom@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 15:07:12 +0100
Message-Id: <1358863633-32066-1-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCHv2] Fix twisted rootfs generation error.
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
X-List-Received-Date: Tue, 22 Jan 2013 14:23:05 -0000
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
  meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb

 .../python/python-twisted_10.2.0.bb                |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.9.5



