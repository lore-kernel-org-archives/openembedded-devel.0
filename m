Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32069C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9358.1788343564441572659
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aXLV5l/D;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1096118a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343564; x=1788948364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRsfJezDNFcduTtxAmJUxaw+Nsz/FJPxCFWQzzs3RrI=;
        b=aXLV5l/DPD+pO3ZByHwXXwo7mnyKng1yxztTu20SC6JLFfz9pBf1Fr8MIWxdJfIaC4
         z3ofyBd+jEYnJk5YGKJUFBOb9yKzbLmRuG/r72xv8g2/ZZ/cTyjslPdC9CK3yWas2YQT
         YDLaJQkgOrpz3oz/9W6fYYttWdBnf210eGRWH5GxZZDFpc2OFrYteMg4s5PaMSfh6sPv
         IxIZeiX1oTbzZ0dSnv5bGkVXjKDGtqOhxzVTOPZjO1BD0hlaUwEf8mXIvXC7H3s0qS9G
         NxwZLDvJNODRzSUdxM9mkmhEW3c38tOAChy+MoIKjnGqW5ehury3SuYJo+XpZmmhj+w2
         EMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343564; x=1788948364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRsfJezDNFcduTtxAmJUxaw+Nsz/FJPxCFWQzzs3RrI=;
        b=ApdeoXQvBSCsi+9uqhS7K/hk3ChVHyj3Q8/JqRBGoZOl8FtzujNbxZEiYKlo/GCIL+
         U0OmqMtLrSa0GtrVfyuM6tlQjJbukNd83+r+iPAKVklnEpnOt0+HOvavok5vMf4rE9iS
         ybvgpHGNRhLMVh0Tps2vtSQRI8ZZtdS3yo3ImnHueeWAbdVFTZkMRFEsE8k80YJnaG8z
         5x3nHUZw0fZISEPdxbsCV/ocxej7Lf5tToWu2GSV8enpl2v8Y00YnQij27qEapLhw/WE
         dtDaf+C94e6PdTyrklaFVvl7x56fcToOuDwMcK3up51Bte89i86G7FiZp5wdccaAl9E8
         nr2A==
X-Gm-Message-State: AFuF++n3pDrXyPmv555Py0YMBUm7kC3nxToq755K2OlWqw1M48jS5HPr
	MSb6J1nb2Bu2aBM9EpEZNxwBidkpHz+vX9rWbNTWW/Cf5OVdR61uCi7QyN2V9gM8
X-Gm-Gg: AYBFou3gaY1Jwo1M/C8lE+ETFq1MlJEat/fszwyk88QtSvLFirympfa3Mpkl1ADAAf0
	wnJezm6o8qCzmg9UVRf2YTTrlgLR4YfnX+1PG7vms+RY6X1kRkvBC700lNnRrGsLF3YkxVLzbg1
	OfcwJ1M0qVRYHMG6kz4RDOSxrsf1mCV4qRHXzu1orATpbZdXqZXxYkOkz800FJIzFdmFvd94aSx
	UVwbrWl9sZcUBF/E/f7ZNUOdLEG2JfPNU4b2lQN9g7RufkxlBdf5I6n4z4eC+rsPqxhcz4PLQYF
	sTs+Br1WtpETiSAGpClDxDKpjBiV47ml+pKXqufyMeArq8+kUURMWrNVHnkq9DJLe2Ze/ZE0LIm
	ErsNc9XRLv7OkuRgPE/ausddcbQvNbRWpQ/7PwerwZTq0uGq32Vrhlotz02W1ogDUf3yOGX8ZX3
	OIIXSCpP0M9i0/kVD2WLkkrBD0Byti2/zROxdDHYE8VyFMgg/Qrs50MN0YjwQ2m1d52oIbUK+O
X-Received: by 2002:a17:90a:d604:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39aedf5e124mr5771135a91.2.1788343563710;
        Wed, 02 Sep 2026 03:06:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 18/28] haveged: ignore CVE-2026-41054
Date: Wed,  2 Sep 2026 22:05:00 +1200
Message-ID: <20260902100511.2105916-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129649

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also confirms the fixed version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41054

[1] https://security-tracker.debian.org/tracker/CVE-2026-41054

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
index 9dd5f4d378..e04bcb89c1 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
@@ -21,3 +21,5 @@ EXTRA_OECONF = "\
 "
 
 MIPS_INSTRUCTION_SET = "mips"
+
+CVE_STATUS[CVE-2026-41054] = "fixed-version: fixed since v1.9.21"

