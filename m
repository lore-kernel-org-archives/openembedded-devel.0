Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdaBp-0007AD-S1
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:19:03 +0100
Received: by pxi17 with SMTP id 17so352016pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hY91bTDosrKeggfmgE8mD1CHm90f89MCSC7v/RawssQ=;
	b=frgAIHBOOcyyuD5r7nkFvijL++e+dQxyK9YCZZlr1dvgs5xdOSkCMP4f4a+84EEXku
	SJDZN7zzqysdrVZbHG60jv0+mVwraVnFFFjt3TKhoEoMegVbYDioP5zU/2qjagnyhEkJ
	Tsz3U7/6j4NbeMALcIpQihQV2pKiB6NDfDLwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=oL3ppzpTXIwZhgwz+ZEm4uaOw2d5S0zVTznuHA+VtykY4X+EOaVG5mINQI1nzt/Ivv
	b5XEx3YgmfEGnn5GthSbjXoiLdlZ70QH7yOe/KyiL2OJiuPk1OjgiMTGgTAcS/C6YHBw
	GY6B4YUdtNSQNLLwl5EA2SlOW5QK2IIJRVAhM=
Received: by 10.142.237.13 with SMTP id k13mr271755wfh.324.1294975107011;
	Thu, 13 Jan 2011 19:18:27 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm980405wfa.23.2011.01.13.19.18.25
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:18:26 -0800 (PST)
Message-ID: <4D2FC07E.9020505@gmail.com>
Date: Thu, 13 Jan 2011 19:18:22 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294928503-25643-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1294928503-25643-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] e2fsprogs: change mode of non-links only
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
X-List-Received-Date: Fri, 14 Jan 2011 03:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/2011 6:21 AM, Enrico Scholz wrote:
> From: Enrico Scholz<enrico.scholz@informatik.tu-chemnitz.de>
>
> When building as a dedicated user, compilation fails else in a way like
>
> | + cd ..../e2fsprogs-1.41.12-r27/e2fsprogs-1.41.12
> | + do_compile
> | + find ./ -print
> | + xargs chmod u=rwX
> | chmod: changing permissions of `./patches/llseek-uclibc.patch': Operation not permitted
> | ERROR: Function do_compile failed


alternatively you can exclude patches directory from feeding into chmod

>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   recipes/e2fsprogs/e2fsprogs.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
> index 34b9950..bdb4bbb 100644
> --- a/recipes/e2fsprogs/e2fsprogs.inc
> +++ b/recipes/e2fsprogs/e2fsprogs.inc
> @@ -23,7 +23,7 @@ EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, 1) == 'oabi
>   PARALLEL_MAKE = ""
>
>   do_compile_prepend () {
> -	find ./ -print|xargs chmod u=rwX
> +	find ./ ! -type l -print|xargs chmod u=rwX
>   	( cd util; ${BUILD_CC} subst.c -o subst )
>   }
>



