Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9F62A7D39B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 13:35:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l3so12768628qtr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 06:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=INKFjebKI9OlSdhFf3QU8yKUQJtATxOmOUMw/1mI8Ow=;
	b=p09eY4ekGLfo0E/WghJPZH49EUbdw3HU31xCooG+AujijuuDsxbSDxVfr5NoKo8E6H
	+qDRhqrK1rsi0AFAmQJspwurgRBQ2E0OLM/kbFAnH+Y/6S3DTBHe4U+JE9CZARlE7y51
	kEDMi4/HYJxpLXTRBhkNKoiJNazGRYzGmFqzi+WKB25tDDHD0OdbYbYzBCzjF4mxo9DQ
	eCtftkR69z0vDXwFAyBLrXv428cN7ajfks9hTKSyd+z+cvpnR+mrFbr2kFohGbBN7dM/
	1FELXC9N5TMifClMfPOWndTT7xfFbZbpfUyzUJHXp1J7PD/ATjpw1G2gbR34JZOvUBhp
	KWnA==
X-Gm-Message-State: APjAAAV64498hsibKj3D+JrH2Qxv9bZt6PUisQmqf+3Dp4sNnVq2XQXt
	zNComb36qN3Bi1ykfwjpA1vY/0WZStU=
X-Google-Smtp-Source: APXvYqxITM89kDddF4Ipr4M6CD61ZpwJ0UXAB6udUFEsuK2DApTHqyXsZ4nSV3UasQrS31qlImXGVA==
X-Received: by 2002:ac8:5345:: with SMTP id d5mr15334663qto.120.1570282526016; 
	Sat, 05 Oct 2019 06:35:26 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	d55sm5720209qta.41.2019.10.05.06.35.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 06:35:24 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat,  5 Oct 2019 10:35:21 -0300
Message-Id: <20191005133521.1780695-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH] zram: Avoid installing init and services, if unused
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
X-List-Received-Date: Sat, 05 Oct 2019 13:35:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-extended/zram/zram_0.1.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index dfd75e71c..564a0877c 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -16,11 +16,16 @@ SRC_URI = " \
 
 do_install () {
     # Sysvinit
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+    fi
+
+    # SystemD
+    if ${@bb.utils.filter('DISTRO_FEATURES','systemd','true','false',d)}; then
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 FILES_${PN} = "${sysconfdir}"
-- 
2.23.0


