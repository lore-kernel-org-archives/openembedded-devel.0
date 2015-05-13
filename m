Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E66257403A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 01:46:12 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YsLkT-0005zp-Nv from Joe_MacDonald@mentor.com ;
	Tue, 12 May 2015 18:46:13 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 18:46:13 -0700
Received: by burninator (Postfix, from userid 1000)	id 002AB580439; Tue, 12
	May 2015 21:46:17 -0400 (EDT)
Date: Tue, 12 May 2015 21:46:17 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150513014616.GC5914@mentor.com>
References: <cover.1431376904.git.joe_macdonald@mentor.com>
	<c0cb9ac6a71b0cca54ddfe38d2867c30c61c1e9c.1431376904.git.joe_macdonald@mentor.com>
	<5552A5AC.4040902@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5552A5AC.4040902@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/1] meta-networking: standardize SECTION values
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
X-List-Received-Date: Wed, 13 May 2015 01:46:14 -0000
X-Groupsio-MsgNum: 55487
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Armin,

[Re: [oe] [meta-networking][PATCH 1/1] meta-networking: standardize SECTION=
 values] On 15.05.12 (Tue 18:15) akuster808 wrote:

> Joe,
>=20
> I am in the process of updating  wireshark to a new version. Are you going
> to handle the SECTION merge fixup if I post before these changes go in or
> should I just include them with my post?

Either way is good.  I thought there would be some strongly held
opinions on the SECTION updates, but so far it seems we all agree it's a
bikeshed event, so I'll probably go ahead and merge it soon.

That said, it'll be after I clear out whatever I know is pending for
meta-networking, so if you have an update ready for wireshark now,
submit away and I'll rebase my stuff as appropriate.

-J.

>=20
> - armin
>=20
> On 05/11/2015 01:59 PM, Joe MacDonald wrote:
> >SECTION has been used inconsistently throughout the recipes in this laye=
r.
> >Convert them to all use the same convention.
> >
> >Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >---
> >  meta-networking/recipes-connectivity/crda/crda_3.13.bb                =
 | 2 +-
> >  meta-networking/recipes-connectivity/daq/daq_2.0.2.bb                 =
 | 1 +
> >  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb     =
 | 2 +-
> >  meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb          =
 | 1 +
> >  meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb       =
 | 2 +-
> >  meta-networking/recipes-connectivity/sethdlc/sethdlc.bb               =
 | 1 +
> >  meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb           =
 | 1 +
> >  meta-networking/recipes-connectivity/ufw/ufw_0.33.bb                  =
 | 1 +
> >  meta-networking/recipes-connectivity/vlan/vlan_1.9.bb                 =
 | 1 +
> >  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb               =
 | 2 +-
> >  meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb         =
 | 2 +-
> >  meta-networking/recipes-daemons/atftp/atftp_git.bb                    =
 | 2 +-
> >  meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb                =
 | 2 +-
> >  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb       =
 | 2 +-
> >  meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb                   =
 | 2 +-
> >  .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb            =
 | 2 +-
> >  meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb               =
 | 2 +-
> >  meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb                  =
 | 2 +-
> >  meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb              =
 | 1 +
> >  meta-networking/recipes-daemons/postfix/postfix.inc                   =
 | 2 +-
> >  meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb              =
 | 2 +-
> >  meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb                =
 | 2 +-
> >  meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb         =
 | 1 +
> >  meta-networking/recipes-daemons/radvd/radvd.inc                       =
 | 2 +-
> >  meta-networking/recipes-daemons/squid/squid_3.4.7.bb                  =
 | 2 +-
> >  meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb              =
 | 2 +-
> >  meta-networking/recipes-daemons/vblade/vblade_20.bb                   =
 | 2 +-
> >  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb                =
 | 2 +-
> >  .../recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb           =
 | 2 +-
> >  meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb          =
 | 2 +-
> >  meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb                 =
 | 1 +
> >  .../recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb       =
 | 1 +
> >  .../recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb        =
 | 1 +
> >  .../recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb       =
 | 1 +
> >  meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb =
 | 1 +
> >  .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb           =
 | 1 +
> >  meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb     =
 | 2 +-
> >  meta-networking/recipes-irc/znc/znc_git.bb                            =
 | 1 +
> >  meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb          =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb          =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb          =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb    =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb        =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb    =
 | 2 +-
> >  meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb        =
 | 2 +-
> >  meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb          =
 | 1 +
> >  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb        =
 | 1 +
> >  meta-networking/recipes-protocols/openflow/openflow.inc               =
 | 2 +-
> >  meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb            =
 | 2 +-
> >  meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb      =
 | 2 +-
> >  meta-networking/recipes-protocols/quagga/quagga.inc                   =
 | 2 +-
> >  .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb        =
 | 2 +-
> >  meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb            =
 | 2 +-
> >  meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc                   =
 | 2 +-
> >  meta-networking/recipes-support/aoetools/aoetools_36.bb               =
 | 2 +-
> >  meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb        =
 | 2 +-
> >  meta-networking/recipes-support/bridge-utils/bridge-utils.inc         =
 | 2 +-
> >  meta-networking/recipes-support/cifs/cifs-utils_git.bb                =
 | 2 +-
> >  meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb  =
 | 2 ++
> >  meta-networking/recipes-support/cim-schema/cim-schema.inc             =
 | 2 +-
> >  meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb                =
 | 2 +-
> >  meta-networking/recipes-support/dnsmasq/dnsmasq.inc                   =
 | 2 +-
> >  meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb       =
 | 2 +-
> >  meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb             =
 | 2 +-
> >  meta-networking/recipes-support/drbd/drbd_8.4.4.bb                    =
 | 2 +-
> >  meta-networking/recipes-support/esmtp/esmtp_1.2.bb                    =
 | 2 +-
> >  meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb         =
 | 2 +-
> >  meta-networking/recipes-support/fping/fping_3.5.bb                    =
 | 1 +
> >  meta-networking/recipes-support/geoip/geoip-perl_1.45.bb              =
 | 2 +-
> >  meta-networking/recipes-support/geoip/geoip_1.6.0.bb                  =
 | 2 +-
> >  meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb            =
 | 2 +-
> >  meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb          =
 | 2 +-
> >  meta-networking/recipes-support/iftop/iftop_1.0pre2.bb                =
 | 2 +-
> >  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb      =
 | 2 +-
> >  meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb               =
 | 2 +-
> >  meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb            =
 | 2 +-
> >  meta-networking/recipes-support/libmemcached/libmemcached.inc         =
 | 1 +
> >  meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb   =
 | 2 +-
> >  meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb      =
 | 2 +-
> >  meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb        =
 | 2 +-
> >  meta-networking/recipes-support/memcached/memcached_1.4.17.bb         =
 | 2 +-
> >  meta-networking/recipes-support/mtr/mtr_0.86.bb                       =
 | 1 +
> >  meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb                =
 | 3 +--
