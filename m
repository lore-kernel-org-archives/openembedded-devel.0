Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRMUb-0001Ky-FF
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 11:15:54 +0100
Received: by ywi6 with SMTP id 6so2577309ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 02:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=WdtOfkR8IhH4pZoauRgr4NQE5+jMi+PXvI20lOUm2Tg=;
	b=rMYIL4njzoEmf4nDiULbr3kiHygnfCqUUdFF/vD/ptpMF1LXrpjkTivXCCf8HoHlW8
	qNDYHgvM8O4+0qAE7lMNFVtskp3qohf3NQGAYS9tehYrwLXxOeEbjDgESHcheSyVDMsA
	V5s3yHGp6Mi/ivupHTpPXR91V6ZSliYOr1ytQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aSh+ByyOfKyb/C29QvcmhqIp4lQxqJTYHm7Q3xM0cSoF3HiHsOzkMK9P7XJGNQ0vkG
	O9Sv6TwHNo/IeVciIKRMNO/CdMWMM9AFudYR+H+M4tqob1g2mF7UoUkgqya5kD2Hl1+X
	k6NDfzU3IGe6K/yIN761MsZGNMsrnOJUshvh8=
Received: by 10.100.140.1 with SMTP id n1mr1195916and.4.1292062458806;
	Sat, 11 Dec 2010 02:14:18 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t1sm4492278ano.23.2010.12.11.02.14.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 02:14:18 -0800 (PST)
Date: Sat, 11 Dec 2010 02:14:15 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211101415.GA10409@gmail.com>
References: <4CF6EB6D.8080404@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4CF6EB6D.8080404@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] task-proper-tools.bb: Exclude some packages if DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Sat, 11 Dec 2010 10:15:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/12/10 11:12), Graham Gower wrote:
> From 3fa2634efe81e5d711a423497e3b76a66a821766 Mon Sep 17 00:00:00 2001
> From: Graham Gower <graham.gower@gmail.com>
> Date: Thu, 2 Dec 2010 11:10:47 +1030
> Subject: [PATCH] task-proper-tools.bb: Exclude some packages if DISTRO_FEATURES lacks ipv6.
> 
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/tasks/task-proper-tools.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/tasks/task-proper-tools.bb b/recipes/tasks/task-proper-tools.bb
> index 5162749..bda774c 100644
> --- a/recipes/tasks/task-proper-tools.bb
> +++ b/recipes/tasks/task-proper-tools.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Full versions of tools provided by busybox"
> -PR = "r15"
> +PR = "r16"
>  
>  inherit task
>  
> @@ -21,9 +21,9 @@ RDEPENDS_${PN} = "\
>  		grep \
>  		gzip \
>  		ifupdown \
> -		iproute2 \
> +		${@base_contains('DISTRO_FEATURES', 'ipv6', 'iproute2', '', d)} \
>  		iputils-arping \
> -		iputils-ping6 \
> +		${@base_contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
>  		iputils-ping \
>  		iputils \
>  		less \
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


