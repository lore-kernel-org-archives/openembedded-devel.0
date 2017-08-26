Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEA277F70
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 07:19:28 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y65so512000pfd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 00:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gNcr+UScw1Q+ZuZQKcwv8befzSUa+JgPncOz9xXE/aI=;
	b=JgyQmRetUK0iHoCMQ2qZ7reCEF4V5URUBAQ9n+jmwV9MQyL8HkLlAMhEKpiiFYCSxP
	1iK9VZFhUtQtg9vf79bbVV4Hlw5kVRU29qtGRsZlBWuGM+kstK9Cfu66OhQr1/s7uchJ
	7rORiSiC4N2yy4RDywES6Dow1Cf0xZ9zTeu8a7mD5gON5mG7A1+lrzYNrm8Ust/4rZaI
	0svsFPEstySm27tOV4HE+K1F4ZRQJt67QvSRG3zLMZe4cwsH7zH8fXdXyvbE2AyLgOjL
	tNTixDe8KVX5OW1RCiK6iDa4EZer+/YrgqlPD6LOeVubhbVDf90FqkBQGo4K1Xs7ttL/
	QeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gNcr+UScw1Q+ZuZQKcwv8befzSUa+JgPncOz9xXE/aI=;
	b=NZwis3HZHUjtghb9GL8WABgBKlRSzhgWzRA0EuUETrodoei4wxzhq1nXMBpwCQLpa2
	FCqUbLWV7SGs+ffkTHTotPnPSaOusUFDNoWzMWHhMzjmw6zCF/MItLpJBPSip5DDyvRX
	EqEKqrZd1RKaqOOoqBfgi0RY/qln+MRxSm0NLHUj0EN1y+7ZmAw44Xf/dlK7miE5yV3w
	EJchPfdmsquLaT17DIWfTRHeGuWi9/5Q4UNWvPoK/i+78DoiR56tWCiwL+kxl4wc0hsY
	jo9hSXIGp0awJo6G2hKBAeyCoJ+dQ+rn7M2y9Srv79mTaUwfSm9W/rHRDmeBrgYzLfd5
	Pv4w==
X-Gm-Message-State: AHYfb5jaB5r4Ku7o76daZpWy5IMEW8HbJNfAXNQJP2rlSmJHDiWlZ+PV
	NVoAoIXXnoePrMrj
X-Received: by 10.98.43.213 with SMTP id r204mr993105pfr.0.1503731969627;
	Sat, 26 Aug 2017 00:19:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	q3sm14384511pgf.69.2017.08.26.00.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 00:19:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 00:19:21 -0700
Message-Id: <20170826071921.1565-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH] wireguard: Upgrade to 20170810 snapshot
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
X-List-Received-Date: Sat, 26 Aug 2017 07:19:28 -0000

Fixes build with linux kernel 4.12+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...guard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} | 0
 ...reguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc               | 5 ++---
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 9e38c57ff..f37d52b22 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,8 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "e9969ebbdf525fcbe91a513db8a5c864"
-SRC_URI[sha256sum] = "7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908"
+SRC_URI[md5sum] = "8dd3e080407b8295c25565a847a4ca27"
+SRC_URI[sha256sum] = "ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.14.1


