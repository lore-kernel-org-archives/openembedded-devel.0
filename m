Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORU41-00022Q-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:48:42 +0200
Received: by pvg3 with SMTP id 3so644248pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Bsk+ZcCMEgtuem77+/qCGAX0xLUa6NjdBoBiRuDmMwI=;
	b=OZabtIXAg5MAeZ4yv/jrcLDBoedBFovMbmm41UuXtrhX+XC7ycQuyjKLoRuHLDNHg9
	KeQ4MxXQKL2s9csxNgJk+2JzmYzZnR7nqlcEfHoKVUTIa8ct/FPOOOtskMUPhZcFxZA4
	QTH7qezALT64edVniDHnKKopyEm/XtUkt47cA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rJiNf1gYT3P/9K8RsuHOttHFSCfu8NtLrHbwmXF6bEw4DntBy+jY+5sjP+lh6HVPOX
	AUb77u9iLZlkirh2slzYfiYg8zOZMPrtnIrHhUlQR1YCmO4T8ui6e5wd8atYeN9mTHbj
	c9H6VUIT0jQUMYH+AM6J4z4GpRLlCywFn0B5o=
Received: by 10.142.65.24 with SMTP id n24mr7500635wfa.302.1277314643375;
	Wed, 23 Jun 2010 10:37:23 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b2sm1436492rvn.19.2010.06.23.10.37.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:37:21 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:38:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623173828.GI5535@gmail.com>
References: <1277307626-24691-1-git-send-email-vjensen@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1277307626-24691-1-git-send-email-vjensen@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>, Vitus Jensen <vjensen@gmx.de>
Subject: Re: [STABLE][PATCH] kernel bbclass: switch to u-boot-mkimage-native
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
X-List-Received-Date: Wed, 23 Jun 2010 17:48:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/06/10 17:40), Vitus Jensen wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> This is a long demanded change. The u-boot-mkimage is up to date to OE standards, while the openmoko one is not
> (cherry picked from commit 7425e92b1c7918c8c3b609950dbdb44dd488f1fe)
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 39a9af5..7279e00 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -14,7 +14,7 @@ python __anonymous () {
>      kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
>      if kerneltype == 'uImage':
>      	depends = bb.data.getVar("DEPENDS", d, 1)
> -    	depends = "%s u-boot-mkimage-openmoko-native" % depends
> +    	depends = "%s u-boot-mkimage-native" % depends
>      	bb.data.setVar("DEPENDS", depends, d)
>  
>      image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


