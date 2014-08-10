Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4470A61
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:44 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so9108521pad.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hKHDu95Se9gg0vkjrJ2RHdpq2lZHl6AS4KcjjD9L7gw=;
	b=lJvqY1QLME2UPdLVRy3km0GoAx48bM4/flcB6AMP4dRzM78NWxYc1FH+YH185Emt1a
	CGXARkBnworOqpXBJvFGa1bcghJsvcyhRn3nmDt5ivvTdHrvS47t3fHZZC12jGDJxKDJ
	qoWRlzmAaY5T1AuZxqTuWLI56x3xSSTdGZEOpkVzK8Zd3zP0uWs8hwa4xdER0m4mbcG5
	860ilYyApQ3vvAt40SQE505QBnMqhRaP88YyBoPTUKYNE73nSTv6QJC25VFnKgVSpS+t
	qcCYkYu6080B2Z4aA89sgut0lLw/EAB7ZjcrbzAdsj7b7OFyid0rnXIt3Cfkk8CUFhdV
	XZXg==
X-Received: by 10.70.49.2 with SMTP id q2mr7963603pdn.28.1407632625526;
	Sat, 09 Aug 2014 18:03:45 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.43
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:12 -0700
Message-Id: <c85c85a34ad79127d5a15cfdb1b5fbd3aed31f4a.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/5] dnsmasq: obey CFLAGS & LDFLAGS
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
X-List-Received-Date: Sun, 10 Aug 2014 01:03:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index fd5793a..92c5367 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -21,6 +21,10 @@ INITSCRIPT_PARAMS = "defaults"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[dbus] = "COPTS=-DHAVE_DBUS,,dbus"
 EXTRA_OEMAKE = "${EXTRA_OECONF}"
+EXTRA_OEMAKE += "\
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
 
 do_compile_append() {
     # build dhcp_release
-- 
1.8.3.4


