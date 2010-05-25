Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvPF-0007Wp-01
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:46:57 +0200
Received: by wwi18 with SMTP id 18so303115wwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nnpVBTyw+dHfM4sgBP0aJ0CxQ6PFLrmWCfhVRpGLWfM=;
	b=Zgrw+1rYc9/XF8slNJXN5hFwzfGu87G7MC9DWfR6q0GFrSdk3mfnmlZUysqfjRIyG3
	kxFxrlkStk2vKnvD6wbUmdd1mcTS72GIcjDM3eAXxd/CYX/uNDYZ0qZvuSZB7Ss5tOKW
	rfYSE4ycLQs0ZsVtoL206UTAErpm/nx/FwiRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aU/A42vz9hcDMxhpnz/URrhkyuvOZroda8dFGpFjIV9gY43Q920UzTuEV6FqfaCE28
	DeASIQHlauFur1zzSrKAZa3d4PjEL7YOM2QBWpYrsMtcdIb5Je9H6vBF+9l5TmUOqGmt
	tJqspqcQpmOczTn9Rbf40wXY6xnkuo+2LGYkY=
Received: by 10.216.89.135 with SMTP id c7mr4789863wef.132.1274798569951;
	Tue, 25 May 2010 07:42:49 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x9sm1649707wej.21.2010.05.25.07.42.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:42:48 -0700 (PDT)
Date: Tue, 25 May 2010 07:42:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525144236.GD26493@gmail.com>
References: <1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
	<1274796590-1788-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274796590-1788-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-openmoko: move DESCRIPTION to .inc, remove OEV, KERNEL_RELEASE and KERNEL_VERSION
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
X-List-Received-Date: Tue, 25 May 2010 14:46:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/05/10 16:09), Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/linux/linux-openmoko.inc        |    2 ++
>  recipes/linux/linux-openmoko_2.6.24.bb  |   10 ++--------
>  recipes/linux/linux-openmoko_2.6.28.bb  |   10 ++--------
>  recipes/linux/linux-openmoko_2.6.29.bb  |   10 ++--------
>  recipes/linux/linux-openmoko_2.6.32.bb  |   10 +++-------
>  recipes/linux/linux-openmoko_2.6.34_git |    8 ++------
>  6 files changed, 13 insertions(+), 37 deletions(-)
> 
> --- a/recipes/linux/linux-openmoko_2.6.32.bb
> +++ b/recipes/linux/linux-openmoko_2.6.32.bb
> @@ -1,19 +1,15 @@
>  require linux.inc
>  require linux-openmoko.inc
>  
> -DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE="2.6.32.13"
> -
>  SRCREV = "a9254be10ac2294ea20165a87c09ea6afcf66d94"
> -OEV = "oe2"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> +PR = "r1"
> +PR_append = "+gitr${SRCPV}"
>  
>  SRC_URI = "\
>    git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.32 \
>    file://0001-Revert-s3cmci-initialize-default-platform-data-no_wp.patch;patch=1 \
>  # latest stable patch for ubi fix 943e167cb3e8fb191894bde8a4a75db78531a7c8
> -  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_RELEASE}.bz2;patch=1;name=stablepatch \
> +  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-2.6.32.13.bz2;patch=1;name=stablepatch \

you could have use ${PV}.13 here



