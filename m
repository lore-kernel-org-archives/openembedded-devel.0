Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F219C7EE2E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.122287.1683008399578739786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HVIQ55Z3;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b4960b015so2390553b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008399; x=1685600399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGLcpmJN2smOETfrD4rrwobmyY4c6ggXWDIM3dmBcm8=;
        b=HVIQ55Z3D5lPYKpQgsIyQ0t5nNMnbiBObjRnFfVzpwKHqLVX8qXG9ir0rgflqNs/np
         peZmDqTo+/cysYO+naMQZQjv70Ihk96AL+tbdNUuTtA2D7oFh7acgTVqHNgbQAXshSy8
         fvcXLx7XBs0ktrD4t4fu/ruS/xvPRMvloT6P0ADpKzAaJGUL1RN0PilpchIVghlLTbzH
         bvawsXkAs2NBEaX+p/9qZgpDcyVG1qL0rmWkyqSyjDDxLtIkI/bkGuKUqkDPgc1/SZV4
         2KJU2rUYvek4a1oDh70e3utwQWcz3lUW1dR0tTW1sbKFgny8Iv6JJxYFXK/2CCyll6kz
         gU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008399; x=1685600399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGLcpmJN2smOETfrD4rrwobmyY4c6ggXWDIM3dmBcm8=;
        b=FEM64Cn79vrt/qcNUYv1sVlQfJRH11lXngDrlRmS3SJHfyI3p/14t068dtUBiq4YjL
         NTnzLQhcWGwLOSOQNujZPz0znE+0rdoBnQ4291O0IlKLivPVIpH78p06PaT5MrRKaxC8
         8b9NjJ0Op/Kh6s1s+RSD/L42gKdtGssJVx0yamOgcBhI0Jx50laOW4PtFVAuH1MGjneH
         SA5Gf+YDfGm0BWuligyC1yB6niTHAkgKwuS5d1Q0es39LaQrY010WH+qqaZHJXSwImp8
         a70ClkgqObJJSXMeHv3mQ0IsoHnamqXR0ddyv6ZOi1u7pcQJCG7KroyxhC/5uNSXadv4
         jwcg==
X-Gm-Message-State: AC+VfDwLUNUgBADoVEOGN96FXfnZY6x1tpoI/+UgfYPWZ8Cog1Cw5aHV
	kztcsVwa5xIh6poxK2cwc0BN8W/dUGfzpQ==
X-Google-Smtp-Source: ACHHUZ5OMSS4c7vrvdyvDCeMPgJaVCYJQKieFBRP+OMuQoPQzyI62VJRw9EhGAK/XdFFg4jjZcc7MA==
X-Received: by 2002:a05:6a00:10c2:b0:63d:38db:60ef with SMTP id d2-20020a056a0010c200b0063d38db60efmr21069537pfu.26.1683008398490;
        Mon, 01 May 2023 23:19:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/11] p910nd: Switch to using github for SRC_URI
Date: Mon,  1 May 2023 23:19:47 -0700
Message-Id: <20230502061954.3782607-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102250

This is new location where the project is developed now.
Pass CFLAGS to compiler cmdline
Package init script

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/p910nd/p910nd_0.97.bb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
index a27edb1410..cd7f79ea60 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
@@ -2,21 +2,28 @@ DESCRIPTION = "A small network printer daemon for embedded situations that passe
 HOMEPAGE = "http://p910nd.sourceforge.net/"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3d82780e8917b360cbee7b9ec3e40734"
 
 PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+# v0.97
+SRCREV = "57ebc07ad8723ea4106090536c58c7f7160743e2"
+SRC_URI = "git://github.com/kenyapcomau/p910nd;protocol=https;branch=master \
            file://fix-var-lock.patch"
 
-SRC_URI[md5sum] = "69461a6c54dca0b13ecad5b83864b43e"
-SRC_URI[sha256sum] = "4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f"
+S = "${WORKDIR}/git"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 do_compile () {
-    ${CC} ${LDFLAGS} -o p910nd p910nd.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o p910nd p910nd.c
 }
 
 do_install () {
     install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
-    install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+    install -D -m 0644 ${S}/aux/p910nd.conf ${D}${sysconfdir}/sysconfig/p910nd.conf
+    install -D -m 0644 ${S}/aux/p910nd.init ${D}${sysconfdir}/init.d/p910nd
 }
-- 
2.40.1


