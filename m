Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7379CC3271F
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:04:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.56502.1720026259647843077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=wupUhMZd;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70af3d9169bso454162b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720026259; x=1720631059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eTMWU3rm/kw34UN+9WhH9F/17hIyh3NLMsgpvRnaTw=;
        b=wupUhMZdt4NM41RA0Yum/Lr+Dv3wNBzgN7S8boHLsVtBsRRt6XOtz+J1eeaEM4cisn
         iUDnu7NSAaKiD1qP9ohY/8UT6TBzze1OMiTPUdAVMKGle8v1B/cBkgCpk9ieqlEC3MUt
         4tNHq8ydXCmaxZfZUwJNfVmK1nRDqWGgST463tJmBghCO/7w1k2zPgwwv5ollKsI3M3z
         0JktJjUQmaDzfS4wCsh2IB66b9e8WC2HCL7yiCAGqIdSPY9hepC6511rTv+qE0Ni3RBM
         3CZC1ZAIaUJlUCDTWVbYeRhs8XaCq1nZGlur99nFfO0WYQBUQFvA4gnVQwERq3QfORu9
         vuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720026259; x=1720631059;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eTMWU3rm/kw34UN+9WhH9F/17hIyh3NLMsgpvRnaTw=;
        b=dKauqjgSvQiM+MEJlgByIpO5FW/KQsOvpMy1/Cu9VazGve2PRDJ9pO1cCLsw9TytDu
         nHeYrFrrnQU9wZhBkfvPp2S+1MdC+gVLfTeSJTFohc4zIJVryEqT5bcfDzgAx8RuZtWJ
         kyiL3a20kjLL7/aVCyQeepNZ20hlRlg5Cgrup+dmDa5PPmpj+7Yg9Sn0YUVi/XxJ96Sq
         YbXL/QaMnQJNsdaxW33Fhfssic70F7XB66xlbWGFINpQbIIOCz9CinkNKajMzaWWZfWy
         s6MPT0sxwOb5ZvgGO+QvSfs4W15V5HOlCqTProFNAqybjduy5HttQGQfoQzoiqcv8uRM
         0cwg==
X-Gm-Message-State: AOJu0YzHHr8R7hIrReoE+0qSq8KEUh3fBOtQZ9SQaYynyYbITwgGVBip
	dK2B0C9qchcDex8vEWOIDmJzTKNALAnE1X3fXSCB9PWz0Rzm3FPhUTEAQC1pIR/gz/8yNxMSEQI
	+
X-Google-Smtp-Source: AGHT+IGXayEnfKcOiNvZ87eOv4sYYvy24czx6xPy85QwH2YUBvdWOVWIMsLOOYz9aOdxXScDPFbOkw==
X-Received: by 2002:a05:6a21:1690:b0:1bf:afd:f069 with SMTP id adf61e73a8af0-1bf0afdf283mr9774976637.42.1720026257493;
        Wed, 03 Jul 2024 10:04:17 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159686csm106091765ad.266.2024.07.03.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:04:17 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] php-native: CVE status update for CVE-2022-4900
Date: Wed,  3 Jul 2024 10:04:13 -0700
Message-ID: <20240703170414.39812-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111235

The current version (8.2.20) is not affected.

Ninette Adhikari (1):
  php-native: CVE status update for CVE-2022-4900

 meta-oe/recipes-devtools/php/php_8.2.20.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.44.0


