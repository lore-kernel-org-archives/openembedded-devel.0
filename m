Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1FDF4BB7A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:47:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29067.1771962418183500541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZsR22VG;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48372efa020so47565605e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771962416; x=1772567216; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXwAGcjQDIwRv1MhUwdXxAoG6gnO2Vy+dd6GiTy+lkc=;
        b=iZsR22VGBGYmC+cRAA4zpLwP+/XKRE3wqzz7NUJGENDTBqroknzPOkoypwKDs4LM/o
         A8TXGASYEOEiw6nfAOZzUTo0Q4GMmKeYNsnRSBoa1/qe2c88L6EtKuZRHpVrIAruyK2C
         cY3fXVwlNyE5tTygZUbwL8uha980ecyRGbGHgI+o1Od1mXYt1xh/lRSk5y67M0Qkbpf3
         8rgV6eWzHH8VNfZ6FXqMIMFXWPt04KMig0WXtlsfIyz3YQg7rn/wq/zzpgYmvZ3UW8ud
         mrQ2ysq2Lx3AbWUX05uA5wcAD2QiweUYroGT79yRa0za0xvBp8O0eJrtuMsgtvvZ5AMt
         9SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771962416; x=1772567216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXwAGcjQDIwRv1MhUwdXxAoG6gnO2Vy+dd6GiTy+lkc=;
        b=RjQ7Ald+UNqCL/cZkaP7NCz4UfOf7L0QyuqWQPJsA2XHVy1uiNNDHjsoaJVgEBAzFz
         K7zUnJBinZ2L8PjkjSdjGMmW0uoNvIY9EUQyOl4DVUDW4lQeKgDAoRfjs4+ZZ6lAjlZ3
         XFwjClF5ZaqQ0WgvKhutY8j6lU9yUc1BNJzOrmY4XMkLLZGhNjmO/cxDNF8j8YlAHiX8
         4W4ol/I2YmhB/GPFY2IE5aDouEfk4n/TGa/eCWzdBoQDNnYG2lBAzwCDH+APzgMAqoNp
         S40GP0C7uKYOoe+uuK51gNPJ04c4afM7w+h2xqCGFvJFUuMyBYO5A6qT3TYz8nNCRig5
         6yZw==
X-Forwarded-Encrypted: i=1; AJvYcCXLMA3vKsf+WSUcyo65aoBda/fnesGplyeu3n/gW9jksncR+5p2kriiYe3MOZr7OCzaGhq1jDhdVSAN3MRzbt6C4TI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+8ttIxKH3bsID/supd1T8WowkW5jThwujCEZ7gis/zOUK8HBp
	y4h5CmFyeCrcHRPa57LgRJliliOUcKbGOS4RN8e9umqLvivwGKF9Rhrz
X-Gm-Gg: AZuq6aLGrWvxXj7hPGLvQooN3IL9rOw6enHEwbptuxAI238x+pkUabWUVPDlygt+kDj
	o739WUEuVbn5G4JP6H1oxApYpA7ZqV81aODJen+FhJmxQGcHEn4Kyci0WqawwZ155kIe7+wnKzX
	unDWdkofovizWmHnHtz8ezbdISABxYT+xHgUMgYZ1a+hDsR43S2QQwVnG6IOs24NvM2G5LUcViE
	nmT7msXcpUhdSGr0FFK8UM8dQwaRygHTqUp92+89RXsX/QyAInwkaMKv/alYiMZL5As29+GaYZ7
	dOX0GwXR4aOxhewzUlwBMZDgO2+E8i2ManmyQz5I9kf5kFlkzAaTeeQcD5Z0ZAXrI1930V2Glbu
	h3pTNEdToE9/I+OgOYq6muQaxUAusIwFipC0AjN2CteVtg/CTq61HQyAV8iKN27hfatp3o/qTc0
	8sAgY4x5lHSzg9gA7Ys/K9yMbScF++C7l3bUyz3axo0Q==
X-Received: by 2002:a05:600d:1a:b0:483:b2a8:33ff with SMTP id 5b1f17b1804b1-483b2a83406mr113167155e9.4.1771962416402;
        Tue, 24 Feb 2026 11:46:56 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7031f3sm19638945e9.6.2026.02.24.11.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 11:46:55 -0800 (PST)
Message-ID: <33690966-4c3e-47ab-94eb-ce708c3ee793@gmail.com>
Date: Tue, 24 Feb 2026 20:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
 <e9706102-3c2d-4173-99ab-32116e0a49ce@gmail.com>
 <TY3PR01MB10110979EF0CC170FA92E1D319B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TY3PR01MB10110979EF0CC170FA92E1D319B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124597

On 2/24/26 09:49, Yiding Liu (Fujitsu) wrote:
> Hi Gyorgy
>
>     I  use following setting to reproduce this error.
> INIT_MANAGER:forcevariable = "systemd"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> IMAGE_INSTALL:append = " tigervnc"
>

Thanks - a bit after I sent my initial email, I noticed that it was my
user error, and was able to reproduce it.
Did you have a chance to check my last mail about this?

https://lists.openembedded.org/g/openembedded-devel/message/124440


>
> ------------------------------------------------------------------------
> *发件人:* Gyorgy Sarvari <skandigraun@gmail.com>
> *发送时间:* 2026年2月16日 04:03
> *收件人:* Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *主题:* Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
>  
> On 2/14/26 02:35, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> > Fix the following error:
> > ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets
> of ['tigervnc'] have failed. If the intention is to defer them to
> first boot,
> > then please place them into pkg_postinst_ontarget:${PN} ().
>
> How could I reproduce this?
> I added tigervnc to IMAGE_INSTALL, and built it once with systemd as
> INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to
> DISTRO_FEATURES), but the build succeeded in both cases.
> Am I missing some config step?
>
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> > index a5413a9108..12854632d5 100644
> > --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> > +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> > @@ -95,6 +95,7 @@ FILES:${PN} += " \
> >  "
> > 
> >  SYSTEMD_SERVICE:${PN} = "vncserver@.service"
> > +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
> > 
> >  CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is
> not present in the used version (1.15.0)"
> >  CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is
> not present in the used xserver version (21.1.18)"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124400):
> https://lists.openembedded.org/g/openembedded-devel/message/124400
> <https://lists.openembedded.org/g/openembedded-devel/message/124400>
> > Mute This Topic: https://lists.openembedded.org/mt/117803450/6084445
> <https://lists.openembedded.org/mt/117803450/6084445>
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub
> <https://lists.openembedded.org/g/openembedded-devel/unsub> [skandigraun@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


