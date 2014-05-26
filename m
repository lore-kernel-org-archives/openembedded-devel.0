Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f54.google.com (unknown [209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 878736FA40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 19:01:37 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id jt11so7995766pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IMiRHVHPqScQcWlX8qu1HB3XX0suJ5t0tfn6ZRGX/XM=;
	b=oPZkUSsjah2fwwWJjkhxl2k5z6XE+v/Gn2XdXZaLY4RGGq0WtYN2w63M8oqavh+1Bm
	mz71lRWddphgGyfpe1VK654hvwwSxeY5SMSrnAwMo3rA6simCX0txvsF51OjyhwR/3mS
	lkb5rr5lsSKuF4LI9EhDRtA1QZQr+t8Qh36DuXWhjd1z9dVDIUvWLk9wePGTYEaOHpF2
	gsxZ8Kj6ZWTBhHFuCQPBRsZQRLPq/NHewTBp/1DSlt97xYBj3S5EnrwDEckO3pu2/9wW
	HEeFl2Pe8BWk7KqyLgPfodz+uOckTngOtYn6O4rsq3nbqQ+99QKJbaFAI3R7FqP9Cqzr
	C0Xw==
X-Received: by 10.66.119.39 with SMTP id kr7mr4391251pab.131.1401130899173;
	Mon, 26 May 2014 12:01:39 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id tu3sm61918905pab.1.2014.05.26.12.01.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 26 May 2014 12:01:38 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 12:04:20 -0700
Message-Id: <1401131060-950-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] libdc1394: fix S!=B failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 19:01:40 -0000

From: Tim Orling <TicoTimo@gmail.com>

Fixes:
fatal error: dc1394/camera.h: No such file or directory
|  #include <dc1394/camera.h>
|                            ^
| compilation terminated.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 5bc77f2..0ea5cb9 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
 
 S = "${WORKDIR}/git/${PN}"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
-- 
1.8.3.2


