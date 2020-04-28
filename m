Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.2335.1588053824838984618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 23:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=P1UYQGo0;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3809a76ea=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588053825; x=1619589825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QuRLzOyqIjZY7nvPTdG3gEJzd5BttM/Dp5mkKt7jomY=;
  b=P1UYQGo0hkyL8Z6GU51USoLHLYGQuUypHtaSB+w1vU8VICYBIU0FTdFs
   VkBHjB4XLVPlM73K4Uf7aA/Ph/wqUkwfjOU+50rXSTCbXXEyY/NLt1dA+
   8WWMvAmegP4J0G1dJTR38Z88nnFRAr7zKYuCoJbP3t9dhNTjsxAa3VnL4
   JuNHviLcl8O43acgS2UaVOzobprnG2LCYWkhV6HZeUs48bhJ3w7XbPCsf
   EVaC+1rpjVU/sXiwbolQGae9o87h9c59BdGJj8Rny3Oh4tiNcPzXFxKQy
   fzPlvmNhYDxPdj7hlegvFi0cMCb1Vp3gnY4tTuZ//UlvQUAuZV1arGl82
   g==;
IronPort-SDR: W6+UF5lp/aZZGVsk11XkDNZQ0Pcy6e3oC5sFQ3KEvS14u9/Y7FsJ7qx6DJ5gIQQ+M/Dy5B/lrn
 o6twsErlNHyPxpTBUToZQ6+QrBEsJQC3QRAdvlFK2n6skc12aemRVhZILYLt7HK55L0p5ZJnMF
 W/zkhUzP9mzC1VBHSjMLemYsn5WcJhspt1z9NtAtr8g6JRmUYEbukS7F8o6cps1WLZnA4kOZ8q
 v2rkKcp1j2XJE3KQp3VaXelLIrtA4GtWsFqgchcKeAgZwobSz7fUq4uP0jl1ehSVVhyCYfkdym
 ae8=
X-IronPort-AV: E=Sophos;i="5.73,327,1583190000"; 
   d="scan'208";a="2571253"
Date: Tue, 28 Apr 2020 08:03:41 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] openjdk-8: update to latest ga version 252
Message-ID: <20200428060341.GA101200@pcleri>
References: <20200420084632.3229835-1-richard.leitner@skidata.com>
 <20200427062736.GA6062@pcleri>
 <826e1c97-8061-653b-096b-d8ba5636a799@gmail.com>
MIME-Version: 1.0
In-Reply-To: <826e1c97-8061-653b-096b-d8ba5636a799@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 27, 2020 at 10:26:25AM +0200, Jacob Kroon wrote:
> On 4/27/20 8:27 AM, Richard Leitner wrote:
> > fyi: This patch has been added to master-next.
> > 
> > Any test results are welcome!
> > 
> 
> I think this breaks building openjre:

Hi Jacob,

Thanks for the catch. I missed to add the openjre recipe to the patch.
My fault sorry.

A new patch version is on its way and the one on master-next will be
force updated.

regards;rl

> 
> > WARNING: openjdk-8-native-252-r0 do_fetch: Checksum mismatch for local file /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2
> > Cleaning and trying again.
> > WARNING: openjdk-8-native-252-r0 do_fetch: Renaming /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2 to /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2_bad-checksum_2cde0f920e96038c8fe27af3e802bcd90b894a2feb37fed0604cc53787807dfe
> > WARNING: openjre-8-242-r0 do_fetch: Checksum mismatch for local file /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2
> > Cleaning and trying again.
> > WARNING: openjre-8-242-r0 do_fetch: Renaming /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2 to /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2_bad-checksum_633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece
> > WARNING: openjre-8-242-r0 do_fetch: Checksum failure encountered with download of https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk - will attempt other sources if available
> > ERROR: openjre-8-242-r0 do_fetch: Fetcher failure for URL: 'https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk'. Checksum mismatch!
> > File: '/home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2' has sha256 checksum 633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece when a83f8daa2afece63bf7ae95cfbca91ef765424c40b9f5b45e4a3c2d4da0f7a95 was expected
> > If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> > SRC_URI[openjdk.sha256sum] = "633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece"
> > Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
> > ERROR: openjre-8-242-r0 do_fetch: Fetcher failure for URL: 'https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /tmp/ramdisk/tmp-master-glibc/work/i686-oe-linux/openjre-8/242-r0/temp/log.do_fetch.15248
> > ERROR: Task (/home/jkroon/Projects/tmp-linux/build/../meta-java/recipes-core/openjdk/openjre-8_242.bb:do_fetch) failed with exit code '1'
> > Waiting for 1 running tasks to finish:
> > 0: openjdk-8-native-252-r0 do_fetch (pid 15246)   0% |
> 
> /Jacob

> 

