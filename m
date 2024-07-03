Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD97C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:30:47 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.58360.1720031444758735573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Ke7CI9ZM;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.179, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70af9f7104cso315384b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720031444; x=1720636244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQYjGHGFHqOaNo44RUIUb++J3T1P1YUXMxLOK/BLOD4=;
        b=Ke7CI9ZM+h4U46JN6LEiA3cp81mJyKFFaL2uNG4DDFha2xLv7Oj+4ERGGOqoct0cBp
         UEJFs7rEQPfKkbWxRhyqewNyxv14fzIQqVY8UKP/thaBC7q2DL1HklTfi7P4mYAwXWHk
         S2JL690k+EHjGwMC3FwX+h/8AZtBLh1C8bHAPuGvBEsoC3NkdA1bhH/T95zP7R4K1g7C
         92mX4gAEUtruv3bQXmYrqy5GD/z9nhyWiZba5UgsPxxnRWzQpAYHWD2dsRuBjjktyUr4
         J0bUqVuBlq2ftRi2GvCi1oNgYwBBxfcLWtmtnIENJ+g8sNnjnTNIF5yTPqJLnRgDTorH
         0g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720031444; x=1720636244;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQYjGHGFHqOaNo44RUIUb++J3T1P1YUXMxLOK/BLOD4=;
        b=PbUr4FXI0wxFKNOytlEBkAJhR+X4O8C6tXcq1GCyJ3Cpf73A+qmMNkpDyDko9SZxFk
         ayK7qf2HoIM7C7TGyJOUEqx49xepE1YAO8YZEV5DrvGaGT5VboxGWI2ZqhtclcCYf0xG
         q9x4r/pxpyhpg/C2Rag+tZe21HO90uthFJwY5EMiqR2plbOqTdvBoKCDLgffvefWHvzP
         E4QI/SYZNnVvwSWJu395WeCsjsEl3vVWtpAQ+dcbekdHEgjW6PUBFGMV1xPR5N/xIK+4
         nZH96AUuAlLeRo8TueKhCHJtHfpkflK4wBGXk6WeHnOwnyjojfP2vQ+DHU78Z36Oy/wV
         uvTA==
X-Gm-Message-State: AOJu0YziOJG9UAwhl6JbZaYLnD/534nzW6RkC0DyXMHg7KrmFsmCVD8s
	Br4pi5Vb/sWluF/9XVJAOqDxf4uZjf7HzjbWIGsML+GfPMSsvIwAiduAkfjYDzpb3nk1DM7VqOY
	N
X-Google-Smtp-Source: AGHT+IFlotf9ZSO7wx7sNdl4qLMbiNET8/cCP3bBS33LKmJiRDvMo61wFb1Z3Ln1qkd6qJLAUp06nw==
X-Received: by 2002:a05:6a00:2e28:b0:705:be21:f2be with SMTP id d2e1a72fcca58-70aaad61fcamr17420515b3a.18.1720031444070;
        Wed, 03 Jul 2024 11:30:44 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf652sm11082210b3a.99.2024.07.03.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:30:43 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 0/1] monkey: Update status for CVE-2013-2183
Date: Wed,  3 Jul 2024 11:30:40 -0700
Message-ID: <20240703183041.8844-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111245

Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0

Ninette Adhikari (1):
  monkey: Update status for CVE-2013-2183

 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.44.0