> >  meta-networking/recipes-support/netcat/netcat.inc                     =
 | 2 +-
> >  meta-networking/recipes-support/netcf/gnulib_git.bb                   =
 | 2 +-
> >  meta-networking/recipes-support/netcf/netcf_git.bb                    =
 | 2 +-
> >  meta-networking/recipes-support/netperf/netperf_2.6.0.bb              =
 | 2 +-
> >  meta-networking/recipes-support/nis/nis.inc                           =
 | 2 +-
> >  meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb                    =
 | 2 +-
> >  meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb              =
 | 2 +-
> >  meta-networking/recipes-support/pimd/pimd_2.1.8.bb                    =
 | 1 +
> >  meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb            =
 | 2 +-
> >  meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb              =
 | 1 +
> >  meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb        =
 | 2 +-
> >  meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb              =
 | 2 +-
> >  meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb             =
 | 2 +-
> >  meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb          =
 | 2 +-
> >  meta-networking/recipes-support/tnftp/tnftp_20130505.bb               =
 | 2 +-
> >  meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb       =
 | 2 +-
> >  meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb         =
 | 2 +-
> >  100 files changed, 101 insertions(+), 78 deletions(-)
> >
> >diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/me=
ta-networking/recipes-connectivity/crda/crda_3.13.bb
> >index fced75e..12eefe0 100644
> >--- a/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> >+++ b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Wireless Central Regulatory Domain Agent"
> >  HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
> >-
> >+SECTION =3D "net"
> >  LICENSE =3D "copyleft-next-0.3.0 & ISC"
> >  LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D8743a2c359037d4=
d329a31e79eabeffe \
> >                      file://${WORKDIR}/wireless-regdb-2014.11.18/LICENS=
E;md5=3D07c4f6dea3845b02a18dc00c8c87699c"
> >diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb b/met=
a-networking/recipes-connectivity/daq/daq_2.0.2.bb
> >index 4cf3f1c..b8f8407 100644
> >--- a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
> >+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "The dump DAQ test the various inline mode features "
> >  HOMEPAGE =3D "http://www.snort.org"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21=
c40e0"
> >
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.=
9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >index e46133e..cd7b425 100644
> >--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >@@ -2,7 +2,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of c=
ommon \
> >  networking utilities and servers including ftp, ftpd, rcp, \
> >  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
> >  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> >-SECTION =3D "libs"
> >+SECTION =3D "net"
> >  DEPENDS =3D "ncurses netbase readline"
> >  LICENSE =3D "GPLv3"
> >
> >diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.b=
b b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> >index 4752506..28b6c82 100644
> >--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> >+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "dumb networking library"
> >  HOMEPAGE =3D "http://code.google.com/p/libdnet/"
> >+SECTION =3D "libs"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0036c1b155f4e999f3e0a373490=
b5db9"
> >
> >diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.=
8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> >index 8adc0b1..caa4cd3 100644
> >--- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> >+++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> >@@ -21,7 +21,7 @@ BUGTRACKER =3D "https://github.com/polarssl/polarssl/i=
ssues"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >
> >-SECTION =3D "net"
> >+SECTION =3D "libdevel"
> >
> >  SRC_URI =3D "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
> >
> >diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/m=
eta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> >index 5e8d9d9..fc304fa 100644
> >--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> >+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> >@@ -1,5 +1,6 @@
> >  DESCRIPTION =3D "set Linux HDLC packet radio modem driver port informa=
tion"
> >  HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
> >+SECTION =3D "comm"
> >  LICENSE =3D "GPLv2 & GPLv2+ "
> >  LIC_FILES_CHKSUM =3D "file://sethdlc.c;endline=3D10;md5=3D90f936879e9f=
8b755a138aeb348782eb"
> >
> >diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb=
 b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> >index 17d6792..66653c6 100644
> >--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> >+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> >@@ -1,5 +1,6 @@
> >  DESCRIPTION =3D "snort - a free lightweight network intrusion detectio=
n system for UNIX and Windows."
> >  HOMEPAGE =3D "http://www.snort.org/"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc92=
377c5"
> >
> >diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta=
-networking/recipes-connectivity/ufw/ufw_0.33.bb
> >index 467f2a8..2721f8f 100644
> >--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> >+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> >@@ -3,6 +3,7 @@ DESCRIPTION =3D "UFW stands for Uncomplicated Firewall, =
and is program for \
> >  managing a netfilter firewall. It provides a command line interface an=
d aims \
> >  to be uncomplicated and easy to use."
> >  HOMEPAGE =3D "https://launchpad.net/ufw"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv3"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be89=
67949"
> >
> >diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/met=
a-networking/recipes-connectivity/vlan/vlan_1.9.bb
> >index 086f559..8df93e4 100644
> >--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> >+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> >@@ -1,4 +1,5 @@
> >  SUMMARY =3D "VLAN provides vconfig utility"
> >+SECTION =3D "misc"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://vconfig.c;md5=3D293ef69c4e88434d37a5ee577=
a5288cb"
> >
> >diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/m=
eta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> >index 151aaf9..34499d6 100644
> >--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> >+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "A client for the Cisco3000 VPN Concentrator"
> >  HOMEPAGE =3D "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
> >  AUTHOR =3D "Maurice Massar vpnc@unix-ag.uni-kl.de"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  PRIORITY =3D "optional"
> >  LICENSE =3D "GPL-2.0+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D173b74cb8ac640a9992c03f3bce=
22a33"
> >diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.=
bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> >index 2366fb1..591ff32 100644
> >--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> >+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> >@@ -5,7 +5,7 @@ DESCRIPTION =3D "wolfSSL, formerly CyaSSL, is a lightwei=
ght SSL library written in
> >                 a full TLS 1.2 client and server."
> >  HOMEPAGE =3D "http://www.wolfssl.com/yaSSL/Products-wolfssl.html"
> >  BUGTRACKER =3D "http://github.com/wolfssl/wolfssl/issues"
> >-SECTION =3D "libs/network"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >
> >diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-n=
etworking/recipes-daemons/atftp/atftp_git.bb
> >index ee84f77..b53f637 100644
> >--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> >+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "Advanced TFTP server and client"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  HOMEPAGE =3D "http://packages.debian.org/atftp"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/me=
ta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> >index 13af2fe..64142ef 100644
> >--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> >+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "Kernel based automounter for linux"
> >-SECTION =3D "base"
> >+SECTION =3D "utils"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> >
> >diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.2=
6.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >index c235a1b..33468a1 100644
> >--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "Generic client/server library for SASL authentication"
> >-SECTION =3D "console/network"
> >+SECTION =3D "libs"
> >  DEPENDS =3D "openssl virtual/db"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d2=
06396"
> >diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-=
networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> >index 3b8fdc9..d3858ad 100644
> >--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> >+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> >@@ -5,7 +5,7 @@ nameserver, but can also act as the primary nameserver f=
or a subnet behind \
> >  a firewall. It also has features such as caching DNS requests, support=
 for \
