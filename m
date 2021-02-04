Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.555.1612481321474962691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 15:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDAfmrTh;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id 8so2577089plc.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 15:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3IVy3ngFSSRal6TpX6leKtf5Qzvp3eJZqHuECGBnMWY=;
        b=BDAfmrThPUx3Id1DNa30KGFTEFh4yJ925xsjzMQeifuVzsxvjOI7a+ghUU+okHHy3L
         VKdtyMD6YZ06Psg57hBo9XqUugGXswdQDmKv4xuoSArvxUNeg4zBU53dhffn+0RkWIcX
         xQWodQUzDoNl902YNk8vLf+S1D7mlwB/veNDcv8Ab/ZsG3E8L1Sq5SyM1LtUHAU0uPqW
         VwTHXYcHgYta6Pj8nhrF6YhmECy2Rdd2k5YjbzJKvx25zYjOCCVDUIWFOV43DrcalQcZ
         kiZ0wR8WvDjT9QjwrR0VD10YKymLoQh2MSXZlHZxnmBgt+jLAw56d3iuBGcPsM+eBEdn
         qsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3IVy3ngFSSRal6TpX6leKtf5Qzvp3eJZqHuECGBnMWY=;
        b=KIBFGtQLCJr91xCgHlzpca9lF+nLUs2RUg6cTO0nHct2IdCNpR6LOh7MlrSox1SjMg
         YAs9o2Lc5v5dtRxLZhvErKtT0a59eduld9hjP8oH7lMEDey18cVgCoj3T87sFQihm7PA
         5DyFtJTHNLxf52WvvFJhs8+O839GsYG4ePZAXIhKUJiP8bA4fcBYPmbWYQ65x9Nkka7b
         5g/s8KxR8a/WL3221h0AsHpV6rKw8GnEj/BxtyisZc/q/j2IKf21m+y0YSXGM6IVTlT8
         3mT2FG7fJPVlH3/zVgx7OHbXKn6QIVetfwzpLJEeeF+ABAzKl++UzwOHveJSSV/4P2vZ
         YKYg==
X-Gm-Message-State: AOAM532ztnFihmkMR1N58HehcxNSviXIJC5QlnqG+RYsj9Q0MTBAS8Lc
	sURqxlbdf+2TDj/ua9v1BIFQpqK5l9aqHg==
X-Google-Smtp-Source: ABdhPJz+gBNxXmqHuSwLz1Xh/UnzhixbzM+uKASqTk6PjOWWSTJ8ncGZCLeL/fYV/ew5PjGgd4e8zA==
X-Received: by 2002:a17:90b:50d:: with SMTP id r13mr1364723pjz.159.1612481320715;
        Thu, 04 Feb 2021 15:28:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id k6sm7886467pgk.36.2021.02.04.15.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 15:28:40 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] keepalived: Upgrade to 2.2.1
Date: Thu,  4 Feb 2021 15:28:36 -0800
Message-Id: <20210204232836.655046-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204232836.655046-1-raj.khem@gmail.com>
References: <20210204232836.655046-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../keepalived/{keepalived_2.1.5.bb => keepalived_2.2.1.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.1.5.bb => keepalived_2.2.1.bb} (92%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb
similarity index 92%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb
index 1230fcaee2..a778d26097 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb
@@ -11,9 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[md5sum] = "27e1cfff5b8dd95062ad415957e663e5"
-SRC_URI[sha256sum] = "d94d7ccbc5c95ab39c95a0e5ae89a25a224f39b6811f2930d3a1885a69732259"
-
+SRC_URI[sha256sum] = "91186f20c83ffc48d7a15a9a6e2329ed4feeb2dcb51f4aa9672c8840190ea741"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"
-- 
2.30.0

