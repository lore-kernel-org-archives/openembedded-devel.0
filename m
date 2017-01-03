Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 702DD605C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 07:14:09 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c85so192922850wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 23:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hqQchCzhdCSXCpyE0oaqjj6Z/ek2DgCz64oAnZyvl1k=;
	b=EbzextQ3ci90YQ/ISWFcnbHxxki5TQnq+d5zBBNJrXdkxPHRASKQr1XCRDT0UFJg/y
	paqscNMSj00NdJauKOPYhn/hIlByL1DCycac+raX7DdDAWiKzy++XqMVGUq3LSSfuMAz
	/HE6F45JKmGTg/jPKUeU4jPcSBNPo54Mjc0yOeHmqygkAf2ibGhk3iPF7ERUFRoKsH+B
	Hlo7WDH769fQhXKj0AR2l92oQ6m4AeNFYjXxyLmzi+Mc+3SC0LUgIDfiHpbEKgqipqHi
	Op8opcWf1DkP8EA7FAKC3gKdnyKLEcEp+ypW2Wf89Wkp8bDn2DNlh6jGjRE/tRwbDfPO
	3qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hqQchCzhdCSXCpyE0oaqjj6Z/ek2DgCz64oAnZyvl1k=;
	b=rtSgtGUBd6DSkLBg6/177nbj9JoHwQcMPCwBNkz+5Z1pEx2lmvdfiNtJk16ly0d9Ek
	3cSyniFvoMCbCzYwH5DSHC2XstJk0dRfarKYJhUkV1NB6m4jLdAAjxSpSDFy3w0HffNt
	PEiLa6i3VilV5ac+DOgQ7yREVv/vYfRQK0UzShpQLnwcZpvZzaKR4pFmsxZWJIxAeGzJ
	rf3IQgIH6Y1bQF4HENkNx/JqZ9IiBq8UqYzhq/WP/Zl1fIc+w70inYkz2VzgzjJhat3/
	+iNONQxCoeUfi/jMY0NhAKHUYUc36iL6uo9Mx/5MWqjE+Pq0qtvmNgpgYL5qVkeTjI3e
	x49w==
X-Gm-Message-State: AIkVDXKxfc/7kz+gwkjGaIc3FAl6jnVhClui7kw5P0vGKsP3t0kVWpR/48KcJoBob/HSxdMi
X-Received: by 10.28.7.197 with SMTP id 188mr41287608wmh.26.1483427649643;
	Mon, 02 Jan 2017 23:14:09 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	l187sm88299065wml.6.2017.01.02.23.14.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 23:14:08 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2017 08:13:53 +0100
Message-Id: <1483427633-28539-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-devtools][PATCH] mercurial: upgrade to 4.0.1
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
X-List-Received-Date: Tue, 03 Jan 2017 07:14:12 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../{mercurial-native_3.8.4.bb => mercurial-native_4.0.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial-native_3.8.4.bb => mercurial-native_4.0.1.bb} (82%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
similarity index 82%
rename from meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
index 0526fc2..028bb42 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_4.0.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "python-native"
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "cec2c3db688cb87142809089c6ae13e9"
-SRC_URI[sha256sum] = "4b2e3ef19d34fa1d781cb7425506a05d4b6b1172bab69d6ea78874175fdf3da6"
+SRC_URI[md5sum] = "22a9b1d7c0c06a53f0ae5b386d536d08"
+SRC_URI[sha256sum] = "6aa4ade93c1b5e11937820880a466ebf1c824086d443cd799fc46e2617250d40"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.7.4