> >  DNS servers, cache poisoning prevention, TCP support, etc.."
> >  HOMEPAGE =3D "http://dnrd.sourceforge.net/"
> >-SECTION =3D "System Environment/Daemons"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0be67017f1c770313ad7b40e18d=
568f1"
> >
> >diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi=
-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiat=
or-utils/iscsi-initiator-utils_2.0-873.bb
> >index f510ce5..03f6459 100644
> >--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initia=
tor-utils_2.0-873.bb
> >+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initia=
tor-utils_2.0-873.bb
> >@@ -6,7 +6,7 @@ programs used to manage it. iSCSI is a protocol for dist=
ributed \
> >  disk access using SCSI commands sent over Internet Protocol networks."
> >  HOMEPAGE =3D "http://www.open-iscsi.org/"
> >  LICENSE =3D "GPLv2 & LGPLv2.1"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  DEPENDS =3D "openssl flex-native bison-native"
> >
> >  LIC_FILES_CHKSUM =3D \
> >diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/m=
eta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> >index 4dad80d..8c44a3e 100644
> >--- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> >+++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> >@@ -2,7 +2,7 @@ SUMMARY =3D "Intel LLDP Agent"
> >  DESCRIPTION =3D "\
> >  This package contains the Linux user space daemon and configuration to=
ol for \
> >  Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
> >-SECTION =3D "System Environment/Daemons"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2bc283e65df398ced5f5b747e=
78162"
> >  DEPENDS =3D "libconfig libnl"
> >diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta=
-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> >index 5e63293..40b59a4 100644
> >--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> >+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "A sophisticated console ftp client"
> >  HOMEPAGE =3D "http://ncftp.com/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "ClArtistic"
> >  LIC_FILES_CHKSUM =3D "file://ncftp/cmds.c;beginline=3D3;endline=3D4;md=
5=3D9de76faeaedc4f908082e3f8142715f4"
> >  DEPENDS =3D "ncurses"
> >diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/=
meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> >index 6d31b1c..5895b46 100644
> >--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> >+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> >@@ -19,6 +19,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${B=
PN}-${PV}.tar.gz \
> >  SRC_URI[md5sum] =3D "534c0a99438a62c4c8dda56cfa67300c"
> >  SRC_URI[sha256sum] =3D "2f5ba57fe67e94099c0df82d0a0dd207b5c583c9303003=
5ba354c97b5471b590"
> >
> >+SECTION =3D "admin"
> >  LICENSE =3D "LGPLv2.1"
> >  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Da916467b91076e631dd8edb=
7424769c7"
> >
> >diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-=
networking/recipes-daemons/postfix/postfix.inc
> >index eb1c547..72bc936 100644
> >--- a/meta-networking/recipes-daemons/postfix/postfix.inc
> >+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> >@@ -5,7 +5,7 @@ Postfix attempts to be fast, easy to administer, and sec=
ure. The outsidei \
> >  has a definite Sendmail-ish flavor, but the inside is completely diffe=
rent."
> >
> >  HOMEPAGE=3D "http://www.postfix.org"
> >-SECTION =3D "console/network"
> >+SECTION =3D "mail"
> >  DEPENDS =3D "virtual/db libpcre openssl postfix-native \
> >      ${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
> >      ${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
> >diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >index 13c9410..00291c6 100644
> >--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "Secure and configurable FTP server"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  HOMEPAGE =3D "http://www.proftpd.org"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1=
dc184"
> >diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/me=
ta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> >index 0dcfc1f..c65e735 100644
> >--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> >+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> >@@ -4,7 +4,7 @@ defined by the relevant IEEE 1588 standard. PTP Version =
1 implements IEEE-1588-2
> >  and PTP Version 2 implements IEEE-1588-2008. PTP was developed to prov=
ide very precise \
> >  time coordination of LAN connected computers."
> >  HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D2452033fe374283f29579898663b=
1aa8"
> >
> >diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.=
bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> >index 974e6b7..bbd47fd 100644
> >--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> >+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "FTP Server with a strong focus on software security"
> >  DESCRIPTION =3D "Pure-FTPd is a free (BSD license), secure, production=
-quality and standard-conformant FTP server."
> >  HOMEPAGE =3D "http://www.pureftpd.org/project/pure-ftpd"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae9e161311a5a0768c333b537a4=
0e332"
> >
> >diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-netw=
orking/recipes-daemons/radvd/radvd.inc
> >index 6b595b0..47e4736 100644
> >--- a/meta-networking/recipes-daemons/radvd/radvd.inc
> >+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> >@@ -7,7 +7,7 @@ advertisements hosts can automatically configure their \
> >  addresses and some other parameters. They also can \
> >  choose a default router based on these advertisements."
> >  HOMEPAGE =3D "http://www.litech.org/radvd/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  DEPENDS =3D "flex-native libdaemon"
> >
> >  # License is BSD-Style (with advertising clause) but also has an addit=
ional 0th clause
> >diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta=
-networking/recipes-daemons/squid/squid_3.4.7.bb
> >index c5f616d..7b00dfc 100644
> >--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >+++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> >@@ -6,7 +6,7 @@ Squid offers a rich set of traffic optimization options,=
 most of which are \
> >  enabled by default for simpler installation and high performance. \
> >  "
> >  HOMEPAGE =3D "http://www.squid-cache.org"
> >-SECTION =3D "network"
> >+SECTION =3D "web"
> >  LICENSE =3D "GPLv2+"
> >
> >  MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
> >diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/=
meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> >index 3f17fd6..98842e4 100644
> >--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> >+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> >@@ -6,7 +6,7 @@ interface for TFTP, which allows users to transfer files=
 to and from a \
> >  remote machine.  This program and TFTP provide very little security, \
> >  and should not be enabled unless it is expressly needed."
> >  DEPENDS =3D "tcp-wrappers readline"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD-4-Clause"
> >  LIC_FILES_CHKSUM =3D "file://MCONFIG.in;beginline=3D1;endline=3D9;md5=
=3Dc28ba5adb43041fae4629db05c83cbdd \
> >                      file://tftp/tftp.c;beginline=3D1;endline=3D32;md5=
=3D988c1cba99d70858a26cd877209857f4"
> >diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-=
networking/recipes-daemons/vblade/vblade_20.bb
> >index a2ebb5a..a357e40 100644
> >--- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
> >+++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "Virtual EtherDrive blade AoE target"
> >-SECTION =3D "console/network"
> >+SECTION =3D "admin"
> >
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/me=
ta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> >index fbeca9b..9d1c1cc 100644
> >--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> >+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Very Secure FTP server"
> >  HOMEPAGE =3D "https://security.appspot.com/vsftpd.html"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47=
b1271"
> >
> >diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-to=
ols_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-too=
ls_1.4.0.bb
> >index 0cc1398..57fe21c 100644
> >--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4=
=2E0.bb
> >+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4=
=2E0.bb
> >@@ -1,10 +1,10 @@
> >  SUMMARY =3D "Connection tracking userspace tools for Linux"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeou=
t \
> >             libnetfilter-cthelper libnetfilter-queue bison-native"
> >
> >-
> >  SRC_URI =3D " \
> >      http://www.netfilter.org/projects/conntrack-tools/files/conntrack-=
tools-${PV}.tar.bz2;name=3Dtar \
> >      file://conntrack-failover \
> >diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.b=
b b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> >index 32cfc75..2e49dab 100644
> >--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> >+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> >@@ -3,7 +3,7 @@ DESCRIPTION =3D "Utility for basic Ethernet frame filter=
ing on a Linux bridge, \
> >                 advanced logging, MAC DNAT/SNAT and brouting."
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd=
2e73e"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  PR =3D "r3"
> >
> >  RDEPENDS_${PN} +=3D "perl"
> >diff --git a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb b/met=
a-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> >index 74f9096..b3a5f2e 100644
> >--- a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> >+++ b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> >@@ -2,6 +2,7 @@ SUMMARY =3D "Minimalistic user-space Netlink utility lib=
rary"
> >  DESCRIPTION =3D "Minimalistic user-space library oriented to Netlink d=
evelopers, providing \
> >      functions for common tasks in parsing, validating, and constructin=
g both the Netlink header and TLVs."
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libmnl/index.html"
> >+SECTION =3D "libs"
> >  LICENSE =3D "LGPLv2.1+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
> >
> >diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-co=
nntrack_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter=
-conntrack_1.0.2.bb
> >index fb915ab..df4030c 100644
> >--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack=
_1.0.2.bb
> >+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack=
_1.0.2.bb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "Netfilter connection tracking library"
> >  DESCRIPTION =3D "Userspace library providing a programming interface (=
API) to the Linux kernel netfilter connection tracking state table"
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libnetfilter_conntrack=
/index.html"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libnfnetlink libmnl"
> >diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-ct=
helper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-=
cthelper_1.0.0.bb
> >index 405e8bf..3d37997 100644
> >--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_=
1.0.0.bb
> >+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_=
1.0.0.bb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "Netfilter connection tracking helper library"
> >  DESCRIPTION =3D "Userspace library providing a programming interface (=
API) to the Linux kernel netfilter user-space helper infrastructure"
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libnetfilter_cthelper/=
index.html"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libmnl"
> >diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-ct=
timeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter=
-cttimeout_1.0.0.bb
> >index 2f25852..dcf7485 100644
> >--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout=
_1.0.0.bb
> >+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout=
_1.0.0.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "Netfilter connection tracking timeout library"
> >  DESCRIPTION =3D "Userspace library providing a programming interface (=
API) to the Linux kernel netfilter fine-grain connection tracking timeout i=
nfrastructure"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libmnl"
> >diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-lo=
g_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1=
=2E0.1.bb
> >index 81909b8..30c9ae6 100644
> >--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1=
=2Ebb
> >+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1=
=2Ebb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "Netfilter logging library"
> >  DESCRIPTION =3D "Userspace library providing a programming interface (=
API) to the Linux kernel netfilter log message (NFLOG)"
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libnetfilter_log/index=
=2Ehtml"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libnfnetlink"
> >diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-qu=
eue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-que=
ue_1.0.2.bb
> >index b932ff6..ddf2aa5 100644
> >--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0=
=2E2.bb
> >+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0=
=2E2.bb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "Netfilter packet queue access library"
> >  DESCRIPTION =3D "Userspace library providing a programming interface (=
API) to access the Linux kernel netfilter packet queue"
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libnetfilter_queue/ind=
ex.html"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >  DEPENDS =3D "libnfnetlink libmnl"
> >diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.=
0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> >index 9cb615b..edd0f86 100644
> >--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> >+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> >@@ -5,7 +5,7 @@ infrastructure for in-kernel netfilter subsystems (such =
as nfnetlink_log, \
> >  nfnetlink_queue, nfnetlink_conntrack) and their respective users and/o=
r \
> >  management tools in userspace."
> >  HOMEPAGE =3D "http://www.netfilter.org/projects/libnfnetlink/index.htm=
l"
> >-SECTION =3D "devel/libs"
> >+SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >
> >
> >diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networkin=
g/recipes-irc/znc/znc_git.bb
> >index 77db25b..2e35e4d 100644
> >--- a/meta-networking/recipes-irc/znc/znc_git.bb
> >+++ b/meta-networking/recipes-irc/znc/znc_git.bb
> >@@ -1,4 +1,5 @@
> >  SUMMARY =3D "ZNC, an advanced IRC bouncer"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >
> >diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.b=
b b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> >index 8bac049..2f227a6 100644
> >--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "netkit-ft includes the ftp client."
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  HOMEPAGE=3D"ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> >  LICENSE =3D "BSD"
> >
> >diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.b=
b b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> >index 4d8d95a..abc9d88 100644
> >--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "netkit-rpc includes rpcinfo and rpcgen."
> >  HOMEPAGE =3D "http://ftp.linux.org.uk/pub/linux/Networking/netkit"
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  LICENSE =3D "SPL-1.0"
> >  LIC_FILES_CHKSUM =3D "file://rpcinfo/rpcinfo.c;beginline=3D2;endline=
=3D3;md5=3D3e6339e3ce266e1122c5ba293e04bc89"
> >
> >diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.b=
b b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> >index 8b42fa7..f14a451 100644
> >--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "netkit-rsh includes the rsh daemon and client."
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  HOMEPAGE=3D"ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> >  LICENSE =3D "BSD-4-Clause"
> >  DEPENDS =3D "xinetd libgcrypt"
> >diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_=
0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> >index c930842..24eb96f 100644
> >--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> >@@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "netkit-rusers includes rusers - Displays who is logge=
d in to machines on local network \
> >      rusersd - Logged in users server"
> >  HOMEPAGE =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://rusers/rusers.c;beginline=3D2;endline=3D3=
;md5=3Df4fc634a4ce8c569911196b72b10770e"
> >  DEPENDS =3D " tcp-wrappers libtirpc rpcbind"
> >diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17=
=2Ebb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> >index 4433dc1..04baa42 100644
> >--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "netkit-rwho includes, ruptime rwho and rwhod (Daemon =
to maintain data for rwho/ruptime)"
> >  HOMEPAGE =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://rwho/rwho.c;beginline=3D2;endline=3D3;md5=
=3D5a85f13c0142d72fc378e00f15da5b9e"
> >
> >diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_=
0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> >index 6b2e72f..0806518 100644
> >--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "netkit-telnet includes the telnet daemon and client."
> >-SECTION =3D "base"
> >+SECTION =3D "net"
> >  DEPENDS =3D "ncurses"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://telnet/telnet.cc;beginline=3D2;endline=3D=
3;md5=3D780868e7b566313e70cb701560ca95ef"
> >diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17=
=2Ebb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> >index bd54c0a..67a541d 100644
> >--- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> >+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> >@@ -1,5 +1,5 @@
> >  SUMMARY =3D "tftp - Trivial file transfer protocol client"
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD-4-Clause"
> >  DEPENDS =3D "tcp-wrappers"
> >
> >diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.b=
b b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> >index 526818c..10e98a4 100644
> >--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> >+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "ACCEL-PPP is a high performance VPN server application fo=
r linux"
> >  HOMEPAGE =3D "http://sourceforge.net/apps/trac/accel-ppp/wiki"
> >+SECTION =3D "net"
> >
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b=
5c50a"
> >diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1=
=2Ebb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> >index c9a692d..93d3a94 100644
> >--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> >+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "Various tools relating to the Simple Network Management P=
rotocol"
> >  HOMEPAGE =3D "http://www.net-snmp.org/"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=3D8;md5=3D7f=
7f00ba639ac8e8deb5a622ea24634e"
> >diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/m=
eta-networking/recipes-protocols/openflow/openflow.inc
> >index 75d8ab8..5f465ce 100644
> >--- a/meta-networking/recipes-protocols/openflow/openflow.inc
> >+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
> >@@ -6,7 +6,7 @@ control and forwarding planes of a software-defined netw=
orking architecture.\
> >  "
> >  HOMEPAGE =3D "http://www.openflow.org"
> >
> >-SECTION =3D "networking"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3d6ccf085fd7cf0a=
1e2e2"
> >diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb =
b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> >index 5a04107..d043b63 100644
> >--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> >+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> >@@ -6,7 +6,7 @@ products and is able to support hundreds of sessions, ea=
ch with \
> >  different configuration. It is used by several ISPs to provide \
> >  L2TP services and by corporations to implement L2TP VPNs."
> >  HOMEPAGE =3D "http://www.openl2tp.org/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9d9259cbbf00945adc25a470c1=
d3585"
> >  DEPENDS =3D "popt flex readline"
> >diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7=
=2E2.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> >index 6a90578..f14d8a5 100644
> >--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> >+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> >@@ -5,7 +5,7 @@ DESCRIPTION =3D "PPTP Client is a Linux, FreeBSD, NetBSD=
 \
