Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9062D6B7B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:09 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so181127eae.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=vqEi982c8nLoGPh3UVpvMO5xuEsMyCC1JXYkOfqyGjM=;
	b=aDd1ENA9ieHyQ/E1G/SgLuffY8r1A+YKUk17+fV7JDKPbTjEBR2k4YB4rZc+O/df+g
	gq1nx+B3kaMObMr1A9nalEWP0aVret+Mhr2NmYL148443VHubYhq9+aytJP/Crpi9I0r
	kGXgtOUshkSfGzTU6zuZFO3OOZjFg6c2ep0JbYqGfePJW1g8RvSnA9FNRO95c/Crzy6u
	4/FvDWQun9Jh4XN83vF2tF/Y54fkYYa8rMUJIRklFoKTgLrD/XsHKGamuPcrCk9D6uWi
	GdRBS0pJ0IsCkXCjSTGJjkm2RR+eEfu8+sLUF6LHkD1xuQowZ/LjK9oLarAw40d3Hjwb
	HK7g==
X-Received: by 10.15.42.206 with SMTP id u54mr103018eev.94.1376551149625;
	Thu, 15 Aug 2013 00:19:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm81929481eeg.5.2013.08.15.00.19.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:53 +0200
Message-Id: <066bada6e130d68e53cea6afba8381c91da32fe8.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 13/60] cryptsetup: add missing dependency on libgcrypt
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:09 -0000

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
1.8.3.2


