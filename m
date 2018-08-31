Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A1EBA600BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:54:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w11-v6so11488878wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=idLZn1a4UV27xou3D8xRsP7gIGDprX7+4mZpsydb/Bg=;
	b=GaheV73P7zVB0kp8z3vn9Tfq1w151ztXmFrAe5vchuloNgdDYXNGBZCiLieY2/DlEv
	LyOM+STwQwwD28CV5HRWLi95RLioBcZPDk6g8I8y51SoJvcQY3BTz8gasgaGp4YSq3F4
	SmjgYlyGaovvXl41Z+gIp4JZ+/HfYe4YbYLvdcQ4NWwUxz1Q1FGiuMZXp8tA21d+FN4+
	d+L4PScWFSBw33OrIlzPeKNVj9pMKNNixLlC9SrAvSX3F70101lq9sUwVFVIq55NwZ0F
	ziRi25sT5GLYmdgQAddEtJoIg1tIopwLLW0PyyPHt3uf78L0z8f8ru9xmeSAChWgVHht
	Fm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=idLZn1a4UV27xou3D8xRsP7gIGDprX7+4mZpsydb/Bg=;
	b=mxK+92liGQ6Fk4unh1hTby0Bv2E7IZhoCB6jxlfN5h0MF9zqHoBsQYovnhTysCYcEW
	37ZVsVGr8mr12d6zzFkc0Yd+396f7xiqdX8oGfwWOOStZmYjGMxdNqbA3Wl5PAnKrQ1E
	72apk9QuHCdsdvd3WkS9KalYfJKn4DwkAeuVHdgZUBulZUqe1R2xswPgWgfjTMYcszNE
	22GQASXnYWQjcDypBgGsHtc4E6+m723pFCphX/yekmxOV7b01SevubyjylB3eGp+J9PU
	J0ngHVHAqj3aq0PMGD9XIvzEsJVVCloZOhT17mcBFbY9laJTtZV76p2szcAnIQtvgK9Z
	DTmA==
X-Gm-Message-State: APzg51DpN+Ba+NeY6EzxA7c/B7IQpjTZxcTm4eg3//2xIsZ5ELuHrKkY
	e1qpLas5gMX87uzqkA9GRhzjGQ20nig=
X-Google-Smtp-Source: ANB0Vdb7Lw6UETVagmQzgpObuoOR5xtmPfry4r+HYk6yFsz80b4YGHwSZha8oMWxP5/VFWbyq9VT3A==
X-Received: by 2002:adf:dc46:: with SMTP id
	m6-v6mr11789400wrj.84.1535727272951; 
	Fri, 31 Aug 2018 07:54:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y206-v6sm5680819wmg.14.2018.08.31.07.54.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:54:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:54:30 +0100
Message-Id: <20180831145430.21569-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python-pbr: add python3-pbr variant
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
X-List-Received-Date: Fri, 31 Aug 2018 14:54:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-pbr.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-pbr_3.1.1.bb        | 18 ++----------------
 .../recipes-devtools/python/python3-pbr_3.1.1.bb       |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pbr.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
new file mode 100644
index 0000000000..d8847f6502
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pbr.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
+HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
+SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pip"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
index bdff867f30..8f7f924dab 100644
--- a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
-SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN}_class-target += " \
-        python-pip \
-        "
-
-BBCLASSEXTEND = "native"
+inherit setuptools
+require python-pbr.inc
diff --git a/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
new file mode 100644
index 0000000000..97e7361b16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pbr.inc
-- 
2.11.0


