Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BCEC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 06:37:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.1528.1752561453104212672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 23:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=M7CrW7tx;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5550dca1241so4588245e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561451; x=1753166251; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kt9Hjc8RT5Flm2RKg+p847IL2NJBAcvEATrclfxWcV4=;
        b=M7CrW7txgybkIT5E/wK3lm8dhoAThvkB6yTRDlUFDEccAfzOsoq5Q7QpbEuBnz/UEI
         C7aBTU70IPkCS5QcHNMFCMRZ+Qe3z/Qp0jqMAHR0OpKs/eREO1c9VuNdn4TsUHwLHMBZ
         EqjiBP3gIAUzGrfXiVB3suD5Gh96Vqe/PXGwoXqjPS0lGxkkYawEMWkNjSAOcHs3BgC3
         b/etT1VSq4DrUDwLkpZoG3BNF7Tmq4xvCOXi1WhN5sEx+uwjD9FbJHdj+0/tL0zWtLG+
         7qvD7JcyqAWTW3zlC1qfzHut8WvC6NJNvgwyrzZ4ge0Lm+iPW78L9G9HWrAKxZuxZAbt
         eMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561451; x=1753166251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kt9Hjc8RT5Flm2RKg+p847IL2NJBAcvEATrclfxWcV4=;
        b=nmw3wiB+Ij7qIE0YZW4S4kkOA5b8xy70HVPh7Uz/etGRmxVw4OmEJaEgSDJbqMDyf+
         JFXoklOGUQ2Dc/YSIH9B+tt47MnCwWzNz8V5nqrMLYv3r/tWjpRRqg3URbZ6xtsjmCaj
         Fjtb+hgk8R35uD2zrcWtA6P3hnhry/YvgL4dnxrM1X94yDIybbvgsOr7MKj3G+bSVhM6
         /ioAVAmfaPRdPNm5q6S2TZoDsVrMrHv2EMG2rmfWMAKrN24MPc5/4zo1h1xtM19p0w74
         QuD0ZiyqMRJTuVwE/kkUjLSLSYgSVUW1Q0Ut1nd2i+yGYSJuFUyn1AmmFYiQcN1HezqL
         4zSg==
X-Gm-Message-State: AOJu0YyDpWVyEGnXSs2T44mr3VoL9N2gxN4WqfytxXxZo9I9xeEvfRdH
	J4TDvRxqK+aWSry3sIxOJfe5NT/sg1KD09DczxPlGM7TCf98lgMEaDdYurW4RZgBZV4=
X-Gm-Gg: ASbGncv7VqdH/jjwUkgzXGI46YhG3KOhMVGF2+T2ALnow1G4X9fCnN/ZnY3eeCKGPm7
	56/OPWTOzx85PMk160MevddSBtgoI86pm5mzBlNJ7UqqSl9BP+VK28lUugu4Q9tDiHr79IE+ac/
	NEPKVN4b7f3K10EHp98hdjGaRD+wV1LkIQ4IRhajG21BjqoVtD0YPpypy4aqopRh7683gLBVYTu
	wnvpWbcxhIMDtLToK3qwRyByiLwEp996R/IUwrtiSt6cJLZR1Cv6/HpbzEs0WJFQc7bPMBInig2
	mdTwmqeNoRIDCVBZZt5DRDr4bpM5g0Q2NuVYNwMfq2pu0zVZkqfkH7KHEzKHbAJ2518V8iHW8Zn
	TwVkA1+fenUiMYSIjrI3jtxSyAHaEdfqCWrEVJxgG2AOZjuxJcPnx1jSAe9Xm2ryUPw==
X-Google-Smtp-Source: AGHT+IHY6EnufmPHr6urudhytmkRgK++XOBfaZ8A4kUeXLFWtqXp9NtCPxB6F5GhaCn1N/EGsXbTYQ==
X-Received: by 2002:a05:6512:10ca:b0:553:ce07:de8e with SMTP id 2adb3069b0e04-55a04644982mr4336090e87.42.1752561450833;
        Mon, 14 Jul 2025 23:37:30 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b87bcasm2172431e87.250.2025.07.14.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 23:37:30 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:37:28 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
