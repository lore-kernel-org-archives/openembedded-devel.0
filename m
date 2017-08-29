Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7765878250
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:11:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 83so1535668pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 18:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OliWBYThGwhZjDXGvK2X2+i2SPu2mz4EQLaiFxNQiIk=;
	b=ACjTC9cbwTMbR60O9uyecg3ENbStJulBRy+ijm2wFplJywnMtS3lEXnz9HauDMCGAA
	rDybYVH5zjUNNK40BV5s5QTxIk3OesmlLdT8Uud/TLZQA0cdX2szf6juLwry2DwjNGoF
	HkhDrfDvlVVqroPXy1ENjdlK40yO3ykB1NLflaXgYQ1lwL91E76NhfNVTsHNnQ4w9H0z
	xdfSWFDgANcuL8BkpLOBkbD6hh2vm4VoUvv1DiAgQRBCkt/d/cfWSuQgoRKl4dp8vPCo
	1lBl6HYeYoSOeYG15rn9sbz/MFhyyl57WBtWkqBQddzWj6Rd8+Lu2u2xJ+n2J9sjrC/9
	vT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OliWBYThGwhZjDXGvK2X2+i2SPu2mz4EQLaiFxNQiIk=;
	b=ZmNl+2hqf6j58s7/VFvKVz9Qfx3ev0Rms27Goh2+6LC2FLLhYrUwWbvhj1uhLzPlm1
	QT6gux83dOqde5mmkLiSSkmjSoY57Lq6YJW925ggG4MwYx5M43oR/37HY0U8dS0IQxuP
	ccvcAsaNyQjZQ6DK2dtEyMoRQJ43tbUzCI5y/z/ukMv+LoumNGH0/FXoC5Vx9W4mLMul
	/oM6DDlvDiMJXwK6/br8rDL+f3GrsAmBISh5149bdANBwRlUZydT0eiIfjSYMMzEwwq+
	fElU0hSNmHqKaXsvQBFCBM6xhVboFY8of6GqZS63kw3HTvRKfqLe2beBsMcwfs7QL9d7
	yItQ==
X-Gm-Message-State: AHYfb5iQpF5wnX4r3IYi/4lBdBmCxsYEn5cRO3KZpc2I69I501ojahMe
	4fdpx7N7DRkf9+L16FG9GFzTS5xdXw==
X-Received: by 10.84.210.200 with SMTP id a66mr2864616pli.161.1503969096542;
	Mon, 28 Aug 2017 18:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 18:11:05 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B889665@ALA-MBC.corp.ad.wrs.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
	<CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B889665@ALA-MBC.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 18:11:05 -0700
Message-ID: <CAMKF1sqNhcDG6z1hZVFLTNDgtzsuq=ofRZm1=mrOzGo1ET_ZDQ@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] enscript: set the correct path for perl
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
X-List-Received-Date: Tue, 29 Aug 2017 01:11:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 6:07 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Monday, August 28, 2017 23:26
>> To: Huang, Jie (Jackie)
>> Cc: openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH] enscript: set the correct path for perl
>>
>> On Sun, Aug 27, 2017 at 11:05 PM,  <jackie.huang@windriver.com> wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > Set the correct path for perl and avoid
>> > searching the one in hosttools that cause
>> > QA issue:
>> >
>> > | ERROR: enscript-1.6.6-r0 do_package_qa: QA Issue: /usr/bin/diffpp
>> >   contained in package enscript requires
>> >   /builddir/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript?
>> [file-rdeps]
>> >
>>
>> already fixed with https://patchwork.openembedded.org/patch/143281/
>

I prefer the patch that I sent since that does not hardcode variables that
configure should define.

> Got it, thanks!
>
> Thanks,
> Jackie
>
>>
>> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> > ---
>> >  meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-
>> oe/recipes-extended/enscript/enscript_1.6.6.bb
>> > index 96129880a..65f1ccfa0 100644
>> > --- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
>> > +++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
>> > @@ -19,4 +19,6 @@ inherit autotools gettext
>> >  SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
>> >  SRC_URI[sha256sum] =
>> "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
>> >
>> > +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${bindir}/perl"
>> > +
>> >  RDEPENDS_${PN} = "perl"
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

