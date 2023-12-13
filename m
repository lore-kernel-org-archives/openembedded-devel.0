Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E267C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.30708.1702451262913467748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrqNfNhe;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cea5548eb2so5853829b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451262; x=1703056062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FSoR3QVrT1ONuQBLI2BM4TNeQXuEtvQ2SXERwdZ7MM=;
        b=JrqNfNheWW5j3myr2h/+b0mEZlbaspOOLJfIM5jHLG3hk3kRitXDKTC8WhBwZu2j9P
         F3mnZEK2CNDGfdQS9RXTEq+fSDyeNCu3QLjG4iO2/S5PKRP0Pk7j7EEHnOfqmMN9MoNu
         pz/iN4dhf5H5u2Pm9RoO0L/2iGF1dxSHD6L0N1neuIShe2nO7A0poYKE+fe164yNnzdy
         07BVKtqg21aqwWzaA9k0Pg8DgLoUVc/8AyPAZQqCoesYCDX6e2JAdGOp8XPLw3D29N0b
         pijesSSxF/uS6SK54AdWYOt9f6nepC75PHSx1/p3S4eCByczlTnCFyzAMHrOFP3z6mIs
         103w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451262; x=1703056062;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FSoR3QVrT1ONuQBLI2BM4TNeQXuEtvQ2SXERwdZ7MM=;
        b=Pb/HDNc5frW4s+RuJxPufUfemMOEob/VRXBgK+RQi9r6SKSwWkAE7LaBJHbR54AECv
         zmK9IkNbxMz+s+2znkp/hwQYcSgsWKjW7JPBq8aEbxcpIDzrDMUGQerZbQn//RH2EGSF
         0Ent+kDtGeAmOknX+9rJj902uPRJCO7rXRj36PHzpHzN6sdSDDc2twqAG9h6/XqV/p0F
         NMTkuh5Drw+0XJ+EhqLWwlHoXQ2524RNBAOSTAMc0Lr1OcuBxPyo9UGd/ul8SssuDzdA
         RdafE2gGj3goeoIxqAePWX+xpDuQn6GpsoOcOsVFUvRzIlrL0JTwOnzIeWzyk50lSQ8U
         S0mg==
X-Gm-Message-State: AOJu0YwH6kpul4tipRhY/1OoQEUIcMfVGnTGIWAQFI2aH5pqJfIOmFyK
	zMfMa3WhaDOYZshwWMtTxF6gg3AIo50=
X-Google-Smtp-Source: AGHT+IG/RZd/1wuYnQUA7vs6Ri+kM3S/LU8SH9ZAUxXIfQxr8oiXl7X7BHqMfWy+9W3CEHlygzyPJw==
X-Received: by 2002:a05:6a00:1252:b0:6ce:7cb7:6dff with SMTP id u18-20020a056a00125200b006ce7cb76dffmr9047259pfi.40.1702451262163;
        Tue, 12 Dec 2023 23:07:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231209170903.672584-1-f_l_k@t-online.de>
References: <20231209170903.672584-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] tracker: dont inherit gsettings
Message-Id: <170245126161.133993.13753348438766983903.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107380


On Sat, 09 Dec 2023 18:09:03 +0100, Markus Volk wrote:
> this fixes an issue I encountered on raspberrypi4-64 at do_rootfs:
> ERROR: hyprland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['tracker'] have failed. If the intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /home/flk/poky/build-raspi/tmp/work/raspberrypi4_64-poky-linux/hyprland-image/1.0/temp/log.do_rootfs.
> ERROR: Logfile of failure stored in: /home/flk/poky/build-raspi/tmp/work/raspberrypi4_64-poky-linux/hyprland-image/1.0/temp/log.do_rootfs.629667
> ERROR: Task (/home/flk/poky/meta-hyprland-image/recipes-core/images/hyprland-image.bb:do_rootfs) failed with exit code '1'
> 
> [...]

Applied, thanks!

[1/1] tracker: dont inherit gsettings
      commit: 602306d4bdfdd0d636103c6037b8627be385ba54

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


