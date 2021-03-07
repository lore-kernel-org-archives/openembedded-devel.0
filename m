Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.28474.1615156503460319249
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDNCM2DT;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id mm21so16421998ejb.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AP/nrnaPrprT/jYOcTsQD7d1idl4/x7YBHiU/yF3gqU=;
        b=LDNCM2DTjQHUpORKqq8VrY9wlCB8/ZjyjIjItvAiixCfzkipNdF+7+fkuexaBB6eP+
         m9tTyaxaoiN3iMCYpSyDxOHWmExZhvtafq0x2WmVHwqJeUQeYx7TP5rA2zKXV93a0HIw
         UyTfcn1x2JgkHSVDWoiv7+A+PfMQJ9V+zXI5E+aKyIRo74wFOYgIs8KMprp2cfD0MhIv
         JfJ719O5MwF6huihrTHWWRFsk8rls759WkM8SjNVBO4CvJCUjBrZ+8mdTq3ciTWCUrs0
         MWVI+CseS1XuIeFW9lFwn8wlHkkXs9T39z9MIoNxkYe1z/YHIfDYAQ37CrREN2vv0BGK
         TO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AP/nrnaPrprT/jYOcTsQD7d1idl4/x7YBHiU/yF3gqU=;
        b=mzZ9fTBZKdOagdQcVCeJzmuZB7KAWvIAAjXYaP972FKp5zZllzp9FKD5OGcm3LFYMN
         Jr6YDPFiuneWVsJPcp4CQWEuaINCUtuSLa/tUH9BP8VIcINbUq1l8EPZOUt/CMMs51/4
         1JhX/Qr7Jija8KcnlSYTNa6SgnrlcNI1X3XvlCOjJJQ3DzwrzGoacqsGDGGt0vrlQ31z
         Ie7OvAiB1lruGusFqWMPBO2e8P50l/BI9GiMg1i7wptI202hLRQaqjzMAdLZgAD4B5YC
         j8mGmnCg6jeZ0ziL4QVa/xXt5YcT8aqFMo565+2t+4V/RxTVRBWCY4Y+Zt/70SLYCmB0
         bgSA==
X-Gm-Message-State: AOAM5323crYHO8wqtuy//CcQR82KioNDK9kK0uheKEsRhMM3V639RWOe
	/Z0v5oq7+3Gvacn22NYrhIPT8xdxH3c=
X-Google-Smtp-Source: ABdhPJzaHX391N4Gd+F+EkG77d5JVVOOmRNIdWqhlgRfr/3HCXinbpLKAbCmQSaAGkOI1YEpVPo6VQ==
X-Received: by 2002:a17:906:543:: with SMTP id k3mr12206706eja.139.1615156501855;
        Sun, 07 Mar 2021 14:35:01 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:01 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/9] xfce4-cpugraph-plugin: upgrade 1.2.1 -> 1.2.3
Date: Sun,  7 Mar 2021 23:34:43 +0100
Message-Id: <20210307223448.1063315-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.3
=======================
- Add support for per-core history graphs
- Enable user-defined spacing between per-core history graphs
- Use an exponential function when painting the grid in non-linear mode
- Improve performance of current CPU usage bars
- Improve LED rendering performance
- Improve grid rendering performance
- Enumerate CPU cores from 0 (instead of 1) to match Linux command-line
  tools
- Ensure that the bars and the history cannot be disabled at the same
  time
- Slightly better handling of colors
- Translation Updates

Release notes for 1.2.2
=======================
- Record CPU load data even if the chart is currently disabled
- Validate size against minimum and maximum allowed values
- Change semantics of the non-linear time-scale mode
- Fix corner cases when rendering the grid and LED modes
- Show SMT stats tooltip only when needed
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-cpugraph-plugin_1.2.1.bb => xfce4-cpugraph-plugin_1.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.1.bb => xfce4-cpugraph-plugin_1.2.3.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.3.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.3.bb
index ebcdc2166..0895e7209 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "615adf9abd91417a44319d8e4dadc6012fa22a3778f2f379717512dcb7ef924a"
+SRC_URI[sha256sum] = "fb0cccd9a678136256edd0f04f945e611ab0aa912837f57413ef3bb0f515608c"
-- 
2.26.2

