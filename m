Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 73517731BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:31:08 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 77so132870527ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J0UzPPGWQDnZERLf1eI4GcwXoE1rrRj8aDPhVzRDIDE=;
	b=cpjPOSWXvQ4PWCfsSTNj5gb//NukP8eiNwinBRzq8DYYBsK6U0+KGP+8zpIywx++kh
	+FvJrVmm5pVXBj0aDt39hlWD/81e7r8rhrD+it4joXh3KEFRL535j9I123lZeW0Dpcdp
	ws9fUjpNO+B3dsjuH7GC04Amn1mmS5p6UqijqwMClMWgofkamud0SNRySg54oKvEZSS0
	KxQ9NfN7W9QswlQsf3qK1RdlAIzwMSsff8pAKE8sKdMcWwRCNxcBwV+p7ElKAsFoUUSS
	OLjzS74le35JmpVlsRdtX5ct7+iYvNnC5FzIgfKm3c+1/Yx5GFBXyipzoaryhQhDo22G
	ga6w==
X-Received: by 10.107.34.79 with SMTP id i76mr27484150ioi.195.1451932269530;
	Mon, 04 Jan 2016 10:31:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 4 Jan 2016 10:30:40 -0800 (PST)
In-Reply-To: <20160104182458.GB5744@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama>
	<CAMKF1soMFt_EGLUF8T61+7BcaureScErMsDyRdc-ZxLk3x1eFA@mail.gmail.com>
	<20160104182458.GB5744@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jan 2016 10:30:40 -0800
Message-ID: <CAMKF1sob3pauwwzSkFB0fxm+hi24x47vdXSVwrG2ZZ=0kaU+EA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 04 Jan 2016 18:31:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2016 at 10:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jan 04, 2016 at 10:15:23AM -0800, Khem Raj wrote:
>> On Mon, Jan 4, 2016 at 9:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
>> >> When the host distro uses gold mariadb-native fails to build.
>> >>
>> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >> ---
>> >>  meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
>> >> index a6826c3..6a55476 100644
>> >> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> >> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> >> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
>> >>  # https://mariadb.atlassian.net/browse/MDEV-5982
>> >>  TARGET_CFLAGS += "-fuse-ld=bfd"
>> >>
>> >> +BUILD_CFLAGS += "-fuse-ld=bfd"
>> >> +BUILD_CXXFLAGS += "-fuse-ld=bfd"
>> >
>> > Unfortunately this breaks builds on older hosts with older gcc
>> >
>> > |   cc1: error: unrecognized command line option '-fuse-ld=bfd'
>> > http://errors.yoctoproject.org/Errors/Details/25859/
>> >
>> > Should we consider Ubuntu-12.04 insanely old?
>> >
>>
>> Its still maintained and supported until 2017 I believe.
>
> By Canonical yes:
> http://www.ubuntu.com/info/release-end-of-life

yeah so 2017

> but that doesn't automatically make it good distribution for OE builds, I'm playing
> devils advocate here, because most jenkins slaves I have access to are
> currently using 12.04 (that's why I've noticed this issue in first place).
>
> I was already considering upgrading them to 14.04 and people can use
> build-appliance-image if they cannot just upgrade their host distro.

It can be dropped. we have explicitly state that 12.04 may not be used
anymore. or something like
mimimum supported ubuntu/debian-like distros or so.  many large corps
have slow upgrade path. like we still carry patches
to support centos 5.x,

>
> FWIW: Poky already dropped it from SANITY_TESTED_DISTROS in Fido release:
>
> commit b528712a076ad2fd08ec8a3cbcd7aefd612d999f
> Author: Lucian Musat <george.l.musat@intel.com>
> Date:   Mon Mar 23 12:35:12 2015 +0200
>
>     meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
>
>     Added OpenSUSE-13.2, Fedora 21. Removed poky 1.6 and Ubuntu 12.04.
>
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

