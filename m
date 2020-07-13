Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.11752.1594608993210042096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Je1/TSVt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id t15so5510086pjq.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=daqdwcDa6y96aIG5x98RFnhMA8RkIIl+3tn7EBAAqdU=;
        b=Je1/TSVtElWQUrJZbh/jwuy+wLkAb37fLeyn3228vhCNjfTOLmyYOCq8EvGf1sfS2h
         Un4/Ab71wEF8F4OgC5hnasXwhPH7PsHHBonus/fkqAW1VFT/BwENSVaICmhuIlNzOQAW
         pJQAs2ObtGInaJPzy3+vLyKOeNBqhcemJUpVT2IAlVZTSevefs7nXNyTilGTQxxce2Or
         8CbShq+jp+xgvhs5OEiY6NpUW7tsx4rokEHCwgy8CaUBn2iA8wXW6K+btw4EaKcP614f
         M96W6us6z44omGSW+h+/ciTRTrT2mtWJXFlt6QYmLE1cPNh498i5fuPVhuSKte9UpTYt
         7XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=daqdwcDa6y96aIG5x98RFnhMA8RkIIl+3tn7EBAAqdU=;
        b=q0zH/N+Rp1niosHqOXCU2IviTYIitMeHZhU7xOPUb6dicn0UfR+tFQUNGCQ8Mf42FP
         lkGLJqFj+6B7Q7DM0FLCRvbuUMQ3sJ7F/tQk2s/abBXAIHo7Bzsjhu8C/f8NzFgJaa16
         /m6L+ur4zhdJl8PKFWEqlVuWV81EQz4v/FyP/ogh586IQ6YX44wD3i7uombeSPbwzQMV
         Oj87a8XHLV1FNqoaueJNSoP7dv9H3n0R2sJddnQeO9Jrt9m/2HJR3uPim2hbqndxq/Az
         NOsWZPMOOCYcSdDCEQ8tg/M9giY2iBLrzuqXrrLrOnltGnJuLdE3NN0t3yIePy9WwPoy
         9LRg==
X-Gm-Message-State: AOAM531ZAw6ysg8u4TDUkWyS2IL6K9uny6w6PsbjdQcsEf84BrEUmN5Z
	i2wmIyMqpBK1R0K+2kZBQ9xlOrB6d8A=
X-Google-Smtp-Source: ABdhPJzxPu8J3Pv1uFUnDclYZiQIOIuWeUId/gvqdQJsRbDD/3n9EzC9LVN1wgoOO+wsDTY2AdmlJQ==
X-Received: by 2002:a17:902:7c10:: with SMTP id x16mr8197128pll.122.1594608992598;
        Sun, 12 Jul 2020 19:56:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/18] openldap: packaging fixes
Date: Sun, 12 Jul 2020 19:56:11 -0700
Message-Id: <a6bf3854534737dfa0996db2fb144ed538007a55.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

in FILES_${PN}-slurpd:
- ${localstatedir}/volatile/run is already covered by FILES_${PN}-slapd
- ${localstatedir}/run is already covered by FILES_${PN}-slapd
in FILES_${PN}-dev:
- ${libdir}/*.a is already covered by FILES_${PN}-staticdev

remove the settings as they were without effect anyway

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 68988584921332f929f2508a3b2678cb33579290)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.50.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
index b62b13a443..3a130f970c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
@@ -172,9 +172,9 @@ FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir
 FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
-FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run ${localstatedir}/volatile/run"
+FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp"
 FILES_${PN}-bin = "${bindir}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
 FILES_${PN}-dbg += "${libexecdir}/openldap/.debug"
 
 do_install_append() {
-- 
2.17.1

