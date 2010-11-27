Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PMKDS-0000Dm-PZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 13:49:24 +0100
Received: by fxm17 with SMTP id 17so1337459fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 04:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Z6dGY/rBCqLMqGhAHD3zu9YTUPl2ibGQzlQyxgK/phY=;
	b=xPMArOTYJjIN5rDZ1gZUsZOS1TVkvyvRnV2+XxkVOdeoDFL4s1W8uJhHwp/fNn5ndQ
	Hsnd0+5pkoltpUyzbe/cKEh2Eje2RX98QBr7LgIb0vtKZBcozrhEf3kNG/fOsoDk3kZi
	w5XDg4GZAsmce0dIrL6gjWE2872vFFNpm09oQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JVALp8D2A8TNto7gJX00b7MsNnakivw+3cUOr8YOyBluvm+WP8fUV87oanxW6Xc9Dw
	rx7bTcwPSudHMTDk8FCX4WfOglB89Kw69+qjBytGKoxAxzUHxX7IReBdCzKGrnysgKC/
	U5iNPYP1/M0aLDwWwRGbPi1/VSoErn4t/BQ1o=
Received: by 10.223.93.133 with SMTP id v5mr718975fam.119.1290862078679;
	Sat, 27 Nov 2010 04:47:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm691683fav.2.2010.11.27.04.47.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 27 Nov 2010 04:47:57 -0800 (PST)
Date: Sat, 27 Nov 2010 13:47:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101127124756.GC3238@jama>
References: <1290860534-8484-1-git-send-email-schwarzkopf@sensortherm.de>
MIME-Version: 1.0
In-Reply-To: <1290860534-8484-1-git-send-email-schwarzkopf@sensortherm.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dash_0.5.5.1: New download link for patch
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
X-List-Received-Date: Sat, 27 Nov 2010 12:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 27, 2010 at 01:22:14PM +0100, Klaus Schwarzkopf wrote:
> The newest patch on the old download directory is dash_0.5.5.1-7.3.diff.gz
> ---
>  recipes/dash/dash_0.5.5.1.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/dash/dash_0.5.5.1.bb b/recipes/dash/dash_0.5.5.1.bb
> index 319917d..bf00d4c 100644
> --- a/recipes/dash/dash_0.5.5.1.bb
> +++ b/recipes/dash/dash_0.5.5.1.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION = "The Debian Almquist Shell is a POSIX compliant shell that is much smaller than 'bash'."
>  PROVIDES = "virtual/sh"
>  LICENSE = "BSD GPL"
> +PR = "r0"

this is defaut, putting it here won't change anything, if you want
everyone to rebuild it (with new, but same sources) then you have to
use r1.

>  SRC_URI = "http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}.orig.tar.gz;name=archive \
> -	http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}-2.3.diff.gz;name=patch \
> +	https://launchpad.net/debian/sid/+source/dash/0.5.5.1-2.3/+files/dash_${PV}-2.3.diff.gz;name=patch \
>  	file://makefile-build-cc.diff"
>  
>  SRC_URI[archive.md5sum] = "7ac832b440b91f5a52cf8eb68e172616"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


