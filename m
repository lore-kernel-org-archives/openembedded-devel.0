Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C0E3C70A88
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:51 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so9188085pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ez2UvI8Itg6tl2bxKZD3+RPVQz4+aiL+mDqvxnYuCOQ=;
	b=naJUz33i6CLGpFiKtCN5Hf7WEHvBQMiVh+LrnXsny7HVzG4wiW17E8FuEvlZeELX2v
	ocJRHJrfliPYzrKiabAHJafnVqVJcfc71wpBq/jx4cdS0EOfmBCoEV9lYgy1XLcGIREd
	lfHLPdctJQHcutBbxi3mq29LUp5Bq1zEz8Lh+gdk6/w5AYJbXkThekIcNv2AZvONWNhW
	lyubE9zeHs4YvehaCsn0T4SJwA4P5qdFhSxiZyykPJRO4WxcwuTKWYIuY7GFsm27RW41
	+G38UomYOjx9H9OeNSgSVVa343sWKHZmdZQX1AONKMdbz4WMxn0NqYWpx5TFGgQZIxYg
	b4TA==
X-Received: by 10.70.47.168 with SMTP id e8mr33182153pdn.112.1407632632784;
	Sat, 09 Aug 2014 18:03:52 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:51 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:15 -0700
Message-Id: <ce63b6d184231a0a1797b91e2ad530bcdc4c7fee.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 5/5] dnsmasq: add packageconfigs for idn, conntrack, lua
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Aug 2014 01:03:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 92c5367..1335245 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -18,10 +18,16 @@ inherit pkgconfig update-rc.d systemd
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[dbus] = "COPTS=-DHAVE_DBUS,,dbus"
-EXTRA_OEMAKE = "${EXTRA_OECONF}"
-EXTRA_OEMAKE += "\
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[dbus] = ",,dbus"
+PACKAGECONFIG[idn] = ",,libidn"
+PACKAGECONFIG[conntrack] = ",,libnetfilter-conntrack"
+PACKAGECONFIG[lua] = ",,lua"
+EXTRA_OEMAKE = "\
+    'COPTS=${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', '', d)} \
+           ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)} \
+           ${@base_contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTRACK', '', d)} \
+           ${@base_contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', '', d)}' \
     'CFLAGS=${CFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
 "
-- 
1.8.3.4


