Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73F4E64016
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 06:30:02 +0000 (UTC)
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25536.1775341964920319759
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2026 15:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=NQUcjTHC;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.2, mailfrom: jeroen@myspectrum.nl)
Received: from submission7.mail.transip.nl (unknown [10.103.8.158])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4fp9MZ3MvPzwPS3;
	Sun,  5 Apr 2026 00:32:42 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission7.mail.transip.nl (Postfix) with ESMTPSA id 4fp9MY6zscz3fqYsP;
	Sun,  5 Apr 2026 00:32:41 +0200 (CEST)
Received: from yellow.myspectrum.nl (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id C65F3200BB;
	Sat,  4 Apr 2026 22:32:38 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sun, 05 Apr 2026 00:32:37 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [meta-networking][PATCH] python3-pyroute2: add missing rdepend of python3-unittest
Date: Sun,  5 Apr 2026 00:32:16 +0200
Message-ID: <20260404223217.127368-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission7.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1775341962; h=from:subject:to:cc:date:
 mime-version; bh=9UDxlRHbuFRRSdU91NC3Th5S0syYQzB4SFG2ggDnHLY=;
 b=NQUcjTHCtdLgr49B5YAYMb2eHxabUBF6V0U++U3CdFmmTukFJT2UnWkpGReOwcA9rzVVd5
 CHgY+/LKw+V20nirHgbmVyZOzEuuo7U2BQKrBayG0m3rkTQBteglOudlY7CRtmQuhOzK+K
 MXtyXytpTHkorzlowZ+a4f04R4yDtTlKoWVKDKsJuqbUNFuQaQ0jklkZMzhbnqris9i/oO
 hTdDQTZTPV20NFYe5zLWXOs/b3Tb+rbGzl0JMP5JQ69mB9Ux2CpxSB6bJpu92oYjoWSWxL
 dIriXi5tPs00ZRRsq1b/WFyBz7kMGD0fx8QC4I7aJVouMKJYDtlfA4KfujkyKw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 06:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125999

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Without it, it will throw "ModuleNotFoundError: No module named
'unittest'" from pyroute2/netlink/rtnl/iprsocket.py" line 6.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.b=
b b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
index 8005d1275b..d5c95cf546 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.5.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} +=3D " \
     python3-pkgutil \
     python3-pprint \
     python3-shell \
+    python3-unittest \
     python3-unixadmin \
 "
=20
--=20
2.43.0


