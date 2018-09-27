Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 358AB798C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 21:29:06 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id r8-v6so3829292ljc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x7EVLwUjAnHLm5AfM0gQVVnsxuwozNa4OtykZil/PHs=;
	b=LxgWlFvnnRBhgYeKnZor3Pv2GkMsey0B5/FBEBH+JsFmmK6Qf08efnq9Pp9h+dDR3s
	f0GK9rHUfdFsaN5jG1kj/x/jP7o3ytRDug0xs5vr92tzVAuk+pRGwBuoLuYG1xoW1rBw
	0bI6wfbGrYNtEPFAvivlJoSCG7xJ7ZWZMVKXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x7EVLwUjAnHLm5AfM0gQVVnsxuwozNa4OtykZil/PHs=;
	b=NeXbUVmZJSeC3nlUlCwBMr3gVNXmoDkKjpnFoH/0O17J4pQKW6FLRD4vWc6ZvYv5gj
	JLme8KqE3pI/0v5OT1I0wen4wWCFhrT8RWqko0yq2Hae7ezCceXudZ1sv+XUKRJu5Hmb
	YINBByiqY/osq1cWRTEbB7LrbtY/49R1ua1k0HXelOSU64qBB6kKJOPUwEaTT6vIJxH/
	sEpeNiTWhHPa3TjJ2AQEJU5jVwrImBU48N5u4SgO1UNnh9YzZGpiWntl0OF8+AXYobPL
	saU8oxWmVbalwklLssamnyQPSIL8uznasV8FLK6vuIDph+hcd9JfCrYLnPcr03rX/trP
	zv+g==
X-Gm-Message-State: ABuFfogygMJx3f+odU+AT4Sty8Q8D6e6WN1XdIL5HknA9fzJ8YAHnVuD
	YPNCLQ8Ju0IaoWSnxhDI7mmm3iNIt+oz2G8Ip8ipvg==
X-Google-Smtp-Source: ACcGV60tDUaI12GBbL6iq4bUDi1d5/9U/EfJJhtLjaueWVKF5+FFXZWyLDpHOKG+b3AmU06mkTOX/ZOGLaaQaO3rMUo=
X-Received: by 2002:a2e:6598:: with SMTP id
	e24-v6mr6230970ljf.99.1538083746662; 
	Thu, 27 Sep 2018 14:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <1721109.tuLG3TFsTU@localhost.localdomain>
In-Reply-To: <1721109.tuLG3TFsTU@localhost.localdomain>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 27 Sep 2018 23:28:55 +0200
Message-ID: <CAP71WjzUkYnazb3VHzEHgEDHoRqKdOT89Waw_hAy6pRyh8=BNA@mail.gmail.com>
To: "Eggleton, Paul" <paul.eggleton@intel.com>
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] layers.openembedded.org upgraded
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
X-List-Received-Date: Thu, 27 Sep 2018 21:29:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2018 at 10:43 PM Paul Eggleton <paul.eggleton@intel.com> wr=
ote:
>
> Hi all,
>
> I'm very happy to announce that we've finally been able to upgrade the la=
yer
> index at http://layers.openembedded.org to the latest revision on master,
> incorporating quite a bit of work that's been going on for the past few
> months. Improvements now visible:
>
> * Patch tracking - each recipe detail page now lists any patches being ap=
plied
> by the recipe along with upstream status for each - see attached screensh=
ot.
> You can click through to view/download the actual patch, and any URLs in =
the
> supplemental status text are also made into clickable links.
>
> * Source tracking - remote entries in SRC_URI are now listed on the recip=
e
> detail page and made into clickable links where possible - see attached
> screenshot
>
> * Link to inc files - there is now a link in the recipe detail page to an=
y inc
> files that a recipe includes as long as they are in the same directory, a=
s a
> shortcut to see the rest of the definitions for the recipe.
>
> * Recipe list CSV export - there is now an "Export CSV" button at the top=
 of
> the recipe list on the layer detail page. This currently includes the rec=
ipe
> name and version - we could look at extending this, but note that the RES=
T API
> provides access to all of the information programmatically and may be bet=
ter
> suited for many applications that need this data.
>
> * Site-wide notice support - admins can now add notifications to appear a=
t the
> top of the page across the entire site. This is useful in the case where =
there
> is some problem with the update process or maintenance is going on as hap=
pens
> from time to time.
>
> * Bootstrap 3 - the UI has been updated to use Bootstrap 3 from version 2=
 that
> we were using previously. This has made a fairly minor difference to the =
UI
> (padding/spacing/fonts have changed a little) but has allowed us to tidy =
up a
> few things in the code.
>
> * The "Base" layer type is no longer selectable for layer submissions. I
> noticed people sometimes selected this erroneously; it's only applicable =
for
> openembedded-core and meta-oe basically so that they show up at the top o=
f the
> layer list. Only admins can now select this type for a layer.
>
> * Numerous other bugfixes, robustness improvements and code cleanups.
>
> Thanks very much to everyone who has contributed to the layer index code =
up to
> now (and to BitBake / tinfoil, which we rely upon to extract the informat=
ion
> from the metadata), but I'd like to give particular thanks to Michael
> Halstead, Yi Zhao, Konrad Scherer, Robert Yang and An=C3=ADbal Lim=C3=B3n=
 for making
> this upgrade possible.

Paul, and everyone above, many thanks for your contributions to the
Layer Index which is definitely a great tool for our community! It
encourages and simplifies reuse and sharing of all recipes! The update
looks really good, and as Andreas says, the top #3 features will make
a big difference.

>
>
> Also integrated were the Recipe Reporting System (RRS) which powers
> http://recipes.yoctoproject.org and other distro comparison support, but =
these
> will take a bit more time to properly enable so I'll send out a separate =
email
> with further details when they are ready.
>
> As always, please let me know if you have any comments or notice any issu=
es.
> (I've already seen a few minor problems in the update logs so I'll be loo=
king
> into those.)
>
> Cheers,
> Paul
>
> --
> Paul Eggleton
> Intel Open Source Technology Centre--
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

