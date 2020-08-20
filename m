Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.108681.1597921103219525329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=CXBT+pbq;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597921103; x=1629457103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkU+bslpN6e0bWAtMUkgNP3pUDAIHB51x+3WXdgPV0o=;
  b=CXBT+pbqdaFXHbA5nhzGA1NreBX55p6TPkAu8CuYjYrS2YbCqGe9dp03
   7XXsqcI5/nR1pUKn+j+t6KVfVTZbuwRtmYzG4pU7xYcnSXBVTswamSfdE
   yLlsK7m2WtEFLKQVz247sm7rT/8qEOU7QGjttFwk7+VWJ78JJklzwSjuO
   7McKqoGGV+AzCCqfRLsC5hjzDiI0vrjM4EIBDpOWU9t16HpbbkQSaL1MU
   cKPkZApHoITeKAvcnzcTt6F+13ZpqscDykpSIG0w7UjuJtYwCLZn9whTk
   iOnGXkt/qDGUL99xbt3kuIHnXLmKOdPMRgwVGaC0uDdPm0BwO5Fymu91J
   w==;
IronPort-SDR: x/b6K213qkXzd0a6E4EsL/S6nv4dLnAB7g19xIRqu8ek+W9D3b/BZLzuh8jUG0D9rWqtcAzTNB
 LhCxLZWz0Gp2NUi+knLsEhZI+qLXePNLqpsCTG4LnurGXQfOLYJ/nDpUW+SCPiqgDw9ZqvXYl4
 RcDSZvQVvBSDOLLGxqryGlPSuN4xmgkrafByAsrTh/ww6ajf2rW3AuujK32jBmBLPCO2ZSqFqo
 P7MfVAwbKQjFkVM2rcqihIzhF3b50rQ1t0uLcvzazkm2c5quc19cqczJmwSx8nKa2tV1/tWSLd
 Xao=
X-IronPort-AV: E=Sophos;i="5.76,332,1592863200"; 
   d="scan'208";a="2646568"
Date: Thu, 20 Aug 2020 12:58:21 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCHv2] openjdk-8: add a glibc 2.32 compatibility patch
Message-ID: <20200820105821.GE51054@pcleri>
References: <20200813162756.24193-1-alex.kanavin@gmail.com>
 <20200820101019.GB51054@pcleri>
 <CANNYZj-0FffY0wvrfybRVsQ_Jg8eJu1fm9XCW7otjD=O-GcYxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-0FffY0wvrfybRVsQ_Jg8eJu1fm9XCW7otjD=O-GcYxQ@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 20, 2020 at 12:26:22PM +0200, Alexander Kanavin wrote:
> Thanks Richard.
> 
> There's also a problem with te cacao recipe: upstream has disappeared,
> which renders fresh builds impossible:
> 
> --2020-08-20 10:22:51--
> https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
> Resolving bitbucket.org (bitbucket.org)... 2406:da00:ff00::22c5:2ef4,
> 2406:da00:ff00::22c3:9b0a, 2406:da00:ff00::22c2:513, ...
> Connecting to bitbucket.org (bitbucket.org)|2406:da00:ff00::22c5:2ef4|:443...
> connected.
> HTTP request sent, awaiting response... 403 Forbidden
> 2020-08-20 10:22:52 ERROR 403: Forbidden.
> 
> I guess we need to put the zip somewhere else, and fetch it from there?

Thanks for the catch!

It seems Bitbucked shut down their mercurial repositories...
The cacao-staging repository there is unavailable [1], but the cacao one got
migrated to git [2].
I'll take a look at it and will send a patch for that ASAP.

I guess it's better to use cacao than cacao-staging in any case ;-)

[1] https://bitbucket.org/cacaovm/cacao-staging
[2] https://bitbucket.org/cacaovm/cacao.git

regards;rl
