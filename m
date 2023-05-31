Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E7C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9096.1685521608839211884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=UCJGlyes;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30aef0b8837so2320074f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521607; x=1688113607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dyh83UoyvArveeyMbkrIXNGOwKmaFlq/oJAvurdm9zY=;
        b=UCJGlyesi/lrCox3fOd32dYOzDn8NFWEYf3dvbQLma9/66Bm+tkQ5plmw5ggWsGRCP
         wq+ysRLdc2iGUG8am8+TR5bYZXt7zz/oS5NGtBFQuG3TlMNuIGjqHYBlaB9Tcwz9UzVu
         6QfRRZk5ds+j6euyUqYCTuAy7KhAY9jMzSCzTSYFewmEsykxCN+CnooJfh+nyCyrFiQo
         aXy3/EGt12yP0f9/+2nG70z2FeC2toVU/jmereZdHbmmKoEv6qWcARLKCGCRed0hHp7F
         i6bo4TBmEQlei9dpdG12ZZZo9JVEgv+7p/LjeSP3oVp9Nz59Ho/muq/i2vR8pqDDMTfw
         53tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521607; x=1688113607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dyh83UoyvArveeyMbkrIXNGOwKmaFlq/oJAvurdm9zY=;
        b=bZKE/VEjf0CFjf7BQ7ASzWNJz7qccPiMtj455/WNqzNTsaN7CXSZcpmepBWvI4w9IY
         L/dlJqF5UbyCBE3iLPK0fij2OAKWnRK7BSz1vck/uoMoLSSSVZYTNldVjVE+XO+pxJun
         Q3f1pdewOTg/MdydnZd6TnaiL+9Wu2i9DzILsEKsqW5PULtAOn2v6xyw77onxfCp7yFx
         mLankVn8BViD+4bcbP0u/9d2kUdunv8AxBgVWM5xBkj8RMh+JBWq7CtkpNrNFxy89kUg
         eBnTuI/mUn2EyqYQIq315io3KVNfBIlNC2p8W+O+M74yXdR7pde87xyHCyEgmRKAB4E0
         zUBg==
X-Gm-Message-State: AC+VfDw/IYW2sUjoDR8sm6H5dxgLvsfiwDYvB9jA7daJRwA1jnc46sK0
	Rc1ddKAdJGYm5iSClMxJs2dGbQ==
X-Google-Smtp-Source: ACHHUZ673PiKXubdUvLtWRzhYu+KOkHrU1wAwI6dHJN7z0yaoUINW8LuBwb2ec9KEfvUyESgrmVoig==
X-Received: by 2002:adf:dec9:0:b0:30a:e378:76e with SMTP id i9-20020adfdec9000000b0030ae378076emr3238795wrn.64.1685521607461;
        Wed, 31 May 2023 01:26:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 091/149] python3-lazy: new recipe
Date: Wed, 31 May 2023 10:23:39 +0200
Message-Id: <20230531082437.10646-92-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103018

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for python3-lazy - a package on which python3-msm run-time
depends but which dependency is not satisfied by meta-python.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-lazy_1.5.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lazy_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-lazy_1.5.bb b/meta-python/recipes-devtools/python/python3-lazy_1.5.bb
new file mode 100644
index 000000000..cdff28c29
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lazy_1.5.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Lazy attributes are computed attributes that are evaluated only once, the first time they are used."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84689cccb68e3c397d0856e8ad5a73b2"
+
+SRC_URI[sha256sum] = "cb3d8612aa895a48afe8f08860573ba8ef5ee4fdbe1b3cd606c5f50a16152186"
+
+inherit pypi setuptools3
-- 
2.39.2


