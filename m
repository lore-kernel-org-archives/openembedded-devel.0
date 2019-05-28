Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16CFF7E19B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 03:33:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m18so20394531qki.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8YDEmSOY1oYzs6gtFvWa0niNl1x0p6GSUiEPWaiCqyA=;
	b=Z5tVDOmf9Giv6pLbFbyvlwcLB/mr5smbYBvd6njhNVsE2k909BaVU+Hx53IRwVtZnG
	Ekiprcm6KIrUeI5/47Nx7FW4CHyOd5tF+s8TCgv3cWJxt8ta54beMXRd/mbhhLjvAZqg
	9SCM+O52Vf6XsPfoo2TLrf4FRz7USi1DcLNLbAqk5yUVddpaL/cRl/ahXJrNBbZpp/iV
	FeEAAr2KNAbHECu+pG0Hz0Dn5/q5gNPXbuf0rBuhJdt/4dyWJ2Lfzpl0IRb6yGbSy71f
	0Yk+6Mys2YVbh3Vhp1EqAZpxT0tXrzCTud4ioxdCdN1jr3mIKKg5CB/DbceCQ+K958EO
	PTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8YDEmSOY1oYzs6gtFvWa0niNl1x0p6GSUiEPWaiCqyA=;
	b=tIpSQmx3FPMTi111Ert4e2ZMAS+1Nrcopmz8x6x3aAZsoznbVE8iumXBhrkkJG3Ic4
	vxye2JIUNtpZKdLB/qQybNUoJuKQbOKcI3X577nkLad7G2mUb4AUf4/sfniAh9GKkZwy
	lkkzZQB7XlftXdy8/LiQ+VYMh8IV7oHyBWbbHfzEeNejCcDOI0WVVLrPerO0v2ia72kv
	9B9jqhCS9lOUO+Ll+kDi/zJl3lI9yQnhx6TyPo8wHSgYLHGuPZny9+cOjkyQJjOzkHYc
	cY220sJ9MveCR7p23NIEZQVR+qvKkWFuFXei9EW8YSYbvpyD2zhpZT5TOsytq43edF89
	ZqQA==
X-Gm-Message-State: APjAAAUV+FI1PXvaMNn4MH7TeXbUiO8aiPtGA3e4WcC8fiNEdOQRHy9N
	wv1MEmf67ADeaqvx+aV3Bf9uPfhwAUnWilDeOSE=
X-Google-Smtp-Source: APXvYqzI71tbZ4pANLfVfbB28ZXA+l2Aq1iv3Q1BYphPTr00cjBGu7g5UM08xhlqsLiiNloezWHIN9jxq/vjHJNEfAs=
X-Received: by 2002:a0c:876c:: with SMTP id 41mr78051479qvi.175.1559014439685; 
	Mon, 27 May 2019 20:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190527100610.8944-1-ankit.tarot@gmail.com>
	<CAMKF1srM7s8F-i+R+pqOwiizg7kUce8seP66vvwrvC_av0p-Kw@mail.gmail.com>
	<CAM_RqkPkOp87iszm7Vf5Cv6Ap2-usP9QJGD_1xHzukG2m3qUyQ@mail.gmail.com>
In-Reply-To: <CAM_RqkPkOp87iszm7Vf5Cv6Ap2-usP9QJGD_1xHzukG2m3qUyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 20:33:33 -0700
Message-ID: <CAMKF1sqN-XUboz7y+ObSaJJYfEM1qicS4FZBKyO2D2yyt6NNmw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Tue, 28 May 2019 03:33:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 27, 2019 at 7:40 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Raj,
>
> On Mon 27 May, 2019, 21:10 Khem Raj, <raj.khem@gmail.com> wrote:
>>
>> On Mon, May 27, 2019 at 3:06 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>> >
>> > Add generic recipe for safe C library.
>> > This library implements the secure C11 Annex K functions on top of most libc
>> > implementations, which are missing from them.
>> >
>> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > ---
>> >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>> >
>> > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
>> > new file mode 100644
>> > index 000000000..ad3c4ba74
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
>> > @@ -0,0 +1,15 @@
>> > +SUMMARY  = "Safe C Library"
>> > +
>> > +LICENSE  = "safec"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
>> > +SECTION = "lib"
>> > +
>> > +inherit autotools pkgconfig
>> > +
>> > +S = "${WORKDIR}/git"
>> > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
>> > +SRC_URI = "git://github.com/rurban/safeclib.git"
>> > +
>> > +COMPATIBLE_HOST = '(x86_64|i.86|arm|aarch64).*-linux'
>>
>> is it limited to these architectures ?
>
>
> I have not verified for mips. Since I didn't have target to verify.
> But let me check, whether it is feasible for mips or not.

Sure, qemumips would be a good target.

>
> I'll keep you posted
>
> Regards, Ankit
>>
>>
>> > +
>> > +RDEPENDS_${PN} = "perl"
>> > --
>> > 2.20.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

