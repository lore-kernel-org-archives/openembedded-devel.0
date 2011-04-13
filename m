Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q9rwe-0001GU-6f
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 06:44:48 +0200
Received: by fxm19 with SMTP id 19so257100fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 21:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Ax+x5427REQCCjwXN1XCY2Eb/Lw/BWsTWuOUr5z0zpo=;
	b=e0QofEaJR7LKEUp4yd+LSVFXXBYYbNX36zC0UfaBb3KdHDX9kRvKL0JgtFgWKuEwOr
	rEacpZq2RJJQGOGXIxhLnTtRdyoMrDj4ExcXxQeCasDkvoECTRNnK+nP8HHJj80mqjm7
	xIz8yl1J8OYe49bl1ShvoX5CEFhe4bShscpY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=MTho3VgB5MVJG6xrjFTxPYNttYc5lpd6bqk3W4SGbzPYoiN/hz4yMCmKjLFl1+VTkZ
	CFwvYlPp9BAAlLijThH68qW05yDwYwc3WDiADu4LuqNHYN9OYJecFRG0eTdO5Gf14exU
	ceKRr6syZqEOeel9LZ/iIQbmbMFwb7p1goKqU=
Received: by 10.223.54.213 with SMTP id r21mr3007583fag.54.1302669754087; Tue,
	12 Apr 2011 21:42:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Tue, 12 Apr 2011 21:42:04 -0700 (PDT)
