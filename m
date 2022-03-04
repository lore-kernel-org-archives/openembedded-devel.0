Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBFAC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:27:43 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.8167.1646407662251464221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=OU7d8BxV;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8D84A5C0120;
	Fri,  4 Mar 2022 10:27:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 04 Mar 2022 10:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=mesmtp; bh=TrF6DNcNbQ4iQ1lZ2r97yeEinAO
	stjXI98fAwPhMH20=; b=OU7d8BxV9r+JGeBJVISDGZbOE9c9RK6qyiK1lkDvwJW
	2AJRZr2sAXNi0sTh5+OC0pkUv3kS/GpJnn3FKkyNsUaFhShUtczeaQo6MhnSynAx
	PBQrW+cJDOMqcZuIfk89lhd+6HEqQV3fUM5G/cQNTyRCvgE1tyZEx7t1QWUUdyac
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TrF6DNcNbQ4iQ1lZ2
	r97yeEinAOstjXI98fAwPhMH20=; b=nU1Yd+hwfAIAwJ+nYhAf48jat0nvK3D9w
	GlftpjirH8wo5JYqpA2RktPinqCN6Y1XMrMMyqvCz38DJBY8G3AOfZmFA3cTmqEw
	xPGZg7JaKPbiBTTgD7Pn1LGC6wiKDC5RucVvzvF2c3j7Pasc9A/N5Kftb4wvZYEU
	RL4AjUHSCh47GM9ILsd2D8+H4mqYTjeEaR8sSZ3c9HE77OdAHZMVr+suRswf0xdQ
	lyHwemjxJZLNwV45I8By9gdrlfoYy4dAUaMDSysrRW2ZKqD9KY+wyYpeAgr/aT11
	g6WAMY61NvQKdVSiRcebrq14dwmr4iJRS5r4N2YPUwEtnYpGiVA4A==
X-ME-Sender: <xms:7S8iYpDUYzJ8SRSUIVR2srtKW3a6l7VxEM5__CYHinrC6AzT7I4PVw>
    <xme:7S8iYnj9MEICUB_LQkP3R9B_Vgm0FTu-kzcpNLBqE1pGDuEg0upuzJ_BtdM4Af8TK
    AUFN0YldStQjsMLcg>
X-ME-Received: 
 <xmr:7S8iYkkUluTieSbRZhs-yzCM01LGLTBUPX7iEHR6SFDctoLRo6Mi4ckXL-Z9zbPoOI7duSDTI8Pfbr6nGlBLcN0I>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefluhhsthhi
    nhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
    eqnecuggftrfgrthhtvghrnhephfduhfeuffdvfefgvdduteeludekfeevffdvudejgfel
    keffkeefjedtffffjeeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtoh
    hprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrse
    gtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:7S8iYjylT3AyAJJuiNRJ-vb2uiV_3feByr304cfHBU-RxUEujYzAZw>
    <xmx:7S8iYuQG8feqizlP_ktvvVu7tdpjBkTznzpL9Idpz587KXzwcDPWcw>
    <xmx:7S8iYmZj57BJ2P1SMovvb844ElYbA553GBtdotdbes4AXkl2DA5gEw>
    <xmx:7S8iYn4RzBvT9UHwTN9_uhi7WrmKbRzVV5_G1kv1nf2Q7yRr3GUrQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 10:27:41 -0500 (EST)
Date: Fri, 4 Mar 2022 10:27:40 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: python3-crc32c: add 2.2.post0
Message-ID: <YiIv7PqwqdTxKDid@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220228155714.7894-1-jsbronder@cold-front.org>
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
 <YiEOlH9jmQ/3JEjo@ravine.members.linode.com>
 <CAMKF1sr4g7bZVF+=asUsmpZutoak1HFO79GmN_UnnRiqYSo1Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sr4g7bZVF+=asUsmpZutoak1HFO79GmN_UnnRiqYSo1Kw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 15:27:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95787

On 04/03/22 00:04 -0800, Khem Raj wrote:
> On Thu, Mar 3, 2022 at 10:53 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> >
> > Ah right, this package only support arm or x86.  I'll send an update.
> 
> actually thats not the case, it tries to use SSE when target is x86
> and crc extensions on aarch64, for
> other architectures it uses general purpose instructions.
> however it uses wrong way to detect platform by poking at build system
> for platform architecture
> I have sent a patch to fix it.

You're much quicker then I am.  However, based on
https://github.com/ICRAR/crc32c/pull/10 I think we can simply update setup.cfg.
I'll send a patch in case you prefer that mechanism, but no problem if patching
setup.py is preferable.

I did try passing '--platform=${TARGET_ARCH}' but bdist_wheel didn't recognize
the parameter.

> 
> >
> > On 02/03/22 18:47 -0800, Khem Raj wrote:
> > > I am seeing a failure with clang on non x86 host. See
> > >
> > > https://errors.yoctoproject.org/Errors/Details/650724/
> > >
> > > On Mon, Feb 28, 2022 at 7:57 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> > > >
> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > ---
> > > >  meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
> > > >  .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
> > > >  2 files changed, 31 insertions(+)
> > > >  create mode 100644 meta-python/licenses/CRC32C-ADLER
> > > >  create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > >
> > > > diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
> > > > new file mode 100644
> > > > index 0000000000..f1f0e94ee0
> > > > --- /dev/null
> > > > +++ b/meta-python/licenses/CRC32C-ADLER
> > > > @@ -0,0 +1,15 @@
> > > > +This software is provided 'as-is', without any express or implied
> > > > +warranty.  In no event will the author be held liable for any damages
> > > > +arising from the use of this software.
> > > > +
> > > > +Permission is granted to anyone to use this software for any purpose,
> > > > +including commercial applications, and to alter it and redistribute it
> > > > +freely, subject to the following restrictions:
> > > > +
> > > > +1. The origin of this software must not be misrepresented; you must not
> > > > +   claim that you wrote the original software. If you use this software
> > > > +   in a product, an acknowledgment in the product documentation would be
> > > > +   appreciated but is not required.
> > > > +2. Altered source versions must be plainly marked as such, and must not be
> > > > +   misrepresented as being the original software.
> > > > +3. This notice may not be removed or altered from any source distribution.
> > > > diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > > new file mode 100644
> > > > index 0000000000..0d51420939
> > > > --- /dev/null
> > > > +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > > > @@ -0,0 +1,16 @@
> > > > +SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
> > > > +HOMEPAGE = "https://github.com/ICRAR/crc32c"
> > > > +
> > > > +LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
> > > > +LIC_FILES_CHKSUM = " \
> > > > +    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
> > > > +    file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
> > > > +    file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
> > > > +    file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
> > > > +"
> > > > +
> > > > +SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
> > > > +
> > > > +inherit pypi setuptools3
> > > > +
> > > > +RDEPENDS:${PN} += "python3-core"
> > > > --
> > > > 2.35.1
> > > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#95585): https://lists.openembedded.org/g/openembedded-devel/message/95585
> > > > Mute This Topic: https://lists.openembedded.org/mt/89453390/1997914
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> >
> > --
> > Justin Bronder

-- 
Justin Bronder

