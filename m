Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03D4B61C13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:56:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so3353589pgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2kenxD/+X+PqMepflotl6K9c0lU8RDrCTugC03/ReXo=;
	b=TlVMJ0KitEj5a68OF46/8eWF83O2ce0ge0Gwfbf9wHuxNP5DPJ7g0/c3Z+huJungHF
	34GrMAgU0MpunEu1DZu9qeTfMnUpYeXRLIVC2UIUGVXTFWYq5WxlS/JtUUbWCHJF2xhd
	VotA2aG2RGCWlFqmzKpMV4/ZEMQqEtghcdFI9H7kPnWoHdrs/ZYFzmOARoiVkDZ45Fxk
	j0eefaHo0m06O/GoF1+T5v/Rv9dFS2RpGkBWEW0LSOh6eiW5p5emYO4smCquTpQMKDeR
	7H7ODmC3q/EW4m+rApqjL0Utr+JRhy/PFRRUHMnp8IF0ZPxAfJEN2wRdkPcF3Udqdjmr
	SeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2kenxD/+X+PqMepflotl6K9c0lU8RDrCTugC03/ReXo=;
	b=MIglx4cw0xl+61Vx6dawcCAw1xEX+4fPNKrp/lXphSDUU5ajpDcI4/5u8sZ5Xb5E1T
	BOhS5yEKuein4mRgoh6aeXX97gmB3nkKM2gllJHojIjB6J6XnZqMDGHfQ+XLGRffJomB
	mndfDXRlA/a57FEafbbhMF8WXJ3j8L0vNrfOxm+ziOqy+fh5Jgk7BO7NxpG8HK7rMll3
	Edxk3sHTJYL8L1rDRu+f3KIzghX7dWMCLVwIcxDiN0cPMAF9dRebSUXBLx33Baj5oqO+
	hCgPuXuibw7jbHn+tXsx/0eLfRnwKyJVs8eCTN8NGQdEEzNscPJkbnFZcrQJm6wbSJq3
	etbg==
X-Gm-Message-State: ANhLgQ1FU/KodeNUu5HaUZU8qlx+4IBUBTdA8EJl+gIvbkFmGtkOdTKn
	abn0nR5weqJ1LLQevYQR8xhSjRpWNDQ=
X-Google-Smtp-Source: ADFU+vsMmAalwRJDeJDF6pJheK+oIu16CP70bIGApSgUgevDmqdGPdiN7Naqkl+AP5VGLWwt7u1cug==
X-Received: by 2002:a62:e414:: with SMTP id r20mr9338875pfh.154.1584032218287; 
	Thu, 12 Mar 2020 09:56:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::94a8])
	by smtp.gmail.com with ESMTPSA id k5sm6392322pgl.3.2020.03.12.09.56.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 09:56:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2020 09:57:04 -0700
Message-Id: <20200312165704.2373253-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jaga <jagadheesan_duraisamy@comcast.com>
Subject: [PATCH] nodejs: install gen-regexp-special-case only when icu is enabled
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
X-List-Received-Date: Thu, 12 Mar 2020 16:56:58 -0000
Content-Transfer-Encoding: 8bit

From: Jaga <jagadheesan_duraisamy@comcast.com>

Fixes install errors when icu packageconfig is disabled

Signed-off-by: Jaga <jagadheesan_duraisamy@comcast.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index 1ea438c5b0..a482c6b4ca 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -138,7 +138,9 @@ do_install_append_class-native() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
     install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator ${D}${bindir}/bytecode_builtins_list_generator
-    install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}${bindir}/gen-regexp-special-case
+    if ${@bb.utils.contains('PACKAGECONFIG','icu','true','false',d)}; then
+        install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}${bindir}/gen-regexp-special-case
+    fi
     install -m 0755 ${S}/out/Release/mkcodecache ${D}${bindir}/mkcodecache
     install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/node_mksnapshot
 }
-- 
2.25.1


