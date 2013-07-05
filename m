Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id D9E766AF31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:00 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so1042031eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Cd5zAarX7XHeToOFnSb16FNbF8X1bL8ADHmyE9GB/GE=;
	b=z8PyVLmwZuE6b5k41cdt74gjgSf9+JyisfBfDOMMi7/jun/n3GMyzGaCnJd9B8iema
	GQrEV/+zd7OSjMDsQZtaG+dNDzATqZoTIs2Lj5A+NlhUoXFSKCKvIWguJ5EXXWl6nU4x
	v1Oi1zV2Q7mP0CEyDHHsFeItygySJ+2qK1JQ2ff7p76ngLAPZTOJR3nvoNcCuEn4Xn+Z
	micGDzPkS/6Hm4/bo29Mo5id4ODTGDxV0XxbxQVIgnUPrYlj1TtaoiLu6kJiwmhpIjND
	ciakXyQ9Jfjq/tI+xg013EWnh6NdqZxhIp5rTBigWdYnSJBuoVMko6EkZgUDJFjZw4kU
	wncw==
X-Received: by 10.15.24.13 with SMTP id i13mr9462610eeu.23.1372987441653;
	Thu, 04 Jul 2013 18:24:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm9629422eeh.11.2013.07.04.18.24.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:49 +0200
Message-Id: <91a8cf29eed3103636ad4b519a3dde9cddb46458.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/10] cryptsetup: add missing dependency on libgcrypt
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
X-List-Received-Date: Fri, 05 Jul 2013 01:24:01 -0000

* there is PACKAGECONFIG for libgcrypt, but do_configure fails
  without macro staged by libgcrypt:
  configure.ac:122: error: possibly undefined macro: AM_PATH_LIBGCRYPT

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
index 17ac2ad..95f7e8d 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
-DEPENDS = "util-linux lvm2 popt"
+DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
 SRC_URI[md5sum] = "f374d11e3b0e7ca0f805756fd02e34ff"
-- 
1.8.2.1


