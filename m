Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29875C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:11:02 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.51750.1718899853692160546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=EpQVp4aK;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.222.196, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7953f1dcb01so95905685a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718899852; x=1719504652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wX68TFjxmYZln/MbQ0zQ2hsU2j3fZwUIsipsuQ2tm7Y=;
        b=EpQVp4aK2ZI2Q5lh9lqBywKovEyrM908iMMVEcaHBPm+jNEeuMLPlG6dDx8r8ahleb
         uBku3wOOJpaJnfmBPhKK2CyhyePyIqpPxaeb6R7IW2Bl/3Be+jqrKni+3C+/OSBNk6HD
         daiKED+qM6NM1p4cyuHEq00gk6eN57UrTAm3dBoZCfLn8LOjdjCSL1vA1BYdVm+zZYmA
         bZMbkfCW7wVf3DS4zwmkA1jBLMf0K4oC6vqpGsyI2CumIbmQSSmMNV1GQK5fpbd6DWUw
         eGNY5N1x27BYdBcDVthfmWdAjpkou2zlmnb3sueKDZuy/INIxXv4x7k2KMAcDAnTh/HB
         eE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899852; x=1719504652;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX68TFjxmYZln/MbQ0zQ2hsU2j3fZwUIsipsuQ2tm7Y=;
        b=kKj9ZbrbSGwNpZRotFz1VXvbAtS6/USBAKyn0rcMFbyRWkt+lyxwx17lg133zxWThs
         kXPgbMHSZJeClwJlfz5kGyiUX1jqisSYHH1z/+4UX4yTeDnA0/x5FLB9IFAGPDVogyHI
         eTCcwwj19kcqistjSjcBdeMTkPO0cTE6teL9dy9s2zj9ix+nqenoEa3WR5QUyJetR2ue
         IAk2CaD+SU/cjfCosrmkpEeu4ZwpwMI7oElqG6+aTjZPCv5fqS7k+mXzQgFyLiYtPv9C
         napZuqXsY4sX8K6IuHa5YI4JYatHogHMaND1DcH2ip7DwYsrspKVBJelJYMDmwR7chwd
         5vog==
X-Gm-Message-State: AOJu0YyNHb8yek2w/LF9+iJI68OTxKIXo3yIscr4qsB2CAZoGNsh7xbN
	JlAvb9LsO9LwviIk5JBa5+43jaD6tSNxakzWWRVrQvKHyEQ0TH7j/gkhbYczy+UdWEFq51aB+7/
	Qtsnv/bRtg5w=
X-Google-Smtp-Source: AGHT+IG0QtNVF9NXwZfKFzvCz3QviRA5xxazlhN6kulqdqFzTYitrFQQ86NGNdz7OkjIwVC+bZVKFg==
X-Received: by 2002:a05:620a:4482:b0:795:4ff9:a3d5 with SMTP id af79cd13be357-79bb3ebd6cdmr654953485a.50.1718899852195;
        Thu, 20 Jun 2024 09:10:52 -0700 (PDT)
Received: from localhost.localdomain (pool-173-35-206-140.cpe.net.cable.rogers.com. [173.35.206.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bad2bac97sm215739285a.123.2024.06.20.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:10:51 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] imagemagick: Update status for CVE
Date: Thu, 20 Jun 2024 12:10:47 -0400
Message-ID: <20240620161048.75491-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 16:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110981

Update status for:
CVE-2016-7532, CVE-2014-9822, CVE-2014-9823, CVE-2014-9824, CVE-2014-9825, CVE-2014-9826, CVE-2014-9827, CVE-2014-9828, CVE-2014-9829, CVE-2014-9830, CVE-2014-9831, CVE-2014-9848, CVE-2014-9852, CVE-2014-9853, CVE-2014-9854, CVE-2014-9907, CVE-2016-10062, CVE-2016-10144, CVE-2016-10145, CVE-2016-10146, CVE-2016-5118, CVE-2016-7513, CVE-2016-7514, CVE-2016-7515, CVE-2016-7516, CVE-2016-7517, CVE-2016-7518, CVE-2016-7519, CVE-2016-7520, CVE-2016-7521, CVE-2016-7522, CVE-2016-7523, CVE-2016-7524, CVE-2016-7525, CVE-2016-7526, CVE-2016-7527, CVE-2016-7528, CVE-2016-7529, CVE-2016-7530, CVE-2016-7533

CPE is incorrect, the current version (7.1.1) is not affected.

Ninette Adhikari (1):
  imagemagick: Update status for CVE

 .../imagemagick/imagemagick_7.1.1.bb          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

--
2.44.0


