Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 146A66155D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:50:52 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id k29so11557478pfp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tOjL4DhTNpJB4TL2YUL4M6oLMCMoUm29QpZV12BT3FY=;
	b=VakMSyzaGOWMD0TVJqzV3l/DVEAtEn/kIXIzf6PMBF2SxiWxF+JLhJRLoyQj5AyuJ5
	31xOYjXeRLZeUbW64dkC7PwzacQmEcVA9Cbmpr4IvEMPV5X8v428XY0L0JQiDJQVwLaB
	SHDWbwCtJSof0AFRH3CPaIO2JI3ZXEYy/4x4kSK1TnQazXxcKYsh8BZFZgACRDJviBci
	oWnOEXtDl/EubBE0QIilg3tptHwyyg4Ujd/ECKW/2hgIMxYl+ZEcM+FNI53O8CdoXD7x
	ScaaDH7i4ctKFhj94ygG64M4bTpIDUc3gkPFLfEyQGyJ3WIj8opCOBLQzrRS8Berw3oc
	n5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tOjL4DhTNpJB4TL2YUL4M6oLMCMoUm29QpZV12BT3FY=;
	b=gh5uGkFLTIOEQGptdTb5lhkg9+IZtbv1KHVjuVpkZZhDjSUeDrMpoDxQYYopBwrh1C
	MjK6d+dmCKE3qrzC+R9X3sNzyehMQ0EU3sDa1/w2tOkNatecDq8yXSupik12BB3hnZ55
	OkjRShS1D7yEwjS7sHc4wwWAWW76t+m9fQ1TmbRc6+xNJtZtFbYp3RPqA/xVag3y9nBc
	1G4yd7yeUbU3ndK3KeZMux685VEeYzbX+xn2wosT7cSeAHTnFjPMGhiuzGkLpiAFIldl
	3Lo9Ko2314yQGv59iQS4JAaEB0MPwV5DOrFvJ+M9Vyda6/H4Peb9jkyOOO9tasFiqnFh
	tREQ==
X-Gm-Message-State: APjAAAXeDaZeM6R3diYuCq564TTelVi5kVFcB7E2cdXe51bIS+lSncDe
	4q7PdGJ228LcPY+MpjklWlgc89T9H24=
X-Google-Smtp-Source: APXvYqwLAo7B9i3HrzuI/fHhyF9+ZETjjIq0aOrEaNyXo4nGU9VCHEOrZsIpBJmURRxIrTmMCCRQjg==
X-Received: by 2002:a65:5281:: with SMTP id y1mr24758178pgp.327.1582073453699; 
	Tue, 18 Feb 2020 16:50:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id c5sm207276pfi.10.2020.02.18.16.50.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:50:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 16:50:57 -0800
Message-Id: <20200219005058.2921658-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200219005058.2921658-1-raj.khem@gmail.com>
References: <20200219005058.2921658-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] cfengine: Upgrade to 3.15
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
X-List-Received-Date: Wed, 19 Feb 2020 00:50:53 -0000
Content-Transfer-Encoding: 8bit

License-Update: Change in Company name Cfengine AS a Norwegian company -> Northern.tech
Python3 fixes to needed scripts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cfengine/cfengine-masterfiles/python3.patch  | 16 ++++++++++++++++
 ..._3.12.0.bb => cfengine-masterfiles_3.15.0.bb} | 15 ++++++++++-----
 .../{cfengine_3.12.0.bb => cfengine_3.15.0.bb}   | 10 +++++-----
 3 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.12.0.bb => cfengine-masterfiles_3.15.0.bb} (74%)
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.12.0.bb => cfengine_3.15.0.bb} (89%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
new file mode 100644
index 0000000000..a6f6701261
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
@@ -0,0 +1,16 @@
+--- a/modules/packages/apt_get
++++ b/modules/packages/apt_get
+@@ -1,4 +1,4 @@
+-#!/var/cfengine/bin/python
++#!/var/cfengine/bin/python3
+ 
+ import sys
+ import os
+--- a/modules/packages/apt_get.in
++++ b/modules/packages/apt_get.in
+@@ -1,4 +1,4 @@
+-#!@bindir@/python
++#!@bindir@/python3
+ 
+ import sys
+ import os
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
similarity index 74%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
index dda6af9c9d..79269d3147 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
@@ -20,10 +20,11 @@ HOMEPAGE = "http://cfengine.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
 
-SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "d59bd8c95620da816c382f749d425860"
-SRC_URI[sha256sum] = "1c50e3d8c702097e13a21258626d936d6ff2e6492e893dfe286ff0d6204d7a65"
+SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
+           file://python3.patch \
+           "
+SRC_URI[md5sum] = "6d456fdd9bd24ff6617eeaa05efae602"
+SRC_URI[sha256sum] = "4a071c0c4ba7df9bad93144cff5fbc0566e5172afd66201072e3193b76c55a38"
 
 inherit autotools
 
@@ -31,6 +32,10 @@ export EXPLICIT_VERSION="${PV}"
 
 EXTRA_OECONF = "--prefix=${datadir}/cfengine"
 
+do_install_append() {
+    rm -rf ${D}${datadir}/cfengine/modules/packages/{zypper,yum}
+}
+
 FILES_${PN} = "${datadir}/cfengine"
 
-RDEPENDS_${PN} += "python-core"
+RDEPENDS_${PN} += "python3-core"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
similarity index 89%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
index 9d0123d8bd..fa08be3e65 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
@@ -11,18 +11,17 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f8b34828ab373d6b1bb4b0fc60a78494"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
 
 DEPENDS = "attr tokyocabinet"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            file://set-path-of-default-config-file.patch \
            "
+SRC_URI[md5sum] = "d4dabfa46d8afa151be5610f184354e7"
+SRC_URI[sha256sum] = "fa53e137f850eb268a8e7ae4578b5db5dc383656341f5053dc1a353ed0288265"
 
-SRC_URI[md5sum] = "33ef12260db4b430352229f37f7cb0e5"
-SRC_URI[sha256sum] = "d71ba98a272390c6fa8bc20e8ea27f0050a0a72a3e6b206a4762b4646be332ec"
-
-inherit autotools systemd
+inherit autotools-brokensep systemd
 
 export EXPLICIT_VERSION="${PV}"
 
@@ -67,6 +66,7 @@ EOF
         install -m 0755 -D ${D}${sysconfdir}/init.d/cfengine3 ${D}${datadir}/${BPN}/cfengine3
         sed -i -e 's#/etc/init.d#${datadir}/${BPN}#' ${D}${systemd_system_unitdir}/*.service
     fi
+    rm -rf ${D}${datadir}/cfengine/modules/packages/zypper
 }
 
 RDEPENDS_${PN} += "${BPN}-masterfiles"
-- 
2.25.1