> >      Virtual Private Network (VPN) as used by employers and some \
> >      cable and ADSL internet service providers."
> >  HOMEPAGE =3D "http://pptpclient.sourceforge.net"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c216=
6c28b"
> >
> >diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-=
networking/recipes-protocols/quagga/quagga.inc
> >index 2c0817b..071e8d4 100644
> >--- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >@@ -6,7 +6,7 @@ Quagga is a fork of GNU Zebra which was developed by Kun=
ihiro \
> >  Ishiguro. The Quagga tree aims to build a more involved community \
> >  around Quagga than the current centralised model of GNU Zebra."
> >  HOMEPAGE =3D "http://www.nongnu.org/quagga/"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0 & LGPL-2.0"
> >  DEPENDS =3D "readline ncurses perl-native"
> >  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'snmp', 'net-snmp', =
'', d)}"
> >diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiuscli=
ent-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusc=
lient-ng_0.5.6.bb
> >index 2350d4f..95faa65 100644
> >--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_=
0.5.6.bb
> >+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_=
0.5.6.bb
> >@@ -3,7 +3,7 @@ DESCRIPTION =3D "Portable, easy-to-use and standard comp=
liant library suitable \
> >  for developing free and commercial software that need support for a RA=
DIUS \
> >  protocol (RFCs 2128 and 2139)."
> >  HOMEPAGE =3D "http://sourceforge.net/projects/radiusclient-ng.berlios/"
> >-SECTION =3D "Applications/Internet"
> >+SECTION =3D "net"
> >
> >  SRC_URI =3D "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
> >     file://Modify-configure.in-and-etc-Makefile.am.patch \
> >diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb =
b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> >index d1b0481..12dc6eb 100644
> >--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> >+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "A user-mode PPPoE client and server suite for Linux"
> >  HOMEPAGE =3D "http://www.roaringpenguin.com/products/pppoe"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3Da194eaefae2be54ee322133=
9b10d0581"
> >
> >diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-=
networking/recipes-protocols/xl2tpd/xl2tpd.inc
> >index f4ea2b8..1a72fd1 100644
> >--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> >+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Xelerance version of the Layer 2 Tunneling Protocol (L2TP=
) daemon"
> >  HOMEPAGE =3D "http://www.xelerance.com/software/xl2tpd/"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  DEPENDS =3D "ppp virtual/kernel"
> >
> >  LICENSE =3D "GPLv2"
> >diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/m=
eta-networking/recipes-support/aoetools/aoetools_36.bb
> >index 2b80ae7..c382a71 100644
> >--- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
> >+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> >@@ -5,7 +5,7 @@ storage protocol, a simple protocol for using storage ov=
er anethernet LAN. \
> >  The vblade program (storage target) exports a blockdevice using AoE. \
> >  "
> >  HOMEPAGE =3D "http://sourceforge.net/projects/${BPN}"
> >-SECTION =3D "console/network"
> >+SECTION =3D "admin"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >  RRECOMMENDS_${PN} =3D "kernel-module-aoe"
> >diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4=
=2Ebb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> >index 41a55c0..9c9d502 100644
> >--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> >+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "Administration tool for arp packet filtering"
> >  PRIORITY =3D "optional"
> >  LICENSE =3D "GPL-2.0"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >
> >  PR =3D "r2"
> >
> >diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.i=
nc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> >index feeba74..0fb18d5 100644
> >--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> >+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Tools for ethernet bridging"
> >  HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/ne=
tworking/bridge"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >
> >  DEPENDS =3D "sysfsutils"
> >diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/me=
ta-networking/recipes-support/cifs/cifs-utils_git.bb
> >index 66ec7b8..e6b31fe 100644
> >--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "A a package of utilities for doing and managing mount=
s of the Linux CIFS filesystem."
> >  HOMEPAGE =3D "http://wiki.samba.org/index.php/LinuxCIFS_utils"
> >-
> >+SECTION =3D "otherosfs"
> >  LICENSE =3D "GPLv3 & LGPLv3"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >
> >diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_=
2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40=
=2E0.bb
> >index 06c0dd9..093f0d4 100644
> >--- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.=
bb
> >+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.=
bb
> >@@ -1,5 +1,7 @@
> >  require cim-schema.inc
> >
> >+SECTION =3D "doc"
> >+
> >  LICENSE =3D "DMTF"
> >
> >  SRC_URI =3D "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/=
cim_schema_${PV}Final-Doc.zip \
> >diff --git a/meta-networking/recipes-support/cim-schema/cim-schema.inc b=
/meta-networking/recipes-support/cim-schema/cim-schema.inc
> >index e35bff6..b9171e4 100644
> >--- a/meta-networking/recipes-support/cim-schema/cim-schema.inc
> >+++ b/meta-networking/recipes-support/cim-schema/cim-schema.inc
> >@@ -6,4 +6,4 @@ details for integration with other management models. Th=
e schema\
> >  provides the actual model descriptions."
> >
> >  HOMEPAGE =3D "http://www.dmtf.org/"
> >-SECTION =3D "Development/Libraries"
> >+SECTION =3D "libs"
> >diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/me=
ta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> >index 48f5178..db4c9cd 100644
> >--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> >+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "C++ library for client-side URL transfers"
> >  HOMEPAGE =3D "http://code.google.com/p/curlpp/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "libdevel"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cf=
bcb788c80a0384361b4de20420"
> >
> >diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-=
networking/recipes-support/dnsmasq/dnsmasq.inc
> >index 1335245..7fec606 100644
> >--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> >+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Lightweight, easy to configure DNS forwarder and DHCP ser=
ver"
> >  HOMEPAGE =3D "http://www.thekelleys.org.uk/dnsmasq/doc.html"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  # GPLv3 was added in version 2.41 as license option
> >  LICENSE =3D "GPLv2 | GPLv3"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3 \
> >diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.0=
2.bb b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >index 6a50971..ca59bd2 100644
> >--- a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >+++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >@@ -9,7 +9,7 @@ Unbound, known DNSSEC keys, URL's to official publicatio=
n pages of keys, \
> >  and harvested keys, as well a script to harvest DNSKEY's from DNS. \
> >  See also: system-config-dnssec"
> >  HOMEPAGE =3D "https://github.com/xelerance/dnssec-conf"
> >-SECTION =3D "System Environment/Daemons"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> >  DEPENDS +=3D "xmlto-native docbook-xml-dtd4-native \
> >diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b=
/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> >index f733a78..44be38d 100644
> >--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> >+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Dovecot is an open source IMAP and POP3 email server"
> >  DESCRIPTION =3D "Dovecot is an open source IMAP and POP3 email server =
for Linux/UNIX-like systems, written with security primarily in mind. Dovec=
ot is an excellent choice for both small and large installations. It's fast=
, simple to set up, requires no special administration and it uses very lit=
tle memory."
> >-
> >+SECTION =3D "mail"
> >  LICENSE =3D "LGPLv2.1 & MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da981379bd0f1c362f8d1d21515e=
5b30b"
> >
> >diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-n=
etworking/recipes-support/drbd/drbd_8.4.4.bb
> >index 491f05a..5baffc6 100644
> >--- a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> >+++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> >@@ -4,7 +4,7 @@ DRBD mirrors a block device over the network to another =
machine.\
> >  Think of it as networked raid 1. It is a building block for\
> >  setting up high availability (HA) clusters."
> >  HOMEPAGE =3D "http://www.drbd.org/"
> >-SECTION =3D "kernel/userland"
> >+SECTION =3D "admin"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397f=
bb018"
> >
> >diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-n=
etworking/recipes-support/esmtp/esmtp_1.2.bb
> >index 917dc8b..163148c 100644
> >--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> >+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> >@@ -4,7 +4,7 @@ with a sendmail-compatible syntax, based on libESMTP and=
 \
