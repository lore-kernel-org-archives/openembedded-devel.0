Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.1290.1593672958336909306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 23:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=g15p5AiT;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=445b5c427=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1593672958; x=1625208958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rU0Y2yGgL8oDcI71++JIfNpwvhLHbMCbQN98jrOpEPA=;
  b=g15p5AiTdNNVorKyuDR54y5NMlxfvSbYfnzLLwt4Xewjip1XyFt9AY+y
   QQHD6r6oaUk3wfIpiiB2YxgzGqgptMxTRiaPgRAYqBn+wciWRnMDC/+hY
   OgQvFrPF7RpWpMah7h4qSAG7IxKL1YD+4lDa0BTsfi20u4qjLN/kmyyIA
   o2r76I7CnfOp4uLK70Wu5tPM7vMeFK4F1yf+XHIoqVpDp6iylzSfJP4ux
   jyveEO++LDZnhw7KKnin7CuWCWYZbnRIPi9Zdf0rq+cGEYHCUi7Q15ifq
   GdvoTXMDxGcPDamawWuLVqURnTs2rMQ6Z4T7JK7mGduSOGxUTgGw9cxxb
   w==;
IronPort-SDR: 6OUeN63gb4VNRpDwClldxqwnfyBtneZN0e+L3M2yvQ46XyknmUYsxan6UGnwvFvGqjFGczSV8s
 nJg5JTLF3qY7tLBlgaR0JRhq4Lj1eziP9GLiDhld9Wvp+/YVYRCElZavJE6SGfMlbddvWEU1mB
 m6mbfYxqHRHxiHJXRKOMikvkHf9hmLQf35ylV+R68yPTM72XGcSo3DktHIAPGI7IRTi2KFD/cF
 wCpJeGVhGfX4nxTqgXK1ST0Hc+HUMOzZ+/c/krRgWYtpjatLmsp0ROxbYY96JuhqXF6i6kUBAp
 0u4=
X-IronPort-AV: E=Sophos;i="5.75,303,1589234400"; 
   d="scan'208";a="2608500"
Date: Thu, 2 Jul 2020 08:55:55 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, Vyacheslav Yurkov
	<Vyacheslav.Yurkov@bruker.com>
Subject: Re: [oe] [meta-java][PATCH] jlex: set unique file name for download
Message-ID: <20200702065555.GC308462@pcleri>
References: <20200623094825.33289-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200623094825.33289-1-uvv.mail@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
thank you for your patch!

This is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Tue, Jun 23, 2020 at 11:48:25AM +0200, Vyacheslav Yurkov wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> 
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  recipes-core/jlex/jlex_1.2.6.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
> index b8f9ffb..3c14e4c 100644
> --- a/recipes-core/jlex/jlex_1.2.6.bb
> +++ b/recipes-core/jlex/jlex_1.2.6.bb
> @@ -1,7 +1,9 @@
>  SUMMARY = "Lexical analyzer generator for Java"
>  AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
> +
> +JLEX_MAIN_FILENAME = "jlex-${PV}-Main.java"
>  LICENSE = "JLEX"
> -LIC_FILES_CHKSUM = "file://Main.java;beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
> +LIC_FILES_CHKSUM = "file://${JLEX_MAIN_FILENAME};beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
>  
>  PACKAGE_ARCH = "${TUNE_PKGARCH}"
>  
> @@ -10,7 +12,7 @@ RDEPENDS_${PN}_class-native = ""
>  
>  inherit java-library
>  
> -SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java \
> +SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java;downloadfilename=${JLEX_MAIN_FILENAME} \
>             file://jlex \
>            "
>  
> @@ -26,6 +28,7 @@ do_configure() {
>  
>  do_compile() {
>  	mkdir -p build
> +	cp ${JLEX_MAIN_FILENAME} Main.java
>  
>  	javac -d build Main.java
>  
> -- 
> 2.25.1
> 