Message-ID: <aHX3KA_qQtaTMT6C@nuoska>
References: <20250714134657.1620685-1-martin.jansa@gmail.com>
 <aHULieE55wXsyrSf@nuoska>
 <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
 <aHUUxW_rau2wEQFN@nuoska>
 <CA+chaQe+bS4PpQcEbX+-kWBviL4tk7_FYKdKfjLmd+oGCYA53A@mail.gmail.com>
 <CA+chaQd8ev4zisd8msCbuLN3_hnYY=RNrCHKVV7vQbd2=TYPNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQd8ev4zisd8msCbuLN3_hnYY=RNrCHKVV7vQbd2=TYPNA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 06:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118551

Hi,

On Mon, Jul 14, 2025 at 05:13:47PM +0200, Martin Jansa wrote:
> On Mon, Jul 14, 2025 at 5:12 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Jul 14, 2025 at 4:31 PM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > On Mon, Jul 14, 2025 at 04:00:03PM +0200, Martin Jansa wrote:
> > > > On Mon, Jul 14, 2025 at 3:52 PM Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > > > On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wrote:
> > > > > > From: Martin Jansa <martin.jansa@gmail.com>
> > > > > >
> > > > > > * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.ids but
> > > > > >   meson is searching the paths on host with:
> > > > > >
> > > > > >   # look for usb.ids in both of the Debian and Fedora locations,
> > > > > >   # and fall back to the system datadir in case we're building in a venv or prefix
> > > > > >   vendor_ids_dir = get_option('vendor_ids_dir')
> > > > > >   if vendor_ids_dir == ''
> > > > > >     vendor_ids_dir = join_paths(datadir, 'misc')
> > > > > >     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
> > > > > >       vendor_ids_dir = join_paths(datadir, 'hwdata')
> > > > >
> > > > > Isn't this the same as ${datadir}/hwdata ?
> > > >
> > > > It is the same value, but on my host, I don't have
> > > > /usr/share/hwdata/usb.ids so meson doesn't detect any existing
> > > > vendor_ids_dir value and fails.
> > > >
> > > > With this change it accepts passed vendor_ids_dir value without
> > > > testing it's existence (neither on host nor in RSS).
> > >
> > > Previous version of fwupd update patches did not include "hwdata"
> > > as build dependency so recipe sysroot did not have usb.ids file
> >
> > and previous version wasn't failing like this, it started to fail only
> > after the upgrade as
> > https://github.com/fwupd/fwupd/commit/61a863de8dd429be8c393ec267d63db78de71b76#diff-30d8f6be6320feeacf686be94f48c70869b52630e01ea625f0f15adc0d57c3e4
> > was introduced in version 2.
> >
> > The hwdata dependency added in v2 might not be needed, I guess it
> > should be runtime dependency for libfwupdplugin not build time.
> >
> > > but now it should have. Then meson.bbclass is setting datadir
> > > so I'm wondering if there is a bug in meson.bbclass or in these fwupd
> > > side scripts that they only check the host paths on not the
> > > recipe sysroot ones? Is fwupd not using the correct variables?
> >
> > Yes it checks the paths on host not in RSS as said in commit message.
> >
> > > Should the fwupd meson config actually check if the file is in
> > > join_paths(sys_root, datadir, 'hwdata')?
> >
> > Something like this might work, but not sure where you expect sys_root
> > to be defined. I see it added as a property by meson.bbclass, but
> > doing just this causes:
> > ERROR: Unknown variable "sys_root".
> 
> And if you change the meson.build like this then you would need to set
> FWUPD_DATADIR_VENDOR_IDS without the sys_root prefix, because in
> runtime it will be just ${datadir}/hwdata again.

Right, so your patch is the way out for now. Thanks for checking this!

Cheers,

-Mikko

