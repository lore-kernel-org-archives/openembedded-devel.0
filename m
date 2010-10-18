Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7uxK-0006KP-Mc
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 21:01:12 +0200
Received: by bwz9 with SMTP id 9so888249bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=t0OePPQprUOEndNGR706FmPt5UwWvDexYqWKysCejZ8=;
	b=ZM7qQQSsMWdV+lJ17VhDwEP15GugdlZzvqpLPCXSb98IocAFK3FCMJIpu4hm8ztNit
	Xna3qJLVbRw/spD0mqgNTJhs3/eD1RU90+zZn5iS+cP6nhopOGhsBUJV0pGm2GaPbQTJ
	sep8nTTfxD83d0ft7icPdZEuNOTD7KTzpexXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bwA5JYDUg0vG+kmcdA3C3wn1yBGb755Vpf7rCH9emjYU7e/80DoIOayGpBBS5+rChP
	YdTolFn0m7oF0oahccTWlFkClQRXI8InWU3pfiSWGWdh93c1ytYmSSAhmtBa2xhYNVtM
	gRGmH+MaQg34pr9oIucrHXEdAEcnPsuG5RxS4=
Received: by 10.204.102.203 with SMTP id h11mr4731002bko.139.1287428435952;
	Mon, 18 Oct 2010 12:00:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm7408983bkw.2.2010.10.18.12.00.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 12:00:35 -0700 (PDT)
Date: Mon, 18 Oct 2010 21:00:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018190026.GH3324@jama>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
	<1287427884-1517-6-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1287427884-1517-6-git-send-email-morphis@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/15] palmpre: prefer git version of tslib
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
X-List-Received-Date: Mon, 18 Oct 2010 19:01:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2010 at 08:51:14PM +0200, Simon Busch wrote:
> The git version of tslib is currently the only one which has support for the cy8mrln
> touchscreen which is used on the palmpre device.

As stated few times (even today).. machines shouldn't decide versions,
please patch preferred-shr-versions, I'm OK with using git version
there.

> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  conf/machine/palmpre.conf |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/palmpre.conf b/conf/machine/palmpre.conf
> index 2a62c30..f5852c5 100644
> --- a/conf/machine/palmpre.conf
> +++ b/conf/machine/palmpre.conf
> @@ -20,6 +20,9 @@ require conf/machine/include/omap3.inc
>  # Put it below omap3.inc as we override the kernel here
>  PREFERRED_PROVIDER_virtual/kernel = "linux-palmpre"
>  
> +# We need the git version of tslib as this is the only one providing support for our
> +# attached touchscreen
> +PREFERRED_VERSION_tslib = "1.0+git%"
>  
>  IMAGE_FSTYPES += "tar.bz2"
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


