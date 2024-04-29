Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2C1C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:02:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.17866.1714388533651639356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Xd0jeHrF;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.41, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58772187d8so518926266b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388532; x=1714993332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Py+w34m8LyyhQNkdX75EYXmcR8ymhKbM8LJsm0Ro2UQ=;
        b=Xd0jeHrFrMjqT83OWc7frGgzCAwAY1Fsc5zk+SNz0yeUSgS7Gzq/Jk+tmXFqKmMDnc
         sps8HK1eiW5b/gGTXYkfxGRERHmafGIgqXtbYpXj4sG14xXGFwdfM5YPXvfDYJwElyuV
         h49lfpZs9qoCAP2jOzBnAt5xNHxXly4+3lGi30O63mh8eXgbg7UvoAL3dLnK+ItQ/fYe
         AGDDU/am4IUE5Hpp8fszrSybFCqn4cO0wClK+bcxFccHVSRXCMOgyizNdExru401l6OK
         SjCaL/Szb0AyZwa5ZeCeVhHgqj8rSw0Srqbsz83iUqML/sC1hZRuWEHL0dob6bfK9/ML
         LiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388532; x=1714993332;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Py+w34m8LyyhQNkdX75EYXmcR8ymhKbM8LJsm0Ro2UQ=;
        b=cGLecIZKzO29WnoVRr54G8uUe1pkjIgfWuRPKU0M9iCciny9UsjJIi9IddBc2VclV1
         1w4EqssZXTZsXWa9Irb6Ub91h/sx8hsxpnticbCvXoUIVKGwRj5tqpvc12pM0xTOtXqZ
         cZDPDhPAoJzj5bbCh5NNZSvDriGvP33A8B3CuZTmy2OJS22QeGU1jaSYeHC71zKIYIoh
         WIAZ3LnDdMr4WyQcL9z5wyyFUmAFUKiX8VLXBJnAfrqOLulXffIQFva0SBVxeKYogDki
         NVx2gO0Q+TGW6StrnQM2BKCAasKoZmUoA2OvAa5+8nMHtFZLei7XcjxlLotR1n8j9s+6
         ULTw==
X-Gm-Message-State: AOJu0YwHcnhwDov6BvHJX5JcXuHK4rv8yu7Cac3g+oZSkmZcoh1LBFEw
	rvLKVy1CoNZYWmL8fBLiE+eRcAhZ6drQr81VYRyL+snXk+4tRoajMAgXjnxDWPXlcHSIit8ILNm
	Td+s=
X-Google-Smtp-Source: AGHT+IFfmV/hmV5O9CZNs/9hpJVcPNsVwLTqLIFhcF77LvadyT1oSM/GNx9qb/N/olSSXwc4ZoCwNQ==
X-Received: by 2002:a17:907:bb97:b0:a51:dcda:dcde with SMTP id xo23-20020a170907bb9700b00a51dcdadcdemr8472887ejc.70.1714388531831;
        Mon, 29 Apr 2024 04:02:11 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id mc11-20020a170906eb4b00b00a5256d8c956sm13733353ejb.61.2024.04.29.04.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:02:11 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] st: Update status for CVE-2017-16224
Date: Mon, 29 Apr 2024 13:02:06 +0200
Message-ID: <20240429110207.50187-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110168

The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue.
Package used in meta-embedded: https://st.suckless.org/
Package with CVE issue: https://www.npmjs.com/package/st
No action required.

Ninette Adhikari (1):
  st: Update status for CVE-2017-16224

 meta-oe/recipes-graphics/suckless/st_0.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


