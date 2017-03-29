Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 840CE77BCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8FBDA1808C;
	Wed, 29 Mar 2017 14:06:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id huQMnnxvxrLj; Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B9B921808A;
	Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AEB81E09E;
	Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F2701E09B;
	Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 7344F2230;
	Wed, 29 Mar 2017 14:06:03 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 29 Mar 2017 14:06:03 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 29 Mar 2017 14:06:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Woerner <twoerner@gmail.com>, Philip Balister <philip@balister.org>
Thread-Topic: [oe] Meson build system
Thread-Index: AQHSp+6ssW9eeZmjKECuphuW8fzrNqGqeG2AgAAI9oCAATcwkA==
Date: Wed, 29 Mar 2017 12:06:03 +0000
Message-ID: <1b58ff53a34748caa86f212a6c8dd0d3@XBOX02.axis.com>
References: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
	<CAHUNapRmymF0Z2s1aGhxNAusk35cj6Wg2uqYWDrZTNTMXYkYTQ@mail.gmail.com>
	<db923476-2e79-5d55-a887-3658d00ecc59@balister.org>
	<CAHUNapRjDLBn+0dm2HsfMs2KwsjEixNsQfyhB61zJsUZE0fOxg@mail.gmail.com>
In-Reply-To: <CAHUNapRjDLBn+0dm2HsfMs2KwsjEixNsQfyhB61zJsUZE0fOxg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Meson build system
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
X-List-Received-Date: Wed, 29 Mar 2017 12:06:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Trevor Woerner
> Sent: den 28 mars 2017 21:28
> To: Philip Balister
> Cc: openembedded-devel
> Subject: Re: [oe] Meson build system
>=20
> If X is moving to meson, and meson is in oecore, then meson.bbclass
> will have to move to oecore as well.

Both the recipe for meson and the meson.bbclass are currently in=20
meta-oe. This was the recommendation as nothing in neither OE-Core nor=20
OpenEmbedded are currently using it. However, this will obviously have=20
to change as soon as anything in OE-Core starts to use Meson.

//Peter


