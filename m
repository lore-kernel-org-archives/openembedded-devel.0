Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3C907E21C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:39:50 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d10so20540761lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SujVy5HtlipWrbydH+TxVYTZ7h6E1WXsXG4ci+ZXJuE=;
	b=ax6oB7ypmKx72XgnW5D0eQLeWNYIoWyg5G6CP5bi6bwQipGVgQ9xJETzkzMXKM6FKq
	RoXLP4v/WtNtoNNbHEGvxId2IIkP2iAINr43eXTo3f40nsCeME3KWXwZgTpEVUP6TiJL
	F+SOka6+uzcFuIe5mI8e7vYz4pU6WyR5Ad3djFuspEsyalNho6Xg9p+lcCkGIJ8vG2dJ
	6OaXEyE1yRbXLTO6DoTDy5z/4AXiv7xYL33Fgez3lNz7NL8DjGGXLyv/LoTf7X3N5Y2c
	nqpRm8mZiIlmzI+o0MO5IhRemJ8SANi3VtH3M4AB1mW8UufEDkGycIMhntoRkr5CXpTg
	iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SujVy5HtlipWrbydH+TxVYTZ7h6E1WXsXG4ci+ZXJuE=;
	b=hvWT2uW1PyM3DQhy9XeD16OJsdEOLSDC53DuP9g9LS4jjL2CPHY/GL8tfz7kuaeZQG
	QrsI2auwBcVIBB4gFki2gvXHJg4yhuVGlCMAmDUBhXAzwrG9P6kdA9yFmTnBgDRcUZtK
	dX/5sonDtdLM6pTab+z9Ifk1v3R+J55i3vD9wORFJE+hdOi/Ji5NbXIv2BRLRmrREcW+
	sL4LvhD0ztIppORlscOQx+FnIQrx6NRrBqBzUUk+1c2vSHhft9up1tJW9K7fXVyoyS0+
	3mB57zXew3hWIeRsbD2GjklL3tb7/ZrKquIdaODoqAuhSwFlGOVF0WjDv36fd+oV+EJH
	8vWw==
X-Gm-Message-State: APjAAAVNgZ4MMvl6VF8ut5+Ahvr/Jfx6oZChXroyfxd/rgLDYXJcip4P
	RXeYdzz/BLXywTHfskCzS/ulHjCX/ak=
X-Google-Smtp-Source: APXvYqwLSWMNjwrXhqpGkq4qicsjJjDKdJI3i16dHOp3BFJKI/5dyhjXX6inWiYp9unRF+utL/rhpQ==
X-Received: by 2002:a19:f111:: with SMTP id p17mr29091726lfh.187.1568324391483;
	Thu, 12 Sep 2019 14:39:51 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	w17sm6573199lfl.43.2019.09.12.14.39.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:39:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:39:48 +0200
Message-Id: <20190912213948.21739-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] jsonrpc: update to 1.2.0
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
X-List-Received-Date: Thu, 12 Sep 2019 21:39:52 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../jsonrpc/{jsonrpc_git.bb => jsonrpc_1.2.0.bb}       | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/jsonrpc/{jsonrpc_git.bb => jsonrpc_1.2.0.bb} (83%)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
similarity index 83%
rename from meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb
rename to meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
index aea11b082..b23775708 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
@@ -3,18 +3,14 @@ DESCRIPTION = "JsonRpc-Cpp is an OpenSource implementation of JSON-RPC \
                protocol in C++. JSON-RPC is a lightweight remote procedure \
                call protocol similar to XML-RPC."
 HOMEPAGE = "https://github.com/cinemast/libjson-rpc-cpp"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4e728c5b36018f6c383b4b9efd9c8840"
 SECTION = "libs"
-DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-PV = "1.1.1+git${SRCPV}"
-# v1.1.1
-SRCREV = "319783c635cf8cabcc1a980495c99a88f9ebbd97"
+DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp \
-           "
+SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp"
+SRCREV = "4ed5b00dcc409405a19e6d8c6478f703153430e1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


