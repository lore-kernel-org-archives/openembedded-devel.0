Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DC0C05022
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 20:30:54 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.281.1695241846065769994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 13:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-770ef353b8fso11707885a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 13:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695241845; x=1695846645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8T/waFcYHuvsZukIFJX3PTRIkiCWlxGS5Ob8JizJvQ=;
        b=c1Ckuv7GOikNoqYjiBn8NbtEQi3IZ+hq70tznPtjhiiicl5v42Nhil+/nVsgv0GKVk
         RZisVuV8e7uWnBVQehRaZsA3W1sXgvoWL0xUvmmtstg2Xy8rvfeTEiN31R9XtPleHq/P
         EhsUi5anYBS/TFuEArjrc0z6RavDykDxuch//cae+kr1T4VWMgWkPhaVQ1CIqyHvY88b
         QVYT5XjuDl1/xpJdPqRZZnVR4ar8xzFOmxm0RQuZ9OcIESbCWKxq5I0arI2CPXtTQd1U
         PuMO1dMDnl5vmSkhWymFsoRjGFabXkUvVQIKGRGNSFYdgFAxnKLczFdrWg42LRKdXjC+
         lNEw==
X-Gm-Message-State: AOJu0YzPfSBA/bAAThrBO6gum3P4kGmzDRp9cfrg1WcHUJgsMvx1DvAX
	Qsc6y3H7gakT1Ak2ICRt6Q3dAnVSSw0UkQ==
X-Google-Smtp-Source: AGHT+IHrs3Cl+cvCA3g5tKBGDMxS6aoekg21lecw7dUtuaPYpnDZdfc2atRTmwski7quS1T+f75/Uw==
X-Received: by 2002:a05:620a:25d1:b0:76f:f64:58b4 with SMTP id y17-20020a05620a25d100b0076f0f6458b4mr4020973qko.31.1695241844523;
        Wed, 20 Sep 2023 13:30:44 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f19-20020a05620a15b300b0076f1d8b1c2dsm16378qkk.12.2023.09.20.13.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 13:30:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-api-python-client: Update version 2.99.0 -> 2.100.0
Date: Wed, 20 Sep 2023 20:30:34 +0000
Message-Id: <20230920203034.1378450-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 20:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105030

