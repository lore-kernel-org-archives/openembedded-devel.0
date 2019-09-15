Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id E24EB7E6AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t8so25940380lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iQUhRCfaL788IiMYRTMfg5w1oAxWsnGt8WhAQxnE9cA=;
	b=tcoid5/CPSlhiQ/8zKFnziv0bCQInr+hjsei2mdtjU2EOdofFpdMoeyq8TVtMJ4mWx
	djdor2i68PSybwUdqSJFWaEGS5pPOKRw+yGB5wCI0PZVcpDmdgGzdgfgYVvdNSMnuo5e
	mpEKAjpwSpjK11wUXTgPYMX/oDrwRjxCTXU1IBwzYsdoMps2aJGqmhyZPP0O53xdRVey
	2kyoi3dOBIXmckjDVIMdJzhicKj49hw+/FeJ8H7chjSaWDjf78b5qKSYnH43kDCfp4SZ
	uGGW/XqBHJ2Mb1aGQ0hkBWqgid8Qs9m8uESwqHrEiJYMNGuSpuwprXGYo/UgKj4YrjsF
	NfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iQUhRCfaL788IiMYRTMfg5w1oAxWsnGt8WhAQxnE9cA=;
	b=hs4S0U4ujHmSxenjEl8COsJA+xLuTxn02wu6FZp7qizV3pGwidUdRJSDPwzvbYN1aA
	YhpeckJGsDGBCbwDsT+HuQ0NiSh/IcRlEiWkzQUrQFcWYd6KG5wh08WRiXtS7+7+tSv2
	8qiKNluiRzhgb5aQkxjrNBQLgqiJZNSt89Fd/hOpEWrs9pkqHzKRgqsDf8SSJki9guwl
	08HCgeCqtvZbkB5t9xwqxesU3x0w0mctyERmCLvIERdqjwQKfuTEfghC4REMlic3g/7G
	S6b8cFw3JcRK/P1l3rWwREVH1jjENLHKOmpaZkhgAJY7J9PBYJs38tk8Fgx7FCqKM8X0
	3cfw==
X-Gm-Message-State: APjAAAXBYiJLRsT1MpC3TxduJNI7kziAtP6PEjcA3INnVRtno3z7vIwm
	TAaou+UXyybq+/1+QTFiUo58az0vYWA=
X-Google-Smtp-Source: APXvYqwEVTzxydrUW6+oVdavpCp0IFBTPW5an1amvWW+CGs6LpEAJN8KZhKEnhpTB1sQTSi8fAtiaA==
X-Received: by 2002:a19:5515:: with SMTP id n21mr8592248lfe.131.1568590916531; 
	Sun, 15 Sep 2019 16:41:56 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	r16sm8488414lfi.77.2019.09.15.16.41.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:56 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:54 +0200
Message-Id: <20190915234154.12707-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libvpx: update to 1.8.1
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:57 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../webm/{libvpx_1.7.0.bb => libvpx_1.8.1.bb}                  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.7.0.bb => libvpx_1.8.1.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.7.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.7.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
index 1d04ed1bd..70278ecca 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.7.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
@@ -7,8 +7,7 @@ LICENSE = "BSD"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-# SRCREV for 1.7.0
-SRCREV = "133f83e2c34b8d770ae06aa595cef3e254173fcb"
+SRCREV = "8ae686757b708cd8df1d10c71586aff5355cfe1e"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https \
             file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.17.1


