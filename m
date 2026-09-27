Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8010CC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:53 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34503.1790506244790379981
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dS97mFHf;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88206fc44c6so586460b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506244; x=1791111044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+uQx/ihZuGhXTvcuY6tx9v4frfSSE0upgwBzi2RaJw=;
        b=dS97mFHfZ5HugXgfL83DmwTC8cwXNJazMYJKAkdpCa2sPlGFJ8lFrF3fqETK7Bip3u
         +abz5l+YnRVaezOr80NRxgEZ48rYcYzlM93R8kZcRZIPk9nwBOKP3RZbqFtHb+5Bxscm
         Bdza3fKUB8GKI2/FE4tb/ARyUOFVkiiJ7t0TPoERniZI3s3Be7BIZ7sOCVzbCDsprOSO
         wqHPLaUbrQqifdSHTCXKF53adjJ0OpcKYh8+rY8ymucvBOWzVifRXQzn5jWVy2HnLAiK
         TpJcJn4Zz5ReuQq9t5maCk87ToY3pA/qltjVJ4MX2wLDsq7et2ph8joDiRYy/aExGqhF
         6Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506244; x=1791111044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+uQx/ihZuGhXTvcuY6tx9v4frfSSE0upgwBzi2RaJw=;
        b=2VrFGdQIqhOMkHzqK42xRYO4z871MLrZtlIhXC+d4sC3sOM/3lNT4jAQ350aOLqO6b
         32lENgj6LwLE1kGBf30Bc3jyKvxUBNduXo02E3tZkAcxXBWtHWEfUiV3lmz2uCT5+3uD
         3GPKhEx30qOozDSBCDAD7LzMNXn228G92vGVuTHYWcGct77l2EfOzN1S3bNWEIg6phJQ
         9Thu4LbOiVyJ0pajA+/sNSjZxa2eFbIA45estJUiV141njGGrb1IwPY1COgvRxfyvYAs
         fEDCDRJgMdZTVKjQSHXt/JvlGX5KFTkzT9QispRdj699JcvRWYXNTuaSdmM0/7zhsPO2
         vxNQ==
X-Gm-Message-State: AFq9FYJPRJaQmdFRvkfHICsm68LLndWJtWL6jrj4SJiyxxSOxnC1Mv0n
	gtHXUaLNlMf+eTXUFx+QUhOEbcnxLdTJ1I8NaVFjJ0nJ3yy5K/9ep9xUkPOo2A==
X-Gm-Gg: AYBFou3vvSDENDdUX59uLJEjF2F3uLiqXZCcUsH0KfyPk39Rm/Hr7q8uFmS/rZJtEy8
	oNcOKXtiBlzYDIdhJfmkzWkolzvttnvUNLYXxWbTEhRUBNRQjAWQkpK+cXynn6dEI3B89KLvjV8
	PMaKWaCnltyMhT9aPtbmO5deo6XGND5Hjv034THJJ52UwxfMwAn/xifb66sp3y+/JBjpyCf5VGK
	7kNZJmuKPuaEmta0AC9y1E54puKOQbDJuzA1Y8JH+VRiQWeAmfQTxWC0xlwWblPUIknO+ST0BCP
	tU8rqG3TAByvoomo8ZXjFSsyup+OHRNwzY8sS2CMGI9m/PkB6ZOs7i53yrJvXZYX+D1b/JRsBIW
	MQwar6cg0dPF8SGmFJEH+SVYR+cjqRhGddSleEg8JT6lqY9QZ16CitgLSUPVthcCcQTolfNg6b0
	RRi6EoaQVvQYWzIRi8B2EEJVAg1FpIbzu+kQORRme1Ra4efdXf0pRLWBcO9RqCvD7iJVsQaRA60
	sPXq0P32TXhbioRoDqoaXA=
X-Received: by 2002:a05:6a00:e09:b0:882:7839:5257 with SMTP id d2e1a72fcca58-88278395950mr1288441b3a.56.1790506244094;
        Sun, 27 Sep 2026 03:50:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 13/35] open62541: upgrade 1.5.7 -> 1.5.8
Date: Sun, 27 Sep 2026 23:49:40 +1300
Message-ID: <20260927105002.1832451-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130347

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/open62541/open62541/releases/tag/v1.5.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/{open62541_1.5.7.bb => open62541_1.5.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.5.7.bb => open62541_1.5.8.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb
index 10e2e36675..686f884dce 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "d1173ccc31560ffc60c29e24ce8adb19f8c3c686"
+SRCREV_opcua = "e6a35ddc4c80d6f948af3f046ad942b4c9822549"
 SRCREV_mdnsd = "c1be962b37e4b952625d9b0a873e5ca619b1a35a"
 SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"

