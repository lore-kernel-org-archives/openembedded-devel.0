Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id CF4D27E447
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 09:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id 7293528FD07
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
In-Reply-To: <CA+chaQeeZFnAAUbGFGHgypBF-O53pv1Gv7q8ZmjiOH95D5Wksw@mail.gmail.com>
References: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
	<CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
	<20190929124049.GB30130@localhost> <87ftkf9ery.fsf@collabora.com>
	<CA+chaQeeZFnAAUbGFGHgypBF-O53pv1Gv7q8ZmjiOH95D5Wksw@mail.gmail.com>
Date: Fri, 04 Oct 2019 12:53:01 +0300
Message-ID: <87ftk8kfb6.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] renderdoc: add new recipe
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
X-List-Received-Date: Fri, 04 Oct 2019 09:52:59 -0000
Content-Type: text/plain

Hi

On Fri, 04 Oct 2019, Martin Jansa <martin.jansa@gmail.com> wrote:
> This should have x11 in REQUIRED_DISTRO_FEATURES to fix:
>
> ERROR: Nothing PROVIDES 'libxcb' (but
> meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb DEPENDS on or
> otherwise requires it)
> libxcb was skipped: missing required distro feature 'x11' (not in
> DISTRO_FEATURES)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'renderdoc', 'libxcb']

v4 of this patch was merged into master. I will send a new patch to add
the change you suggest. Thank you!

>
> On Sun, Sep 29, 2019 at 7:46 PM Adrian Ratiu <adrian.ratiu@collabora.com>
> wrote:
>
>> On Sun, 29 Sep 2019, Adrian Bunk <bunk@stusta.de> wrote:
>> > On Sat, Sep 28, 2019 at 12:48:10PM -0700, Khem Raj wrote:
>> >> On Fri, Sep 27, 2019 at 9:56 AM Adrian Ratiu <
>> adrian.ratiu@collabora.com> wrote:
>> >>...
>> >> > --- /dev/null
>> >> > +++
>> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
>> >> > @@ -0,0 +1,48 @@
>> >> > +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00
>> 2001
>> >> > +From: Adrian Ratiu <adrian.ratiu@collabora.com>
>> >> > +Date: Wed, 25 Sep 2019 19:31:14 +0300
>> >> > +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag
>> unsupported by GCC
>> >> > +
>> >> > +-Wno-unknown-warning is not supported by GCC, only by Clang so we
>> >> > +remove it because newer GCC versions like 9.2.0 will complain, older
>> >> > +versions would just ignore it.
>> >> > +
>> >> > +Upstream-Status: Pending [
>> https://github.com/baldurk/renderdoc/pull/1530]
>> >> > +
>> >>
>> >> gcc9 does support -Wno-unknown-warning perhaps you want
>> >> -Wno-error=unknown-warning
>> >>...
>> >> > +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
>> >> > +
>> >>
>> >> this option is GCC specific mark it
>> >> TARGET_CFLAGS_append_toolchain-gcc
>> >>...
>> >
>> > Using -Wno-error always could solve both problems,
>> > and would also avoid similar problems in the future.
>>
>> That's a good idea, however I can't pass directly -Wno-error in the
>> recipe because of how the top-level CMakelists.txt is written: it always
>> *appends* -Werror to the flags, so it overwrites our -Wno-error.
>>
>> A better solution which has the same effect is to use
>> -DCMAKE_BUILD_TYPE=Release which prevents -Werror being appended at all
>> in the top-level CMakelists.txt (there is no other effect than this!)
>>
>> Thanks! Will send an updatet v4 soon.
>>
>> >
>> > cu
>> > Adrian
>> >
>> > --
>> >
>> >        "Is there not promise of rain?" Ling Tan asked suddenly out
>> >         of the darkness. There had been need of rain for many days.
>> >        "Only a promise," Lao Er said.
>> >                                        Pearl S. Buck - Dragon Seed
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

