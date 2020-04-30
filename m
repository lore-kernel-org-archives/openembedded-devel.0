Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.730.1588281235334192524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=G/N9Sc9O;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3828d1ea9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588281235; x=1619817235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QsoNCsvKAjJ6EuCXbE6FJCRT011YSwaLaZN61Q/UV+0=;
  b=G/N9Sc9Okov1tpTMPx9JBhbui/Z3iIznObDpLDaPyAmUHKuCS0LIqaJY
   oQq2lfRJ53HE5CyrRhJg7WTvkqRZ6kR54+ogx7k9i1ew01hwZEU0v2awu
   KOQQ36acVZ514/cAPpadIEkKkaas8YcJP73Jg+gyF+aIxWfj5NhcfDjK8
   41HAa2Bumj+YlV+9Ni9UmQ7RkmUh8Yucl67R6o7c+0YY9J8dsKmO8siAF
   NAHH5pzZnNGGU14VPZ1F2FVNe5fnDGBAtfwpmV191yQ3UOOtg0iJCJwBm
   Yv1+QFAy5HxJib8xbdkBCux7Jq5s1c1637G1/+rVjzXHrgrq3O6YCdfUL
   Q==;
IronPort-SDR: BhjrX2MjfY6zntEJZL9fWMZf5FD+B5fczJGe+AeHEvg1V8rNk4wU7tbPgjZr6lljehyz0SV+62
 J+5Vua3GriIn4xulveKihEL/izixQw7T5SWfZyZ5RJDSWhODjidEkA/7d/HwBsVUTPbs/Py3EK
 cdaUxV5QW3TuCBKxlzges+utAnGVXC3fZy5p7x4/Uq+whBDrH4ykuW6AxCMpch/Nfw3MVEmsv5
 j9T+89zhuthvaGuEm2XAkX+aBI2oxRKnjAtbPXqlWIHlLa7DV1LwM5tCAwrkB4ZAIib4zW2WHH
 Byc=
X-IronPort-AV: E=Sophos;i="5.73,337,1583190000"; 
   d="scan'208";a="2573307"
Date: Thu, 30 Apr 2020 23:13:52 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <oecore.mailinglist@gmail.com>
CC: robert.berger.oe.devel <robert.berger.oe.devel@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
Message-ID: <20200430211352.GB410632@pcleri>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 30, 2020 at 06:43:46PM +0300, Robert Berger wrote:
> Hi,
> 
> Is this supposed to work with host gcc 9?

Yes, for me it works with "gcc (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)"

> 
> This was the first test I did and it bombed.
> 
> I used all upstream unmodified dunfell branches plus your branch.

same did I on my Fedora box and it built and succeeded tests... That's
strange.

Have you a clean build?

regards;rl

> Regards,
> 
> Robert
> 
