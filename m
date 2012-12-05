Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7r-0000Mb-3j
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:32 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2192193eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FrufL1JM2c8pXLaeKv/riwHtNzKNnGYherxNVAM2J84=;
	b=dBNl042qVwEMbSYutjrBc17ljJ917jpQVpnyIaWSJLnppWx2ZcKTqiwCqJxC3LJJrd
	zCRsVRxIWvIfivFSiy9hQf2TpDOJohAzfYQeQAyNozIoykN3XDjVlGK7zjMt5koAw9T1
	fzh5UqvJAp/am6AjTMME5fecdoDikaGVLrRS/Xzd7PjvE7voi9tDtMExQhhLevc6IMNs
	WPhnChZyKKjT2OwdiikzZGLNwRis9eYvjp8nBiAqeNAviZYxorOuBgyoiG653oLHC/es
	onSrFGV6H/wDVA29F+r5dueVFzlcZ7/BR/zgj1O1Rhubt6d6MsIsoObWZ9srago/OlmE
	D8Hw==
Received: by 10.14.219.3 with SMTP id l3mr50466878eep.5.1354744386786;
	Wed, 05 Dec 2012 13:53:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm11769356eeo.8.2012.12.05.13.53.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:53:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:06 +0100
Message-Id: <8ccb358e1bf827e5023eda079e14ee16708b5be5.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 83/85] xdotool: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:32 -0000

* fixes:
xdotool-1.20100416.2809: xdotool: Files/directories were installed but not shipped
  /usr/man
  /usr/man/man1
  /usr/man/man1/xdotool.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index cb3f83c..4f13058 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -5,11 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2f9cbf7e9401cec8a38666a08851ce6b"
 SECTION = "x11"
 DEPENDS = "virtual/libx11 libxtst"
 
+PR = "r1"
+
 SRC_URI = "http://semicomplete.googlecode.com/files/xdotool-${PV}.tar.gz"
 SRC_URI[md5sum] = "1d5be641e512c343abfe5f78b39e6f19"
 SRC_URI[sha256sum] = "42d7271fbc796e53db71bb221f311b9ff3c51d90a71c9487a9bd3101ca39894f"
 
-EXTRA_OEMAKE = "PREFIX=${prefix}"
+EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLMAN=${mandir}"
 
 do_install() {
 	oe_runmake -e install DESTDIR=${D} PREFIX=${prefix}
-- 
1.8.0



