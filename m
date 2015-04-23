Return-Path: <ruisebastiao@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 79C90605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 18:27:42 +0000 (UTC)
Received: by oblw8 with SMTP id w8so20365240obl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QXEcpxwX8yEkl7xYz8WE5kZtgBYLyR86SnZtJpzvE5w=;
	b=xehrIVythJ1SDzRKxBDJn2YM1VjKMZIdtTa0+E1ToTkxaA8ZvfWQ4SUjMnYZRkQ5xk
	BBT85NxUomYhw3EVWLaNbMR5QWdaCiZglxiaYVHY7ZgOWA9WhzyTC4m+lwXX3+OFATJ5
	i2VI7lYEdwr8xS5nOiHBTC3aL3L3ppao5iyLyEMIfDQvot+0cbz64SoRWfdoxM1qfR7Y
	26NLUF6ezM5W2FRv0SA3EFLEugeQdjY/sbDgQNV8EoNqSscHWFTTMkZd6zuND9Gv/jH7
	EhHb9f3wi9aTDKLq4AlM5EBCYwfGThEvoMDOOAeaHI29ahtPMXoyA1KS3dFO7yoar3/S
	rGdQ==
MIME-Version: 1.0
X-Received: by 10.60.33.74 with SMTP id p10mr1211866oei.62.1429813663792; Thu,
	23 Apr 2015 11:27:43 -0700 (PDT)
Received: by 10.202.205.213 with HTTP; Thu, 23 Apr 2015 11:27:43 -0700 (PDT)
In-Reply-To: <20150423143737.GA2336@jama>
References: <1429791892-30865-1-git-send-email-ruisebastiao@gmail.com>
	<CALbNGRRaX7RQLm__tDFv4=Ms1GEg4BVwdKAiJp7qMwb+CQ84EQ@mail.gmail.com>
	<20150423143737.GA2336@jama>
Date: Thu, 23 Apr 2015 19:27:43 +0100
Message-ID: <CAOEe98G146QthX6McHKseP3s0M39BNFPvopgRGK0_XhC516pDw@mail.gmail.com>
From: Rui Sebastiao <ruisebastiao@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH]] qtwebchannel md5 error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 18:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I didn't test the git recipe. I will test asap.

2015-04-23 15:37 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Apr 23, 2015 at 04:03:49PM +0200, Andreas M=C3=BCller wrote:
>> On Thu, Apr 23, 2015 at 2:24 PM, Rui Sebastiao <ruisebastiao@gmail.com> =
wrote:
>> > ---
>> >  recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebcha=
nnel.inc
>> > index 3cd22cf..3ed5808 100644
>> > --- a/recipes-qt/qt5/qtwebchannel.inc
>> > +++ b/recipes-qt/qt5/qtwebchannel.inc
>> > @@ -4,4 +4,7 @@ DEPENDS +=3D "qtdeclarative qtwebsockets"
>> >
>> >  # There are no LGPLv3-only licensed files in this component.
>> >  # There are no GPLv2 licensed files in this component.
>> > -LIC_FILES_CHKSUM +=3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e5=
9c330f12cc8ed"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59=
c330f12cc8ed \
>> > +                    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae=
2c17a64252e7 \
>> > +                    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be94737=
1bc8120425f \
>> > +                   "
>> > --
>> > 1.9.1
>> >
>> > --
>> * Missing signed off
>> * subject contains ']]'
>
> Did you test this with 5.4.1 as well as git recipe? I wonder if it
> should be only in 5.4.1.bb.
>
> Right now I'm testing it with newer git revision (for 5.4.2) and I'm
> sorry for introducing this issue last week, thanks for the patch.
>
>>
>> Andreas
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

