Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1D57B7F4D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 19:41:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n4so5426705pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/aqJcJcxFWkWucmpUU3pQrVc8dkiwjQlECVV2QS81O4=;
	b=eWf0MP0FFf/YD8bRdR/Xk+XrFF+8DGTfuOMXdV1AMN1i7xxtwfp0wW2Hze551dr9Zw
	x0lSggAmJLCFJkBvffeEMephXiYUlSokNLBVg2jwZV5/kuMlvQRQTRDBP41uq4D6za7O
	oKquuVaSzuKHWsOo6LLt1n5BQznCJ+GbHPmwp7HvCalOPu1VaSL6aYlnacjn5tWRwRvq
	AFP2UDvBHDLhrQy1hlBbMn1fn4D92qUqJJzIBRPnUyw0MV+DAvEbHeATtHC9oiwERxOX
	a4uRtVbnJYl3Fz6L5rvolw+ieFCKLCkWdceUjpLIZrARceVUlKuGcpm7rkPYSwU60tYT
	RSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/aqJcJcxFWkWucmpUU3pQrVc8dkiwjQlECVV2QS81O4=;
	b=Zqhn4Q9pEfpQSK34JSwisIqNWZzelvoM1wR/wYAT1x6JSzKPFVel3nzfJmPNXCSuKm
	zObXX0cMyDLWHwvqj0HIXjBLZEUUruznZpBkTrOk63VKMwRjQZ2YzXrW9ZUETaBCgj8c
	1SIYk8fXwxwTsSYIt5i67Nn52RxPOFt7WHNtR8jbmn0g0hF1+zCFIoLBRySLoErx5hte
	Zwj2YG2x3u813CfrwNO8DNh9pkLbOQ50npt0gdRQJLw/PK93Oz+uc7TNzw7j4Y3+s6H4
	DW0hhq0E7vv9eBhz6sLligrG9flcp+M/Bahp+nXjpV1cNfgtzHWj+nrCG/Hl4n0ZNbbP
	jagQ==
X-Gm-Message-State: APjAAAWXdEk1zlMuJYBP1Oq+AY6YxxwjAA4ZsnNwqNG63MY+IMqqH5V6
	zofvDFsvXUsQQqhxe0LitxbWcpZosyY=
X-Google-Smtp-Source: APXvYqwHxQPhnhZYYnMuxlEtI/NfStzdac90dbPxjGw9jr70ZjvhbiX1wdP3hmj8MeAaTdX4N/hy2A==
X-Received: by 2002:a17:90a:3acf:: with SMTP id
	b73mr16005626pjc.88.1567885314727; 
	Sat, 07 Sep 2019 12:41:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id j1sm9364631pgl.12.2019.09.07.12.41.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 12:41:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 12:41:44 -0700
Message-Id: <20190907194145.35720-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 1/2] drbd, netkit-rusers: Blacklist packages
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
X-List-Received-Date: Sat, 07 Sep 2019 19:41:55 -0000
Content-Transfer-Encoding: 8bit

These fail to build always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also drop from packagegroups

 .../packagegroups/packagegroup-meta-networking.bb             | 4 ++--
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb        | 1 +
 meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb         | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 29ce51b232..f511d729e3 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -78,7 +78,7 @@ RDEPENDS_packagegroup-meta-networking-kernel = "\
 RDEPENDS_packagegroup-meta-networking-netkit = "\
     netkit-rwho-client netkit-rwho-server netkit-rsh-client netkit-rsh-server \
     netkit-telnet netkit-tftp-client netkit-tftp-server \
-    netkit-ftp netkit-rusers-client netkit-rusers-server netkit-rpc \
+    netkit-ftp netkit-rpc \
     "
 
 RDEPENDS_packagegroup-meta-networking-protocols = "\
@@ -95,7 +95,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     phytool fwknop htpdate tcpreplay \
     traceroute geoip-perl geoip geoipupdate esmtp \
     libtdb netcf dnsmasq curlpp openipmi drbd-utils \
-    drbd tunctl dovecot ipvsadm stunnel chrony spice-protocol \
+    tunctl dovecot ipvsadm stunnel chrony spice-protocol \
     usbredir ntop wireshark tnftp lksctp-tools \
     cim-schema-docs cim-schema-final cim-schema-exper \
     libmemcached smcroute libtevent ipcalc c-ares uftp \
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 716794f447..ba1ad3f7f3 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -69,3 +69,4 @@ RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"
 
 # http://errors.yoctoproject.org/Errors/Details/186962/
 COMPATIBLE_HOST_libc-musl = 'null'
+PNBLACKLIST[netkit-rusers] = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
index 6683781af5..23fe2021be 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
@@ -21,3 +21,5 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
+
+PNBLACKLIST[drbd] = "Kernel module Needs forward porting to kernel 5.2+"
-- 
2.23.0


