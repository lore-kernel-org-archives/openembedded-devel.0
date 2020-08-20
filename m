Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.106719.1597913650070310442
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 01:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ae7Po7GQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id mw10so691275pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 01:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xwCM57fK8ECfSkS6t100wfMfc1lwuqHF83Wbghpxj0Q=;
        b=ae7Po7GQrKyHilvH2sIk3QRyJB5bBv0rQOV9wDMs86u3EXFTR8kC1CwI6EZ5+Fm6KI
         NKA0uaniK+tgiHeYMiHDjQ9YYaNBqjSEHd+6O+dReD8cTzzuQ8IYVjHJa924jSF8XH1i
         PQbUwV9qMRuySaYGkQ2xN12Uyaas2S+gjIeWuWkK6/Hvz/b7htgbZL2Mpo09Gj42phIA
         G+wC6I+mx8HoCFfZX83swTz2t0OENzIg+LjiGTtZIgNyf5gtsfCkCFmXHxuH6lq/HJtu
         hVKCfuimYO2CS4yNnHuSzGkKznK3x7AxdZ1ykYhS7w1BHsjov+D9VcnLdU+gGD4o6EHl
         1gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xwCM57fK8ECfSkS6t100wfMfc1lwuqHF83Wbghpxj0Q=;
        b=iLF01js4JB00GrpuY1gq6mhcoHUZLSzYps5Ryp+2RTRgUynRkZwUZihtJlm/Ct3CZY
         shQMwZsqj+5GgrAw++2lsQspb7inyR6b05wqCxg++/XH8fyNZFFVJEZYTXPDP0nLYOSc
         8pofJu1lKlRpLwUgF7iqPmxdoPrdEgiFWCR1OV+LTLCRqo2xQR5QO5YTHXMnxUZRmRTN
         eF54KiuWW3NHSMAYNMJlCbiCY6FtHoxs8fY0G6oWOciDzNBPtTYSikY4iReJvhComt+P
         jCNxFNZU+kgsuyFk9DoYjcPeURI/mj2yVS6P4tO4XqTNRBtUJq9FmeR1A4ZK44CAm3Fn
         r8xQ==
X-Gm-Message-State: AOAM532wKuoyKP8sWB1MRZZ3uv9coA6RaoxQi4Ed9EsaIakQyfhZQTJ5
	Vzy6EhvdNZsNMH/moYJmIInZXJuQY0ieFA==
X-Google-Smtp-Source: ABdhPJzKtusb1PFOuvnvERSo3netlog+fzGo+Lsw2d2knTbw+kIxcJHABcGPavyx+eZxpxBgQAZbMQ==
X-Received: by 2002:a17:902:6b81:: with SMTP id p1mr1794653plk.183.1597913649064;
        Thu, 20 Aug 2020 01:54:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id q10sm1937780pfs.75.2020.08.20.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 01:54:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] valijson: Move it to networking-layer under BBFILES_DYNAMIC
Date: Thu, 20 Aug 2020 01:54:06 -0700
Message-Id: <20200820085406.2785032-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it has a hard dependency on curlpp package which comes from
meta-networking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/conf/layer.conf                                          | 1 +
 .../networking-layer}/recipes-devtools/valijson/valijson_0.3.bb  | 0
 2 files changed, 1 insertion(+)
 rename meta-oe/{ => dynamic-layers/networking-layer}/recipes-devtools/valijson/valijson_0.3.bb (100%)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5bf1f6cfd9..5178678da2 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -27,6 +27,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 # to ensure yocto compatibility check pass
 BBFILES_DYNAMIC += " \
 meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
 perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 "
 
diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/valijson/valijson_0.3.bb
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
-- 
2.28.0

