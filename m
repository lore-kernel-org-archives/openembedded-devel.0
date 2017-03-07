Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A7E6D7756E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j5so20183062pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HFCNsBc9nja8neLrPCfdl51bdSh3KBuKatGudJxiy1Q=;
	b=nSot7pkWv50oKDqXi5gB3Kd4GFdBhg4gijZWcdW9XDI/gD6Ar9oJtKBf2Njn6CFvPN
	A6Zw3NERclAFROB4o9vBUYa5A4NhGFD/0J3qrKGu6ADjRIWUtkv8YwJSSrfo2Dr41MXT
	7RsWDFzCodn0CfuEYjYrLS3Ena5MBJGdDVLPS5kYvHDZLHvGniddt0MvMfgfYNrTr0fZ
	bRagVhNQnaPiiKQABYDavnVFr6mvg1DgGkBYZntM8VIDKa4XHjDb3v74gDke37BuJJQd
	5Mx3Gnn7XNxl9PEgJgCYmeGEUYBgUdmq8ZLDPjxraZi1GUJnuFDowEkKCZA2cTrXx2N5
	X7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HFCNsBc9nja8neLrPCfdl51bdSh3KBuKatGudJxiy1Q=;
	b=PjV1rRB2cWpsOUSCK5M2+RGtk/65pWivOo858kxGiddpC1xjyleGjm9tacZm8+lYUl
	t9xb7tuw/8jxJg1ievP9tCCt1v35P/VbUCxXxnVNCaFDhK4R1sCbDgzMH4BFJzGhG2wQ
	QMJ4PbizYeOnxnU0IenRhB2cg8Le1ATrEJV9lli8UYPNJ9c/eZCYSMKWNJneLML/jn8K
	1j4a60l2tEAyO0PqbHgsf9YB/Or9zJ76Hd6md7ZeOPEncZQlLTQUVwHy8sNocPgTUzk7
	51M0Ian0EeEe2syr8yDSzw6NAHfYZwh1HHaLiyH57cjFTWpq8pB1laIehEThKlwV2UPC
	wI7g==
X-Gm-Message-State: AMke39noQI6rgGBgZT+o5DPXoD9ix32JyVCHPmt/aTzV8G7FpgrgID3efF/BZTRMUQoFmw==
X-Received: by 10.84.197.3 with SMTP id m3mr32423366pld.89.1488870852090;
	Mon, 06 Mar 2017 23:14:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:49 -0800
Message-Id: <20170307071349.16444-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/14] libtorrent, rtorrent: Update to 0.13.6+git
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libtorrent_0.13.3.bb => libtorrent_0.13.6.bb}          | 13 ++++++++++---
 .../rtorrent/{rtorrent_0.9.3.bb => rtorrent_0.9.6.bb}       | 12 +++++++++---
 2 files changed, 19 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.13.3.bb => libtorrent_0.13.6.bb} (60%)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.9.3.bb => rtorrent_0.9.6.bb} (57%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
similarity index 60%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
index 4af3a6a6a..7153cff6c 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.6.bb
@@ -6,12 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libsigc++-2.0 openssl cppunit"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
+SRC_URI = "git://github.com/rakshasa/libtorrent;protocol=git;branch=master \
     file://don-t-run-code-while-configuring-package.patch \
 "
+SRCREV = "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
 
-SRC_URI[md5sum] = "e94f6c590bb02aaf4d58618f738a85f2"
-SRC_URI[sha256sum] = "34317d6783b7f8d0805274c9467475b5432a246c0de8e28fc16e3b0b43f35677"
+PV .= "+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--without-zlib"
+
+do_configure_prepend() {
+    (cd ${S}; ./autogen.sh; cd -)
+}
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
similarity index 57%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
index eb0a39af5..817c24345 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.6.bb
@@ -5,11 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
+SRC_URI = "git://github.com/rakshasa/rtorrent;protocol=git;branch=master \
     file://don-t-run-code-while-configuring-package.patch \
 "
+SRCREV = "226e670decf92e7adaa845a6982aca4f164ea740"
 
-SRC_URI[md5sum] = "0bf2f262faa8c8c8d3b11ce286ea2bf2"
-SRC_URI[sha256sum] = "9e93ca41beb1afe74ad7ad8013e0d53ae3586c9b0e97263d722f721535cc7310"
+PV .= "+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+do_configure_prepend() {
+    (cd ${S}; ./autogen.sh; cd -)
+}
-- 
2.12.0


