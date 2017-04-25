Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 79925778D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:44:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y10so14513020wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uuPHfhA/Z5cVpj4mGZrIfBkELZxy2isHXk38CQ03R88=;
	b=EmWYv9iQNguSa9/6xZMZvMlzUvUpNPHn7Xh8sHIqb9cbp/WrNvcoVWreqlfbUT+0IO
	VUSbdFQR7lkliSP+Q8ibIE+hbeNsvYZnBXg6AUiCDrK92a4VurBnbZtFo9c2RJDUpp/j
	yIvG8TgBsWSHpc7COzne0CXeWMh5xh1TN5rEIMN0pthOYlPKrH1EY9WTJ90L4HcAFNWb
	XfZYhIUN8nKT4y2vDNaX+wxrepiC5dkyz5tTDho+7wUvVU6IEFk/8VyXygz4hoJHKBh/
	tNn6GzlDi6ofNeXiPvoGTc90DCefkWu1K7o0mPvn7FSsCdurbcgzfSRchY+lh6tkwG2u
	vWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uuPHfhA/Z5cVpj4mGZrIfBkELZxy2isHXk38CQ03R88=;
	b=Z24lk5zLzDvA3TX9AULzwUzvVuvlIbPoRvT0/CpRsvJKH6E7AusfIgRmT8YUgpTsoZ
	xrfxxjy7rq5sePotWr4kzAYZwjoA+EAah6OEEuP4SS9HPqdNKRyNniDSdycWwxnpKJ6b
	2XgOFKnpvKYL7bbvrDAGfndc+PHfng6GJHFlyBjEwxBRkMGOK7bF297Ql2DYWRazCQtp
	bW7dgOWBVezYGIHKEBv7RZIDkWZixk8mSWo77Jevk+zD3bXwEZj2yoryEDPtqMzHvkeO
	zfaSOlfJQkLGY2uUMxrwoRc4UbLv8QMvGGvDANaWFBJutLXdbTmdjPDfX12QR4IdBaof
	c/pA==
X-Gm-Message-State: AN3rC/7ekoTow9ffj4wtQ5Yc8Ln2t7SErmcG9H12QzRrUZ8r38gjFY8q
	bwzxf1zIBuzt1gaRuXGdnk7fcS163A==
X-Received: by 10.80.208.210 with SMTP id g18mr5383877edf.143.1493131485088;
	Tue, 25 Apr 2017 07:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 25 Apr 2017 07:44:14 -0700 (PDT)
In-Reply-To: <CA+chaQcHwO4RLYsEyu-p8_OjORrXxc26AWzMNT=D9MnzhDCB0w@mail.gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
	<20170425121114.GA28641@jama>
	<CAMKF1srVm+Db5KJnJj6Z16JhM83t1=KhWhJ_9JWJ+Ef+CZFvng@mail.gmail.com>
	<CA+chaQcHwO4RLYsEyu-p8_OjORrXxc26AWzMNT=D9MnzhDCB0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Apr 2017 07:44:14 -0700
Message-ID: <CAMKF1srGdWLsNx9CBXscBRNSTxYQZ3oKtSfe_W_iEJzALyEBTA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 01/17] musicbrainz: Upgrade to 5.1.0
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
X-List-Received-Date: Tue, 25 Apr 2017 14:44:45 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 7:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> ok, I've squashed the fix into it and added it again to master-next, with
> some of the new patches added from kraj/master branch as patchwork doesn't
> work (I've later removed the last one as it doesn't work without the glibc
> upgrade).

right. Thats why I have done it independent of autofs recipe update
since we need to hold it until we have glibc 2.26 in core.

>
> On Tue, Apr 25, 2017 at 3:32 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Apr 25, 2017 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Sun, Apr 23, 2017 at 10:20:42PM -0700, Khem Raj wrote:
>> >> Drop uclibc specific flags
>> >
>> > http://errors.yoctoproject.org/Errors/Details/141292/
>> >
>>
>> The patchset I sent yesterday has a fix for it.
>>
>> http://lists.openembedded.org/pipermail/openembedded-devel/2017-April/112514.html
>>
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb           | 7
>> >> ++-----
>> >>  1 file changed, 2 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git
>> >> a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> >> b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> >> index a6a4f6a8a..250c5f14e 100644
>> >> ---
>> >> a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> >> +++
>> >> b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> >> @@ -5,17 +5,14 @@ LICENSE = "LGPLv2.1+"
>> >>  LIC_FILES_CHKSUM =
>> >> "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
>> >>  DEPENDS = "expat neon neon-native"
>> >>
>> >> -PV = "5.0.1+git${SRCPV}"
>> >> -PR = "r1"
>> >> +PV = "5.1.0+git${SRCPV}"
>> >>
>> >> -SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>> >> +SRCREV = "44c05779dd996035758f5ec426766aeedce29cc3"
>> >>  SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
>> >>             file://allow-libdir-override.patch "
>> >>
>> >>  S = "${WORKDIR}/git"
>> >>
>> >> -LDFLAGS_prepend_libc-uclibc = " -lpthread "
>> >> -
>> >>  inherit cmake pkgconfig
>> >>
>> >>  do_configure_prepend() {
>> >> --
>> >> 2.12.2
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

