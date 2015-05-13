Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8A10A73FE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 01:15:26 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so32561027pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 18:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wmKOHI6LVcnrGbcm9lhYUpmKp+2zaDiEnjFzmlABqGo=;
	b=O0x5IigNzSyAMTAZEFWF78A7hXuWHIlTaEYOC3ey3g0oxXIzKnKBxiQaYg8RmMsaNF
	m0Xw2vtENjTJjdgTdx4Dq93AsNhaXWJAyU57CShIugTyP5lv9cWNHkymaBwUSuWoNT8Z
	3hjL2FXOveytRv70Y3IGEKMNH4f2l9JzUTAthoyNJgt4GlZROvcG6kcYd/v5P363TQgr
	h/ncBx7yZ3M5CTs5JyH+wdm/4LVe5hOVNm4TAi1kFr2BFDjQvF48GWCvLBjqRlTyu9mZ
	Olhu3nbou0lbaZr50mhcPDWbZpR9QtFRit5NMcHWwCex1jgHYNh43ZB4V3ynRqrrkR/I
	A4JA==
X-Received: by 10.68.90.132 with SMTP id bw4mr32569830pbb.102.1431479728179;
	Tue, 12 May 2015 18:15:28 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	td3sm17519400pab.46.2015.05.12.18.15.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 18:15:26 -0700 (PDT)
Message-ID: <5552A5AC.4040902@gmail.com>
Date: Tue, 12 May 2015 18:15:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1431376904.git.joe_macdonald@mentor.com>
	<c0cb9ac6a71b0cca54ddfe38d2867c30c61c1e9c.1431376904.git.joe_macdonald@mentor.com>
In-Reply-To: <c0cb9ac6a71b0cca54ddfe38d2867c30c61c1e9c.1431376904.git.joe_macdonald@mentor.com>
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
X-List-Received-Date: Wed, 13 May 2015 01:15:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Joe,

I am in the process of updating  wireshark to a new version. Are you 
going to handle the SECTION merge fixup if I post before these changes 
go in or should I just include them with my post?

- armin

