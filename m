Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32E0A7D67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:17:16 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d46so16933135eda.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=T+Vx6qdA1/g+s1RqPptkUKUANUiJiUV9e6r80C4Hxto=;
	b=12DWzXqAPSZUGoNxJ7ooxcLsBZiVcRO52zR2aysuFmRZp0vAnqTA351Kmy0g0Vfy3g
	SnNtcNtZXMr9YWSAcIL9VRxATRvTFukGHJg338wP/dqKHUbXngSluJvmNRP5Y/pd091n
	ubsh8vtppQbjMl4WXHs7D+nvT5i3CdAL3xb7Myz3bgIz7+q4cqdc4Y02FPXC1nJGGOiB
	rA+Renu9vto83URKPzU78ePVQ947KwtWT5I2nzEnwwCsxauDFCYpZeXgoZ1n/aijk39E
	hFpv8tgBTSaruk65dVCaSSzrLLCBIR0ftWAhMMZzxDvQmVFUbbSkzNt3IWQ0B2jVMOcq
	vHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T+Vx6qdA1/g+s1RqPptkUKUANUiJiUV9e6r80C4Hxto=;
	b=FZb7rHuHGK/A0Z25nQE8lg7Bbsu1zOVd0Maobr9lRgypA7kZEtkUvo9Nsd4n7qlExj
	AyIBARhsKp5qKsT7bWfGidvtE0LQU2JOcx/9UmD/39Ot3kA1q6yrqJ0hG7ex+Th0jrmU
	Kpi0a2YG8XnbiD/jgPwP1BFEPBkTzx7B7zpAoASRB/d3ySEKIp1KsMo0VmU0MqYAYxeO
	zQA+Z2gTLOjH57hInGM3ff9W7MAqo1O+Fd3irWUZpQkVZ3nhdk/JDW6ORuK+jznZ8Gi5
	sv4Cyc+gwmiG/ZhibvbY3myHSV2TSn33bkxc8VYYMaob4wS3+IeqAKfT6pT3Ef7hamrW
	BI2Q==
X-Gm-Message-State: APjAAAVnsnu/wGhDPh7LBik3IjYsbR/frJ9Nma9QlxDHv+xPIx6D6fwG
	LextcyVgVBWwOrt5mh6mr7/ZhoOaT5Q=
X-Google-Smtp-Source: APXvYqzAGyLaa4SL9dD3wj8bOBdwXCXaJyjqOKRPwf19PkWy58dO2Ju9biILAgFVjJj4WBir7rlqGw==
X-Received: by 2002:a05:6402:169a:: with SMTP id
	a26mr21836899edv.26.1556133437399; 
	Wed, 24 Apr 2019 12:17:17 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x44sm3200132edb.51.2019.04.24.12.17.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:17:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:17:12 +0200
Message-Id: <20190424191712.18267-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] networkmanager-openvpn: update to 1.8.10
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
X-List-Received-Date: Wed, 24 Apr 2019 19:17:17 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ger-openvpn_1.2.10.bb => networkmanager-openvpn_1.8.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.2.10.bb => networkmanager-openvpn_1.8.10.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb
index 9159fcbf6..56db770b9 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb
@@ -10,8 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f118226ed2bfbacfd64ac4d1e0bd0383"
-SRC_URI[sha256sum] = "ac86a7a539d78df90095676e9183f2d422fb93dbfe4b3afef22f81825d303d61"
+SRC_URI[md5sum] = "4dbbc103761facc7a61a1c00dfd55231"
+SRC_URI[sha256sum] = "af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.17.1


