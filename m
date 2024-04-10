Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E742DCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:22:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.165786.1712755322348606074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=VDGJkCTQ;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.49, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so5223821a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712755321; x=1713360121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWx4Qb0oAGpRj586XD53Lw0WibCk+nUBA+rsl2DlPgc=;
        b=VDGJkCTQAn5AKg2tV6A8M48WTwnIpl+/peFcVxIVxBxF4n+woWlLPJxqG/Wo+J0oVH
         Wd0J7SXxKC+7g1eiQZlLXT299lNTWQQly/7RilrT7dUpcnuIvIOtAmIc5xttqehMnT6w
         tmKTMOCb98SDuqoDvpOKK7qe/mo5G71Fex0m2wTSCK3H37BDDUmF2vts97k1aCaOoNHR
         yKH83/C5rYHwQsUPxLGm/P6AUxcydj6IPts/x3nLM/wSdxUyhh9lgBHJzJ3K26GG+6ls
         dRd/RBRuQalh5eIDTKxJcMhQ8PkmVGxRnxYLPy1YcjQ5JatexORlF4UfG3hADLVjLFiQ
         +/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755321; x=1713360121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWx4Qb0oAGpRj586XD53Lw0WibCk+nUBA+rsl2DlPgc=;
        b=WLFK/eVwRqp7EYuhI4PaBs1FoNwDuidGbQTFSc5U8jRcuTBkjm8MOMz+FTenCYAzhk
         SyWPuaaY0z+2berLG3gnALbYYKI/mFsUFzDq1Y78/4VjDLIbxQfA7tCd9/4TNYpt399L
         OyC3Gx/RXCHT67rmWqTNMUPjh7AVL1uMjL3aNdT40hEEfVVB0UVclxWl+smKcDwyhcd9
         GpeAY1fN5KR6UrwcUZLeiwS4jWVbVdeKJP4LBt96Rpdm6VnQmzW5XhAlkHnTqP6+Emer
         BDy25NertZOrQZwNQUGOZHccW8vow9YtFBoZd5/NM9wBYsIa+qj3w2TUICfe6iJO4bJ4
         fC/g==
X-Gm-Message-State: AOJu0Yxe8PlzxOPHIOb6LC3LTA/X/nhN9fBGyOzAtdaztOkOmuyutz/6
	ZBJ5kP++lhFC0WEa1/qZELYdwD/MOWflMlRKKsDvtJoXvexvmE8iyegAO9wUomJqlNmNczaZYiU
	b
X-Google-Smtp-Source: AGHT+IFu7TVZeL/i7NmjDgnHHlFyGsLOTKrRkZJmkawqxtuProgA5oIp4hSMc+n524gVqL3qJcllxw==
X-Received: by 2002:a50:a44e:0:b0:56e:309b:d6fc with SMTP id v14-20020a50a44e000000b0056e309bd6fcmr1610086edb.10.1712755320621;
        Wed, 10 Apr 2024 06:22:00 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id h25-20020a056402095900b0056e62321eedsm3536767edz.17.2024.04.10.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:22:00 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] ace: Update CVE-2009-1147 status
Date: Wed, 10 Apr 2024 15:21:49 +0200
Message-ID: <20240410132149.74210-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410132149.74210-1-ninette@thehoodiefirm.com>
References: <20240410132149.74210-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 13:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109896

This issue is not valid as VMware ACE is no longer used. open-vm-tools is used instead which is part of the VMware ecosystem but not affected by this CVE.
No action required. This issue can be removed from the CVE list.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 6696e552c..1c0f0862b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -120,3 +120,5 @@ python() {
 }
 
 CVE_PRODUCT = "open-vm-tools vmware:tools"
+
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: This issue is not valid as VMware ACE is no longer used. open-vm-tools is used instead which is part of the VMware ecosystem but not affected by this CVE."
-- 
2.44.0


