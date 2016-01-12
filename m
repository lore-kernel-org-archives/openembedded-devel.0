Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA8960132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:10:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so311467620wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BlH6GBoyj8TsoSHErwPZeizf4f7UH4Rb0ZgWXMEAsXs=;
	b=larAaWlBvCGmbIQPowjQBIQHoK5Rw+ewPTPNfZVuVbCS5R5WR7urrtO2deiwZBj2l2
	xrqdvcm+uPUl78/mfepGA6Dtq5Ckunxomj8cJupM259cm7jZau5CEtKnqUmd9MJba7Un
	UqponRcF+a3yjFNxuTXGFigVAdS5vBAmQMKyWjHQhJ/Vp1sHfAN2gkiQE+kBIzgPma/A
	DhdQbVxTtwlDlBzETZNFNtjp/0Mp+XuCa8fHbyD5/7sLivM+0naFA0xv7/YjXfz+g6de
	ZViRgq1eTixfkLCxouzL1czW9pVMrZRY36UBK3pG2P5sq7ZNr6JCtgZph9rU/PFsRAON
	DRsg==
X-Received: by 10.28.19.76 with SMTP id 73mr19611823wmt.24.1452593403064;
	Tue, 12 Jan 2016 02:10:03 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	k130sm3090286wmg.6.2016.01.12.02.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 02:10:02 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:09:51 +0100
Message-Id: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCHv2 0/4] networkmanager 1.0.6 -> 1.0.10
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
X-List-Received-Date: Tue, 12 Jan 2016 10:10:04 -0000

networkmanager: update to 1.0.10
networkmanager: add patches, one of them fixes broken openvpn
networkmanager-openvpn: Update to 1.0.8
networkmanager: fix ppp rdepend

Adrian Freihofer (3):
  networkmanager: add patches
  networkmanager-openvpn: Update to 1.0.8
  networkmanager: fix ppp rdepend

Dai Caiyun (1):
  networkmanager: 1.0.6 -> 1.0.10

 .../networkmanager/networkmanager-openvpn_1.0.6.bb |  31 ------
 .../networkmanager/networkmanager-openvpn_1.0.8.bb |  31 ++++++
 ...ilure-to-configure-routes-due-to-wrong-de.patch |  54 ++++++++++
 ...-clear-ppp_watch_id-upon-pppd-termination.patch |  29 +++++
 ...date-ip_iface-only-if-IP-interface-exists.patch |  45 ++++++++
 .../networkmanager/networkmanager_1.0.10.bb        | 120 +++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.6.bb         | 117 --------------------
 7 files changed, 279 insertions(+), 148 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb

-- 
2.5.0


