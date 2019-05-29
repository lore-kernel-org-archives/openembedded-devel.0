Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 79FA07D302
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 196so194021pgc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iG+YzVbk9SlkC6XsiZGgWXhZoRSG/fNspsnjwZnVtxU=;
	b=N4sH9Q9Lyt1uA/UxuDxipammKTz098FtgGS+5c/hdHnPQP01DtqgMYkEZEyiIqWkOQ
	+b01/7bkYVws790kz4g1Kbtdkxjt98LY1WdQjOi9v7Rd5ZNNMoJ0JUP+E2DxtEtYG/jq
	iMBjl9UiymZCvm6Kb4g8Mp4BfhuCIsekjmbzsbNM34RMLfPysrTIdD99iNTqNz2A51lB
	u7LvQeMpxrfFe0UnEUqd+jjzHSy0mNmaNnEGbI3kSr76p+u9ET2kC71ahT4Pi2qa+cPL
	ihohrZj2CCPuXDSa/YDO/kVEapP7jHmRDox1ju8U9N0tLa8WxBYy0/OXPBu2F///s8E3
	bSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iG+YzVbk9SlkC6XsiZGgWXhZoRSG/fNspsnjwZnVtxU=;
	b=f8Feu16ocFq78aoU3QDupsbKN2YO93SgUJZvwaX7FEfBeWaoiOb37uJ4w1M8FMKOy8
	WE8ukTqTSoLq3qjnEGoxQEH3pf7ic3crBiQdUTSByJLhBpePXVE7OQ6NRJ8uwiJeWa8M
	YanG+nYARMvABSjAed/izzK+aGwkyshEl4CrGMygX5VbtEoohdrQ8Cnz5engzzuStE01
	KneKKHlNca51/Xw+8bqWMa0wjtRDRulvA4lj+vURPCo7B4Pigw2haLtMDVZvrgY50uCG
	LU+trWvcU1nXN8OmaFkAagnfnCroipubRR9A1cA39m7JEvbK5Q07ZvXxaUHgs4AB5Fsn
	DVhA==
X-Gm-Message-State: APjAAAWKz+pKvKF59E1AGUlkQ0rwQnumIeJw6OLhmUM7eFQMXEKaTDy0
	qUXRP32lGYDmcBTyxofvdoeiGcUecVZy/KZzRQw=
X-Google-Smtp-Source: APXvYqx3ymGzB7W4ugfsTpRHVKbWfWb4edJsPgmrKRHfpRRtjpu93jG8cdKDSfvVwCn+fCVthyV+acpOW7mjHPjxRGg=
X-Received: by 2002:a17:90a:8e86:: with SMTP id
	f6mr10489097pjo.66.1559119691382; 
	Wed, 29 May 2019 01:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190527100610.8944-1-ankit.tarot@gmail.com>
	<CAMKF1srM7s8F-i+R+pqOwiizg7kUce8seP66vvwrvC_av0p-Kw@mail.gmail.com>
	<CAM_RqkPkOp87iszm7Vf5Cv6Ap2-usP9QJGD_1xHzukG2m3qUyQ@mail.gmail.com>
	<CAMKF1sqN-XUboz7y+ObSaJJYfEM1qicS4FZBKyO2D2yyt6NNmw@mail.gmail.com>
In-Reply-To: <CAMKF1sqN-XUboz7y+ObSaJJYfEM1qicS4FZBKyO2D2yyt6NNmw@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Wed, 29 May 2019 14:18:00 +0530
Message-ID: <CAM_RqkMygPx-C-CMEyG5dcLRHUqwyzC2EiQ-1y2ceCn5aHZMkg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 29 May 2019 08:48:10 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Tue, May 28, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, May 27, 2019 at 7:40 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Hi Raj,
> >
> > On Mon 27 May, 2019, 21:10 Khem Raj, <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, May 27, 2019 at 3:06 AM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
> >> >
> >> > Add generic recipe for safe C library.
> >> > This library implements the secure C11 Annex K functions on top of
> most libc
> >> > implementations, which are missing from them.
> >> >
> >> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> >> > ---
> >> >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
> >> >  1 file changed, 15 insertions(+)
> >> >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
> >> >
> >> > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
> b/meta-oe/recipes-core/safec/safec_3.4.bb
> >> > new file mode 100644
> >> > index 000000000..ad3c4ba74
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> >> > @@ -0,0 +1,15 @@
> >> > +SUMMARY  = "Safe C Library"
> >> > +
> >> > +LICENSE  = "safec"
> >> > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> >> > +SECTION = "lib"
> >> > +
> >> > +inherit autotools pkgconfig
> >> > +
> >> > +S = "${WORKDIR}/git"
> >> > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> >> > +SRC_URI = "git://github.com/rurban/safeclib.git"
> >> > +
> >> > +COMPATIBLE_HOST = '(x86_64|i.86|arm|aarch64).*-linux'
> >>
> >> is it limited to these architectures ?
> >
> >
> > I have not verified for mips. Since I didn't have target to verify.
> > But let me check, whether it is feasible for mips or not.
>
> Sure, qemumips would be a good target.
>
Looks like, It is not able to recognize opcode for mips target.
Other target works fine including powerpc. I will submit v3 including
powerpc in COMPATIBLE_HOST.

Regards,
Ankit

>
> >
> > I'll keep you posted
> >
> > Regards, Ankit
> >>
> >>
> >> > +
> >> > +RDEPENDS_${PN} = "perl"
> >> > --
> >> > 2.20.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

