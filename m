Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 987D3601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 20:23:50 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q12-v6so4631038qkl.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=27n6RNdKzk9Un21eAhb6u2LVOh5iCI75kSnX+cJsu20=;
	b=DPzZoJFCxwLbUxFmAJO5QwYcmx60MQJOdcXmq+5ftGfVn85bDAjrfWMCwPEM4O7RdV
	qJ0ACJRSJKhW5cAUZ/uSWHKQSeYXru1qObR600rBcoWrn0oUmKf2eMZ0PQnmaZnevvCr
	p2Yr3WIKgp0IrlO+xUxkaqEa7pXpjub8JXEaQL+suvJl3Z6nvYQbENXQrUcOIu+CqWIa
	zNRDeiCIh/HjrDN6dTJysMgKqnEbkIlJ98Jz2UgEu6iTT37LbLkoUuO/dj4+KKT0Am/g
	U1BzIrXAh9WSwEPhbI+ZYI7mTfnVUfruswj6QY9R0VWBL4Lj4MaNTFuPcw+zMVZWstIj
	ii9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=27n6RNdKzk9Un21eAhb6u2LVOh5iCI75kSnX+cJsu20=;
	b=X+5xeGsN9pPsjEIwwjcy+vwc8yBe7ufTPfCHKAB+4/ZyNx/U0AcYbLCQhsiKXLGGrc
	YDCgXaeCN59Ltq7zoZjubX2OnH1cgfRgaA56WOVSyNJTmuCO0RrOIaUGuIHZN+VcspUL
	f3aOd2ZceQgotsQ/4XVvJSTky2BYAAC8tfWZk3Ktl5n79uWqiSw/5GfzL0YR9EFGATab
	PNwRzezc79xCkUEE5p+bXx+SHfMNeiM9wuSB5cIYhBrZOHSG7MC0X/4uDrZAol+IbjIE
	ei7TSVWnc/JvxeAsrhYHWKYtrfOC5TiQyM7W9fd6CwU7W0BuivSxtnO8reMmRWtwCgkw
	LDzg==
X-Gm-Message-State: ABuFfojJVrhLj6RsUpkKMw1fDoLRjbfTU8g9jDYpgkVX6F8ybnjoafg1
	u6ycvxjVM3toffIPRcgqzNPaSzqjP3JdsEy0dwQ=
X-Google-Smtp-Source: ACcGV61b/2vUc+LDh+/ozVxTW6IJIyE4DBhxVZrgWjCWpY+JqJuj2XlWFsGl6iH75LlhG5R34g24+bhIpUUnHHtVkQk=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr219373qkm.2.1538166231372; 
	Fri, 28 Sep 2018 13:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180927140251.4556-1-Martin.Jansa@gmail.com>
	<20180928201454.GW594@vctlabs.com>
In-Reply-To: <20180928201454.GW594@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Sep 2018 13:23:25 -0700
Message-ID: <CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Martin Jansa <martin.jansa@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] libldb: add pam to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 28 Sep 2018 20:23:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 28, 2018 at 1:19 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> Could you explain commit 0db9697dc6b8c a little bit, where libpam became a
> distro requirement for samba itself? I'm not sure why pam is a hard
> requirement, rather than being PACKAGECONFIG option. I haven't tried the server
> ipk built with --without-pam but the client-side pieces are certainly useful.
> I've got a bbappend to override the pam forcing, and was just wondering if
> this change might be upstreamable.

its lack of fine grained packaging that this was needed. If you can
sort this out then I am all ears

>
> On Thu, Sep 27, 2018 at 02:02:51PM +0000, Martin Jansa wrote:
> > * dependency on samba was added recently in:
> >   libldb: Add samba to rdeps for pyldb
> >   so now we need to match samba restriction to prevent:
> >
> > ERROR: Nothing RPROVIDES 'samba' (but meta-oe/meta-networking/recipes-support/libldb/libldb_1.4.1.bb RDEPENDS on or otherwise requires it)
> > samba was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
> > NOTE: Runtime target 'samba' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['samba']
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libldb', 'samba']
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > index 99e62f66bb..3c7e5455e9 100644
> > --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > @@ -35,7 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
> >  SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
> >  SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> >
> > -inherit waf-samba
> > +inherit waf-samba distro_features_check
> > +REQUIRED_DISTRO_FEATURES = "pam"
> >
> >  S = "${WORKDIR}/ldb-${PV}"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

