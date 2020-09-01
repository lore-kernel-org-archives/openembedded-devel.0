Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.8333.1598999778783282032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=goXFF5Ko;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id o68so1688421pfg.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTTGhsJ0SceGtlu5ZPRSlD4J4/I1WK/qfSLdQBVE0Lw=;
        b=goXFF5Ko83eked3S3EWH3q1nCakG+bTDpAsn3r/Gh8jCSu2D7UkgXc7JMVSy/LC8qZ
         DfvqCN/C+qUa19AtL91w/eKbrveQJlmo3PtKhweFFRs5+tV4yQuF6kk/9OWSZ3g6f5kE
         tHfwQllJheTgqHCELBAmGxQuOZnPUs/cgdWcWkWD6Qmn7Fm7G015fhx1kYqyCmZ5+lCQ
         1If6Z3jAuRO3Wsdu7yTWs3PB50FOBMxMpF5czaYVlOCAd0pQ50rJBIltwITW+WoDRVE2
         irpBQZ/Ph8iiY/+TQzOXYFHqwTBTQgqLC4RPGEt/LVHlgviKjvtQr6VFhF/feNCBNdYw
         lKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTTGhsJ0SceGtlu5ZPRSlD4J4/I1WK/qfSLdQBVE0Lw=;
        b=R8XcigmpWQw2DeA3OjKsFfSLbepGTK3jBQAugSVPYEqso5S91oL1JSCDRqq9Jkx/yq
         PF4y+vNDcgHELkTXV5TWIyvIAQWiyrjmDtRPM0rC7M8SWtnxTCpWMTWuDEwaV0GXzzyH
         GJcrd+SE669FjonMAZFZg6A69ma6Gl596N3g9i+tX91a4wuaeW7ngGIy52xpd92jkABR
         hvAwH6xMlrsOv1Qr4MWrmcm0AQhA47F5h5XufQuUUBLa9AYjAqRcFL6xSIoZN5dzKtj2
         6BdlBR11ffvBTmxRWI7aITQHuh1n31+ldMQMNONPIwp6CPAHKEcXa/ewLISWckCkUOjV
         lmqw==
X-Gm-Message-State: AOAM530vgQ//B2aGdyC+0f53QDQaAqpd3YqbUorf/gMUqplFTOunUjhV
	MMyTRidrwLNq/J5M7GsyxMWsuHNEm9Zkvw==
X-Google-Smtp-Source: ABdhPJzh/k1Y1/nXNyTHE/SyAIYuovs4CwJIlYnUjL9Yl3JoOtxYjlgexTKhaaw+awhatwB7xGjp6Q==
X-Received: by 2002:a63:354:: with SMTP id 81mr3473392pgd.216.1598999776351;
        Tue, 01 Sep 2020 15:36:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/10] packagegroup-meta-networking: Add new packages
Date: Tue,  1 Sep 2020 15:36:04 -0700
Message-Id: <20200901223612.1386026-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize to have one package per line

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-networking.bb           | 244 ++++++++++++++----
 1 file changed, 188 insertions(+), 56 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index f36143fdaa..1034ad9786 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -31,101 +31,233 @@ RDEPENDS_packagegroup-meta-networking = "\
     "
 
 RDEPENDS_packagegroup-meta-networking-connectivity = "\
-    openconnect ez-ipupdate mosquitto sethdlc crda \
-    dibbler-server dibbler-client dibbler-requestor dibbler-relay \
-    libdnet ufw civetweb freeradius kea daq \
-    mbedtls relayd snort dhcpcd rdate vlan vpnc \
-    inetutils wolfssl lftp miniupnpd networkmanager \
-    networkmanager-openvpn rdist nanomsg python3-networkmanager \
+    crda \
+    daq \
+    adcli \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
+    cannelloni \
+    civetweb \
+    dhcpcd \
+    libdnet \
+    dibbler-client \
+    dibbler-relay \
+    dibbler-server \
+    kea \
+    relayd \
+    lftp \
+    sethdlc \
+    snort \
+    ufw \
+    vlan \
+    vpnc \
+    ez-ipupdate \
+    firewalld \
+    freeradius \
+    mbedtls \
+    miniupnpd \
+    mosquitto \
+    nanomsg \
+    nng \
+    netplan \
+    networkmanager-openvpn \
+    networkmanager \
+    openconnect \
+    python3-networkmanager \
+    rdate \
+    rdist \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
-    "
+    wolfssl \
+    autossh \
+    bearssl \
+"
 
 RDEPENDS_packagegroup-meta-networking-connectivity_remove_libc-musl = "rdist"
 
 RDEPENDS_packagegroup-meta-networking-daemons = "\
-    ippool radvd autofs keepalived proftpd openhpi lldpd \
-    ptpd igmpproxy opensaf squid \
-    atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
-    pure-ftpd vblade tftp-hpa ncftp \
+    atftp \
+    autofs \
+    cyrus-sasl \
+    ippool \
+    iscsi-initiator-utils \
+    lldpd \
+    ncftp \
+    igmpproxy \
+    postfix \
+    proftpd \
+    ptpd \
+    pure-ftpd \
+    radvd \
+    squid \
+    tftp-hpa \
+    tftp-hpa-server \
+    vblade \
+    vsftpd \
+    keepalived \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispatcher", "", d)} \
-    "
+    openhpi \
+    opensaf \
+"
 
 RDEPENDS_packagegroup-meta-networking-daemons_remove_libc-musl = "opensaf"
 
 RDEPENDS_packagegroup-meta-networking-devtools = "\
     python3-ldap \
-    "
+"
 
 RDEPENDS_packagegroup-meta-networking-extended = "\
     corosync \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dlm", "", d)} \
