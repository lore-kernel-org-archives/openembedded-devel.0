Return-Path: <mike.holmes@linaro.org>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1851D60232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 16:34:43 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id g201so3000336oib.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 09:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=I8NBUr5VLI7WIgHDdmlv5KfawihyPI0MVbLCrAqNI8Y=;
	b=YJgGXN3xtzenOrJi0dyFOVO3umyr+/jeTrwonkVTirdeoVdqxju921ZSXRxqC7K/FQ
	Dw8IB55sbub2f5r99c2Q9tbSEq00e9tLk107WGrOYBkwhrhH1dOC4aPwBM/64KYeHiTA
	9YZHqn+UnJkZlmUc2pt4scDtLsFE5pPOxFxq1ABm4CRyIkQtyBCulXGnY4lGUuH1Gnu8
	7aCLsjmeF2Eu3pU3dnmSLnQj1RuNwd/pU/PK0WGy3R3s3HzC4oy3u1VptgyVfdia33KO
	fytMENKfIhUqGIBoOSEPNThDrsf3MtTmWKExl+6T/5sPbdfjnyVWhvAkb+0T1zQ0kbzs
	R1rw==
X-Gm-Message-State: ALoCoQnJllQZw4MwG5cAk7slcBqVKgPsoAHGgfFpN4Rj1D3QHLzM4Yx6FjCsaTR2f+wXd3bH0UfD
MIME-Version: 1.0
X-Received: by 10.60.45.4 with SMTP id i4mr1491470oem.78.1413995681928; Wed,
	22 Oct 2014 09:34:41 -0700 (PDT)
Received: by 10.76.68.201 with HTTP; Wed, 22 Oct 2014 09:34:41 -0700 (PDT)
In-Reply-To: <20141022162140.GJ2455@jama>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
	<20141022162140.GJ2455@jama>
Date: Wed, 22 Oct 2014 12:34:41 -0400
Message-ID: <CADz3at0DbHiEXs0bbnBaW9kFoG3Pu27eBL4VcXwd=MtW5g0n2w@mail.gmail.com>
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] add CUnit test suite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 16:34:46 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 12:21, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Oct 22, 2014 at 11:49:05AM -0400, Mike Holmes wrote:
> > Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> > ---
> >  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> >
> > diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> > new file mode 100644
> > index 0000000..e869852
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION = "CUnit is a C framework for unit testing. Test output
> supports comandline and GUI reults reporting"
> > +HOMEPAGE = "http://cunit.sourceforge.net"
> > +LICENSE = "LGPL-2.0"
> > +SECTION = "libs"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
> > +
> > +S = "${WORKDIR}/CUnit-${PV}"
> > +
> > +SRC_URI = "
> http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2
> "
> > +SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
> > +SRC_URI[sha256sum] =
> "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
> > +
> > +inherit autotools-brokensep
> > +
> > +EXTRA_OECONF = "--enable-debug --enable-memtrace --enable-automated
> --enable-basic --enable-console"
> > +
> > +FILES_${PN}-doc += "${prefix}/doc"
>
> Why doesn't it use ${datadir}/doc == ${docdir} as everything else?
>

My inexperience with OE most likely, I will try that, thank you.


>
> > +FILES_${PN}-dev += "${datadir}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
*Mike Holmes*
Linaro  Sr Technical Manager
LNG - ODP

