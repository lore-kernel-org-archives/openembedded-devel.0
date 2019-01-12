Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2F37C056
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:38 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b7so8561495pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TbzUhV9jwPgK/B/v/N5jpuuzpe9anQnLCNqlZf8qCv8=;
	b=kQI/hP9M0kp5OCYVzEnvqim1u3YR/2EbsqppZbDBFUKNrpkoXAQHSbTot/KJOaZjtQ
	08fakXtxrF9zv7r87CwWx5mSKxmuAoOLxaDFWTIphxdqXCKahmJQYc6qSnKWMJ2rXhZv
	WFNgEail0o9EhGzust9BfR1BTxASrUDetOpwwC/eHWQJs1gASGwGLxSHHjNTAe+gvCWD
	MEbyeWFCnCgEZcroMQkApDKDcw/zVx8KVGiKwMZ+nh265+4bRzax4/1CanHd1y4MObu9
	y6g5WTrtweeDLE0VbsFapaAJea71erDrje/0iTtIFMHWQr6cZKZD6TF++l5AB9MD/EZl
	9pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TbzUhV9jwPgK/B/v/N5jpuuzpe9anQnLCNqlZf8qCv8=;
	b=JK13n2izbph6Ms2CEux1qxdJRw0I4DDMLFt575XIpvD45GCFmEbxCceI7omCgQ2Be2
	rnXSRU6L7UZXS8dRsFXUR1JproK7GJOTraWBptNw2xXRySp7Itv2E1JHxQYHiG213+rf
	alLs/uLKJUKpMo8ugHJ0fbaccF7gHbqqo03c2gQMvmMKygnrzs0Sy/7aHORf4Z779f+u
	7FtfQ3prbWEQY3bcIKicvRqjUHyJ/ZDn6dWI43YNnQM6Y/iZYyz0H+FiYbF4VjE35fFU
	seWZybwykaqCA6sXPrWvnTpn0fnCuQISP6DHZRRzfhPjZ8qVuQKSXdfIPRQiXp2E8UlE
	B0PQ==
X-Gm-Message-State: AJcUukexdr/8cWJ3mKcrJ5Cl9vYZ4GGGAWm3Fghn2T0CDaijQTaXn4FW
	a7Rxoj69Adnawyi/FPtDaMI=
X-Google-Smtp-Source: ALg8bN5PRl42Tw9dKo4d3t7P5NsACtuEKiYbZ7+8cEDoXxmTjjmLDRY2j3NRu03sYngUnoqJIr86VQ==
X-Received: by 2002:a62:7f93:: with SMTP id a141mr19887157pfd.96.1547328699616;
	Sat, 12 Jan 2019 13:31:39 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:30 -0800
Message-Id: <20190112213132.2501-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 7/9] meta-networking: add pkg group and images
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-networking-image-base.bb      |   7 +
 .../images/meta-networking-image.bb           |   3 +
 .../packagegroup-meta-networking.bb           | 122 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta-networking/recipes-core/images/meta-networking-image-base.bb
 create mode 100644 meta-networking/recipes-core/images/meta-networking-image.bb
 create mode 100644 meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb

