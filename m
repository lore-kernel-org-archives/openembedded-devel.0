Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 400D87944A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 08:34:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 185-v6so8124397wmt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AWIyvbr7BN4im27y81g2Nu6rmofb5zfG5LphLkGlAOI=;
	b=UqrWFtq8zWP7exK5mUI/K4mnUEdy0hP6TXsrmaOZu1+xWTGytjubYQtME5ESdUq0eF
	4j3DG697dPCtqDUNSZcE9daBmZ8jjLnx/NXt0Q3mTH++gXByqrecE3i0up8+3ljActYC
	8fGFaGJEklwrMi4aAAvwB1OZcokT0zeMG89ycFv0HyeECe+amABxmAcTWi1cuIxUSfSA
	epfUthMUt6tEW1vOoiQdlcpuA/1P+qDw3rLpQn/qcHRaNJl46ZwZxONBqwfip5bLCm3A
	cP4zWNU5kXC0qM43chUQCQns/CtpwWFv5h2xoFjwsRuTWpacS7S0ViKT2j2xNJubuLZK
	7iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AWIyvbr7BN4im27y81g2Nu6rmofb5zfG5LphLkGlAOI=;
	b=jcicv6mv2RnewbmAxSvplwfsX+mhRBxvRww+PPrubR/B/fN4M7ZD95oWkYhKee0f39
	YMm1cte9YEKZ8pXGq4IYfJVb8xmDTOugHGCbUYJN78mLtMg1h2fmEE/xWAVkOo9gmy62
	hKJ84khrmLGzVmGT35qg5QO+UJAWf0Wgx9P2nlPNlH95Un+M2w1fxCmXuaF1pxLo1Jt3
	wh3FKtHOzRYnQ0rVAOnuOWV2j9GeD3PHWHFNK/9Zv/6UoIfunI3o6tQS1VjpyUvsZhRc
	vWPiNf9udy9U9ZHwmiG65b8DeOXMA2y8ttsXDmUtnRBrhXPVDXgfgtI7bZKVSR+VFd4b
	w8ig==
X-Gm-Message-State: ABuFfogTS2a3VuEudZLs6d9oYcScIYcVvJ2KojVQveFV6UnHjJRmWpY2
	Vz3wxZ5+qp+ydlUYMeM29A+E/nE0BJzU9NXyCWs=
X-Google-Smtp-Source: ACcGV62COQrOB6+lgv6snzYwxUY/rHhOA2ebf4yV0oJ/PJDUMgyAyWbfnFLCY1zLYTLXG2jRQ22FjXpPJsfi4/zlgtg=
X-Received: by 2002:a1c:bce:: with SMTP id 197-v6mr3645471wml.15.1538642040654;
	Thu, 04 Oct 2018 01:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181003062422.35229-1-uvv.mail@gmail.com>
	<20181003063500.GA1336@jama>
	<CAKHfEaj6kWFN80cRooO3KrCc47nX_4kEcHFD5UaNg6zE7ipU=A@mail.gmail.com>
In-Reply-To: <CAKHfEaj6kWFN80cRooO3KrCc47nX_4kEcHFD5UaNg6zE7ipU=A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Oct 2018 10:33:49 +0200
Message-ID: <CA+chaQfYQ=SYEYa4En017CTdUBiQ60VN-c90_Om-M62V9uWBUA@mail.gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 04 Oct 2018 08:34:00 -0000
Content-Type: text/plain; charset="UTF-8"

> If there's another way to solve this, I'm all ears. BTW, ceres-solver
recipe itself has ALLOW_EMPTY_${PN} = "1" already. I believe the reason is
the same as here.

Use bitbake -g my-image-dev to find out what package is depending on
libeigen package and fix it there. Are you sure it's (only) from
ceres-solver? Isn't libeigen listed in my-image-dev as well?

Adding ALLOW_EMPTY here is just hiding the issue somewhere else. It makes
sense when the package might be empty based on some configuration (e.g.
PACKAGECONFIGs), but in general ALLOW_EMPTY is bad idea. It also allows end
user to do "opkg install libeigen" and assuming he got something useful
when it installs something, which isn't true he just wasted few bytes of
storage for completely empty package.

And when you're there you can remove ALLOW_EMPTY from ceres-solver as well
:).

Cheers,

On Thu, Oct 4, 2018 at 9:04 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Hi Martin,
> Thanks for your comment. I did see discussion in the mailing list that
> RDEPENDS_${PN}-dev is supposed to solve it, but it doesn't. To be fare, I
> tried it again now:
> - bitbake libeigen -c cleanall
> - bitbake ceres-solver -c cleanall
> - reverted my ALLOW_EMPTY_${PN} = "1" change
> - bitbake my-image
>
> After last step I got:
> ERROR: my-image-dev-1.0-r0 do_rootfs: libeigen not found in the feeds (x86
> corei7-64 core2-64 x86_64 noarch any all) in
> /home/uvv/projects/yocto-x86/build/tmp/deploy/rpm.
> ERROR: my-image-dev-1.0-r0 do_rootfs: This is often caused by an empty
> package declared in a recipe's PACKAGES variable. (Empty packages are not
> constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
> ERROR: my-image-dev-1.0-r0 do_rootfs: Function failed: do_rootfs
>
> If there's another way to solve this, I'm all ears. BTW, ceres-solver
> recipe itself has ALLOW_EMPTY_${PN} = "1" already. I believe the reason is
> the same as here.
>
> Regards,
> Vyacheslav
>
> On Wed, Oct 3, 2018 at 8:35 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> On Wed, Oct 03, 2018 at 08:24:22AM +0200, Vyacheslav Yurkov wrote:
>> > libeigen is header-only library.
>> > All headers go into dev package, therefore the main package is empty.
>> > Dependency on the dev package doesn't work, so you have to allow
>> > empty package for build to succeed for recipes that depend on libeigen
>> > (e.g. ceres-solver). Otherwise an error occurs that empty packages
>> > are not allowed.
>>
>> I still don't understand what the issue is, there is already
>> RDEPENDS_${PN}-dev = "" and similar for ${PN}-dbg.
>>
>> Creating empty libeigen package to satisfy dependency from ceres-solver
>> doesn't really fix anything (just installs useless empty package on
>> target).
>>
>> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> > ---
>> >  meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> > index 31a42a9d6..a59320655 100644
>> > --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> > +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> > @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir}
>> ${datadir}/eigen3/cmake ${datadir}/cmake/Module
>> >  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>> >  RDEPENDS_${PN}-dev = ""
>> >  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>> > +ALLOW_EMPTY_${PN} = "1"
>> > --
>> > 2.17.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>
>

