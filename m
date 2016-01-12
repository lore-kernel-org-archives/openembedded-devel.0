Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8A32973175
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 20:43:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so340167743wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 12:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RMaU+msLf0b3k9VyWSSDqpz66ru/qeOPI815HV8FaLo=;
	b=dXf+wz8EjHo4MvL/hTrsuYQvUMNY9DSg6pR6h9a8djJYwWsPX7LbDM/EgVn6kU/7ys
	VhKFkJ/lm+oqYzOURzfmNrN1kYMoo7kyhu6m0KOcF1II1G+A2gOJPrdbsnikyIfymV2J
	PPsvHggjX5vzMVP+OiSFusPg0OBphsFDflyoGgnApcnC0ChasqKY5cfa4c+fgog/TOTA
	Qp9DZu5PhHr+EdNrPF7/GGqV/uhreimGEhMZiRVsXlTiqsSOP+lr8Fh1GA5XOISNm/ag
	rfOSirdXQ2Z4XNunCq/kn1hbwqR5STEgfuoXnqfmEn5q+EMa2zr4Gm1Ghk+gj+r4pjqb
	fY3w==
X-Received: by 10.28.64.137 with SMTP id n131mr20611660wma.96.1452631399696;
	Tue, 12 Jan 2016 12:43:19 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	i196sm19062860wmf.23.2016.01.12.12.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 12:43:18 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 21:42:42 +0100
Message-Id: <1452631365-11516-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCHv3 0/3] networkmanager: 1.0.6 -> 1.0.10
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
X-List-Received-Date: Tue, 12 Jan 2016 20:43:22 -0000

networkmanager
- update to 1.0.10
- add patches, one of them fixes broken openvpn
- fix pppd rdepend
networkmanager-openvpn: Update to 1.0.8

Adrian Freihofer (2):
  networkmanager: add patches
  networkmanager-openvpn: Update to 1.0.8

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


