Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5F5B77829
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so17977686pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VQbtsQ4q0UxWk5PfHiqwlRP1LlNNeiNaNDopqJPrlfc=;
	b=q0a1uhsRgxt1ZukgLnukNJKXQPeBWlJy23xfvnxrS2h2tgtyU5x+b+5gg1UPybeG3i
	obALZwFUoLlZ51L5UpQm8C3OeK5CPhPHBt2AeiaRNY6LpsR4qLBCrJJX66wGq4ZflBnw
	rMhIyN7f0vWBt1XyBAJkStGnFgOXmteg7Rd3CqMu/Dz3kSPRMWUTeTXo5dugNSPnxsE+
	bMKdW1p50lZ6WSpt6CWGRYUOjefTxUlY4X1UIrqrNYWb0gfeFi7ZS7/zGCSHA6oJMFWS
	QxTi5GES1hXtwc6Rb2Cgs68I8Gyc6jWXk5WM4Ayvt5AnJJMZYAEpU4RdO3kifbn7QpRj
	UpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VQbtsQ4q0UxWk5PfHiqwlRP1LlNNeiNaNDopqJPrlfc=;
	b=G5++aLlQp7HgIZVniwC4WJUBTodHMFT3R+h/RJG3CGEEZEYFTNVJfYqF1rXVXDGlPT
	lOme9q8L/YsQaEgHEllBKVHF2ZvK709S8aLoH5V+hupXo/3jOO6nw94TvUjQpEooQOa+
	XwfSuk62vL0v5GoimXJqmngmm3uGyhUG8Q2urYHH1zOWxjnEweMZfpb/T3HTG2ceN+DK
	QGFFvnFX4gE9+N5qWeDYhYhuN/0b/IedhA4aDgMgLs3OdGb1/aMiqb1Dk+CnUgCmVOuk
	ptuuomPz60gE5Ixjgy4atwQstPNGo1isYIoKBXADzCxHG1c3tAkaRGmtxpMcjtz47iCa
	RLzQ==
X-Gm-Message-State: AFeK/H3+dAQJ2cD6zLy9nNFcAqeJczp7av6gYdcAM8EHHS9yxcUj05F/lxBy0M+/toNIIQ==
X-Received: by 10.84.232.70 with SMTP id f6mr1062378pln.102.1489987928862;
	Sun, 19 Mar 2017 22:32:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:39 -0700
Message-Id: <20170320053152.29352-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 03/16] libtorrent, rtorrent: Update to latest
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:08 -0000

libtorrent -> 0.13.6+git
rtorrent -> 0.9.6+git

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libtorrent_0.13.3.bb => libtorrent_git.bb}           | 15 +++++++++++----
 .../rtorrent/{rtorrent_0.9.3.bb => rtorrent_git.bb}       | 12 +++++++++---
 2 files changed, 20 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.13.3.bb => libtorrent_git.bb} (53%)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.9.3.bb => rtorrent_git.bb} (60%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
similarity index 53%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 4af3a6a6a..aaebc5f1b 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -4,14 +4,21 @@ HOMEPAGE = "http://libtorrent.rakshasa.no/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "libsigc++-2.0 openssl cppunit"
+DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
+SRC_URI = "git://github.com/rakshasa/libtorrent \
     file://don-t-run-code-while-configuring-package.patch \
 "
+SRCREV = "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
 
-SRC_URI[md5sum] = "e94f6c590bb02aaf4d58618f738a85f2"
-SRC_URI[sha256sum] = "34317d6783b7f8d0805274c9467475b5432a246c0de8e28fc16e3b0b43f35677"
+PV = "0.13.6+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--with-zlib=${STAGING_EXECPREFIXDIR}"
+
+do_configure_prepend() {
+    (cd ${S}; ./autogen.sh; cd -)
+}
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
similarity index 60%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index eb0a39af5..af1c4d656 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -5,11 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
 
-SRC_URI = "http://libtorrent.rakshasa.no/downloads/${BP}.tar.gz \
+SRC_URI = "git://github.com/rakshasa/rtorrent \
     file://don-t-run-code-while-configuring-package.patch \
 "
+SRCREV = "226e670decf92e7adaa845a6982aca4f164ea740"
 
-SRC_URI[md5sum] = "0bf2f262faa8c8c8d3b11ce286ea2bf2"
-SRC_URI[sha256sum] = "9e93ca41beb1afe74ad7ad8013e0d53ae3586c9b0e97263d722f721535cc7310"
+PV = "0.9.6+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+do_configure_prepend() {
+    (cd ${S}; ./autogen.sh; cd -)
+}
-- 
2.12.0


