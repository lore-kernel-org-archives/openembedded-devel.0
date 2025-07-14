Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6450C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:31:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.79551.1752503498111779551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=grU2Nacd;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5561d41fc96so4682445e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752503496; x=1753108296; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UE8fIoTx/HBzG3aW5WLtnzXpJW/YkYbsqbNPKbidkAg=;
        b=grU2NacdXbjzYzY4mvqEW5fgx96GneNLSK0bwLtGRKSqgYDN13JAGi1JIXumv5MPxq
         Rgey3BfIAtHbu4o11YVRP9Ip1QSrSqq1vILurB9gMDTMwLux5VY8ZLP5ca0UOYgz5Qrt
         Ppq6n5szVEb3Sglc0JIQVvaS5JVJQBoBWGiqW5r7vwSyIRxjXfy6UER06EQFacYYXs45
         9VGWOZsdS1cAc/0/CaosxIpHdPi/M3VgK6vLTDLCQQ771C8AwqXcuRgzkOs9iv5WRE1r
         6U2S3KYQ3C6qvM70XosOO1BR98on+I9zjICfDoSIjqIZi5c/YQLsmfa3oJIDAPJaZXhJ
         dS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503496; x=1753108296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UE8fIoTx/HBzG3aW5WLtnzXpJW/YkYbsqbNPKbidkAg=;
        b=V+AOpti4HiA3+ms8zQQtIVUwpNF2ItMI55JJ8IdPp9md/H+I+X4KDRU6jUdWsp+aQU
         hS5vFJRuY3S6dhY9uiEv8Emky3520YJeDSLkYlV3Qcu1lGBCrAnnPL2ocRg0rz/0hl+Y
         UKhmNFoHHwGTGCbej2yZjtANzu6AkTeTUby81ubU3T3weAcZl2Ix4chdo6RkpW9YAAPv
         PpySPIwX+/lpsC9r/C3Wl1yxeBMC8vaA8g+l71xGVyegFseuY7LXJ7cDWyuI5g/jPzk5
         iue6hOUU1t1r30EWOtS84bGF85iOgxhBoak0/w3YDIA8Rfc9omiK4arBg89f6Qdtp3QC
         7xxw==
X-Gm-Message-State: AOJu0Yzov05spLBQ6W7DigrdrTA1Q6cupX+VhrLWdV05W3htaSIlXR+P
	G/T05Db4KoFLf5MUesHjpNVBH7q8aosL4Cd+F0xrbbtRiKHTCz9Khs6GUutksu/35dM=
X-Gm-Gg: ASbGncs+wKYNwSOG2to5GJlDtChuSCRzHfJuUQt7n7cioQDaW67xVpEJXA6GfhMcJoB
	uJVDvjP6u73osU4Hb+iMDM+klKVG+htwJUwwLM+V7JzQjkKGSYp8VtQVVCY2q587MUPp0fNBatX
	j/720RlzoFoLnKZr7C1AXrWJhA9Kedc5zNbQB5cRICCtduptZOyOMLJ27fmtFYF7j0SvZ49oLDi
	cw+d6SPDL4XF+chJ3ZoI3MJOrDhsemMDyxNLLoK5UFvbEnCr+MUpd8wAxHxr9N+CW+J6BXiW+Mh
	TgsvpPbm0sx/HxKQ72ds+O0JUTPUUOtsfOG3wdcVCyADwUm2eXW90Y1SEDF7X5nreCfhWbf7Nd0
	6VCrb/NXWzniJzn5c0snaf8lecorljq/VKlMWAJKagyKEeo2Q7XuiAJQ=
X-Google-Smtp-Source: AGHT+IH/OcOwQZQyelw/I26sjPlguWVsnNJZF01Xn+AUv8xret0hgeUxawqPE1XQHFvWEBEg5DigxQ==
X-Received: by 2002:a05:6512:3b28:b0:553:288e:149 with SMTP id 2adb3069b0e04-55a0463a508mr3573905e87.27.1752503495838;
        Mon, 14 Jul 2025 07:31:35 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b72f3bsm1965602e87.208.2025.07.14.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:31:35 -0700 (PDT)
Date: Mon, 14 Jul 2025 17:31:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
Message-ID: <aHUUxW_rau2wEQFN@nuoska>
References: <20250714134657.1620685-1-martin.jansa@gmail.com>
 <aHULieE55wXsyrSf@nuoska>
 <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 14:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118538

Hi,

On Mon, Jul 14, 2025 at 04:00:03PM +0200, Martin Jansa wrote:
> On Mon, Jul 14, 2025 at 3:52 PM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wrote:
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > >
> > > * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.ids but
> > >   meson is searching the paths on host with:
> > >
> > >   # look for usb.ids in both of the Debian and Fedora locations,
> > >   # and fall back to the system datadir in case we're building in a venv or prefix
> > >   vendor_ids_dir = get_option('vendor_ids_dir')
> > >   if vendor_ids_dir == ''
> > >     vendor_ids_dir = join_paths(datadir, 'misc')
> > >     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
> > >       vendor_ids_dir = join_paths(datadir, 'hwdata')
> >
> > Isn't this the same as ${datadir}/hwdata ?
> 
> It is the same value, but on my host, I don't have
> /usr/share/hwdata/usb.ids so meson doesn't detect any existing
> vendor_ids_dir value and fails.
> 
> With this change it accepts passed vendor_ids_dir value without
> testing it's existence (neither on host nor in RSS).

Previous version of fwupd update patches did not include "hwdata"
as build dependency so recipe sysroot did not have usb.ids file
but now it should have. Then meson.bbclass is setting datadir
so I'm wondering if there is a bug in meson.bbclass or in these fwupd
side scripts that they only check the host paths on not the
recipe sysroot ones? Is fwupd not using the correct variables?

Should the fwupd meson config actually check if the file is in
join_paths(sys_root, datadir, 'hwdata')?

I'm fine with this change but just wondering if there is something more
missing. 

Cheers,

-Mikko

