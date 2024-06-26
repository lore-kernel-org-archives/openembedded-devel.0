Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCC1C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:11:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.27690.1719411063216293756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=RaLAEWTm;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.178, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fa1a542466so5914395ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719411062; x=1720015862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bVNprNt+myB5eWcHDBbV0HT5RJz86pg2XgwSVMXRkzA=;
        b=RaLAEWTmxFEzMJKfUqfvb+x4IVxNMy7liwWpx0PuPLLPBrWpda2IGuUY9p4OW7RQD4
         8OA47WRdllVUvXhweXKGJC7kCAqG89vf0cnaK5194bsbbVo7t+3DNHAW7G60/70qFXia
         bNqm3N4xm2C0d02dljmiOIf5XbbiijdqXNbNbwnw1SHiRPxG8OZaS6ofxRQCxwoFsg6m
         dxcWbNCn6rflk3ndiC+ygodb86xN30lHXp3jvGwtNZiVLqt/i/D0d4U8JEOhmY9q+9WE
         Vgpa/4tObWwmTiSrMW7Rs1JCvi2xF0oewJNn8PG7KzwR/7QuyqJ6dvOyiMzQ/fF4/fqa
         36Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411062; x=1720015862;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVNprNt+myB5eWcHDBbV0HT5RJz86pg2XgwSVMXRkzA=;
        b=fJrvV6fGF+koXiGggzQMl+mIkM6pH0w1LKMVPVZdL4d2LB7UObAUjJWuuTHEIFebWL
         lCrewfMFoXJARNcy5fmcPR3j22y3i3LXjk7V1HQBx8zPrSUJn6WfoB9GfLWt2zWT6jMw
         aApqUbOontAimOkvjR8koRUkYybfP/O1AswzAr2q3qYM17CSkLZZ42OFluB6UAnEtr/m
         o4DYzvBn2cwya09y2bt2NamfP1t3yaiJLxKJlW+S4H+A33H63/8MzBafIcFZkONZoV/R
         5sTud8UClET805Wb55k9lYPX+uSQh7dBU4nbV7Vo7/70+ZnuozVCWQIASXM06sm+65jw
         /xdQ==
X-Gm-Message-State: AOJu0YwqwlKQnOMu1xkB6g0Xhn/HeFArv3rL9QEXnIepToZPHjzu8AUh
	+ULCkziXzB2cwb5iuwE4NR+LN2ijdWvD3n7qa+l1Dp0GW/CnAeCVWiuzb2RC5X1d/60MhNHOptV
	5
X-Google-Smtp-Source: AGHT+IGm5ybuH9zUUTizCxBlAWBAEyZ4oe827RSp6RMSm2I9HSaK7Twjm6OM51bnxdEsl6gcF/D1AA==
X-Received: by 2002:a17:902:d48c:b0:1fa:918e:eca with SMTP id d9443c01a7336-1fa918e1174mr18374425ad.65.1719411062433;
        Wed, 26 Jun 2024 07:11:02 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5089sm99574245ad.193.2024.06.26.07.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:11:02 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] influxdb: Update CVE status for CVE-2019-10329
Date: Wed, 26 Jun 2024 07:10:58 -0700
Message-ID: <20240626141059.45833-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111095

The versions don't match and only the Jenkins plugin is affected.

Ninette Adhikari (1):
  influxdb: Update CVE status for CVE-2019-10329

 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--
2.44.0


