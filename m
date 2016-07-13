Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 69DEC6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 22:42:14 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so2232993qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=opegLGalBzOJdYI4ITUgskqPg/dawwi3K6Td7ULkSY8=;
	b=IqG6saGsmtARGA6a/M9r0M85n4aj3ggwQfJdosUM9KV4ieIcZPuxlI2uMNfkfl6RwO
	ObAqjbAXfICRhQLniifbHcZRixvj8aiABmUziV2yQy8W4Kwuh9VkYtpKzRsvPC7TYSwA
	d1iV4m0fsWKs7xRTytUDZW/p6/oXXlXiFl4ewVluF9jfLbTiYjlEMr07aRwHfXRYkHTe
	2iJ5k1POG/abwEhlq6JQwObnla2smG7YXhI8fKrPjhlg/+VmP9oaRwRHoKaTgdfJzFKn
	zUb0MR/RlztsIvhctAatOr6smoYkjSTPVwKnbVV48D0qcFjNsfBWGc2b9rldFhJKtVDd
	881g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=opegLGalBzOJdYI4ITUgskqPg/dawwi3K6Td7ULkSY8=;
	b=TGjzfBL3SCSxxSh+6P7c19iXMcw9/FSgvsS4HHZBtlW5764muNKaTgwRceUyJ3thG6
	4m0tINWsqwrj24U9J9M3q8oVFrRGYfHdJY7YMOSzKSeOWROS1YNVB1aAZBEhoJI0nx0i
	DUX3eHCkXVNM7Zl8NLnX8Dqi0V2LgllbWElB8rxFerWrJ2b5K0UzRcsbih9rCdI9i1r4
	cKzt8AhKbwT++3KfuL8UahYr2KimZ78nDhYlcitxye20rbg35p7MrcaFwBZpiooqkESE
	CGQ4juJU5/MWE7k6duQ/zU+efEfYGrxCjqU21BmILs4BSbo4xtmLYnqjJZ2j3zhVucuh
	S8QQ==
X-Gm-Message-State: ALyK8tIgU2yyrf6/Sf1FCHNRsJMjOKVgx8prqUu5Lb7P5jcjScdCaERSO5bIoDA/Wso/Rc/gN72YJ+R1F3UB7Q==
MIME-Version: 1.0
X-Received: by 10.200.45.181 with SMTP id p50mr16219818qta.31.1468449735463;
	Wed, 13 Jul 2016 15:42:15 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Wed, 13 Jul 2016 15:42:15 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Wed, 13 Jul 2016 15:42:15 -0700 (PDT)
In-Reply-To: <3494682.OJBsBs5TlE@peggleto-mobl.ger.corp.intel.com>
References: <1467995452-30013-1-git-send-email-joe_macdonald@mentor.com>
	<20160712135845.pva3tpjpq34yxwes@jama>
	<3494682.OJBsBs5TlE@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 13 Jul 2016 15:42:15 -0700
Message-ID: <CAMKF1spL-iak6j8be4_N7U+pWOnbnyCVUEK=xVudcyeCS-9ixg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] plymouth: remove virtual prefix for RPROVIDES
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
X-List-Received-Date: Wed, 13 Jul 2016 22:42:19 -0000
Content-Type: text/plain; charset=UTF-8

Infact it is a direct replacement

On Jul 13, 2016 3:32 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:

> On Tue, 12 Jul 2016 15:58:45 Martin Jansa wrote:
> > On Fri, Jul 08, 2016 at 12:30:52PM -0400, Joe MacDonald wrote:
> > > The 'virtual' namespace is only intended to be used for build-time
> > > dependencies, not in the runtime package namespace.
> > >
> > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > ---
> > >
> > >  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > > b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb index
> de23dcd..597d8cd
> > > 100644
> > > --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > > +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f">
> > >  DEPENDS = "libcap libpng cairo dbus udev"
> > >  PROVIDES = "virtual/psplash"
> > >
> > > -RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
> > > +RPROVIDES_${PN} += "psplash psplash-support"
> >
> > This causes new NOTE in every build:
> > NOTE: multiple providers are available for runtime psplash (psplash,
> > plymouth) NOTE: consider defining a PREFERRED_RPROVIDER entry to match
> > psplash
> >
> > Do you want to update
> > meta/conf/distro/include/default-providers.inc
> > to resolve this first?
>
> Is this even the right thing to do? Is plymouth a direct drop-in
> replacement
> for psplash as this implies or (as I suspect) are there subtle differences?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

