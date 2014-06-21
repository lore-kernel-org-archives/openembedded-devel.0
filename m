Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 821CB609BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:12 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so1882131wiv.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pxdl7VfHlW1vvy1q+bml+WQUapUH6tLTNwPPGdfg5BM=;
	b=p6S+kQdsx+MzR+1ErxRAljzFDTeTwkgk28sbnx4ma4l8srNudm+W6I/QZL6eS/GuWd
	jPVfIcZljexp3tPUDROFwArZNdtFfZ0LK7zOsr/9lIz692TmAUsGcCbS31EdcsufujEb
	dRGSHJPtw+5AR+NiwBur/fyhrurX61PZa0lFS9bekwe1iPhIprSi4Wm4br0N9YpRBaQU
	e/nE+bLoW/9LlYRXPSdKrd+7DE3xwvL4vhWv0ceTU8/8kkSVanHCvPbzmz5pHJ+DbO08
	uqnEjJH4Sz7Nrw6VdvP6GcTLfSI9vymTkmDEc1g04JyNFih1hJkaLir2e6dTsKh01ru4
	GFBQ==
X-Received: by 10.180.74.9 with SMTP id p9mr10187083wiv.39.1403342353159;
	Sat, 21 Jun 2014 02:19:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lk7sm20106997wjb.24.2014.06.21.02.19.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:01 +0200
Message-Id: <1403342349-11180-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 04/12] libmtp: add missing dependency on virtual/libiconv
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index 0c92ff9..773e559 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "\
     file://examples/albums.c;beginline=5;endline=21;md5=84f4e55dfec49e898b7f68a828c15620 \
 "
 
-DEPENDS += "libusb1"
+DEPENDS += "libusb1 virtual/libiconv"
 
 SCM_URI = "git://git.code.sf.net/p/libmtp/code"
 SRC_URI = "\
-- 
2.0.0


