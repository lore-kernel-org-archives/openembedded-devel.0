Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.7673.1623244492248929829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 06:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMNBSNS3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso4187535wms.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xokxJmqJ7DRgiCjl1Q+/gy7CAfKIKSzFUp72AgwjVME=;
        b=IMNBSNS3/MLuUlHR8tZEFe7pbXfmvtIeJyLJTANUV32DZyRtVdYpok8fMJg5Wa1Rxt
         bKsEBNwPVMRefEwuM/N2U7objeLloE7pnHFQU3RiyBxQQOLLBc/1U1+CvfdHnKzv8KVO
         uLBsgT9sMyZfk7PJeN0FQpBCtAs3iG3/iQOvqHzRR3PXZ0ZUAIzDBWeoYhVJxllr5PPG
         CQG7rzNesCShUa0+AatqHYxlX66JN0KutpwW4wYcjnP2hlAd3znQxeXqlhy9zMDVowYI
         nyLtCUpawCZ3aMlNuy+8086RohvPb7t5nug9d2GKOUGTExbdZxZHNvl++XMXAUS0Myq4
         5BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xokxJmqJ7DRgiCjl1Q+/gy7CAfKIKSzFUp72AgwjVME=;
        b=p+BriFbgFr83WtbfQZMwNNODtKBUTrqDeB9WUYkt9FU35kp4K+ffDTYnb4zB/HswFH
         rVK/RKLp1t7Iy+mPIoGNK1zcttOpAKa84TVJmXG2eTSmyeLrJVgXIBzQbzdLxIA+I5D3
         hyt9tCivUuxcqcFbCzfiqnBI2M4vZgYve0kQPytS1Nmc06Cs3Qq+EQQJO/T6OXraRxGG
         qJEX/56RITWI1uicTmAZBn/aGnGRqez9lMcBpBmM/nUJ5y+l9D8siY/vdrQlpWFi7STu
         PQPPzoQ5P4lzOchWDKmfauImhjlpTbtkPhTU191n/PXF0eeUZScn+t+HjXIg+5xdED8A
         OU7g==
X-Gm-Message-State: AOAM532xzY1N+fbDNkIdRFam8Z1VBPkwGP8qR4ufMpzvwYSk/6pPNCQW
	qS8ll+BGwDYTOWL5H9Q9ZAasLDBxWBbm23il
X-Google-Smtp-Source: ABdhPJyJoBTF9jMqmASkgP1w+m0LReFjOpaUJoB1NCCDY3dZmtWX8IbxA3iLPyhwUWDR2H3JOcB+Ng==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr27308886wmj.109.1623244490091;
        Wed, 09 Jun 2021 06:14:50 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id 30sm25327720wrl.37.2021.06.09.06.14.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:14:49 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] dbus-broker: remove deprecated linux-4-17 option
Date: Wed,  9 Jun 2021 14:14:45 +0100
Message-Id: <20210609131446.783106-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Removed in v29

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_29.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_29.bb b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
index 49ba16911..c59809f53 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_29.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
@@ -29,5 +29,4 @@ FILES_${PN} += "${nonarch_libdir}/systemd/catalog"
 
 EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
 EXTRA_OEMESON += " -Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += " -Dlinux-4-17=true"
 
-- 
2.29.2

