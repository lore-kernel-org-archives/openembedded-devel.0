Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nt9FG-0003Xp-Vd
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 01:42:27 +0100
Received: by gye5 with SMTP id 5so1994936gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Mar 2010 17:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BoPJgVR5TlZCmhGi7nIwRrmEWNsOafairNHXW/IVxr0=;
	b=Mxk343Z1ibN6GYtDs04mhiuKLyJKVoVBseK6QnDGsvBFj5yxaAxzQ9Mz7gJQD3erC4
	eEZTnMntxOByNmsN4ihyCZKrBbC5K0wEviclLiEZNeqjC6YJTEC3Sa0z6DOljqoeNaAo
	tgrElZP+Pl3zS5fhELc7JCtT1ff6vtkG+GAvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ozZ0uF1ISU6QLYxtKMjvMRkS6hj3DBpzGQQaiBQdxvlTv7P/iQGVtyVs0NF7L0yaEN
	kCHDgqgVpv8ifnYWlt3xeb24aASijHNc1Tjr9WRo1crenYfwkMK1nMqIZryfXCA2j41c
	CY3SgFLPoi2GPt3VmF0T6/HXDc9hl9ThVEvDM=
Received: by 10.101.3.15 with SMTP id f15mr10381417ani.60.1269131956000;
	Sat, 20 Mar 2010 17:39:16 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm1867202iwn.3.2010.03.20.17.39.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Mar 2010 17:39:15 -0700 (PDT)
Date: Sat, 20 Mar 2010 17:39:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100321003913.GB4351@gmail.com>
References: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
	<1267790132-25931-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1267790132-25931-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] busybox: use u-a for /etc/default/mountall (collision with util-linux-ng-mountall)
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
X-List-Received-Date: Sun, 21 Mar 2010 00:42:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/03/10 12:55), Martin Jansa wrote:

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/busybox/busybox.inc |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index b165d0f..d1904a6 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE = "GPL"
>  SECTION = "base"
>  PRIORITY = "required"
>  
> -INC_PR = "r25"
> +INC_PR = "r26"
>  
>  SRC_URI = "\
>    file://busybox-cron \
> @@ -39,7 +39,7 @@ PACKAGES =+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
>  # listed in the NEEDED field.
>  RRECOMMENDS += "libgcc"
>  
> -FILES_${PN}-mountall = "${sysconfdir}/default/mountall"
> +FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
>  RDEPENDS_${PN} += "${PN}-mountall"
>  
>  # Make busybox recommend busybox-syslog for those images that expect it
> @@ -128,7 +128,7 @@ do_install () {
>  	fi
>  	if grep "CONFIG_FEATURE_MOUNT_FSTAB=y" ${WORKDIR}/defconfig; then
>  		install -d ${D}${sysconfdir}/default
> -		install -m 644 ${WORKDIR}/mountall ${D}${sysconfdir}/default/
> +		install -m 644 ${WORKDIR}/mountall ${D}${sysconfdir}/default/mountall.${PN}
>  	fi
>  
>  	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
> @@ -145,6 +145,13 @@ pkg_postinst_${PN} () {
>  	while read link; do case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; bn=`basename $link`; update-alternatives --install $link $bn $to 50; done <$D/etc/busybox.links
>  }
>  
> +pkg_postinst_${PN}-mountall () {
> +	update-alternatives --install ${sysconfdir}/default/mountall default_mountall mountall.${PN} 50
> +}
> +pkg_prerm_${PN}-mountall () {
> +	update-alternatives --remove default_mountall mountall.${PN}
> +}
> +
>  pkg_prerm_${PN} () {
>  	# This is so you can make busybox commit suicide - removing busybox with no other packages
>  	# providing its files, this will make update-alternatives work, but the update-rc.d part
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


