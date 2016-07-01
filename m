Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 001036012C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:44:40 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id a5so27549316ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=hbqCrNRSYEHP4UadaIKGnhgu7kF/f7MiCNk0wbW8UQo=;
	b=h/q0Hr+IDf+TuvxctVvZjCM7n/h0EZ70zKdfyS9Sr8IpSmBExSmJL20+znOySoQyS1
	Nn7Er3BzYa5pfRxDi19b4A/wk8rO2QZ7v2ARj4wvB71uVbyp/rvofFkn39BBOuoBElmZ
	UNdMko1lnVfjcqBzIkgtlXqrlJQunrChhhkH90OGcGUZ3r0ozngHm91bf5vIbT+ksB+v
	CsNTB8z+25XWSA9dtqIPgpyeKw0CFWQJBhSM0/LNClcfn1o3bVsLmsHuwPOinQg6U0/f
	yim8GlXYGRJl73bCADFflGVcSITihO9JCKwQpDlHp9nKHugfKhQY/o61tn8UfKoTjesv
	04/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=hbqCrNRSYEHP4UadaIKGnhgu7kF/f7MiCNk0wbW8UQo=;
	b=kv4xaqCivJiaT+XdKGNOSAgtsxf8hu1Sf+KO5nwym5sCIPNkNlwt1Zobz03iVaZwF/
	qZ+r2BXG3jQLB4LiQAAmy7K1/xCk7XkkRpRFLNHXSjMCse2ojru6xK6M0QGL7Z2oTbqa
	DPVVWdao3YHRqIGlOLlyTpCZ7rBbYy3vSuqEyp/XBy8iScJ3RDNSiMrHR0c6/NsJSe3Z
	ACFKDOcewuVd63bc09YxLN3A+xY4jTochE5eZmMLl9bBaAmMxlkIsFQ2Z19liVoeXlo8
	li/2oyn5jvVaGl8hQZhs/AZbTk22n2ulovkLZXh8lnLVUhHq7Y/6o8bIz++2AnKx0rjs
	+SIg==
X-Gm-Message-State: ALyK8tIWKfhZe8fYWv0V+DyUgUgENSexw7TNavZq3SdWnurxHewJdB9RqoCB/pbVh7CfjyqRZktUFEIk9SLq7w==
X-Received: by 10.36.216.5 with SMTP id b5mr156855itg.19.1467405881176; Fri,
	01 Jul 2016 13:44:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Fri, 1 Jul 2016 13:44:21 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84A6F8DED5@ALA-MBB.corp.ad.wrs.com>
References: <1467316002-12489-1-git-send-email-jslater@windriver.com>
	<CABcZANnH_85yL9=_VBfwsuFTivqK+VbW5zyz=aoXvTA5a3k1Lw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84A6F8DED5@ALA-MBB.corp.ad.wrs.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 1 Jul 2016 13:44:21 -0700
X-Google-Sender-Auth: cN60yXC4zevNWdRv_2XzD2qTK0U
Message-ID: <CABcZANmFkGOLJRfuya=EZ=YngjBoxtQdo8qbHt_Au6gC1uJAaQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG certain dependencies
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
X-List-Received-Date: Fri, 01 Jul 2016 20:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 1:25 PM, Slater, Joseph <joe.slater@windriver.com>
wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> > Sent: Thursday, June 30, 2016 10:13 PM
> > To: Openembedded Discussion
> > Subject: Re: [oe] [meta-networking][PATCH 1/1] openconnect:
> PACKAGECONFIG certain
> > dependencies
> >
> > On Thu, Jun 30, 2016 at 12:46 PM, Joe Slater <jslater@windriver.com>
> wrote:
> >
> > > +PACKAGECONFIG ??= "gnutls lz4 libproxy"
> > > +
> > > +# config defaults
> > > +PACKAGECONFIG[gnutls] = ",--without-gnutls,gnutls,"
> > > +PACKAGECONFIG[lz4] = ",--without-lz4,lz4,"
> > > +PACKAGECONFIG[libproxy] = ",--without-libproxy,libproxy,"
> > > +
> > > +# not config defaults
> > > +PACKAGECONFIG[pcsc-lite] = ",--without-libpcsclite,pcsc-lite,"
> > >
> >
> > Why are the options not being passed for the enabled case, here? We
> prefer
> > to be explicit, rather than relying on defaults.
>
> I can easily add them.  I left them out because configure help only
> mentions the --without
> options to override the defaults.


It'd be best to add them, then we're explicitly specifying what we want,
and potentially avoid issues if the upstream default behavior changes
during an upgrade in the future.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

