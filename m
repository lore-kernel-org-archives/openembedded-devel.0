Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1918970A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:37 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6867482wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PdGse4fm0hNXBL86EDJk48D058/N3WxdAz+JZbPd4Kc=;
	b=focyZ9yw7lzgmfnECcxtSo4EV29zmGWoFuxN/or/NJf+GwdE61h8IAKJr/ELE+5CGj
	hD5IAbZCQ8p/0sdHKAAQUmw2WeJmW3m9G5cPIFjKc/CuoDMF7RpDHBVuC5ndeZK8GZmB
	KdSTVSvwhs/UO3pQmjQG2Ah9SZRUQNwaJguBXxaXCOlF8VWreYmcoKfO8zmk1Ea2EUhp
	GTbyp8FaBTDdpXjD7jy4Uz78kYDYTKhryaodtQFlKAvSiQqZLWLwuD263XzTZlbMCa66
	AKGqFxxLrfbYAW/NINazabGJlyJb5AzYwR6w8E7QIHiCpCg0tcuDZDMCUtqH5X8XlLgu
	AJTQ==
X-Received: by 10.194.110.7 with SMTP id hw7mr40098258wjb.38.1407600518408;
	Sat, 09 Aug 2014 09:08:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm25522519wjd.30.2014.08.09.09.08.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:30 +0200
Message-Id: <1407600537-10857-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/36] libwebp: fix wrong DEPENDS
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:38 -0000

* there is no such thing as packagespecific build-time DEPENDS
* RDEPENDS_${PN}-gif2web isn't needed, because it's detected
  automatically by shlibs providers code
* fixes following floating dependencies:
  WARN: libwebp: libwebp-gif2webp rdepends on giflib but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb b/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
index a5a9169..7663b3b 100644
--- a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
+++ b/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
@@ -12,6 +12,8 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PATENTS;md5=7ec8a34de2073ea13ea2991006246d20"
 
+DEPENDS = "giflib"
+
 SRC_URI = "https://webp.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "c8dd1d26eb9566833aba269b86d97e68"
 SRC_URI[sha256sum] = "31913577e96386556855b41d210736449445fe96cfbe9289014e9b8afa944d69"
@@ -43,4 +45,3 @@ PACKAGES =+ "${PN}-gif2webp"
 
 DESCRIPTION_${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
 FILES_${PN}-gif2webp = "${bindir}/gif2webp"
-DEPENDS_${PN}-gif2webp += "giflib"
-- 
2.0.4