> >  supporting the AUTH (including the CRAM-MD5 and NTLM SASL \
> >  mechanisms) and StartTLS SMTP extensions."
> >  HOMEPAGE =3D "http://esmtp.sourceforge.net/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >
> >  DEPENDS =3D "libesmtp"
> >
> >diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.=
bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> >index a45f746..909d7cf 100644
> >--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> >+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Fetchmail retrieves mail from remote mail servers and for=
wards it via SMTP"
> >  DESCRIPTION =3D "Fetchmail is a full-featured, robust, well-documented=
 remote-mail retrieval and forwarding utility intended to be used over on-d=
emand TCP/IP links (such as SLIP or PPP connections). It supports every rem=
ote-mail protocol now in use on the Internet: POP2, POP3, RPOP, APOP, KPOP,=
 all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
> >-
> >+SECTION =3D "mail"
> >  LICENSE =3D "GPLv2 & MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbb509e0303f5ded1cbfc0cc870=
5f28c"
> >
> >diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-n=
etworking/recipes-support/fping/fping_3.5.bb
> >index fe88934..1b199d5 100644
> >--- a/meta-networking/recipes-support/fping/fping_3.5.bb
> >+++ b/meta-networking/recipes-support/fping/fping_3.5.bb
> >@@ -8,6 +8,7 @@ replies, fping will send out a ping packet and move on t=
o the next target \
> >  in a round-robin fashion."
> >  HOMEPAGE =3D "http://www.fping.org/"
> >  SECTION =3D "console/tools"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D09d77789fe32be35acde9637a5e=
e39b1"
> >
> >diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/=
meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> >index 1778412..728ad58 100644
> >--- a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> >+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> >@@ -5,7 +5,7 @@
> >  SUMMARY =3D "GeoIP perl API library to access location database"
> >  DESCRIPTION =3D "perl library for country/city/organization to IP addr=
ess or hostname mapping"
> >  HOMEPAGE =3D "http://www.maxmind.com/app/ip-location"
> >-SECTION =3D "network"
> >+SECTION =3D "libdevel"
> >  LICENSE =3D "Artistic-1.0 | GPL-1.0+"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3Db0fa745303912bd2d64430f7ae69=
487d"
> >
> >diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta=
-networking/recipes-support/geoip/geoip_1.6.0.bb
> >index ab206a0..f1b2aac 100644
> >--- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >+++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >@@ -6,7 +6,7 @@ countries as values. This database should be more comple=
te and accurate than \
> >  using reverse DNS lookups."
> >
> >  HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> >-SECTION =3D "Development/Libraries"
> >+SECTION =3D "libdevel"
> >
> >  SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.t=
ar.gz;name=3Dtarball \
> >             http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ountry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat \
> >diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb =
b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> >index 851ad41..00f285b 100644
> >--- a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> >+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> >@@ -2,7 +2,7 @@ SUMMARY =3D "Crontab entry to provide weekly updates of =
the GeoIP free databases."
> >  DESCRIPTION =3D "update databases for GeoIP"
> >
> >  HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> >-SECTION =3D "Development"
> >+SECTION =3D "net"
> >
> >  DEPENDS =3D "zlib curl"
> >
> >diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.b=
b b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> >index 58dca86..acc0864 100644
> >--- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> >+++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "Configure network interfaces for parallel routing"
> >  HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/ne=
tworking/bonding"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://ifenslave.c;beginline=3D8;endline=3D12;md=
5=3Da9f0bd2324cdc1b36d1f44f0e643a62a"
> >diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/me=
ta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >index cc1f8b0..e60fc8a 100644
> >--- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "iftop does for network usage what top(1) does for CPU usa=
ge"
> >  HOMEPAGE =3D "http://www.ex-parrot.com/pdw/iftop/"
> >-
> >+SECTION =3D "net"
> >  DEPENDS =3D "libpcap ncurses"
> >
> >  LICENSE =3D "GPLv2"
> >diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8=
=2E2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> >index 67b70d0..f4c660a 100644
> >--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> >+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> >@@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "IPsec-Tools is a port of KAME's IPsec utilities to th=
e \
> >  Linux-2.6 IPsec implementation."
> >  HOMEPAGE =3D "http://ipsec-tools.sourceforge.net/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endlin=
e=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> >
> >diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/m=
eta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> >index b640a50..7302e9d 100644
> >--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> >+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> >@@ -9,7 +9,7 @@ methods (NAT, tunneling, and direct routing), and eight =
load balancing algorithm
> >  (round robin, weighted round robin,  least-connec-tion, weighted least=
-connection, \
> >  locality-based  least-connection, locality-based least-connection with=
 replication, \
> >  destination-hashing, and source-hashing)."
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D40;endline=3D56;md5=3D=
a54cba37b64924aa5008881607942892"
> >
> >diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb =
b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> >index 8b2b99f..7ddf591 100644
> >--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> >+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> >@@ -4,7 +4,7 @@ DESCRIPTION =3D "LibESMTP is a library to manage posting=
 \
