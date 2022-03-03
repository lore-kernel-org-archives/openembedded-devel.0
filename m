Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A4FC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 18:53:11 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.14900.1646333590471615708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 10:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=ggxYEe9s;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B9FCB5C0371;
	Thu,  3 Mar 2022 13:53:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 03 Mar 2022 13:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; bh=gIIfBuXi9Lv
	l/FqopClY5T5MHc33tOPe7VFYrqaI2yk=; b=ggxYEe9sQ+xAM+NMPNN7jvbTtqa
	A9xInTtbP3l3T7Ie3KpqN7hhjzvWYtwnJXoo4wtfWu6txqbuNMpzquDMZAtSMTB7
	JAziYLwiTvTsdmFGHfGn+fvzSW2MCTTnGKMp9uJUGWt2dS4s38th3C6ZZt1o4JL3
	RZfoQg2wIp+MaqIk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=gIIfBuXi9Lvl/FqopClY5T5MHc33tOPe7VFYrqaI2
	yk=; b=ZNNh2xLQD1Y4yfAHrJXsg0VEZUkWjFicvhFeaKJtwaLIPIlnqxjjUvaHz
	hPhjqImQmZSManJ9BtjdnwMmVoB3IQoQcKjw1NDLAN/EdO8Yf3ggiZS5414v3q3N
	1/xSDrBB/QlTGj0lZVXQCmSY3N0Xc0R6lwtgqbXlT+r7f6TriDg5DgyH4/OSXFMb
	/Gumm+lnZLO2VIAenCCv8g/8MGVqccOvM3kxaMyqtSCgzeHxA9C9UAlkr1wCSSTc
	GIdmzuGDVl9AkxPvMt+q1hHrY0c1enTQ8xMH+QYZPmELYMx0vMEx6zyJAesnuFNG
	nOEFaFJZ6nEo7e62OROX89UMgtQ8Q==
X-ME-Sender: <xms:lQ4hYt--XdlqrgpJ24PmbXQC0onue_Evds8JCXDGn7KELi39Zkt-ZA>
    <xme:lQ4hYhu78GU29Zi8X-TgCkuTfYoYzdgKgid4dgilB7InJcdwUBwhPTlS2AEXzFka-
    a9vciwohiVaQY4YTQ>
X-ME-Received: 
 <xmr:lQ4hYrBE3o0LyPDbFjorxS2CM5aWWFHM8WCF7G4v2lOHqe-CEJptIx2iG1QBtXhHG8vFSzzNdF5_EFG0LzYPmtqy>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpefluhhs
    thhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdroh
    hrgheqnecuggftrfgrthhtvghrnhepkeeuhffgleefveejfeeuleevkeevheffkeetgefh
    gfejgedtteffteegudevheehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdroh
    hrghdpghhithhhuhgsrdgtohhmpdhophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvg
    hrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:lQ4hYhfLfFA70pll8OGY2CxIVxjXaJ6LLbsP67r1YJsjsFy79wAlOQ>
    <xmx:lQ4hYiPnEMu30jhh1fpXI7w2Rn7GWwIoM1p9hI3bvJ2OW3KsVBMnIg>
    <xmx:lQ4hYjl4BpWIA5j17mSQFar62F5yr3mHiSry_FnOaXJKcUTQ-PmnMw>
    <xmx:lQ4hYsVHDbz5aUdu-nrWAkPcylHdnY9X4H1KzVQfpH5tM0MEoFNW1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Mar 2022 13:53:09 -0500 (EST)
Date: Thu, 3 Mar 2022 13:53:08 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: python3-crc32c: add 2.2.post0
Message-ID: <YiEOlH9jmQ/3JEjo@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220228155714.7894-1-jsbronder@cold-front.org>
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CAMKF1spdXVvNtLfq=-GBRROe+-=D0jZ+9Pg=EfaoK55A7uqtuw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 18:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95754

Ah right, this package only support arm or x86.  I'll send an update.

On 02/03/22 18:47 -0800, Khem Raj wrote:
> I am seeing a failure with clang on non x86 host. See
>=20
> https://errors.yoctoproject.org/Errors/Details/650724/
>=20
> On Mon, Feb 28, 2022 at 7:57 AM Justin Bronder <jsbronder@cold-front.org>=
 wrote:
> >
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  meta-python/licenses/CRC32C-ADLER                | 15 +++++++++++++++
> >  .../python/python3-crc32c_2.2.post0.bb           | 16 ++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 meta-python/licenses/CRC32C-ADLER
> >  create mode 100644 meta-python/recipes-devtools/python/python3-crc32c_=
2.2.post0.bb
> >
> > diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/C=
RC32C-ADLER
> > new file mode 100644
> > index 0000000000..f1f0e94ee0
> > --- /dev/null
> > +++ b/meta-python/licenses/CRC32C-ADLER
> > @@ -0,0 +1,15 @@
> > +This software is provided 'as-is', without any express or implied
> > +warranty.  In no event will the author be held liable for any damages
> > +arising from the use of this software.
> > +
> > +Permission is granted to anyone to use this software for any purpose,
> > +including commercial applications, and to alter it and redistribute it
> > +freely, subject to the following restrictions:
> > +
> > +1. The origin of this software must not be misrepresented; you must not
> > +   claim that you wrote the original software. If you use this software
> > +   in a product, an acknowledgment in the product documentation would =
be
> > +   appreciated but is not required.
> > +2. Altered source versions must be plainly marked as such, and must no=
t be
> > +   misrepresented as being the original software.
> > +3. This notice may not be removed or altered from any source distribut=
ion.
> > diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.pos=
t0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > new file mode 100644
> > index 0000000000..0d51420939
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "A python package implementing the crc32c algorithmin hard=
ware and software"
> > +HOMEPAGE =3D "https://github.com/ICRAR/crc32c"
> > +
> > +LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://LICENSE;md5=3D4fbd65380cdd255951079008b364516c \
> > +    file://LICENSE.google-crc32c;md5=3De9ed01b5e5ac9eae23fc2bb33701220=
c \
> > +    file://LICENSE.slice-by-8;md5=3D6b3bc7709d6b2db6646ec2467310ff6b \
> > +    file://crc32c_adler.c;startline=3D9;endline=3D24;md5=3Dc60e6e55d0e=
5d95effa6fad27db0711a \
> > +"
> > +
> > +SRC_URI[sha256sum] =3D "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4=
851377d13ead8b435e"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS:${PN} +=3D "python3-core"
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95585): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95585
> > Mute This Topic: https://lists.openembedded.org/mt/89453390/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

--=20
Justin Bronder

