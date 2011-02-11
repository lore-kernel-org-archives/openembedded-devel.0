Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po2l1-0008Be-RO
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 00:50:35 +0100
Received: by gwaa12 with SMTP id a12so1286109gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5Ex2f+pveb5OBBnSQjfDDHZl3upXA1t2kuaLTQ5gpZ4=;
	b=maYmU6Cq0VkXlOUnFt4wPXkPwQ/pc6dfzsfvvHBKWY0eKgIpbdPGa+lfBWgAMAlTZp
	5hQAtP8Y6H/RWWBeFpwtwP4yy8Irl+8+Fpp8ej17w5YV0YidwvRFhR9pz9anG74cA3rL
	xVzYPtmiC0X31iRN4Io4VFKR2PGXVBrPrUksY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UwEQniJgQWpot359fxLyTHte5NKcsMvdf54r27nOGBOzyH1X2LthR74mRf0yseIHAU
	x3VtB3ROeP6A9fS2r6hAQ1TpWvM7u5QiLMdZnfHUrymINv6M09xEUVX34CmmyTPs/FBO
	grcKNY3sfDu5gqZs27yd7F2SfqBSw3WBgW3PM=
Received: by 10.150.215.13 with SMTP id n13mr1315388ybg.281.1297468163235;
	Fri, 11 Feb 2011 15:49:23 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q4sm74071yba.2.2011.02.11.15.49.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 15:49:22 -0800 (PST)
Date: Fri, 11 Feb 2011 15:49:11 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211234911.GA1010@gmail.com>
References: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-2-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-3-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-4-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-5-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-6-git-send-email-ulf.samuelsson@atmel.com>
	<1296503466-3877-7-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
In-Reply-To: <1296503466-3877-7-git-send-email-ulf.samuelsson@atmel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 7/8] Add Wi-Fi support to at91
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
X-List-Received-Date: Fri, 11 Feb 2011 23:50:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 20:51), Ulf Samuelsson wrote:
> ---
>  recipes/owl-wifi/owl-wifi_1.0.4.bb |   31 +++++++++++++++++++++++++++++++
>  1 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/owl-wifi/owl-wifi_1.0.4.bb
> 
> diff --git a/recipes/owl-wifi/owl-wifi_1.0.4.bb b/recipes/owl-wifi/owl-wifi_1.0.4.bb
> new file mode 100644
> index 0000000..5e31b82
> --- /dev/null
> +++ b/recipes/owl-wifi/owl-wifi_1.0.4.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Driver for HD Wireless Wi-Fi device"
> +HOMEPAGE = "http://www.hd-wireless.se"
> +PRIORITY = "optional"
> +SECTION = "kernel/modules"
> +LICENSE = "GPL"
> +PR = "r1"

new recipe starts with r0

> +RDEPENDS = "wireless-tools \
> +	 wpa-supplicant \
> +	 "
> +
> +SRC_URI = "http://www.hd-wireless.se/images/stories/public_pdf/owl-linux-arm-${PV}.tar.gz \
> +	"
> +
> +S = "${WORKDIR}/owl-linux-arm-${PV}"
> +
> +inherit module
> +
> +do_compile () {
> +        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
> +        oe_runmake 'MODPATH=${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net' \
> +                   'KERNELDIR=${STAGING_KERNEL_DIR}' \
> +                   'KDIR=${STAGING_KERNEL_DIR}' \
> +                   'KERNEL_VERSION=${KERNEL_VERSION}' \
> +                   'CC=${KERNEL_CC}' \
> +                   'LD=${KERNEL_LD}'
> +}
> +
> +do_install() {
> +        install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
> +        install -m 0644 ${S}/owl*${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
> +}
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


