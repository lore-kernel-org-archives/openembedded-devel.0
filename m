Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.2578.1588656921143723149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 22:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=go6EUnsF;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3877ea1dc=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588656921; x=1620192921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xbB17sXoRY6rBsunioDPWFko9I6LKVm4pFpT7H5H9Ok=;
  b=go6EUnsFQWP8/cd5GkEnJlxN+2gLQmLz2RSfcw3hWEaKhsH8MUvly8/P
   aXjFq2yVmrocUUN+ilTTnKCcgSRW8f3v+DOqT84mM6SKne3ks1Es4ug32
   HgJKpDo/mfFm42QJ+RJQj4PI/kHg7Kej3DJASW09HiNczBd7SoBMZchab
   NYTof/8ccWjlS8f94JotK+iE0ECxwO/qXb0gi3z8ntEVxoYKwhjAezdST
   KzGCJ9FkwCIdmYtVLDidw/BexWlJqBHu4QbaUL8C1XEUpsuF5pMd94XL+
   kE49gfGqqKXS0y5NtM5eEnUwQ7GQO7J4WEQ6zyBhpgDJV8fnH7tpeKfUJ
   g==;
IronPort-SDR: WySCbOZJlBjib+YAmA/VmHnxhKpsjihmeZtuY0ap8rMCE1rivP1yf4LphQMIYJbQiz7/tvi6bN
 5ElXESnYkRDSZFSTp5lj/4z/SdpKJyPFOha0VAYceZoricf/LXGoYbAGVX/NdXcSxEC2NK6A6e
 xqrF6H0RcZcL9LPIf7AOaLQnZoqGbT7Jv4Vn8yS6yeHdx93+E/FzVtxM3i93cQ5XM7kUmWRqgM
 hfX/GVsMkvcdCrq6zTU9HfvYPGUKfZ8q2n9ZGmLzfv4IomNECzuWbZLxI9poko2qm0ts6s4BqK
 jzE=
X-IronPort-AV: E=Sophos;i="5.73,354,1583190000"; 
   d="scan'208";a="24158521"
Date: Tue, 5 May 2020 07:35:17 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Robert Berger <oecore.mailinglist@gmail.com>
CC: robert.berger.oe.devel <robert.berger.oe.devel@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
Message-ID: <20200505053517.GA4964@pcleri>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
 <20200430211745.GC410632@pcleri>
 <160AE28F2E93B445.19580@lists.openembedded.org>
 <0237cfe6-4162-a253-4799-678177dca1ab@gmail.com>
 <1110be9f-444f-5b6c-f16c-e638493b31e1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1110be9f-444f-5b6c-f16c-e638493b31e1@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Robert,

I'm just responding to your last message as you were completely right
with your problem.

My fix covered only openjdk-8 and not icedtea7-native. I've overlooked
that somehow ;-)

Therefore it would be great if you can provide a patch to the
mailinglist for fixing the issue.

Thanks for your patience!

regards;rl

On Fri, May 01, 2020 at 05:57:18PM +0300, Robert Berger wrote:
> So I guess the compiler is __NOT__ wrong to complain, since desc could be
> NULL.
> 
> Regards,
> 
> Robert
> 
> 
