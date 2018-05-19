Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA11774FAB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 11:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C9C07182FF;
	Sat, 19 May 2018 13:59:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zqnMxwHF5sLt; Sat, 19 May 2018 13:59:34 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1A89D182E5;
	Sat, 19 May 2018 13:59:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0738D1A07C;
	Sat, 19 May 2018 13:59:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE89B1A058;
	Sat, 19 May 2018 13:59:33 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 19 May 2018 13:59:33 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id E20F3D09;
	Sat, 19 May 2018 13:59:33 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 19 May 2018 13:59:33 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sat, 19 May 2018 13:59:33 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Trevor Woerner <twoerner@gmail.com>, "Andre
	McCurdy" <armccurdy@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass
	to put cmake package files in dev package
Thread-Index: AQHT7ktwRN7NJCr850uB2nEcRtEVGaQ1uMuAgAAfywCAABhmAIAARZIAgAAlzICAAJW+oA==
Date: Sat, 19 May 2018 11:59:33 +0000
Message-ID: <c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
	<3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
In-Reply-To: <3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 19 May 2018 11:59:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 19 maj 2018 06:53
> To: Trevor Woerner <twoerner@gmail.com>; Andre McCurdy
> <armccurdy@gmail.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH 01/17] libwebsockets: rely on
> cmake.bbclass to put cmake package files in dev package
>=20
> On 5/18/18 7:37 PM, Trevor Woerner wrote:
> > On Fri, May 18, 2018 at 6:28 PM, Andre McCurdy <armccurdy@gmail.com
> > <mailto:armccurdy@gmail.com>> wrote:
> >
> >     On Fri, May 18, 2018 at 2:01 PM, Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>> wrote:
> >     > On Fri, May 18, 2018 at 12:07 PM, Andre McCurdy
> <armccurdy@gmail.com <mailto:armccurdy@gmail.com>> wrote:
> >     >> On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> >     >>> Hi Andre
> >     >>>
> >     >>> This series is fine, except that it has some formatting
> changes mixed with
> >     >>> cmake related changes. It would be preferable to have them as
> separate
> >     >>> pulls. I reckon that both types of changes are good.
> >     >>
> >     >> The formatting cleanups are all minor and probably not worth
> >     >> submitting on their own.
> >     >>
> >     >
> >     > OK thats fine, drop then in v2
> >
> >     They are not worth reworking the patch set to create a v2 either
> :-)
> >
> >
> > It would be wonderful if we could agree on formatting; if we could,
> I'd
> > certainly help by taking on some of the reformatting task.
> >
> > Unfortunately, all such past attempts of which I'm aware never got
> > anywhere, and if I remember correctly, the Yocto folks and the OE
> folks
> > each have their own ideas of what is "correct".
> >
> > In any case, if these won't get in as is, if Andre doesn't want to
> spin
> > a v2 without the formatting changes, and everyone is okay with it, I
> > could spin a v2 without the formatting changes.
>=20
> Please do.

If you do, I think you should spin the patches for the clean ups as well.=20
At least I agree with (most) of them, and on a whole they definitely=20
improve the recipes.

And I also agree with Andre, that in general it is too much trouble to=20
generate clean up patches in their own, which is why it might be better=20
to allow some clean ups together with actual changes. Otherwise they will=20
not happen, which in the long run deteriorate the overall state of the=20
recipes.

//Peter


