Return-Path: <jbriance@cisco.com>
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8627717F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1281; q=dns/txt; s=iport;
	t=1447321494; x=1448531094;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=s5eRZPd4+fa0jHfwwfFGrNXAQAwmieMM93dc33I49Y4=;
	b=W+DkQtKEL8HQt6xedkhL/c7/ZLrot9IWrxcUh6bj3l5vNXHGNymHVSM6
	61geQUmd7cUUR+8AHfT7XcZ3p85k8sAkEQpM9hFGJQp51OY73XtBrf7y1
	NfhjKxv91qMaJToekzQ9cDxepoFT3E9gthQeh2MM8RAwvo1HIgUkr7sda A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0D9AQC+XkRW/51dJa1egztTbwa+NgENgWUXCoUlSgKBNzgUAQEBAQEBAX8LhDQBAQEEAQEBJEcXBAIBCBEEAQEBJwcnAQoUCQgCBBMIiCYNw3YBAQEBAQEBAQEBAQEBAQEBAQEBGoZUhH6JOQWNVIh0AYUchSCCY4IrjQiNGAEfAQFCgkSBQHKENoEHAQEB
X-IronPort-AV: E=Sophos;i="5.20,281,1444694400"; d="scan'208";a="207404880"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
	by alln-iport-6.cisco.com with ESMTP; 12 Nov 2015 09:44:49 +0000
Received: from XCH-ALN-009.cisco.com (xch-aln-009.cisco.com [173.36.7.19])
	by rcdn-core-6.cisco.com (8.14.5/8.14.5) with ESMTP id tAC9imKC028304
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:44:48 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-009.cisco.com
	(173.36.7.19) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Thu, 12 Nov 2015 03:44:48 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.000;
	Thu, 12 Nov 2015 03:44:48 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to
	control build parallelism
Thread-Index: AQHRHETKdwaON8pMQkqkPZymr4aUVp6Wz4AAgAF9f4D//9E9UIAAaHEA//+eNRA=
Date: Thu, 12 Nov 2015 09:44:48 +0000
Message-ID: <f9502a57b15d40f4b6878970e8d1dae1@XCH-ALN-008.cisco.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
	<CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
	<CAAzKXnh-muNFgKm+ndHzLgMeSk7X-Zq3f3NWaenPHF-LkQgJ=w@mail.gmail.com>
	<51bac70d8a574673855bba1aa7181b72@XCH-ALN-008.cisco.com>
	<CALbNGRT3E3oMgspJuXaJ=Y_Os179mpSY1x=t6gF+K-XvejunQg@mail.gmail.com>
In-Reply-To: <CALbNGRT3E3oMgspJuXaJ=Y_Os179mpSY1x=t6gF+K-XvejunQg@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.60.62.142]
MIME-Version: 1.0
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Thu, 12 Nov 2015 09:44:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

That makes sense, thanks for the clarification.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Andreas M=FCller
Sent: jeudi 12 novembre 2015 10:34
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to cont=
rol build parallelism

On Thu, Nov 12, 2015 at 10:26 AM, Julien Brianceau (jbriance)
<jbriance@cisco.com> wrote:
> I've added -j in http://patches.openembedded.org/patch/100133/, because c=
hromium recipe wasn't fair to other recipes.
> For instance, if bitbake is processing 8 compile tasks (incl. chromium) i=
n parallel on a 24 cores machine, 7 recipes will
> be compiled with -j${BB_NUMBER_THREADS} whereas chromium will use somethi=
ng like -j24
>
> Just out of my curiosity, what "${PARALLEL_MAKE}" brings compared to "-j$=
{BB_NUMBER_THREADS}" ?

BB_NUMBER_THREADS -> max bitbake tasks run at the same time
PARALLEL_MAKE -> make tasks (gcc) at the same time

Andrease
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

