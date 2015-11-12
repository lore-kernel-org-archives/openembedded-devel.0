Return-Path: <jbriance@cisco.com>
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id C22D8771CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3482; q=dns/txt; s=iport;
	t=1447320403; x=1448530003;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=t5CsgdZRlv+Epvj3e9Zb4zgupjne3428rsAN4KhImG0=;
	b=S5wRZVN3BA/r623SsyEnTiRX6mgsQSyrhJvb0pqu8+Jp1WTax53lj/c9
	h4p0jlwHKoIHNONTf1BSIRIadTpg+t39DBfYi9XSQrzGwlrcg7TBg3LQl
	Rj+kA/ObUdvbKfOwLTHW9Y04YI8DCgGB99EfnECvDYICk4Wl/C4F28gHh s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0D9AQAYWkRW/4wNJK1egztTbwa+NgENgWUXCoI+gmdKAoE2OBQBAQEBAQEBfwuENAEBAQMBAQEBNzQQBwQCAQgRBAEBAR4JByEGAQoUCQgCBBMIiBEDCggNvnoNhGMBAQEBAQEBAQEBAQEBAQEBAQEBGoZUhH6CU4FVAgsGAYJ/TYExBZJng2EBhRyFIHWBboIrjQiFRodSAR8BAUKCRIFAcoNzAQgXI4EHAQEB
X-IronPort-AV: E=Sophos;i="5.20,281,1444694400"; d="scan'208";a="207400497"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by alln-iport-6.cisco.com with ESMTP; 12 Nov 2015 09:26:38 +0000
Received: from XCH-RCD-008.cisco.com (xch-rcd-008.cisco.com [173.37.102.18])
	by alln-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id tAC9QcbE011265
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:26:38 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-RCD-008.cisco.com
	(173.37.102.18) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Thu, 12 Nov 2015 03:26:37 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.000;
	Thu, 12 Nov 2015 03:26:37 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to
	control build parallelism
Thread-Index: AQHRHETKdwaON8pMQkqkPZymr4aUVp6Wz4AAgAF9f4D//9E9UA==
Date: Thu, 12 Nov 2015 09:26:37 +0000
Message-ID: <51bac70d8a574673855bba1aa7181b72@XCH-ALN-008.cisco.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
	<CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
	<CAAzKXnh-muNFgKm+ndHzLgMeSk7X-Zq3f3NWaenPHF-LkQgJ=w@mail.gmail.com>
In-Reply-To: <CAAzKXnh-muNFgKm+ndHzLgMeSk7X-Zq3f3NWaenPHF-LkQgJ=w@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Nov 2015 09:26:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've added -j in http://patches.openembedded.org/patch/100133/, because chr=
omium recipe wasn't fair to other recipes.
For instance, if bitbake is processing 8 compile tasks (incl. chromium) in =
parallel on a 24 cores machine, 7 recipes will
be compiled with -j${BB_NUMBER_THREADS} whereas chromium will use something=
 like -j24

Just out of my curiosity, what "${PARALLEL_MAKE}" brings compared to "-j${B=
B_NUMBER_THREADS}" ?


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Zoltan Kuscsik
Sent: jeudi 12 novembre 2015 07:08
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to cont=
rol build parallelism

Fair enough.

Z

On 11 November 2015 at 08:22, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Nov 10, 2015 at 9:48 PM, Zoltan Kuscsik
> <zoltan.kuscsik@linaro.org> wrote:
> > Hi,
> >
> > isn't ninja picking up the number of cores separately? I'm not sure why
> > this is needed.
>
> Without any -j option, ninja will default to "-j (logical_cores + 2)".
>
> The PARALLEL_MAKE value configured in OE isn't just about maximising
> parallelism though (although that's it's common usage), it's also
> useful to limit parallelism and reduce the load on the CPU. If
> PARALLEL_MAKE isn't passed to ninja builds then they will always fully
> load the CPU.
>
> > Z
> >
> > On 11 November 2015 at 05:48, Andre McCurdy <armccurdy@gmail.com> wrote=
:
> >
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  recipes-browser/chromium/cef3_280796.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-browser/chromium/cef3_280796.bb
> >> b/recipes-browser/chromium/cef3_280796.bb
> >> index d827b8e..6872e5b 100644
> >> --- a/recipes-browser/chromium/cef3_280796.bb
> >> +++ b/recipes-browser/chromium/cef3_280796.bb
> >> @@ -60,5 +60,5 @@ do_qa_configure() {
> >>  }
> >>
> >>  do_compile() {
> >> -    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS}
> cefsimple
> >> +    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
> >>  }
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > Zoltan Kuscsik
> >
> > Senior Software Developer, Linaro Digital Home Group
> > email: zoltan.kuscsik@linaro.org
> > IRC: zoli_ on irc.linaro.org
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

