Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id E080A7723B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 22:25:27 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id h201so18240024qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 14:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KPUkH0qEv/RlW5ccbF8ihKLs1MPBtUtH9H07OsJM2x0=;
	b=CpC4XE1cjLCVSH6vWZBQ79++i8bx61jOgKi9tzG7HH6cik6dPLB6j7utDx3GOvmix5
	rCKa8wlOeVB9rQNHlViHxUgtqyciZuuH31y8Y9u0PglYHb8eWs2ala+RRCuw+x0NeGmI
	C3qk/bsMMtovLaLmfP5w1RWdqLYrituhOLJGNp/Ck5Qma8pz93/Q+gtIvlnOCC5MjCPw
	AktLOZtXsEEhIDB5RjMW+ToVYUlgeEAAlkzvKYHn4XeAKtSTeja1xpvFd/rT9sBwHr3s
	I+T8DZhiwcfgA4TkNTOHVt2LM+JWYI/tsSjldtO54PyF4KyWYsD91LvJGZthadjc594O
	tRWg==
X-Gm-Message-State: AIkVDXKAWeynKG/20Kt4QpdKQm1dhPDXHobjxMbjRMWpKu0KzwFeQpQ3DxWOaJUI7pnoQA==
X-Received: by 10.55.4.19 with SMTP id 19mr16869745qke.320.1482531929170;
	Fri, 23 Dec 2016 14:25:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	f142sm8041176qke.19.2016.12.23.14.25.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Dec 2016 14:25:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2016 17:25:19 -0500
Message-Id: <1482531919-26391-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Fri, 23 Dec 2016 22:25:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
index ca8ebaf..7a2b236 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
index 3bd8579..9446082 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
-- 
2.7.4


