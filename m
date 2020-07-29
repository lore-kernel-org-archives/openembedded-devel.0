Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.90.1596000235873193538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 22:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=m4r53zOt;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=472ab9a74=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1596000236; x=1627536236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u+yybCWGuhJA7K1re0Bl0FdeSmUZx9q4NT+42didvpk=;
  b=m4r53zOtpONGdHqVFLXoW5wHkejhDedpcz7xIrd7C8nPNYr+VfySMCSy
   keQIWccPiV+xRiYQABdYVG2aoQ7AtfiE9Ysfj/F5grB3/RiOp5HR5R8I2
   96QLmkSRxGbzHebY4SJ7zVJFJoxVimUHl4be5D4PrsAJqhUaI7vn3tlxo
   o5WEWKUZTHbojM6Ffi9G5XQBFGT4b1bsvORUIzdFmArpGjnz880134DVr
   AVWjbmOKIW0lC4I8M9pIU4/aYejVJBXV6jyf4+RUmOK7lhH63eLDILjnF
   Y+RvCSnq3TwfhULROJ5IuYxJnpPMxUFCUtzrTXcYWgNXCspoEfYFCtnW/
   Q==;
IronPort-SDR: Gyz1IkqaSbtNqQVuvVUIusqneqiObiMy2PzmH4DzEcKN4zVKbuR+fU2K2gt1dVgA2h6c+Y3/kj
 +GNyPmxortc9cRlHV91cYWRbDFW4mKLqiHBukwdiC9XT5yFpnwIob/6/OUsC2b74YUqM0Gj1AG
 78pZWKCt5IEv7ZaQhvxFiPzfS5+x0Qs4CHbTSxllKbEaQs7L6McX1z73vkX+HPJHg26WTcFQKh
 vUcRJImNWqqOfDSqpAAgzUuR9Dk7Rrwt9iKL7yvItk0yfFVXlGcx8ecOluA8KkvV37POvbbfh6
 j8s=
X-IronPort-AV: E=Sophos;i="5.75,409,1589234400"; 
   d="scan'208";a="25780336"
Date: Wed, 29 Jul 2020 07:23:52 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Thomas =?iso-8859-1?Q?K=F6ller?= <thomas.koeller@baslerweb.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] commit 90984a33f407265493d54a8240e7d78701b3fb50 breaks build on Ubuntu 16.04
Message-ID: <20200729052352.GA2877@pcleri>
References: <MKXl.1593173003991452078.9WGL@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <MKXl.1593173003991452078.9WGL@lists.openembedded.org>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Thomas,

On Fri, Jun 26, 2020 at 05:03:23AM -0700, Thomas Köller wrote:
> I noticed that building the zeus branch on Ubuntu 16.04 does not work. AFAIK Ubuntu 16.04 is still listed as a supported build environment, so this should be fixed.
> 
> The Problem is that Ubuntu 16.04 comes with gcc 5.4.0, which is too old to understand -Wno-error=stringop-overflow; this causes the configure step of icedtea7-native to fail.

Thanks for the catch. Do you have already worked on a patch to fix this
issue?

If yes: It would be great if you could post it to the ml.

If not: I'll take a look into creating a fix asap.

regards;rl
