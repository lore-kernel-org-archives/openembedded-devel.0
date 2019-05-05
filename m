Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 909B27CBE3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 May 2019 09:17:49 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h21so8564749ljk.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 May 2019 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=O/f1FmF9Ctj0zoDHKAKHU6qn8cpfwcRFLkFO5mfYy4s=;
	b=b6uRGjaRN1WV4ILxCRwYgKQwQWuQbkWRF3Fs59hBpY3jkMdAHsAGQmLtdupieLzX1i
	vvDESYbI0Y2Z9S2i5Cvqf8GGfe47WuSVsHJ1boYV3jXC2Cc40AW2GmN3FF8OS545THGW
	KfAu1hNYmAk9PRH5ImXjjBSn3nHokO7CxfqUKJBXCqC95WBy6TLEO/VEWI1P5+IGUDLd
	xJH/paVQohQRWWgzZWSo7NnxawX+1eQ+VLRjJieVH14F0KyFLsZZkHJTPWfSfTpmdWSO
	6rutMsdqwcdJyJ4uA1Je/qcXiWVw6/z3DRLl/glCFMTbXJ1ALM18f8nx6uVtFMPGJwOx
	8fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O/f1FmF9Ctj0zoDHKAKHU6qn8cpfwcRFLkFO5mfYy4s=;
	b=q00cF0y8X0srETFhFM0af4Any7rg/CkPLxZZPrJz4HaL3IW71iAeJEVtI/eLnFwtZS
	3hcPZnZ9CtAU6rDcLIyqLJ1tHNYRgV3DgDJq6hN9aGwmJ98X0e6QjuY8xeU3IFOy3FFu
	DKfbYMf+Yf7L3I8akM1JTDMMT/Irqp0TPD5XYPSTYr4ldCpaWYaCwKoim6OTcy4Vy3Di
	sMhelSXfBFpj41Ga6M8aDTgDLJ2t3ymPNiF/9T5FY2xryMpKke/t70bkueR2Nu1eDZPs
	G4LIipJgOuha9x5DZlM41oiDwGalCa935RwH6PvJf/74l3asYgbni/hIp4ifXwjQ8zHs
	C++g==
X-Gm-Message-State: APjAAAUpLGJwkpa0QKdFNiWA9OkN2jD6WNYikRxzYeycNknHT0KchU49
	x3eS0Ee+2qGy4I/rMqxn1SPs9SF6C2U=
X-Google-Smtp-Source: APXvYqzu8ZqnJzEz49lzWHzLXdK61PiK6HzfsKp2LY6NurC9N+g2IZYVT9CrD+KmzQHi6Ada7Z7g9A==
X-Received: by 2002:a2e:d1a:: with SMTP id 26mr10349391ljn.147.1557047869843; 
	Sun, 05 May 2019 02:17:49 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	g20sm1023589lja.67.2019.05.05.02.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 02:17:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 May 2019 11:15:21 +0200
Message-Id: <20190505091521.6598-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] arno-iptables-firewall: update to 2.0.3
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
X-List-Received-Date: Sun, 05 May 2019 09:17:49 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...irewall_2.0.1g.bb => arno-iptables-firewall_2.0.3.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.0.1g.bb => arno-iptables-firewall_2.0.3.bb} (86%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
similarity index 86%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
index 6fd0affdf..040c53f5c 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
@@ -4,12 +4,11 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRC_URI = "http://rocky.eld.leidenuniv.nl/arno-iptables-firewall/${BPN}_${PV}.tar.gz \
-          "
-SRC_URI[md5sum] = "77eba7f148bf2840a3e35a6f50c9c353"
-SRC_URI[sha256sum] = "0bafd85ddc235752250eaec0c7fdb21e530912483f6807a97f86158ed2d301f7"
+SRC_URI = "https://github.com/arno-iptables-firewall/aif/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "71271c08299aacd45ceb9c9400082d03"
+SRC_URI[sha256sum] = "e2c4fb88a25f0cae8308a3b2bb922b5e2f52f24d8309b24e15a527a6b326e703"
 
-S = "${WORKDIR}/${BPN}_${PV}"
+S = "${WORKDIR}/aif-${PV}"
 
 inherit systemd
 
-- 
2.17.1