On 05/11/2015 01:59 PM, Joe MacDonald wrote:
> SECTION has been used inconsistently throughout the recipes in this layer.
> Convert them to all use the same convention.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>   meta-networking/recipes-connectivity/crda/crda_3.13.bb                 | 2 +-
>   meta-networking/recipes-connectivity/daq/daq_2.0.2.bb                  | 1 +
>   meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb      | 2 +-
>   meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb           | 1 +
>   meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb        | 2 +-
>   meta-networking/recipes-connectivity/sethdlc/sethdlc.bb                | 1 +
>   meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb            | 1 +
>   meta-networking/recipes-connectivity/ufw/ufw_0.33.bb                   | 1 +
>   meta-networking/recipes-connectivity/vlan/vlan_1.9.bb                  | 1 +
>   meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb                | 2 +-
>   meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb          | 2 +-
>   meta-networking/recipes-daemons/atftp/atftp_git.bb                     | 2 +-
>   meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb                 | 2 +-
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb        | 2 +-
>   meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb                    | 2 +-
>   .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb             | 2 +-
>   meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb                | 2 +-
>   meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb                   | 2 +-
>   meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb               | 1 +
>   meta-networking/recipes-daemons/postfix/postfix.inc                    | 2 +-
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb               | 2 +-
>   meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb                 | 2 +-
>   meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb          | 1 +
>   meta-networking/recipes-daemons/radvd/radvd.inc                        | 2 +-
>   meta-networking/recipes-daemons/squid/squid_3.4.7.bb                   | 2 +-
>   meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb               | 2 +-
>   meta-networking/recipes-daemons/vblade/vblade_20.bb                    | 2 +-
>   meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb                 | 2 +-
>   .../recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb            | 2 +-
>   meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb           | 2 +-
>   meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb                  | 1 +
>   .../recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb        | 1 +
>   .../recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb         | 1 +
>   .../recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb        | 1 +
>   meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb  | 1 +
>   .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb            | 1 +
>   meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb      | 2 +-
>   meta-networking/recipes-irc/znc/znc_git.bb                             | 1 +
>   meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb           | 2 +-
>   meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb           | 2 +-
>   meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb           | 2 +-
>   meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb     | 2 +-
>   meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb         | 2 +-
>   meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb     | 2 +-
>   meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb         | 2 +-
>   meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb           | 1 +
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb         | 1 +
>   meta-networking/recipes-protocols/openflow/openflow.inc                | 2 +-
>   meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb             | 2 +-
>   meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb       | 2 +-
>   meta-networking/recipes-protocols/quagga/quagga.inc                    | 2 +-
>   .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb         | 2 +-
>   meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb             | 2 +-
>   meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc                    | 2 +-
>   meta-networking/recipes-support/aoetools/aoetools_36.bb                | 2 +-
>   meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb         | 2 +-
>   meta-networking/recipes-support/bridge-utils/bridge-utils.inc          | 2 +-
>   meta-networking/recipes-support/cifs/cifs-utils_git.bb                 | 2 +-
>   meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb   | 2 ++
>   meta-networking/recipes-support/cim-schema/cim-schema.inc              | 2 +-
>   meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb                 | 2 +-
>   meta-networking/recipes-support/dnsmasq/dnsmasq.inc                    | 2 +-
>   meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb        | 2 +-
>   meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb              | 2 +-
>   meta-networking/recipes-support/drbd/drbd_8.4.4.bb                     | 2 +-
>   meta-networking/recipes-support/esmtp/esmtp_1.2.bb                     | 2 +-
>   meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb          | 2 +-
>   meta-networking/recipes-support/fping/fping_3.5.bb                     | 1 +
>   meta-networking/recipes-support/geoip/geoip-perl_1.45.bb               | 2 +-
>   meta-networking/recipes-support/geoip/geoip_1.6.0.bb                   | 2 +-
>   meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb             | 2 +-
>   meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb           | 2 +-
>   meta-networking/recipes-support/iftop/iftop_1.0pre2.bb                 | 2 +-
>   meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb       | 2 +-
>   meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb                | 2 +-
>   meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb             | 2 +-
>   meta-networking/recipes-support/libmemcached/libmemcached.inc          | 1 +
>   meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb    | 2 +-
>   meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb       | 2 +-
>   meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb         | 2 +-
>   meta-networking/recipes-support/memcached/memcached_1.4.17.bb          | 2 +-
>   meta-networking/recipes-support/mtr/mtr_0.86.bb                        | 1 +
>   meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb                 | 3 +--
>   meta-networking/recipes-support/netcat/netcat.inc                      | 2 +-
>   meta-networking/recipes-support/netcf/gnulib_git.bb                    | 2 +-
>   meta-networking/recipes-support/netcf/netcf_git.bb                     | 2 +-
>   meta-networking/recipes-support/netperf/netperf_2.6.0.bb               | 2 +-
>   meta-networking/recipes-support/nis/nis.inc                            | 2 +-
>   meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb                     | 2 +-
>   meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb               | 2 +-
>   meta-networking/recipes-support/pimd/pimd_2.1.8.bb                     | 1 +
>   meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb             | 2 +-
>   meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb               | 1 +
>   meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb         | 2 +-
>   meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb               | 2 +-
>   meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb              | 2 +-
>   meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb           | 2 +-
>   meta-networking/recipes-support/tnftp/tnftp_20130505.bb                | 2 +-
>   meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb        | 2 +-
>   meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb          | 2 +-
>   100 files changed, 101 insertions(+), 78 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> index fced75e..12eefe0 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Wireless Central Regulatory Domain Agent"
>   HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
> -
> +SECTION = "net"
>   LICENSE = "copyleft-next-0.3.0 & ISC"
>   LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe \
>                       file://${WORKDIR}/wireless-regdb-2014.11.18/LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
> index 4cf3f1c..b8f8407 100644
> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
> +++ b/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "The dump DAQ test the various inline mode features "
>   HOMEPAGE = "http://www.snort.org"
> +SECTION = "libs"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
>
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> index e46133e..cd7b425 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "The GNU inetutils are a collection of common \
>   networking utilities and servers including ftp, ftpd, rcp, \
>   rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>   talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> -SECTION = "libs"
> +SECTION = "net"
>   DEPENDS = "ncurses netbase readline"
>   LICENSE = "GPLv3"
>
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> index 4752506..28b6c82 100644
> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "dumb networking library"
>   HOMEPAGE = "http://code.google.com/p/libdnet/"
> +SECTION = "libs"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
>
> diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> index 8adc0b1..caa4cd3 100644
> --- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> +++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> @@ -21,7 +21,7 @@ BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -SECTION = "net"
> +SECTION = "libdevel"
>
>   SRC_URI = "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
>
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> index 5e8d9d9..fc304fa 100644
> --- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> @@ -1,5 +1,6 @@
>   DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
>   HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
> +SECTION = "comm"
>   LICENSE = "GPLv2 & GPLv2+ "
>   LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
>
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> index 17d6792..66653c6 100644
> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> @@ -1,5 +1,6 @@
>   DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
>   HOMEPAGE = "http://www.snort.org/"
> +SECTION = "net"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
>
> diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> index 467f2a8..2721f8f 100644
> --- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> +++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> @@ -3,6 +3,7 @@ DESCRIPTION = "UFW stands for Uncomplicated Firewall, and is program for \
>   managing a netfilter firewall. It provides a command line interface and aims \
>   to be uncomplicated and easy to use."
>   HOMEPAGE = "https://launchpad.net/ufw"
> +SECTION = "net"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>
> diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> index 086f559..8df93e4 100644
> --- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> +++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> @@ -1,4 +1,5 @@
>   SUMMARY = "VLAN provides vconfig utility"
> +SECTION = "misc"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://vconfig.c;md5=293ef69c4e88434d37a5ee577a5288cb"
>
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index 151aaf9..34499d6 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "A client for the Cisco3000 VPN Concentrator"
>   HOMEPAGE = "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
>   AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
> -SECTION = "console/network"
> +SECTION = "net"
>   PRIORITY = "optional"
>   LICENSE = "GPL-2.0+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> index 2366fb1..591ff32 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written in
>                  a full TLS 1.2 client and server."
>   HOMEPAGE = "http://www.wolfssl.com/yaSSL/Products-wolfssl.html"
>   BUGTRACKER = "http://github.com/wolfssl/wolfssl/issues"
> -SECTION = "libs/network"
> +SECTION = "libs"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> index ee84f77..b53f637 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Advanced TFTP server and client"
> -SECTION = "network"
> +SECTION = "net"
>   HOMEPAGE = "http://packages.debian.org/atftp"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> index 13af2fe..64142ef 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Kernel based automounter for linux"
> -SECTION = "base"
> +SECTION = "utils"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index c235a1b..33468a1 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Generic client/server library for SASL authentication"
> -SECTION = "console/network"
> +SECTION = "libs"
>   DEPENDS = "openssl virtual/db"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> index 3b8fdc9..d3858ad 100644
> --- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> @@ -5,7 +5,7 @@ nameserver, but can also act as the primary nameserver for a subnet behind \
>   a firewall. It also has features such as caching DNS requests, support for \
>   DNS servers, cache poisoning prevention, TCP support, etc.."
>   HOMEPAGE = "http://dnrd.sourceforge.net/"
> -SECTION = "System Environment/Daemons"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0be67017f1c770313ad7b40e18d568f1"
>
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> index f510ce5..03f6459 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> @@ -6,7 +6,7 @@ programs used to manage it. iSCSI is a protocol for distributed \
>   disk access using SCSI commands sent over Internet Protocol networks."
>   HOMEPAGE = "http://www.open-iscsi.org/"
>   LICENSE = "GPLv2 & LGPLv2.1"
> -SECTION = "console/network"
> +SECTION = "net"
>   DEPENDS = "openssl flex-native bison-native"
>
>   LIC_FILES_CHKSUM = \
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> index 4dad80d..8c44a3e 100644
> --- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Intel LLDP Agent"
>   DESCRIPTION = "\
>   This package contains the Linux user space daemon and configuration tool for \
>   Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
> -SECTION = "System Environment/Daemons"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
>   DEPENDS = "libconfig libnl"
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> index 5e63293..40b59a4 100644
> --- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "A sophisticated console ftp client"
>   HOMEPAGE = "http://ncftp.com/"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "ClArtistic"
>   LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
>   DEPENDS = "ncurses"
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> index 6d31b1c..5895b46 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
>   SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
>   SRC_URI[sha256sum] = "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
>
> +SECTION = "admin"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index eb1c547..72bc936 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -5,7 +5,7 @@ Postfix attempts to be fast, easy to administer, and secure. The outsidei \
>   has a definite Sendmail-ish flavor, but the inside is completely different."
>
>   HOMEPAGE= "http://www.postfix.org"
> -SECTION = "console/network"
> +SECTION = "mail"
>   DEPENDS = "virtual/db libpcre openssl postfix-native \
>       ${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
>       ${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> index 13c9410..00291c6 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Secure and configurable FTP server"
> -SECTION = "console/network"
> +SECTION = "net"
>   HOMEPAGE = "http://www.proftpd.org"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> index 0dcfc1f..c65e735 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> @@ -4,7 +4,7 @@ defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2
>   and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
>   time coordination of LAN connected computers."
>   HOMEPAGE = "http://sourceforge.net/projects/ptpd"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
>
> diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> index 974e6b7..bbd47fd 100644
> --- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> +++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "FTP Server with a strong focus on software security"
>   DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and standard-conformant FTP server."
>   HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ae9e161311a5a0768c333b537a40e332"
>
> diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
> index 6b595b0..47e4736 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd.inc
> +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> @@ -7,7 +7,7 @@ advertisements hosts can automatically configure their \
>   addresses and some other parameters. They also can \
>   choose a default router based on these advertisements."
>   HOMEPAGE = "http://www.litech.org/radvd/"
> -SECTION = "console/network"
> +SECTION = "net"
>   DEPENDS = "flex-native libdaemon"
>
>   # License is BSD-Style (with advertising clause) but also has an additional 0th clause
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> index c5f616d..7b00dfc 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> @@ -6,7 +6,7 @@ Squid offers a rich set of traffic optimization options, most of which are \
>   enabled by default for simpler installation and high performance. \
>   "
>   HOMEPAGE = "http://www.squid-cache.org"
> -SECTION = "network"
> +SECTION = "web"
>   LICENSE = "GPLv2+"
>
>   MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> index 3f17fd6..98842e4 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -6,7 +6,7 @@ interface for TFTP, which allows users to transfer files to and from a \
>   remote machine.  This program and TFTP provide very little security, \
>   and should not be enabled unless it is expressly needed."
>   DEPENDS = "tcp-wrappers readline"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "BSD-4-Clause"
>   LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
>                       file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
> diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_20.bb
> index a2ebb5a..a357e40 100644
> --- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
> +++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "Virtual EtherDrive blade AoE target"
> -SECTION = "console/network"
> +SECTION = "admin"
>
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> index fbeca9b..9d1c1cc 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Very Secure FTP server"
>   HOMEPAGE = "https://security.appspot.com/vsftpd.html"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
>
> diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
> index 0cc1398..57fe21c 100644
> --- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
> +++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "Connection tracking userspace tools for Linux"
> +SECTION = "net"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
>              libnetfilter-cthelper libnetfilter-queue bison-native"
>
> -
>   SRC_URI = " \
>       http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
>       file://conntrack-failover \
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 32cfc75..2e49dab 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
>                  advanced logging, MAC DNAT/SNAT and brouting."
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
> -SECTION = "console/network"
> +SECTION = "net"
>   PR = "r3"
>
>   RDEPENDS_${PN} += "perl"
> diff --git a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> index 74f9096..b3a5f2e 100644
> --- a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> +++ b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> @@ -2,6 +2,7 @@ SUMMARY = "Minimalistic user-space Netlink utility library"
>   DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
>       functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
>   HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
> +SECTION = "libs"
>   LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
> index fb915ab..df4030c 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "Netfilter connection tracking library"
>   DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter connection tracking state table"
>   HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_conntrack/index.html"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libnfnetlink libmnl"
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
> index 405e8bf..3d37997 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "Netfilter connection tracking helper library"
>   DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter user-space helper infrastructure"
>   HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_cthelper/index.html"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libmnl"
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
> index 2f25852..dcf7485 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "Netfilter connection tracking timeout library"
>   DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter fine-grain connection tracking timeout infrastructure"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libmnl"
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> index 81909b8..30c9ae6 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "Netfilter logging library"
>   DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter log message (NFLOG)"
>   HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_log/index.html"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libnfnetlink"
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
> index b932ff6..ddf2aa5 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "Netfilter packet queue access library"
>   DESCRIPTION = "Userspace library providing a programming interface (API) to access the Linux kernel netfilter packet queue"
>   HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_queue/index.html"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libnfnetlink libmnl"
> diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> index 9cb615b..edd0f86 100644
> --- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> +++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
> @@ -5,7 +5,7 @@ infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
>   nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
>   management tools in userspace."
>   HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
> -SECTION = "devel/libs"
> +SECTION = "libs"
>   LICENSE = "GPLv2+"
>
>
> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
> index 77db25b..2e35e4d 100644
> --- a/meta-networking/recipes-irc/znc/znc_git.bb
> +++ b/meta-networking/recipes-irc/znc/znc_git.bb
> @@ -1,4 +1,5 @@
>   SUMMARY = "ZNC, an advanced IRC bouncer"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> index 8bac049..2f227a6 100644
> --- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "netkit-ft includes the ftp client."
> -SECTION = "networking"
> +SECTION = "net"
>   HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
>   LICENSE = "BSD"
>
> diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> index 4d8d95a..abc9d88 100644
> --- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "netkit-rpc includes rpcinfo and rpcgen."
>   HOMEPAGE = "http://ftp.linux.org.uk/pub/linux/Networking/netkit"
> -SECTION = "networking"
> +SECTION = "net"
>   LICENSE = "SPL-1.0"
>   LIC_FILES_CHKSUM = "file://rpcinfo/rpcinfo.c;beginline=2;endline=3;md5=3e6339e3ce266e1122c5ba293e04bc89"
>
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> index 8b42fa7..f14a451 100644
> --- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "netkit-rsh includes the rsh daemon and client."
> -SECTION = "networking"
> +SECTION = "net"
>   HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
>   LICENSE = "BSD-4-Clause"
>   DEPENDS = "xinetd libgcrypt"
> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> index c930842..24eb96f 100644
> --- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "netkit-rusers includes rusers - Displays who is logged in to machines on local network \
>       rusersd - Logged in users server"
>   HOMEPAGE = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> -SECTION = "networking"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=f4fc634a4ce8c569911196b72b10770e"
>   DEPENDS = " tcp-wrappers libtirpc rpcbind"
> diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> index 4433dc1..04baa42 100644
> --- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "netkit-rwho includes, ruptime rwho and rwhod (Daemon to maintain data for rwho/ruptime)"
>   HOMEPAGE = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> -SECTION = "networking"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://rwho/rwho.c;beginline=2;endline=3;md5=5a85f13c0142d72fc378e00f15da5b9e"
>
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> index 6b2e72f..0806518 100644
> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "netkit-telnet includes the telnet daemon and client."
> -SECTION = "base"
> +SECTION = "net"
>   DEPENDS = "ncurses"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://telnet/telnet.cc;beginline=2;endline=3;md5=780868e7b566313e70cb701560ca95ef"
> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> index bd54c0a..67a541d 100644
> --- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> @@ -1,5 +1,5 @@
>   SUMMARY = "tftp - Trivial file transfer protocol client"
> -SECTION = "networking"
> +SECTION = "net"
>   LICENSE = "BSD-4-Clause"
>   DEPENDS = "tcp-wrappers"
>
> diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> index 526818c..10e98a4 100644
> --- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> +++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "ACCEL-PPP is a high performance VPN server application for linux"
>   HOMEPAGE = "http://sourceforge.net/apps/trac/accel-ppp/wiki"
> +SECTION = "net"
>
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> index c9a692d..93d3a94 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "Various tools relating to the Simple Network Management Protocol"
>   HOMEPAGE = "http://www.net-snmp.org/"
> +SECTION = "net"
>   LICENSE = "BSD"
>
>   LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
> diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
> index 75d8ab8..5f465ce 100644
> --- a/meta-networking/recipes-protocols/openflow/openflow.inc
> +++ b/meta-networking/recipes-protocols/openflow/openflow.inc
> @@ -6,7 +6,7 @@ control and forwarding planes of a software-defined networking architecture.\
>   "
>   HOMEPAGE = "http://www.openflow.org"
>
> -SECTION = "networking"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> index 5a04107..d043b63 100644
> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> @@ -6,7 +6,7 @@ products and is able to support hundreds of sessions, each with \
>   different configuration. It is used by several ISPs to provide \
>   L2TP services and by corporations to implement L2TP VPNs."
>   HOMEPAGE = "http://www.openl2tp.org/"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585"
>   DEPENDS = "popt flex readline"
> diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> index 6a90578..f14d8a5 100644
> --- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> +++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
>       Virtual Private Network (VPN) as used by employers and some \
>       cable and ADSL internet service providers."
>   HOMEPAGE = "http://pptpclient.sourceforge.net"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 2c0817b..071e8d4 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -6,7 +6,7 @@ Quagga is a fork of GNU Zebra which was developed by Kunihiro \
>   Ishiguro. The Quagga tree aims to build a more involved community \
>   around Quagga than the current centralised model of GNU Zebra."
>   HOMEPAGE = "http://www.nongnu.org/quagga/"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "GPL-2.0 & LGPL-2.0"
>   DEPENDS = "readline ncurses perl-native"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
> diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
> index 2350d4f..95faa65 100644
> --- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
> +++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Portable, easy-to-use and standard compliant library suitable \
>   for developing free and commercial software that need support for a RADIUS \
>   protocol (RFCs 2128 and 2139)."
>   HOMEPAGE = "http://sourceforge.net/projects/radiusclient-ng.berlios/"
> -SECTION = "Applications/Internet"
> +SECTION = "net"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
>      file://Modify-configure.in-and-etc-Makefile.am.patch \
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> index d1b0481..12dc6eb 100644
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "A user-mode PPPoE client and server suite for Linux"
>   HOMEPAGE = "http://www.roaringpenguin.com/products/pppoe"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
>
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> index f4ea2b8..1a72fd1 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> @@ -1,6 +1,6 @@
>   SUMMARY = "Xelerance version of the Layer 2 Tunneling Protocol (L2TP) daemon"
>   HOMEPAGE = "http://www.xelerance.com/software/xl2tpd/"
> -SECTION = "network"
> +SECTION = "net"
>   DEPENDS = "ppp virtual/kernel"
>
>   LICENSE = "GPLv2"
> diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> index 2b80ae7..c382a71 100644
> --- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
> +++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> @@ -5,7 +5,7 @@ storage protocol, a simple protocol for using storage over anethernet LAN. \
>   The vblade program (storage target) exports a blockdevice using AoE. \
>   "
>   HOMEPAGE = "http://sourceforge.net/projects/${BPN}"
> -SECTION = "console/network"
> +SECTION = "admin"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   RRECOMMENDS_${PN} = "kernel-module-aoe"
> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> index 41a55c0..9c9d502 100644
> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Administration tool for arp packet filtering"
>   PRIORITY = "optional"
>   LICENSE = "GPL-2.0"
> -SECTION = "console/network"
> +SECTION = "net"
>
>   PR = "r2"
>
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> index feeba74..0fb18d5 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> @@ -1,6 +1,6 @@
>   SUMMARY = "Tools for ethernet bridging"
>   HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>
>   DEPENDS = "sysfsutils"
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> index 66ec7b8..e6b31fe 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "A a package of utilities for doing and managing mounts of the Linux CIFS filesystem."
>   HOMEPAGE = "http://wiki.samba.org/index.php/LinuxCIFS_utils"
> -
> +SECTION = "otherosfs"
>   LICENSE = "GPLv3 & LGPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> index 06c0dd9..093f0d4 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> @@ -1,5 +1,7 @@
>   require cim-schema.inc
>
> +SECTION = "doc"
> +
>   LICENSE = "DMTF"
>
>   SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-Doc.zip \
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema.inc b/meta-networking/recipes-support/cim-schema/cim-schema.inc
> index e35bff6..b9171e4 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema.inc
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema.inc
> @@ -6,4 +6,4 @@ details for integration with other management models. The schema\
>   provides the actual model descriptions."
>
>   HOMEPAGE = "http://www.dmtf.org/"
> -SECTION = "Development/Libraries"
> +SECTION = "libs"
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> index 48f5178..db4c9cd 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "C++ library for client-side URL transfers"
>   HOMEPAGE = "http://code.google.com/p/curlpp/"
> -SECTION = "console/network"
> +SECTION = "libdevel"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> index 1335245..7fec606 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -1,6 +1,6 @@
>   SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
>   HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
> -SECTION = "console/network"
> +SECTION = "net"
>   # GPLv3 was added in version 2.41 as license option
>   LICENSE = "GPLv2 | GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> index 6a50971..ca59bd2 100644
> --- a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> +++ b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> @@ -9,7 +9,7 @@ Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
>   and harvested keys, as well a script to harvest DNSKEY's from DNS. \
>   See also: system-config-dnssec"
>   HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
> -SECTION = "System Environment/Daemons"
> +SECTION = "net"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
>   DEPENDS += "xmlto-native docbook-xml-dtd4-native \
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> index f733a78..44be38d 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Dovecot is an open source IMAP and POP3 email server"
>   DESCRIPTION = "Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-like systems, written with security primarily in mind. Dovecot is an excellent choice for both small and large installations. It's fast, simple to set up, requires no special administration and it uses very little memory."
> -
> +SECTION = "mail"
>   LICENSE = "LGPLv2.1 & MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
>
> diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> index 491f05a..5baffc6 100644
> --- a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> +++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> @@ -4,7 +4,7 @@ DRBD mirrors a block device over the network to another machine.\
>   Think of it as networked raid 1. It is a building block for\
>   setting up high availability (HA) clusters."
>   HOMEPAGE = "http://www.drbd.org/"
> -SECTION = "kernel/userland"
> +SECTION = "admin"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>
> diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> index 917dc8b..163148c 100644
> --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> @@ -4,7 +4,7 @@ with a sendmail-compatible syntax, based on libESMTP and \
>   supporting the AUTH (including the CRAM-MD5 and NTLM SASL \
>   mechanisms) and StartTLS SMTP extensions."
>   HOMEPAGE = "http://esmtp.sourceforge.net/"
> -SECTION = "console/network"
> +SECTION = "net"
>
>   DEPENDS = "libesmtp"
>
> diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> index a45f746..909d7cf 100644
> --- a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> +++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Fetchmail retrieves mail from remote mail servers and forwards it via SMTP"
>   DESCRIPTION = "Fetchmail is a full-featured, robust, well-documented remote-mail retrieval and forwarding utility intended to be used over on-demand TCP/IP links (such as SLIP or PPP connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
> -
> +SECTION = "mail"
>   LICENSE = "GPLv2 & MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fbb509e0303f5ded1cbfc0cc8705f28c"
>
> diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
> index fe88934..1b199d5 100644
> --- a/meta-networking/recipes-support/fping/fping_3.5.bb
> +++ b/meta-networking/recipes-support/fping/fping_3.5.bb
> @@ -8,6 +8,7 @@ replies, fping will send out a ping packet and move on to the next target \
>   in a round-robin fashion."
>   HOMEPAGE = "http://www.fping.org/"
>   SECTION = "console/tools"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=09d77789fe32be35acde9637a5ee39b1"
>
> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> index 1778412..728ad58 100644
> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
> @@ -5,7 +5,7 @@
>   SUMMARY = "GeoIP perl API library to access location database"
>   DESCRIPTION = "perl library for country/city/organization to IP address or hostname mapping"
>   HOMEPAGE = "http://www.maxmind.com/app/ip-location"
> -SECTION = "network"
> +SECTION = "libdevel"
>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>   LIC_FILES_CHKSUM = "file://README;md5=b0fa745303912bd2d64430f7ae69487d"
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> index ab206a0..f1b2aac 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> @@ -6,7 +6,7 @@ countries as values. This database should be more complete and accurate than \
>   using reverse DNS lookups."
>
>   HOMEPAGE = "http://dev.maxmind.com/geoip/"
> -SECTION = "Development/Libraries"
> +SECTION = "libdevel"
>
>   SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
>              http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
> diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> index 851ad41..00f285b 100644
> --- a/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoipupdate_2.1.0.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Crontab entry to provide weekly updates of the GeoIP free databases."
>   DESCRIPTION = "update databases for GeoIP"
>
>   HOMEPAGE = "http://dev.maxmind.com/geoip/"
> -SECTION = "Development"
> +SECTION = "net"
>
>   DEPENDS = "zlib curl"
>
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> index 58dca86..acc0864 100644
> --- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "Configure network interfaces for parallel routing"
>   HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding"
> -SECTION = "network"
> +SECTION = "net"
>
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://ifenslave.c;beginline=8;endline=12;md5=a9f0bd2324cdc1b36d1f44f0e643a62a"
> diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> index cc1f8b0..e60fc8a 100644
> --- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> +++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "iftop does for network usage what top(1) does for CPU usage"
>   HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
> -
> +SECTION = "net"
>   DEPENDS = "libpcap ncurses"
>
>   LICENSE = "GPLv2"
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> index 67b70d0..f4c660a 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "IPsec-Tools is a port of KAME's IPsec utilities to the \
>   Linux-2.6 IPsec implementation."
>   HOMEPAGE = "http://ipsec-tools.sourceforge.net/"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
>
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> index b640a50..7302e9d 100644
> --- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> @@ -9,7 +9,7 @@ methods (NAT, tunneling, and direct routing), and eight load balancing algorithm
>   (round robin, weighted round robin,  least-connec-tion, weighted least-connection, \
>   locality-based  least-connection, locality-based least-connection with replication, \
>   destination-hashing, and source-hashing)."
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=a54cba37b64924aa5008881607942892"
>
> diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> index 8b2b99f..7ddf591 100644
> --- a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> +++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "LibESMTP is a library to manage posting \
>   preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
>   HOMEPAGE = "http://www.stafford.uklinux.net/libesmtp/"
>   LICENSE = "LGPLv2+"
> -SECTION = "libs/network"
> +SECTION = "libs"
>
>   DEPENDS = "openssl"
>
> diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> index 50ef4d6..172443a 100644
> --- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
> +++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> @@ -1,5 +1,6 @@
>   DESCRIPTION = "open source C/C++ client library and tools for the memcached server"
>   DEPENDS = "libevent util-linux"
> +SECTION = "libdevel"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> index 7477349..d3e6a5d 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
>   HOMEPAGE = "http://lksctp.org"
> -SECTION = "libs"
> +SECTION = "net"
>   LICENSE = "LGPLv2.1 & GPLv2"
>
>   LIC_FILES_CHKSUM = " \
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index ca10262..f57df5d 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Utilities for managing the Linux LoWPAN stack"
>   DESCRIPTION = "This is a set of utils to manage the Linux LoWPAN stack. \
>   The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 802.15.4-2006) compatibility."
> -
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> index b97e9d1..a90177f 100644
> --- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> +++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of n
>   HOMEPAGE = "http://www.alobbs.com/macchanger"
>   LICENSE  = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> +SECTION = "net"
>
>   SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
>
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> index 4d93f04..293f8d4 100644
> --- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> +++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> @@ -6,7 +6,7 @@ DESCRIPTION = "\
>    of the specific application. Traditionally this has been used in mod_perl \
>    apps to avoid storing large chunks of data in Apache memory, and to share \
>    this burden across several machines."
> -
> +SECTION = "web"
>   HOMEPAGE = "http://memcached.org/"
>   LICENSE = "BSD-3-Clause"
>
> diff --git a/meta-networking/recipes-support/mtr/mtr_0.86.bb b/meta-networking/recipes-support/mtr/mtr_0.86.bb
> index a60bd34..7b73791 100644
> --- a/meta-networking/recipes-support/mtr/mtr_0.86.bb
> +++ b/meta-networking/recipes-support/mtr/mtr_0.86.bb
> @@ -1,6 +1,7 @@
>   SUMMARY = "Combined traceroute and ping utility"
>   DESCRIPTION = "mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool."
>   HOMEPAGE = "http://www.bitwizard.nl/mtr/"
> +SECTION = "net"
>   DEPENDS = "ncurses"
>
>   LICENSE = "GPLv2"
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> index a0e37e1..bea5e13 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> @@ -1,7 +1,6 @@
> -SECTION = "console/network"
>   DESCRIPTION = "This package includes some useful diagnostics tools for \
>   IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute6."
> -SECTION = "console/network"
> +SECTION = "net"
>   HOMEPAGE = "http://www.remlab.net/ndisc6/"
>   LICENSE = "GPL-2.0"
>
> diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
> index 6c815d9..9cb243d 100644
> --- a/meta-networking/recipes-support/netcat/netcat.inc
> +++ b/meta-networking/recipes-support/netcat/netcat.inc
> @@ -1,4 +1,4 @@
> -SECTION = "console/network"
> +SECTION = "net"
>   inherit update-alternatives gettext
>
>   ALTERNATIVE_${PN} = "nc"
> diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-networking/recipes-support/netcf/gnulib_git.bb
> index 1da6c83..a064502 100644
> --- a/meta-networking/recipes-support/netcf/gnulib_git.bb
> +++ b/meta-networking/recipes-support/netcf/gnulib_git.bb
> @@ -7,7 +7,7 @@ to be copied from gnulib, it is not a library per-se, as much \
>   as a collection of portable idioms to be used in other projects."
>
>   HOMEPAGE = "http://www.gnu.org/software/gnulib/"
> -SECTION = "libs"
> +SECTION = "devel"
>   LICENSE = "LGPLv2+"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e4cf3810f33a067ea7ccd2cd889fed21"
> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
> index 979e45b..0e88b30 100644
> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_git.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "netcf"
>   DESCRIPTION = "netcf is a cross-platform network configuration library."
>   HOMEPAGE = "https://fedorahosted.org/netcf/"
> -SECTION = "console/tools"
> +SECTION = "libs"
>   LICENSE = "LGPLv2.1"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index ffa77d7..d634af4 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "A networking benchmarking tool"
>   DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
> -SECTION = "console/network"
> +SECTION = "net"
>   HOMEPAGE = "http://www.netperf.org/"
>   LICENSE = "netperf"
>   LICENSE_FLAGS = "non-commercial"
> diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
> index eaff949..c4aa10e 100644
> --- a/meta-networking/recipes-support/nis/nis.inc
> +++ b/meta-networking/recipes-support/nis/nis.inc
> @@ -5,7 +5,7 @@
>   # the rpcsvc functionality is not present in uclibc
>   DESCRIPTION = "NIS Server and Tools"
>   HOMEPAGE = "http://www.linux-nis.org/nis/"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> index 693bdbb..7f9ff4a 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> @@ -4,7 +4,7 @@ synchronize the time of a computer client or server to \
>   another server or reference time source, such as a radio \
>   or satellite receiver or modem."
>   HOMEPAGE = "http://support.ntp.org"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "NTP"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f41fedb22dffefcbfafecc85b0f79cfa"
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> index 08f30b5..105e369 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "A full-featured SSL VPN solution via tun device."
>   HOMEPAGE = "http://openvpn.sourceforge.net"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
>   DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> index f032361..ba63be5 100644
> --- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> +++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon."
>   HOMEPAGE = "http://troglobit.com/pimd.html"
> +SECTION = "net"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
>
> diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> index c206cb9..9b6fc2f 100644
> --- a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> +++ b/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Static Multicast Routing Daemon"
>   DESCRIPTION = "SMCRoute is a daemon and command line tool to manipulate the multicast routing table in the UNIX kernel."
>   HOMEPAGE = "http://troglobit.github.io/smcroute.html"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>
> diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> index 0eaa7ca..32caec6 100644
> --- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> +++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "ssmping is a tool for checking whether one can receive SSM from a given host"
>   HOMEPAGE = "http://www.venaas.no/multicast/ssmping/"
> +SECTION = "net"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> index 6b91319..49dcced 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
>   Linux operating system."
>   SUMMARY = "strongSwan is an OpenSource IPsec implementation"
>   HOMEPAGE = "http://www.strongswan.org"
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   DEPENDS = "gmp openssl flex-native flex bison-native"
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> index 1fdaf30..d404f0f 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A sophisticated network protocol analyzer"
>   HOMEPAGE = "http://www.tcpdump.org/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
> -SECTION = "console/network"
> +SECTION = "net"
>   DEPENDS = "libpcap"
>
>   SRC_URI = " \
> diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> index 203d143..b887fc7 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "tcpslice"
>   DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
>   HOMEPAGE = "http://www.tcpdump.org/related.html"
> -SECTION = "console/network"
> +SECTION = "net"
>
>   LICENSE = "BSD-4-Clause"
>   LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa62c64e"
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> index 9ecb695..ccbab9f 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Use previously captured traffic to test network devices"
>
>   HOMEPAGE = "http://tcpreplay.synfin.net/"
> -SECTION = "console/network"
> +SECTION = "net"
>
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> index eda9d5c..7d1c515 100644
> --- a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> @@ -9,7 +9,7 @@ remote files, passive mode support (with fallback to active mode), \
>   SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
>   throttling."
>
> -SECTION = "console/network"
> +SECTION = "net"
>   LICENSE = "BSD-4-Clause"
>
>   DEPENDS = "ncurses"
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> index 7bdbe16..09da1ef 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
> @@ -5,7 +5,7 @@ the IP number and host name (if possible) of the machines along the \
>   route taken by the packets.  Traceroute is used as a network debugging \
>   tool.  If you're having network connectivity problems, traceroute will \
>   show you where the trouble is coming from along the route."
> -SECTION = "console/network"
> +SECTION = "net"
>   HOMEPAGE = "http://traceroute.sourceforge.net/"
>   LICENSE = "GPL-2.0+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> index 6833216..99ff5d0 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "wireshark - a popular network protocol analyzer"
>   HOMEPAGE = "http://www.wireshark.org"
> -SECTION = "network"
> +SECTION = "net"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>
>

