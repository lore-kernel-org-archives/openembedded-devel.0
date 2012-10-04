Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrF-0006pJ-0s
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:21 +0200
Received: by mail-gg0-f175.google.com with SMTP id v1so13582ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sfMEYIpsh/MDM7aFgmL/GwaZEsNTF3C2V/FN9As8YGo=;
	b=wBDheuBMlGrH8H9vDN8kd/87EAgWzlzHuGg5ipNinPfXRIpIv5r4B11xxbRfrVH30u
	0Irf+tpUTAv0ge7HBYVykMS4ZtX+ZFxYzUrCPg5g6LmvB+Jgb0gRNni7DaVkilHJy93Q
	fJU1krk0HOphbuXNte0/7kF+PoORuMZro/6LbL+TXkEINJL00R28H4/6psMf+AAV/CTI
	6hw7CYSf8oYjflNld+JV2PYgBUjE+qyjetJ6wLQq4HYcxP9Y8ddhHwy3Zcg7YpDzQqUa
	9rmlSvRHA5M8QiaKfh9UfuUz9YsXa6Y3J+jORX37QgMdm0P6nUqZnXyFVRp2vTCtRjgy
	ZmDw==
Received: by 10.236.173.9 with SMTP id u9mr3927993yhl.129.1349323402700;
	Wed, 03 Oct 2012 21:03:22 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:21 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:02 -0300
Message-Id: <1349323389-16520-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/9] libav: Drop 0.6.5 version
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/libav/libav_0.6.5.bb |   22 ----------------------
 1 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.6.5.bb

diff --git a/meta-oe/recipes-multimedia/libav/libav_0.6.5.bb b/meta-oe/recipes-multimedia/libav/libav_0.6.5.bb
deleted file mode 100644
index 962e253..0000000
--- a/meta-oe/recipes-multimedia/libav/libav_0.6.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require libav.inc
-
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-"
-
-# When bumping SRCREV make sure you bump PR here and in dependant recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION changes
-SRCREV = "62c473934822afd317dfef27754a0ff71f58ce2a"
-
-PV = "0.6.5"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.6"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "--disable-stripping \
-                 --enable-avfilter-lavf \
-                "
-
-- 
1.7.2.5



