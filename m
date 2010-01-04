Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NRwA4-0007Cr-Ul
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 00:16:36 +0100
Received: by gxk7 with SMTP id 7so10260348gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 15:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lJyQWFwZdVBoHcnqqsb99wqq0yya+rK6Q82CFiCg+TI=;
	b=A7p7TxuOJSxe4u5bAieyzRdz0oBFQtzUT6IvZJ+tmgbSYq2mrYk8Guwql7eFc/7JtH
	uPPjKRmn17lcEJYgNi3COhnTiLmBJH2tAdg9IQvKCYrGKGNvHyuFRQDEHh1AALGIjSMQ
	Q1LA05onxAMz5qWluTKwsKPhZjLF7Y/cHoeyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X3RMwJeB3xjnzlqRl9/QpTA82bbTNQgPkXOVwn0JNV/WLfj3V7eLKLCUjy2IQ6b0v8
	7bcqgiekkWsLaAqfepLYIjIQkGr9B8CudCRN/JarxEsZve4LscvQB8PsC/zk33nFegEB
	0sn4p9zNzn4SVmqL4/9/AnqCGI9TmRSRmHarw=
Received: by 10.150.234.15 with SMTP id g15mr11577913ybh.194.1262646869495;
	Mon, 04 Jan 2010 15:14:29 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm6371703ywh.17.2010.01.04.15.14.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 15:14:28 -0800 (PST)
Date: Mon, 4 Jan 2010 15:14:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100104231453.GA10191@gmail.com>
References: <>
 <1262417638-26595-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1262417638-26595-1-git-send-email-camelguo@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add --disable-decimal-float option to gcc-cross-intermediate/gcc-cross_4.4.2.bb
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
X-List-Received-Date: Mon, 04 Jan 2010 23:16:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/01/10 15:33), Guo Hongruan wrote:
> 1. Add --disable-decimal-float option to gcc-cross-intermediate_4.4.2.bb when LIBC == uclibc and TARGET_ARCH == i[3|4|5|6]86, without it, the compilation will failed due to lack of fenv.h.
> ---
>  recipes/gcc/gcc-cross-intermediate_4.4.2.bb |    7 +++++++
>  recipes/gcc/gcc-cross_4.4.2.bb              |    7 ++++++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
> index 3ca59aa..4bb1004 100644
> --- a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
> +++ b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
> @@ -1,9 +1,16 @@
>  require gcc-cross_${PV}.bb
>  require gcc-cross-intermediate.inc
>  
> +PR = "${INC_PR}.2"
> +
>  DEPENDS += "gmp-native mpfr-native"
>  
>  EXTRA_OECONF += " --disable-libmudflap \
>  		  --disable-libgomp \
>  		  --disable-libssp \
>  		"
> +
> +EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i386', '--disable-decimal-float', '',d)}"
> +EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i486', '--disable-decimal-float', '',d)}"
> +EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i586', '--disable-decimal-float', '',d)}"
> +EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH', 'i686', '--disable-decimal-float', '',d)}"

It should be disabled for all uclibc based arch/distro combo's
and the change should go to gcc-<version>.inc files as in my original
patch.



