Return-Path: <gizero@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id ADBFE78228
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:04:50 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id l18so1553111oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gAzx05CfUjLxO4fJzQYNVfNcCpihjtthDG1QETUmdaU=;
	b=VLlQm1TXQqGQqxgTysOWBPwUQ6YO932MPzXS9nnh7uabkgEvv5YPw9pBzEx6HP1qI4
	6spM9fRGajIhxoUwC0Vlh9HI+vkHIYszs7I9F2kThnxreGjhPffGn+63F1eoCgQmPvEJ
	YyZEq0K0ed0MYeumaJ5dimw5k7z+kxiyhRuRHLEkItb0nyVFd7fIKmjs10gb7IhG9ke7
	Jq3roSlAX99Zc34g1IOXl6HFGD1fp6mYZsWFYytNIBnzFXZpkvSFdlBB2aYZx7Upqy4A
	k3Qg0Xwc4CbrWZ135frk1H4hcsREkmT5cLYREQkchYYXYUDXTBw3Akdie5FNzpyqJePb
	QZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gAzx05CfUjLxO4fJzQYNVfNcCpihjtthDG1QETUmdaU=;
	b=gLczNfIRaT31qV0ZcjI3fYyY2vHpb7o8V2X7YNOQPo5C3aJ5gHWKtzEi8FTFYAtiMl
	ZzfpE04pkBcKZLgTeRO9/En1mbufGkmOZlODox4cLCpXgU+qLS5VS+O7vX2kNY0LELZJ
	zWtUdeYDecfmAo3KRj7mAFnPlbic1WPZBBRjaLEwzNj+CRALRqbVKHXUl5+YrPxuxL4C
	yJuJfXPCfjdttPIfTX7sHPOIw3XYYaSGtCLtLUHQ6ajPrLnAw4ZBS420f9eBz5MgV7es
	y9qCKYuyYM+o14gjwvul+tiwJ2AILUzuIt84O4Cz2tLLEj93S6oZQ1MYN4jf8965j13U
	gAFw==
X-Gm-Message-State: AODbwcCTGmDEoEe7ftpurLOBClcUgizAtAV0c3wX3Kj+MVY0rJDdqV4p
	FzdO/BOHDyQtisxwT3wHfgMzqhOX2g==
X-Received: by 10.202.44.80 with SMTP id s77mr111806ois.154.1495778691621;
	Thu, 25 May 2017 23:04:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Thu, 25 May 2017 23:04:51 -0700 (PDT)
In-Reply-To: <CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
	<alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
	<CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 26 May 2017 08:04:51 +0200
Message-ID: <CAC+thW0NcmnQXvyfEYHxY=Ko2S69cUEnc2rQd2aDk0RnnMMdPw@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Fri, 26 May 2017 06:04:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 25, 2017 at 10:44 PM, Belisko Marek <marek.belisko@gmail.com>
wrote:

> Hi Robert,
>
> On Thu, May 25, 2017 at 10:38 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> > On Thu, 25 May 2017, Belisko Marek wrote:
> >
> >> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day <
> rpjday@crashcourse.ca> wrote:
> >> >
> >> >   is there some rationale for libgpiod.bb to be the lone recipe
> >> > under meta-openembedded/meta? would that recipe not fit into some
> >> > other layer?
> >
> >> I posted few days ago recipe for libgpiod. Please look at:
> >> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-May/112810.html
> >
> >   but that doesn't really answer the question as to why that recipe
> > went into meta-openembedded/meta and not meta-openembedded/meta-oe.
> > even the subject refers to "meta-oe", so why was that recipe placed in
> > a directory named "meta"? was that perhaps a typo?
> Yes probably type. First version of patch was placed in meta-oe. My
> bad. I'll fix that but didn't get any feedback on patch yet. Thanks.
>

Your patch was already merged with the 'suspicious' path. I'd suggest
sending a new patch that moves it under meta-oe/.

