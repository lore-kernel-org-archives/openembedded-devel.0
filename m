Return-Path: <uvv.mail@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id CA54779101
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 10:25:55 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 23-v6so2969056qkh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MytGeSHDczNnkmvIGvVKOqXmo/a0Ww5HM5B2TDPmfdE=;
	b=q62UvrbuvgpZWEv8FI1P4ge0uzEgEyrFFLLhicmREUl8mfe5RiN7ystXekAAUNeLx3
	xDJNWgFzfy7ly4UNq3KN+axGAH1Fih+GB0MYp+GpTh3rM8mek0iMiDAM+a7OUd+z3CMa
	KCN2HE0BzEXOzrT8IR3FqeI1qEsttSI+M2j1p2QfIAqRZyuW/Lu/jC2x/dMStCcEpacp
	jLbz1zgmKBxGT2X1jH0qMZFG4P9xuj/yQxk5NPTxtRuB0vmUlGxLa4Bvf6JFQ4tY/R7d
	EPH+MmDj1pu5tl1bdfmag2qDMKJ5NdsFQ5h18eElb7hYy64PW4bi5C+NQg5KBvbI1Brw
	1RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MytGeSHDczNnkmvIGvVKOqXmo/a0Ww5HM5B2TDPmfdE=;
	b=t5bewgs8RMTdKneDHTsUTS6hJ/N3wBPKtZf2cSvzBcxsIdmCzkrdy7qu/8vtS1wW58
	QDepcvYr4HIYLEctp61sq3NRjyqnxl2z8rFxAjE7EjES0HKRTRjw6KvovoUriz9kehkB
	koCFkVXDSqbU+0lyxH2lVeld3JV4kA5QNhZfGuwnkkg3/NFu/03KgLEIKA41gn9Io49I
	c0uPZVAG3Kjxmm7KaGxtXCEBtb9qUjVA5jwa+U9IEZzY/VbGSA7rG9mlc2j1sTSQJst3
	0f56/GhB2bIAu6iC7aDNZBuJd5NH7fhgDOUL7JzYGnZBqwoMyMLnFq/WInBpSbZzy5lP
	Xpkw==
X-Gm-Message-State: ABuFfojtUSHa9jPuOM6QErt0qcnZPR6KWCqzdImNaSI6r7Bx8I/G6Jf3
	8h6aA5Rdj6dSQvMPkYYX7FK7FGb1ogExlXDOAJY=
X-Google-Smtp-Source: ACcGV63RKgJenjFWokTqy7V8Bgy6sVcdmBBriGsnbrQJrY6JBpA/7tX4gB/88Hz/cKqcMm8lzvcWKzeOBqYLhiJXgNI=
X-Received: by 2002:a37:3142:: with SMTP id
	x63-v6mr4447651qkx.31.1538648756535; 
	Thu, 04 Oct 2018 03:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20181003062422.35229-1-uvv.mail@gmail.com>
	<20181003063500.GA1336@jama>
	<CAKHfEaj6kWFN80cRooO3KrCc47nX_4kEcHFD5UaNg6zE7ipU=A@mail.gmail.com>
	<CA+chaQfYQ=SYEYa4En017CTdUBiQ60VN-c90_Om-M62V9uWBUA@mail.gmail.com>
In-Reply-To: <CA+chaQfYQ=SYEYa4En017CTdUBiQ60VN-c90_Om-M62V9uWBUA@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Thu, 4 Oct 2018 12:25:49 +0200
Message-ID: <CAKHfEagNT_D8Wksd5PMUQBmC_UFdxhUvzQ7dEJMXgkGjtB6wgA@mail.gmail.com>
To: martin.jansa@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libeigen: allow empty packages
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
X-List-Received-Date: Thu, 04 Oct 2018 10:25:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 4, 2018 at 10:34 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> > If there's another way to solve this, I'm all ears. BTW, ceres-solver
> recipe itself has ALLOW_EMPTY_${PN} = "1" already. I believe the reason is
> the same as here.
>
> Use bitbake -g my-image-dev to find out what package is depending on
> libeigen package and fix it there. Are you sure it's (only) from
> ceres-solver? Isn't libeigen listed in my-image-dev as well?
>

