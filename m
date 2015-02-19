Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 62332735FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 18:15:18 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so1933692iec.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 10:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=viv0DKUQQPazKHld1S9QgMNhHBrtfBkY+r35rCDtv8w=;
	b=Z4aHIknB9fXjWfGIKf4AypMCwZPfh/apPmgF2BaNmpaoPSsSYjBako8Ao5MY/DDUss
	CG0af1O1RHMjzvUapWu1BOb2BB0EKOSK9I24oiwlyMUODzadVU+Au0aCJHbtdBVTS7WZ
	LCl7FZY554wE7HV887QdH4Enc0z/w0hhetIXNM9RkZHAerSG1N21qz9OCksxnHV1+4yg
	q9Iwb8/90IBEenZjYY2g2ql/lRxVK1UCorCze7JqOJL3nrkWNsGgsCEGAYYgOrc+vpzc
	u8MgyR6+Rk1028BJPr8IblsE7GFln8rpDWuAkCVMJi0JqjhgGEer3Ctqb1mzU2JEGWUX
	MnTg==
MIME-Version: 1.0
X-Received: by 10.107.19.89 with SMTP id b86mr7822335ioj.35.1424369719167;
	Thu, 19 Feb 2015 10:15:19 -0800 (PST)
Received: by 10.36.78.16 with HTTP; Thu, 19 Feb 2015 10:15:19 -0800 (PST)
In-Reply-To: <20150219181010.GH2311@jama>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
	<1424300622-28832-3-git-send-email-ben.shelton@ni.com>
	<CADkTA4Mi8UaK=fKfG17AC353sBxmfkr8aF4edA1btsStVbB98A@mail.gmail.com>
	<20150219172141.GF2311@jama>
	<CADkTA4P9T5gW4b6QoBmieJpTSHn6ShBTtwjvEcOj_UbpVrnXqw@mail.gmail.com>
	<20150219181010.GH2311@jama>
Date: Thu, 19 Feb 2015 13:15:19 -0500
Message-ID: <CADkTA4N_cmqHVYGF+dRFGJr+CqegCAQKLTPoPTWj+5XxzdrY-A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 3/4] python-msgpack: add recipe
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
X-List-Received-Date: Thu, 19 Feb 2015 18:15:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 1:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 19, 2015 at 12:42:49PM -0500, Bruce Ashfield wrote:
>> On Thu, Feb 19, 2015 at 12:21 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, Feb 19, 2015 at 12:09:09PM -0500, Bruce Ashfield wrote:
>> >> On Wed, Feb 18, 2015 at 6:03 PM, Ben Shelton <ben.shelton@ni.com> wrote:
>> >> > python-msgpack implements the MessagePack binary serialization format
>> >> > for Python.
>> >> >
>> >> > Copied from commit 91ed2353847d4121e3dd8ad10ca0c24194ac9765 in
>> >> > meta-cloud-services/meta-openstack and updated to version 0.4.5.
>> >>
>> >> Can you elaborate on what is the use case for these recipes being cherry
>> >> picked ?
>> >
>> > It was discussed on IRC yesterday, the use case is simple. Some project
>> > needs couple python-* recipes and they happen to be available in
>> > meta-openstack now.. so instead of adding dependency on whole
>> > meta-openstack which has unwanted side-effects and a lot of stuff they
>> > don't care about they move 4 recipes to meta-python.
>>
>> Is there an IRC log someone can point me at ? IRC is an incredibly bad
>> medium for looking up an old discussion. Sorry for not seeing it!
>
> http://infobot.rikers.org/%23oe/20150218.html.gz

perfect!

Now I'd like to find out which bbappends are causing the problem. I guess
I'll ping the originator to find out details.

Cheers,

Bruce

>
>> Can someone also elaborate on 'unwanted side effects' ? Sounds like
>> a bug, and something that can be fixed. Yanking recipes, not emailing
>> the originators and citing bugs/issues without details .. really isn't a
>> great way to foster collaboration and generally improve the ecosystem.
>>
>> Again .. that's all that I'm saying. There's no harm in taking the extra
>> time to document things a little bit, and offer explanations.
>>
>> That's a valid reason for a move, but what I'm really asking for is
>> that to be in
>> the commit messages, and a description of the user. Having the floating
>> set of recipes without a way to know how they are used and tested is
>> going to cause a giant mess.
>>
>> >
>> >> If they are simply being moved "because they are python' .. that is annoying,
>> >> and causes pain for dependent layers that have specific version dependencies.
>> >
>> > They are moved before different projects need them and meta-python is
>> > best project-agnostic layer for python recipes.
>>
>> No debate there. But again, we should simply log the reason in the original
>> commit. There's no reason to lose that information to IRC and everyone's
>> fading memory.
>>
>> >
>> >> I'm going to have to pin nearly all versions in the openstack layers and keep
>> >> duplicate recipes around, so since I'm suffering that overhead, it would be nice
>> >> if we could elaborate on the technical gain from doing this.
>> >
>> > You don't need to pin it if your layer has higher priority.
>>
>> Yah. Paul mentioned that. I'll do that for now, since there will be
>> times that the
>> openstack variants are newer than the ones in meta-python, and that will
>> handle both use cases.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> >> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
>> >> > ---
>> >> >  .../recipes-devtools/python/python-msgpack_0.4.5.bb     | 17 +++++++++++++++++
>> >> >  1 file changed, 17 insertions(+)
>> >> >  create mode 100644 meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
>> >> >
>> >> > diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
>> >> > new file mode 100644
>> >> > index 0000000..206b03d
>> >> > --- /dev/null
>> >> > +++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
>> >> > @@ -0,0 +1,17 @@
>> >> > +DESCRIPTION = "MessagePack (de)serializer"
>> >> > +HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
>> >> > +SECTION = "devel/python"
>> >> > +LICENSE = "Apache-2.0"
>> >> > +LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
>> >> > +
>> >> > +PR = "r0"
>> >> > +SRCNAME = "msgpack-python"
>> >> > +
>> >> > +SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>> >> > +
>> >> > +SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
>> >> > +SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
>> >> > +
>> >> > +S = "${WORKDIR}/${SRCNAME}-${PV}"
>> >> > +
>> >> > +inherit setuptools
>> >> > --
>> >> > 2.3.0
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-devel mailing list
>> >> > Openembedded-devel@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

