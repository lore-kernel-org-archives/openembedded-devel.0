Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABE6775539
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 09:43:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a8-v6so1739650wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fSH812JsQtQ2N32ZelOyjJhVxq/Jk3oh1gUeTqorFio=;
	b=q4dBaNLen0z8deKvo+1yMCQupTDrDvnQMH0+v1WU1z5fuxqMGIE01TQVehP8huuRou
	FP8kvSBn+StUVblKmC6+dvzLpnY2ivwFQmUBAM187fXi5YCHlxbVGSrKV+dxCCDcBC2S
	CW3JYgxkZvm368D1hzr5nPHJwZfOjmer21yR8Ru8um1CsEMZsnLoogwDqRq34wOBnuar
	l51MGB4tWgcDznkRvqkdWDcpsyRhQvrb0bZRdtHKLQXlYSCL6LKE1SuVb/R2dBFrvTz6
	ifyXrggnsOJEOlYr4OiqsAOpPMl688wcU387FV/YHiXdZ0c7t6+SExbK5/ZZNY9tFFXd
	Vi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fSH812JsQtQ2N32ZelOyjJhVxq/Jk3oh1gUeTqorFio=;
	b=n/CdnMiEb0uqbXP+ES8zzp8gAeacNEyQR5zO11p43bmD80f11nkJUn7181GZEkvlQh
	l1/jGFgSML+H2HdmlSb5Z/nAeagr0EYGuwRW33JrpOhW7r3j+0BeHko+4IZVLVldLX/J
	ntqppPs2Yfp7Vg3KJ4Y/yTMaNvSusGUEKxyPLOMKLPfq9/UdmtBuHSwB33f34UHgXHHa
	QDoT5TQIW9YUXsFJhdWNneMyPyPlV/bSFxnGtiiprj7AFx6HouRzmqejH6abBC7a12a/
	cdoLQroxI8MdWloVrEoaY7ucqEHg8IL6KniRW9K0Mfq8JEZZqUY46ZNeq2XpfKrP9gao
	7Whg==
X-Gm-Message-State: ALKqPwcGfXXuzT0dLDYm2W42VtU2ryObin3NUi5OI7holL3gmh8Ip7J+
	EQqqMNgzvFre9co0olkU8mA9kw==
X-Google-Smtp-Source: AB8JxZqSHxowXa01rxYXEcydVFjjq2EIg/2ewSdauDCv5wFYIhpgMG04ZBSt0HcyNzSXZEZsIp3IDQ==
X-Received: by 2002:a1c:8e47:: with SMTP id
	q68-v6mr1510981wmd.104.1526031815562; 
	Fri, 11 May 2018 02:43:35 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC07328D893D370C8B06BD7.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7328:d893:d370:c8b0:6bd7])
	by smtp.gmail.com with ESMTPSA id
	y45-v6sm2843741wrd.97.2018.05.11.02.43.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 02:43:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 11:43:25 +0200
Message-Id: <20180511094325.24816-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] evince: update 3.24.0 -> 3.28.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 09:43:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evince/{evince_3.24.0.bb => evince_3.28.1.bb}             | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.24.0.bb => evince_3.28.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
index c7ecf2ba5..ce73620b0 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
@@ -13,14 +13,13 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
            "
-SRC_URI[archive.md5sum] = "3fb65ff46de191dc49c481f1fc66201c"
-SRC_URI[archive.sha256sum] = "043895af7bbd6f1b57f9ab8778e78cf9c0af5dfcc347eaa94a17bf864c04dc8f"
+SRC_URI[archive.md5sum] = "27107b60ecc78b698e7902906f16ce82"
+SRC_URI[archive.sha256sum] = "caaa3100548b704068efb33f592b53accaf2154090ca68933d841f318d3c4d9e"
 
-EXTRA_OECONF = " --enable-thumbnailer \
-"
+EXTRA_OECONF = "--enable-thumbnailer"
 
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
 }
 
 
@@ -52,7 +51,7 @@ PACKAGES =+ "${PN}-nautilus-extension"
 PACKAGES =+ "${PN}-browser-plugin"
 
 FILES_${PN} += "${datadir}/dbus-1 \
-                ${datadir}/appdata \
+                ${datadir}/metainfo \
                 ${datadir}/thumbnailers \
                 ${systemd_unitdir}/systemd/user/evince.service \
                "
-- 
2.14.3


