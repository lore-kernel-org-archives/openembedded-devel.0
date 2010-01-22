Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYRtm-0003Ck-3J
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 23:22:41 +0100
Received: by fxm4 with SMTP id 4so1657625fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 14:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AvjGHZq8YcrfDdz9/Tm8EvMKqDdWZRG61vsSWNpBtq0=;
	b=SqxQFCkFL1pfGSDtbE3H3F1Bjms+nWR9Ds2laPwbLzIpBAw6YtjG+q8k1Yop2TABnj
	VXqO+72iyzaOC/vsMjMwM7o7MqoHs0EMeHuAYdjwWVtlBzeHCJM63H+cvOKgKRHM9v1w
	ktpz+pt7ca+FGDhZr8qCe8cnec4fTGIBkhNBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bKmi+IoPuIxn2yXhCvSQUU/dn9ii3yVcbGSACOu+13ZLmm2NchUWXBVzhDmDicjPHS
	zhJP2TFZxqk8JjijWmlelxgGjsZlAXwfEfAwxWSYu5exMC6oA2svjyjAQQwHDg8zgk/c
	WW9sD8Lxdf2/9rvHkVt/CQL1shEikHvBHOC7k=
Received: by 10.223.76.77 with SMTP id b13mr3581636fak.74.1264198820119;
	Fri, 22 Jan 2010 14:20:20 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 13sm1563347fxm.5.2010.01.22.14.20.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 14:20:19 -0800 (PST)
Date: Fri, 22 Jan 2010 14:21:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100122222101.GC2074@gmail.com>
References: <n> <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Fri, 22 Jan 2010 22:22:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/01/10 22:58), Michael Lippautz wrote:
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  recipes/gpsd/gpsd.inc     |    9 ++++++---
>  recipes/gpsd/gpsd_2.38.bb |    4 +++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
> index a917fbe..5efbe2a 100644
> --- a/recipes/gpsd/gpsd.inc
> +++ b/recipes/gpsd/gpsd.inc
> @@ -5,12 +5,14 @@ LICENSE = "GPL"
>  DEPENDS = "dbus-glib ncurses python"
>  PROVIDES = "virtual/gpsd"
>  
> +INC_PR = "r0"
> +

this should be set to r2 or more because that was already revision where
the recipe was at. 

Otherwise ok.

>  EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
>                  --x-libraries=${STAGING_LIBDIR} \
>                  --enable-dbus \
> -                --enable-python"
> +"
>  
> -SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> +SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
>             file://gpsd-default \
>             file://gps-hardware \
>             file://gpsd"
> @@ -28,6 +30,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  do_compile_prepend() {
>      export BUILD_SYS="${BUILD_SYS}"
>      export HOST_SYS="${HOST_SYS}"
> @@ -41,7 +45,6 @@ do_install_prepend() {
>  
>  do_install_append() {
>          install -d ${D}/${sysconfdir}/init.d
> -        install -d ${D}/dev
>          install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
>          install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sysconfdir}/init.d/gps-hardware.default
>          install -d ${D}/${sysconfdir}/default
> diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
> index 06a5fe7..7c7a477 100644
> --- a/recipes/gpsd/gpsd_2.38.bb
> +++ b/recipes/gpsd/gpsd_2.38.bb
> @@ -1,5 +1,7 @@
>  require gpsd.inc
>  
> -PR = "r2"
> +PR = "${INC_PR}.1"
>  # make attempts to link gpspacket.so without waiting for all compiler tasks:
>  PARALLEL_MAKE = ""
> +
> +EXTRA_OECONF += " --enable-python "
> -- 
> 1.6.4.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


