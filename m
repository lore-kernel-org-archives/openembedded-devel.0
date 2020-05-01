Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.6580.1588325058153349678
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 02:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=YBPJZ9zb;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3837e3c93=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588325058; x=1619861058;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=tv2vDaZ4OXYB+vIQjRzHjlhEveDFFONOEb9fNN4DCj8=;
  b=YBPJZ9zbvMub6zohzKyA5Wv/GcylLDJK05DEuvEHR7XVXkkp/5DbD5Lc
   pqHFNKwwhJPpZfnOiQvGNGuZGGOsKkEQp39Gr3NCjr8ON/aAjk8PDAiFy
   /i24QHL2yxL0qOS+VPItXFPfEpEkFfEt8k2xUyfBJ7W2Ewd7Yx28Rr8Yn
   kjcQP+dpBLN4/jjyrRktqDPyJy1zAwkKXPBR7TrXdR919CuDfFvi96kU+
   wTZ5Di9TYQWpZLdBJShSTQyO5+rsEEm9zJSI5lCiPMd+LK5Wu+GwOZilz
   DN4ypj1aZ6DbApiWDSp/NDrNysv6TT1jWCdag0T432C3ggfCeCRW4tm6z
   w==;
IronPort-SDR: iGHDAanIvjw4hgPSuTF7LhV83T7gNgFrv2S0ydp4lGrQ21s4DMyYweMVNkas8vbuG+wW1I4olH
 MqTohr3WFw5thLPQ29M5kMYzO7knB84Ma4DUj6ogpQsMXFR1jwcFwWcM/T6ZTbROg18NUR5qQq
 6DMoT9RZdAgXzNsRSWw35jqeHSXNslVnKafctnHnC1cCaib45qClIWY8/AOtNIgaJbZWhyqunU
 jcBVW3HuSVdZDW+y3Ot42IFFdaEIpCLLBiUZIXTF08ffBAHzrR8t+YPVKsvYQ98igYErLJRPrF
 D9U=
X-IronPort-AV: E=Sophos;i="5.73,339,1583190000"; 
   d="scan'208";a="24100734"
Date: Fri, 1 May 2020 11:24:16 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH][meta-java 1/3] openjdk-build-helper: Fix decoding GCC major version
Message-ID: <20200501092416.GA1127999@pcleri>
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200430131556.2150334-1-jacob.kroon@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Applied the whole series to master-next.
I will merge it to master after some tests. Thanks!

regards;rl

On Thu, Apr 30, 2020 at 03:15:54PM +0200, Jacob Kroon wrote:
> GCC in Fedora 32 is up to version 10, so return the whole word
> instead of the first letter.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  classes/openjdk-build-helper.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
> index 8d83e02..4e334c2 100644
> --- a/classes/openjdk-build-helper.bbclass
> +++ b/classes/openjdk-build-helper.bbclass
> @@ -31,7 +31,7 @@ def openjdk_build_helper_get_build_cflags(d):
>          from subprocess import Popen, PIPE
>          cmd = d.expand('%s -dumpversion' % build_cc).split()
>          cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> -        return cc.communicate()[0].decode('utf-8')[0]
> +        return cc.communicate()[0].decode('utf-8').split()[0]
>  
>      build_cc = d.getVar('BUILD_CC')
>      version = get_build_cc_version(build_cc)
> -- 
> 2.26.2
> 

> 

