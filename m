Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nt9GC-0003bE-4y
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 01:43:24 +0100
Received: by gxk24 with SMTP id 24so616757gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Mar 2010 17:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HditVWuA1TurhvSv34IewgwY0cK7PoV5DCDcscECvmA=;
	b=aRYdzSXPaLKAqiGfURH5g6+G2BYbKaME13rkthQy3etpC4nAk8nLv2blB05lVB0LBK
	QszbeFa7jWq8v+c6OMFz/cu6rIyyDvTJH2S2a96xHrGg8OpkqSGEtCaVewUkN7gCE0DD
	bCdkYx9hrhI+twDkkKeRu6nidB7+VjB3t6hig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KFNrcB+ekJ29nYOtyTkQr0N6PG92Fhban856zKNh4T6y+pvq5uIDDoDVfcCtuDM8qB
	6JAHIAB9F/OJRkK8i+vARNoHhfMUZoSrqEJszIL7F0QpBPQbZiDbpxT7LgmZBkadJHkG
	gmA4fmIRUXWZnWL29sik9VvWTrdb1drhExgok=
Received: by 10.91.164.5 with SMTP id r5mr2508743ago.95.1269132013050;
	Sat, 20 Mar 2010 17:40:13 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm1309456iwn.4.2010.03.20.17.40.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Mar 2010 17:40:12 -0700 (PDT)
Date: Sat, 20 Mar 2010 17:40:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100321004010.GC4351@gmail.com>
References: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
	<1267790132-25931-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1267790132-25931-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] util-linux-ng: use u-a for /etc/default/mountall (collision with busybox-mountall)
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
X-List-Received-Date: Sun, 21 Mar 2010 00:43:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/03/10 12:55), Martin Jansa wrote:

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/util-linux-ng/util-linux-ng.inc |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 7f4333b..031b80b 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -7,7 +7,7 @@ inherit autotools
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -INC_PR = "r9"
> +INC_PR = "r10"
>  
>  # allows for a release candidate
>  RC ?= ""
> @@ -46,7 +46,7 @@ FILES_util-linux-ng-umount = "${base_bindir}/umount.${PN}"
>  FILES_util-linux-ng-readprofile = "${base_sbindir}/readprofile.${PN}"
>  
>  PACKAGES =+ "${PN}-mountall"
> -FILES_${PN}-mountall = "${sysconfdir}/default/mountall"
> +FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
>  RREPLACES_${PN}-mountall = "busybox-mountall"
>  
>  RRECOMMENDS_${PN} = "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-mount util-linux-ng-readprofile "
> @@ -152,7 +152,7 @@ do_install () {
>          done
>  
>  	install -d ${D}${sysconfdir}/default/
> -	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
> +	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall.${PN}
>  
>  	rm ${D}${sbindir}/swapoff -f
>  	ln -sf ${base_sbindir}/swapon.${PN} ${D}${base_sbindir}/swapoff.${PN}
> @@ -269,3 +269,10 @@ pkg_prerm_util-linux-ng-readprofile () {
>      update-alternatives --remove readprofile readprofile.${PN} 100
>  }
>  
> +pkg_postinst_util-linux-ng-mountall () {
> +        update-alternatives --install ${sysconfdir}/default/mountall default_mountall mountall.${PN} 100
> +}
> +pkg_prerm_util-linux-ng-mountall () {
> +        update-alternatives --remove default_mountall mountall.${PN}
> +}
> +
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


