Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 507A16FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 01:23:54 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id zm5so132685596pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2016 18:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tli/AxM6lVaB5tjVx9ikx9ocF3EXgBcBddtoE4sGjfQ=;
	b=MhXUegI5b1Sx44vkIPwfK/TA1Qk0wFz5HnK/w1pl8HN2kSjTYRpcrE1KMN4NFoK+0h
	xvrTf4o7cTBl3kCWJpZhUDMXntMrzaEkPE65RvGpBa37tULjZ4iCULkA4sLNs0yRhajj
	lXd+6kYRzLxMfMHJAv5jonK9B7Iru95JP9FsSx/PGNhRHwvRB4wf2jg6Iy6H1js2MMfc
	mtR6hddBpeRi+HfA5LNwZCZ8x9FRFSQ2lDBO7oQZ/HuJXDBP8E5n6gjETVZaMN+bJYVn
	XEHJVZnReQgOtWHMOLWlcY9zdB/3h+mh3W9UOQ7g16+CbziDbJg2kbOxzQ480sd09xz+
	U36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tli/AxM6lVaB5tjVx9ikx9ocF3EXgBcBddtoE4sGjfQ=;
	b=diN2g3GZFF/ZorAf3LQ7xJtr0V/qrBipI+kJ1v57EkqKLIFDotM+q6IdxizUdZF9GG
	7szEZuQmmrn4Pp3fSZoM8jTo97EfmW/pWPgI+Oinq1SNZb58w8GdCR1rcNRIDNyWe6PA
	+9KCR9jjFZEQQtfrgkg+Gv98AY4c8N6XykBmkNheJQKCMtX2VWjYK/XtgkYKedamvXJ6
	5kNF+kSukR8HZm9/8r1ziCDhDnabY11rJy2pQEV32VtKO3IrBtwqsPlBw1kheb6z/dKB
	nZgo3SZdEs1dgoyaTkhOWQoKwnj+e6F4WnvL4IsoBY98+m3H2oMm7BNGFKSXKodW7/CE
	H0ww==
X-Gm-Message-State: AD7BkJJ3I5B04pEnFVLaRWuRy9QShrPst4NPdoR0MDCf/OdOE/Onieq4ybbACp+YXdDJ6A==
X-Received: by 10.66.90.163 with SMTP id bx3mr49272376pab.59.1459733035599;
	Sun, 03 Apr 2016 18:23:55 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	w20sm34858501pfi.31.2016.04.03.18.23.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Apr 2016 18:23:54 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2016 11:23:19 +1000
Message-Id: <1459732999-28196-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nodejs: update to 4.4.2
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
X-List-Received-Date: Mon, 04 Apr 2016 01:23:56 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.4.1.bb => nodejs_4.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.1.bb => nodejs_4.4.2.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb
index 0d0136e..830677b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.2.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "0ebf5aeb6f88a68546351e9e703f8a47"
-SRC_URI[sha256sum] = "3a37c89a3ac965688f9e6557579993b73eee44195a5fd53fded03a667d3d6a0a"
+SRC_URI[md5sum] = "3ace056f387d88ccbff44c1792e33d31"
+SRC_URI[sha256sum] = "49051fd930e36181509dc8fcf584fc01971083b6bf9e14f2bbec49cc9c4224e9"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4


