Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.4299.1614550906573702859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 14:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gTJTRHgq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id lr13so24716407ejb.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8JE0MRwP0dHxNiWnNUIbFZfisnVie6jdnqfiwok5cOY=;
        b=gTJTRHgqY3GBe3tMj2tubQxHYEMdgFMmxp/NcpyND4SUjCJ78rMgsvXLyWvumHmvw2
         QyHqPqsTHaxOpF8cWDLOhUX/tbIJwFHBY1kiKTO2HJMF9LHi62hNiv/Np5uzQsruejJO
         iNdji9PpWk4Zf/T5EdqftNmr2t6ep5DgV7PXUl3PLwj6laEfS/vyaMNfXqCNgIZkTXqI
         oncK/EnRg8egInQaQ1XK5wnsjmkSp+wI5R5idblP7OhmlOE+nG3sZatRZDL/kgsXB/BI
         bUNFF7BiokTVv/5gTatAgIU8UbpKP4uR1/uq1Wqpky3s3KEqxl75kQRzyqAibB2AXTXp
         ugww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8JE0MRwP0dHxNiWnNUIbFZfisnVie6jdnqfiwok5cOY=;
        b=rxw63epYO2fy9S3i1hmAFCH6zdM0l6z3WEYDowlxVzXMUCMyoXkzuiIJF0/C5OhsNb
         RsQYEOffG5gTr2FUWIEwqnNPwdR1kFsJsKtY6KyVS9hG2ivd1fuTF2hS86LP/PmaRKV/
         tI4ydyakugMNylb8Vcy/edr6U+lLxvO8wkvK86fEheQEjQq0xmjvDYDT4aTbB3Y139y/
         WAyng35SzFv+uH41gx1KPBRdp+InyQjbBsLch8ke+CfKIoJ7qSrYPXxOUhRnROP1gR3J
         PmF4MMdO7MnPCcKmgPUDvNhMxL9mT+YN8YMNyGfqzY7LFf9NYUMU/eZpkRMJLxeYCIVs
         wytQ==
X-Gm-Message-State: AOAM530YyE0xIHe/q6qv1OfUaeD4n/CCuCRFjwVJcuvyf/NucfslT4/0
	NJpkR5lmq7aJqdzOvFyQUag3p9RD7fQ=
X-Google-Smtp-Source: ABdhPJwYs2iWylA8KJ0g+m+C2uN46yxVRoFZL09KHFfkduUCXortmXNFZFY3fUQZB+MVKuqYJ4hsEQ==
X-Received: by 2002:a17:907:1b21:: with SMTP id mp33mr13047057ejc.358.1614550904733;
        Sun, 28 Feb 2021 14:21:44 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-119-51-198.net.vodafone.it. [109.119.51.198])
        by smtp.gmail.com with ESMTPSA id y24sm10368261eds.23.2021.02.28.14.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 14:21:44 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe][PATCH] mosquitto: Upgrade 2.0.7 -> 2.0.8
Date: Sun, 28 Feb 2021 23:02:01 +0100
Message-Id: <20210228220201.569365-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.0.8 - 2021-02-25
==================

Broker:
- Fix incorrect datatypes in `struct mosquitto_evt_tick`. This changes the
  size and offset of two of the members of this struct, and changes the size
  of the struct. This is an ABI break, but is considered to be acceptable
  because plugins should never be allocating their own instance of this
  struct, and currently none of the struct members are used for anything, so a
  plugin should not be accessing them. It would also be safe to read/write
  from the existing struct parameters.
- Give compile time warning if libwebsockets compiled without external poll
  support. Closes #2060.
- Fix memory tracking not being available on FreeBSD or macOS. Closes #2096.

Client library:
- Fix mosquitto_{pub|sub}_topic_check() functions not returning MOSQ_ERR_INVAL
  on topic == NULL.

Clients:
- Fix possible loss of data in `mosquitto_pub -l` when sending multiple long
  lines. Closes #2078.

Build:
- Provide a mechanism for Docker users to run a broker that doesn't use
  authentication, without having to provide their own configuration file.
  Closes #2040.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 .../mosquitto/{mosquitto_2.0.7.bb => mosquitto_2.0.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.7.bb => mosquitto_2.0.8.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
index 06220327e..03a829fc8 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "56de4e27533ab53697245809feea95bf"
-SRC_URI[sha256sum] = "a98054f0b8161588975ef24e1d467550d3935f4c16ccee63ecb623248a28356e"
+SRC_URI[md5sum] = "542c30f32c4473b7c50dc2e4a1424cf6"
+SRC_URI[sha256sum] = "b15da8fc4edcb91d554e1259e220ea0173ef639ceaa4b465e06feb7e125b84bf"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

