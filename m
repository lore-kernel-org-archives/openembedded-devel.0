Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDC6770A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:42:26 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so119965130ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jmVhA6dG/NdJSbDb9zztL8GnTxTE/QAl5+VwSXnaEOg=;
	b=d+vde3oykXeCnrO1FbGoLgsL4kLph5N8v2oFlQMNCAjLFagNhonglzpWzyY1lYyu0A
	ZAzmgRe3Pj/AoSJKv5vFoGOXsAqGTO9wjbiXjPBSp/LNbBkB8C4MVQMMDRipWC/Mq9KC
	X/UdYmKsseqLlg8YpSCKMLq32YhFW99pSglurRwbGJh8eiFJKYNPMc8d5LkSPvf1hp6i
	Aw8T4QH1j6AXJpkRaKLNYbVxefVO/gTsKET3uViw1WDwPe+R/8Zc/p53Gae2v5fXF9BM
	y+a943qAV6YxehrcsZHj6FHgeZ/DzTuSYbiptFmVlvw3q0g+9DAy9FYY99Ah6SFNL5jt
	41KA==
X-Received: by 10.107.34.149 with SMTP id i143mr18862176ioi.195.1443793346885; 
	Fri, 02 Oct 2015 06:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 2 Oct 2015 06:41:57 -0700 (PDT)
In-Reply-To: <CA+chaQfZ+jHfWKABvdnHxkk13SgjwY=EE_mD8OPOeFa8eqFbXw@mail.gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sojEbscxJ8hGQJ5vAES_QKd8C8TUhBtw_4_hdU+_Y6Qpw@mail.gmail.com>
	<CA+chaQfZ+jHfWKABvdnHxkk13SgjwY=EE_mD8OPOeFa8eqFbXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Oct 2015 06:41:57 -0700
Message-ID: <CAMKF1soM0xS5iEMRinGvoqsMwdrH_JHV5uncx-k-+t6LgseuwA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 Oct 2015 13:42:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 2, 2015 at 1:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi Khem,
>
> thanks for reviews and suggestions.
>
> I know how to fix most of these and I've fixed remaining components which
> are included in images I use.
>
> The problem with these is that I want to get rid of unmaintained recipes, I
> was reporting these failures multiple times in "Bitbake world status"
> e-mails and nobody cares, I was warning about more PNBLACKLISTs for last
> couple weeks.

OK I see.

>
> Being meta-oe maintainer doesn't make me responsible for fixing all recipes
> which live there, especially now when meta-oe is often used as dumping
> ground for unmaintained recipes which are pushed out of oe-core.
>

yes of course

> Yes I can spend more my free time fixing things like azy, but it wasn't
> updated in upstream in ages, nobody is probably using it (otherwise they
> would already notice it's borken, right?) and even when I fix building it
> with gcc-5 I wont spent extra time testing it in runtime, so it will
> possibly be broken and nobody will know, because again, this is old and
> nobody is probably using it (my last build which included elmdentica was
> SHR feed based on Dora release).

OK, I am all for blacklisting, even for removing them eventually

>
> If someone wants to step-up and fix those issues, it's easy to do it
> together with PNBLACKLIST removal, until that time, it's better to
> explicitly definine that it's known to be broken, because people don't read
> my "Bitbake world status".
>

Sometimes its less effort to fix now then to fix later thats why I was
providing suggesitons
but if they are unused recipes then its ok

> Regards,
>
> On Fri, Oct 2, 2015 at 4:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > * they weren't migrated from E_SVN to git and updated in ages, I'm not
>> interested
>> >   in maintaining them and nobody else volunteered to fix it
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
>> >  meta-efl/recipes-efl/efl/azy_svn.bb        | 5 +++++
>> >  2 files changed, 7 insertions(+)
>> >
>> > diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>> b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>> > index 20a4849..56a74c5 100644
>> > --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>> > +++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>> > @@ -19,3 +19,5 @@ SRCREV = "${EFL_SRCREV}"
>> >  RDEPENDS_${PN} = "${PN}-themes"
>> >
>> >  SRC_URI += "file://configure.patch"
>> > +
>> > +PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
>> > diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb
>> b/meta-efl/recipes-efl/efl/azy_svn.bb
>> > index 0c3c9d7..dec2475 100644
>> > --- a/meta-efl/recipes-efl/efl/azy_svn.bb
>> > +++ b/meta-efl/recipes-efl/efl/azy_svn.bb
>> > @@ -30,3 +30,8 @@ inherit efl
>> >  SRC_URI =
>> "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
>> >  S = "${WORKDIR}/${SRCNAME}"
>> >
>> > +# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
>> > +# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5:
>> error: reference to 'basic_string' is ambiguous
>>
>> this is more serious problem. there seems to be two implementations of
>> string object. May be you should remove including string.h in
>> pugixml.cpp
>>
>> > +#     basic_string<_CharT, _Traits, _Alloc>
>> > +#     ^
>> > +PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
>> > --
>> > 2.6.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

