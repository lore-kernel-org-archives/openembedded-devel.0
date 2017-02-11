Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 46F4D772BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 17:34:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 68so2189316pfx.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=J5Kg2WJ2sTZS2pDz888OotI98DDTs8CEgPuMUXPN/5w=;
	b=NSP4cuFIY4+e7PYFNn1eIKmMXH2ByWKI+fyyiCvc1SfnPplm8TMI5a3Q48kEh4Cywo
	oBwG04ukUARVrK533jMrK/3UDDZlnJqgGhFK/UyvGfJVUBRJP1LOZrfN4GxHECnM5qCa
	ZVWI5nzicSKmMAZru13Zk9UZshfKJHcL/dJfuCIUf/ek4pHa0Pbga2xbA/btpzZZnFgM
	icWNUMY15VU3qDxI1Y3hhAsLUtxL++BNKlBWhvUcQ4jBASY7xun79ZtctdKMGPlAyKAL
	yMHPDtWqrMa2lUXiOSYekL4ZH+uznkRKeBg0Wd//pMNST2/3abMDGDzexfqwpHjEjJ1S
	cGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=J5Kg2WJ2sTZS2pDz888OotI98DDTs8CEgPuMUXPN/5w=;
	b=YNBfn5Q6bHCV6eIS3F1Ovbi6Bcs5CBC955Cc2D8bwW/xX8B8s1w3B8XmxJitomNHG9
	hI6P83d5qkurCW4G6OYjReP/4gE+lrzIeFm3Vpvc2yvNW6lvkJgmUxHIczFtbkjy+UJU
	4z4u3SCTRuZ+HtwwaAGz2H/2z0hZkAcY394dp1We+THLWslISLLDEeK9XJIsJRDqI1UI
	K+eS8EUd9X2qcHkPKan3bdNZnq3FSG3TEzdxfCBecyKXkgSJZZGYnV2OPZfp0KOqB26K
	YxYKkdf6UA7OmSyWHWIQZE79tzAEibfojFf0Fp2aRNXzqKUiadRtiCkwUN5AXSrkn95z
	h07A==
X-Gm-Message-State: AMke39kdCjZmN09aPZywr/flYoiwnipHnbAccJg3G4334lc5PGT03biec02LGRld4b9idw==
X-Received: by 10.99.104.133 with SMTP id d127mr17780697pgc.52.1486834475168; 
	Sat, 11 Feb 2017 09:34:35 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id 9sm5813346pfk.121.2017.02.11.09.34.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 09:34:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, akuster@mvista.com,
	joe_macdonald@mentor.com
Date: Sat, 11 Feb 2017 12:34:33 -0500
Message-Id: <20170211173433.10306-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH] fetchmail: update SRC_URI
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
X-List-Received-Date: Sat, 11 Feb 2017 17:34:35 -0000

ERROR: fetchmail-6.3.26-r0 do_checkuri: Fetcher failure for URL: 'http://download.berlios.de/fetchmail/fetchmail-6.3.26.tar.xz'. URL http://download.berlios.de/fetchmail/fetchmail-6.3.26.tar.xz doesn't work
ERROR: fetchmail-6.3.26-r0 do_checkuri: Function failed: do_checkuri
ERROR: Logfile of failure stored in: /home/akuster/oss/maint/poky/build/tmp/work/i586-poky-linux/fetchmail/6.3.26-r0/temp/log.do_checkuri.28438
ERROR: Task (/home/akuster/oss/maint/meta-openembedded/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb:do_checkuri) failed with exit code '1'

per homepage:
NEWS: NOW HOSTED BY SOURCEFORGE.NET AFTER BERLIOS SHUTDOWN

The BerliOS developer's website has shut down in the week following 2014 May 12th, and most of the fetchmail contents have been moved to SourceForge.net, including mailing list subscriptions, archives back to 2004, web site contents, download and Git repository. See http://sourceforge.net/projects/fetchmail/.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
index 909d7cf..359911e 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbb509e0303f5ded1cbfc0cc8705f28c"
 
 DEPENDS = "openssl"
 
-SRC_URI = "http://download.berlios.de/fetchmail/fetchmail-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "61b66faad044afa26e142bb1791aa2b3"
 SRC_URI[sha256sum] = "79b4c54cdbaf02c1a9a691d9948fcb1a77a1591a813e904283a8b614b757e850"
 
-- 
2.9.3


