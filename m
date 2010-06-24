Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoHb-0004u8-UU
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:24:55 +0200
Received: by pxi2 with SMTP id 2so1015469pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YAVNEKntoHrjrKiJZvY2iBmr41CvKUH6YDmQUZ/4xmo=;
	b=f/ICnvNzgY492OxAvEeeJVpXlp53s3IQBZvI+l5uZBQwfhOSDGIUpHjhw4gc6GA2T9
	1/P89tcGsZVWJbi5gghD//OL6TzupH+HBGzb41IVVFx5QlmBpAk6p8yuSJ/goy/vZFTV
	VKFsDrB7hF7OSmnsdVOw0nEq5nB1DkjEeHF18=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rH/ruUUMH/ai9sA56oDnGx/FJiOYr2KgUWQujOAQAno8n33Xfe7IsyqkPo7S5YJH9p
	VQowilh4tkZcIxKXzHRm7u02CfB1GotnPPbCDYE6B2eHo79akgXO26ARVEhHxBzuNvWX
	NZFhb9UYs0o8VTvdu25y5OywfCsnk06rl7O3s=
Received: by 10.114.215.12 with SMTP id n12mr9676616wag.68.1277392765014;
	Thu, 24 Jun 2010 08:19:25 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm56240550wae.10.2010.06.24.08.19.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:19:22 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:20:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624152032.GE28292@gmail.com>
References: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] evas-native: drop PACKAGES_DYNAMIC to hide multiple providers errors
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
X-List-Received-Date: Thu, 24 Jun 2010 15:34:13 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:34:13 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:34:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 11:18), Martin Jansa wrote:
> * while building image lot of errors like this:
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match evas-engine-buffer
>   NOTE: multiple providers are available for runtime evas-engine-fb (evas-native, evas)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/efl1/evas-native_svn.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/efl1/evas-native_svn.bb b/recipes/efl1/evas-native_svn.bb
> index a769976..5a599ec 100644
> --- a/recipes/efl1/evas-native_svn.bb
> +++ b/recipes/efl1/evas-native_svn.bb
> @@ -1,6 +1,7 @@
>  require evas.inc
>  inherit native
>  DEPENDS = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
> +PACKAGES_DYNAMIC = ""
>  PR = "r3"
>  
>  EXTRA_OECONF = "\
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


