Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QAkh1-0005Hc-9w
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 17:12:20 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3FF7kmj013801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:07:46 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3FF7kut011494
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:07:46 -0500 (CDT)
Received: from dnce72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3FF7jJd026013
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 10:07:45 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by dnce72.ent.ti.com
	([137.167.131.87]) with mapi; Fri, 15 Apr 2011 17:07:29 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Apr 2011 17:07:24 +0200
Thread-Topic: Ping: [PATCHv2] hostap-daemon: build from git sources
Thread-Index: Acv6B/TpbZLnVoVhQDy2DmvRFRjcVABdrv/w
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F033202A724@dnce02.ent.ti.com>
References: <y> <1302718094-6384-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1302718094-6384-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {D8094EAB-5BA4-4247-B557-DDDCF4307EFF}
x-cr-hashedpuzzle: AGSW BBYz CKw3 Co6Z D2R6 EV5c E1BQ Fuh6 Fv7l Fwch GZHB
	HP++ HeJZ IUQA IU4A Ifs0; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {D8094EAB-5BA4-4247-B557-DDDCF4307EFF};
	ZQB5AGEAbAByAEAAdABpAC4AYwBvAG0A; Fri, 15 Apr 2011 15:07:24
	GMT;
	UABpAG4AZwA6ACAAWwBQAEEAVABDAEgAdgAyAF0AIABoAG8AcwB0AGEAcAAtAGQAYQBlAG0AbwBuADoAIABiAHUAaQBsAGQAIABmAHIAbwBtACAAZwBpAHQAIABzAG8AdQByAGMAZQBzAA==
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Ping: [PATCHv2] hostap-daemon: build from git sources
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
X-List-Received-Date: Fri, 15 Apr 2011 15:12:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Wednesday, April 13, 2011 1:08 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCHv2] hostap-daemon: build from git sources
>=20
> * Builds a new version 0.8.x which is not released yet as a zip file.
>   This version has new features like WIFI-direct used in new mac80211
>   versions
> * As the recipe is very similar to the 0.7.3 version, I have created
>   a common include file shared between the 0.7.3 version and the
>   git version
> * Updated the 0.7.3 recipe to use this include file and bumped the PR
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/hostap/hostap-daemon-0.7.inc       |   26 ++++
>  recipes/hostap/hostap-daemon-git/defconfig |  187
> ++++++++++++++++++++++++++++
>  recipes/hostap/hostap-daemon_0.7.3.bb      |   29 +----
>  recipes/hostap/hostap-daemon_git.bb        |   16 +++
>  4 files changed, 233 insertions(+), 25 deletions(-)
>  create mode 100644 recipes/hostap/hostap-daemon-0.7.inc
>  create mode 100644 recipes/hostap/hostap-daemon-git/defconfig
>  create mode 100644 recipes/hostap/hostap-daemon_git.bb
>=20
> diff --git a/recipes/hostap/hostap-daemon-0.7.inc
> b/recipes/hostap/hostap-daemon-0.7.inc
> new file mode 100644
> index 0000000..49f2650
> --- /dev/null
> +++ b/recipes/hostap/hostap-daemon-0.7.inc
> @@ -0,0 +1,26 @@
> +HOMEPAGE =3D "http://hostap.epitest.fi"
> +SECTION =3D "kernel/userland"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "libnl openssl"
> +
> +inherit update-rc.d
> +INITSCRIPT_NAME=3Dhostapd
> +
> +do_configure() {
> +	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> +}
> +
> +do_compile() {
> +	make
> +}
> +
> +do_install() {
> +	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> +	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> +	install -m 0755 ${S}/hostapd ${D}${sbindir}
> +	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> +	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
> +}
> +
> +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> diff --git a/recipes/hostap/hostap-daemon-git/defconfig
> b/recipes/hostap/hostap-daemon-git/defconfig
> new file mode 100644
> index 0000000..4fd9061
> --- /dev/null
> +++ b/recipes/hostap/hostap-daemon-git/defconfig
> @@ -0,0 +1,187 @@
> +# Example hostapd build time configuration
> +#
> +# This file lists the configuration options that are used when
> building the
> +# hostapd binary. All lines starting with # are ignored. Configuration
> option
> +# lines must be commented out complete, if they are not to be
> included, i.e.,
> +# just setting VARIABLE=3Dn is not disabling that variable.
> +#
> +# This file is included in Makefile, so variables like CFLAGS and LIBS
> can also
> +# be modified from here. In most cass, these lines should use +=3D in
> order not
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
> +# driver_nl80211.c requires a rather new libnl (version 1.1) which may
> not be
> +# shipped with your distribution yet. If that is the case, you need to
> build
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
> +# This version is an experimental implementation based on IEEE
> 802.11w/D1.0
> +# draft and is subject to change since the standard has not yet been
> finalized.
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
> +# EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-
> PSK)
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
> +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> OpenSSL,
> +# the OpenSSL library must be patched (openssl-0.9.9-session-
> ticket.patch)
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
> +# PKCS#12 (PFX) support (used to read private key and certificate file
> from
> +# a file that usually has extension .p12 or .pfx)
> +CONFIG_PKCS12=3Dy
> +
> +# RADIUS authentication server. This provides access to the integrated
> EAP
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
> +# the IEEE 802.11 Management capability (e.g., madwifi or
> FreeBSD/net80211)
> +#CONFIG_DRIVER_RADIUS_ACL=3Dy
> +
> +# IEEE 802.11n (High Throughput) support
> +#CONFIG_IEEE80211N=3Dy
> +
> +# Remove debugging code that is printing out debug messages to stdout.
> +# This can be used to reduce the size of the hostapd considerably if
> debugging
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
> +# This can be used to reduce binary size at the cost of disabling a
> debugging
> +# option.
> +#CONFIG_NO_DUMP_STATE=3Dy
> +
> +# Enable tracing code for developer debugging
> +# This tracks use of memory allocations and other registrations and
> reports
> +# incorrect use with a backtrace of call (or allocation) location.
> +#CONFIG_WPA_TRACE=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lexecinfo
> +#LIBS_p +=3D -lexecinfo
> +#LIBS_c +=3D -lexecinfo
> +
> +# Use libbfd to get more details for developer debugging
> +# This enables use of libbfd to get more detailed symbols for the
> backtraces
> +# generated by CONFIG_WPA_TRACE=3Dy.
> +#CONFIG_WPA_TRACE_BFD=3Dy
> +# For BSD, comment out these.
> +#LIBS +=3D -lbfd -liberty -lz
> +#LIBS_p +=3D -lbfd -liberty -lz
> +#LIBS_c +=3D -lbfd -liberty -lz
> +
> +
> +
> diff --git a/recipes/hostap/hostap-daemon_0.7.3.bb
> b/recipes/hostap/hostap-daemon_0.7.3.bb
> index 10b1389..5a8aee7 100644
> --- a/recipes/hostap/hostap-daemon_0.7.3.bb
> +++ b/recipes/hostap/hostap-daemon_0.7.3.bb
> @@ -1,10 +1,8 @@
>  DESCRIPTION =3D "User space daemon for extended IEEE 802.11 management"
> -HOMEPAGE =3D "http://hostap.epitest.fi"
> -SECTION =3D "kernel/userland"
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "libnl openssl"
> -PR =3D "r2"
> +
> +require hostap-daemon-0.7.inc
> +
> +PR =3D "r3"
>=20
>  DEFAULT_PREFERENCE =3D "-1"
>=20
> @@ -16,23 +14,4 @@ SRC_URI[sha256sum] =3D
> "31eb2781f37e1a4c27969d1594f8019c0ca87779349c099ab812833289
>=20
>  S =3D "${WORKDIR}/hostapd-${PV}/hostapd"
>=20
> -inherit update-rc.d
> -INITSCRIPT_NAME=3Dhostapd
> -
> -do_configure() {
> -	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> -}
> -
> -do_compile() {
> -	make
> -}
> -
> -do_install() {
> -	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> -	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> -	install -m 0755 ${S}/hostapd ${D}${sbindir}
> -	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> -	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
> -}
>=20
> -CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> diff --git a/recipes/hostap/hostap-daemon_git.bb
> b/recipes/hostap/hostap-daemon_git.bb
> new file mode 100644
> index 0000000..da966b9
> --- /dev/null
> +++ b/recipes/hostap/hostap-daemon_git.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "User space daemon for extended IEEE 802.11 management"
> +
> +require hostap-daemon-0.7.inc
> +
> +PR =3D "r0"
> +SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "git://w1.fi/srv/git/hostap.git;protocol=3Dgit \
> +	file://defconfig \
> +	file://init"
> +
> +S =3D "${WORKDIR}/git/hostapd"
> +
> +
> --
> 1.7.0.4