> >  preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
> >  HOMEPAGE =3D "http://www.stafford.uklinux.net/libesmtp/"
> >  LICENSE =3D "LGPLv2+"
> >-SECTION =3D "libs/network"
> >+SECTION =3D "libs"
> >
> >  DEPENDS =3D "openssl"
> >
> >diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.i=
nc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> >index 50ef4d6..172443a 100644
> >--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
> >+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> >@@ -1,5 +1,6 @@
> >  DESCRIPTION =3D "open source C/C++ client library and tools for the me=
mcached server"
> >  DEPENDS =3D "libevent util-linux"
> >+SECTION =3D "libdevel"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D865490941c91ba790f0ea78dec9=
3bd60"
> >
> >diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1=
=2E0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.=
16.bb
> >index 7477349..d3e6a5d 100644
> >--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> >+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "The Linux Kernel Stream Control Transmission Protocol (lk=
sctp) project"
> >  HOMEPAGE =3D "http://lksctp.org"
> >-SECTION =3D "libs"
> >+SECTION =3D "net"
> >  LICENSE =3D "LGPLv2.1 & GPLv2"
> >
> >  LIC_FILES_CHKSUM =3D " \
> >diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_g=
it.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> >index ca10262..f57df5d 100644
> >--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> >+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "Utilities for managing the Linux LoWPAN stack"
> >  DESCRIPTION =3D "This is a set of utils to manage the Linux LoWPAN sta=
ck. \
> >  The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IE=
EE 802.15.4-2006) compatibility."
> >-
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >
> >diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0=
=2Ebb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> >index b97e9d1..a90177f 100644
> >--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> >+++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> >@@ -3,7 +3,7 @@ DESCRIPTION =3D "A GNU/Linux utility for viewing/manipul=
ating the MAC address of n
> >  HOMEPAGE =3D "http://www.alobbs.com/macchanger"
> >  LICENSE  =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >-
> >+SECTION =3D "net"
> >
> >  SRC_URI  =3D "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
> >
> >diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.=
bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> >index 4d93f04..293f8d4 100644
> >--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> >+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> >@@ -6,7 +6,7 @@ DESCRIPTION =3D "\
> >   of the specific application. Traditionally this has been used in mod_=
perl \
> >   apps to avoid storing large chunks of data in Apache memory, and to s=
hare \
> >   this burden across several machines."
> >-
> >+SECTION =3D "web"
> >  HOMEPAGE =3D "http://memcached.org/"
> >  LICENSE =3D "BSD-3-Clause"
> >
> >diff --git a/meta-networking/recipes-support/mtr/mtr_0.86.bb b/meta-netw=
orking/recipes-support/mtr/mtr_0.86.bb
> >index a60bd34..7b73791 100644
> >--- a/meta-networking/recipes-support/mtr/mtr_0.86.bb
> >+++ b/meta-networking/recipes-support/mtr/mtr_0.86.bb
> >@@ -1,6 +1,7 @@
> >  SUMMARY =3D "Combined traceroute and ping utility"
> >  DESCRIPTION =3D "mtr combines the functionality of the 'traceroute' an=
d 'ping' programs in a single network diagnostic tool."
> >  HOMEPAGE =3D "http://www.bitwizard.nl/mtr/"
> >+SECTION =3D "net"
> >  DEPENDS =3D "ncurses"
> >
> >  LICENSE =3D "GPLv2"
> >diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/me=
ta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> >index a0e37e1..bea5e13 100644
> >--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> >+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> >@@ -1,7 +1,6 @@
> >-SECTION =3D "console/network"
> >  DESCRIPTION =3D "This package includes some useful diagnostics tools f=
or \
> >  IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute=
6."
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  HOMEPAGE =3D "http://www.remlab.net/ndisc6/"
> >  LICENSE =3D "GPL-2.0"
> >
> >diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-ne=
tworking/recipes-support/netcat/netcat.inc
> >index 6c815d9..9cb243d 100644
> >--- a/meta-networking/recipes-support/netcat/netcat.inc
> >+++ b/meta-networking/recipes-support/netcat/netcat.inc
> >@@ -1,4 +1,4 @@
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  inherit update-alternatives gettext
> >
> >  ALTERNATIVE_${PN} =3D "nc"
> >diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-=
networking/recipes-support/netcf/gnulib_git.bb
> >index 1da6c83..a064502 100644
> >--- a/meta-networking/recipes-support/netcf/gnulib_git.bb
> >+++ b/meta-networking/recipes-support/netcf/gnulib_git.bb
> >@@ -7,7 +7,7 @@ to be copied from gnulib, it is not a library per-se, as=
 much \
