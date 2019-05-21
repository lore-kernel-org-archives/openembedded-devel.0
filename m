Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 413AB7E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:02 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id z28so8335951pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2P1a/71a4MiBjSbHf6lR9QNTaKahs8/wTeWUSqP/aVE=;
	b=EfcY47DUXrv7EZm5DSBJ0H6IIAZGv1lnQ00mp0ePVQfkFI0QdOWvf8w/nJ0vQ1O356
	sqtAQemArxWHapwogDNoc6qTwJLuBeeHKOhkWkdMsaHmNNAbHCxxKkcIknD0NJRgIbVr
	OFQ6bHu2V+j3SjHwoDo+UkpePYEuHRwAAvmam+dFcnnomQd0+jSPpQRuU+IjSIN7dF4g
	QWIlI3shDCic1UcPBgi6r66i5BwF/6NOHo9k4SvfFYN9tsdxTSRfqIIIjcK6LucUxKMq
	yeq+D/W5oXOCb/4p7TqcD27DVSWDTQFaveUd+5v5cQUapb0qB7ZpDaDwxdUAJJ5ItudV
	iBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2P1a/71a4MiBjSbHf6lR9QNTaKahs8/wTeWUSqP/aVE=;
	b=fxrayewIkLo8k5u5VUbrbDNlK1T8LqFM2lix0/ZMQiZYZ0MkHaDtWsXPgUx7Hua6FU
	PcT3s125+7ZVVj1+Jbsff5chRZzHlAsQxpN2LODqFcI8CMa12xwWKapven+SwUIqcIjH
	xPEOcE7SDm5rX2LcQpcPj9thtk99zcGZpq+8hdrLzt4BJets6HX0O58xRCUURBa0ompJ
	Fv81cZWrytx4WwDYBKGpVuFxF1fg4KuJvhYaEhJ/WMIngQ8l4k6wWbD91FU/DBqvIW5u
	ljoAYCpLmWEamkaOn/czHjWbqxYMcP+OV/uGanZIheJDbSM2aP9qEqpih460J+u1V6Kt
	+B6A==
X-Gm-Message-State: APjAAAWfVh469ve4FO6318Uu/g0fAceb5CFpmK1NRiWkX7L3Ji+NDcmo
	MtHKjSFcLP4W0vtWTvRMoCeeSuN6
X-Google-Smtp-Source: APXvYqzehnnRD/TKSrrPuzFOBxpHAmv2XGv9XUT8Uq+Pwrxtxnt0bXUsaHQRtSV6HltOPLsWT003Gw==
X-Received: by 2002:a63:2248:: with SMTP id t8mr35958805pgm.358.1558411023376; 
	Mon, 20 May 2019 20:57:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:31 -0700
Message-Id: <8ed452ec4f7baf03256bb1811a717594a5d673bb.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 31/34] openvpn: update to 2.4.7
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
X-List-Received-Date: Tue, 21 May 2019 03:57:02 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb} (94%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
similarity index 94%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
index 84fd467..2a4eb25 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A full-featured SSL VPN solution via tun device."
-HOMEPAGE = "http://openvpn.sourceforge.net"
+HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aee596ed2deefe3e8a861e24292abba"
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "971d57e29b78b4b902eb2f4aae2f05a7"
-SRC_URI[sha256sum] = "738dbd37fcf8eb9382c53628db22258c41ba9550165519d9200e8bebaef4cbe2"
+SRC_URI[md5sum] = "9d67cabc9b0441062ebd4e12bb7dfedb"
+SRC_URI[sha256sum] = "73dce542ed3d6f0553674f49025dfbdff18348eb8a25e6215135d686b165423c"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4


