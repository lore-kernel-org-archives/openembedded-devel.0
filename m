Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.11482.1629036406915441412
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vRhMZ/wr;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id l11so17883546plk.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tQZYTcBSB/aBVQtFIl1ASE2hMQuAmE5lXLTMkwJ4od0=;
        b=vRhMZ/wrPHgOHST7jFsHARxdSvWJP7ekOtvNtLoj0ABpjotWhiCg2Eg+sBaXFQbq8J
         nqJejW4UKnmbPNAhBlAh8GmX9/970tHzcSu+5B2AHZOGLYkn+C90+RDM47GaHg32KeBE
         80YDxMWNiJqNJrq8TVlPmGZw3rVDd4hGETK48pdGcTPAmsasaliA2RbNYMXHb62R9eVE
         GMHRoKYU6Uyx/KRcPLpQAdaJhMmkpEhFBQQfPW7LPLHnpjCGKQ8oyJlMrIHVwUTTudlG
         tgNKrCNJDp2k6IXusep/PotuVbL9WD2xUpNC1Zg9F1ftL/WEZ5gnLQhifEzboy0r3IoL
         1Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQZYTcBSB/aBVQtFIl1ASE2hMQuAmE5lXLTMkwJ4od0=;
        b=CkmHSdz96ccurFMfg011sDi8R1j7yGZhoapW8QGh2bLfj4PZJeEqEY83ay2Uh6iBSu
         c4b/6BuUHGhOSrVzTexnhlu92AjByW10iSewH+Sue536xgZ66+nqCxC3d+S3+5FnAQR4
         wfndDYMiA++kDhyEQYJciwikpAoGFo6WYnhMD8p20548heWOHlZDoc6w73XJBKY/5B1o
         qNHcVKIE1Qic/JWy3HHQKkVCLQocJkKm/EYuwvqAqI2B9GETomHEVVBb1y+VPBNWAsUl
         6Wqwsaq5WhOt5A6L91T7L8KYNts3xWcSjGew7qZ6Fwas1phXJImbOi37pIZ6uRz4OAd+
         r1yg==
X-Gm-Message-State: AOAM531PZQ7mQm22hUtMgYnIMs8dDfRpiomlWNh1zVROAR705mveS7xZ
	BfA/g9lJ+GmfswL0IeDbkhwm1z/9d4R+wA==
X-Google-Smtp-Source: ABdhPJyeIEGWL/TR/s4NHRv6e9HzdLss/JXtW2a5+sOW5MbBmXM5phSDzbdoqSUy8k862/GNVPlZSA==
X-Received: by 2002:a17:902:848c:b029:12c:daf3:94f1 with SMTP id c12-20020a170902848cb029012cdaf394f1mr9538493plo.50.1629036406373;
        Sun, 15 Aug 2021 07:06:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/18] net-snmp: fix QA Issue after LDFLAGS change
Date: Sun, 15 Aug 2021 07:06:19 -0700
Message-Id: <eee9348f79b0f70fbd57db28b5def4db85d564c6.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Battersby <tonyb@cybernetics.com>

Adding -f*-prefix-map to LDFLAGS caused the following issue:

QA Issue: netsnmp-agent.pc failed sanity test (tmpdir)

Fix by filtering out -f*-prefix-map from *.pc files.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5e042ac2079bffa3ae3d9839a50bf6a3d3f1930a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 7c3d5babd8..0150d3e38a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -131,6 +131,11 @@ do_install_append() {
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
         -i ${D}${bindir}/net-snmp-config
 
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${libdir}/pkgconfig/netsnmp*.pc
+
     # ${STAGING_DIR_HOST} is empty for native builds, and the sed command below
     # will result in errors if run for native.
     if [ "${STAGING_DIR_HOST}" ]; then
-- 
2.25.1

