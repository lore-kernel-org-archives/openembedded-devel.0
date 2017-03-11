Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 02B2B7791E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 22:53:07 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n37so2438399qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 14:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HaMmbthFot1gky9c9h0A+EVZUxZi+qo4Wsg/uhMYtE8=;
	b=UgRPpjaZYes6KKLftKYtcNeFLthvAiUrUPEgEWfK5oURKrmWsesTEFXY5zygvFPSs7
	td0fk47h4I3GYHNHT4h9cMKl7+Up4GlpKfSD+K/zpXikr69dz9bTVF0QsHZ0PFsUHlkH
	KfLxsdoXpiqQzcAdilcGXiDAVtsfHEYFFoTss1aVNrhKvvw+nmTxWXP+nZPko0Loh+Xk
	R5VJ7Cw2c1IFHeJdXtudiy+n5bG7Hf73kCI2Ed9PdFZUAOq3v2zb3D87Et4Bn8PGS37f
	jqGHkKV7rSPkpQy+2mPKMaKqrF6p30vrZQ53A3xkhFh+59kcgIg3ApuPkPmVTnjrDo29
	inTA==
X-Gm-Message-State: AMke39m2MxzMU5Rp1dqDAtSq4y+utfv+33Pn9eMVHRVJXtQx7bhqIJsh7ueLNrex2dBnpQ==
X-Received: by 10.237.59.213 with SMTP id s21mr25629873qte.146.1489272788180; 
	Sat, 11 Mar 2017 14:53:08 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j11sm9118749qta.39.2017.03.11.14.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Mar 2017 14:53:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 17:53:00 -0500
Message-Id: <1489272780-32237-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyserial: update to version 3.3
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
X-List-Received-Date: Sat, 11 Mar 2017 22:53:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyserial.inc            | 7 +++++--
 .../python/{python-pyserial_3.2.1.bb => python-pyserial_3.3.bb}    | 0
 .../python/{python3-pyserial_3.2.1.bb => python3-pyserial_3.3.bb}  | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_3.2.1.bb => python-pyserial_3.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.2.1.bb => python3-pyserial_3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index c1c1904..2508e76 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -7,11 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
 "
 
-SRC_URI[md5sum] = "7142a421c8b35d2dac6c47c254db023d"
-SRC_URI[sha256sum] = "1eecfe4022240f2eab5af8d414f0504e072ee68377ba63d3b6fe6e66c26f66d1"
+RSRC_URI[md5sum] = "6afe4c2e47bcec6eb7051b8c1ce19d52"
+SRC_URI[sha256sum] = "2949cddffc2b05683065a3cd2345114b1a49b08df8cb843d69ba99dc3e19edc2"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.2.1.bb b/meta-python/recipes-devtools/python/python-pyserial_3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_3.2.1.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.2.1.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.3.bb
index 17ed3f8..44c1368 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.3.bb
@@ -5,3 +5,5 @@ do_install_append() {
     rm -f ${D}${bindir}/miniterm.py
     rmdir ${D}${bindir}
 }
+
+RDEPENDS_${PN} += "${PYTHON_PN}-enum ${PYTHON_PN}-selectors"
-- 
2.7.4


