Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8607FCF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:21:31 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id o14so7278193pjr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O0kYbktuV9swadEJI+46bTs87dsTHKIWXg4FTvRE5gE=;
	b=Z0d/82FQWsQ5oy1OSUoB4XSY0VbnbgTkmM6r8/nwHj2Hh5T2j0CoKYUDHc2WcklgPj
	N+OWXcny56qWlz78JogW9cuxFimj8fXj9ts49oXvhH1yB3vnjt5g4IpVgtVsIL9ObXK6
	LuqL7Fea8mhO2R8c2w4vjvlv5dqwZHvl1i58HJ+cvxk+mb9oW7184jCR2tyd8vM3EJ66
	X5NDJZGJg4dVWuzL3QgjjMZTOaG89z/RRZ/jdiqysIQ8K4G/rf6Nps4/QC3xu+NEdPVw
	1gAt5carJHlzJRgv4OwLfCBSJQGuGIdXgXL2nfUrjiVKtfsUEP9TMZQYukgmH12RYIUr
	G4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O0kYbktuV9swadEJI+46bTs87dsTHKIWXg4FTvRE5gE=;
	b=VbGx0d2NB3tdWnO4sMlzMZE/sOQLX+SSUxaLFgQQtaSwJpuooVPGOHNz02A8RQuXac
	DffMc6rM8By0ClqQZ6gMmfSluyeS1By2yxfX/TYHNL55UtlbM2jhSxTu+8Pmq8JSe3ci
	K6vV55J0VE7bQvS4N37OaN5FzIgaYL+EosIEkjMPkuCQJF4wKWdf9EDAmeDBfNiHAhU9
	ELS+G6tYY07nkax/5vjqNevgDZztJ1SzLZ624JY0d7LfPlhTVlhByg0JceSR6xe28O4b
	pihs4itM9k2vhkbaJoSXuL53TiJru5bR1WkTYukca5A70BMitq8OfDMVRT8+yZCM9iH8
	0/Vw==
X-Gm-Message-State: APjAAAWxU7g2g6LabWvVTtEsPTydO0tUTHtbpaigfmRB2LIqBEocCR+X
	5qgpB5l8V4n8T9zHpJSLRy8u7hApL6c=
X-Google-Smtp-Source: APXvYqyTiEHtT1lsj4T/LkrYstA2sr2I2FdPb3bJIuAOv0NhD6agoFCwYWjoX+w5QaiWFa5rdWUs+Q==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
	v10mr28145776plo.282.1574720491705; 
	Mon, 25 Nov 2019 14:21:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id 9sm9432637pfn.113.2019.11.25.14.21.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 14:21:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2019 14:21:20 -0800
Message-Id: <20191125222120.648324-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Drop gperftools for mips/musl as well
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
X-List-Received-Date: Mon, 25 Nov 2019 22:21:31 -0000
Content-Transfer-Encoding: 8bit

with [1], we now do not build gperftools for musl/mips combo as well,
which means it should be dropped for all kind of mips builds

[1] https://git.openembedded.org/meta-openembedded/commit/?id=b192e792cd0c72c19bf8f18217accf419d66b41e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1f0a7b9470..310de53726 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -257,7 +257,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
-RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch_libc-glibc = "gperftools"
+RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
     freerdp libnice opencv \
-- 
2.24.0


