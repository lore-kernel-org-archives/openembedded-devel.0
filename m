Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BDA3A708C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:13:05 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so8711876wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=G7/Nbpwx3Qt1qYEafC+Hvj3s7guqYoLlfFl4L+sMk7I=;
	b=PkijpBVOPWkch5YcbzAGOuLw9rSUzfMedl801yv7MyBzPW5pdV7Pqg66zjT2fw3quM
	3j7jRtuMQfDod/yzDk2GStgRS3t/RF/d5pUV9pBIpt67C0tCddlonkk8g7X424J6GmTj
	zr4tgEz1v/LOecptqUQEnPBeTcLtU+3glnHOPe3Nh8IsG8k2SGUB3lY5KJGlQylouPnL
	pfjNURdLvmvyBo5DDjNqcKHsZ1Q1R86JfuQzr/f6xhW/Ii1Q/VSriKFex3rtGYHUjbjk
	7I5JOY6/wSWAef0zqu1sfh68TdOTK/5t1YzfrsClB1dQq2nPPTRBUOlEzHOvzC1JtVIo
	kROQ==
X-Received: by 10.180.188.35 with SMTP id fx3mr19629738wic.82.1407773586271;
	Mon, 11 Aug 2014 09:13:06 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.13.04
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:13:05 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:23 -0700
Message-Id: <cbb1bda841860243e13579862cbda5d48646efed.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 2/5] dnsmasq: obey CFLAGS & LDFLAGS
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
X-List-Received-Date: Mon, 11 Aug 2014 16:13:07 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 71a491f..7037cb1 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -22,6 +22,10 @@ INITSCRIPT_PARAMS = "defaults"
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