That makes sense. Indeed it was. I removed it from the image and it worked
well! Thanks for the hint. Now the only dependency on libeigen is
ceres-solver.

Adding ALLOW_EMPTY here is just hiding the issue somewhere else. It makes
> sense when the package might be empty based on some configuration (e.g.
> PACKAGECONFIGs), but in general ALLOW_EMPTY is bad idea. It also allows end
> user to do "opkg install libeigen" and assuming he got something useful
> when it installs something, which isn't true he just wasted few bytes of
> storage for completely empty package.
>

I have a bit different use case. I don't use package manager :)
But the point of having it in the image was to automatically put libeigen
into generated SDK. I checked it again, and SDK still generates properly
with libeigen-dev included.


> And when you're there you can remove ALLOW_EMPTY from ceres-solver as well
> :).
>

I will check if RDEPENDS_${PN}-dev works with ceres-solver as well. If it
does, then the patch from me will come ;)

Thanks again,
Vyacheslav


>
> Cheers,
>
> On Thu, Oct 4, 2018 at 9:04 AM Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> Hi Martin,
>> Thanks for your comment. I did see discussion in the mailing list that
>> RDEPENDS_${PN}-dev is supposed to solve it, but it doesn't. To be fare, I
>> tried it again now:
>> - bitbake libeigen -c cleanall
>> - bitbake ceres-solver -c cleanall
>> - reverted my ALLOW_EMPTY_${PN} = "1" change
>> - bitbake my-image
>>
>> After last step I got:
>> ERROR: my-image-dev-1.0-r0 do_rootfs: libeigen not found in the feeds
>> (x86 corei7-64 core2-64 x86_64 noarch any all) in
>> /home/uvv/projects/yocto-x86/build/tmp/deploy/rpm.
>> ERROR: my-image-dev-1.0-r0 do_rootfs: This is often caused by an empty
>> package declared in a recipe's PACKAGES variable. (Empty packages are not
>> constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
>> ERROR: my-image-dev-1.0-r0 do_rootfs: Function failed: do_rootfs
>>
>> If there's another way to solve this, I'm all ears. BTW, ceres-solver
>> recipe itself has ALLOW_EMPTY_${PN} = "1" already. I believe the reason is
>> the same as here.
>>
>> Regards,
>> Vyacheslav
>>
>> On Wed, Oct 3, 2018 at 8:35 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> On Wed, Oct 03, 2018 at 08:24:22AM +0200, Vyacheslav Yurkov wrote:
>>> > libeigen is header-only library.
>>> > All headers go into dev package, therefore the main package is empty.
>>> > Dependency on the dev package doesn't work, so you have to allow
>>> > empty package for build to succeed for recipes that depend on libeigen
>>> > (e.g. ceres-solver). Otherwise an error occurs that empty packages
>>> > are not allowed.
>>>
>>> I still don't understand what the issue is, there is already
>>> RDEPENDS_${PN}-dev = "" and similar for ${PN}-dbg.
>>>
>>> Creating empty libeigen package to satisfy dependency from ceres-solver
>>> doesn't really fix anything (just installs useless empty package on
>>> target).
>>>
>>> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>> > ---
>>> >  meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
>>> >  1 file changed, 1 insertion(+)
>>> >
>>> > diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>>> b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>>> > index 31a42a9d6..a59320655 100644
>>> > --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>>> > +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>>> > @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir}
>>> ${datadir}/eigen3/cmake ${datadir}/cmake/Module
>>> >  # ${PN} is empty so we need to tweak -dev and -dbg package
>>> dependencies
>>> >  RDEPENDS_${PN}-dev = ""
>>> >  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>>> > +ALLOW_EMPTY_${PN} = "1"
>>> > --
>>> > 2.17.0
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>
>>

