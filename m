Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34A266ABC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:35:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5JEZCA2019458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 07:35:13 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 07:35:12 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 969287FD0;
	Wed, 19 Jun 2013 10:34:51 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id D7202410DF; Wed,
	19 Jun 2013 10:35:11 -0400 (EDT)
Date: Wed, 19 Jun 2013 10:35:11 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130619143511.GB8093@windriver.com>
References: <1371522235-9161-1-git-send-email-lei.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1371522235-9161-1-git-send-email-lei.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: paul.eggleton@linux.intel.com
Subject: Re: [meta-networking][PATCH:V2] vlan: Add vlan recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 14:35:12 -0000
X-Groupsio-MsgNum: 45140
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lei,

[[oe] [meta-networking][PATCH:V2] vlan: Add vlan recipe] On 13.06.18 (Tue 1=
0:23) lei.yang@windriver.com wrote:

> From: Lei Yang <lei.yang@windriver.com>
>=20
> A 802.1q vlan support program,which can be used by virt-test
>=20
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  meta-networking/recipes-support/vlan/files/ip      |   21 +++++++
>  .../recipes-support/vlan/files/vlan-post-down      |   28 +++++++++
>  .../recipes-support/vlan/files/vlan-pre-up         |   61 ++++++++++++++=
++++++
>  meta-networking/recipes-support/vlan/vlan_1.9.bb   |   36 ++++++++++++
>  4 files changed, 146 insertions(+), 0 deletions(-)
>  create mode 100755 meta-networking/recipes-support/vlan/files/ip
>  create mode 100755 meta-networking/recipes-support/vlan/files/vlan-post-=
down
>  create mode 100755 meta-networking/recipes-support/vlan/files/vlan-pre-up
>  create mode 100755 meta-networking/recipes-support/vlan/vlan_1.9.bb
>=20
> diff --git a/meta-networking/recipes-support/vlan/files/ip b/meta-network=
ing/recipes-support/vlan/files/ip
> new file mode 100755
> index 0000000..d7de05c
> --- /dev/null
> +++ b/meta-networking/recipes-support/vlan/files/ip
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +# This should probably go into ifupdown
> +# But usually only those with lots of interfaces (vlans) need these
> +if [ -d "/proc/sys/net/ipv4/conf/$IFACE" ]
> +then
> +	if [ -n "$IF_IP_PROXY_ARP" ]; then
> +		if [ "$IF_IP_PROXY_ARP" -eq "1" ]; then
> +			echo 1 > "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
> +		else
> +			echo 0 > "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
> +		fi
> +	fi
> +	if [ -n "$IF_IP_RP_FILTER" ]; then
> +		if [ "$IF_IP_RP_FILTER" -eq "0" ]; then
> +			echo 0 > "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
> +		else
> +			echo 1 > "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
> +		fi
> +	fi
> +fi
> +

Sorry, I should've caught this in the v1, but what's up with this file?
Did you get it out of the vlan package?  It's decently isolated with the
do_install in the recipe, but it's an exact namespace configuration for
a binary from iproute2 and it doesn't appear to do even close to the
same thing.  Can you expand on where it's from and whether it's
practical to give it a less opaque name?  I'm mainly asking because I
can't convince myself I know which 'ip' you are relying upon (or
getting, actually, I think I know which one you're getting...) in
vlan-pre-up.

