Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.813.1588281469500510625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=mFcYvkZZ;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3828d1ea9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588281469; x=1619817469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mMn57FpyzwrgO3MFwsc4HnHOMEaFuj3E/ZeYER2z7To=;
  b=mFcYvkZZqRGyMyWR+Wbc3Yl7F0Zm2qor6EmxgW0SnafWfCQclo0LYb+G
   vCx7tCq3AaFfRWwwGIbeKSgQ31TUZZzu94eOaPLCaQnaTlE3OIn6lK8A1
   +6F+ZPdIQsb/ZROTupfCN2NkXykh6KFTxyRE0MMAhTPjXYs81xmr2Gish
   TNJt1nZoRPru8KWnvcyNjFvorKv4s97jA5uHCIpio9QDcUMeojwJ+0TGo
   AYF44QD+rWDFBAcvtNJrfZ3MyHw9LxveO2mq4g4Zk+nBydXj5hfFaXEWh
   tKp5k8w4T1AAqwoUdELX06djnjMmdXJIK4WI8WhNQNVtNqhWY+bsLDVmu
   Q==;
IronPort-SDR: E3d+PMQwhJvnzxis2RdklgUfsV3FjzOwyCdVKZrbHr3KUdprGfOvKxvS3DI/KhHzrVfNEUi14r
 FPuafq/qAGpSD24EpE6hwRQhK2Vtwb1rUxFf06r/KuyOi+04nYDOasGQ4EwXqai0DWV/ftXwlw
 CxJjR2dS7OxCkRlIb4tFWvaNe8jX6S1fVHyQR0UK7zxncgKm6a73Jq5RhAJVnEFaJZOtHt7Oyy
 sRMx/FYZ6LzY14Qc6wOg/BDt61EzwQyjiuGu0apDP/6HcyzbxQUTkHNWvqYxJ7UAjOy0TXtQkk
 1F0=
X-IronPort-AV: E=Sophos;i="5.73,337,1583190000"; 
   d="scan'208";a="24091770"
Date: Thu, 30 Apr 2020 23:17:45 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: robert.berger.oe.devel <robert.berger.oe.devel@gmail.com>
CC: <oecore.mailinglist@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
Message-ID: <20200430211745.GC410632@pcleri>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 30, 2020 at 10:27:12PM +0300, robert.berger.oe.devel wrote:
> Hi,
> 
> I started to have a look into the icetea-native issue again and hope I will
> be able to come up with some patch, which fixes it host-gcc dependent.
> 
> The idea is to use a hacked version of this[1] and add it to [2].
> 
> Like this I should be able to retrieve the host gcc version dynamically and
> be able to add and remove CFLAGS e.g. depending on the major version of the
> host gcc.

If I understand you correctly we have something like this already [3].
Used for example at [4].

Or did I got something wrong?

regards;rl

[3] https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/classes/openjdk-build-helper.bbclass?h=g0hl1n/jdk8-fix#n24

[4] https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/openjdk/openjdk-8-common.inc#n178

> 
> Regards,
> 
> Robert
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/utils.py?h=dunfell#n377
> 
> [2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/classes/openjdk-build-helper.bbclass?h=g0hl1n/jdk8-fix
