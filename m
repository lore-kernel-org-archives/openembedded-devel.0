Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E772D60138
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 05:26:54 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so38927552pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=27GHQsFYbzi1zoI7aWZrBwFwCuRnGpd+wXBjFGPncRk=;
	b=IsKuEjNywIOtNast5bG9pXFQxjHTLkwP+z7u5D6bD4wrrNJ6OAMd0oB0ADf1XnXgZ/
	ji8GM/jwmaqlL7CSSh5yfBkzhAEp7/QoKktuKhdN6w+nu37wr3On/VNDQd0k65t/4m+C
	73kYEhj2NRYLKfpftmZP9v8nXe1uecxXQ17l85AHYLT2CX+7rFJBbIIxzaFYaMVNJTGx
	1HwF3NTzOIsRgfw945H1dhuaf73aPk9nddmniDcsCjPdFFtJgfEehCFlC7YjCl79mow3
	zsIU94zNep/M9hosfqHXHRz/pegoiHxEP6vvlTxmTBRie+sCCGTwBCl99uAketFSSs8k
	1WVw==
X-Received: by 10.68.210.46 with SMTP id mr14mr34218737pbc.73.1431494815461;
	Tue, 12 May 2015 22:26:55 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:7c79:332d:8dea:73b5?
	([2601:c:a700:3ba7:7c79:332d:8dea:73b5])
	by mx.google.com with ESMTPSA id
	mx5sm17915398pdb.75.2015.05.12.22.26.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 22:26:54 -0700 (PDT)
Message-ID: <5552E09A.10603@gmail.com>
Date: Tue, 12 May 2015 22:26:50 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1431376904.git.joe_macdonald@mentor.com>
In-Reply-To: <cover.1431376904.git.joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH 0/1][RFC] Standardize SECTION values
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
X-List-Received-Date: Wed, 13 May 2015 05:26:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2015 01:59 PM, Joe MacDonald wrote:
> As I mentioned back in January[1], I've taken a pass through the recipes in
> meta-networking with the goal of unifying the usage of the SECTION variables.
> At the time I was tending toward the Fedora / RH approach (eg. console/network)
> but I've instead gone with the Debian conventions because I think they actually
> lead to less confusion when you get into edge cases like 'wireshark' where the
> main usage is via the GUI but we build the command-line-only tools as well, but
> it's always a 'network' tool, regardless of how you use it.

Oh sure. pick on Wireshark ; )
>
> I'm calling this an RFC since I expect it'll generate some discussion and while
> I was working through this it did occur to me that maybe the right thing is to
> ditch SECTION variables entirely since they obviously aren't providing a lot of
> value today, but I think being consistent with their usage may actually cause
> them to be more than just cosmetic.

SECTION seems to be used in the various packaging classes.

- armin
>
>     1.  http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099669.html
>
> The following changes since commit c0cb9ac6a71b0cca54ddfe38d2867c30c61c1e9c:
>
>    meta-networking: standardize SECTION values (2015-05-11 16:22:56 -0400)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib joeythesaint/master
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=master
>
> Joe MacDonald (1):
>    meta-networking: standardize SECTION values
>
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

