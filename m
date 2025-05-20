Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D42FC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 12:20:42 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.19371.1747743633433231112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 05:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dl/v1xES;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8c0c8da93so56129066d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747743632; x=1748348432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e49uBOHmsK3InH08nvXgvJ+gHrFTgP4a3IIIEqL/au4=;
        b=Dl/v1xESKXXmUoZKFDhAUSsbz5cx9+0IsuixD7KrvtyPNQ/LirppNm8/XCMzwRpZM/
         YY6lnyHzK/lmQLRY/3UAFVf0GqqMrswwTgWJpgECYt4Qz0x8dSff64XszraN3O0NFguu
         iKSk+ZdBKpIsCLTegBd2Z1qDc5qResAqxWBXyP+BL4OG9b2zV3Lcz7THkt75Bn6BmL10
         KDchP3kg0fQaYkxnjboJ102noj3AofbCcaDambGQmsoAwuX5UZxOznZDWY6+0b/j+Zuv
         kd+G44ujglTsqYsWVeVz4mfxUp9E9lYvc6iVNI9eeUcXsSM5ZGDuXKR1vae2A+X7ElMo
         Tzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743632; x=1748348432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e49uBOHmsK3InH08nvXgvJ+gHrFTgP4a3IIIEqL/au4=;
        b=hLE1+Y0Ns7Av6O4gXsyi2X9Ui1Mi8hkpBz678QGw6jgeJ3ejiAfL0xNQqQxWH4/cOn
         KeMyMj1yiFlczWNylG/3t1Mg8DofHFYIoOgJOEBPqJtVByeR5/z1ci8e6VLsQmnBQ5Ju
         q/CzNIA6AhqgjB7NnwxhQlYF9Q4wmPG49/QNJKyyK3BWwpqIFPfQ+Myiu4l88vjKtlX9
         fV2EJApcip3X5LBNRsVg6pwU5p8uvIGoz1YuvQImIpIOYMF7fPu8rkd/fWfbsvaGMW28
         XihSB33hI6hSmH9LvkTWpmOlDA3LhYbtnpnKiPqGtdqPbUE4Ycs+IThQ+OBQxmbUbKIr
         whXA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8QfDocfd6+0eRR80Wse2YQMY4jnVR3NSf/urK/OdBdlxi5s41ayKonKEIvt8kuUpMF6s9zj4bO9hfWcXFCQQaJI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywwmdyfvwy8U6Cpjo3lE2ork7hkjqUb/I3dJ4itG1VYtYt6fjsN
	JxvfCSZu8HYDEDdVCDBw4KZqq0QeR16sNL7irXhzW+rm1ncLPJibqeb1Io8o+HE2ctYcl436xNP
	I+Qkp25GABXLebRDfz3x4p6+W6YFUu4s/4g==
X-Gm-Gg: ASbGncud9fGuTbTg12tk7p0yRxbFmQ/kvjFZAG1Q8TaJGuQ8s1uryoBT3FZoGsnl46o
	9QOczqSkLeqP4I+f5kwa1VkXjsfHwibKm3qir4Bh2gkIkHWDbxheWeno9s1BQG9x2KOsYmQqc7w
	V3qSj0bmNqn3UHjqE8iQpE7BLF7zq/jWkofanlmVuODwNC
X-Google-Smtp-Source: AGHT+IFDuhcTjQILyM3Zi11zNqxsPGRrVkW83Zsxjp28SRfZaIOTXbkvty8LoT47j5L0XtOjbm0mmWKCxY7B8zx0meY=
X-Received: by 2002:a05:6214:1cc7:b0:6e4:7307:51c6 with SMTP id
 6a1803df08f44-6f8b085282emr276396866d6.34.1747743632269; Tue, 20 May 2025
 05:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
In-Reply-To: <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 May 2025 14:20:20 +0200
X-Gm-Features: AX0GCFslInRp1OhwCxwh78pokw723wqK8OHt-D-FioQnb-V9ZD9D0BlWVoH_FNs
Message-ID: <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
Subject: Re: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
To: paul.barker.ct@bp.renesas.com
Cc: Chris Paterson <Chris.Paterson2@renesas.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117511

On Mon, 19 May 2025 at 12:11, Paul Barker via lists.openembedded.org
<paul.barker.ct=bp.renesas.com@lists.openembedded.org> wrote:
> Is an allarch package allowed to have arch-specific or machine-specific
> packages in RDEPENDS/RRECOMMENDS? And is an arch-specific package
> allowed to have machine-specific packages in RDEPENDS/RRECOMMENDS?

I think the answer is no to both, but don't have time to research an
authoritative answer. Allarch in particular seems intended for recipes
that only install data but not scripts (or, obviously, binaries).

Does the issue go away if allarch is dropped from the offending recipes?

Alex

