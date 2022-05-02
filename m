Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1185C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:34:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.11260.1651502044415870545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UL5R+oc4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id s14so12595707plk.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TPqbSEV8m6E5CV73dUC1Ygm+yH30tD+cpod9MnvCcjM=;
        b=UL5R+oc4tSzCwluNsZwXQABDN0M1Wmia9q71eODKzvd9/Izvfw/ra5+ldZlcZ3j6EZ
         o5rEf4wfSzifcbCi4OBbPovorfUTP3NmknWlSgJxLntF+DeayvDRRnLINcBIoZY/kwY8
         tOZBaGONoJ4EyNQZe9f03sh4hTCiR3HC1h7g/0wZGaGUTKtDgxAQIm1dj4Bj9RGlvCE3
         CcyNJAJb+4+BpxLShp1T//OOgq7vGygtrtOGqFtHVOphGECry/E2VUVWD5yVNnfti0lr
         o/l3EtcH9tQJd9Bry9RiTuXzbw17T69puNxQ8MTK4IcpDe2znwTPfvC70kFPiSq7X6wB
         vNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPqbSEV8m6E5CV73dUC1Ygm+yH30tD+cpod9MnvCcjM=;
        b=5jEru1+0nIMEAw22yCi6+0NrmY5qIy+XLFK+9KlN7N1w3q8UmvvrHkyjAcQqOsJvmr
         0kuVGHZnB5qd/LMssY9ABxrR5qzOAim64o5XuCRMw3dGhjxqu8YfDqnkeykY0MFZa9ch
         +uJ1Y/Fq+OFeuWMKg+oEafI4I6hfVAKU7ycJEzEVPMJZFNmZiQLhDS/ywXkaMuu9xe0E
         n8n5QitzhOvCH8cMU3VoXmLA5/zqcu/VCV2ctnnU7U9fP5XQmZL56hPIelgjEBDc78Up
         PKK2RKmsJXKAbwEJnpawEUtUrJbgYwi113aqt57dIBAijzEbZv1VyZ79vrak7nLDTpOM
         M3xQ==
X-Gm-Message-State: AOAM530vFMk3e3c6luwkItAPFb0m3IEZXibp1mPBlbKBQaHVT/ROLeGB
	JaTF2WgyeRFXVuaU1G7H+3lyVOjBlBB18w==
X-Google-Smtp-Source: 
 ABdhPJz6nmdX937mMY4MXfATQjuf/zYfufBPyQjwaHOn4BnoDB9QkAzPvRAYif7AuPyRjn2yYZ58JQ==
X-Received: by 2002:a17:90b:1c8e:b0:1bf:364c:dd7a with SMTP id
 oo14-20020a17090b1c8e00b001bf364cdd7amr13186538pjb.103.1651502043529;
        Mon, 02 May 2022 07:34:03 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.34.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:34:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 08/10] firewalld: move to dynamic meta-python
 layer
Date: Mon,  2 May 2022 07:33:43 -0700
Message-Id: <20220502143345.1500852-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96937

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/firewalld/files/firewalld.init           | 0
 .../recipes-connectivity/firewalld/firewalld_0.9.4.bb             | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/files/firewalld.init (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/firewalld_0.9.4.bb (100%)

diff --git a/meta-networking/recipes-connectivity/firewalld/files/firewalld.init b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init
similarity index 100%
rename from meta-networking/recipes-connectivity/firewalld/files/firewalld.init
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/firewalld.init
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_0.9.4.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_0.9.4.bb
-- 
2.25.1


