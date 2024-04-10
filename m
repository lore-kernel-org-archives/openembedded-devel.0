Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7480CD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:22:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.165782.1712755319280681041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=uHcCZ6W0;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.46, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d6e23253so5458098e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712755317; x=1713360117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCQKI4bSV8Hnl4bncEDVIkJoRwN8zcwQ5RI9tOxkGdQ=;
        b=uHcCZ6W0hdyB3nDlwm9LRD23FRymJJi0nKFujG9euAg6JBmiufPzIrYf57IzkmcngP
         HcXCxH+7lB4P1PT82ZFkFfLk235b5L/jOAleUKoSAylP8PNjipLjGSMoTHzEU3F+pGou
         GGUQnlcQkNEQHamYnh3wOBRCY2GNHPJk6DZaaImBMhIbtlXbswa340SeBSXANi/d31XV
         k3GGAHNNg9V928DUbDc9ZpFsuWWTSgPAE308vldM5ARiD6ehuv1oAAfwejcxXW17yiyB
         zPR+QO8q1bOoJkSrLsoeT7eXZrmtMEZ0h9DxloetDipzKzxOc3Cwpa1v8RN7PTu7ACuN
         88hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755317; x=1713360117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCQKI4bSV8Hnl4bncEDVIkJoRwN8zcwQ5RI9tOxkGdQ=;
        b=P3Eef0DaOOQGRbTKf4UOvXlV3Ta844ykax6ZjbokzDbW4K5lW2uMK5J9hcsz2hDodS
         +d/N04CsnbRAvodYNdd89GFNoYQWY293wubtA8ccq0ASmq6y3kB0pYEiQq5+vyITXzhG
         UI7cGysOZ1I9giCx1COiG56gTp5GEnenykVQwWUaSDKRzFbQQSTRTGcm0Om0mHYL+V9s
         O1KE1DuzGLAYMYvkGlHYdSZsmFu2NxrrAg+EgaZHKVOiqmnPsOeNwU9PGffuRpwGPhPf
         vF9zoLXQB6t7fmZWCdRLt7WayfceHlXol06tjYpJT3ILr2O356gFv2S4M7MNcp+rZYV9
         Cehw==
X-Gm-Message-State: AOJu0YzXCBSs1ZI4XMB89hfzOMyIr3VQLbk8OoTSXw8hf6uXZ/1/SCR3
	5yQ+CZss9qw7kAK9N8eEpz5WkwkTjt4VzbhM7cl0aaJOomjCS3/cRia4t7vdNl0ZNH4F+q1Zl4Y
	u
X-Google-Smtp-Source: AGHT+IECX+jb/uIjdGBhj55iUKr1S82/iNhhF00Jj0HYSRfotWx1w7D47bccpI4TnCDaTbdneALkwQ==
X-Received: by 2002:ac2:5455:0:b0:513:df6:dcd3 with SMTP id d21-20020ac25455000000b005130df6dcd3mr1865143lfn.48.1712755317325;
        Wed, 10 Apr 2024 06:21:57 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id h25-20020a056402095900b0056e62321eedsm3536767edz.17.2024.04.10.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:21:57 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] ace: Update CVE-2009-1147 status
Date: Wed, 10 Apr 2024 15:21:48 +0200
Message-ID: <20240410132149.74210-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 13:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109895

This issue is not valid as VMware ACE is no longer used. open-vm-tools is used instead which is part of the VMware ecosystem but not affected by this CVE.
No action required. This issue can be removed from the CVE list.

Ninette Adhikari (1):
  ace: Update CVE-2009-1147 status

 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


