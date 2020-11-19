Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.11310.1605801508727821620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 07:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OrLeNESi;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id b3so3159443pls.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2020 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xM+UwRlKG9IyJY75DGbOZu63FYyNqy/+jI5IGzCBwu8=;
        b=OrLeNESiDZUOFKXPFp/6+vLYXWcFDo16z6lS7SPo04zZWj//wSBYpg7pAN/4L0Xe+D
         ZiPITjTrZSahvbRmlssUgV33BrquUMGZR6TO4UzfEnyyUqhCxaME8lskYiJ2/T/bYy0e
         2aICiBeS+wLI9OXHdvvCzT51h/Ni+QnnKvMc+MK7mmwVVAPJLDwlu3juIzERTs/D6Cxu
         5bO8YL+3TEV/Qg7C8LFY0ye9c9ciMajVRj/P+JAXR52f1fBZDmuCJB5+vBQ8GgJgGrch
         RmhSSTEofP8oXiHK7uQMbfh/AxGMMhhXfxI9WvT0gXw3rA3Fd+U0i0F1Ob+xaRCZCNWl
         9P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xM+UwRlKG9IyJY75DGbOZu63FYyNqy/+jI5IGzCBwu8=;
        b=tdlb0wty3WLMtHAXcwxBEusucwk2sJ5c8yylk/X7baQqKf5T/kwMvDttTGyeCylZbf
         kCN4VTWDWdXNLh1Yd/ECgNVktXUL0aZcINoE2DtQlnaBKKRJnA8XjAWoDytgQJVD8094
         eLicLIb/lbqk+cev4GgSRkeRyosE3Whchu8cKjpq3BM+SVX3qHZ5ht5q8DuhAZEBai4Z
         CJpX0i/FoBtqpU5C6kTbkc2R0pcCLlLduV85KKoG5oyq94B+GBDCMeV89UU5FAseXjA4
         3nJPcj6U6ZEyTvurFEpuTE3uqKONa9C2PIdemlNftPmFkOFzIJ7fG314aoZvHUcxl50L
         K/+Q==
X-Gm-Message-State: AOAM533NcttItnticZ8990FEyRdfvZyAY5c1kMcp6E8fAA54xbze9B4j
	NnHJW9ih1kDD0/FFLSUE3EqXrhyHvdiKYg==
X-Google-Smtp-Source: ABdhPJyizUIdXXJIqdHjp8UBEpT80qpXs0YYFTxWEXNXRZH+S4YsvxdTZ60ryqvMdFjEsFWXX9Q7gA==
X-Received: by 2002:a17:902:7606:b029:d4:c797:a186 with SMTP id k6-20020a1709027606b02900d4c797a186mr9089413pll.38.1605801507678;
        Thu, 19 Nov 2020 07:58:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id l9sm21138pjy.10.2020.11.19.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 07:58:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] thingsboard-gateway: Move under dynamic layers
Date: Thu, 19 Nov 2020 07:58:23 -0800
Message-Id: <20201119155823.2741395-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depends on meta-python therefore move it here so it does not impact non
meta-python users

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../thingsboard-gateway/thingsboard-gateway/bacnet.json           | 0
 .../thingsboard-gateway/thingsboard-gateway/ble.json              | 0
 .../thingsboard-gateway/thingsboard-gateway/can.json              | 0
 .../thingsboard-gateway/thingsboard-gateway/custom_serial.json    | 0
 .../thingsboard-gateway/thingsboard-gateway/logs.conf             | 0
 .../thingsboard-gateway/thingsboard-gateway/modbus.json           | 0
 .../thingsboard-gateway/thingsboard-gateway/modbus_serial.json    | 0
 .../thingsboard-gateway/thingsboard-gateway/mqtt.json             | 0
 .../thingsboard-gateway/thingsboard-gateway/odbc.json             | 0
 .../thingsboard-gateway/thingsboard-gateway/opcua.json            | 0
 .../thingsboard-gateway/thingsboard-gateway/request.json          | 0
 .../thingsboard-gateway/thingsboard-gateway/rest.json             | 0
 .../thingsboard-gateway/thingsboard-gateway/snmp.json             | 0
 .../thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml       | 0
 .../thingsboard-gateway/thingsboard-gateway.service               | 0
 .../thingsboard-gateway/thingsboard-gateway_2.5.2.bb              | 0
 16 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb (100%)

diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/custom_serial.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.conf
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus_serial.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/request.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.json
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_gateway.yaml
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
-- 
2.29.2

