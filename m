Return-Path: <oobitots@cisco.com>
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id A509C7DF22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=515; q=dns/txt; s=iport;
	t=1558007002; x=1559216602;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=kcuniKvg6rZ+dreIl0YkRBgi0etyOuXErKqs65MhWMo=;
	b=X9PIuFcOZhLC6QWeXLt8AlcxkvGDgqpi/qxYnjm/+ZdTGJm6e+oTCc1t
	L0opbswUrboKEuxkuJXUZAz6021dEE0OSOXN1bMhU6UgGt6sdNpcRwHw/
	hEdqyy7fkPp3Sc2ri0elUwU7d6Gx+Vdmgt4c+9UWpYkFEL6k5G01IX7XT w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D0AgBzTN1c/5BdJa1kHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBZYIRgT0wMpkcmk4JAQEBDAEBLwEBhECCMCM4EwEDAQEEAQECAQRtKIV?=
	=?us-ascii?q?LAQU6PxACAQgYHhAyJQIEDg2FJa0TijOBM4tPF4F/g241PoREhWIEp1kJAh2?=
	=?us-ascii?q?BbJJWI4IEAZNpoT4CERWBMDYhgVdwFYMokFBBj3+BIQEB?=
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="273573876"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 May 2019 11:43:21 +0000
Received: from XCH-ALN-008.cisco.com (xch-aln-008.cisco.com [173.36.7.18])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id x4GBhLSM013644
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 16 May 2019 11:43:21 GMT
Received: from xch-rcd-007.cisco.com (173.37.102.17) by XCH-ALN-008.cisco.com
	(173.36.7.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 16 May 2019 06:43:20 -0500
Received: from xch-rcd-007.cisco.com ([173.37.102.17]) by
	XCH-RCD-007.cisco.com ([173.37.102.17]) with mapi id 15.00.1473.003;
	Thu, 16 May 2019 06:43:20 -0500
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [oe] [meta-oe][PATCH] protobuf: Fix ptest compilation
Thread-Index: AQHVC8VVzXsD9DBvQEuUegAB/ZO3HQ==
Date: Thu, 16 May 2019 11:43:20 +0000
Message-ID: <c01e469bd1394e4eba8cbab4c651902c@XCH-RCD-007.cisco.com>
References: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
	<20190516112315.GA17876@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.63.15.143]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.18, xch-aln-008.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Thu, 16 May 2019 11:43:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was clang 4.0.0=0A=
=0A=
Regards,=0A=
Oleksiy=0A=
=0A=
On 16.05.19 14:27, Adrian Bunk wrote:=0A=
> On Thu, May 16, 2019 at 08:57:04AM +0000, Oleksiy Obitotskyi -X (oobitots=
 - GLOBALLOGIC INC at Cisco) via Openembedded-devel wrote:=0A=
>> Tests require c++11 support, so add -std=3Dc++11=0A=
>> to compiler flags.=0A=
>> ...=0A=
> What compiler are you using to compile for your target?=0A=
>=0A=
> The description sounds as if it would be gcc < 6.=0A=
>=0A=
> cu=0A=
> Adrian=0A=
>=0A=
=0A=

