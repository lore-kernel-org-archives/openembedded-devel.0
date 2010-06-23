Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTkQ-0006AU-9C
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:28:27 +0200
Received: by pzk3 with SMTP id 3so189365pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BP0LEBvvLpK1Hvy4hisNlkrWENSXN7ZNZGiDfRvENL8=;
	b=F9xiFbIpNxHeaqnwuJEQdUytBlbF5KsahN//0Y40xJ6YQ52zhEFBmv0WCELXHu+WOF
	aXhFDRrvlDO8DgYKNCg+58I17gD8AeDwTpMDZScLUkfIvoChrrdTCrBRkUUPVwBtPO2m
	mZWMpYOw1+GONJT1RmOWtHbJcK2CI0xB29Of8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=A7N6DCmIq4OlEd627kloi9cRBVUvZSwxGrPbz865EtW/MCgHQaCHFI9gWlOW0QPlH7
	0R8dUnuSLoFBQ5Ua9xJPGT2GBdSzmCywa5CgXRbG2Dhcl4WAVNz9HYrgtZSDY4UwOhcQ
	+Xdtmb54ZKrZ9R7dZ9D6PH11/pSx83fNH9iNs=
Received: by 10.142.10.27 with SMTP id 27mr7440899wfj.265.1277313828813;
	Wed, 23 Jun 2010 10:23:48 -0700 (PDT)
Received: from gmail.com ([99.57.141.118])
	by mx.google.com with ESMTPS id l29sm6091870rvb.16.2010.06.23.10.23.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:23:47 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:24:53 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623172453.GD5535@gmail.com>
References: <4C1FDFAE.8040704@mentor.com> <20100622144759.GB32544@gmail.com>
	<4C210735.5090202@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C210735.5090202@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
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
X-List-Received-Date: Wed, 23 Jun 2010 17:28:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/06/10 11:55), Tom Rini wrote:
> Khem Raj wrote:
> >On (21/06/10 14:54), Tom Rini wrote:
> >>packaged-staging.bbclass: Change PSTAGE_PKGARCH to something dynamic
> >>
> >>Currently, we make all pstage packages be locked to BUILD_SYS which
> >>causes annoying warnings in some cases and doesn't allow for sharing
> >>between say 32 and 64bit (which is valid for target bits).
> >>
> >>This changes to ${PACKAGE_ARCH}-${HOST_SYS} for everything and
> >>reworks the opkg.conf we generate to add entries as needed.
> >>
> >>There is an alternative, suggested by Chris Larson, that we modify
> >>PSTAGE_PKGARCH in an anon python function so that we can avoid
> >>things like 'x86_64-x86_64-linux' in native packages and similar
> >>duplication in sdk packages, or otherwise be more dynamic (use
> >>HOST_OS instead of SYS and then catch the cross case, etc).
> >
> >I think this approach sounds better having same arch repeated twice
> >would be confusing
> 
> Here we go.  This also reworks generating opkg.conf a little bit (it
> had multiple entries before due to a lazy grep).
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

very nice

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> diff --git a/classes/packaged-staging.bbclass
> b/classes/packaged-staging.bbclass
> index 8a98940..19a6a6d 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -12,7 +12,7 @@
>  # bitbake.conf set PSTAGING_ACTIVE = "0", this class sets to "1" if
> we're active
>  #
>  PSTAGE_PKGVERSION = "${PV}-${PR}"
> -PSTAGE_PKGARCH    = "${BUILD_SYS}"
> +PSTAGE_PKGARCH    = "${PACKAGE_ARCH}-${HOST_OS}"
>  PSTAGE_EXTRAPATH  ?= "/${OELAYOUT_ABI}/${DISTRO_PR}/"
>  PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
>  PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}',
> d).replace('_', '-')}"
> @@ -28,6 +28,12 @@ PSTAGE_NATIVEDEPENDS = "\
> 
>  BB_STAMP_WHITELIST = "${PSTAGE_NATIVEDEPENDS}"
> 
> +python __anonymous() {
> +    # We need PSTAGE_PKGARCH to contain information about the target.
> +    if bb.data.inherits_class('cross', d):
> +        bb.data.setVar('PSTAGE_PKGARCH',
> "${HOST_SYS}-${PACKAGE_ARCH}-${TARGET_OS}", d)
> +}
> +
>  python () {
>      pstage_allowed = True
> 
> @@ -148,14 +154,13 @@ staging_helper () {
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
> +	elif [ `grep -c " $arch " $conffile` -eq 0 ]; then
> +		priority=$(expr `grep -cE "^arch" $conffile` + 1)
> +		sed -i -e "/dest/iarch $arch $priority" $conffile
>  	fi
>  	if [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then
>  		mkdir -p ${TMPDIR}${libdir_native}/opkg/info/
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


