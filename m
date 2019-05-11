Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id D41037E0BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 11:37:23 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 14so7195341ljj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=F8QMU7MUYOAan6zt3HZO/HSlucq7DrRcvPLuLPwAvXo=;
	b=YrZhuKEjhj7dNlIlULyXLy/Y9HMQCPDpjhEyHJFO2oLhcB+TPiy0zZVFN0BTrZsHiJ
	S3I2Rn2RAcSrB3Z9WJ1QSJbqHx4JkYA2rGDYxFpWTlZVzQBBusKI7SRrO9CJo/mmLHVR
	UYa+rkzpBRV165KCN+DDsyiVKfxAhszWXyWB8SvTyFN7YCbS03vsuNeDzicajtG+lci5
	tW90cqhjJQNx6yc7pZAZ+gpHHg69JiG34ofMMgWsZ15m0n3UaxBCq3FRiW96ehvSUrAh
	jCtUlyG4MBq3wXHAyofUrmXlFgTTGeeBp1plgFA5oujHbB830YhTuXG0zLG9+Zm3J5w5
	FgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F8QMU7MUYOAan6zt3HZO/HSlucq7DrRcvPLuLPwAvXo=;
	b=m2fz0NgulQN3+DHIqZyPOqjlUnN/vKBDaFMfl7jreHlvq+vQyzXqjockOf18BHdDHU
	+aYw82BlWNzDDebqh4ijuUfT38OsWDku5yc+kYAUCzhuIsxZPMrpBlLbFh07qJok8agf
	u1BCat4aKeGqg8Yi2wktzYHlhRaN1UMU6mE76ZBSrDS4pytQr3Vtz6VpopMhssA/4R+g
	jw3M3MqNLPEPUYyq3ZrpDwP9RV9N5fHsqdLScqfafgo0t09+nbP9ZkcdFdCDmx4az+D6
	CdJbhv52NEL2x3sfPjwT1ghIXzQGSZkIrlgEYLct9PNS06TbJb9lvx7zIkpyHQVtzgLi
	HKCQ==
X-Gm-Message-State: APjAAAUc0T840SjlSwGruAQ1X3VSH8vry2GO/KGYmgt5eNqeFhSF6OC6
	GYnV7Pm+Bqo2yPtapoQlH/97vijj0S8=
X-Google-Smtp-Source: APXvYqzOycefbDuV/zxaYWAlJW6xlR1VvB4x/W9GfLAbdmETSYXSnLbmaZChjxmzg3o6Z3B7n2XRVw==
X-Received: by 2002:a2e:1654:: with SMTP id 20mr8450568ljw.53.1557574643917;
	Sat, 11 May 2019 04:37:23 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id f9sm2031211ljf.69.2019.05.11.04.37.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 May 2019 04:37:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 May 2019 13:37:17 +0200
Message-Id: <20190511113717.8634-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] openvpn: update to 2.4.7
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
X-List-Received-Date: Sat, 11 May 2019 11:37:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.6.bb => openvpn_2.4.7.bb} (94%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
similarity index 94%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.7.bb
index 84fd467c7..2a4eb2528 100644
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
2.17.1