In-Reply-To: <1302645212-16114-1-git-send-email-eyalr@ti.com>
References: <1302645212-16114-1-git-send-email-eyalr@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Apr 2011 21:42:04 -0700
Message-ID: <BANLkTikm7r94gCyfTa4zEyhvybVUzAoorQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eyal Reizer <eyalreizer@googlemail.com>, Eyal Reizer <eyalr@ti.com>
Subject: Re: [PATCH] hostap-daemon: Build from git sources
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
X-List-Received-Date: Wed, 13 Apr 2011 04:44:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2011 at 2:53 PM, Eyal Reizer <eyalreizer@googlemail.com> wr=
ote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
> =C2=A0recipes/hostap/hostap-daemon-git/defconfig | =C2=A0187 ++++++++++++=
++++++++++++++++
> =C2=A0recipes/hostap/hostap-daemon_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 37 ++++++
> =C2=A02 files changed, 224 insertions(+), 0 deletions(-)
> =C2=A0create mode 100755 recipes/hostap/hostap-daemon-git/defconfig
> =C2=A0create mode 100755 recipes/hostap/hostap-daemon_git.bb
>
> diff --git a/recipes/hostap/hostap-daemon-git/defconfig b/recipes/hostap/=
hostap-daemon-git/defconfig
> new file mode 100755
> index 0000000..4fd9061
> --- /dev/null
> +++ b/recipes/hostap/hostap-daemon-git/defconfig
> @@ -0,0 +1,187 @@
> +# Example hostapd build time configuration
> +#
> +# This file lists the configuration options that are used when building =
the
> +# hostapd binary. All lines starting with # are ignored. Configuration o=
ption
> +# lines must be commented out complete, if they are not to be included, =
i.e.,
> +# just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS and LIBS c=
an also
> +# be modified from here. In most cass, these lines should use +=3D in or=
der not
> +# to override previous values of the variables.
> +
> +#CC=3D$(CROSS_COMPILE)gcc
> +#CFLAGS +=3D -I$(NFSROOT)/include -DCONFIG_LIBNL20
> +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> +#LIBS +=3D -L$(NFSROOT)/lib -lnl-genl
> +#LIBS_p +=3D -L$(NFSROOT)/lib
> +#LIBDIR =3D $(NFSROOT)/lib
> +#BINDIR =3D $(NFSROOT)/usr/sbin
> +
> +# Driver interface for Host AP driver
> +CONFIG_DRIVER_HOSTAP=3Dy
> +
> +# Driver interface for wired authenticator
> +#CONFIG_DRIVER_WIRED=3Dy
> +
> +# Driver interface for madwifi driver
> +#CONFIG_DRIVER_MADWIFI=3Dy
> +#CFLAGS +=3D -I../../madwifi # change to the madwifi source directory
> +
> +# Driver interface for drivers using the nl80211 kernel interface
> +CONFIG_DRIVER_NL80211=3Dy
> +CONFIG_LIBNL20=3Dy
> +# driver_nl80211.c requires a rather new libnl (version 1.1) which may n=
ot be
> +# shipped with your distribution yet. If that is the case, you need to b=
uild
> +# newer libnl version and point the hostapd build to use it.
> +#LIBNL=3D$(LIBNL_PATH)
> +#CFLAGS +=3D -I$(LIBNL)/include
> +#LIBS +=3D -L$(LIBNL)/lib
> +
> +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> +#CONFIG_DRIVER_BSD=3Dy
> +#CFLAGS +=3D -I/usr/local/include
> +#LIBS +=3D -L/usr/local/lib
> +#LIBS_p +=3D -L/usr/local/lib
> +#LIBS_c +=3D -L/usr/local/lib
> +
> +# Driver interface for no driver (e.g., RADIUS server only)
> +#CONFIG_DRIVER_NONE=3Dy
> +
> +# IEEE 802.11F/IAPP
> +CONFIG_IAPP=3Dy
> +
> +# WPA2/IEEE 802.11i RSN pre-authentication
> +CONFIG_RSN_PREAUTH=3Dy
> +
> +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> +CONFIG_PEERKEY=3Dy
> +
> +# IEEE 802.11w (management frame protection)
> +# This version is an experimental implementation based on IEEE 802.11w/D=
1.0
> +# draft and is subject to change since the standard has not yet been fin=
alized.
> +# Driver support is also needed for IEEE 802.11w.
> +#CONFIG_IEEE80211W=3Dy
> +
> +# Integrated EAP server
> +CONFIG_EAP=3Dy
> +
> +# EAP-MD5 for the integrated EAP server
> +CONFIG_EAP_MD5=3Dy
> +
> +# EAP-TLS for the integrated EAP server
> +CONFIG_EAP_TLS=3Dy
> +
> +# EAP-MSCHAPv2 for the integrated EAP server
> +CONFIG_EAP_MSCHAPV2=3Dy
> +
> +# EAP-PEAP for the integrated EAP server
> +CONFIG_EAP_PEAP=3Dy
> +
> +# EAP-GTC for the integrated EAP server
> +CONFIG_EAP_GTC=3Dy
> +
> +# EAP-TTLS for the integrated EAP server
> +CONFIG_EAP_TTLS=3Dy
> +
> +# EAP-SIM for the integrated EAP server
> +#CONFIG_EAP_SIM=3Dy
> +
> +# EAP-AKA for the integrated EAP server
> +#CONFIG_EAP_AKA=3Dy
> +
> +# EAP-AKA' for the integrated EAP server
> +# This requires CONFIG_EAP_AKA to be enabled, too.
> +#CONFIG_EAP_AKA_PRIME=3Dy
> +
> +# EAP-PAX for the integrated EAP server
> +#CONFIG_EAP_PAX=3Dy
> +
> +# EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-PS=
K)
> +#CONFIG_EAP_PSK=3Dy
> +
> +# EAP-SAKE for the integrated EAP server
> +#CONFIG_EAP_SAKE=3Dy
> +
> +# EAP-GPSK for the integrated EAP server
> +#CONFIG_EAP_GPSK=3Dy
> +# Include support for optional SHA256 cipher suite in EAP-GPSK
> +#CONFIG_EAP_GPSK_SHA256=3Dy
> +
> +# EAP-FAST for the integrated EAP server
> +# Note: Default OpenSSL package does not include support for all the
> +# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL=
,
> +# the OpenSSL library must be patched (openssl-0.9.9-session-ticket.patc=
h)
> +# to add the needed functions.
> +#CONFIG_EAP_FAST=3Dy
> +
> +# Wi-Fi Protected Setup (WPS)
> +CONFIG_WPS=3Dy
> +# Enable UPnP support for external WPS Registrars
> +#CONFIG_WPS_UPNP=3Dy
> +
> +# EAP-IKEv2
> +#CONFIG_EAP_IKEV2=3Dy
> +
> +# Trusted Network Connect (EAP-TNC)
> +#CONFIG_EAP_TNC=3Dy
> +
> +# PKCS#12 (PFX) support (used to read private key and certificate file f=
rom
> +# a file that usually has extension .p12 or .pfx)
> +CONFIG_PKCS12=3Dy
> +
> +# RADIUS authentication server. This provides access to the integrated E=
AP
> +# server from external hosts using RADIUS.
> +#CONFIG_RADIUS_SERVER=3Dy
> +
> +# Build IPv6 support for RADIUS operations
> +CONFIG_IPV6=3Dy
> +
> +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> +#CONFIG_IEEE80211R=3Dy
> +
> +# Use the hostapd's IEEE 802.11 authentication (ACL), but without
> +# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net802=
11)
> +#CONFIG_DRIVER_RADIUS_ACL=3Dy
> +
> +# IEEE 802.11n (High Throughput) support
> +#CONFIG_IEEE80211N=3Dy
> +
> +# Remove debugging code that is printing out debug messages to stdout.
> +# This can be used to reduce the size of the hostapd considerably if deb=
ugging
> +# code is not needed.
> +#CONFIG_NO_STDOUT_DEBUG=3Dy
> +
> +# Remove support for RADIUS accounting
> +#CONFIG_NO_ACCOUNTING=3Dy
> +
> +# Remove support for RADIUS
> +#CONFIG_NO_RADIUS=3Dy
> +
> +# Remove support for VLANs
> +#CONFIG_NO_VLAN=3Dy
> +
> +# Remove support for dumping state into a file on SIGUSR1 signal
> +# This can be used to reduce binary size at the cost of disabling a debu=
gging
> +# option.
> +#CONFIG_NO_DUMP_STATE=3Dy
> +
> +# Enable tracing code for developer debugging
> +# This tracks use of memory allocations and other registrations and repo=
rts
> +# incorrect use with a backtrace of call (or allocation) location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging
> +# This enables use of libbfd to get more detailed symbols for the backtr=
aces
> +# generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +
> +
> diff --git a/recipes/hostap/hostap-daemon_git.bb b/recipes/hostap/hostap-=
daemon_git.bb
> new file mode 100755
> index 0000000..a81d651
> --- /dev/null
> +++ b/recipes/hostap/hostap-daemon_git.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION =3D "User space daemon for extended IEEE 802.11 management"
> +HOMEPAGE =3D "http://hostap.epitest.fi"
> +SECTION =3D "kernel/userland"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "libnl openssl"
> +PR =3D "r0"
> +SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "git://w1.fi/srv/git/hostap.git;protocol=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 file://defconfig \
> + =C2=A0 =C2=A0 =C2=A0 file://init"
> +
> +S =3D "${WORKDIR}/git/hostapd"
> +
> +inherit update-rc.d
> +INITSCRIPT_NAME=3Dhostapd
> +
> +do_configure() {
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> +}
> +
> +do_compile() {
> + =C2=A0 =C2=A0 =C2=A0 make

may be use oe_runmake here instead of bare make

> +}
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir=
}
> + =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/hostapd ${D}${sbindir}
> + =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> + =C2=A0 =C2=A0 =C2=A0 install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/i=
nit.d/hostapd
> +}
> +
> +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


