Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A52E5719B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 23:10:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so34274227wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TGcNx8aBpHUTrZSois19XGUfe6DiHewnpQ33BsPh98s=;
	b=aWPUhzEWIaYIHWwTfy0SPvZf4UqlMiCBCHIRbQwduNN/4K1882EW83J/3XYnJtFQrX
	XaPnQqn12egib7phjoBhYziqXiR8rbmmFgW8BqOTtSoeFLjxM/AMPof7pSS3S5wP0o/v
	RNu6l7ULMMqIN3h1Meqjc/sjTcrweFOFM5Bo7ZtYWioSyASeJJf3ApM34/Fi0MPUhvKu
	p8PG0fd3nLSk2ZSghEtS4ppiWFpEIaXoxHa6a1u+w61sMECfDU+Mdqwof3Uw7hqRaA3i
	bq4SlMDQtI1KfKarldo1LlE5QdM4cIUUougHLfcn+ARdQggtS63+AblltBgamGPRT5MR
	OTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TGcNx8aBpHUTrZSois19XGUfe6DiHewnpQ33BsPh98s=;
	b=AdAM2vsxcpnma9hjE5KsHYvkJSrN00bHrluXDXTXRCUaTlRJOvSnDkpy8MkKK4njcf
	TwA250AVSwgZvYgYCpyViQJFunYJ0mf8ET0WaJyg6HBqVgAhBi4P0MDzgq8w3JBIxAFU
	188qgNl1OKjycxdZfoHaktckFCZhqeXR5yItKd424EkjEkqAcGZY+3gWPh+haaGGH+M2
	O1naj9PPjXD3bcwkmE4skWC1xNB6Zq+Tr5XHTe38gEOVeaqkrfitZV/HXmJR+XH0xvp0
	OUL1bWAC0hSkvplPsTRmVBUgsP0O8m7zJZowBi4VSqXF7J45fmf58NBrWiu5yP4OXYK7
	Ydig==
X-Gm-Message-State: AIkVDXKzehIQQTqVpx5pN4bThqeMredRB6G5Dr7Kr2HjLiGELO05iI3vnPLKWEQtAZ97gg==
X-Received: by 10.223.136.85 with SMTP id e21mr11002164wre.28.1484608226164;
	Mon, 16 Jan 2017 15:10:26 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	w18sm32073125wme.9.2017.01.16.15.10.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 15:10:25 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jan 2017 00:09:46 +0100
Message-Id: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-browser][PATCH 1/2] firefox: remove nss private libs setting
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
X-List-Received-Date: Mon, 16 Jan 2017 23:10:27 -0000

Commit 8cc038d uses the system's nss rather than building a private
one. So one should remove the nss libs from PRIVATE_LIBS also.
Otherwise bitbake does not add nss to RDEPENDS automatically resulting
in a potentially missing nss package in an image.
Additianlly bitbake shows the following warning:

| WARNING: firefox-45.6.0esr-r0 do_package_qa: QA Issue: /usr/lib/firefox/libxul.so
|   contained in package firefox requires libnss3.so(NSS_3.12),
|   but no providers found in RDEPENDS_firefox? [file-rdeps]

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 recipes-mozilla/firefox/firefox_45.6.0esr.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index bed50dd..31b3353 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -95,15 +95,3 @@ PRIVATE_LIBS = "libmozjs.so \
                 libmozsqlite3.so \
                 libbrowsercomps.so \
                 libclearkey.so"
-
-# mark libraries also provided by nss as private too
-PRIVATE_LIBS += " \
-    libfreebl3.so \
-    libnss3.so \
-    libnssckbi.so \
-    libsmime3.so \
-    libnssutil3.so \
-    libnssdbm3.so \
-    libssl3.so \
-    libsoftokn3.so \
-"
-- 
2.6.6


