Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1765FC4707B
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:29 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.198979.1703983104288167065
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knDdgPdj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d45f182fa2so34102175ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983103; x=1704587903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoh73ay2Da5R1Bgo1CR4aGVhS/WC5emOamD8YMTFPpM=;
        b=knDdgPdjO30ZMkt0N/dJtR6n8xjXcCFdj0QA6vZsFY1Fgfi785MUvYa9Qp7XmcgrMH
         C0yhoArRKUuQJJUmgT9x7++sIi55GiQAT//8KU+IrI3xuaZFjQKREKWAaBGRJdeUBZhP
         /4Xd/ZkoowG4mO75kRgJLtbXdz8Ijdr6cKX16i1ZC4DtXFWAgKJqGBQlIAYioDMjYfVS
         yJBFbT17qD8EEXkM0vQDecuEwH+qFKtIDUjKsnJgVEqy03xSlflvrRvbg3hfY7jp1tdO
         tm3Ql14EYNi2XNQElfoUZ8f59Lfb/bAZbfhEWMp2GY4sRjTRHIVjAU67vzp7VoogoFXf
         RTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983103; x=1704587903;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoh73ay2Da5R1Bgo1CR4aGVhS/WC5emOamD8YMTFPpM=;
        b=EZAlgj0CU1HVeEXjAnQ4N3WljeRW8y62VpRh1f0DnbsySkw7MZkkRy6QLA55jcvujh
         ZHY9HR8d6m/fhYJwkYW61TKH51gb8BeMO5+4dGd98KKqixmpNiQpnI3BaJpZxqSnm5jJ
         R2gZj/yeBh9TR2JEFxpMdXXSWu5DYfPYYTHL3usOx7XoIG2LhSiSjseWv6imZarKtD+d
         Vc0DUDuDCgwUr2TQWIMLC9RWOfZ079f6e++fMzAag691er77TpklRGiak+aX5IOO2wcj
         aYoamM2NmzE+gdspNPqETemk8vuoVYuG3395EZ7MsTFmubcGeK0xOW/DeSbqnzCDUUfL
         Ts8A==
X-Gm-Message-State: AOJu0YwXXUHKa8DF9ZEz5HKxP7B4u1rnDF6Mi2fUfiYRTv1KNxOEBbHx
	UVywgLDue5CRf95IfoIk6fV/NYOivwc=
X-Google-Smtp-Source: AGHT+IFCDDAFCM83C4lWbdTJtD2Mr8iXC+yMKI5kQlyqO7CNxZNVUT55yAcepdmH0vkvBVSEz0mFXg==
X-Received: by 2002:a17:902:e541:b0:1d3:ac23:b511 with SMTP id n1-20020a170902e54100b001d3ac23b511mr18414477plf.54.1703983103412;
        Sat, 30 Dec 2023 16:38:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703573741-12570-1-git-send-email-wangmy@fujitsu.com>
References: <1703573741-12570-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] dbus-cxx: upgrade 2.4.0 -> 2.5.0
Message-Id: <170398310277.873206.14396293317841968386.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107918


On Tue, 26 Dec 2023 14:55:41 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] dbus-cxx: upgrade 2.4.0 -> 2.5.0
      commit: 0739cb15d5133ab1576ebb197edacc222a14e737

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


