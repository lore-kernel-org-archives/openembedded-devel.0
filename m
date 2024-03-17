Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DB2C54E67
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 07:46:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14508.1710661592822955940
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 00:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kqIXCGm0;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33ececeb19eso1257205f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710661591; x=1711266391; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJpcbRjnXZfuF4j49QxCxk10tj8zTD2dsH9TE6RDpzU=;
        b=kqIXCGm0ee7cFr7+7QYTAPKiCGomDKefMTD1HAaQBKJCSUNaf59vLmhKaxKac6cju4
         +8oepnXpyo+D+PF1zx9B5eYTZtJ5YbBeqfMYdcAX6kYo1KjZhahTYicF6NNGpUwZFj0E
         KhivmTXxYC42hCyoBfEIutdLn4/386vRqFt+/9w68bEpjLrMjCHM9xJGpZPgfRM2ilUq
         scRFx2T6XAZKKZRi8A/YSx6mWHO8zgMu/XcRF4LuzM6tMsuWjKyuMqO1D0v5ivfqNHsD
         VC4zgGSM6qM7y+PbK+qs+EiQzXl2v4He4n0A2r21PT/0xnThJ26EeI/89SLWiMRjtn6C
         gBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710661591; x=1711266391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJpcbRjnXZfuF4j49QxCxk10tj8zTD2dsH9TE6RDpzU=;
        b=oHhmqkJzOerSBO9DMV2m8BcDsWQCabfZPcf7wDwk1yCAdZpgQ7q+YXkHy4i+2T6rrd
         kBaYuzeY6V2KwRG7G3BCFBGQZoPt+m3hFaCsXEeCXurjuYK0PgK9FFwRFCviCNlyYLfh
         d66XJBxLHhkghkfx4nlI55lGu32BX7nvuRYTxGm2TVpOgR6ZlZYFZjlRTQJndv6KEQrE
         dSdHvR6J4bDtT9znIeMVJZTAf4bKRikhbPBSjAxnZpkJIiY1rdsYU6Znz4KCw5iSViwe
         V9NjX3+WXJ651dU85gTV+UKsx5CXd/onSmh79EJQGLI+OwhBkYTdhQ3C7fJTOi/X6c3N
         vI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqftEo8dEaJtWy1uLxo6gMvYXa2O+eRSjb40r6kjyY+acolzDYZ2oP5r09wGIwpaotKUViXJvrkj5o6qdSWveP3iFwG1sTXEZFCtPUpetbMi46zKHvlizN0A==
X-Gm-Message-State: AOJu0YyEZxrpYW7xL2g+FUjUwntPCj+Jd2YwJwoaBL/N1D4VDBi11DJs
	LCKFAGZkrgc00P18NXKCe3XCvfbj9a+uxYV19MQ3F+8+MBfGtX3LjDUXjdCSDv5FbPvK8fV4Oyj
	jxtMMXbrfI1xis4l8qDQu9p0DsVQ=
X-Google-Smtp-Source: AGHT+IFb8O2C78H2YbJathutMUSFPoVV96LIow1V161XjWMgpGEZbtMuSsnk03GXGVzenlANXmsVnLtIx8us6iybSP8=
X-Received: by 2002:a5d:4acf:0:b0:33e:7dc1:ff53 with SMTP id
 y15-20020a5d4acf000000b0033e7dc1ff53mr4657351wrs.16.1710661590940; Sun, 17
 Mar 2024 00:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com> <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
 <CACA7eUS-t+wCoW2Pv8P4CFAhp3LzZnRNU7ytQAGN7=xuTwmAxg@mail.gmail.com> <0bd7c695-e03d-4845-9172-54a574630705@denx.de>
In-Reply-To: <0bd7c695-e03d-4845-9172-54a574630705@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Mar 2024 08:46:19 +0100
Message-ID: <CA+chaQdg+Qz2RVBS3jc16=WhNPBzRGEcV2RURzOcuFJTuTfjJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Marek Vasut <marex@denx.de>
Cc: Christophe Chapuis <chris.chapuis@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 07:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109377

The extra -I flag won't harm even when libdrm isn't there.

lvgl-demo-fb also doesn't do it conditionally based on drm PACKAGECONFIG.

If someone want's to fix this properly then should also use pkg-config
(and tests/FindLibDRM.cmake in the lvgl repo), but lets not block this
fix based on that.

This whole issue is just revealed by the typo fix in
https://patchwork.yoctoproject.org/project/oe/patch/20240316100056.409758-1=
-chris.chapuis@gmail.com/
which fixed lv-conf.inc to work for lvgl resulting in LV_USE_LINUX_DRM
being respected based on PACKAGECONFIG drm.

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Sun, Mar 17, 2024 at 6:45=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 3/16/24 10:55 PM, Christophe Chapuis wrote:
> > It could be conditional eventually; I just took the line from lvgl-demo=
-fb,
> > where it wasn't.
> >
> > Ideally, both should be moved in lv-conf.inc, where the lvgl drm settin=
g is
> > activated. But I didn't want to expand again the scope of this patchset=
,
> > initially focused simply on adding some variables to lv-conf.inc.
>
> I think I will just defer that decision to Khem.
>
> My concern is that a system with SDL or fbdev backend may not have
> libdrm available, so I think it should be conditional.
>
> I think this will handle that concern:
>
> TARGET_CFLAGS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'drm',
> '-I${STAGING_INCDIR}/libdrm', '', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109376): https://lists.openembedded.org/g/openembedde=
d-devel/message/109376
> Mute This Topic: https://lists.openembedded.org/mt/104964303/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

