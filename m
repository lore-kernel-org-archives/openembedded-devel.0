Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.836.1588154585990099349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 03:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=g9XI7be5;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=381e85789=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588154585; x=1619690585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9tlC+379pDEWPnyc+NuvPSzTegl2Db2yKyygqRF+ME4=;
  b=g9XI7be5zzRBOGb6VT/DKGJEBALmcA43A6/ODtzJv4a8xci1YS3R3d1E
   sD30uyClbndoVQe/zy+pjq+NKbDvLZ1p8knKD7d708f0Zs9ywoQcmXt8E
   ijjeqVmzcXMKc/QYXGH24YK9EOaOx3X3anazCvC2kKZRJ0VJ6vRv0p86/
   qoSFuOGRNu6jBiVhLHJY3e/kqIOzHaL3PUfhMxaBLgNuHE1a/pFZukKNd
   3T6kd7mG4y7IWZnpK5jtzlwr0FwALdr/jqU2hxkETclC4H/XIcE2AaqDv
   Bj+W8oCjemf2XBqRTd2B6iVvk6NU3GYrZ5Eq5iiz7HZlbc1oOze/XH5sw
   g==;
IronPort-SDR: YLUbokqDB8zuWnJFI0Qa3C9ldkLIEXUKAvzAPsvrfbhfcLEPXbwVCfLVpIDPUkiYNZ/BlDsxgg
 btAJ803feCysKdmbXpdf3m5a5BwUIoufyxAG9vEORgI8N11FpkRRMvDCjvdt+HwhR0feXMvI0w
 l/2BgJjpe/aKf4bQd4LuUDkwnw91/SdbqCJqMUUwPvLnWcRhcHGhP9KY+gwq2AoyGlTGqLnHTK
 JDya4M/kWtxCuR7hsuQM/Z+OCq/ST/9a4Ngctd5/r40aeEIm1A+RWx9RebLZO312Fu/AwZ0oQA
 Nqg=
X-IronPort-AV: E=Sophos;i="5.73,331,1583190000"; 
   d="scan'208";a="24056417"
Date: Wed, 29 Apr 2020 12:02:59 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: robert.berger.oe.devel <robert.berger.oe.devel@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, Robert Berger
	<robert.berger@reliableembeddedsystems.com>
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
Message-ID: <20200429100259.GA249641@pcleri>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Robert,
sorry for the delay.

I pushed the "g0hl1n/jdk8-fix" branch to the meta-java git repository.
It is a temporary test branch and it should fix the GCC version
dependencies (as long as you have GCC >= v6).

It would be great if you could do a quick test and give me feedback ;-)

thanks & regards;rl

On Fri, Mar 20, 2020 at 06:53:17PM +0200, robert.berger.oe.devel wrote:
> Hi,
> 
> I tried to add support for a host gcc-9 and suggested this patch[1]
> 
> [1] https://github.com/RobertBerger/meta-java/commit/898a0ae33c9102387aae2e3427a007e3935e663e
> 
> and, as per your suggestion, since it restricts the host compiler to >= gcc9
> I added "-Wno-unknown-warning".
> 
> https://github.com/RobertBerger/meta-java/commit/3d8ae5afb639ec7abcc48f15c74b42b373863c57
> 
> ... but it does not build:
> 
> https://pastebin.com/B1nxHcPH
> 
> cc1plus: error: unrecognized command line option ‘-Wno-unknown-warning’
> [-Werror]
> 
> That's my host gcc:
> 
> pokyuser@3a469e7032d9:/workdir$ gcc --version
> gcc (Ubuntu 9.2.1-17ubuntu1~16.04) 9.2.1 20191102
> Copyright (C) 2019 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> pokyuser@3a469e7032d9:/workdir$
> 
> Please advise.
> 
> Regards,
> 
> Robert
