Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.12353.1601129600673446651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 07:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CFJSmNSN;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id x5so728520plo.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Wc78BdKgp/iG/WDRkiRkhf/ovGPTIgEuf3JtrNmYus=;
        b=CFJSmNSNwMU8tTFdIVuJYBAefeBiWsiTaV7kgYsq+di0tL5+CmTRtHYMp1FRtw4Wks
         k9sUEjbV4oUhOT494hSWBSDZ72o/LIX8BSL7W7ZKeojBMBy3KZQEiVmj05ukRy6OJvHP
         lsN6wSN7xKpQ6h5M9G45gRpfLxr6bhfg1RA6XCfN4R5pEKwYSMApNCw51xP++z+xlC/o
         7qCiZaDp82xVmv/lURIvZZvNpuC69+d9uyTymp10HqwGYF94zik/hAv1l61WoGDTfjQA
         0tTH2XdSg9yLZUQnVdrg8MEhxJdDdSIRRXX4Jf52XD3jM5HSNjwCsumJseiOaGcmN2x3
         /Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Wc78BdKgp/iG/WDRkiRkhf/ovGPTIgEuf3JtrNmYus=;
        b=RKnlGOiQ0O0LXFvKe6kTHG0kjdlWQnLO1C+mr3xRhNu4PK4gDwUAyF9lA2l/M4FJO0
         ikpds0GzMZFKEwJN9W42nAVM4EkYzYYbwySEKlWYsjxFT1JmjBheUpM27KcXe3h/9gmY
         EetrDP77kern7JexIiUIirIRN1eX3pjQLDFxkMYJXQj4/+s/azPUte2bl+xP0ZlDPlBB
         mxqVFj0IZLDDYwntyTTAPnqaH1zrSldAPjQIx5qL0LZaSImhqHQLwkljSnvXrQN4FGcp
         ufHWokfZCBKNf2Xc2B8H3Lw4ebZgnRWBqB1WS/rkCyjTuXatEKmeM3bVTuYzRuUzejds
         79jA==
X-Gm-Message-State: AOAM5326ylXqFP4XGI3Us3HxRDPKspy5p5DYX1ubEiPWavNalPzOtsNy
	4AQIc39YHpwMpPg1VLmoOrFi2IixGQGaVg==
X-Google-Smtp-Source: ABdhPJybuz3Mxjwl2qjUyhaDWBeWihs4zl6V3/aY1ZRenFS7l3AcxeFmfobLvw13yWGn+HkUZskFcA==
X-Received: by 2002:a17:90a:e545:: with SMTP id ei5mr2058057pjb.45.1601129599988;
        Sat, 26 Sep 2020 07:13:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id il14sm1956919pjb.54.2020.09.26.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 07:13:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Winfried Dobbe <winfried.dobbe@dynniq.com>,
	Winfried Dobbe <winfried.dobbe@xmsnet.nl>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] firewalld: Add missing rdep on nftables-python
Date: Sat, 26 Sep 2020 07:13:17 -0700
Message-Id: <20200926141317.2547666-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Winfried Dobbe <winfried.dobbe@dynniq.com>

Fixes Issue #280

Signed-off-by: Winfried Dobbe <winfried.dobbe@xmsnet.nl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/firewalld/firewalld_0.9.0.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
index 7e03b7fde0..a76877652c 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
@@ -87,4 +87,5 @@ RDEPENDS_${PN} = "\
     python3-slip-dbus \
     python3-decorator \
     python3-pygobject \
+    nftables-python \
 "
-- 
2.28.0

