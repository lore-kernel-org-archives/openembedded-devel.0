Return-Path: <jbriance@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0776FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1698; q=dns/txt; s=iport;
	t=1450177173; x=1451386773;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=rGndSOleOFVXmlQoUAYka2MOGPRLJhHeROHc0kLvRuY=;
	b=DdlYHY6XOBCY9YhFQJUhq6CLG+lqfger/ohHCNTg//K+pK9fh50CcrcX
	KWMD8/H7Mdj38tR0cg0i9aU9a0JsMnvKhvIEhx5z8PhmAuCQmRuUYDNOk
	GYMiZLKfSkvhpdVD8IyhJHkMuM7TNdQi8wG2EmKPgMlf7n/BOB+QoVX8Q g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D3BQCC8W9W/40NJK1egzpSbQa8JYEgA?=
	=?us-ascii?q?Q2BYxcMhSBKAoE3OBQBAQEBAQEBfwuENAEBAQQBAQFrFwQCAQgRBAEBKAcnAQo?=
	=?us-ascii?q?UCQgCBBMIiCcOvVsBAQEBAQEBAQEBAQEBAQEBAQEBGoZWhH2CcYZPBY1viQ0Bh?=
	=?us-ascii?q?TiFIoJmgWNJlwGDcwEfAQFCgkSBQHIBAYMpBj2BCAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.20,431,1444694400"; d="scan'208";a="217661812"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	15 Dec 2015 10:59:30 +0000
Received: from XCH-ALN-008.cisco.com (xch-aln-008.cisco.com [173.36.7.18])
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id tBFAxU5S011725
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:59:30 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-008.cisco.com
	(173.36.7.18) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 15 Dec 2015 04:59:29 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.009;
	Tue, 15 Dec 2015 04:59:29 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] QT5 application NOT generating core dump upon receiving
	segmentation fault
Thread-Index: AQHRNyNKspt7x18TmEOoZPBc2oDv1p7L3hNQ
Date: Tue, 15 Dec 2015 10:59:29 +0000
Message-ID: <db278e3a48e24cc1b48e6630554815c0@XCH-ALN-008.cisco.com>
References: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
In-Reply-To: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.60.62.150]
MIME-Version: 1.0
Subject: Re: QT5 application NOT generating core dump upon receiving	segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 10:59:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

What exact version of Qt5 and which Qt QPA platform do you use with your ki=
t ?

A quick grep shows this: http://code.qt.io/cgit/qt/qtbase.git/tree/src/core=
lib/kernel/qcrashhandler.cpp?h=3D5.5#n409, it could explain your issue if i=
t is called.
=20
Julien

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Ankur Tyagi
Sent: mardi 15 d=E9cembre 2015 11:27
To: openembedded-devel@lists.openembedded.org
Subject: [oe] QT5 application NOT generating core dump upon receiving segme=
ntation fault

Hi,

I am running a QT5 based application on TI AM335x EVM kit. I am using
meta-arago daisy configuration.

My system is configured to generate core dump and core dumps are generated
whenever application receives segmentation fault (expected).

But when my QT5 based application received SIGSEGV, then no core dump is
generated. It dies without "Segmentation fault" message on stdout.

To debug this further, I added nullptr dereference in my application main()
before QApplication object is created and when executed, core dump was
created.
When I moved nullptr dereference after QApplication object is created, then
no core dump was created. Application died without any message.

So it seems QT is handling SIGSEGV and not allowing to create core dump.

Is it expected ? I believe not. What wrong am I doing and how to fix this ?

thanks
Ankur
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

