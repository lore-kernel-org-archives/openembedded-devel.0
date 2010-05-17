Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE86g-0004mi-4x
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 23:45:34 +0200
Received: by pwj5 with SMTP id 5so2510528pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=jdIr0rUFdqxLPHnHr8gx6fyEQB7nVaUf4qE0ODjVDtI=;
	b=qwpyQTpvs6SW48d00vl3mEMJ/fw13BLsOkz33EDXZL5FC64aLGTZnPx6juQ7/G9OUy
	49hRQOv7h1HnPV+QTgnaYzg34Si25YDLEkdViSksQW8wSc7dhC8vlplbf4Lw3Guhwymy
	Ee7lYD8YM1Qvyos/XleTFEz4Eo+AfKmug5+U8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=rXhWahglBRewb9FHzy6uzRx6r9bwQLXjxI3h2T6xnW68835l3MNfWnXsi/Qwns6FN7
	cQSHYSz8YjTBHIl58OVHaTnkGG3VRgkIfvZssTdYxKDWzEns6cIJnDEubO5xUCfbhIct
	nIcewikK5O9LaKhRr5dXu5hbWmTInoXoZowFI=
Received: by 10.114.33.26 with SMTP id g26mr4913943wag.216.1274132392163;
	Mon, 17 May 2010 14:39:52 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 33sm52560825wad.20.2010.05.17.14.39.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 14:39:51 -0700 (PDT)
Date: Mon, 17 May 2010 14:40:19 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517214019.GA8515@gmail.com>
References: <AANLkTikfszFRLw6Ct-aEAUcu1xs8hRLdQRROW8OswCb7@mail.gmail.com>
	<hso7fa$2lh$2@dough.gmane.org>
	<AANLkTilux_HTutdHJZKh7hipzViaahkx7OtLOI6RFaVj@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilux_HTutdHJZKh7hipzViaahkx7OtLOI6RFaVj@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Mon, 17 May 2010 21:47:51 -0000
X-List-Received-Date: Mon, 17 May 2010 21:47:51 -0000
X-List-Received-Date: Mon, 17 May 2010 21:47:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/05/10 18:05), João Henrique Freitas wrote:
> Nothing special. This was a mistake.

instead of incremental change can you reply to your previous patch with
complete patch which includes this change as well. 

-Khem
> 
> ---
>  recipes/cgreen/cgreen.inc    |    2 --
>  recipes/cgreen/cgreen_svn.bb |    6 ------
>  2 files changed, 0 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
> index 9c71db5..eb3307e 100644
> --- a/recipes/cgreen/cgreen.inc
> +++ b/recipes/cgreen/cgreen.inc
> @@ -11,5 +11,3 @@ BBCLASSEXTEND = "native sdk"
> 
>  inherit cmake
> 
> -#FILES_${PN}-dev += "${bindir}/*-config"
> -#FILES_${PN}-utils = ""
> diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
> index 88dad6d..65f2f34 100644
> --- a/recipes/cgreen/cgreen_svn.bb
> +++ b/recipes/cgreen/cgreen_svn.bb
> @@ -13,9 +13,3 @@ EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
>  EXTRA_OECMAKE = ""
> 
>  OECMAKE_SOURCEPATH = "../cgreen"
> -
> -PARALLEL_MAKE = ""
> -CCACHE = ""
> -
> -
> -
> -- 
> 1.7.0.4
> 
> 
> -- 
> -----------------------------------------------------------
> João Henrique Freitas - joaohf_at_gmail.com
> Campinas-SP-Brasil
> BSD051283
> LPI 1
> http://www.joaohfreitas.eti.br

> From ec5f835f78bd4cfee7da3202ce075b2c6db3f5c2 Mon Sep 17 00:00:00 2001
> From: Joao H. Freitas <joaohf@gmail.com>
> Date: Sun, 16 May 2010 18:00:34 -0300
> Subject: [PATCH v2 8/9] Remove mistake configs
> 
> ---
>  recipes/cgreen/cgreen.inc    |    2 --
>  recipes/cgreen/cgreen_svn.bb |    6 ------
>  2 files changed, 0 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
> index 9c71db5..eb3307e 100644
> --- a/recipes/cgreen/cgreen.inc
> +++ b/recipes/cgreen/cgreen.inc
> @@ -11,5 +11,3 @@ BBCLASSEXTEND = "native sdk"
>  
>  inherit cmake
>  
> -#FILES_${PN}-dev += "${bindir}/*-config"
> -#FILES_${PN}-utils = ""
> diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
> index 88dad6d..65f2f34 100644
> --- a/recipes/cgreen/cgreen_svn.bb
> +++ b/recipes/cgreen/cgreen_svn.bb
> @@ -13,9 +13,3 @@ EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
>  EXTRA_OECMAKE = ""
>  
>  OECMAKE_SOURCEPATH = "../cgreen"
> -
> -PARALLEL_MAKE = ""
> -CCACHE = ""
> -
> -
> -
> -- 
> 1.7.0.4
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



