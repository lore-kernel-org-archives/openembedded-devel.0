Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TuQdG-00046c-5p
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2013 17:42:04 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1804287pad.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2013 08:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Dt6u9OSfSxc4VHKaqeZhz9x6k5rmzCgdZkTKt9c1r34=;
	b=osRT6KwIxGhblIyACzGHg+BeRAeAVTszGGiRl4nIRibg6HiOkf1XGlBA1Hl+h4wNI9
	0HcxBsKMjPTfCN2rMaj3M0gA75Q8PFKVM85QQaAK+ofYyT7koc/nCHAlNFJ8blJV36Hc
	MFARm601LCIfMa1JQIJKVNT16S60cmZgvA7k99Ee/jG52xk+NbR8wrt53mpnQRgf+PL/
	E5pSRCvE+kdH6HZ/EFgUgQexcdOunqc3XjlHkZiB4LKJPMEaHMAuBjSamCLon0QYP9WP
	ZdFMGkaXsYT9Yt0HiU+pBFTYDRsBAvImmk9RTGouiOcsU6JWUmej4Lbjl9r/0iAWFiRa
	Hbpg==
X-Received: by 10.66.85.70 with SMTP id f6mr215887406paz.76.1358094403682;
	Sun, 13 Jan 2013 08:26:43 -0800 (PST)
Received: from otp-agherzan-l1.wrs.com (5-13-223-33.residential.rdsnet.ro.
	[5.13.223.33])
	by mx.google.com with ESMTPS id oj1sm6550775pbb.19.2013.01.13.08.26.41
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Jan 2013 08:26:42 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2013 18:26:34 +0200
Message-Id: <1358094394-25613-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn7EB6xhrREFvsAYT/haau6HiUIibuedQPQnFqizMdDErmMv4x5d7LE7nquXEa2TPobZMUU
Subject: [meta-multimedia][PATCH] libpostproc: Remove -disable-yasm as this is a nonexistent flag
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
X-List-Received-Date: Sun, 13 Jan 2013 16:42:05 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
index 3620ff0..1520628 100644
--- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -6,6 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "0.0.0+git${SRCPV}"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -40,10 +41,6 @@ EXTRA_OECONF = " \
         ${EXTRA_FFCONF} \
 "
 
-#| yasm not found, use --disable-yasm for a crippled build
-EXTRA_OECONF_append_x86-64 = " --disable-yasm"
-EXTRA_OECONF_append_x86 = " --disable-yasm"
-
 do_configure() {
     ./configure ${EXTRA_OECONF}
 }
-- 
1.7.10.4