Changelog
=========
Features
accesscontextmanager: Update the api https://togithub.com/googleapis/google-api-python-client/commit/f6f6113f42261f1be9d18d0336a54c9c8ca54da8 (f77ee26)
advisorynotifications: Update the api https://togithub.com/googleapis/google-api-python-client/commit/0025b75976439ceedf5ecf184fd2cb3defd74af8 (f77ee26)
aiplatform: Update the api https://togithub.com/googleapis/google-api-python-client/commit/fbcd223a51ef9353a69c895c5dd0664c7260139c (f77ee26)
androidmanagement: Update the api https://togithub.com/googleapis/google-api-python-client/commit/23cd554b0425f9096938fa6a48d15dab16de96e4 (f77ee26)
appengine: Update the api https://togithub.com/googleapis/google-api-python-client/commit/266598f5533b402c553c3c741c645d0a1dbc5e5e (f77ee26)
artifactregistry: Update the api https://togithub.com/googleapis/google-api-python-client/commit/fe34c2221c9cdd48d08ba62fc8bc19960fbc9005 (f77ee26)
assuredworkloads: Update the api https://togithub.com/googleapis/google-api-python-client/commit/86eaf3ff8d5be74e0254e22045789c5d6d8c969b (f77ee26)
beyondcorp: Update the api https://togithub.com/googleapis/google-api-python-client/commit/f27ec8e0acbb16eacfda7eda5df7716be18cb7ef (f77ee26)
blockchainnodeengine: Update the api https://togithub.com/googleapis/google-api-python-client/commit/bf425463c4dcd4b3cac74689accec071593114cd (f77ee26)
checks: Update the api https://togithub.com/googleapis/google-api-python-client/commit/3d7acfbe7058daa7501bffe5fdbbe324092645e5 (f77ee26)
chromemanagement: Update the api https://togithub.com/googleapis/google-api-python-client/commit/5310a182fd65eef841364c600a477bb4c8b7aaa8 (f77ee26)
cloudasset: Update the api https://togithub.com/googleapis/google-api-python-client/commit/d076b1bd45757a9a790b1be5da6437c9f2de6104 (f77ee26)
cloudfunctions: Update the api https://togithub.com/googleapis/google-api-python-client/commit/c9d14b98bffdee4b5509e7b0eeec94e37584c8b2 (f77ee26)
cloudtasks: Update the api https://togithub.com/googleapis/google-api-python-client/commit/fe0bcad3476804ab033bffe71ee92cc8b26d6273 (f77ee26)
composer: Update the api https://togithub.com/googleapis/google-api-python-client/commit/4d9e24a39caa038f30d6ef3593d6c5d4f6073793 (f77ee26)
connectors: Update the api https://togithub.com/googleapis/google-api-python-client/commit/7e2e3f0687d86e98db77baebdefd91bed1be6619 (f77ee26)
contactcenteraiplatform: Update the api https://togithub.com/googleapis/google-api-python-client/commit/ee747d28f2b9848d53c2fcbb4b92c2caac1f47e6 (f77ee26)
datamigration: Update the api https://togithub.com/googleapis/google-api-python-client/commit/de2aa36bbf671e2754eeb329fce83b502aef74d4 (f77ee26)
gkeonprem: Update the api https://togithub.com/googleapis/google-api-python-client/commit/f5890d08262d926b393d3e34eb518f5fb994ba33 (f77ee26)
gmail: Update the api https://togithub.com/googleapis/google-api-python-client/commit/40b0348d282435d229e5980ceffaf572b7df7707 (f77ee26)
integrations: Update the api https://togithub.com/googleapis/google-api-python-client/commit/ddf9afb276fa225bea8a677a50f0ddd7635310b1 (f77ee26)
monitoring: Update the api https://togithub.com/googleapis/google-api-python-client/commit/f64be2390ca1e6e59ce63fcef8b22ee78922eae0 (f77ee26)
mybusinessverifications: Update the api https://togithub.com/googleapis/google-api-python-client/commit/fde7890f06667733cb3917ab3edc573f979f7b14 (f77ee26)
networkconnectivity: Update the api https://togithub.com/googleapis/google-api-python-client/commit/0d299134e87b7b373500b51d43799d931f7fbf8b (f77ee26)
networkmanagement: Update the api https://togithub.com/googleapis/google-api-python-client/commit/47352429b14691f327743f9d54c079cef1dcf3cb (f77ee26)
notebooks: Update the api https://togithub.com/googleapis/google-api-python-client/commit/66dd9d0e43a6698c5e3b9b2918a6971d8267d156 (f77ee26)
paymentsresellersubscription: Update the api https://togithub.com/googleapis/google-api-python-client/commit/d0fae461de28dd1134dda00fb21998737241cfd7 (f77ee26)
places: Update the api https://togithub.com/googleapis/google-api-python-client/commit/db06598e16cd646cfd0251627e4c607feabb1588 (f77ee26)
run: Update the api https://togithub.com/googleapis/google-api-python-client/commit/d10dad24fea5a6ea8374ee69e3e7878619b4e708 (f77ee26)
spanner: Update the api https://togithub.com/googleapis/google-api-python-client/commit/531ba38b88d4f5195a991037dec5db6223b71fbc (f77ee26)
storage: Update the api https://togithub.com/googleapis/google-api-python-client/commit/8610476ae829869f9abc93a349ff6c1c52d5bade (f77ee26)
transcoder: Update the api https://togithub.com/googleapis/google-api-python-client/commit/7d2dfac9b7a320ac21921266c437fc67cf525047 (f77ee26)
vision: Update the api https://togithub.com/googleapis/google-api-python-client/commit/4de577bc69271c120360e6066de91e38e5f48ee4 (f77ee26)

Bug Fixes
smartdevicemanagement: Update the api https://togithub.com/googleapis/google-api-python-client/commit/03ffb2b7ad905cd7404f400b9311c92a6fe5a057 (f77ee26)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...nt_2.99.0.bb => python3-google-api-python-client_2.100.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.99.0.bb => python3-google-api-python-client_2.100.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb
index def02dee7..1c6253a83 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.99.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.100.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "e733fd0f2c8793b1a000d5e69ac81b1b9ec0665b445b7ed83bdbbb0038973306"
+SRC_URI[sha256sum] = "eaed50efc2f8a4027dcca8fd0037f4b1b03b8093efc84ce3cb6c75bfc79a7e31"
 
 inherit pypi setuptools3
 
-- 
2.34.1


