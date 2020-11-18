Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.25627.1605712098114042671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDP71dff;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id v21so1389941pgi.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hv76qu2fU79NqpsMtTnTJ066+MoN9oRqUqHJARYtt80=;
        b=BDP71dffbQI35/LER7szXYYaC4cHutdf/XMLCx6oHgypsRwZqypQbC7q1XBSF0SKNc
         kgy5wdMiisea3ru6S4By2uw/LbEBKR4T89KD2kGSmeoImcNMvw/d5NM6TaN4J/CzLJsg
         6P/ieHgHOJ0cs1x+5KA/CBSLD8CClKSdsWwO7VGA3yNzZpoNu3o4uf2PHaUINWkn/gVS
         9r1g2Btzb/wO4YJLMcthjg8Y5caLoG3oowk6/2gl4vLRgD0q4c0OXVGixb0t+kbSxLkD
         dsZqUl8S/ZfCMJY+zpBH1vgicCsgJ7potro/ykylhUarJ7la/WFAW1Ua/gdH/y3OtjrL
         AmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hv76qu2fU79NqpsMtTnTJ066+MoN9oRqUqHJARYtt80=;
        b=RKnxYcRWACuCxwnEGX2WRmcTGLOEWGdVMyp3E2UvqqsIm9lDURQNMo/zhB4oLVCZm9
         wuFNeUahiFCp1ZeiV+oz2tGf2gknuyGnZfn8kyyu3awQKzoW0maF5EXds3VQ6UiWSqa7
         KRuR72lOfwQ5ukHISial8H3oVHwBYiQpdN3TEvez9nYYPjhaG8R4tqyMLXQBU8izO7SN
         oFPv4QK9NIjjNeqRag32xYx+z+UZ+aJIE7vbnAFv4TgFGhswm01yx9wIBCUH7DLsLVNA
         tnc+bPw93AyvGTOR2JbfZoI+NSrkVmvMLqnchHty+s4tUyezAXVci5HQJkrrWM6k5y+X
         iySw==
X-Gm-Message-State: AOAM532lfYtIHdZCh09hwwdFDJnj8v6KIdxsTh1czqJngP76LcanESTP
	yIKGD5oC6qaYZdpuw+ue8ZzLbbLMbko=
X-Google-Smtp-Source: ABdhPJwZd5doFAYKbw38ppVqsbZ7Vvy0ZOgfvkPF+/TI2eBNxOgZ2+YCCs7ty7/R1djw3motGIyp3w==
X-Received: by 2002:a63:1758:: with SMTP id 24mr6032049pgx.323.1605712097494;
        Wed, 18 Nov 2020 07:08:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/17] hplip: use libexecdir
Date: Wed, 18 Nov 2020 07:07:54 -0800
Message-Id: <636daeba35c5b9ec8e570225353a78c591c98756.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Diego Rondini <diego.rondini@kynetics.com>

In oe-core commit:
2ce6ef29b9bb4f16ed9d78e166d455b7a6d968bf
cups crossscripts have been fixed to report the correct serverbin folder, so
backend, filters, etc, need to go in ${libexecdir} now.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db7fc115e058e2e0e481e284768538f097cfdd90)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.19.12.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb b/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
index 883a6ffe954..457a974534e 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
@@ -39,8 +39,8 @@ EXTRA_OECONF += "\
         --enable-foomatic-drv-install \
         --disable-foomatic-ppd-install \
         --disable-foomatic-rip-hplip-install \
-        --with-cupsbackenddir=${libdir}/cups/backend \
-        --with-cupsfilterdir=${libdir}/cups/filter \
+        --with-cupsbackenddir=${libexecdir}/cups/backend \
+        --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
 
 EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
@@ -52,7 +52,7 @@ do_install_append() {
     sed -i -e "s|/usr/bin/python|/usr/bin/env python3|g" ${D}${datadir}/hplip/*.py
 }
 
-PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
+PACKAGE_BEFORE_PN += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
 
 RDEPENDS_${PN} += " \
         python3\
@@ -70,15 +70,15 @@ RDEPENDS_${PN}-filter += "perl"
 
 # need to snag the debug file or OE will fail on backend package
 FILES_${PN}-dbg += "\
-        ${libdir}/cups/backend/.debug \
+        ${libexecdir}/cups/backend/.debug \
         ${PYTHON_SITEPACKAGES_DIR}/.debug \
-        ${libdir}/cups/filter/.debug "
+        ${libexecdir}/cups/filter/.debug "
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES_${PN}-ppd = "${datadir}/ppd"
 FILES_${PN}-cups = "${datadir}/cups"
-FILES_${PN}-backend = "${libdir}/cups/backend"
-FILES_${PN}-filter = "${libdir}/cups/filter"
+FILES_${PN}-backend = "${libexecdir}/cups/backend"
+FILES_${PN}-filter = "${libexecdir}/cups/filter"
 FILES_${PN}-hal = "${datadir}/hal"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*.so"
-- 
2.17.1

