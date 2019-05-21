Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 129427E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 09:41:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457W4G2KkDz6p;
	Tue, 21 May 2019 11:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558431694;
	bh=J4EHlfwLJQvSfQdfi1gEeN4BuRel/MRgesDY8adjRtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNGpLKPlUJC0gagpHywjlEg67DT0Vt1Q/BS0Z1biVVd6j8gWHIua7lkbHrgoYeGj3
	Qt7grOzI2n3qB8ABTPX7WcQy9r3VDTbbsaeftTLHrLwmeAsGcknjtKk+DpZQHV8dGL
	GqgtzuisXfc1hpUGednwnxUhK/3blGiLN2L5BFp3i1z90AgNekjn+KcwuieeWNKWuV
	McAYd4Pz8BxUJnXX3o64Xqu+PDD0RguFtBEQ5HcoAmoE45E28drBumVA7La73R4QR7
	elYO/arPhCo42cbHtu7UCYr/+6BeGl6ugYOF3tRqecMyfLprAhXX0CerYr11t0PFQL
	MIqfdaZDpdEQFhQZbhLpdrSLj5kNs5C+C6qRVY2beprlnAkKLT+F+dSdvQde/owk00
	079EmRpKdBdyKk7BfFm/xik3Hich1D4/btw1pb8mJqGnbyRqCvnUFmQ57gh2MlcHiZ
	vqAqDomTwIcMD3g7ITe40zaQLlPyI1vldzU5ya1pQYyUVEiYodlYI017hpU3EeQtyE
	45JwDRHgukrVW3k/mTBcLeH7HKqzTfItbEKohdPivjWM3sjtin9wKTArgOSiZeZ+G6
	so3ht6L0lqrGzWAZyQE5aOX4pKeGoAWdljoc8p7f05WTA3ITL55SPmBlYrpL+Ft5Rp
	HjWqM9ClAVKB/MVj5HvYJRUM=
Date: Tue, 21 May 2019 12:41:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521094132.GF15108@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<b1fdd51d97dca34a7221649831fc3e0d832219b5.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b1fdd51d97dca34a7221649831fc3e0d832219b5.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 21/34] packagegroup-meta-networking: replace DISTRO_FEATURE by DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 09:41:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:21PM -0700, Armin Kuster wrote:
>...
> --- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> +++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> @@ -38,8 +38,9 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
>      inetutils wolfssl lftp miniupnpd networkmanager \
>      networkmanager-openvpn rdist nanomsg python-networkmanager \
>      wireless-regdb \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "bluez5 x11", "blueman", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "samba", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
>      "
>  
>  RDEPENDS_packagegroup-meta-networking-daemons = "\
> @@ -47,7 +48,7 @@ RDEPENDS_packagegroup-meta-networking-daemons = "\
>      ptpd igmpproxy opensaf squid \
>      atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
>      pure-ftpd vblade tftp-hpa ncftp \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "networkd-dispatcher", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispatcher", "", d)} \
>      "
>  
>  RDEPENDS_packagegroup-meta-networking-devtools = "\
> @@ -56,7 +57,7 @@ RDEPENDS_packagegroup-meta-networking-devtools = "\
>  
>  RDEPENDS_packagegroup-meta-networking-extended = "\
>      corosync \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "dlm", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dlm", "", d)} \
>      "
>  
>  RDEPENDS_packagegroup-meta-networking-filter = "\
> @@ -85,7 +86,7 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
>      tsocks freediameter xl2tpd babeld mdns net-snmp \
>      quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
>      radiusclient-ng openl2tp usrsctp \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "dante", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
>      "
>  
>  RDEPENDS_packagegroup-meta-networking-support = "\
> @@ -104,7 +105,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
>      netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
>      arptables macchanger nghttp2 strongswan fping \
>      dnssec-conf libesmtp cifs-utils open-isns \
> -    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "libldb", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
>      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
>      "
>...

This adds packages to packagegroups in a stable series.

I'd say removing the broken DISTRO_FEATURE lines would be better
than changing what gets installed to images in warrior.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


