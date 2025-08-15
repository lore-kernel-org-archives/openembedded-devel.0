Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495B8CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:08:19 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.7765.1755248891195527470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCSYz5ft;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b0fa7ed37dso22920561cf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755248890; x=1755853690; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8sE5T1FOFbutVWH5Z85Iq0AqOuEvjArXLqVQPpbWog=;
        b=NCSYz5ftoDMZlr4omvBFPRDN7LeugLk8F2xMds+d1apKELj6ny/wQika1/17mAkdp3
         GERYVgPnaWvtcOpVjSA+xQCk7gUOF/8dV2Cegf7dP9xkAYYClshR3c+bQihwOk8G3GZh
         /IXYy6r6BaliUPMhlwK8FRkHRsvD4ZuInIFjUdWS6OsKgh2xe0GMwBeTEgA2sGVagrTy
         c2tDgiYcVJOuaPvGz7KCILObBWZbNvgCd1cwQqarz/0HRiK0WHGbwZx8rerGOt/xwZcm
         fY/vFt6hn2TuRJnvuIvLhF5f1V7h6hLhHXtgzXM9/c3bdAA1KVTelf2jtYpSCzsRsCqk
         8vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248890; x=1755853690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8sE5T1FOFbutVWH5Z85Iq0AqOuEvjArXLqVQPpbWog=;
        b=VhdnNVuMR785wsab6f/nsd1j1enB1T6igb40MQnbQpNLTBzrK29W6Z7Jq7zFlqDwqf
         Ql/6DptSTHMjR+TLuelFWqspvMvmo8FXLeALKgluM15j0YRj4mbGa8Cw07olp0+YkVVn
         SkwYrd6FmEC/r05ni9LPyvRUVjhnUdv9mTF9gsUxjaDcmBKz17JCGAgKBQhcy58Q6YpV
         YMdgJr5SO7x1Kix/UXu3p8On79IP6J3ATLAqUl30t2K+TwbwlRTj+r+rPcpy+vKmq0ii
         uqfc0tOhKoUtXbQUhcN2yy9SrNW36kTDvi3oEQ9Plj5UWU8Yh3q6uOohv4ektVMpVXB4
         NbnA==
X-Forwarded-Encrypted: i=1; AJvYcCVv3k4AjSu7wKqIke6WAtZlRQ9mTKGOVuyLbgg2voTExvjwmh4lDor8huOfdx5Sr20+BDAwQOEh9BFQ14khljPHdvg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YybWVjNpTYmdiAYZYsDHYpOeFlBDzJjcssmYFGY5P1WKU9fQIoR
	riZTULcN4soj9Ej3xNcyrC8d5MpB8Edk65XesOb2pQj5YMsYRp4yg0w+Pj8mG+JDkZYBoA52HGr
	cRS/G+GsEY2BLMhLlpgWQZZPFTQ4r/cA=
X-Gm-Gg: ASbGncuZsCriSbFZnftRbwL99+6XCOlQAx2c2aOmgHajOwSeR6MK6NXFh4C9yA4X2hY
	8gH2J91adqEnfemsCY8W0PzjcP/HRnbae+sn4rA9AvpmA88wuHUTioORoo+w/IfrcGLbyoU6nsS
	nHXVsxqb9ycXsogZMNFVR2596Vhxv6oYL75ypgQnI9umlBDMbvQCBoq2zAnP+BvgfGe/+NKniQT
	LDfpUALleGodvZ+LIxOf7DVbchhWqBGhziWEZsOFWP/XdfF
X-Google-Smtp-Source: AGHT+IHTPNkUDu2fwJYFoAHY7W+rXbY791nBHdWvrbx1Q+HoBiHYR5RUV5eljM7Pt+xZsddo1zJvqND0A2zjuCZ8ZSE=
X-Received: by 2002:a05:622a:1488:b0:4b0:66a3:f130 with SMTP id
 d75a77b69052e-4b10bea640cmr79489671cf.11.1755248890016; Fri, 15 Aug 2025
 02:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 11:08:00 +0200
X-Gm-Features: Ac12FXxtkNtIRuk0BVOCkeHLo-C__zGk0EvQA8QMNPra345IbD_3_cI68Tuztzw
Message-ID: <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
To: peter.marko@siemens.com
Cc: "Lau, Karn Jye" <karn.jye.lau@intel.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118962

I wonder what changed in scarthgap that this issue suddenly appeared?
This does need to be explained before any patches land.

Alex

On Fri, 15 Aug 2025 at 10:09, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Friday, August 15, 2025 8:12
> > To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
> > conflict by using SRC_URI.
> >
> > Oops, sorry for missing the scarthgap tag.
> > This is good patch, I wonder how this got through the testing.
> >
> > Unfortunately, meta-openembedded LTS branches get updates only once a month
> > so this will be broken trough then next release.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: Lau, Karn Jye <karn.jye.lau@intel.com>
> > > Sent: Friday, August 15, 2025 8:09
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > openembedded-devel@lists.openembedded.org
> > > Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
> > > conflict by using SRC_URI.
> > >
> > > Hi Peter, it may working fine in master branch
> > > but it not working at all at LTS branch for example yocto 5.0 scargapth, I
> > observing
> > > our daily build hit into this issue.
> > > Thus submitting this patch
> > >
> > > KJ
> > > -----Original Message-----
> > > From: Marko, Peter <Peter.Marko@siemens.com>
> > > Sent: Friday, August 15, 2025 1:53 PM
> > > To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-
> > > devel@lists.openembedded.org
> > > Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
> > > conflict by using SRC_URI.
> > >
> > > Both tag and SRVREV works with latest oe-core/poky master.
> > > And is actually encouraged to be used so that hash is verified against the tag.
> > >
> > > I wonder what could be wrong since this is a second patch for this recipe
> > > complaining about errors.
> > >
> > > Peter
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > > devel@lists.openembedded.org> On Behalf Of Lau, Karn Jye via
> > > > lists.openembedded.org
> > > > Sent: Friday, August 15, 2025 6:11
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
> > > > fetcher conflict by using SRC_URI.
> > > >
> > > > From: kjlau0112 <karn.jye.lau@intel.com>
> > > >
> > > > if both SRC_URI & SRCREV specify particular source revision will lead
> > > > to "Fix Fetcher failure: Conflicting revisions error"
> > > >
> > > > Fix by removing SRCREV and specify expected source revision in SRC_URI
> > > > by adding revision parmater.
> > > >
> > > > Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> > > > ---
> > > >  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4
> > > > +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > > b/meta- networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > > index 88b50a406..2591e2cde 100644
> > > > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > > @@ -23,12 +23,10 @@ LIC_FILES_CHKSUM =
> > > > "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
> > > >  SECTION = "libs"
> > > >
> > > >  S = "${WORKDIR}/git"
> > > > -SRC_URI = "gitsm://github.com/Mbed-
> > > > TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
> > > > +SRC_URI = "gitsm://github.com/Mbed-
> > > > TLS/mbedtls.git;protocol=https;branch=mbedtls-
> > > > 3.6;rev=c765c831e5c2a0971410692f92f7a81d6ec65ec2\
> > > >             file://run-ptest \
> > > >             "
> > > >
> > > > -SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
>
> Could you please keep the SRCREV and just remove the ";tag=v${PV}"?
> Adding rev to SRC_URI is not according to current standards.
>
> Peter
>
> > > > -
> > > >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> > > >
> > > >  inherit cmake update-alternatives ptest
> > > > --
> > > > 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118961): https://lists.openembedded.org/g/openembedded-devel/message/118961
> Mute This Topic: https://lists.openembedded.org/mt/114713300/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

