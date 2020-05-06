Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.1115.1588742738357381539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 22:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=rMQxUj9X;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588742738; x=1620278738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7SDI65Vvh3YK/9zWxNSBQ71aJKJ4Gx32jsRP9yDGDJ0=;
  b=rMQxUj9XQDOtvtQ8kWX1xvlnCx42BCZNaxa233JKPu5OW0LjDtoxGPPc
   GdMU3bH7Xo99BKY2p/p3Js/3WoE1SR9hq/BNEjvB52QpcKJWumyoFslcK
   e0dKmqT4Crgelcym3cFPSMDfZdq3uBisfXyeZlcm1UxSrQEcTKwWswh1L
   K5eocWLQCQP65dlSx/8ACZ9Dt3fEI7aJYjnkQJQ9N39OtWGR3wT9JwRp6
   Ls0VyBbETM992QIKgdBKc+wX6ecIDUeS/MNytXSret4sNY//cme4ufgU8
   kuNoiMwq2HDtIwP8KvJjTgOam9XVrvh5hl3flVcp8/c9H4nRdaII+hW4Z
   Q==;
IronPort-SDR: io+WoL11PS5WRbBhRdLta7g9W2l5YzHVIy9NWPKBG3/1E00otd1Pf6vxTMUcs/ZAiACH3XNGAE
 ltxa30U2ua2xFfEUht7hiFm389gF8kd0i3NXLtv+dXOBGiNJ3hmJWtMANIVhSEU2g0nmeETvyh
 HOQrMqJasqbeoMV7yPiKOtXpbMYskIR92S5VluZEzjm08xl4gd5GxsaHVjMvD+SluxjFgo96Ht
 gnUBMoKqW2y/pVIqdrMZ5kMZGeAik3qI9Q0FFeeYwY8W8VR8pw+oxr4ivB/NgXS/cgeMIeqakV
 Zqg=
X-IronPort-AV: E=Sophos;i="5.73,357,1583190000"; 
   d="scan'208";a="24181689"
Date: Wed, 6 May 2020 07:25:36 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] g0hl1n/jdk8-fix
Message-ID: <20200506052536.GA250994@pcleri>
References: <b01c2189-5348-feaa-a545-fc5fabdeb072@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b01c2189-5348-feaa-a545-fc5fabdeb072@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jacob,

On Wed, May 06, 2020 at 06:44:45AM +0200, Jacob Kroon wrote:
> Hi Richard,
> 
> Just a FYI, I successfully built branch g0hl1n/jdk8-fix,
> 00fa8f5e330679d00275010c7fda976caae44a00, on my Fedora 32 system with gcc
> v10.

Great! Thank you for testing!

> 
> I did notice a comment typo in commit, "openjdk-8: require GCC >= v6",
> 0207ab72c58662cf7ac60229a5e14879b73f461d:
> 
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> > index 084ead9..c78bb2a 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -171,7 +171,7 @@ EXTRA_OECONF_append = "\
> >  # Since v6, GCC sets the default C++ standard to C++14 and introduces
> >  # dead store elimination by default.
> > -# Since v10, GCC defaults to -fcommon.
> > +# Since v10, GCC defaults to -fno-common.
> >  # OpenJDK 8 is not ready for either of these changes.
> >  GLOBAL_FLAGS = "-fno-lifetime-dse -fno-delete-null-pointer-checks -fcommon"

Oh. Good catch. Thanks!

I'll fix that and merge the patches to master-next soon.

regards;rl

> 
> /Jacob
