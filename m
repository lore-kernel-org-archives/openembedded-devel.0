Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 24D90708C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:13:10 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so8844315wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ez2UvI8Itg6tl2bxKZD3+RPVQz4+aiL+mDqvxnYuCOQ=;
	b=p63uaXI5lLlme7NMyf/AT97vfbVogAx766KJ/ZdLbcbM+FmIlgVGH6LkICqpazVQw1
	I/YQoCszg5kolr4Agf7trwj/tD9r1hTBDxujoA1RpC5XESFf0PAzDikAklTTsDEujKDs
	s4wyrrV3dy20+qi3KluB00y4jzKLeGY9APq1rMRDwHWZbsJxeENSXV/oyNwtQyO7Su6Y
	edM61LSCNQoOT0B3/a9GimclBghPzDRZppSspDY1wbM/2OohCchmJvoOOgGjLZasO5N0
	ccpNbRMvH4dzRV52Md97d8bd0B19Wow/7aA5Q3fuT2zrdfAfQjR6ryaNM5halG1w7aUm
	p4Fw==
X-Received: by 10.194.200.137 with SMTP id js9mr15696261wjc.90.1407773591767; 
	Mon, 11 Aug 2014 09:13:11 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.13.10
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:13:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:26 -0700
Message-Id: <2e84f59401a5ce57ba17841ff4ddb01cffeb1145.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 5/5] dnsmasq: add packageconfigs for idn, conntrack, lua
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
X-List-Received-Date: Mon, 11 Aug 2014 16:13:11 -0000

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