-    "
+    kronosnet \
+"
 
 RDEPENDS_packagegroup-meta-networking-filter = "\
-    ebtables conntrack-tools libnetfilter-queue \
-    libnetfilter-conntrack libnetfilter-cthelper libnetfilter-acct \
-    libnetfilter-cttimeout libnetfilter-log nfacct \
-    arno-iptables-firewall libnftnl nftables \
+    libnftnl \
+    conntrack-tools \
+    ebtables \
+    libnetfilter-acct \
+    libnetfilter-conntrack \
+    libnetfilter-cthelper \
+    libnetfilter-cttimeout \
+    libnetfilter-log \
+    libnetfilter-queue \
     libnfnetlink \
-    " 
+    arno-iptables-firewall \
+    nfacct \
+    nftables \
+"
 
 RDEPENDS_packagegroup-meta-networking-irc = "\
+    weechat \
     znc \
-    "
+"
 
 RDEPENDS_packagegroup-meta-networking-kernel = "\
     wireguard-tools \
-    "
+"
 
 RDEPENDS_packagegroup-meta-networking-netkit = "\
-    netkit-rwho-client netkit-rwho-server netkit-rsh-client netkit-rsh-server \
-    netkit-telnet netkit-tftp-client netkit-tftp-server \
-    netkit-ftp netkit-rpc \
+    netkit-rwho-client \
+    netkit-rwho-server \
+    netkit-rsh-client \
+    netkit-rsh-server \
+    netkit-telnet \
+    netkit-tftp-client \
+    netkit-tftp-server \
+    netkit-ftp \
+    netkit-rpc \
     "
 
 RDEPENDS_packagegroup-meta-networking-netkit_remove_libc-musl = " \
     netkit-rsh-client netkit-rsh-server netkit-telnet"
 
 RDEPENDS_packagegroup-meta-networking-protocols = "\
-    tsocks freediameter xl2tpd babeld mdns net-snmp \
-    quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
-    radiusclient-ng openl2tp usrsctp \
+    babeld \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
-    "
+    freediameter \
+    net-snmp \
+    openflow \
+    openflow \
+    openl2tp \
+    mdns \
+    nopoll \
+    quagga \
+    radiusclient-ng \
+    tsocks \
+    openlldp \
+    zeroconf \
+    pptp-linux \
+    rp-pppoe \
+    usrsctp \
+    xl2tpd \
+"
 
 RDEPENDS_packagegroup-meta-networking-protocols_remove_libc-musl = "mdns"
 
 RDEPENDS_packagegroup-meta-networking-support = "\
-    ncp ndisc6 mtr tinyproxy ssmping ntp \
-    wpan-tools bridge-utils ifenslave celt051 pimd \
-    nbd-client nbd-server nbd-trdump \
-    phytool fwknop htpdate tcpreplay \
-    traceroute geoip-perl geoip geoipupdate esmtp \
-    libtdb netcf dnsmasq curlpp openipmi drbd-utils \
-    tunctl dovecot ipvsadm stunnel chrony spice-protocol \
-    usbredir ntop wireshark tnftp lksctp-tools \
-    cim-schema-docs cim-schema-final cim-schema-exper \
-    libmemcached smcroute libtevent ipcalc uftp \
-    ntimed linux-atm ssmtp openvpn rdma-core \
-    iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
-    netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
-    arptables macchanger nghttp2 strongswan fping \
-    libesmtp cifs-utils open-isns \
+    aoetools \
+    arptables \
+    bridge-utils \
+    celt051 \
+    cim-schema-docs \
+    cim-schema-final \
+    cifs-utils \
+    dnsmasq \
+    curlpp \
+    drbd-utils \
+    dovecot \
+    fping \
+    esmtp \
+    fetchmail \
+    geoip-perl \
+    geoip \
+    geoipupdate \
+    fwknop \
+    htpdate \
+    iftop \
+    ifmetric \
+    ipvsadm \
+    libesmtp \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
+    libmemcached \
+    libtalloc \
+    ipcalc \
+    libtevent \
+    linux-atm \
+    lksctp-tools \
+    memcached \
+    ifenslave \
+    netcat \
+    netcat-openbsd \
+    libtdb \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
-    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
-    "
-
-
-RDEPENDS_packagegroup-meta-networking-support_remove_mipsarch = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_mips64 = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_mips64el = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_powerpc = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_riscv64 = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_riscv32 = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_armv5 = "spice-protocol"
-RDEPENDS_packagegroup-meta-networking-support_remove_aarch64 = "spice-protocol memcached"
+    yp-tools \
+    ypbind-mt \
+    yp-tools \
+    mtr \
+    ntp ntpdate sntp ntpdc ntpq ntp-tickadj ntp-utils \
+    nbd-client \
+    nbd-server \
+    nbd-trdump \
+    openvpn \
+    macchanger \
+    nbdkit \
+    ssmping \
+    libowfat \
+    ncp \
+    strongswan \
+    ndisc6 \
+    tcpdump \
+    tcpslice \
+    netcf \
+    nghttp2 \
+    tnftp \
+    traceroute \
+    tunctl \
+    wireshark \
+    ntop \
+    nuttcp \
+    nvmetcli \
+    open-isns \
+    openipmi \
+    phytool \
+    pimd \
+    ruli \
+    smcroute \
+    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice-protocol spice", "", d)} \
+    usbredir \
+    ssmtp \
+    stunnel \
+    rdma-core \
+    tcpreplay \
+    tinyproxy \
+    uftp \
+    unbound \
+    wpan-tools \
+    ettercap \
+"
+RDEPENDS_packagegroup-meta-networking-support_remove_mipsarch = "memcached"
 
 EXCLUDE_FROM_WORLD = "1"
+# Empty packages, only devel headers and libs
+# nngpp
+# Use ntp and not chrony or ntimed
-- 
2.28.0