diff --git a/meta-networking/recipes-core/images/meta-networking-image-base.bb b/meta-networking/recipes-core/images/meta-networking-image-base.bb
new file mode 100644
index 0000000000..eaf1409537
--- /dev/null
+++ b/meta-networking/recipes-core/images/meta-networking-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-networking build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-networking/recipes-core/images/meta-networking-image.bb b/meta-networking/recipes-core/images/meta-networking-image.bb
new file mode 100644
index 0000000000..f4c7401b35
--- /dev/null
+++ b/meta-networking/recipes-core/images/meta-networking-image.bb
@@ -0,0 +1,3 @@
+require  meta-networking-image-base.bb
+
+IMAGE_INSTALL += "packagegroup-meta-networking"
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
new file mode 100644
index 0000000000..63ad34cb83
--- /dev/null
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -0,0 +1,122 @@
+SUMMARY = "Meta-networking packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-networking \
+    packagegroup-meta-networking-connectivity \
+    packagegroup-meta-networking-daemons  \
+    packagegroup-meta-networking-devtools \
+    packagegroup-meta-networking-extended \
+    packagegroup-meta-networking-filter \
+    packagegroup-meta-networking-irc \
+    packagegroup-meta-networking-kernel \
+    packagegroup-meta-networking-netkit \
+    packagegroup-meta-networking-protocols \
+    packagegroup-meta-networking-support \
+'
+
+RDEPENDS_packagegroup-meta-networking = "\
+    packagegroup-meta-networking-connectivity \
+    packagegroup-meta-networking-daemons  \
+    packagegroup-meta-networking-devtools \
+    packagegroup-meta-networking-extended \
+    packagegroup-meta-networking-filter \
+    packagegroup-meta-networking-irc \
+    packagegroup-meta-networking-kernel \
+    packagegroup-meta-networking-netkit \
+    packagegroup-meta-networking-protocols \
+    packagegroup-meta-networking-support \
+    "
+
+RDEPENDS_packagegroup-meta-networking-connectivity = "\
+    openconnect ez-ipupdate mosquitto sethdlc crda \
+    dibbler-server dibbler-client dibbler-requestor dibbler-relay \
+    libdnet ufw civetweb freeradius kea daq \
+    mbedtls relayd snort dhcpcd rdate vlan umip vpnc \
+    inetutils wolfssl lftp miniupnpd networkmanager \
+    networkmanager-openvpn rdist nanomsg python-networkmanager \
+    wireless-regdb \
+    ${@bb.utils.contains("DISTRO_FEATURE", "bluez5 x11", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "samba", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-networking-daemons = "\
+    ippool radvd autofs keepalived proftpd openhpi lldpd \
+    ptpd igmpproxy opensaf squid \
+    atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
+    pure-ftpd vblade tftp-hpa ncftp \
+    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "networkd-dispatcher", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-networking-devtools = "\
+    python-ldap grpc \
+    "
+
+RDEPENDS_packagegroup-meta-networking-extended = "\
+    corosync \
+    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "dlm", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-networking-filter = "\
+    ebtables conntrack-tools libnetfilter-queue \
+    libnetfilter-conntrack libnetfilter-cthelper libnetfilter-acct \
+    libnetfilter-cttimeout libnetfilter-log nfacct \
+    arno-iptables-firewall libnftnl nftables \
+    libnfnetlink \
+    " 
+
+RDEPENDS_packagegroup-meta-networking-irc = "\
+    znc \
+    "
+
+RDEPENDS_packagegroup-meta-networking-kernel = "\
+    wireguard-module wireguard-tools \
+    "
+
+RDEPENDS_packagegroup-meta-networking-netkit = "\
+    netkit-rwho-client netkit-rwho-server netkit-rsh-client netkit-rsh-server \
+    netkit-telnet netkit-tftp-client netkit-tftp-server \
+    netkit-ftp netkit-rusers-client netkit-rusers-server netkit-rpc \
+    "
+
+RDEPENDS_packagegroup-meta-networking-protocols = "\
+    tsocks freediameter xl2tpd babeld mdns net-snmp \
+    quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
+    radiusclient-ng openl2tp usrsctp \
+    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "dante", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-networking-support = "\
+    ncp ndisc6 mtr tinyproxy ssmping ntp \
+    wpan-tools bridge-utils ifenslave celt051 pimd \
+    nbd-client nbd-server nbd-trdump \
+    phytool fwknop htpdate tcpreplay ipsec-tools \
+    traceroute geoip-perl geoip geoipupdate esmtp \
+    libtdb netcf dnsmasq curlpp openipmi drbd-utils \
+    drbd tunctl dovecot ipvsadm stunnel chrony spice-protocol \
+    usbredir ntop wireshark tnftp lksctp-tools \
+    cim-schema-docs cim-schema-final cim-schema-exper \
+    libmemcached smcroute libtevent ipcalc c-ares uftp \
+    ntimed linux-atm ssmtp openvpn lowpan-tools rdma-core \
+    iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
+    netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
+    arptables macchanger nghttp2 strongswan fping \
+    dnssec-conf libesmtp cifs-utils open-isns \
+    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "libldb", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
+    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
+    "
+
+
+RDEPENDS_packagegroup-meta-networking-support_remove_mipsarch = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_mips64 = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_mips64el = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_powerpc = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_riscv64 = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_riscv32 = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_armv5 = "spice-protocol"
+RDEPENDS_packagegroup-meta-networking-support_remove_aarch64 = "spice-protocol memcached"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


