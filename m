Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB257719C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:31 +0000 (UTC)
Received: by wmww144 with SMTP id w144so173218988wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=58sBrzVzSbXqJ5kizBbrfpraHq8vSqfZ6qOMevHVZnY=;
	b=N1QAF0BAAmsDT7/7v7BMidef4IC6mI8Hq+BOptz2QL8dnXkvulkBTtBBiWMCaEyfyJ
	fRa87a+bV0Lu+tcM4MCSoYMJNEpPTiDi25NfaBs4drpYaD+hAjeF4eivEk/aBuOwbhg9
	k5/ja5DTvym3gQUyAAUU5khKxcCZPVdSBuBKQpEE0mYH4DXZuh5/iBgBNUdzzGB7Flli
	I1asvwavm/4TZl6xxCbqOkQ5qEBQH4dwb+1dUx0rxQuCQ3t3378alu+DLA0lciCtAOM7
	W44ri/cP+CAlTi/8L9FbiGRBuh0mv7+gxpBxnTgpM3ro7GQrKv0ar6s6s6X9liyGvWi4
	s+LA==
X-Received: by 10.28.0.149 with SMTP id 143mr9388072wma.103.1447271310802;
	Wed, 11 Nov 2015 11:48:30 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:30 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:03 +0100
Message-Id: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH V2 00/17] network/modemmanager updates
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:33 -0000

Adrian Freihofer (17):
  libqmi: update to 1.12.6
  modemmanager: Update to 1.4.12
  modemmanager: Add PACKAGECONFIGs
  modemmanager: add dbus config
  modemmanager: Start always
  networkmanager: Update to 1.0.6
  networkmanager: support gnutls and nss
  networkmanager: add fedora bugfix patches
  networkmanager: Add package for nmtui
  networkmanager: run dispatcher
  networkmanager: PACKAGECONFIG for ifupdown netconfig
  networkmanager: PACKAGECONFIG for dhclient
  networkmanager: PACKAGECONFIG for dnsmasq
  networkmanager: PACKAGECONFIG for wifi
  networkmanager: package for adsl plugin
  networkmanager: use bluetooth from distro
  networkmanager: add openvpn plugin

 .../libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb}  |   4 +-
 .../modemmanager/modemmanager_1.4.12.bb            |  53 +++++++
 .../modemmanager/modemmanager_1.4.2.bb             |  40 -----
 .../networkmanager/networkmanager-openvpn_1.0.6.bb |  32 ++++
 .../0002-add-pkg-config-for-libgcrypt.patch        |  41 ++++++
 ...ix-parse-commandline-options-into-correct.patch |  35 +++++
 ...-vpn-connection-fix-unsetting-the-gateway.patch |  30 ++++
 ...tion-set-the-MTU-for-the-VPN-IP-interface.patch |  54 +++++++
 ...t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch |  33 +++++
 .../0007-nmcli-crash-vlan-priorities.patch         |  35 +++++
 .../0008-nmtui-fix-crash-in-secret-agent.patch     |  88 +++++++++++
 .../rh1175446-vpn-secondaries-connections.patch    |  57 ++++++++
 .../rh1261428-ipv6-ignore-auto-dns.patch           |  37 +++++
 .../rh1263185-nmcli-con-add-generic.patch          |  44 ++++++
 .../rh1263959-modem-supported-ip-families.patch    |  62 ++++++++
 .../rh1264676-fix-crash-on-device-removal.patch    |  80 ++++++++++
 .../rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch  |  46 ++++++
 ...rh1266003-fix-crash-on-bss-proxy-acquired.patch |  48 ++++++
 .../rh1272974-fix-s390-ctc-detection.patch         |  57 ++++++++
 .../rh1277693-vpn-service-timer.patch              | 161 +++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.4.bb         |  90 ------------
 .../networkmanager/networkmanager_1.0.6.bb         | 141 ++++++++++++++++++
 22 files changed, 1136 insertions(+), 132 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb} (80%)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-config-bugfix-parse-commandline-options-into-correct.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-vpn-connection-fix-unsetting-the-gateway.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0007-nmcli-crash-vlan-priorities.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0008-nmtui-fix-crash-in-secret-agent.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1175446-vpn-secondaries-connections.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1261428-ipv6-ignore-auto-dns.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263185-nmcli-con-add-generic.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263959-modem-supported-ip-families.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1264676-fix-crash-on-device-removal.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1266003-fix-crash-on-bss-proxy-acquired.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1272974-fix-s390-ctc-detection.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1277693-vpn-service-timer.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb

-- 
2.4.3


