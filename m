Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B536C41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:30:17 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.55738.1720024211938870769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=mhLmdn7H;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.181, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70ad2488fb1so2391107b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720024211; x=1720629011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yGQBsdFPXzbX1QfvA+xlKW50bdRokEzDUIATgEFnQPw=;
        b=mhLmdn7HL5S4PBUZtXZ2CEZpfHytlGZWsUrkg1STLHeCNPLfKxkEfkgmprzQr8drAV
         7XI26gwRmMSH/LOtS7l/epFjIovCtLAwHo1cRwmtCLUFT4YEU3d62b55wHqC9ilOyvPq
         DfwClkJCgow2xMJDFk+S+0rPfpcIm4u0yx5wJe6wcaaiEzvjMIT+Z0IBSBHpAJCe0utv
         9arpERwc+dhJ/2TRkL5hiAXQ6QonRixYIreoxtb+WJhcPftpDLnWJyfkAnOkNcwV12Ay
         03jzWki2W1jDJmVjwonRaqQwGljO/zzQC8TXmcAqeqD28XrjfwvuVUPWJqGyMWy8AlU0
         ipDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024211; x=1720629011;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGQBsdFPXzbX1QfvA+xlKW50bdRokEzDUIATgEFnQPw=;
        b=G2WoHWMPPJlPuFatXYmfecFP4sJOb/1Keo3+MVq+riDhe+vX8Jh8UZSNkkDmp9ed6F
         eZiNU6rmEy2yUm2ZSGoyCaZf3s4GpYmdRS1Hwilt8++LN/ird2H6eCdz5+q2KvTF5ODV
         2DzvU/E+dhEUnPvljYlfz/k2kSTX2wePsXApxXLr97GoOibGnbTSSouxoZns/fA010bc
         lnVuQnlC4r6r09qF+CMmLIdnIDNbfukXbPMI/vvT7Q8+0/15u797sgYn8s6vTeOrrREx
         9QTsw72Yb3E0jKptC/D1DoV2NdFKGGtA0iPWx3ZBYXbHNMv7Zil+vCNbJVMVPgZ9R+EB
         XS3A==
X-Gm-Message-State: AOJu0YxfyJeoVbY6JEBVxBVdx4zBWaNDjiLe1pWQ+ycQgY7sKPmOEEHK
	ccd7pIl9FlsALXLuK2IC30OvFTq3GS4LAUudRQ0aKv33IVqYM0zX+yUuXUAIb3Gj8GAMOkr+r9m
	o
X-Google-Smtp-Source: AGHT+IGBqBe81x+pC2HjCkolRKlXK6yl4E14+Kc8/I2Dr+oOH8tBvdAU7cfCZCJEA9/vHAiHc6W7pQ==
X-Received: by 2002:a05:6a00:3e0a:b0:705:b6d3:4f15 with SMTP id d2e1a72fcca58-70aaaf061d0mr16129037b3a.25.1720024211217;
        Wed, 03 Jul 2024 09:30:11 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e63ab1sm10599643b3a.36.2024.07.03.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:30:10 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] apache2:apache2-native: CVE status update for CVE-1999-0289
Date: Wed,  3 Jul 2024 09:30:05 -0700
Message-ID: <20240703163005.12293-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703163005.12293-1-ninette@thehoodiefirm.com>
References: <20240703163005.12293-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111228

CVE only applies for Windows

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index 6dfecef8d..7b0ed338b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -41,6 +41,7 @@ CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: CVE only applies for Windows"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.44.0


