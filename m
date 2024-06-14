Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F9DC27C75
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 12:13:49 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.10081.1718367227040794096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 05:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=pUzJTAnM;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.43, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f986b92acaso1113761a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718367226; x=1718972026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3XH7C9aRF/HOSWpBHCmI1agpTMpngmCiyk54FZSnx6Q=;
        b=pUzJTAnMtR8SArfM2FzHrGqjFyVdXGk6wtVuoKdNQypBXSKrAYiDmlZohUch6fbrth
         BdwsflharaBVItLeFg31uqQRD98wBCZh35SpJ58NewRaZnhA8/g2UOesIdEgXS43Hx9S
         ofO8IG0ytnZcH9wRJc8zfhs05g/oV+asPkvrplSvSVEVB7DTCVR8vIRsWeN/lwrsK5HM
         wEOVeHz6raaE2IG4hcKbNHIdbo1cqlNLFX/v2LzyAE+1v/uN5rcLV7iquAM6iVWvo9mY
         OX94wGCRquYmWayRBWbv6hfiESoPdRqgKjWEpLSTd3SwI7Izx1w4wdt6bW/qEUHxQHcD
         0RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367226; x=1718972026;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XH7C9aRF/HOSWpBHCmI1agpTMpngmCiyk54FZSnx6Q=;
        b=QCNdvbLq8Aqorqy6ZRR9MZyj3xrUtpQj/Il7DT2Q5UfcdjaPH+Bfsuc5E6sLY8p6v+
         fuQLw5YglBhElAXJvF2cXUUbnVko7xZqWscDFgdwwU5msDhm2BuNjB2v5TfVEh3/l7dr
         krCjMQhwyXQc7lnAD6ggPdx8r52oTG8VPyvqfQMENwYNQmAX8BHZagaUAW6G8OzqoyMd
         BzS+Vct4sJXIk8kEfuuqivi92cBux3BH5INGz+kufGja61JqZwGJ5KshV/e107nrqEZr
         5+CQG7LK0iDbYrd7qXa0MNmM6z8yxmFWIrb9OjyhUU5Kg8Pt0s+Tut4Yw2y/RDtS2Xnn
         f73Q==
X-Gm-Message-State: AOJu0YxKaKNT2NqRzi2r36pdJISK2aDf7aLu4WLOYNXTDS6IE0D74Q4I
	jIgI4GikX2nX0gbPZ8Lxd8WEf3bk8BV+mGAFf4rk3onrBtnVEoZqPnqgbFo/LA0pm+vHK4Z3Jkz
	BrQHCig==
X-Google-Smtp-Source: AGHT+IERbYSguvRIu6+eQ23tqaIjkVTwbkVZ40CKW63V/buucWVomyS2aKHpf+KMoNHIBEBLxB1R9A==
X-Received: by 2002:a05:6870:f145:b0:258:37f4:755c with SMTP id 586e51a60fabf-25842b0cfa0mr2569926fac.46.1718367225999;
        Fri, 14 Jun 2024 05:13:45 -0700 (PDT)
Received: from Ninettes-MBP.home ([174.89.68.185])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d8fafsm15604071cf.8.2024.06.14.05.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:13:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] imagemagick: Update status for CVE
Date: Fri, 14 Jun 2024 08:13:31 -0400
Message-ID: <20240614121331.27514-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240614121331.27514-1-ninette@thehoodiefirm.com>
References: <20240614121331.27514-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110907

Update status for:
CVE-2014-9804, CVE-2014-9805, CVE-2014-9806, CVE-2014-9807, CVE-2014-9808, CVE-2014-9809, CVE-2014-9810, CVE-2014-9811, CVE-2014-9812, CVE-2014-9813, CVE-2014-9814, CVE-2014-9815, CVE-2014-9816, CVE-2014-9817, CVE-2014-9818, CVE-2014-9819, CVE-2014-9820, CVE-2014-9821, CVE-2016-7531

CPE is incorrect, the current version (7.1.1) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 6ab8a61b9..61dc1b795 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -99,3 +99,23 @@ ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
 ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
+
+CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9805] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9806] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9807] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9808] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9809] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9810] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9811] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9812] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9813] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9814] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9815] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9816] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9817] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9818] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
--
2.44.0


