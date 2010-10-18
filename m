Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7uvd-0005si-KQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:59:27 +0200
Received: by bwz9 with SMTP id 9so886609bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=VWNsIt4UPuq9TbfZC/6Nr5wycIZlyRKmZwlsCIU/BOY=;
	b=XH3PykjDx1dnms4l+LT2cYBEVXzMXgtkzyQxooo6n1CqSzPXte1XCMIIOTPDm6vxkH
	TuDQmagadn3DOnHWa6A6mMuGMdmgIxg/gx3UepdGhlpKWZTehG35k/v8hT5VcHNllLd5
	+sULBxKYOSpVXnb4cmFqtslFJvDEkgdP7H1ls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QUs/0TPhscMXmnof060PMbLheHOl5qW4AXV3pU0sW0kv02btN9c3DNQS5PPte+DcRr
	kOr9BiHX3Q3R9OVsqdqngzOHr9H76C0tatCxl6znknRnFhXjM2v7GgihRe+OoWUTlyn7
	tMXxtyN7pYA8NtQ2tNSnw9Y1mdnTySqILaJZw=
Received: by 10.204.113.65 with SMTP id z1mr4837622bkp.25.1287428333629;
	Mon, 18 Oct 2010 11:58:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d12sm5650359bkw.7.2010.10.18.11.58.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 11:58:52 -0700 (PDT)
Date: Mon, 18 Oct 2010 20:58:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018185843.GG3324@jama>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
	<1287427884-1517-8-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1287427884-1517-8-git-send-email-morphis@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 07/15] initscripts-shr: remove unused usb-gadget script for palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:59:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2010 at 08:51:16PM +0200, Simon Busch wrote:
> This script was resonsible for activating networking over usb but is not needed anymore as
> our default kernel for the palmpre machine activates usb networking per default.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/shr/initscripts-shr/palmpre/usb-gadget.sh |   10 ----------
>  recipes/shr/initscripts-shr_0.0.1.bb              |    8 +-------
>  2 files changed, 1 insertions(+), 17 deletions(-)
>  delete mode 100644 recipes/shr/initscripts-shr/palmpre/usb-gadget.sh
> 
> diff --git a/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh b/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh
> deleted file mode 100644
> index d755495..0000000
> --- a/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#!/bin/sh
> -
> -# usb gadget configuration:
> -# there already different configurations on the palm pre defined,
> -# we choose nr 5 cause it provides the usbnet, novacom
> -# and storage gadget
> -if [ -e /sys/class/usb_gadget/config_num ]; then
> -	echo 5 > /sys/class/usb_gadget/config_num
> -fi
> -
> diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/initscripts-shr_0.0.1.bb
> index 120c325..e4dc736 100644
> --- a/recipes/shr/initscripts-shr_0.0.1.bb
> +++ b/recipes/shr/initscripts-shr_0.0.1.bb
> @@ -5,7 +5,7 @@ DEPENDS = ""
>  RDEPENDS_${PN} = "procps"
>  LICENSE = "GPL"
>  PV = "0.0.1"
> -PR = "r19"
> +PR = "r20"
>  
>  RCONFLICTS_${PN} = "initscripts"
>  
> @@ -31,7 +31,6 @@ SRC_URI = "file://alignment.sh \
>  	   file://umountfs \
>  	   file://umountnfs.sh \
>  	   "
> -SRC_URI_append_palmpre = " file://usb-gadget.sh"
>  
>  inherit base
>  
> @@ -75,11 +74,6 @@ do_install () {
>  	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
>  	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
>  
> -	if [ "${MACHINE}" == "palmpre" ]; then
> -		install -m 0755 ${WORKDIR}/usb-gadget.sh ${D}${sysconfdir}/init.d
> -		ln -sf ../init.d/usb-gadget.sh ${D}${sysconfdir}/rcS.d/S00usb-gadget.sh
> -	fi
> -
>  #
>  # Create runlevel links
>  #
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


