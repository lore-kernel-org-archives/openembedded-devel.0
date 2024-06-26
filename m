Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0CDC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:42:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.28759.1719412915811410978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=RcJiy7O/;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7066c9741b7so2971536b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719412915; x=1720017715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lq2c5Za3VVyYpwj7MMiXN9K9RAq08D1cm1WySMkKyhY=;
        b=RcJiy7O/Dcp2qiQ53NKccGZ0iTMF4e2VjfskTBDY9CcIz1Ghr0AAcumJm2klb+jKxE
         MaeK1Qbk8jlbTLlUS9RkUdd4Ge20FHMy9S3oQTCwDMM2/4F8HXWeQm/x51yjtniN0cWf
         GWdGRlXnjW32ERMd6vWYFUicAbokDA9v6/21W/vV0BCqsdFu++PKVq3q+L5XVGz0rtwd
         b2V3NIAU/hngRzAZqduw9P0YSb+spSiGw4HPds63EmdedsZKOl2jt6egNmnCwGRMBIy9
         6AZkmKnVna06+B/w1EkwHta386w2+eQB3+PaSstk0XAgRY0QlzoI2a7p1nQaFml1bOPb
         eIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412915; x=1720017715;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq2c5Za3VVyYpwj7MMiXN9K9RAq08D1cm1WySMkKyhY=;
        b=ufrO3Kxxb1hl9C9tm7uuEgrVDOhFjdRR07HuYwq9LVtK2S3ISF1TfWhhcuFmGEJkvt
         gxwtsA2LUPIoeIBtgfhHdyDo4T61Zs86lU9qhUoxt21rCgnG4Q/svTiwg1cHIe7v3J2G
         FBv8mNXMY+CqG0tnyCsd3Kowdu/pXuUHMqjeFU9MbSGJC9bFvI0HoGXnZUqTJv2QgHJS
         zTtUv0DxGRlAaQqnBebvYt70PCQX9JXfWpJtFmrfzJLM+0uwoGpyUsv4U2eEdzRx/+0v
         p4NHQxZ8mQngzVA/Zi6pfLMuAaMX6QvyruOEvRgZWSAr2EYUtYDF6CUyIC9hDlP46bfP
         L8wA==
X-Gm-Message-State: AOJu0YycNN91D/q6cnu4RlfMOdRDTjfx3DRoOqyLu5O9Dy9m2dtMH5zH
	L+KyDT39VS2zWigHXEEV0+DZPQi+hWbhUd0UQKH57/3mEdGWLIapq0OvryW9FtHzOkZqipe7ZA+
	8
X-Google-Smtp-Source: AGHT+IEfANVQBumtq4VKo3ta1haIhMCcetkkDPoniI9uVTucdS/af9qt8zi1OVjhfIKDa/HPD2R/vQ==
X-Received: by 2002:a05:6a20:4c29:b0:1bd:1e06:9dba with SMTP id adf61e73a8af0-1bd1e069e45mr4213935637.27.1719412915222;
        Wed, 26 Jun 2024 07:41:55 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm100373855ad.110.2024.06.26.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:41:54 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] usrsctp: CVE status update for CVE-2019-20503
Date: Wed, 26 Jun 2024 07:41:51 -0700
Message-ID: <20240626144152.92432-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111101

The current version (0.9.5.0) is not affected by the CVE which affects versions at least earlier than 0.9.4.0.

Ninette Adhikari (1):
  usrsctp: CVE status update for CVE-2019-20503

 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.44.0


