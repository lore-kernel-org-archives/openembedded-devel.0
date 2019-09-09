Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 02D3E79980
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 20:43:56 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q5so10035878pfg.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2019 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w/zYYl4bv3xMf9n45JyFuxuH/xD0FiDt98jNSy2DNdM=;
	b=NVd+f2/tcGKZ+uiOj70yiFCAZR/pzyMgCOiHDAekl5YmldZHU9swHQLUzEjwVc0V2g
	UFlTBRD2VzV/fxSOFgy+l8rtp55m8BbTNGcrJQ++Np1nIaHUeUxwDwB/kKrT5rLILl6t
	f56S6pcuYvl6o/DE2d4+rgztfOfpc4ZpKzap1lOxtz3Vj4aK67bPUhUeAYR1eRgWt9nh
	3lPZWgl0nrfdUiWul0iYKgcu3cX4gh+FPx2kGKVcQOU6k8ADe/Z24BdDk48LA1qo+2Fs
	B16dJp7wiR4DO8CEZcJGOjPfduzWGxy45pPPVVB0GyicqgPECZGgDFxV7C7UmRU8HVpp
	9QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w/zYYl4bv3xMf9n45JyFuxuH/xD0FiDt98jNSy2DNdM=;
	b=G8b0pKGTDvTkDfAgYJh1eHwtopSq0DMIMqouuzkX6ldqtCzBn0z75u7TaRR0vNm+Bu
	Hz0eZORMNNEx8EE80a2ZNcAkcS0EjaK/BnVHYxXgnw80FRqOfjqys//1xqV7VO6UkZzG
	AVQi/k5oq5UZFH7ei3XJD551h0o8yEWdjHzjjpCZ3U3EQdtFlePaNTJ4s7/OzRZSn+Un
	XgzTP3LRtvxxmuQyxAwSuv5+kL8SLTKVCYACeo2Zgun2PSPLCyxMmqDsuFQ+nGrz2WbW
	dB4c3hePA93w/fGU4WaN2P1OTeRNrCqroDAbddPK1lNMhQGXh2gSC3haOoR316fDAxx3
	f4Vg==
X-Gm-Message-State: APjAAAXDGST0MVjWoi1ZKaLQGi1en+6VIgQWEo9umtfSTOaHzjEKmilb
	e/k1kT5aqvuhO+VK7v+EbGThM0MCxgw=
X-Google-Smtp-Source: APXvYqwRj5v/GLggK2vCghOMTEXbO2oTMBBbBD2k1g+K1E1UofUZrEA+5UY+OZ1XNamLuUuDZ+Z9BA==
X-Received: by 2002:a65:690b:: with SMTP id s11mr23460659pgq.10.1568061837329; 
	Mon, 09 Sep 2019 13:43:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	v7sm16193202pff.87.2019.09.09.13.43.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 13:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2019 13:43:48 -0700
Message-Id: <20190909204348.772880-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] remmina: Add space before append operation
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
X-List-Received-Date: Mon, 09 Sep 2019 20:43:57 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: Nothing PROVIDES 'libsecretlibexecinfo'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index cd6bc145c1..126680c574 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -8,7 +8,7 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium li
 DEPENDS_append_x86 = " spice spice-protocol"
 DEPENDS_append_x86-64 = " spice spice-protocol"
 
-DEPENDS_append_libc-musl = "libexecinfo"
+DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
 SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
-- 
2.23.0


