Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 201CE65E3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 10:07:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 03:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,878,1389772800"; d="scan'208";a="494676087"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2014 03:07:00 -0700
Received: from irsmsx101.ger.corp.intel.com (163.33.3.153) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 17 Apr 2014 11:06:58 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.45]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.190]) with mapi id
	14.03.0123.003; Thu, 17 Apr 2014 11:06:57 +0100
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1
Thread-Index: AQHPWZ+BGuI8eK3mi02Lj/qUJiBjNZsUy8KAgADH46A=
Date: Thu, 17 Apr 2014 10:06:57 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B3603D664@IRSMSX102.ger.corp.intel.com>
References: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
	<CAMKF1sqxTiKZ5EiOL21Eojgefa8boiBc53E5VVOdkZQmgrT2JA@mail.gmail.com>
In-Reply-To: <CAMKF1sqxTiKZ5EiOL21Eojgefa8boiBc53E5VVOdkZQmgrT2JA@mail.gmail.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1
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
X-List-Received-Date: Thu, 17 Apr 2014 10:07:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> +EXTRA_OECONF =3D "--prefix=3D/usr \
> +                --datadir=3D/usr/share/bitlbee \
> +                --etcdir=3D/etc/bitlbee \
> +                --oscar=3D0 \
These I took from initial recipe in openembedded. =


> +                --ssl=3Dopenssl"
That is added by myself. Tried with auto (=3Dgnutls) on  x86 Galileo board =
and bitlbee was failing in a very obfuscated way.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Thursday, April 17, 2014 12:02 AM
To: openembeded-devel
Cc: martin.jansa@gmail.comexit; Koen Kooi
Subject: Re: [oe] [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1

On Wed, Apr 16, 2014 at 11:11 AM,  <krzysztof.m.sywula@intel.com> wrote:
> +EXTRA_OECONF =3D "--prefix=3D/usr \
> +                --datadir=3D/usr/share/bitlbee \
> +                --etcdir=3D/etc/bitlbee \
> +                --oscar=3D0 \
> +                --ssl=3Dopenssl"

should these be hardcoded ?
-- =

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


