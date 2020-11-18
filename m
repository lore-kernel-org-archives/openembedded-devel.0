Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.25472.1605712091058524900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZPDlcFtl;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id w14so1591372pfd.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=I5Vg1DRJUQcLDXiF0tCczQxFetUCGZ7PEw9xbpe5J2w=;
        b=ZPDlcFtlJL8/REQe3X/I+XaZB63lJQPUVJyXAopbGMiZ8ImsS9HtqJMlqGF1qccRzW
         u7vaN6zzKf2C2MjRSwcIzpDEY0BfIZ0eUJodMwsZXnK6UQ2wYiYFWpv8lOm/zhPnLi/m
         8pdOcnNLptyqzZW8Fs1M7sC7H68PfEW/e5n67XfudIohgvPjaD3Riqt3wNuHiEyD+gGa
         keZf7QWw+kZ2Bkn2jggqevJMtnviolHCv86QhBpOLRk872fZEx/kfX1rdQ+m3mJuJF8O
         hj6NZyHSAAnSLxuoh6oplWvsACVq626f/3NZdkIH9DoiyiupnGU+OUuQWADLT0ErKRB6
         DRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=I5Vg1DRJUQcLDXiF0tCczQxFetUCGZ7PEw9xbpe5J2w=;
        b=tHJiUEw8TaZBrXi/pfEghPBM41In9FXitkSTJUXNpPlI/dr5IKPXHfTS+RKhIpFLBh
         QgCucolXe04o+5SD4n0/oUmE8zDEi5vDbwIJUfMCLujDBLhMvZA/zo2H0R2U580hL2zy
         miBqNjrqtBfDdaGyD8JFkKUVpaoL95u2SYgxIJalw0yPUvrQIitL7/fB6s+jJUS77f/6
         RQfLiHZdFCEQKHN8q4L1bliyKs8aurNvs/L51qbO4aU2081eE1K7UUcqBscEIMCTsSRA
         C7bqmYtxWz9UdpMuerbdw7P6bNJ795HtJGSbbpG0gLtJHytv9cnjoX39rTZCadsYD0Y4
         RbGA==
X-Gm-Message-State: AOAM533oH2t0a2BddbvvJt/uQhrZempHHMkT8Uba9b09tg6ovhNO4WPS
	Tn2spN4ug9X+R+hYYa9NiZbdPL7gU5c=
X-Google-Smtp-Source: ABdhPJyserq2NIzZYe3gXXsEHUXFoBjcRmL/8Sk48qb1HeaCMoQekhuN4Y665K3/jngQiKFZzLWcrw==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr8916188pgl.322.1605712090451;
        Wed, 18 Nov 2020 07:08:10 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/17] wireshark: upgrade 3.2.6 -> 3.2.7
Date: Wed, 18 Nov 2020 07:07:47 -0800
Message-Id: <a5be386125d36c92ccd4fe6568d8f6a2928fad1c.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 47821db8ed0dc81e84d5ba6b873dc14d50f85e07)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.6.bb => wireshark_3.2.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.6.bb => wireshark_3.2.7.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
index 916c5b7a4b6..65f925ce1f3 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2"
+SRC_URI[sha256sum] = "be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da"
 
 PE = "1"
 
-- 
2.17.1