> diff --git a/meta-networking/recipes-support/vlan/files/vlan-post-down b/=
meta-networking/recipes-support/vlan/files/vlan-post-down
> new file mode 100755
> index 0000000..89b16fb
> --- /dev/null
> +++ b/meta-networking/recipes-support/vlan/files/vlan-post-down
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +# If IFACE is an automagic vlan interface (without the vlan-raw-device
> +# parameter) then let's try to discover the magic here..  Another way wo=
uld be
> +# to just probe for the right device name in /proc/net/vlan
> +
> +case "$IFACE" in
> +  # Ignore any alias (#272891)
> +  *:*)
> +    exit 0
> +  ;;
> +  eth*.0*|bond*.0*|wlan*.0*)
> +    IF_VLAN_RAW_DEVICE=3D`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;=
s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> +  ;;
> +  eth*.*|bond*.*|wlan*.*)
> +    IF_VLAN_RAW_DEVICE=3D`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;=
s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> +  ;;
> +  # Test for vlan raw device (#196890, #292648)
> +  *)
> +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> +  ;;
> +esac
> +
> +if [ ! -x /sbin/vconfig ]; then
> +    exit 0
> +fi
> +
> +vconfig rem $IFACE
> diff --git a/meta-networking/recipes-support/vlan/files/vlan-pre-up b/met=
a-networking/recipes-support/vlan/files/vlan-pre-up
> new file mode 100755
> index 0000000..b977be8
> --- /dev/null
> +++ b/meta-networking/recipes-support/vlan/files/vlan-pre-up
> @@ -0,0 +1,61 @@
> +#!/bin/sh
> +
> +# Most of this stuff is to enable vlans
> +
> +case "$IFACE" in
> +  # Ignore any alias (#272891) which uses <interface>:<alabel>
> +  *:*)
> +    exit 0
> +  ;;
> +  vlan0*)
> +    vconfig set_name_type VLAN_PLUS_VID
> +    VLANID=3D`echo $IFACE|sed "s/vlan0*//"`
> +  ;;
> +  vlan*)
> +    vconfig set_name_type VLAN_PLUS_VID_NO_PAD
> +    VLANID=3D`echo $IFACE|sed "s/vlan0*//"`
> +  ;;
> +  eth*.0*|bond*.0*|wlan*.0*)
> +    vconfig set_name_type DEV_PLUS_VID
> +    VLANID=3D`echo $IFACE|sed "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*=
\.0*//;s/wlan[0-9][0-9]*\.0*//"`
> +    IF_VLAN_RAW_DEVICE=3D`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;=
s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> +  ;;
> +  eth*.*|bond*.*|wlan*.*)
> +    vconfig set_name_type DEV_PLUS_VID_NO_PAD
> +    VLANID=3D`echo $IFACE|sed "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*=
\.0*//g;s/wlan[0-9][0-9]*\.0*//g"`
> +    IF_VLAN_RAW_DEVICE=3D`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;=
s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> +  ;;
> +  *.0*)
> +    # Silently ignore interfaces which we do not (know how to) support
> +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> +    vconfig set_name_type DEV_PLUS_VID
> +    VLANID=3D`echo $IFACE|sed "s/[^.]*\.0*//g"`
> +  ;;
> +  *.*)
> +    # Silently ignore interfaces which we do not (know how to) support
> +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> +    vconfig set_name_type DEV_PLUS_VID_NO_PAD
> +    VLANID=3D`echo $IFACE|sed "s/[^.]*\.0*//g"`
> +  ;;
> +
> +  *)
> +    exit 0
> +  ;;
> +esac
> +
> +if [ -n "$IF_VLAN_RAW_DEVICE" ]; then
> +    if [ ! -x /sbin/vconfig ]; then
> +        exit 0
> +    fi
> +    if ! ip link show dev "$IF_VLAN_RAW_DEVICE" > /dev/null; then
> +        echo "$IF_VLAN_RAW_DEVICE does not exist, unable to create $IFAC=
E"
> +        exit 1
> +    fi
> +    ip link set up dev $IF_VLAN_RAW_DEVICE
> +    vconfig add $IF_VLAN_RAW_DEVICE $VLANID
> +fi
> +
> +# This is not vlan specific, and should actually go somewhere else.
> +if [ -n "$IF_HW_MAC_ADDRESS" ]; then
> +    ip link set $IFACE address $IF_HW_MAC_ADDRESS
> +fi
> diff --git a/meta-networking/recipes-support/vlan/vlan_1.9.bb b/meta-netw=
orking/recipes-support/vlan/vlan_1.9.bb
> new file mode 100755
> index 0000000..b79da6e
> --- /dev/null
> +++ b/meta-networking/recipes-support/vlan/vlan_1.9.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "802.1q vlan support program"
> +HOMEPAGE =3D "http://www.candelatech.com/~greear/vlan.html"
> +LICENSE =3D "GPLv2"
> +SECTION =3D "console/network"
> +
> +SRC_URI[md5sum] =3D "5f0c6060b33956fb16e11a15467dd394"
> +SRC_URI[sha256sum] =3D "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d=
9aeb4868842b4cca"
> +LIC_FILES_CHKSUM =3D "file://macvlan_config.c;beginline=3D4;endline=3D62=
;md5=3Ddc0660d77e4313e8ccdf256fbe436a63"
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +SRC_URI =3D " \
> +	http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz \
> +	file://ip \
> +	file://vlan-pre-up \
> +	file://vlan-post-down \
> +	"

I think Paul had meant to put SRC_URI[...] around here in his request to
v1.

-J.

> +
> +CCFLAGS =3D "-g -D_GNU_SOURCE -Wall -I${STAGING_INCDIR}"
> +LDLIBS =3D ""
> +
> +do_compile() {
> +	${CC} ${CCFLAGS} -c vconfig.c
> +	${CC} ${CCFLAGS} ${LDFLAGS} -o vconfig vconfig.o ${LDLIBS}
> +}
> +
> +do_install() {
> +	install -d "${D}${sbindir}"
> +	install -m 755 "${S}/vconfig" "${D}${sbindir}/vconfig"
> +	install -d ${D}/${sysconfdir}/network/if-pre-up.d
> +	install -d ${D}/${sysconfdir}/network/if-post-down.d
> +	install -d ${D}/${sysconfdir}/network/if-up.d
> +	install -m 0755 ${WORKDIR}/ip ${D}/${sysconfdir}/network/if-up.d/
> +	install -m 0755 ${WORKDIR}/vlan-pre-up ${D}/${sysconfdir}/network/if-pr=
e-up.d/vlan
> +	install -m 0755 ${WORKDIR}/vlan-post-down ${D}/${sysconfdir}/network/if=
-post-down.d/vlan
> +}
--=20
-Joe MacDonald.
:wq

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHBwZ8ACgkQPN8S4W6ZZnefHQCdHJkNxAGmsfpu7c3/VWojTc5P
EdAAn3/qIGmmW3R9n5Zs+XzjxfX/3l99
=xkPs
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
