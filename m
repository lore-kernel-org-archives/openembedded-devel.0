Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqI86-000792-4e
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 06:44:14 +0100
Received: by dakf10 with SMTP id f10so159106dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 21:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1D7eC6FqvnamiFOXXsHJyUQMH+39jlGsjA336SShlCU=;
	b=xAg6GZvJ12q3k/hZr6Xyq/BaKrHdpxTObiHtDasOjY6SlMDvYh1hYu0JVVpsYFjo+u
	qaxuiDVy6/+qlTQimmSvDLqv48C4VmFsoaZBaLTdhsi4IMePH7E+UN62FQhCU2Iqbe+R
	9JsFNLGDO6UDUvfD7U3cVZiP9+kMgYJaY+DBs=
Received: by 10.68.74.170 with SMTP id u10mr2047307pbv.99.1327556185839;
	Wed, 25 Jan 2012 21:36:25 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm8301569pbh.15.2012.01.25.21.36.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 21:36:24 -0800 (PST)
Date: Wed, 25 Jan 2012 21:36:19 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126053619.GC5566@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
References: <1327488979-28233-1-git-send-email-yauhen.kharuzhy@promwad.com>
MIME-Version: 1.0
In-Reply-To: <1327488979-28233-1-git-send-email-yauhen.kharuzhy@promwad.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: Re: [PATCH 06/10] Add recipe for pptp-linux_1.7.2
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
X-List-Received-Date: Thu, 26 Jan 2012 05:44:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/12 13:56), Yauhen Kharuzhy wrote:
> From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
> 
> Recipe for this package has been taken from Openembedded-classic project.
> 
> Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
> ---
>  .../pptp-linux/pptp-linux-1.7.2/options.pptp       |   30 ++++++++++++++++++++
>  .../pptp-linux/pptp-linux_1.7.2.bb                 |   29 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
>  create mode 100644 meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb
> 
> diff --git a/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp b/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
> new file mode 100644
> index 0000000..f446e22
> --- /dev/null
> +++ b/meta/recipes-connectivity/pptp-linux/pptp-linux-1.7.2/options.pptp
> @@ -0,0 +1,30 @@
> +#
> +# Lock the port
> +#
> +lock
> +
> +#
> +# We don't need the tunnel server to authenticate itself
> +#
> +noauth
> +
> +#
> +# Turn off transmission protocols we know won't be used
> +#
> +nobsdcomp
> +nodeflate
> +
> +#
> +# We want MPPE
> +# (option naming specific to ppp 2.4.0 with unofficial patch)
> +#
> +#mppe-40
> +mppe-128
> +#mppe-stateless
> +
> +#
> +# We want a sane mtu/mru 
> +# (ppp 2.4.0 with unofficial patch)
> +#
> +#mtu 1000
> +#mru 1000
> diff --git a/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb b/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb
> new file mode 100644
> index 0000000..c04426a
> --- /dev/null
> +++ b/meta/recipes-connectivity/pptp-linux/pptp-linux_1.7.2.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
> +and OpenBSD client for the proprietary Microsoft Point-to-Point \
> +Tunneling Protocol, PPTP. Allows connection to a PPTP based \
> +Virtual Private Network (VPN) as used by employers and some \
> +cable and ADSL internet service providers."
> +HOMEPAGE = "http://pptpclient.sourceforge.net"
> +SECTION = "network"
> +LICENSE = "GPL"

mention gpl version too

> +LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +RDEPENDS_${PN} = "ppp"
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
> +           file://options.pptp"
> +
> +S = "${WORKDIR}/pptp-${PV}"
> +
> +do_compile() {
> +        oe_runmake
> +}
> +do_install() {
> +        install -d ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8
> +        install -m 555 pptp ${D}${sbindir}
> +        install -m 644 pptp.8 ${D}${mandir}/man8
> +        install -m 644 ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp
> +}
> +
> +SRC_URI[md5sum] = "4c3d19286a37459a632c7128c92a9857"
> +SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d37694bc"
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


