Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2OSr-0006Xs-2Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:00:15 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so2702845dak.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=Ar1A0/Mtuh1kg6WtzjIwdirCT/J7nKIelnRV+EwOQdU=;
	b=KJEUA8TdJPa96q1IBQ5Q/7pWDHZeUnDCxLbk1VWFCxo74hewx2uVFoh9dthFmOBxkZ
	H1wnIDcO/5zD4GZxOO3OyQlXYaIFLAn3AT9fnEGb9pcPKqx+WBKfOPZHCGpGOLnsZoiu
	z4ceIZ8BLtoTbPQu7nUgj1Jb0gyxBcOPwD1DirYU+nNG6LdocV6yw6FMRQQTMDoVj0MM
	IJiKfbcpjZ+8/WQsTnZLLOXhCd2l6GxW93YGQd4i7T5l3IM8EpZV7aawVt5X7aYaD50w
	IcFkz6E9CRWeS1NteSXISDt8iOPnMaBhcoO9sptz+YwIS/motwYtG4pA4s75DHhdOBVY
	1Axw==
X-Received: by 10.66.75.133 with SMTP id c5mr12743981paw.31.1359992663589;
	Mon, 04 Feb 2013 07:44:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q4sm22255115paz.20.2013.02.04.07.44.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:44:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 15:44:08 +0100
Message-Id: <cover.1359988981.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][for-danny 0/2] cryptsetup
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
X-List-Received-Date: Mon, 04 Feb 2013 16:00:17 -0000

The following changes since commit 23faa51a1080d17ad491a187c7a9150f2f578ce1:

  libdbi: import from OE-classic and update to latest 0.8.4 (2013-02-01 11:02:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-danny

Martin Jansa (2):
  lvm2: upgrade to 2.02.97 which is compatible with newer udev
  cryptsetup: import from oe-classic

 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb | 18 ++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb           |  7 -------
 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb           |  6 ++++++
 3 files changed, 24 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb

-- 
1.8.1.2



