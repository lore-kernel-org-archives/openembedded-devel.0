Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8406E705A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 17:00:13 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so6722189wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6nNW95eYwPaZnTOTskyEbLo+BUZTGBKy5BiqkYIvVgA=;
	b=IDHxWldcaGzunBqf1eoGXyWxgrrSLpPjQziOoB6KzkHsuXDVdee93jRlN1+rr0gmZ3
	KC5O/9m00l4PMYUyFZVqHEE6iJiWL5+asNQ5iGs9tqmIqvJsYuLSsfIcb1ScTRwKMBTa
	34IJ9WPxhYrSH2tLyux+JMYlsyO9em1JK6vqy6lSgWAAsrZtHVrYnPGPNRuMfwlx6SlT
	HkTfF622pn5HHqgNIPhdxzOohRuznVCcALAqMfbwmFhT+K9G3t/+FXWj0HXyvIHO9/1l
	IwY4y4KC+LLf7nAZHSUrtzeBaHB7A66KsGG2catO8qXA+iJEK/OZghMePeNXeTm2kd3d
	9mng==
X-Received: by 10.180.206.134 with SMTP id lo6mr27403655wic.1.1405875615048;
	Sun, 20 Jul 2014 10:00:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ut2sm30929445wjc.49.2014.07.20.10.00.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 10:00:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 19:00:24 +0200
Message-Id: <1405875626-8011-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/4] libmatroska: upgrade to 1.4.0
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
X-List-Received-Date: Sun, 20 Jul 2014 17:00:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libmatroska/{libmatroska_1.3.0.bb => libmatroska_1.4.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-mkv/libmatroska/{libmatroska_1.3.0.bb => libmatroska_1.4.0.bb} (85%)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
similarity index 85%
rename from meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb
rename to meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
index cedd283..9644e84 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
 DEPENDS = "libebml"
 
 SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "f4a8c411f09d39c754eb726efd616043"
-SRC_URI[sha256sum] = "5231ec958571365e719a6fd3c220227af6cf0f14e0bd1bcf766ddbc068d18e69"
+SRC_URI[md5sum] = "5b83155019589b04a49f9db923b5bf74"
+SRC_URI[sha256sum] = "1b6d02e75cdbfb6d282dcf2a902a259c3075404885d5e8063e6652a2b3f6c11b"
 
 do_compile() {
     cd ${S}/make/linux
-- 
2.0.0


