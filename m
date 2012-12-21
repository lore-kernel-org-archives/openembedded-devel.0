Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tm1c6-0008Nf-0S for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 13:22:06 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tm1O1-0004Yc-EW for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 13:07:33 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:07:33 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:07:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Dec 2012 13:07:05 +0100
Message-ID: <kb1jd5$cmt$1@ger.gmane.org>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
	<1356007963-12208-2-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1356007963-12208-2-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-multimedia PATCH 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Fri, 21 Dec 2012 12:22:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-12-12 13:52, Ross Burton schreef:
> Signed-off-by: Ross Burton <ross.burton@intel.com> --- 
> meta-multimedia/recipes-connectivity/gupnp/gssdp.inc   |   16
> ++++++++++++++++ .../recipes-connectivity/gupnp/gssdp_0.12.2.1.bb       |
> 5 +++++ .../recipes-connectivity/gupnp/gssdp_0.13.2.bb         |    8
> ++++++++ 3 files changed, 29 insertions(+) create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gssdp.inc create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb create mode
> 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
> 
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
> b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc new file mode
> 100644 index 0000000..51befd9 --- /dev/null +++
> b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc @@ -0,0 +1,16 @@ 
> +SUMMARY = "Resource discovery and announcement over SSDP" +DESCRIPTION =
> "GSSDP implements resource discovery and announcement over SSDP (Simpe
> Service Discovery Protocol)." +LICENSE = "LGPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7" +DEPENDS =
> "glib-2.0 libsoup-2.4 gobject-introspection-stub vala-stub-native" + 
> +inherit autotools pkgconfig + +PACKAGES =+ "gssdp-tools" + 
> +FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade" + 
> +EXTRA_OECONF = "--disable-introspection" + +PACKAGECONFIG ??=
> "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}" 
> +PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"

Minor nit: variables are grouped by task and ordered by task order, so
FILES/PACKAGES/R* goes below EXTRA_OECONF/do_configure/do_compile/do_install



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQ1FDpMkyGM64RGpERAh9SAJ0Yg4G0MXH+zAfMEoEfNAB42YGu4gCfbhpC
y6er7oRE3tVTjJekedFm02Q=
=fT9I
-----END PGP SIGNATURE-----



