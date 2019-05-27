Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5997E01C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 10:08:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v9so2455159pgr.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w/2+pPyJ/OcIB1VksxUQHVT0VIoITjtpsglmfvvnABU=;
	b=mESmorOCfM74wuZd7rkMCFw6nMWwpn3m3YL1DsG9Yk9x3cTqlG5StpQUF5JyDKbwZ2
	yJyj8FY+wQI+MwmB88lXjKU1dI3UZTGjODvwRlhuskp54Lo1TZ/f2tFn6v06hSt/99aL
	cNIBuCIzsKU3QoWHe1f22OXsy3Xf6y/RR5g52gZx/LmWLB4GcHMPvyjTIFDPx14s8hqH
	keEoGcte1IpVu3kYBoqd5aQ4HvcI6wllFDbJYBEQvlEnOcPIfZrEeiWe2TFERNTtWk1Z
	CHBkbWhYmnENBhS8541EPbXjxYkKueM0mYwn7/lmqg42ExG6AVVTSVy5/xyXB8lteh7p
	BwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w/2+pPyJ/OcIB1VksxUQHVT0VIoITjtpsglmfvvnABU=;
	b=OVwvi3B3oPAxMFGPDJQz0Ou/Uug1MTqnwBLRNnMQU5dRUJaysC17cBRAbKzqeKozNQ
	isg4Cyz7K/YSBd2HhRzk8Fq1+19jmIKgaCdVYF0tyT+IcaPtaIeXnaW377CnHxvzIF1R
	2UvsIsDHXJHOPsTAIVJiyxzxD6SOeTTpAeJlz1bVhjP4PetXmyiNyfY8UCiHYDwZ5hQb
	xWZmGi9Yo2GkoOoeNDvSYRL+PgCHo4ZL/UebI5thKhITy8OHdj+5mtrM/PXurWqHNi+i
	W7ce5me5VVO/V6QimGXA/8Cv/hMea/jCY3tsJvFNnLHPOwlrJcYX4LsJuF5qKe3grqVz
	FgpA==
X-Gm-Message-State: APjAAAXUhEZefFuVJSbyH+foL9flCPGTpqVmQuwTRKlSiJ5Tp0NN/SS0
	JH4a1N6Ti8cLrFsOGLTxo+NQlPuKsv/LXJDvrMlwqOFL
X-Google-Smtp-Source: APXvYqyq0dKfgC2vezARdLTzMVjMSXNAR8LS4y8V+im0nceuYi60bAiNSItq66m4WfbMLH3rj5GhME8PNXXdke6N8dA=
X-Received: by 2002:a62:4ece:: with SMTP id
	c197mr134360165pfb.139.1558951710154; 
	Mon, 27 May 2019 03:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190517094336.26232-1-ankit.tarot@gmail.com>
	<20190517094336.26232-2-ankit.tarot@gmail.com>
	<CAMKF1sq-X3q0XW4ki+mfUfAR+zVFBJ9WeEdSF2M1pD4JyguWCg@mail.gmail.com>
In-Reply-To: <CAMKF1sq-X3q0XW4ki+mfUfAR+zVFBJ9WeEdSF2M1pD4JyguWCg@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 27 May 2019 15:38:18 +0530
Message-ID: <CAM_RqkOnRpH9f_x67wi2ywFebxyg7VJR0H4-wSWR_p55N+Jv5Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Mon, 27 May 2019 10:08:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Mon, May 20, 2019 at 10:18 PM Khem Raj <raj.khem@gmail.com> wrote:

> This fails to build for mips target see
>
> https://errors.yoctoproject.org/Errors/Details/241270/


v2 patch is submitted for compatible target.
Regards,
Ankit

>
>
> On Fri, May 17, 2019 at 2:44 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Add generic recipe for safe C library.
> > This library implements the secure C11 Annex K functions on top of most
> libc
> > implementations, which are missing from them.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  meta-oe/recipes-core/safec/safec_3.4.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
> >
> > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
> b/meta-oe/recipes-core/safec/safec_3.4.bb
> > new file mode 100644
> > index 000000000..2048fd418
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY  = "Safe C Library"
> > +
> > +LICENSE  = "safec"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> > +SECTION = "lib"
> > +
> > +inherit autotools pkgconfig
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> > +SRC_URI = "git://github.com/rurban/safeclib.git"
> > +
> > +RDEPENDS_${PN} = "perl"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

