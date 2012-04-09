Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SH3FY-0000CK-3v
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 03:18:32 +0200
Received: by lagw12 with SMTP id w12so2965875lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2012 18:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=LH/F89DeS7gjFwftVmyC8ELhHRPdg1n299PXThCY8MY=;
	b=Q3Lu999E1fexa77AHwYVaXmAscfyF7jFkgE6i6mT0N8vPQh29pNIo60qvNG3c72otk
	FTlcy86aVYG24TOx3r0Hvr96MUX5aRd3kNJQfwZ2xOaAVZGZQH0kzAQWIsV72kuGGgvi
	JIEqsq0qmqfSXkTy3Yd4mg8jxzKQDhi7o2DRgxPpoD6e9Y70HseFqHH5tgLRG/OxzCRP
	pbf60a6gjn7ElsCShag/pDbXthBrgJIwGBqt9WFPYMcf8Km7jpn8KjKFakoYMik7Mb4V
	q7ay1Pore0mKdM5rSLCfKgbjq1OyUMbdLgycc7cCpUp5cKDNJrWwlrf2lmtxs8H5YIK7
	IrDA==
Received: by 10.152.131.74 with SMTP id ok10mr8858919lab.17.1333933756136;
	Sun, 08 Apr 2012 18:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 8 Apr 2012 18:08:45 -0700 (PDT)
In-Reply-To: <20120409004350.GA10246@denix.org>
References: <4F80ACD6.8080901@gmail.com> <20120409004350.GA10246@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Apr 2012 18:08:45 -0700
Message-ID: <CAMKF1srz2wwtzo2-Te6F-=wLb7B796z7LbgBzRZk07fmbhohog@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-linaro and toolchain-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 01:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 8, 2012 at 5:43 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Apr 07, 2012 at 02:08:38PM -0700, Khem Raj wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Ken Werner @ Linaro has created a meta-linaro layer. I have created a
>> github repo of same here https://github.com/kraj/meta-linaro
>
> FWIW, I've been closely monitoring the progress of meta-linaro layer for =
past
> month and its status as applicable to meta-ti:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000747.html
>
> When I tried it last time to build some of our machines in meta-ti, there=
 were
> issues, but I didn't have time to follow up or investigate and I was busy=
 with
> the BSP presentation at the time...

yes and I have tried to resolve those kinks. I am now able to build
systemd-image using
angstrom distro and the resulting image boots fine on qemuarm. It
needs a patch in
OE-Core first. which I will propose soon.

>
> As a parallel effort, I was looking into working on the prebuilt toolchai=
n
> support - i.e. recipes to use binary Linaro toolchain in OE/Yocto. I grab=
bed
> the latest 2012.03 release before leaving for the BSP Summit and Linux Co=
llab
> and will give it a try ASAP.

yes thats in there it just needs some testing

>
>
>> Moving forward soon gcc 4.7 will land in OE-Core and 4.6 will be
>> more or less retired. In natural progression it would move to
>> toolchain-layer if there are consumers of it.
>>
>> linaro is also working on gcc-4.7 improvements in =C2=A0same manner as
>> 4.6 =C2=A0and there could be more tools e.g. gdb binutils etc. that coul=
d
>> be useful for armv7+ from that layer.
>>
>> I would like to propose few things we could do.
>>
>> Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
>> which means toolchain layer only has gcc-4.5 and eventually
>> This also means that we don't move gcc-4.6 into toolchain-layer
>> when its relegated from OE-Core
>>
>> In similar fashion add recipes for gcc-linaro-4.7 whenever linaro
>> makes first 4.7 based release
>>
>> Does anybody see downsides to this approach ?
>
> Sounds like a decent plan, but we need to validate the newest toolchain
> versions with the real hardware before making the switch and dropping the=
 old
> versions - 4.5 is still the most stable build for me and the broad range =
of
> architectures and platforms I work with at TI from ARM9 to Cortex-A15...
>

I dont plan to touch 4.5 recipes for now. It will remain in
toolchain-layer as it is.
its 4.6 onwards that I want us to be getting from meta-linaro.

>
>> This could mean that distro may have multiple compilers for different
>> architectures e.g. linaro toolchain for arm
>> architecture and may be OE-Core provided toolchain for rest of them
>>
>> another option is that we do the same thing where we cherry-pick
>> linaro patches into toolchain-layer and append them on top gcc from
>> OE-Core which we have been doing with 4.6 it does mean extra work
>> validation and maintenance that I would like to avoid.
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


