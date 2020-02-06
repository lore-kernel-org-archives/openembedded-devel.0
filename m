Return-Path: <prvs=298a941f5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1B376608AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580988907; x=1612524907;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:content-transfer-encoding:in-reply-to;
	bh=YdeauR6SlTziGmOyJCEn4TFZEY8UAbEhbxKRr3CDkHw=;
	b=AC+bjCqEjWa2JnF9qfsdTCTv1TTmQcdAyNBW5ZTjee2/7SRuSC2tCDoO
	S6C5cC3exTAA1Mjt50cq2Fb7hYeBPYzLUEQ1ujj5qlqaoxe0uXPm2/sfG
	V93n1OxnAMrIAhaUhuZLQoXdxFgq8c+gXYm7LWTdQvEgBDFe/SOBJ21cw
	y5oC50uJXEJjAq81AczrF5LDjfgxFnABqD02Tvw37crhzUD47v6hJ8rFA
	RyBdQYsYbUW/vawWI2ImKg2ApeHjkm/BVw8m3jTgW5K24ff8lfvo32Y4T
	JdwASi0i9W9o4pkeFHUQh7xi8GEFWpAInBajRXCFxCRZsYxtI80DoDQu1 w==;
IronPort-SDR: RYb9YCx5tlNFLDtfqu6jopcDI0PyNp5Rgopk5K+hYezebQpBCJHL1VJtPvfU/c2SPRss3ppGFl
	+OPWzzh1A2i89PnsI6lOk/j7k7VQ9qkm0coDnQ8z0RUFnetHcfpp6RA5vRvZnnTc+j/cTodEi+
	RzxPvTMWb5Tw/VltK3Rk4r9Wnph6j/RwKlHkZt1Ej1n96GYf8P5YLEO/95SLjwCNfnC8UdZddq
	cH7CaYFSZ2k0uL6QqOo8lO/YSUrlccMpkHMVuCmDzQa/otoFizf0aCW63iS+orjZv1ZRyWDqzL
	Sz8=
X-IronPort-AV: E=Sophos;i="5.70,409,1574118000"; d="scan'208";a="22503725"
Date: Thu, 6 Feb 2020 12:35:06 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Message-ID: <20200206113506.GB7361@pcleri>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
	<424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
	<20200127052211.GA2138442@pcleri>
	<639e9a61-3ef7-e391-649d-9b53567ded40@googlemail.com>
	<20200206092407.GA7361@pcleri>
	<c884a4a7-c87d-00be-ba6d-13d5487536af@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <c884a4a7-c87d-00be-ba6d-13d5487536af@googlemail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Thu, 06 Feb 2020 11:35:06 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 06, 2020 at 11:24:34AM +0100, Matthias Schoepfer wrote:
> Hi Richard,
> 
> I "fixed" it by manually copying feature_check.bbclass into the layer. I can
> confirm, that your java8u242 works on aarch64 (even could get rid of some
> patches needed to compile on kernel 5.x)!
> 
> Is there anything planed to "backport" it to zeus branch of meta-java?

Yes, I'm definitely planning to backport the JDK updates to zeus and
warrior.

regards;rl

> 
> Thanks and Regards,
> 
>   Matthias
> 
> On 2/6/20 10:24 AM, Richard Leitner wrote:
> > Hi Matthias,
> > 
> > On Wed, Feb 05, 2020 at 02:20:53PM +0100, Matthias Schoepfer via Openembedded-devel wrote:
> > > Hi Richard and Jacob,
> > > 
> > > I just stumbled across the very same error, but on aarch64. I tried to
> > > switch to the wip-branch, but I get
> > > 
> > >   ParseError at
> > > /[...]/meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could not
> > > inherit file classes/features_check.bbclass
> > > 
> > > I am on zeus...
> > 
> > This seems legit as AFAIK features_check.bbclass was introduced after the zeus
> > release. For zeus you can replace it with distro_features_check.bbclass,
> > but please note that I haven't tested on zeus. I'm working on master.
> > 
> > Futhermore please use meta-java's master-next branch for testing as I will
> > remove the wip branch in the near future.
> > 
> > thanks for your testing!
> > 
> > regards;rl
> > 
> > > 
> > > Regards,
> > > 
> > >    Matthias
> > > 
> 
> -- 
> Dr.-Ing. Matthias Schöpfer
> matthias.schoepfer@googlemail.com

