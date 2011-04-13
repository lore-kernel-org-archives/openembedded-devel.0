Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QA17W-00044U-De
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 16:32:42 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3DEMTAh026943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 09:22:29 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3DEMT3a020482
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 09:22:29 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3DEMSnp002357
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 09:22:28 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 13 Apr 2011 16:22:13 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2011 16:22:11 +0200
Thread-Topic: [oe] [PATCH] hostap-daemon: Build from git sources
Thread-Index: Acv5XDhd3MBxWPDtQ62bE9MlqWcbZAAeiWbQAAPlGZA=
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F0331FA0B96@dnce02.ent.ti.com>
References: <y> <1302645212-16114-1-git-send-email-eyalr@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080340D39550@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080340D39550@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 13 Apr 2011 14:32:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will improve the commit message to clear this confusion.

The version built from the git is actually version 0.8.x which is a new fam=
ily of versions and include new features (like wifi-direct) used by new mac=
80211 versions. I don't think it is the right thing to combine it with an 0=
.7 recipe as it might need new settings moving forward.

> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, April 13, 2011 7:36 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: RE: [oe] [PATCH] hostap-daemon: Build from git sources
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of
> > Eyal Reizer
> > Sent: Tuesday, April 12, 2011 4:54 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Reizer, Eyal
> > Subject: [oe] [PATCH] hostap-daemon: Build from git sources
>=20
> Please provide a more detailed message.  Why are you adding this git
> version?
>=20
> Also, much of this recipe is shared with the previous version.  Can you
> abstract this into an include file that can be shared with both
> recipes?
>=20
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  recipes/hostap/hostap-daemon-git/defconfig |  187
> > ++++++++++++++++++++++++++++
> >  recipes/hostap/hostap-daemon_git.bb        |   37 ++++++
> >  2 files changed, 224 insertions(+), 0 deletions(-)
> >  create mode 100755 recipes/hostap/hostap-daemon-git/defconfig
> >  create mode 100755 recipes/hostap/hostap-daemon_git.bb
> >
> > diff --git a/recipes/hostap/hostap-daemon-git/defconfig
> > b/recipes/hostap/hostap-daemon-git/defconfig
> > new file mode 100755
> > index 0000000..4fd9061
> > --- /dev/null
> > +++ b/recipes/hostap/hostap-daemon-git/defconfig
> > @@ -0,0 +1,187 @@
> > +# Example hostapd build time configuration
> > +#
> > +# This file lists the configuration options that are used when
> building
> > the
> > +# hostapd binary. All lines starting with # are ignored.
> Configuration
> > option
> > +# lines must be commented out complete, if they are not to be
> included,
> > i.e.,
> > +# just setting VARIABLE=3Dn is not disabling that variable.
> > +#
> > +# This file is included in Makefile, so variables like CFLAGS and
> LIBS
> > can also
> > +# be modified from here. In most cass, these lines should use +=3D in
> order
> > not
> > +# to override previous values of the variables.
> > +
> > +#CC=3D$(CROSS_COMPILE)gcc
> > +#CFLAGS +=3D -I$(NFSROOT)/include -DCONFIG_LIBNL20
> > +#CPPFLAGS +=3D -DCONFIG_LIBNL20
> > +#LIBS +=3D -L$(NFSROOT)/lib -lnl-genl
> > +#LIBS_p +=3D -L$(NFSROOT)/lib
> > +#LIBDIR =3D $(NFSROOT)/lib
> > +#BINDIR =3D $(NFSROOT)/usr/sbin
> > +
> > +# Driver interface for Host AP driver
> > +CONFIG_DRIVER_HOSTAP=3Dy
> > +
> > +# Driver interface for wired authenticator
> > +#CONFIG_DRIVER_WIRED=3Dy
> > +
> > +# Driver interface for madwifi driver
> > +#CONFIG_DRIVER_MADWIFI=3Dy
> > +#CFLAGS +=3D -I../../madwifi # change to the madwifi source directory
> > +
> > +# Driver interface for drivers using the nl80211 kernel interface
> > +CONFIG_DRIVER_NL80211=3Dy
> > +CONFIG_LIBNL20=3Dy
> > +# driver_nl80211.c requires a rather new libnl (version 1.1) which
> may
> > not be
> > +# shipped with your distribution yet. If that is the case, you need
> to
> > build
> > +# newer libnl version and point the hostapd build to use it.
> > +#LIBNL=3D$(LIBNL_PATH)
> > +#CFLAGS +=3D -I$(LIBNL)/include
> > +#LIBS +=3D -L$(LIBNL)/lib
> > +
> > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> > +#CONFIG_DRIVER_BSD=3Dy
> > +#CFLAGS +=3D -I/usr/local/include
> > +#LIBS +=3D -L/usr/local/lib
> > +#LIBS_p +=3D -L/usr/local/lib
> > +#LIBS_c +=3D -L/usr/local/lib
> > +
> > +# Driver interface for no driver (e.g., RADIUS server only)
> > +#CONFIG_DRIVER_NONE=3Dy
> > +
> > +# IEEE 802.11F/IAPP
> > +CONFIG_IAPP=3Dy
> > +
> > +# WPA2/IEEE 802.11i RSN pre-authentication
> > +CONFIG_RSN_PREAUTH=3Dy
> > +
> > +# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
> > +CONFIG_PEERKEY=3Dy
> > +
> > +# IEEE 802.11w (management frame protection)
> > +# This version is an experimental implementation based on IEEE
> > 802.11w/D1.0
> > +# draft and is subject to change since the standard has not yet been
> > finalized.
> > +# Driver support is also needed for IEEE 802.11w.
> > +#CONFIG_IEEE80211W=3Dy
> > +
> > +# Integrated EAP server
> > +CONFIG_EAP=3Dy
> > +
> > +# EAP-MD5 for the integrated EAP server
> > +CONFIG_EAP_MD5=3Dy
> > +
> > +# EAP-TLS for the integrated EAP server
> > +CONFIG_EAP_TLS=3Dy
> > +
> > +# EAP-MSCHAPv2 for the integrated EAP server
> > +CONFIG_EAP_MSCHAPV2=3Dy
> > +
> > +# EAP-PEAP for the integrated EAP server
> > +CONFIG_EAP_PEAP=3Dy
> > +
> > +# EAP-GTC for the integrated EAP server
> > +CONFIG_EAP_GTC=3Dy
> > +
> > +# EAP-TTLS for the integrated EAP server
> > +CONFIG_EAP_TTLS=3Dy
> > +
> > +# EAP-SIM for the integrated EAP server
> > +#CONFIG_EAP_SIM=3Dy
> > +
> > +# EAP-AKA for the integrated EAP server
> > +#CONFIG_EAP_AKA=3Dy
> > +
> > +# EAP-AKA' for the integrated EAP server
> > +# This requires CONFIG_EAP_AKA to be enabled, too.
> > +#CONFIG_EAP_AKA_PRIME=3Dy
> > +
> > +# EAP-PAX for the integrated EAP server
> > +#CONFIG_EAP_PAX=3Dy
> > +
> > +# EAP-PSK for the integrated EAP server (this is _not_ needed for
> WPA-
> > PSK)
> > +#CONFIG_EAP_PSK=3Dy
> > +
> > +# EAP-SAKE for the integrated EAP server
> > +#CONFIG_EAP_SAKE=3Dy
> > +
> > +# EAP-GPSK for the integrated EAP server
> > +#CONFIG_EAP_GPSK=3Dy
> > +# Include support for optional SHA256 cipher suite in EAP-GPSK
> > +#CONFIG_EAP_GPSK_SHA256=3Dy
> > +
> > +# EAP-FAST for the integrated EAP server
> > +# Note: Default OpenSSL package does not include support for all the
> > +# functionality needed for EAP-FAST. If EAP-FAST is enabled with
> OpenSSL,
> > +# the OpenSSL library must be patched (openssl-0.9.9-session-
> > ticket.patch)
> > +# to add the needed functions.
> > +#CONFIG_EAP_FAST=3Dy
> > +
> > +# Wi-Fi Protected Setup (WPS)
> > +CONFIG_WPS=3Dy
> > +# Enable UPnP support for external WPS Registrars
> > +#CONFIG_WPS_UPNP=3Dy
> > +
> > +# EAP-IKEv2
> > +#CONFIG_EAP_IKEV2=3Dy
> > +
> > +# Trusted Network Connect (EAP-TNC)
> > +#CONFIG_EAP_TNC=3Dy
> > +
> > +# PKCS#12 (PFX) support (used to read private key and certificate
> file
> > from
> > +# a file that usually has extension .p12 or .pfx)
> > +CONFIG_PKCS12=3Dy
> > +
> > +# RADIUS authentication server. This provides access to the
> integrated
> > EAP
> > +# server from external hosts using RADIUS.
> > +#CONFIG_RADIUS_SERVER=3Dy
> > +
> > +# Build IPv6 support for RADIUS operations
> > +CONFIG_IPV6=3Dy
> > +
> > +# IEEE Std 802.11r-2008 (Fast BSS Transition)
> > +#CONFIG_IEEE80211R=3Dy
> > +
> > +# Use the hostapd's IEEE 802.11 authentication (ACL), but without
> > +# the IEEE 802.11 Management capability (e.g., madwifi or
> > FreeBSD/net80211)
> > +#CONFIG_DRIVER_RADIUS_ACL=3Dy
> > +
> > +# IEEE 802.11n (High Throughput) support
> > +#CONFIG_IEEE80211N=3Dy
> > +
> > +# Remove debugging code that is printing out debug messages to
> stdout.
> > +# This can be used to reduce the size of the hostapd considerably if
> > debugging
> > +# code is not needed.
> > +#CONFIG_NO_STDOUT_DEBUG=3Dy
> > +
> > +# Remove support for RADIUS accounting
> > +#CONFIG_NO_ACCOUNTING=3Dy
> > +
> > +# Remove support for RADIUS
> > +#CONFIG_NO_RADIUS=3Dy
> > +
> > +# Remove support for VLANs
> > +#CONFIG_NO_VLAN=3Dy
> > +
> > +# Remove support for dumping state into a file on SIGUSR1 signal
> > +# This can be used to reduce binary size at the cost of disabling a
> > debugging
> > +# option.
> > +#CONFIG_NO_DUMP_STATE=3Dy
> > +
> > +# Enable tracing code for developer debugging
> > +# This tracks use of memory allocations and other registrations and
> > reports
> > +# incorrect use with a backtrace of call (or allocation) location.
> > +#CONFIG_WPA_TRACE=3Dy
> > +# For BSD, comment out these.
> > +#LIBS +=3D -lexecinfo
> > +#LIBS_p +=3D -lexecinfo
> > +#LIBS_c +=3D -lexecinfo
> > +
> > +# Use libbfd to get more details for developer debugging
> > +# This enables use of libbfd to get more detailed symbols for the
> > backtraces
> > +# generated by CONFIG_WPA_TRACE=3Dy.
> > +#CONFIG_WPA_TRACE_BFD=3Dy
> > +# For BSD, comment out these.
> > +#LIBS +=3D -lbfd -liberty -lz
> > +#LIBS_p +=3D -lbfd -liberty -lz
> > +#LIBS_c +=3D -lbfd -liberty -lz
> > +
> > +
> > +
> > diff --git a/recipes/hostap/hostap-daemon_git.bb
> b/recipes/hostap/hostap-
> > daemon_git.bb
> > new file mode 100755
> > index 0000000..a81d651
> > --- /dev/null
> > +++ b/recipes/hostap/hostap-daemon_git.bb
> > @@ -0,0 +1,37 @@
> > +DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> management"
> > +HOMEPAGE =3D "http://hostap.epitest.fi"
> > +SECTION =3D "kernel/userland"
> > +PRIORITY =3D "optional"
> > +LICENSE =3D "GPL"
> > +DEPENDS =3D "libnl openssl"
> > +PR =3D "r0"
> > +SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
> > +
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> > +SRC_URI =3D "git://w1.fi/srv/git/hostap.git;protocol=3Dgit \
> > +	file://defconfig \
> > +	file://init"
> > +
> > +S =3D "${WORKDIR}/git/hostapd"
> > +
> > +inherit update-rc.d
> > +INITSCRIPT_NAME=3Dhostapd
> > +
> > +do_configure() {
> > +	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> > +}
> > +
> > +do_compile() {
> > +	make
> > +}
> > +
> > +do_install() {
> > +	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
> > +	install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
> > +	install -m 0755 ${S}/hostapd ${D}${sbindir}
> > +	install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
> > +	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
> > +}
> > +
> > +CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel


