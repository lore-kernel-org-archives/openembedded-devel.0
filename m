Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3277361081
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 16:13:02 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u124so2738422qkh.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 08:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pLlaPOFOBrTppngiSV8i+XD0sFI2e0UP/S3YO9GY+QU=;
	b=Uu4/6jGY90tc1eoIkBX8e4Q/BvDU81nwg+GNsRuY03oIvqcOq6eImTvFn+FcfXjS8r
	SgS3eJQdSPZRazLaP25XOSQjQaEBOvPTzSbfP32iItksmUkGmPEInhyheAiQdeFRb8p9
	Pwpipclw9kr0Y2OLuYU+4xfFHIbmP6+XK3KAOn3JxEvhjfyu/CJHiyPdv+FU3V/FEAFC
	ZPjQ6/5LMdHlD7BECHTZBll6nyoWgj3oieb+7TujmgcTqN2MJKHayryxWW1BlkmT1HXE
	wtj/62F4aUUImYBapEbMBi1b/6XUkgSu5lJW88kWtONhUr8bQS0NpoaNV7qrUi5twiC+
	BQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pLlaPOFOBrTppngiSV8i+XD0sFI2e0UP/S3YO9GY+QU=;
	b=SN2mW+cME494sAQ8KzX0V/HpSd/Vsck9GQQNzay7XfeciaowYWqnXRZK0MDBsyXZSy
	6VWLXbHUwsMXBlaQSS5kAjfCRvw7b9gP0Rsd8pGMFn6JbnMxhO4OBy2bWCMo8smc5VjC
	zheGTlm3VWhpCov/5VRHcs9fObQ5thD0Bxhf0UdVEZF22/YprSjz7LWC/VzqmZ3FPilH
	9AARBk56JP/qukCFVtWvzCj5AwWpc2m5M1q1GtK7n3LCK4xww685UkrCnq16ZimYhJVC
	6fWW0Uh9ID5rlD/6BGhk5XUA+Amy2sDikQVlUeAnSpPWFlVA3HyCrbc04Q0n0RJCc8RT
	fYHA==
X-Gm-Message-State: ANhLgQ3FSdC/5xN/3ItXKibi6HGyaIJ0ltzGNeE57esBR2+PPB7myGg5
	Dd5gozng72Ru2+F+n4Qvsn2/TxpXc4BxGhS1wZY=
X-Google-Smtp-Source: ADFU+vsQ5/DrM9BhsEN/D9VS8mbgrVOsJXLEoVGR4P6jQgsoY+5Udu1utL0UKIfuX/LuL/pqAaVvl9cG+PMkoaAgNHw=
X-Received: by 2002:a05:620a:22b:: with SMTP id
	u11mr3584158qkm.225.1583511183535; 
	Fri, 06 Mar 2020 08:13:03 -0800 (PST)
MIME-Version: 1.0
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
In-Reply-To: <CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Mar 2020 08:12:51 -0800
Message-ID: <CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Fri, 06 Mar 2020 16:13:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Can we fix mozjs instead?

perhaps thats better fix, maybe it can made optional via packageconfig ?
or marked incompatible if meta-python is not included
>
> On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com> wrote:
>
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > yocto-check-layer/test_world failed since error:
> > ERROR: test_world (common.CommonCheckLayer)
> > ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
> > /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
> > DEPENDS on or otherwise requires it). Close matches:
> >   python3-numpy-native
> >   python3-pycairo-native
> >   python3-rpm-native
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> > 'mozjs', 'python3-pytoml-native']
> >
> > mozjs depend on recipe under meta-python, but meta-python
> > isn't in LAYERDEPENDS, so error occurred. Fix by add
> > it into LAYERDEPENDS.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta-oe/conf/layer.conf | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> > index c537736..0ce0ad2 100644
> > --- a/meta-oe/conf/layer.conf
> > +++ b/meta-oe/conf/layer.conf
> > @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
> >  # cause compatibility issues with other layers
> >  LAYERVERSION_openembedded-layer = "1"
> >
> > -LAYERDEPENDS_openembedded-layer = "core"
> > +LAYERDEPENDS_openembedded-layer = " \
> > +    core \
> > +    meta-python \
> > +"
> >
> >  LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

