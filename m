Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.4062.1619735998174147454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K6kyJcyE;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id t21so4469136plo.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1A+rMMvPTVeiP+qpwirLLlcybUnyhtmh67UBnMsjdc=;
        b=K6kyJcyE9zR5jNCEOT9A+M2ujlKa+qKsy/hpE9esMh2W8z0/j5d43WOvZJbfe1ORdY
         RK9MEJAjlPFVvJRHSxvid/Iktx/jLGycdqhA53ljSJQ5lfgSEltCoydTzvg9xfCzEW9G
         srb19rHjnPh+1JEckNyg85aNBsUrIllMpfWF9hNbBXKej+VEN9115YwUI/7An46Qk/DU
         MGT/fyDy+jsNwDyoeNPp7pwfI6lUGZbNQ8sdSRnMgsKtU4fEqIv1BSAg6q2ahec7feox
         iFguyvMHMAcKzZ+RtmnsW9xbzyO3lDp2v2Zy6nc0Z4yeeohrWpLazhw1jO7CHOPB7pmT
         bhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1A+rMMvPTVeiP+qpwirLLlcybUnyhtmh67UBnMsjdc=;
        b=EXPlIKloISvXom8jCkaXULZJiGdIUGCa42Auzc9HJpK/cTlgBwHQ58OcIsfyhWwWYe
         eFVz9NvigY8PYD/lamX81OT1Ie5ZC6wibW+vvgn663R9dMm+SqQ0W4RFyGmaCIIhjkPf
         Es5ExBlCjOVK58LUnfyDuUUuneLow/rAoxm4tK+oAOaOrVPzQpLtrZqRnnMkMx/z2UFO
         EvFzUhLeIQ0YbRqLpnJFpZBgZofao/p5Md/5MKvDJqzswZhzh9K0WyyZMMdaH4b5TLJQ
         PUnbLKvAgwRie65qo6q1N3GBocCucpE+YNraTv5oWaUhzA+hDM6d+K5NSuGjavxqm2Jo
         HbiA==
X-Gm-Message-State: AOAM533PTofPwTENRjNEvnbjkyjXAp60cRap8LUqvW4YS1wrCnA2UKQO
	OiZXRH8wZgvqyhLHq8ZSgKHEkcB/i7znPQ==
X-Google-Smtp-Source: ABdhPJw90FnOI35N6207hzls0ZsTyF4ThJdNvLL+lmE3ChiriamgJt71p2YUnJ0LPVcTakXHjjsxrw==
X-Received: by 2002:a17:902:b408:b029:ec:e879:bbd8 with SMTP id x8-20020a170902b408b02900ece879bbd8mr2044091plr.65.1619735997376;
        Thu, 29 Apr 2021 15:39:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id u18sm30081pfm.4.2021.04.29.15.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:39:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] snort,proftpd,net-snmp: Deal with -ffile-prefix-map as well
Date: Thu, 29 Apr 2021 15:39:54 -0700
Message-Id: <20210429223955.1878527-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this is another option for reproducibility which can be used by
compilers, and here consider processing it as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb | 2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb     | 1 +
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb   | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
index 9c20be537c..b5ff430993 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
@@ -74,7 +74,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/default/volatiles
     install -m 0644 ${WORKDIR}/volatiles.99_snort ${D}${sysconfdir}/default/volatiles/99_snort
 
-    sed -i -e 's|-fdebug-prefix-map[^ ]*||g; s|-fmacro-prefix-map[^ ]*||g; s|${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
+    sed -i -e 's|-ffile-prefix-map[^ ]*||g; s|-fdebug-prefix-map[^ ]*||g; s|-fmacro-prefix-map[^ ]*||g; s|${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
 
 pkg_postinst_${PN}() {
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index 1e4697a633..483c22a0d4 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -109,6 +109,7 @@ do_install () {
 
     sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
         -e 's|${STAGING_DIR_NATIVE}||g' \
+        -e 's|-ffile-prefix-map=[^ ]*||g' \
         -e 's|-fdebug-prefix-map=[^ ]*||g' \
         -e 's|-fmacro-prefix-map=[^ ]*||g' \
         -i ${D}/${bindir}/prxs
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index d9040c1647..de0aeeec7c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -120,6 +120,7 @@ do_install_append() {
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
+        -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*--sysroot=[^ "]*@@g' \
@@ -172,6 +173,7 @@ net_snmp_sysroot_preprocess () {
             -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
             -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
             -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=${S}@g" \
+            -e "s@-ffile-prefix-map=${SNMP_DBGDIR}@-ffile-prefix-map=${WORKDIR}=${SNMP_DBGDIR}@g" \
             -e "s@-fdebug-prefix-map=${SNMP_DBGDIR}@-fdebug-prefix-map=${WORKDIR}=${SNMP_DBGDIR}@g" \
             -e "s@-fdebug-prefix-map= -fdebug-prefix-map=@-fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                   -fdebug-prefix-map=${STAGING_DIR_HOST}=@g" \
-- 
2.31.1

