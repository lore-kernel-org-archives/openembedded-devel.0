Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1841D736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:49:59 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so29557586wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UOkM4l3q8AIIMPHEq7c2nBtHiRlYAx1F6H7EdMskusE=;
	b=oCnDpuTNj0dZCmgO43xZXHbgk37Lb6jxNBu7Um4xvzJ5BDhcJQNJaSOsZyzGVSJfZ/
	QmoBxpOLutU7HFQ48vS/zwp05np/w9psU65oW0oKCuZUNtl7yEkJQ+U02tvzPTSymHLw
	CaxINrx/OsZ0EN5EaAswGGvJBtCmNnB+z/cqnfuzf2RhJb47K2fOUNw2p5knwpjCv2GB
	0gJwWSJuw1wpmehOj+a9qxWSNEfooNfxHqbxuAJcfwxfBJ0Pzd7I5zIUZMlWYFDSblYU
	KELd/QxL44RuPNz0Av5XreiiOGvcf1rlPE3Ue8wLKoxOSonxGSLlDs7+UmHYyw49fqX+
	lxig==
X-Received: by 10.28.55.209 with SMTP id e200mr32793599wma.79.1447192199768;
	Tue, 10 Nov 2015 13:49:59 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.49.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:49:58 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:07 +0100
Message-Id: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH 00/17] network/modemmanager updates
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:01 -0000

Update networkmanager and modemmanager to latest upstream version
Add fedora patches
Add PACKAGECONFIGs to support smaller images: ~17MB in total, ~13MB for gnutls
(The default configuration is not changed by the new PACKAGECONFIGs.)
Add networkmanager plugin for openvpn.
Provide package for nmtui.

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
  networkmanager: PACKAGECONFIG for adsl
  networkmanager: use bluetooth from distro
  networkmanager: add openvpn plugin

 .../libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb}  |   4 +-
 .../modemmanager/modemmanager_1.4.12.bb            |  53 +++++++
 .../modemmanager/modemmanager_1.4.2.bb             |  40 -----
 .../networkmanager/networkmanager-openvpn_1.0.6.bb |  43 ++++++
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
 22 files changed, 1147 insertions(+), 132 deletions(-)
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


