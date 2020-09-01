Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.8413.1599000108161020892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zm6xvXk4;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id i22so3915202eja.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgqbyY+16NtgWU1fq9AI2a0NrYv07SKnCPEa0Jl9gNE=;
        b=Zm6xvXk4M1dF4bsUAiOHgWc4T8HtnxmwYddI7LK/GKkZeaoIiQnISzVLCK8T+u+t/I
         cQ46ZeHYpW1t/NsraRssjIZZXELLaoHBP3hirguQSl5dn7JxhEgdqkLMdlm4WXrNNYrw
         fYqXB86PWU+XNiwexwL2uh+rQhbgzZ7VirnMZzRC8+Y4U79omsRg2RYxTQHj9lNY4CWt
         DMe4AwSORnBB6fbfXDA10LT2RS/0DGPN9IEIBROLT9llK+T7BOxAUnoUfgzIeG167EW8
         gwzrMJO5MSOdl2oZedhxeSsteFa1aKyZYoQ9B5CR7oabUgt5qBOfg5XJrtNyczigx8xX
         LEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgqbyY+16NtgWU1fq9AI2a0NrYv07SKnCPEa0Jl9gNE=;
        b=r5Iw4Qqqi0qOsjClHemWJqOqreRSKBdj6Vs1friVVFy7r5W3BqN869jYTOwpATOX1p
         7iyBoP1zxx8voc7NSCueQHC2kFn+c//AHxfHF9IFGEnxZgF48rEoJVN/j06AmfF9bMaO
         Cd21BEpGmgm/UcyHjbU7S6GtUbQi2YPNVU5M08mGezd0czzdWuuD9Y03qec1KNIYo9ok
         HvnLD7yQMI0LD/1EDcIRxFkFTHqfFFm+STq4lUK1XG3g63+iGpRiP1Ah5te99a9SBeil
         Vj83wKP/x73wDgUdTgjI6a80ro7Fb/OrYMGky3U/46wGyv2F12Mn/qxNdcAebPi8tViv
         P4WA==
X-Gm-Message-State: AOAM530/jbiDni6RAmkxkYO4eZ6ugnj87oiLu/QIxCv8pIhnCf+mC/ej
	oRnj87ShwPphjoHuwadcieA+DSj0vIY=
X-Google-Smtp-Source: ABdhPJyBAO5lBc1dkfmu4nEdifI5cXuiV6/pL0oTx7MKFBkCc5SO1TTdLdcv5jqk5iEIvXjAD7sE2g==
X-Received: by 2002:a17:906:829a:: with SMTP id h26mr3759832ejx.11.1599000106259;
        Tue, 01 Sep 2020 15:41:46 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dr21sm2683243ejc.112.2020.09.01.15.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:41:45 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nss: remove signlibs.sh
Date: Wed,  2 Sep 2020 00:41:41 +0200
Message-Id: <20200901224141.40600-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162F7E2FF7270601.30808@lists.openembedded.org>
References: <162F7E2FF7270601.30808@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Looks like my "solution" also isn't working well at least for images with read-only-rootfs in IMAGE_FEATURES.

pkg_postinst_ontarget_${PN} is always forced to run on the target, which for read-only-rootfs results in:
log.do_rootfs:
...
NOTE: If an image is being built, the postinstalls for the following packages will be postponed for first boot: nss
...
ERROR: The following packages could not be configured offline and rootfs is read-only: ['nss']

and now looking at the /usr/bin/signlibs.sh and it does pretty much
the same as the postinst script when D isn't empty.

From oe-core git history it shows that signlibs.sh was added first:
https://git.openembedded.org/openembedded-core/commit/?id=a4580f967c8064294a06d406acf5deb24aee2acc
then the offline version of postinst was added to support read-only-rootfs in:
https://git.openembedded.org/openembedded-core/commit/?id=64e87fc6e99bc1d4807034166735034b1f92bad8
and nss-native should always provide the shlibsign since:
https://git.openembedded.org/openembedded-core/commit/?id=88540c5b08dea069660d1a68e506aebdd68e6ae0
and only after
https://git.openembedded.org/openembedded-core/commit/?id=8f782f7095e718dd9452055af53363beb6bdbece
it looked like signlibs.sh was something special only for target.

So it looks to me, that we should just remove signlibs.sh script and let the same postinst be used on target and offline
(with or without D being empty).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/nss/nss/signlibs.sh | 20 --------------------
 meta-oe/recipes-support/nss/nss_3.56.bb     |  6 ------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nss/nss/signlibs.sh

diff --git a/meta-oe/recipes-support/nss/nss/signlibs.sh b/meta-oe/recipes-support/nss/nss/signlibs.sh
deleted file mode 100644
index a74e499f8c..0000000000
--- a/meta-oe/recipes-support/nss/nss/signlibs.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-# signlibs.sh
-#
-# (c)2010 Wind River Systems, Inc.
-#
-# regenerates the .chk files for the NSS libraries that require it
-# since the ones that are built have incorrect checksums that were
-# calculated on the host where they really need to be done on the
-# target
-
-CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
-SIGN_BINARY=`which shlibsign`
-for I in $CHK_FILES
-do
-       DN=`dirname $I`
-       BN=`basename $I .chk`
-       FN=$DN/$BN.so
-       $SIGN_BINARY -i $FN
-done
diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb b/meta-oe/recipes-support/nss/nss_3.56.bb
index 107b0a0152..997f8950fd 100644
--- a/meta-oe/recipes-support/nss/nss_3.56.bb
+++ b/meta-oe/recipes-support/nss/nss_3.56.bb
@@ -21,7 +21,6 @@ VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '
 
 SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
-           file://signlibs.sh \
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
            file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -214,7 +213,6 @@ do_install_append() {
         touch ${D}/${libdir}/$file
         chmod 755 ${D}/${libdir}/$file
     done
-    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
 
     install -d ${D}${libdir}/pkgconfig/
     sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
@@ -251,10 +249,6 @@ pkg_postinst_${PN} () {
     done
 }
 
-pkg_postinst_ontarget_${PN} () {
-    ${bindir}/signlibs.sh
-}
-
 PACKAGES =+ "${PN}-smime"
 FILES_${PN}-smime = "\
     ${bindir}/smime \
-- 
2.25.1

