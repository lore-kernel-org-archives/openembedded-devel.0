Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7016C149
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 10:19:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id v11so4115074plg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JjL8M12//EzQqzSq+y7tf38xi+7kG8YPeCuzitucl70=;
	b=Xub/vDnOyjBAQRZIuDhwL9uYQTelHmTW/kgJLrLJ/r0gJge9yQGv4K91FbFxPyazCm
	fS3dCAXd3vukoTjwDmfA07x5VFEOfssZPSA5D15mmvzNB5Uo2mkFsXfKYuUnP6Ab1nLu
	P8PpCw5sUxf2mCUawUXdi02/7HfSnUqWaGsqTjDO/Tzqnab+4n7CWERLWTyKYOeM1H/N
	cOYGmPE6nwzYYMC4oexSl+dVYJAKMNS1cuPAAMUVzxbtxiWfog1vT138PcJs2BFGlY8j
	5ebj0iIKeJAO8dpvvLcPBQJnRqdWcFBEYXcEEWL68YprsWjHkRv+ah8ZVjHYddMj8XM+
	U8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JjL8M12//EzQqzSq+y7tf38xi+7kG8YPeCuzitucl70=;
	b=VzygeyseHOzPQM6ReSEpDaqjYMEG1bdVPgmDLmRwJuVFrzmiRANSWdp8ZzDxXJJ2Ej
	q+ub+GfkqKeijDArjQzcEma9T+iwiuBaqXhE6VPr44HFqrKZ4EJCRkJX4x1/yj6mU0du
	Td5xAdjuyNCWLwr4kulB3MTSC0DxJtAK7hGM17eVx1jhWJ0lLMwknBsCfwnyEMN9wyOn
	68aposC+T10KXbRyP9hLbbxp6UAVjjD3fNzAeWpMK09ugjKzk4tKxzA1tcs2GxRc4TKD
	ccEOiKyU8Eye4YNwdAIc+TcWzDVmQEhMyNlA0dCIcNPH+/Rnt0H2AHG3107EO2nH0pet
	zNQQ==
X-Gm-Message-State: AHQUAuYg+pE3z6+x+4GCJAGiYc0c67iAZDzpjuebr5a0jW9ZGCvAP5N4
	x2CzYtI5/gacytTZwakhd6ohNN+Xc5c=
X-Google-Smtp-Source: AHgI3IbmE3mybE5Bb/8szhGjGKLPtsD+PfE+Sq30ih9k804Pjf7g7xIlWtCQjobTESMyqqj5lDZlRA==
X-Received: by 2002:a17:902:ab8e:: with SMTP id
	f14mr7141475plr.84.1551349170044; 
	Thu, 28 Feb 2019 02:19:30 -0800 (PST)
Received: from localhost.localdomain ([128.242.105.20])
	by smtp.gmail.com with ESMTPSA id
	s79sm10222034pfa.61.2019.02.28.02.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Feb 2019 02:19:29 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2019 10:19:24 +0000
Message-Id: <1551349164-20937-1-git-send-email-tuanha@viosoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-openwrt][PATCH] odhcpd: Fix strncpy bounds in gcc-8
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
X-List-Received-Date: Thu, 28 Feb 2019 10:19:29 -0000

Backport from git://git.openwrt.org/project/odhcpd.git
Commit 4983ee551a743e55bb2f2ec12ceab0ddba13eb2d

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 .../odhcpd/0001-odhcpd-fix-strncpy-bounds.patch    | 51 ++++++++++++++++++++++
 recipes-core/odhcpd/odhcpd_git.bb                  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-core/odhcpd/odhcpd/0001-odhcpd-fix-strncpy-bounds.patch

diff --git a/recipes-core/odhcpd/odhcpd/0001-odhcpd-fix-strncpy-bounds.patch b/recipes-core/odhcpd/odhcpd/0001-odhcpd-fix-strncpy-bounds.patch
new file mode 100644
index 0000000..2438d64
--- /dev/null
+++ b/recipes-core/odhcpd/odhcpd/0001-odhcpd-fix-strncpy-bounds.patch
@@ -0,0 +1,51 @@
+From 4983ee551a743e55bb2f2ec12ceab0ddba13eb2d Mon Sep 17 00:00:00 2001
+From: Hans Dedecker <dedeckeh@gmail.com>
+Date: Thu, 3 May 2018 17:21:15 +0200
+Subject: [PATCH] odhcpd: fix strncpy bounds
+
+Fix strncpy bounds as reported by Coverity in CID 1412278 and 1412293
+
+Signed-off-by: Hans Dedecker <dedeckeh@gmail.com>
+---
+ src/dhcpv4.c | 6 ++++--
+ src/odhcpd.c | 4 +++-
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/dhcpv4.c b/src/dhcpv4.c
+index db5f138..35a3ad0 100644
+--- a/src/dhcpv4.c
++++ b/src/dhcpv4.c
+@@ -779,8 +779,10 @@ static void handle_dhcpv4(void *addr, void *data, size_t len,
+ 		}
+ 	}
+ 
+-	struct ifreq ifr = {.ifr_name = ""};
+-	strncpy(ifr.ifr_name, iface->ifname, sizeof(ifr.ifr_name));
++	struct ifreq ifr;
++
++	memset(&ifr, 0, sizeof(ifr));
++	strncpy(ifr.ifr_name, iface->ifname, sizeof(ifr.ifr_name) - 1);
+ 
+ 	if (!ioctl(sock, SIOCGIFMTU, &ifr)) {
+ 		uint16_t mtu = htons(ifr.ifr_mtu);
+diff --git a/src/odhcpd.c b/src/odhcpd.c
+index 71b803d..8aa4571 100644
+--- a/src/odhcpd.c
++++ b/src/odhcpd.c
+@@ -143,10 +143,12 @@ int odhcpd_get_interface_config(const char *ifname, const char *what)
+ int odhcpd_get_mac(const struct interface *iface, uint8_t mac[6])
+ {
+ 	struct ifreq ifr;
++
+ 	memset(&ifr, 0, sizeof(ifr));
+-	strncpy(ifr.ifr_name, iface->ifname, sizeof(ifr.ifr_name));
++	strncpy(ifr.ifr_name, iface->ifname, sizeof(ifr.ifr_name) - 1);
+ 	if (ioctl(ioctl_sock, SIOCGIFHWADDR, &ifr) < 0)
+ 		return -1;
++
+ 	memcpy(mac, ifr.ifr_hwaddr.sa_data, 6);
+ 	return 0;
+ }
+-- 
+2.7.4
+
diff --git a/recipes-core/odhcpd/odhcpd_git.bb b/recipes-core/odhcpd/odhcpd_git.bb
index 745ee6f..e220bda 100644
--- a/recipes-core/odhcpd/odhcpd_git.bb
+++ b/recipes-core/odhcpd/odhcpd_git.bb
@@ -13,6 +13,7 @@ FILESEXTRAPATHS_prepend = "${THIDIR}/${PN}:"
 SRC_URI = "\
     git://git.openwrt.org/project/odhcpd.git;name=odhcpd \
     file://0100-OE-build-fails-due-to-libnl-tiny-dependency-in-CMakeLists.patch \
+    file://0001-odhcpd-fix-strncpy-bounds.patch \
 "
 
 SRCREV_odhcpd = "750e457e3000187b85906814a2529ede24775325"
-- 
2.7.4