> >  as a collection of portable idioms to be used in other projects."
> >
> >  HOMEPAGE =3D "http://www.gnu.org/software/gnulib/"
> >-SECTION =3D "libs"
> >+SECTION =3D "devel"
> >  LICENSE =3D "LGPLv2+"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4cf3810f33a067ea7ccd2cd889=
fed21"
> >diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-n=
etworking/recipes-support/netcf/netcf_git.bb
> >index 979e45b..0e88b30 100644
> >--- a/meta-networking/recipes-support/netcf/netcf_git.bb
> >+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "netcf"
> >  DESCRIPTION =3D "netcf is a cross-platform network configuration libra=
ry."
> >  HOMEPAGE =3D "https://fedorahosted.org/netcf/"
> >-SECTION =3D "console/tools"
> >+SECTION =3D "libs"
> >  LICENSE =3D "LGPLv2.1"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff"
> >diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/=
meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> >index ffa77d7..d634af4 100644
> >--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> >+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "A networking benchmarking tool"
> >  DESCRIPTION =3D "Network performance benchmark including tests for TCP=
, UDP, sockets, ATM and more."
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  HOMEPAGE =3D "http://www.netperf.org/"
> >  LICENSE =3D "netperf"
> >  LICENSE_FLAGS =3D "non-commercial"
> >diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networki=
ng/recipes-support/nis/nis.inc
> >index eaff949..c4aa10e 100644
> >--- a/meta-networking/recipes-support/nis/nis.inc
> >+++ b/meta-networking/recipes-support/nis/nis.inc
> >@@ -5,7 +5,7 @@
> >  # the rpcsvc functionality is not present in uclibc
> >  DESCRIPTION =3D "NIS Server and Tools"
> >  HOMEPAGE =3D "http://www.linux-nis.org/nis/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >
> >diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p2.bb
> >index 693bdbb..7f9ff4a 100644
> >--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> >+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> >@@ -4,7 +4,7 @@ synchronize the time of a computer client or server to \
> >  another server or reference time source, such as a radio \
> >  or satellite receiver or modem."
> >  HOMEPAGE =3D "http://support.ntp.org"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "NTP"
> >  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df41fedb22dffefcbfafecc85b=
0f79cfa"
> >
> >diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb b/=
meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> >index 08f30b5..105e369 100644
> >--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> >+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> >@@ -1,6 +1,6 @@
> >  SUMMARY =3D "A full-featured SSL VPN solution via tun device."
> >  HOMEPAGE =3D "http://openvpn.sourceforge.net"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5aac200199fde47501876cba726=
3cb0c"
> >  DEPENDS =3D "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)}"
> >diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-n=
etworking/recipes-support/pimd/pimd_2.1.8.bb
> >index f032361..ba63be5 100644
> >--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> >+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "pimd is a lightweight stand-alone PIM-SM v2 multicast rou=
ting daemon."
> >  HOMEPAGE =3D "http://troglobit.com/pimd.html"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94f108f91fab720d62425770b70=
dd790"
> >
> >diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb =
b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> >index c206cb9..9b6fc2f 100644
> >--- a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> >+++ b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "Static Multicast Routing Daemon"
> >  DESCRIPTION =3D "SMCRoute is a daemon and command line tool to manipul=
ate the multicast routing table in the UNIX kernel."
> >  HOMEPAGE =3D "http://troglobit.github.io/smcroute.html"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b49533=
135d4"
> >
> >diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/=
meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> >index 0eaa7ca..32caec6 100644
> >--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> >+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> >@@ -1,5 +1,6 @@
> >  SUMMARY =3D "ssmping is a tool for checking whether one can receive SS=
M from a given host"
> >  HOMEPAGE =3D "http://www.venaas.no/multicast/ssmping/"
> >+SECTION =3D "net"
> >  LICENSE =3D "ISC"
> >  LIC_FILES_CHKSUM =3D "file://asmping.c;beginline=3D2;endline=3D11;md5=
=3D1ca8d1a1ca931e5cfe604ebf20a78b71"
> >
> >diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.1=
=2Ebb b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> >index 6b91319..49dcced 100644
> >--- a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> >+++ b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> >@@ -2,7 +2,7 @@ DESCRIPTION =3D "strongSwan is an OpenSource IPsec imple=
mentation for the \
> >  Linux operating system."
> >  SUMMARY =3D "strongSwan is an OpenSource IPsec implementation"
> >  HOMEPAGE =3D "http://www.strongswan.org"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >  DEPENDS =3D "gmp openssl flex-native flex bison-native"
> >diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb b/=
meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> >index 1fdaf30..d404f0f 100644
> >--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> >+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> >@@ -2,7 +2,7 @@ SUMMARY =3D "A sophisticated network protocol analyzer"
> >  HOMEPAGE =3D "http://www.tcpdump.org/"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b0366557951c84a94fabe352=
9f867"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  DEPENDS =3D "libpcap"
> >
> >  SRC_URI =3D " \
> >diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b=
/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> >index 203d143..b887fc7 100644
> >--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> >+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "tcpslice"
> >  DESCRIPTION =3D "A tool for extracting parts of a tcpdump packet trace=
=2E"
> >  HOMEPAGE =3D "http://www.tcpdump.org/related.html"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >
> >  LICENSE =3D "BSD-4-Clause"
> >  LIC_FILES_CHKSUM =3D "file://tcpslice.c;endline=3D20;md5=3D99519e2e523=
4d1662a4ce16baa62c64e"
> >diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.b=
b b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> >index 9ecb695..ccbab9f 100644
> >--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> >+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY =3D "Use previously captured traffic to test network devices"
> >
> >  HOMEPAGE =3D "http://tcpreplay.synfin.net/"
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >
> >  LICENSE =3D "GPLv3"
> >  LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Dc33cccf72cc1603e8a72a8=
4811ae3ac8"
> >diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/m=
eta-networking/recipes-support/tnftp/tnftp_20130505.bb
> >index eda9d5c..7d1c515 100644
> >--- a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> >+++ b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> >@@ -9,7 +9,7 @@ remote files, passive mode support (with fallback to act=
ive mode), \
> >  SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
> >  throttling."
> >
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  LICENSE =3D "BSD-4-Clause"
> >
> >  DEPENDS =3D "ncurses"
> >diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.2=
1.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> >index 7bdbe16..09da1ef 100644
> >--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> >+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> >@@ -5,7 +5,7 @@ the IP number and host name (if possible) of the machine=
s along the \
> >  route taken by the packets.  Traceroute is used as a network debugging=
 \
