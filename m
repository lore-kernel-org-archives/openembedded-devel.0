Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D428DC61D96
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 20:46:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4317.1700599560829455380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 12:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNp2OuGy;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cb74a527ceso2236287b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 12:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700599560; x=1701204360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2jQWoaZ5zAaQUOM5tNes8cWFqlGSPkqeWs56Z8BCUY=;
        b=BNp2OuGyZnc6Uxw+WS0pBllUTmW5GSSZvX0xkUn+xCfSQHo5XwWGscffapIHTE3HWt
         oCUMoTtLvd3dMJycvHvmMfxjhzJHW666IAnlb1IqW3qtKiSaG7hYO0bTkUMoRb0gvapd
         aGG9o2oTu+aDZuAixXzwh0wNg+2/8erBS2X3Q+NnhsrFfUdoszu7R1k+jqhjjzwDHoLg
         8SGtEX7ne0XB9Zf2fS+uNwA56d60E9phdFGwqHRf+0bSqdgxLkNes4T1JhZ6oKA94OAE
         viG2ROQO1yQwEYaeShq6R/6gapDYqO9L//nOebRwzecbU3Qrc/UrzpPEclCRhpVVYaaj
         Lb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599560; x=1701204360;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2jQWoaZ5zAaQUOM5tNes8cWFqlGSPkqeWs56Z8BCUY=;
        b=iXMu4mMsCpLmQrgq2TyGtcslj3BTThnPpJ5zibRdjf88VtdM2HmBi3BU/icL28Nqn8
         L6+fJgo0IXDmkuMp4io1b6zHn/fN/2vgBYGRCbwOa+p1fjM52b/3umqFD5P4u69CuhVx
         la3jMsnWvadvLO8aKO9rtRsTHacjonZOT7kGv3+7/hGpi1aV9qT2D1Y/+ZKCK+AekiR6
         1KIIAQ2e+cQ9QAG54xhvt7kh5nJEzfKejRp5IezhID34uoKC2iv71BoXLpZJBr/6rMk5
         U/4gDXGcmGXOre/40dwa+Yr7ELbItwvtiJR558+na3RVu4Np1miSFNZAoT0/DJL9608w
         YEDg==
X-Gm-Message-State: AOJu0Yy3iCaArtAjpCJaPwkVibiCMs9AjrOj83G4ARd8bFEyL/db6J4M
	8QcNzH3nobZjSGP8+VAOpIPH+gbbWx33Fg==
X-Google-Smtp-Source: AGHT+IFAcHlUaOfTOFtRvdKaHtY11M7Z92vXgRfir0nMFW2ochNxj2Jd7UEECFLtxzKyEkkbWT3SAQ==
X-Received: by 2002:a05:6a20:a127:b0:187:6cc4:5aea with SMTP id q39-20020a056a20a12700b001876cc45aeamr187666pzk.59.1700599559483;
        Tue, 21 Nov 2023 12:45:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id cl19-20020a056a02099300b005c1ce3c960bsm7142465pgb.50.2023.11.21.12.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:45:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Potin Lai <potin.lai.pt@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>
In-Reply-To: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
References: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
Subject: Re: [meta-oe][PATCH 0/2] Upgrade idevicerestore and libplist to
 latest master
Message-Id: <170059955874.4811.8740314622904444072.b4-ty@gmail.com>
Date: Tue, 21 Nov 2023 12:45:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106982


On Mon, 20 Nov 2023 15:24:14 +0800, Potin Lai wrote:
> This patch series upgrade both idevicerestore and libplist to latest commit of
> master branch on github to support newer macOS and iOS device restore.
> 
> Potin Lai (2):
>   libplist: Upgrade to latest master
>   idevicerestore: Upgrade to latest master
> 
> [...]

Applied, thanks!

[1/2] libplist: Upgrade to latest master
      commit: 48779efcb2025d605f28e7fae7280174f093bcdf
[2/2] idevicerestore: Upgrade to latest master
      commit: a5f1b52717c72a1b4b5270b8d1bf40d47690a3d2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


