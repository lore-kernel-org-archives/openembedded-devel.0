Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 828847FA1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:06:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p14so19035371pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VTWW99s5LjifMdePCLu1dJNmUhyrMHL7kYH1Hyn0B48=;
	b=DXY9pzq+QCo9L3SN7tnPf/0uNQjha0H3WXI071VU+xHkIWsXH3OvK+TESKga3cSAu1
	JL5Rs79ypDVUgRE5MIoKiOzPVgpTvHfwfgt/QAupmNcfREcsk82wy6it7/vhNhGJDuSm
	Qh+VpzG8mMhhAsn6trtpzUzSLDj1GYbOEA/9ewvm1TwQCv+JKHS0Aa3O0eUIzSVhz9IY
	8FvhqeO8hX1qKru1pbksyaFYu7eQJfaS8JA8Xjk2L7vGEjjWiDId94qY0eMGlupIlcQG
	jMnEG//NWonSaqJvEgaLw0ET5OtFPzCBr4X9ErjuPsm1idy1plXwSZaF1J6UgmG5jYb8
	Mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VTWW99s5LjifMdePCLu1dJNmUhyrMHL7kYH1Hyn0B48=;
	b=Zw37Z5GpFjH756vwd26A0OFx6ptPY/eWOh8pozlKWnplOx6TGib+lPgB4m+ZyHKsvL
	HGPtyAm3loZuU3paNwyNDBuptRm2Wd9SuGvmuqGi+1uSea/dzlHp4g4A7G0XewOG7MYc
	3DZYfsMkfZGo7MAiWaPydE/IqG4B4HvgZJpOccFmzfJXZe7bUfjNEdlHv0MqDCw3MSaK
	Me1pqXJ7BKTJTBocmrM2yillHUb1YCZXFMg4IGmASdNj04h/rT8DOowK8j61Qg0I+jK3
	3w3vlDoxNJ0n7iCUZoe4cx/DesKxIoo94FJMCOaaoBkT5i65Fjp927iR5FbLEeNSrQSe
	QytQ==
X-Gm-Message-State: APjAAAW8i9sR2v7VlB6G6FcXmZCPCuJZdBkf/GU0g0+o/ZfrmcZJ8soA
	5bJpR7ScmUDXnKLcl0i/6TISp8350gI=
X-Google-Smtp-Source: APXvYqwLFGBKUBtvY9HJOw2mdsu0/rEBx6GrVu74DtUxtbS5C0wuizSQ1UuDi0IxVD6JdATw8eyINw==
X-Received: by 2002:aa7:946a:: with SMTP id t10mr75099165pfq.165.1577754420308;
	Mon, 30 Dec 2019 17:07:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.06.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:06:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:50 -0800
Message-Id: <20191231010652.3206534-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/8] sanlock: Upgrade to 3.8.0+
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
X-List-Received-Date: Tue, 31 Dec 2019 01:07:00 -0000
Content-Transfer-Encoding: 8bit

The original SRCREV was at 3.7.3 even though PV was 3.8.0
this upgrades to latest on top of 3.8.0 to get py3 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/sanlock/sanlock_3.8.0.bb | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index bf7eaf4111..3b65d48741 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -9,13 +9,14 @@ HOMEPAGE = "https://pagure.io/sanlock"
 SECTION = "utils"
 
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
+LIC_FILES_CHKSUM = "file://../README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
-           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
+           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
-S = "${WORKDIR}/git"
+SRCREV = "cff348800722f7dadf030ffe7494c2df714996e3"
+
+S = "${WORKDIR}/git/python"
 
 DEPENDS = "libaio util-linux"
 
@@ -24,15 +25,13 @@ inherit distutils3 useradd
 do_configure[noexec] = "1"
 
 do_compile_prepend () {
-    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
-    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
-    cd ${S}/python
+    oe_runmake -C ${S}/../wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
+    oe_runmake -C ${S}/../src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
 }
 
 do_install_prepend () {
-    oe_runmake -C wdmd DESTDIR=${D} LIBDIR=${libdir} install
-    oe_runmake -C src DESTDIR=${D} LIBDIR=${libdir} install
-    cd ${S}/python
+    oe_runmake -C ${S}/../wdmd DESTDIR=${D} LIBDIR=${libdir} install
+    oe_runmake -C ${S}/../src DESTDIR=${D} LIBDIR=${libdir} install
 }
 
 SANLOCKGROUP ?= "sanlock"
-- 
2.24.1


