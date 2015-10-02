Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id B9EEE7708C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 08:20:35 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so20786556wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 01:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0aFOIUI3EGNzXMxmSPehc04wJ35Cl5W9D0nlVIfDGd0=;
	b=YbZCly7S8Ub3F7AMOA3t59iXs67EP+sHHZWFxDhMmxQx24DRnAV3J2eTi3y4hEYO/v
	qlzVfHqDysxWGZsC+AO1ezZO2EEozP69wSFqhbHin4XKbqFhiqQ2aOM5+BX3CeqfthyL
	fCHtnxvo6uAd88byH5wPQ/HkSt4ySRDGElrJBK7CerWEEnRWqabyhnAnqypkeJbGhhQ7
	uxV7NaKLX6Dl8u3tEgozQ3t+mIKlR0oXwN9crpEQeqZVN6OYEs+fD6jB5rErTSEfyBfw
	H8hPYhugytlv+q7ISlm3zJ/Nt3rU7r57jOoHcTciN0nmngl3DMxyZMHX0uVooMKljab+
	fgBQ==
MIME-Version: 1.0
X-Received: by 10.180.198.109 with SMTP id jb13mr3020787wic.17.1443774035190; 
	Fri, 02 Oct 2015 01:20:35 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Fri, 2 Oct 2015 01:20:35 -0700 (PDT)
In-Reply-To: <CAMKF1sojEbscxJ8hGQJ5vAES_QKd8C8TUhBtw_4_hdU+_Y6Qpw@mail.gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sojEbscxJ8hGQJ5vAES_QKd8C8TUhBtw_4_hdU+_Y6Qpw@mail.gmail.com>
Date: Fri, 2 Oct 2015 10:20:35 +0200
Message-ID: <CA+chaQfZ+jHfWKABvdnHxkk13SgjwY=EE_mD8OPOeFa8eqFbXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe 08/10] elmdentica, azy: blacklist because they are old and fail to build with gcc-5
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
X-List-Received-Date: Fri, 02 Oct 2015 08:20:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

thanks for reviews and suggestions.

I know how to fix most of these and I've fixed remaining components which
are included in images I use.

The problem with these is that I want to get rid of unmaintained recipes, I
was reporting these failures multiple times in "Bitbake world status"
e-mails and nobody cares, I was warning about more PNBLACKLISTs for last
couple weeks.

Being meta-oe maintainer doesn't make me responsible for fixing all recipes
which live there, especially now when meta-oe is often used as dumping
ground for unmaintained recipes which are pushed out of oe-core.

Yes I can spend more my free time fixing things like azy, but it wasn't
updated in upstream in ages, nobody is probably using it (otherwise they
would already notice it's borken, right?) and even when I fix building it
with gcc-5 I wont spent extra time testing it in runtime, so it will
possibly be broken and nobody will know, because again, this is old and
nobody is probably using it (my last build which included elmdentica was
SHR feed based on Dora release).

If someone wants to step-up and fix those issues, it's easy to do it
together with PNBLACKLIST removal, until that time, it's better to
explicitly definine that it's known to be broken, because people don't read
my "Bitbake world status".

Regards,

On Fri, Oct 2, 2015 at 4:26 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * they weren't migrated from E_SVN to git and updated in ages, I'm not
> interested
> >   in maintaining them and nobody else volunteered to fix it
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
> >  meta-efl/recipes-efl/efl/azy_svn.bb        | 5 +++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> > index 20a4849..56a74c5 100644
> > --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> > +++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> > @@ -19,3 +19,5 @@ SRCREV = "${EFL_SRCREV}"
> >  RDEPENDS_${PN} = "${PN}-themes"
> >
> >  SRC_URI += "file://configure.patch"
> > +
> > +PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
> > diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb
> b/meta-efl/recipes-efl/efl/azy_svn.bb
> > index 0c3c9d7..dec2475 100644
> > --- a/meta-efl/recipes-efl/efl/azy_svn.bb
> > +++ b/meta-efl/recipes-efl/efl/azy_svn.bb
> > @@ -30,3 +30,8 @@ inherit efl
> >  SRC_URI =
> "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
> >  S = "${WORKDIR}/${SRCNAME}"
> >
> > +# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
> > +# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5:
> error: reference to 'basic_string' is ambiguous
>
> this is more serious problem. there seems to be two implementations of
> string object. May be you should remove including string.h in
> pugixml.cpp
>
> > +#     basic_string<_CharT, _Traits, _Alloc>
> > +#     ^
> > +PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
> > --
> > 2.6.0
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
>

