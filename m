Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBA1CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:53:39 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8200.1755251613374691391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uLgqB27k;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce526627dso1861994e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755251611; x=1755856411; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=clVQPr6qpNVsylC6BY06lXrJBJEPsBtbcrB3ijTjmOQ=;
        b=uLgqB27kn3z+BExD3q8oDShc2Z0OAalZkX7xsHbnhnoRsy7KgAdx2yF/rT5uYAPIJ7
         iFohihGRqKeHu8fqQcKkBj5+SrAX+P9C5QKLUj/8UPmU/BeUdFgCJn3VJBNF6Nr0roeD
         8j+7JfJeaRVVoRMbxJSBhHay+iJb9A/I29zs335+ouddjHqcot5aF/C4Sts0dDLSltbr
         k2rL788lXf4FAL10UKbpDwvCM2S5jCntFPCn1pymJMqlV6u5pavrzXPkJ+y0bt4MTKA5
         7j+Wn02iEyBPxBxTETfxMdQDTldEVMzzaffxsKnj3HmCGs6qQIxUvvHFQGCJq9Zd/Bpc
         wS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755251611; x=1755856411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clVQPr6qpNVsylC6BY06lXrJBJEPsBtbcrB3ijTjmOQ=;
        b=R85AA/1kceRDem9KvHxY9fkIwSFsdLw8Ux8N4i2n8PGYXTGKKeyi8YUeoW9cfucWsY
         9OzzX/v005EjK1Yi+pbTpO4pG78kR4WIevvv8pgAc571UfXXvs9zfdVH1PesJn61Us2o
         cR2Biu50iHOXrllqSP+5rF0SOWnxUwk6yh1D/VN9i8DOl68n7mO6UpvytWlgrI/MxyvO
         XwAGC+R69N1TO3BwC8EhztWEmr32WvqKfEOUxYJgoE8Geea/dr50PZ16yUrHyWU8n/sj
         j2sbeeEX0f3HRB6m/C/qB8JAggNmQTdZ+/uYtz7cpBvLOkMAGVlLBEg4h6jQ8rV10U3N
         i6wA==
X-Forwarded-Encrypted: i=1; AJvYcCV7BkgXPHX2EiReX8G/wHXkiNLQ/5mxHiZo2kqfp1FLMHNw26tF1NGK+bR5hMU4dBxp4mK5ka1gA6cCJh/EiD6go3s=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6HqmRgwnQAL6tCtdPFMYMBsNDd3JCTJT3oVv1gSgIjtVuNQ0V
	wakZZYqjua/AfujjMOLdS0l9Pi8j/SusFfa64MXFzu25sHP1gwaYhhoB/3OYzcEkgGw=
X-Gm-Gg: ASbGncuIxHet4o7TgFstdFcOYOW7eMH0+IkqqZvvvgUQisfnPFBYLjy7TU8Vsjqsx3r
	QYQ998/w+3RWA+9ATqS1Qw+M9iZZ8qxlFVe/7bfVeqbGFsn3czvLd6roqTeYNRHOlt2qEepb9Ky
	gzM92bsze3nhAO+NONZluyuqASaYvZlTPT3s74CAQOkEJYKIGZ0GVY1DhG1aSA/5gP68upzZUPe
	lpJ5WowqS+H+yB5otIXWUOdi/YakrQLofflZ65vc9qCpinoGJ70Q9LzqWxQoayyli2Yy2LdhErp
	LOYttYxt4iBeIIvD5bjS/hipHLpZiBa6x4cNvYKASXJcfi5lbEsTq3n9Pfus4CMUM0TF7oFh6mw
	XOba1E/6BMVbxnxmoP2DzszKPdCwCT8J/skDWEtPe6hPtv6oag+o71eDwZaHw
X-Google-Smtp-Source: AGHT+IEWmToL6FT/ExFMZWQHhMJaHbg/PZ1ftbQ+Ehh0BEj0vXn/99WeGDPostJ0Ybe7DItZFUlL9w==
X-Received: by 2002:a05:6512:402a:b0:55c:e95e:cd63 with SMTP id 2adb3069b0e04-55ceeb0d748mr423015e87.30.1755251611469;
        Fri, 15 Aug 2025 02:53:31 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3525sm188231e87.108.2025.08.15.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:53:31 -0700 (PDT)
Date: Fri, 15 Aug 2025 12:53:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: alex.kanavin@gmail.com
Cc: "Marko, Peter" <Peter.Marko@siemens.com>,
	"Lau, Karn Jye" <karn.jye.lau@intel.com>,
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Message-ID: <aJ8Dmd5RBIT1vKgs@nuoska>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
 <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
 <AS1PR10MB56978F72114B25000930724BFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-kk=gwG0G2tbzW1V4ZzZy2CV5NfRRgHXzcbSkoi5hWVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-kk=gwG0G2tbzW1V4ZzZy2CV5NfRRgHXzcbSkoi5hWVA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118970

Hi,

On Fri, Aug 15, 2025 at 11:39:25AM +0200, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 15 Aug 2025 at 11:36, Marko, Peter <Peter.Marko@siemens.com> wrote:
> > This was moved from scathgap-next to scarthgap yesterday, so timing is clear
> > https://lists.openembedded.org/g/openembedded-devel/message/118942
> >
> > The successful autobuilder runs are a mystery.
> > Maybe the code throws only if the sources are not in downloads (e.g. autobuilder has these from master).
> 
> The more worrying scenario is that there was no actual build at any
> point before this landed, I hope that is not the case.
> 
> I don't object to the fixes, just want to find out where the quality
> gating process failed.

FWIW, most users of mbedtls in the Arm firmware land embed the git repo or sources
directly and don't use this recipe. This is problematic for SBOM, CVE security
handling etc but this how things are currently. Users are u-boot, trusted-firmware-a,
trusted-firmware-m, OP-TEE etc. Thus this recipe may have very few users even when
mbedtls is used in a lot of places.

Cheers,

-Mikko

