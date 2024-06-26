Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866CFC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:21:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.28146.1719411674676661190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=wSDavDyI;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.176, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f70c457823so47311635ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719411674; x=1720016474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EC9rk874/lUCcGJAIUepqRWKBPwnloN9l6SZbbD5ER8=;
        b=wSDavDyIYvtHVHD51yn9JY202lfsNvfHZQ/lZZNKwh4tKEtXB/FE5HSwo7at5QUIhk
         ShSlStRGffb/svXdc7XguaT12Qz6qqpEoag74CQ3b/gxJjFH8JR3rAqxYKraeQAW2M1D
         nSsqJ55JiPouivSyDoi0TbR9OC0NrTQzuUkPrNTmVSkUv9k6AjyONRSot6TvvINplo5K
         oXJhCafwfXkV18kzwC3RCrLxLrN1aNgdmnDR0YH1qBT2bfImt2N86fy3AaBjHCC7Mkl0
         3Pi7THxaLRiQki5KW5mxxFHKHdv53WbnKn3TEgcHi8xggPzWGUzVLzeboOEoTsgFqYP6
         vqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411674; x=1720016474;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EC9rk874/lUCcGJAIUepqRWKBPwnloN9l6SZbbD5ER8=;
        b=NXdO6Qryw08EafQhsOCiEGrG8Nj1/xUmAL+u8M6SrIktaBKfHyQkgHIzvGrdQntE5m
         KdIvq6jazNbb97r9u1y8kBabgHQK9ygCIYJ4XtcSAL0Two5Ddt6PYbYb7iD+QFwKQOuZ
         SiZeyVea3GhNe0rUYUe4jB6+Dq+cWqMlLKZQOoybE8SZA70G2sYFkge5mRxgg1FL4074
         cQg34fdMGB+dKmvVDCLkUntvAbGpsEGZrJYccTwqll1WXiSVvfWFxt4gelkWtC/6MuvR
         E1YdSPfom3gd8NWVdl5iGH+nCwgUsRWt18Ip0yU6ByFuXCw9F6YnmAlClOSlZq+Pmv3p
         XGKw==
X-Gm-Message-State: AOJu0YzugLT8rAag9FbITLCbi0/WxMSdDH4Iu6TL5z32AXQZ8iOhIHOE
	y8zldT4jxJLUedDaD/sIsuxVUQi5VLOo+NAaMvrmFEbYdSGYB8qa6XJPmwP8GijbGamgMq7EDIF
	U
X-Google-Smtp-Source: AGHT+IHdOHqZ+MLz6GT4skXze+dcMlDeC7nTI2UGGXFWckcbD0Mr+NmU3npCPJgJfX9/CfoaO/MsEQ==
X-Received: by 2002:a17:902:ce82:b0:1f9:c0b3:7b19 with SMTP id d9443c01a7336-1fa23f1723cmr116463275ad.55.1719411674066;
        Wed, 26 Jun 2024 07:21:14 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32463csm100706375ad.92.2024.06.26.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:21:13 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] mercurial: Update CVE status for CVE-2022-43410
Date: Wed, 26 Jun 2024 07:21:09 -0700
Message-ID: <20240626142109.61310-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626142109.61310-1-ninette@thehoodiefirm.com>
References: <20240626142109.61310-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111098

The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue.
Package used in `meta-embedded`: https://www.mercurial-scm.org/
Package with CVE issue is a Jenkins plugin: https://plugins.jenkins.io/mercurial/
(This is reflected in the CPE)

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
index 89e6744dc..395a33079 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
@@ -34,3 +34,4 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
+CVE_STATUS[CVE-2022-43410] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue."
-- 
2.44.0


