Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DD7C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 19:01:06 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.17672.1643223664544875668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 11:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=TeODDoAg;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.179,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f179.google.com with SMTP id g12so484249qto.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 11:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bbZrxS3zI8hkbAAN8mT524iVpkkIBncyNUJQV1g0yJ4=;
        b=TeODDoAgTF69DItVQ5ixoj5Gs7ESzRcdkR1P+8OXoFBr6nG7c1N13yoTw/L57IQAob
         OH14xrHT0cEZkObJtlwYb2VVpzeMbqKgndiY/7EFvi5hjT3X1JeAJqor74r2RxrqPCTg
         zo0mSum6GoJ3RpoaaOQVYMiYpI1/KcqGo16hIPfLJEqY1QeYI0E126Hnu6QzI2FKcorq
         Px5HLTL3MPC3c6DerOBHG0LKY6J2u4GuXBEMOq2l74V7EykMHpO4uqEjLfPlMWW/uJ8G
         0WVUfGAUWb/vSGDbxbkSrOKNZ7Ja2Wz+mtf0ZoLuRjy1vpcWJW+H/Td4fHcSFGKFh5Ya
         vYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bbZrxS3zI8hkbAAN8mT524iVpkkIBncyNUJQV1g0yJ4=;
        b=LV44UyyGziQxvApgUKwqWdzMI/sY3N38idB8iXF6PJmePG/xBcjkJXuBq1slC0D42A
         HO68tnF+J+TEM5g9O3oge3ok2Sr7H1jW5CuFOLf5RLsA8PX5s7zTbAqJKbwkEJHQ5NSN
         MWzbovIoWVSghJ+uX/mPkcQDDVLimRyjgpGYbQ/fJA3N/UiyQmrR0/KzMuJu7lGUvi33
         JUGCxKmVhpDq9dP+8BvfpJcRYAIVmokihFZtxYe0I0GPHsK+24IxZUWeDN1jVu8nzdAx
         ERsqiTax3VwGnqSgHKcDJ0R+btztmJ43kmuTLnGnEOf0tvsXshX44lC4PhNOri0saMfw
         2XBw==
X-Gm-Message-State: AOAM533wVYHDvzSFHdyo4EYJZwP26COSW0kPpdUboW2wORskdbRgDx/U
	ueA/RC7K5J7puRBlpp55qnaDiU+4o4uMqsLf
X-Google-Smtp-Source: 
 ABdhPJzPuPW1S3ZDJbLS2nsQR/rksUvRdRy0S8ghoO/Y/4GGDrj5MFgOLCn9j8hQcnO2nVw76Xjrqw==
X-Received: by 2002:ac8:5a0e:: with SMTP id n14mr97873qta.304.1643223663315;
        Wed, 26 Jan 2022 11:01:03 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id r7sm60875qtw.25.2022.01.26.11.01.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 11:01:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f169.google.com with SMTP id k14so498340qtq.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 11:01:02 -0800 (PST)
X-Received: by 2002:ac8:5e08:: with SMTP id h8mr128034qtx.82.1643223662451;
 Wed, 26 Jan 2022 11:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20220126182232.1790127-1-festevam@denx.de>
 <CAMKF1spmTzkh_egyGhyXgkfBag_eHMDZCHoaTQSPHpemo=MYbw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spmTzkh_egyGhyXgkfBag_eHMDZCHoaTQSPHpemo=MYbw@mail.gmail.com>
Date: Wed, 26 Jan 2022 16:00:51 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKoyVa0NUzghEAQSRdXOtx_Zbmov+LGYXwz04tSn09GYOA@mail.gmail.com>
Message-ID: 
 <CAP9ODKoyVa0NUzghEAQSRdXOtx_Zbmov+LGYXwz04tSn09GYOA@mail.gmail.com>
Subject: Re: [PATCH v2 meta-oe] rtc-tools: Add a recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Heiko Schocher <hs@denx.de>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 19:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95108

Em qua., 26 de jan. de 2022 =C3=A0s 15:32, Khem Raj <raj.khem@gmail.com> es=
creveu:
> > +do_install() {
> > +       oe_runmake install
> > +}

IIRC this is the default so EXTRA_OEMAKE (removing this task) would just wo=
rk.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

