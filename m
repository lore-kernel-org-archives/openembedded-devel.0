Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.21196.1610905611711064036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kj/hp9BE;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c12so8810341pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PCPCVgwCVZ9hlEqVb+t/dyS6efs2DzTNpmIpUhmuEIs=;
        b=kj/hp9BE4/ieBpjtstS30Jj4ntk1YmtjwEBM1X7EVhj/wV1wlegnB/QrOgnoJJPp8c
         KZPFgJT6Fcb3RfG6irw00VgzfnQmkJ9w1qBLHlOa290LUaFwldIFhlzb4Kd74O6ACitm
         8bob3i1AS2nj5q0P+EyloKv8BJtlMheJ6AeYcDRzuVkKd9f34calQAIy5S5N5GGaCuzP
         z15oFtKs4hCOiFAy4ZRhBKokXKcrep9+zYqV+i9wTypovTpiYVsyBGu5frhple0wGbM5
         aGCskhqHmMC2QTjdqPmUGU/5XmhT03BqdGF93MH3lr4uwuWTuc0Lo8dmfV9pZ8AquAXF
         +4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PCPCVgwCVZ9hlEqVb+t/dyS6efs2DzTNpmIpUhmuEIs=;
        b=mHJQQ49tEZRXy/pUSKDgRgCmUFqFcEElNGi4txU3SOt9H4OmOwQHPbWcKEiW8Z35HU
         2+jTUN2UNNjDvSiTe2JtKWD/gXVn2MlveHLf4y622t/Vpg7bC2gB2SYRGxGqG2KwQRFM
         N4cQ1FCWV6W3mg44r6biw7Hcp7YEMqZ9J+ybuzm/hf7rXEAiHM2H6MxdYKMd5iPEV72j
         dJ+Rf+eASbCwNp+8tX0WfKUeyWA57H+8wc1edjASSt64OfP2BOu/DUNo9E4otfWdtPBM
         fh/2HFOetuiP5eGOHigtyrIq1QfouAzwf/A22WA0NV8YH63GuWHciBzy0X5hqKVbIR6G
         jn+A==
X-Gm-Message-State: AOAM532KzEhhtd+j9Zm4u8xU/tzHfiifjl4jKA+57Hj0Jzb5P7DIkp3b
	TcnZzoNoaXxLjgPD88B105XQ+JWFDV861w==
X-Google-Smtp-Source: ABdhPJzhhXOSPOzIK30sYXtieEdvcsJkDo7s5s4320J6R/BgchtRZzXVLfIiqgEjCUbXl2WXZM6dsA==
X-Received: by 2002:a62:1558:0:b029:1b7:fbf9:25f0 with SMTP id 85-20020a6215580000b02901b7fbf925f0mr178053pfv.79.1610905611125;
        Sun, 17 Jan 2021 09:46:51 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 19/28] wireshark: Several securtiy fixes
Date: Sun, 17 Jan 2021 09:46:17 -0800
Message-Id: <8f632dfbf9b8e6f51a4e83f84669003deb453cea.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Source: Wireshark.org
MR: 106181, 106696, 107655, 107673, 107682
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 57df6ac3b11aabd96e6aec728501ce7988bc176a
Description:

Bugfix only update including these cves:
3.2.8
CVE-2020-26575
CVE-2020-28030

3.2.9
CVE-2020-26418
CVE-2020-26421
CVE-2020-26420

Signed-off-by: Armin Kuster <akuster@mvista.com>
(cherry picked from commit a10ea62a1c9c7b0c4810f2e4ef0dcc6f75b0ca6b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
index 65f925ce1f..d284824149 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da"
+SRC_URI[sha256sum] = "1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c"
 
 PE = "1"
 
-- 
2.17.1

