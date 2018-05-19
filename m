Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD43A75155
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 02:37:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h197-v6so16557650lfg.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZSLFHtMYy9UgC8Ffl8H+le2atEzUr2RKSfsz/Ch5Jy8=;
	b=acf9hfviZeY7dQKwiV57/VlKS8K+pTRG0bbacXgTLSdvWQXVU12SKjT8mImgD7A8bw
	ZYZ6eWaxZLsCJqip6Di25i8STf05sGO9Wjrvmlz32oURXPis9tr74bwvgtNKFP9DRL+d
	d2s/XEIlu1C6cf5IRBEZzqQBboasbvS6gFp8sEsvgchl2rNg+F91OYAfFLstPAwc/rsS
	P2bWiFHqwglksOlPh3QHNpgN/XowMEDq97ciXcRxQHqD1pk6irQPJ139zML9fI2CYPRq
	KESpkx3zEX6I+ybqaat9FjtopGmEgbWhghJS+Z3/6NAlclPc8C+Ongx1F0EauV32MolV
	8dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZSLFHtMYy9UgC8Ffl8H+le2atEzUr2RKSfsz/Ch5Jy8=;
	b=Oiy2DAoW2CgjueTZRWO3BLYkrGxl1Hqlx6V++31XzbShddQznAHvAEcayybZvxZd/b
	G/Ci6nk7ijMyFZ3qwYmwNCQ7c6fcIcoOcFRh/nWBzDjWeryNUxmviwh6025OWNUW9C47
	decORAlsdL9Jy3RuZRrQ1NdCQZ5ZTzu3J0BtYtMSuuO2UmnQyrliMkDTdbHy05Ar9k3+
	T78i6MBGIOca9j0ePUHm0BB6578YkjJO/XcainMbkcyQKmbCwp4oKm6eetc1t9OeUrFh
	Dn1VYiYkvuV3HFZdx8efganRQwe2MpWhhQfx6IkCmzM12RsSo56G+xdJCR1lQU8ZAm13
	x6mA==
X-Gm-Message-State: ALKqPwdzRVN59pF9QczHbARaOo+laDz3/IRfNqyCepW03IDYrUO9ltYU
	scM83s3JMvzDv53ctYMTKE2VwVZ9ynKZdxNHOqs=
X-Google-Smtp-Source: AB8JxZpLcJ+J747VxyiNAMqV7VevjKnPLE6od6wow/GGL+pBYs4IPPDZiELajlQ1Dq7N10uDUY5UXassDynmrPaMWO0=
X-Received: by 2002:a2e:594e:: with SMTP id
	n75-v6mr6836027ljb.139.1526697453249; 
	Fri, 18 May 2018 19:37:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb48:0:0:0:0:0 with HTTP; Fri, 18 May 2018 19:37:32
	-0700 (PDT)
In-Reply-To: <CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 18 May 2018 22:37:32 -0400
Message-ID: <CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 May 2018 02:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 6:28 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, May 18, 2018 at 2:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, May 18, 2018 at 12:07 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> Hi Andre
> >>>
> >>> This series is fine, except that it has some formatting changes mixed
> with
> >>> cmake related changes. It would be preferable to have them as separate
> >>> pulls. I reckon that both types of changes are good.
> >>
> >> The formatting cleanups are all minor and probably not worth
> >> submitting on their own.
> >>
> >
> > OK thats fine, drop then in v2
>
> They are not worth reworking the patch set to create a v2 either :-)
>

It would be wonderful if we could agree on formatting; if we could, I'd
certainly help by taking on some of the reformatting task.

Unfortunately, all such past attempts of which I'm aware never got
anywhere, and if I remember correctly, the Yocto folks and the OE folks
each have their own ideas of what is "correct".

In any case, if these won't get in as is, if Andre doesn't want to spin a
v2 without the formatting changes, and everyone is okay with it, I could
spin a v2 without the formatting changes.

