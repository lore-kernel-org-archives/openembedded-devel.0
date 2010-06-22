Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OR5AQ-0000SY-BU
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 17:13:39 +0200
Received: by pxi2 with SMTP id 2so26705pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PXnMC5RSrRt2mNZKXow3lRzgIO3R3RLr/Ny2In2SnBM=;
	b=DPM6UcWZZAPCfE7N9tD9430stMMQf/3dOOSfqd5kIdVeVnPe9RtaXlQjHnYFBeSV9Z
	Q9WVxFhVukZ/DvGnDGtOdyP94VYxA67RmQ/8zshNBMyJi9Mj4eWm90uM052XBENevHnL
	K/U4FK6H7fR/NFZ417WI3GnAJGG2NMXVi0Sx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CHCHbqu11M9hbalt2izyyS6L98ed0nVqKwa1mOWswwPDwAQCKrCmP8x6QBCi3ie95o
	bS4sGbsYsePNDg3IFvp8YLHq/2/B7bqhEScP5KVpL0Ty3D6DOshqXrVXpi6zUjSRfLZs
	fTFznXScIiNpZqHPFCtoKi1huioEMA3nxBjGo=
Received: by 10.143.154.28 with SMTP id g28mr5273586wfo.70.1277218017417;
	Tue, 22 Jun 2010 07:46:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id u34sm517337wfh.20.2010.06.22.07.46.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 07:46:56 -0700 (PDT)
Date: Tue, 22 Jun 2010 07:47:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100622144759.GB32544@gmail.com>
References: <4C1FDFAE.8040704@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C1FDFAE.8040704@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH] Make packaged-staging use more correct PSTAGE_PKGARCH
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
X-List-Received-Date: Tue, 22 Jun 2010 15:13:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/06/10 14:54), Tom Rini wrote:
> packaged-staging.bbclass: Change PSTAGE_PKGARCH to something dynamic
> 
> Currently, we make all pstage packages be locked to BUILD_SYS which
> causes annoying warnings in some cases and doesn't allow for sharing
> between say 32 and 64bit (which is valid for target bits).
> 
> This changes to ${PACKAGE_ARCH}-${HOST_SYS} for everything and
> reworks the opkg.conf we generate to add entries as needed.
> 
> There is an alternative, suggested by Chris Larson, that we modify
> PSTAGE_PKGARCH in an anon python function so that we can avoid
> things like 'x86_64-x86_64-linux' in native packages and similar
> duplication in sdk packages, or otherwise be more dynamic (use
> HOST_OS instead of SYS and then catch the cross case, etc).

I think this approach sounds better having same arch repeated twice
would be confusing

> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> diff --git a/classes/packaged-staging.bbclass
> b/classes/packaged-staging.bbclass
> index 8a98940..d6ac67b 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
>  -12,7 +12,7 @@
>  # bitbake.conf set PSTAGING_ACTIVE = "0", this class sets to "1" if
> we're active
>  #
>  PSTAGE_PKGVERSION = "${PV}-${PR}"
> -PSTAGE_PKGARCH    = "${BUILD_SYS}"
> +PSTAGE_PKGARCH    = "${PACKAGE_ARCH}-${HOST_SYS}"
>  PSTAGE_EXTRAPATH  ?= "/${OELAYOUT_ABI}/${DISTRO_PR}/"
>  PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
>  PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}',
> d).replace('_', '-')}"
>  -148,15 +148,15 @@ staging_helper () {
>  	# Assemble appropriate opkg.conf
>  	conffile=${PSTAGE_MACHCONFIG}
>  	mkdir -p ${PSTAGE_WORKDIR}/pstaging_lists
> +	arch="${PSTAGE_PKGARCH}"
>  	if [ ! -e $conffile ]; then
> -		ipkgarchs="${BUILD_SYS}"
> -		priority=1
> -		for arch in $ipkgarchs; do
> -			echo "arch $arch $priority" >> $conffile
> -			priority=$(expr $priority + 5)
> -		done
> +		echo "arch $arch 1" > $conffile
>  		echo "dest root /" >> $conffile
>  	fi
> +	if [ -f $conffile -a `grep -q $arch $conffile;echo $?` -ne 0 ]; then
> +		priority=$(expr `grep -cE "^arch" $conffile` + 1)
> +		sed -i -e "/dest/iarch $arch $priority" $conffile
> +	fi
>  	if [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then
>  		mkdir -p ${TMPDIR}${libdir_native}/opkg/info/
>  	fi
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