> >  tool.  If you're having network connectivity problems, traceroute will=
 \
> >  show you where the trouble is coming from along the route."
> >-SECTION =3D "console/network"
> >+SECTION =3D "net"
> >  HOMEPAGE =3D "http://traceroute.sourceforge.net/"
> >  LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
> >diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.=
bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> >index 6833216..99ff5d0 100644
> >--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> >+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
> >  HOMEPAGE =3D "http://www.wireshark.org"
> >-SECTION =3D "network"
> >+SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb14=
9195e065b0"
> >
> >
--=20
-Joe MacDonald.
:wq

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVUqzoAAoJEEn8ffcsOfaW06sH/jSOmjX0/M7wG0sxtVUjVxYH
SAzRYc07J1f5yvC4cZEx1qXv2PvOulLh1ds3a2e1HK156+0lKn4VxISxdDLkYTEl
WFiIhq6AQ2HDdYTaxp8L7/ZV80bTT50s7W3Wza6VI4l8FymuFjaSVmCVOIofCeuW
M3gR2YqvtSRh4bP6bB4f64tuXZUbLyMKB7wF2TopBvpoM8mYV2qQjlwKemUQHgJG
wuIc2HslHMzU/xnaEvCLYTK3x5SjYztC3vFKK9eSR6MB/CK8SS0I6KPnpHHiaV/O
EYg8OULUdg2obrJNpY9dT+XRpTKZ99wRqoj75Q6Z/LdnJvoRsqP+n/pZLspTsaw=
=PnF6
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
