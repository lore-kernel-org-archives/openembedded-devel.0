Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 719A67ED36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 14:46:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id t8so11814869qkt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zTGrUfhoWyo9ezHoHkRd/n6RY8E+MqmppR6E216wObI=;
	b=vP6cEU3/6XCEdtL0RH0FWwLTImxlc7/Mv3mXqN3aRieAwvtSfYW24gD6WYKVxyh10U
	/Xze3OHbJykscXhI2VkU8krq4oyUktGxVYdm3prdxpl6CLnoIICatxvIzSbf09bsdDu9
	mPFajz3rzUBG6auwQYBbbLyxjkAo3l2k8Yz5HpbWApwdAsy6ZxGwrfWF+g+f9hpM1cdU
	b9fxzkHqNDm8vkPkkM0D3WnzQtai5YpgbpTprjgSNQS7MU2lfnN2NZKkJnRP6cTR37ed
	C55oE/ndLlHHmwyWtXcSXl0ULXKst5GlQVkiKCcHzU36VvY5bS1p6lxp8nUfT+i/dPIH
	+FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zTGrUfhoWyo9ezHoHkRd/n6RY8E+MqmppR6E216wObI=;
	b=enF+wqpf05aHxcw/2/CfrpO8AoSMjo3hGHIBCuzhw1uTjE3Wsl+cUNw71gPOV7v6bp
	/MmTef6iFw5+/cH3M9dqlInwyJ3HbjcMeEgOfWIf/0tWJMKBCfoQ2BUi7cEBNeUKgxhc
	0txLrZMc1GsrHJM6kKp71r3x7HS4vR5SAJAUfhZ2Yvz2PacJPyiAW/6EwZOVJMwpdBAi
	pKKwZ3MWTxUAhtBHDbL6/J3DehM9R4QlDS1/cpyN5ZOoy+xisCLflYJKikb/4MD2Sep2
	7U8mpvwUYMmfcjWVlNSQQfvHvji5jAFaHobDARY2wS0WbnZZhk2sACOS9tPTbsvbQTc1
	EePw==
X-Gm-Message-State: APjAAAXTwynDZTt9dpGOTg8pZmtBS1Q9rSHRlnTfDSFG3r6sU5kPlALD
	yFJnv8Ka5EPFy9AaiUlZaQCF8w2x8yNn1ftNn/oZLodZ
X-Google-Smtp-Source: APXvYqzDraV9V55fDwDYFbEZ2AlkL8vNsTKKTimNEtY8mw4oRTIiNnT868gnTXixbByxFMJeVlt1Ww6L/rUh46UI6p4=
X-Received: by 2002:a37:4243:: with SMTP id p64mr17030806qka.9.1563201980095; 
	Mon, 15 Jul 2019 07:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
	<CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
	<c144cb61-0180-ddc0-9ea8-82560060e99e@3mdeb.com>
In-Reply-To: <c144cb61-0180-ddc0-9ea8-82560060e99e@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jul 2019 07:46:05 -0700
Message-ID: <CAMKF1sqR6+M1ov8F1y05R5c54-zcSUTZ_mZKYoEyuo1=oW=wqg@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb: add recipe
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
X-List-Received-Date: Mon, 15 Jul 2019 14:46:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 15, 2019 at 12:01 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
>
> On 14.06.2019 21:04, Khem Raj wrote:
> > I see it fail on qemuarm/musl
> >
> > https://errors.yoctoproject.org/Errors/Details/248676/
> Hello,
>
> Sorry for late reply.
>
> From the sattypes.h file:
> https://github.com/stressapptest/stressapptest/blob/master/src/sattypes.h#L203
> it seems like only the x86, PPC, ARM-v7A, ARM64 are supported by this
> package.
>
> Would you consider removing other architectures from compatible withing
> the recipe
> as a fine approach?

Sure, thats fine. Although that might not fix the musl problem.

>
> Like in case of the NodeJS, for example:
> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb#L11
> >
> > On Fri, May 31, 2019 at 6:42 AM Maciej Pijanowski
> > <maciej.pijanowski@3mdeb.com> wrote:
> >> This patch introduces recipe for the stressapptest utility.
> >> The recipe builds without errors and warnings (tested on thud).
> >> It basically uses autootools to buildm so should build just fine
> >> on the other releases as well.
> >> Basic commands from the project's README were tested on a few
> >> armv7 / armv8 platforms.
> >>
> >> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> >> ---
> >>  .../stressapptest/stressapptest_1.0.9.bb              | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>  create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> >>
> >> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> >> new file mode 100644
> >> index 000000000000..3e5748a3a12c
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> >> @@ -0,0 +1,19 @@
> >> +SUMMARY = "Stressful Application Test"
> >> +DESCRIPTION = "Stressful Application Test (or stressapptest, its unix name) \
> >> + is a memory interface test. It tries to maximize randomized traffic to memory \
> >> + from processor and I/O, with the intent of creating a realistic high load \
> >> + situation in order to test the existing hardware devices in a computer. \
> >> +"
> >> +HOMEPAGE = "https://github.com/stressapptest/stressapptest"
> >> +SECTION = "benchmark"
> >> +LICENSE = "Apache-2.0"
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
> >> +
> >> +SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
> >> +
> >> +SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
> >> +SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
> >> +
> >> +S = "${WORKDIR}/${PN}-${PV}"
> >> +
> >> +inherit autotools
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Maciej Pijanowski
> Embedded Systems Engineer
> https://3mdeb.com | @3mdeb_com
>
>

