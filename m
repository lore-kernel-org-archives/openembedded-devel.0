Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.1312.1593672863766855953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 23:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=h02wjkzc;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=445b5c427=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1593672863; x=1625208863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MHe72RTUEnhrDzBICqcDe/KU+BIplptwxwpJ5sJ6hGc=;
  b=h02wjkzc+kxVtoUkYPUchDWQuQ04TVbZQaUMDlqPD87mHI7Vf2pbwZkE
   RYxV7iw/aYIU2iRR6gssVHjmI+FSzEipLLhRUMmuu+t/jE8Hj0DlcmZbU
   51Ekn6wLBh1RMOTYBG64U0YTdjHUqh031KjnK9OBUjdsaaD4Y9guHeE4A
   eySaccs68ZoCvnSSpDRdPHCwjxf2BGm2vQOAZ9soDOj4nnxp09qVDufo6
   9sSYVlP0E9lwhNKdY3x3Dyv6lOwIJhOuBB9SKj5fgYy47atjposYAMr7K
   x6xJrLMUzLajBIHXdSolE3HsFUa6D9vJRH5BPB1Btt22Bh93J3kO5s0d4
   A==;
IronPort-SDR: GOwsrbynXhQgcVaUUZ5wcF6isVmLyakDqa7zfI3JD7G2X7EMaslsGeOZW2/RKGymQisgtdKPd5
 i35WxST4zdmNgY8KSnPmOWteY6Nwz8L2CBjJvAj00QsK96RQTtQ/+sZvGRod8xaMcZFu7pttKN
 AYQ+4a9kHh47M5Oqz++RdRzCR+aqrIjTgbRWq3Nnci1AJAbDxRYI66d8ibp8QjiXspy0q+y3zo
 p73V9VzvTkt74fg0jg71UHLwAjqnihw8NE3qpENb3VSPMAIzSO0yTPPU9ow5jTMgtC5UklTFAT
 fiI=
X-IronPort-AV: E=Sophos;i="5.75,303,1589234400"; 
   d="scan'208";a="2608499"
Date: Thu, 2 Jul 2020 08:54:19 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][master|dunfell][PATCH] icedtea7-native: set ALT_CUPS_HEADERS_PATH to staging
Message-ID: <20200702065419.GA308462@pcleri>
References: <20200630190523.9795-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200630190523.9795-1-jpuhlman@mvista.com>
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

On Tue, Jun 30, 2020 at 12:05:23PM -0700, Jeremy Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
> ALT_CUPS_HEADERS_PATH eventually gets added to some links as
> -I/usr/include
> 
> If you are using the buildtools-extended-tarball, the limits.h
> from the system gets included first then later the limits.h
> from the buildtools tarball gets added again, but is missing
> glibc definitions, if the system glibc is much older(centos7).
> 
> This leads to:
> In file included from /usr/include/limits.h:124,
>                  from /usr/include/sys/param.h:26,
>                  from ../../../src/solaris/javavm/export/jvm_md.h:35,
>                  from ../../../src/share/javavm/export/jvm.h:32,
>                  from ../../../src/solaris/native/sun/awt/awt.h:33,
>                  from ../../../src/solaris/native/sun/awt/awt_p.h:75,
>                  from ../../../src/solaris/native/sun/awt/awt_MToolkit.c:26:
> /build/buildtools/sysroots/x86_64-montavistasdk-linux/usr/include/limits.h:145:17: error: missing binary operator before token "("
>   145 | #if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)
> 
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index b0b9419..ba94927 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -61,6 +61,7 @@ B = "${S}/build"
>  # openjdk looks in /usr/include and /usr/lib for freetype by default.
>  export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
>  export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
> +export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
>  
>  # libfreetype.so.6 is copied from STAGING_LIBDIR
>  # which is already stripped.
> -- 
> 2.20.1
