Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A537DC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:49:07 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.57461.1720028937529593683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=DUxHWpBh;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.49, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-701f9fb9483so2953614a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720028937; x=1720633737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNja508ySPIxrbM32TNhamORJmhc4/tiovHadYIe4jI=;
        b=DUxHWpBh5d2flQPkdocay1ROvLi7ZZHYWIUx+YbXCwKngTpe9yTdivesjL/s216M1S
         1+PpDoAyvXLrwBHVPpKvqFYhKxGUigKrAiWrafYxhHT+o5ULJcXC9jV7IJN/ResPZOgx
         W44VXnIohkYX8zQKyP/GeV7moiuvOUtQdNHxz6dpMMR+qOBCbLpIX6Ws1uUMguidM7vA
         ufaaM9i8oHcWtYnn6BPWkttTGF9SAYNVLW0zTmhAoz0P19T52AFKeWf4lBcNxRm6vjd+
         A1PWrOglSB4X92HpG03y8MBZwJ3g3axLM2X5VSdAStr7Bczqd7k9yEsC1ucza929tXxX
         tDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028937; x=1720633737;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNja508ySPIxrbM32TNhamORJmhc4/tiovHadYIe4jI=;
        b=ezbNpEz97AoazJ2glqpu/0HI22zmLMypBrhXaGUZXDEwXE9Rp/wrz2XJ+bC7xxzHt1
         tv/gj3jZCoS4Vv2nmYxAEkNSquk6SmEQvMlyA6OFlHh8ge9cLEsrPPzaLn3VRZVxhs2i
         Aatn6g2VM40HJxsXw1mT0sVqwXsltLhDM9OiNlFFt22r+4QqE37sBIZMLQKhcMCKf6pI
         0+MrnHhA/nS9QLjhFXXzzE6Qjr+b5bVzwtoFoRvywmi96Ig/hy3A4Oj/i+gQy6UCNfJG
         3EWmH2YOUAXuB6XrrQd/Sc5PSUt1EZw32mG6Z1eVLrBYP0/g67Bhkm2Rvj4BY4ufnjkz
         DWGQ==
X-Gm-Message-State: AOJu0Yx6bvSN0Tlerk6E+M9Wh7hSupmOBRrrZBCeKI668pMKDi8zj9BW
	MKpumL5o/Obe2227v1mbCJX/C3ZVgUwrSpSK3+gf0jp5AfYxV3hOXzUNfdPSC56BgPd1+zT+f9c
	k
X-Google-Smtp-Source: AGHT+IFdY6qcGDEyXfsVr1UwUJbedmYfbJYtsgHzBcJ1AvDXIDt/GOeCJkaEjaLYUpvzD9XUiyYaQg==
X-Received: by 2002:a05:6358:8a2:b0:19f:2785:13eb with SMTP id e5c5f4694b2df-1a6acd26dd6mr1095142055d.19.1720028936744;
        Wed, 03 Jul 2024 10:48:56 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c8ebf1asm8441044a12.74.2024.07.03.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:48:56 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 0/1] xterm: CVE status update CVE-1999-0965
Date: Wed,  3 Jul 2024 10:48:51 -0700
Message-ID: <20240703174852.74580-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111237

Current version (392) not affected. This was fixed in version X11R5-fix-26 (R11R6 from 1994)

Ninette Adhikari (1):
  xterm: CVE status update CVE-1999-0965

 meta-oe/recipes-graphics/xorg-app/xterm_392.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0


