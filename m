Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D659D3F2B4
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.30088.1729278818900892195
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Um+r4n8C;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29715835ceso2398790276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278818; x=1729883618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDKHxU+ToyYcFxA4pO362FrVpxChfqjsDCoMasf+MZ8=;
        b=Um+r4n8CfLVNrQ3DraH9qF1hzMeYeuQ4D0fa60MIe4tgECgSAOyOmBQ6zlWiUNqQhC
         iGs1BMIFPs8xXX1Vp1lTNWPuebVlu9/pAIkPztSDiy/BT0/vGdM/dLmaGGq76Q8/BJaI
         dBM4sf4u41NG0C3JsaU7krHh3Uj4G4YDtHH95fT67DCfKLSQxgPqDgZlFShNJikIZ/W5
         iV5r1OVxQLHc7meRQvie9RLXa0PNLKR8SYVRYT8lBPmotVu4qgxxmG+LGfx8InlqXLRG
         qXGZdU1sOhqOzllW51TQl/jV3PTSL7AbMIculItgO3ks2ODxBhTo86Rm5paY402FJ5D+
         uPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278818; x=1729883618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDKHxU+ToyYcFxA4pO362FrVpxChfqjsDCoMasf+MZ8=;
        b=bWUMQ5uyF239pDdgxz7P8UFhfxG0BlycTMw6n6dHzoRe2Zx5NgXC44kiCHRAfS3Ird
         WES7J0KsL0BvMh5nbeu2UxwEzvXj23HgvJp7lMzbQ23YZY6sPGdYqiqktvSpLfFCwhe5
         mcCKe5E/Pb//QDU5VLd0qWZ2sMNPi9AdFJ6jbxis5tfjicErpj1o9P+9dBVmS/PZl3yu
         YnwoB+kVBR1sUsnQW+U4vQBCeWU5caaiuR8aGLKm86iJZXOSA5ghyosDFOm7Da7Qliqp
         jtA3ZhMzGr4l8xugnArwEOLnyNItPsf4oQAcemGCBcdfJaOkE0ZZidm36EuYpU4fQqeq
         lwqg==
X-Gm-Message-State: AOJu0YyFlmlgNqfg2qZRwexp0TYmizVm2C6ZQHFPe4jsCiNPolihzCLU
	KFtXPfPqfD6b7L5Ksjet6DDiWfr0SAPRtqJ8JpWwjv74/p0lU50W93hj6Q==
X-Google-Smtp-Source: AGHT+IHNbaxPfskrXiKeA2Sm2Ibyv9NQqYS8ydtk8M8cnuDXsY1egrmSNEgx71telVcXInYaCUhH2A==
X-Received: by 2002:a05:690c:4b82:b0:6e5:d35b:ca80 with SMTP id 00721157ae682-6e5d35c0275mr22575037b3.5.1729278817414;
        Fri, 18 Oct 2024 12:13:37 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:37 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 41/68] python3-padaos: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:28 -0400
Message-ID: <20241018191101.25184-42-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113028

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
index 3af9349d4..8535cd445 100644
--- a/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/MycroftAI/padaos"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.md;md5=b51c3e8e53a7cd95c13c5aab6cbc8e67"
 
-SRC_URI[md5sum] = "dbf852015ef87a6694549779fb475b52"
 SRC_URI[sha256sum] = "2ac05fcbc826873c574568aa5ce09945d6ea987bee10399e766eb8f7c6356d72"
 
 inherit pypi setuptools3
-- 
2.43.0


