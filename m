Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D353E78218
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:04:53 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 77so15836501wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wDvrxK1oysgs4YcQX+A5qY9U8d2JFZW7Zks/0rM/gAQ=;
	b=EL2M5VRxZj8iIeyaHo1+9jCCXZXuGpeAu8t3ZDSknahDvsmaPIbj1uveqSX8tCFvR1
	RImRlOv7gpZy/oH6yUlJM/1n0ZCfKqN7Dg8RMVLy554OKL4SD8jGJuozp5Ini+NrMNW4
	c3gDGVPLiyFTY74qYIXGFoz+KDZ/G/SMrc5pnYEVcU5iQAUPPxF6E/0ugzsyKE4WbtB9
	3gyqB9Ef+7CgKWF3NqMR77XT7FMY19B+1tnDqDskoQSvRatsJH8g9h0I0sN9IM368SNs
	+LopPmsugaz2RvoYxm/2OmKGKpj2zdC4GdtCgGl7LUL3potYxBfYCrx9ZFdSap/o8JPh
	qXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wDvrxK1oysgs4YcQX+A5qY9U8d2JFZW7Zks/0rM/gAQ=;
	b=Zmgh49M0C37mKA27LWsR6XJeWJ3haQoiTb1g24PeBFyb9WmTydjittUVIX5et4eXLH
	qN2a1WD3u72R4BEMumDqAuMqG1+wWIpdoP/k26yrr/bwZadMXmW08uz2iKPJes0GCG0a
	8XLbVZ9eSY6u8I/nozNwQ8ZRLX9uCtqYCmpn/Qi8LWN1qZesS6T7+P1yZ7R+iTR3Ta9t
	KQ5daowa+unNJt64/wxWOujsq2aIU3Hjc1hvVbL0vgbcyQBdpY8YfL2oPmYePn1s8rsT
	G/h6H1Eirt8UvJYFfKURsz0seANf9ZZ6cFH7hNc99bXQhocYz4AWD9KKTAdHWm5yiBs8
	20jg==
X-Gm-Message-State: AKS2vOwSg1uug6KOB4lQbNUi4hD405maWoXKEdjBYcVDlbRtsIwnkxUI
	6addIrZTIK0xn69SXQ0BPgWCzFNscw==
X-Received: by 10.80.151.49 with SMTP id c46mr7115354edb.30.1498259094553;
	Fri, 23 Jun 2017 16:04:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 16:04:24 -0700 (PDT)
In-Reply-To: <20170623211459.GA28053@denix.org>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623202324.69194-3-amery@hanoverdisplays.com>
	<CAMKF1srbObwq=vu3CFniU4QCSJYVbXBX0vRKPVe8Bp+8YZtEdw@mail.gmail.com>
	<20170623205258.GZ28053@denix.org>
	<CAMKF1spD61bKRS1nAKG1PTGfzjENQ8d_Z0tFJj206=veOjDP-A@mail.gmail.com>
	<20170623211459.GA28053@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 16:04:24 -0700
Message-ID: <CAMKF1sqftov0yLS0wwKjH5xsYxG0odq5yzpvQLdPq199uej-JQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][morty][PATCH 2/6] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Fri, 23 Jun 2017 23:04:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 2:14 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Jun 23, 2017 at 02:08:06PM -0700, Khem Raj wrote:
>> On Fri, Jun 23, 2017 at 1:52 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Fri, Jun 23, 2017 at 01:46:28PM -0700, Khem Raj wrote:
>> >> On Fri, Jun 23, 2017 at 1:23 PM, Alejandro Mery
>> >> <amery@hanoverdisplays.com> wrote:
>> >> > From: Denys Dmytriyenko <denys@ti.com>
>> >> >
>> >> > The newly resurrected devmem2.c file besides having a new location, also
>> >> > updates its header, producing different checksums, which would conflict
>> >> > with any previously cached or mirrored instances. To avoid such conflicts,
>> >> > use a different filename in fetch(). Rename it back to original name at
>> >> > unpack() for devmem2-fixups-2.patch to succeed w/o modifications.
>> >> >
>> >> > WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
>> >> > File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected
>> >> > File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected
>> >> > If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
>> >> > SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
>> >> > SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
>> >> > Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
>> >> >
>> >> > WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d
>> >> >
>> >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> > ---
>> >> >  meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
>> >> >  1 file changed, 5 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
>> >> > index c42eb5e0b..c86eb2e4b 100644
>> >> > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
>> >> > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
>> >> > @@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
>> >> >  LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
>> >> >  PR = "r7"
>> >> >
>> >> > -SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
>> >> > +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
>> >> >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>> >> >  S = "${WORKDIR}"
>> >> >
>> >>
>> >> can we explore use of downloadfilename= parameter of http/ftp fetcher
>> >
>> > Sure, here are the corresponding sources where it's handled:
>> > http://cgit.openembedded.org/bitbake/tree/lib/bb/fetch2/wget.py#n65
>> >
>>
>> ah this is rightly being used, I somehow thought it was not used but
>> that actually the change above.
>> >
>> >> >  CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
>> >> >
>> >> > +python do_unpack_append() {
>> >> > +    os.rename("devmem2-new.c", "devmem2.c")
>> >> > +}
>> >> > +
>>
>> perhaps we do not need to rename it we can say do
>>
>>  ${CC} -o devmem2 devmem2-new.c ${CFLAGS} ${LDFLAGS}
>
> This is the fourth or fifth time this is being suggested. We should merge it
> already, as I'm getting tired of explaining it... :)

Thanks for being patient. may I then suggest to host the patch locally
after refreshing it against the renamed file ? upstream patch might
change and break things eventually
down the lane. This will also insulate it from such problems.

>
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113042.html
>
>
>> >> >  do_compile() {
>> >> >      ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
>> >> >  }
>> >> > --
>> >> > 2.13.0
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-devel mailing list
>> >> > Openembedded-devel@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

