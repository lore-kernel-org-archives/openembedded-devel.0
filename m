Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLd61-0002mI-4u
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 16:14:34 +0200
Received: by pxi14 with SMTP id 14so1087679pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rNE33eglKb7uqD3eX5LSFe1Wn9YSrkmClSxRMhAYSV4=;
	b=Wb4Xc+SfsulKobVIHD88p2/dcrn4zPOpHlSd5XsguQsV6WsGdjsgThg408Ie7DzM/D
	eDf/WPr+8mHfi8JbQFQtfkGGV7/1Da33nDb+lHinRgHs0efMBKBc7IMKA/52DPuK+8M6
	XgG+0nRtqALDkYrNHsoY5G3A9fm/BbMfv7+fc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JtIWchzDtc1UsDmDhBM38UmvcnRab9MwqGQxsbN7FTucZ3v4uN8WLyPNDLSPcYmU9+
	0jdpYX44e21dlqZHm+Fu5TKOseyrKgujE4FNsuuNeLjT42iV5LNYPdXoBzN5om25H+nq
	7gvdYPiZ2/W2FMIXVmQF/5+Cd1vBrZHGdQtO8=
Received: by 10.114.237.20 with SMTP id k20mr11618950wah.185.1275919803323;
	Mon, 07 Jun 2010 07:10:03 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id r20sm39135128wam.17.2010.06.07.07.10.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 07:10:01 -0700 (PDT)
Date: Mon, 7 Jun 2010 07:10:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607141000.GA4570@gmail.com>
References: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>
	<AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>
	<AANLkTin8ybTRctnuKkR9h6lFHZFQDJTLlI7wB2vrc6AA@mail.gmail.com>
	<AANLkTinbCpiUj5C33NE1kx07ZLKRljT92ip6-JD5Ftfn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinbCpiUj5C33NE1kx07ZLKRljT92ip6-JD5Ftfn@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Mon, 07 Jun 2010 14:14:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/06/10 09:40), Cliff Brake wrote:
> On Fri, Jun 4, 2010 at 3:47 PM, Chris Larson <clarson@kergoth.com> wrote:
> > Please change ${srcuri} to $srcuri, so its very clear that its expanded in
> > shell, rather than letting bitbake try to expand it and fail since its unset
> > :)
> >
> > After that, Acked-by: Chris Larson <chris_larson@mentor.com>
> 
> Thanks!  Updated patch attached.  Can I get one more ack?
> 
> Thanks,
> Cliff

> From de0cd8124077b62e96d3c3487b5d8cecab55d837 Mon Sep 17 00:00:00 2001
> From: Cliff Brake <cbrake@bec-systems.com>
> Date: Wed, 2 Jun 2010 14:03:15 -0400
> Subject: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
> 
> Currently with srctree, we get errors like the following:
> | + srcuri=
> | + '[' '' == '' ']'
> | + srcuri=OpenEmbedded
> | + echo 'Source: '
> | ++ find /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg '(' -name '*.la' -o -name '*-config' ')' -type f
> | + stage-manager-ipkg-build -o 0 -g 0 /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/pstage/angstromglibc
> | *** Error: CONTROL/control is missing field Source
> | The Source field contain the URL's or filenames of the source code and any patches
> | used to build this package.  Either gnu-style tarballs or Debian source packages
> | are acceptable.  Relative filenames may be used if they are distributed in the same
> | directory as the .ipk file.
> |
> | ipkg-build: Please fix the above errors and try again.
> | ERROR: Function staging_packager failed
> NOTE: package autotools-demo-1.0-28-g3a96627-r0: task do_package_stage: Failed
> ERROR: TaskFailed event exception, aborting
> 
> This patch fixes that issue.
> 
> Acked-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com

>
> ---
>  classes/packaged-staging.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
> index 83f3578..68c973a 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -374,7 +374,7 @@ staging_packager () {
>  	if [ "$srcuri" == "" ]; then
>  		srcuri="OpenEmbedded"
>  	fi
> -	echo "Source: ${SRC_URI}"               >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> +	echo "Source: $srcuri"               >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
>  
>  	# Deal with libtool not supporting sysroots
>  	# Need to remove hardcoded paths and fix these when we install the
> -- 
> 1.7.0.4
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



