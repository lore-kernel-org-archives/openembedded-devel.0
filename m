Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wj0-f171.google.com (mail-wj0-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 315DB71A82
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 11:05:45 +0000 (UTC)
Received: by mail-wj0-f171.google.com with SMTP id i20so31858014wjn.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uCfAGZpLKkwUWL3JWrZqhq5lBt2LDy7+wq7GddOF2yI=;
	b=LiT56x1M1G5vA9CmivSB+RwaBnWqqbqjjeYhg2jzU4bQeghEw4zGoSlxui3xSx4CAU
	lyrwAW2VnRo1HzWT9DfWZBEGNWzFJlMUrEeTzpsmLr5tK4Ou/cTRsuw62Bkr0Z87XOsh
	5/NnHTz/XXojm9MuhiDi2fZY4bgzm7S5CuXI10+lDSgsDeeX2O3VSfPTVc8IjtXN2uGd
	JPRjzlZthaRBahdq1nkei2zXXz66Ds5lUKY289vcH9toHd3p1pqHBrSxcQlXedzgCX8d
	68HQB5siFevbLYZyiRQZwMjftkCppqRz8ChNNaYvFU0Y3l4uIRV66pcs23pdepYEzyAc
	G96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uCfAGZpLKkwUWL3JWrZqhq5lBt2LDy7+wq7GddOF2yI=;
	b=eduYXrpryD8/oSn4gevNkcBc1FYGi4mibb51uLnmQAxcZspgDl1sUE9UKwg7JjgEOx
	6vwo9Mv/hBUt5JQIae6OcRAzllPncPbm+2UJRwTMVlI7EDmz4m54UlmEgQU++U0lkVyA
	yDjWZGr3YRpD/h9YxCbCLv7Z7lAutVZ5wlZuQKD4X0B8bqpyxuspUrsrLosx646wS4sl
	FaleFTm36vfwSQmBnyAKbHS8A6CWI4Qx93RKo9iF/SSXKzBi45CSjAsV7dEg33bRunhQ
	FcHFzfqs3uitWCWHZRe89fVLJ7yfjPP+hBjP7gDtpcTEKBD95+H/DA2xwL0O90bYFJ+h
	r6vw==
X-Gm-Message-State: AIkVDXJ0SFcsh510xMaocoYTqEy1U805uEFkLW3YQFj6M0XPjaKaVbLXCeD3wB24FodTJg==
X-Received: by 10.194.172.42 with SMTP id az10mr62407432wjc.145.1483614345739; 
	Thu, 05 Jan 2017 03:05:45 -0800 (PST)
Received: from piotr-ideapad.elnet (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	w18sm99851787wme.9.2017.01.05.03.05.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 03:05:45 -0800 (PST)
From: Piotr Lewicki <piotr.lewicki@elfin.de>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu,  5 Jan 2017 12:05:26 +0100
Message-Id: <1483614326-25468-2-git-send-email-piotr.lewicki@elfin.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483614326-25468-1-git-send-email-piotr.lewicki@elfin.de>
References: <1483614326-25468-1-git-send-email-piotr.lewicki@elfin.de>
Subject: [OE-core][morty][PATCH 1/1] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Thu, 05 Jan 2017 11:05:46 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Piotr Lewicki <piotr.lewicki@elfin.de>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
index b227f19..aa26cc7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index 96f21dd..0cd762e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
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


