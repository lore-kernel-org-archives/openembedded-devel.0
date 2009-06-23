Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2D4-00063Y-A4
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:22:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MJ22N-0008Fd-1U
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:11:31 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:11:31 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:11:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:11:14 +0200
Message-ID: <h1q67i$a5v$1@ger.gmane.org>
References: <4A4097CA.9040207@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <4A4097CA.9040207@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Added PREFERRED_VERSION_classpath to support JVM in KaeilOS distro
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
X-List-Received-Date: Tue, 23 Jun 2009 09:22:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:52, Marco Cavallini wrote:
>  From 182247f1699cd20c442bcb0d1f34bf6b4a555313 Mon Sep 17 00:00:00 2001
> From: koan<koan@mozart.(none)>

That's not a valid email address

> Date: Tue, 23 Jun 2009 10:49:25 +0200
> Subject: [PATCH] Added PREFERRED_VERSION_classpath to support JVM in KaeilOS distro
>    with contribution of Ronetix (www.ronetix.at)
>
>
> Signed-off-by: koan<koan@mozart.(none)>

That's not a valid email address


> ---
>   conf/distro/kaeilos.conf |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index 2b3aae8..1d75976 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -3,7 +3,7 @@
>   #@NAME: KaeilOS(R) -http://www.kaeilos.com
>   #@DESCRIPTION: KaeilOS Linux Distribution for Kernel 2.6 based devices
>   #@MAINTAINER: Marco Cavallini<m.cavallini@koansoftware.com>
> -#@VERSION: 28-04-2009
> +#@VERSION: 23-04-2009
>   #
>   # Use this at your own risk, we welcome bugreports filed at
>   #http://bugs.openembedded.net
> @@ -12,7 +12,7 @@
>   #DISTRO_VERSION = "2009.1"
>   DISTRO_VERSION = "2009.1-test-${DATE}"
>   DISTRO_REVISION = "1"
> -DISTRO_PR = ".1"
> +DISTRO_PR = ".2"
>
>   #build staging from packages
>   INHERIT += "packaged-staging"
> @@ -130,6 +130,9 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
>   PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
>   PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
>
> +#Other packages version
> +PREFERRED_VERSION_classpath ?= "0.97.2"
> +
>   # Virtuals:
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
> -- 1.5.4.3
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




