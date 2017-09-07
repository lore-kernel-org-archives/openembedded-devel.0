Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B3AD771AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 03:58:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g13so3628975pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 20:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=K9yYnrG3dPgZ42HICI/qrxKSnyRQbPw2mzL5hF+rLOI=;
	b=WFsjiOHc1TeZJmbRzekhmvVhI7AkF0pQ+IH3QErfgkwQ/5NAqSN1GNb8BSlndUw1Hy
	el8M50rwf2jMF0Klc+sH+bixk+ltEmqjXLZ4ojoWxdQ4Bkx4kcK9N+gxxTEO5HCw7HM6
	bCcWQEqeUliMGo2p3R4v5guzqmQfGrywpbmEDAtmeOZX1yIR25Sxvy58tM3wvPPpNmQ0
	C7gw1/czEMi43FFZNfFh6oFYxNRFu7wh44rDUc74x4LOpwaU07M909zaMXlr0wg/rkTF
	zObPJkYC5uXgRVwJUFVW34nhWaHgAVuKO6hfJMuYpdFAnh3BNq7ejSfIcHGFRaKXLa7Z
	iDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K9yYnrG3dPgZ42HICI/qrxKSnyRQbPw2mzL5hF+rLOI=;
	b=r2WumdRJWlMHr90cXwK8UOoAsZu45IBeBDTFKlqJj0NaB+q9nXPNwcIYTLTWG8R7Az
	Hm7egOk/khniTddVO5ezVggxQp0HJf6F+czh4OHXvlQV1/4dGebTOoH07M33q7m+elwY
	Q8QkcoraYZsm4Pe8bUiCCPV2XmppCqQwlbk2U6qV5/YEfVJRZI8N2bm9fRENF+CHNO+R
	m2fioQ2adbc5YfUDApidfBLnXteQyBISXukdPetnA/7HGaSxJez54HW6pjC67gOzlVS1
	Qm+y3z7yd8/5LYexLKHfWqfinYaMP/AdFhfqtk+bzdIqwnScyIHSg9MUO+hBMdSh4dqP
	QiQA==
X-Gm-Message-State: AHPjjUjKH+pvbS6SF3sCkWxvEfxe35Ae09kBPqq+7WbwZ/0jDX497nhZ
	IGRdgMJ2S4c51OnD
X-Google-Smtp-Source: ADKCNb6GJ9QPyJXAynraxyBnzO9IdcpO/P/2oIUi0zq4M63Gpjf9jkpyA4Zb+hzX51ToDOkRk8w09A==
X-Received: by 10.98.133.194 with SMTP id m63mr1438565pfk.44.1504756692718;
	Wed, 06 Sep 2017 20:58:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id 13sm1637379pfi.55.2017.09.06.20.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 20:58:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 20:57:54 -0700
Message-Id: <20170907035758.41689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-filesystems][PATCH 1/5] aufs-util: Use cross strip tool
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
X-List-Received-Date: Thu, 07 Sep 2017 03:58:11 -0000

Honor the STRIP variable when passed from environment
Fixes build with musl/raspberrypi

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../aufs-util/0001-libau-Define-STRIP-weakly.patch | 39 ++++++++++++++++++++++
 .../recipes-utils/aufs-util/aufs-util_git.bb       |  2 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
new file mode 100644
index 000000000..9efea804b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
@@ -0,0 +1,39 @@
+From bb8801fb21ac8d73e3b1a11a8555aaf822182a51 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 5 Sep 2017 10:36:52 -0700
+Subject: [PATCH] libau: Define STRIP weakly
+
+STRIP can be set on environment to use cross version of strip utility
+hardcoding to strip is not working in cross environment
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ libau/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libau/Makefile b/libau/Makefile
+index 81520ac..c25eef2 100644
+--- a/libau/Makefile
++++ b/libau/Makefile
+@@ -25,6 +25,7 @@ LibSoHdr = libau.h rdu.h
+ LibSoExport = $(addsuffix .exp, $(basename ${LibSoObj}))
+ LibSoExportErr = $(addsuffix .err, ${LibSoExport})
+ LibSoVerScript = verscript
++STRIP ?= strip
+ 
+ all: ${LibSo}
+ 
+@@ -77,7 +78,7 @@ ${LibSo}.${LibSoMajor}.${LibSoMinor}: ${LibSoObj}
+ 	${CC} --shared -Wl,-soname,${LibSo}.${LibSoMajor} \
+ 		-Wl,--version-script,${LibSoVerScript} \
+ 		${LDFLAGS} -o $@ $^ ${LDLIBS}
+-	strip -R EXP $@
++	${STRIP} -R EXP $@
+ #	readelf --syms --use-dynamic libau.so
+ 
+ install_ulib: File = ${LibSo}.${LibSoMajor}.${LibSoMinor}
+-- 
+2.14.1
+
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 66f560c37..2e855e313 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs4.4 \
            https://raw.githubusercontent.com/sfjro/aufs4-linux/aufs4.4/include/uapi/linux/aufs_type.h;name=aufs_type \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
+           file://0001-libau-Define-STRIP-weakly.patch \
 "
 SRC_URI[aufs_type.md5sum] = "f7b4a255dcb55fe7b0967f5f59b44f19"
 SRC_URI[aufs_type.sha256sum] = "85bc8e4c1a94a7d526c382e4b047b4256cab8c4a65fc0396291707ad9a327a18"
@@ -26,7 +27,6 @@ do_configure_prepend() {
    sed -i -e 's;install_sbin: Tgt = ${DESTDIR}/sbin;install_sbin: Tgt = ${DESTDIR}/${base_sbindir};' \
           -e 's;install_ubin: Tgt = ${DESTDIR}/usr/sbin;install_sbin: Tgt = ${DESTDIR}/${bindir};' \
 	  ${S}/Makefile
-   sed -i -e 's;strip -R;${STRIP} -R;' ${S}/libau/Makefile
 }
 
 do_configure_append () {
-- 
2.14.1


