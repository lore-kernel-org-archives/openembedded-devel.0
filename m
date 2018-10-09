Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3A99751D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:58:39 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f18-v6so979696plr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jXasg2fiPt6KyxgiRqnR+OTcPdoERo8D/JA2m0pJxlE=;
	b=dxbkxrlfYemovedmr+yc/MzsM0PNyqq8SRArFveTPhlmyr+C+tdiZ5NJtnAlE7VyHF
	0knmAweOZliqzPJYhiRhrD2RHwMHr/oWyHCzQx4NKFUsFGBm8oY2EB4LPwShxFYeYIRh
	SUn6LB6UfUpuhNNBtl26DJFdlBcbAq87irKjPfI3xSX3VUusIdt/ratoGtaOAz+8hMMz
	pBK+2uUUV6OyQq8by/Y8vu3F9PcaGGBexW1MYwQNF24wEAXpfxXDgKq36XxFV6+HKBNy
	B9btM0iKJWBcTvCsjEx93tTknV6Uc3Rmsgnu78sZFc3UtlFv5UMH807XRfPbNrKd150+
	f/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jXasg2fiPt6KyxgiRqnR+OTcPdoERo8D/JA2m0pJxlE=;
	b=SWw0QTxe2kFzrHfTz+EzLrO8jWnvsOEwwvObs3Z/MmUMP+kUh0Ju+bpFFgLiNN9V6m
	HWdQYF6A31PKZ8gDl7LnNhgy0Jv+xvGYNVJVKxvu29NL/SV6XPFJjVP5UuTVMAKNFcll
	YsZ68wqT8vFo+Ay+5z1YX/0u/t1/FuJbzQqS7ULPff/KbzgnYH5CRtLI0HkXtcVqkqli
	QrvDJ0f+SX1ETHNzTWzuSs8tZ12WsWS3LpJDx5HFoUqUqXpFtXQcXbFWVQPnbrER4y7u
	zckK0ng+PKSrKfMXNMaKYAyuFKprrX4OCCpOxW8tl5oAFtEpCr+viKcVJ6Y0uaz/wDxm
	6UHg==
X-Gm-Message-State: ABuFfog/dYmiMO5ipfgpKtWQCU2g6hu8SjdjzH0Xo4R64wyNLUdwtKPO
	cSvRk1mZjU7+iAR8XIZtDwQ=
X-Google-Smtp-Source: ACcGV61ugFVeCjx/M4HExybDZq18XYIFcv07fiYx03PiefzCEdVYOVeO4S4ZcR/5i8ioRO/fS47oKA==
X-Received: by 2002:a17:902:b907:: with SMTP id
	bf7-v6mr19260387plb.259.1539097120736; 
	Tue, 09 Oct 2018 07:58:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:488d:f898:e690:f18b])
	by smtp.gmail.com with ESMTPSA id
	r25-v6sm23169945pgm.59.2018.10.09.07.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Oct 2018 07:58:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 07:58:38 -0700
Message-Id: <1539097118-23856-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] openvpn: update to 2.4.6
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
X-List-Received-Date: Tue, 09 Oct 2018 14:58:39 -0000

LIC_FILES_CHKSUM changed do to "Update copyright to include 2018 plus company name change"
includes: CVE-2018-9336

see: https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/openvpn/{openvpn_2.4.4.bb => openvpn_2.4.6.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.4.bb => openvpn_2.4.6.bb} (93%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
similarity index 93%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
index a839ab7..84fd467 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9b64491ec98eb6c6493ac5e4118f107"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7aee596ed2deefe3e8a861e24292abba"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "705a79d005558d94fa1e2b74e4413e97"
-SRC_URI[sha256sum] = "1ae883d9522c9fa6d189e5e4aaa058a93edd3d0b897e3c2664107c4785099fc3"
+SRC_URI[md5sum] = "971d57e29b78b4b902eb2f4aae2f05a7"
+SRC_URI[sha256sum] = "738dbd37fcf8eb9382c53628db22258c41ba9550165519d9200e8bebaef4cbe2"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4


