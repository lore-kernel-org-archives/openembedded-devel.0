Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqYJ-00044L-SF
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:12:56 +0100
Received: by pxi17 with SMTP id 17so263822pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=sBwRIiFM4Ay0+zE/3omTzJbW+Ray5Z/A8YHjL/AmtGc=;
	b=Mtz4rgIGINpqLHQye4AzC9HrXXIf/6nc9LtkBk4X3xPlEROJ+CrlB6gNfSIus68lCK
	gRHfp2zqEjF3PiGEz0tcoodTX5xAJTUHaGqQwrXWG2UILm0IqYXIC2aPgdnbUcCZ5pKh
	85SzZ3b7Am1ojwIRbTrkLrYSnFJkqfEFN025E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=hqMNBcBQT6uo6pIFHf8cfpEpHG2yvxtpvlk4YxUfT+vynLfdeuPokhZtBhL64RIsXH
	3SGKUfydzLqCMyiyoqFAbv2YG37aVSFPJUYz5LxBlJXdJGte2PuK6qcmW9r12IBkVLO5
	wfraizMVUsATnx5jExjuuQg4gLAs7ydyKpKd4=
Received: by 10.142.135.2 with SMTP id i2mr912500wfd.408.1297897901729;
	Wed, 16 Feb 2011 15:11:41 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm346924wfh.6.2011.02.16.15.11.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:11:40 -0800 (PST)
Date: Wed, 16 Feb 2011 15:11:43 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216231143.GV14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-13-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-13-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 13/13] distro/micro.conf: drop exec_prefix_native since it is unused
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
X-List-Received-Date: Wed, 16 Feb 2011 23:12:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  conf/distro/micro.conf |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 963afa8..b1f8f1e 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -91,7 +91,6 @@ PACKAGE_SNAP_LIB_SYMLINKS = "1"
>  prefix = ""
>  exec_prefix = ""
>  prefix_native = ""
> -exec_prefix_native = ""

This looks sane as micro wants flat root file system for target and may
be not so for build host sysroot

Acked-by: Khem Raj <raj.khem@gmail.com>

>  
>  # Don't install ldconfig and associated gubbins
>  USE_LDCONFIG = "0"
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


