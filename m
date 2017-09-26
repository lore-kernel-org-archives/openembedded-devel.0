Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 523BB65C5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:33:21 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s132so11191726qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=Rq/PaVPnM52fWRSrJ7AkmXKndJHzcVfveyRByaktwTY=;
	b=lVEPGd2W8FYzPjGJVn3L2ad5yE814BMJAaOaGz75gKEP2YurBzzcl142O85dZHBXdj
	vLRwKxe6xDYAO0vUyRembkKMT3VCGxQBs6wsLB1ZYC+J7wojyo6uk+kdYCt0nyFA4ee0
	Wu4zMolB6yTNtOQX9Xhk/Mk2LzvhQ8/C6RG3ZcCyfJE2Xc6FOJmHOejRgEhoUoIvWA3A
	hH4PRwu614GnIpV6RFjYjvXwv4qf5yw784FciDBHk7OySy7AYe8jnGz/uxRBjLECJhDb
	kPNCIUsMu0LJSfOzgBLw+ukhum/HB2fRk5xi77eL8sYOX1JexVB9jsAeVDA0D2WOXPP9
	FtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Rq/PaVPnM52fWRSrJ7AkmXKndJHzcVfveyRByaktwTY=;
	b=jT+/45zyGelf0gNALlLB8Wb72bSnT40PFbSMUINpAdYxwt3vEpUspOgpiyGDAZPbJo
	av3aTahSX8IsY6FxYJibnIBTt6fS3x1LglQZrNKN+IT8Q0Jt0L/Q5L2EmINWrUaz6qVG
	4uxbCPJTGmiqzEYNLQh425dBY3jAwkMFymAFT14Yr69Unflox0PrXDn7Z15GLikge2rF
	kjfkO0Q8ZYQ30KjTj33386OGxcwVFlhgEbWNxbI1Q51WXVIcmEyvkI/Yfsjc26xBivBY
	PE8TGiTkRc8Ii2zdyxphGI+vZTfomRSZIfQHGQxIRQYoB4+3zFHMys1RGzPExhfP5zmw
	EIFw==
X-Gm-Message-State: AHPjjUisDxvBZalQh9vGbV20okgpnr5p4gTsb8xwA1w7ZiHCqAVQJxMg
	kNQtmX5O2dm6e931BCrSEYNnS4RY
X-Google-Smtp-Source: AOwi7QDqk8Uy1NV1xCblgo9CZj2exIUqzpODV3YNDrIZAJSdaHRT/Qq/f3snF7okOdm0UlpKMp2yFQ==
X-Received: by 10.55.48.210 with SMTP id w201mr16486865qkw.117.1506454402949; 
	Tue, 26 Sep 2017 12:33:22 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u51sm7523111qth.67.2017.09.26.12.33.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 12:33:21 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Sep 2017 15:48:22 -0300
Message-Id: <20170926184822.32480-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH] lldpd: Update to version 0.9.8
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
X-List-Received-Date: Tue, 26 Sep 2017 19:33:22 -0000

  - Remove json packageconfig. See commit:
  https://github.com/vincentbernat/lldpd/commit/06987a24ce053cbb57f8853bbf544bc7c067c8aa

  - Add patch to use mkdir from /bin/mkdir in systemd service.

  - Update from lldpd (0.9.8)
  * Changes:
    + "Station" capability is only set if no other bit is set.
    + Use ethtool to get permanent address for bonds and teams. This
      might provide different results than the previous method. Some
      devices may still use the previous method.
    + Don't run ethtool as root. Kernels older than 2.6.19 won't get
      link information anymore.
    + Add "configure system hostname ." option to not use a FQDN
      for system name.
    + Add "-f json0" to provide a more regular/machine-parsable output
      to JSON output, even when not compiled with --enable-json0.
  * Fixes:
    + Handle team interfaces like a bond. Real MAC address cannot be
      retrieved yet.

  - Updates from lldpd (0.9.7)
  * Changes:
    + Attach remote TTL to port instead of chassis.
    + JSON support is now built-in and unconditionally enabled. Use
      --enable-json0 to keep the pre-0.9.2 json-c format.
    + When logging to syslog and daemonizing, don't log to stderr.
    + vxlan interfaces are now ignored as they are multi-point interfaces.
    + Maximum number of neighbors for an interface is increased from 4 to 32.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...lldpd.service.in-Use-fixed-path-for-mkdir.patch | 32 ++++++++++++++++++++++
 .../lldpd/{lldpd_0.9.6.bb => lldpd_0.9.8.bb}       |  6 ++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.6.bb => lldpd_0.9.8.bb} (91%)

diff --git a/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch b/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
new file mode 100644
index 000000000..4876e1794
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
@@ -0,0 +1,32 @@
+From f9f3e4dd31588cce5f655730da7b5c3f56a9bdc1 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Tue, 26 Sep 2017 09:19:51 -0300
+Subject: [PATCH] src/daemon/lldpd.service.in: Use fixed path for mkdir command
+Organization: O.S. Systems Software LTDA.
+
+@mkdir_p@ is expanded to host tools path ../build/tmp/hosttools/mkdir that
+doesn't exist on target. Remove @mkdir_p@ and use /bin/mkdir -p to
+create /var/run/lldpd directory.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/daemon/lldpd.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/lldpd.service.in b/src/daemon/lldpd.service.in
+index fdb7338..4291830 100644
+--- a/src/daemon/lldpd.service.in
++++ b/src/daemon/lldpd.service.in
+@@ -9,7 +9,7 @@ Type=notify
+ NotifyAccess=main
+ EnvironmentFile=-/etc/default/lldpd
+ EnvironmentFile=-/etc/sysconfig/lldpd
+-ExecStartPre=@mkdir_p@ @PRIVSEP_CHROOT@
++ExecStartPre=/bin/mkdir -p @PRIVSEP_CHROOT@
+ ExecStart=@sbindir@/lldpd $DAEMON_ARGS $LLDPD_OPTIONS
+ Restart=on-failure
+ PrivateTmp=yes
+-- 
+2.14.2
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
similarity index 91%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
index 0cd063720..dbd84cf67 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
@@ -9,10 +9,11 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
+    file://src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch \
     "
 
-SRC_URI[md5sum] = "0dcdee7c1b3c62362d73f6508c11edae"
-SRC_URI[sha256sum] = "e74e2dd7e2a233ca1ff385c925ddae2a916d302819d1433741407d2f8fb0ddd8"
+SRC_URI[md5sum] = "8809600492f6b73149eb19158e819c1f"
+SRC_URI[sha256sum] = "9ee494e91bc33938575b2c09b26188c486ef8eac6e2155d250c189cc4e988c4f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
@@ -29,7 +30,6 @@ EXTRA_OECONF += "--without-embedded-libevent \
 "
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
-PACKAGECONFIG[json] = "--with-json,--without-json,jansson"
 PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxm2"
 PACKAGECONFIG[snmp] = "--with-snmp,--without-snmp,net-snmp"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
2.14.1


