Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id B90F26D4D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 08:57:20 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so7367145lbh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 00:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=/Crg8w7dPzVKsS4T5p9V8ItiUyPL/6+kYwCt5cKIe/8=;
	b=ThJqPeiOHwP6ABhVSu8WOUuRLEw/1fgfkKDEVxPSgg1ZHnguNuCh2YKm7I3WUQkP4Y
	up8+y8iH7wivs31OeT9B5lBDgHuneOa4ubqCNWH95MU8B6m6UAaZgpNoPnj7j9cDc5pQ
	vcSeOfTsw9O9R28WmmyfkXcMdUCAyNCFErCp2aLBisA0i3xH4AWj1rWfzjtTt7Pbz322
	0LXt4MNY6TqAdvZv0SAHT6mUp6aH067l/R3nHB9kD2hNFzL8wJTqZt/9oqYHRCberu/B
	hEJinZwlon8cbmmDqpolN2lWcj8iEgGlGmucA4YCIqRYzqsHoQTujFaE8hhCsvFqjcOo
	Ecfg==
X-Gm-Message-State: ALoCoQlqIJj5P8cpNE0ghWbEq4t7owlkDfjStkIdU9NR47NXduZdNPGAfRX02XW5jKJHebei1f9i
X-Received: by 10.152.9.2 with SMTP id v2mr640250laa.40.1383728241425;
	Wed, 06 Nov 2013 00:57:21 -0800 (PST)
Received: from nexon.se (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id a9sm32134978lae.9.2013.11.06.00.57.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 00:57:20 -0800 (PST)
Date: Wed, 6 Nov 2013 10:05:12 +0100
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131106090512.GA1839@nexon.se>
References: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
	<CAMKF1sp9WfTh6qdmNc9noCq24cf=R52OOdvtqEjZU7h10Vun-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp9WfTh6qdmNc9noCq24cf=R52OOdvtqEjZU7h10Vun-A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: linaro-networking@linaro.org, "patches@linaro.org" <patches@linaro.org>
Subject: Re: [PATCH] libhugetlbfs: add support for armv7a
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
X-List-Received-Date: Wed, 06 Nov 2013 08:57:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 2013-10-28 18:42, Khem Raj wrote:
> On Fri, Oct 18, 2013 at 7:09 AM, Anders Roxell <anders.roxell@linaro.org> wrote:
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index 24480c3..4f1bfa4 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -20,10 +20,16 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
> >
> >  S = "${WORKDIR}/git"
> >
> > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> > +COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
> >
> > +python __anonymous() {
> > +    if base_contains('TARGET_ARCH', 'arm', True, False, d):
> > +        d.setVar('ARCH', 'armv7l')
> > +    else:
> > +        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
> > +}
I'm sorry for the late response.

> 
> instead of this fugly anon python you could do
> 
> ARCH_arm = "armv7l"
> ARCH ?=  "${TARGET_ARCH}"
Much better, thanks!

> 
> and btw. we support ARM v4,v5,v6 architectures as well. It seems your
> patch only cares about armv7,
> and if this recipe only works for armv7+ then dont open the floodgates
> for all kind of arm architectures.
Agree.

Will send out patch v2.

Cheers,
Anders

> 
> >
> > -EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> > +EXTRA_OEMAKE = "'ARCH=${ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> >  CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
> >
> >  TARGET_CC_ARCH += "${LDFLAGS}"
> > --
> > 1.8.1.2
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

