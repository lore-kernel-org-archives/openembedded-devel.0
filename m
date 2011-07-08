Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qf3Ll-0004Pa-09
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 07:11:37 +0200
Received: by iwn4 with SMTP id 4so1543028iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=94/9LOW1OmKbUTiX6HxPUQ5S0ATRVquUVB6oSJNbmo4=;
	b=kFIaM1w2v82lQfk2Om4gv16PIiw77mbfk0rLbaAx7AAZEVc/L9VXysmEsWEOCJ330H
	00AVTq2g73/vcyhLWei0zOFPg+dF8pVxWF6iwfAd6EYCC7HcFokaLBLLTBiLGRRYvKV0
	DZWMs2DayV8hwA3yLXhm1odYt5T++eRLA9uqM=
Received: by 10.42.132.71 with SMTP id c7mr1753115ict.147.1310101662979;
	Thu, 07 Jul 2011 22:07:42 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w11sm5845016ibw.41.2011.07.07.22.07.41
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 22:07:42 -0700 (PDT)
Message-ID: <4E16909C.7080600@gmail.com>
Date: Thu, 07 Jul 2011 22:07:40 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>	<201107061734.31202.GNUtoo@no-log.org>	<CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
	<CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
In-Reply-To: <CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
Subject: Re: [PATCH-proposal] fix vlc building (-fPIC error) by patching live555 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 05:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 07/06/2011 02:44 PM, Sylvain Paré wrote:
> Patch attached. removed unneeded line
>
>
>  From 9e01ea60bf7790f1250ef24a317507e255f3f947 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Sylvain=20'GarthPS'=20Par=C3=A9?=<sylvain.pare@gmail.com>
> Date: Wed, 6 Jul 2011 23:36:14 +0200
> Subject: [PATCH] live555 recipe: added -fPIC flag need by VLC to build with
> live555 support
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> Signed-off-by: Sylvain 'GarthPS' Paré<sylvain.pare@gmail.com>
> ---
>   recipes/live555/live555.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/live555/live555.inc b/recipes/live555/live555.inc
> index 14e97bb..6de57cb 100644
> --- a/recipes/live555/live555.inc
> +++ b/recipes/live555/live555.inc
> @@ -18,6 +18,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>
>   do_configure() {
>       cp ${WORKDIR}/config.linux-cross .
> +    echo "COMPILE_OPTS+=" -fPIC "">>  config.linux-cross

Did you try adding -fPIC to CFLAGS

>       ./genMakefiles linux-cross
>   }
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



