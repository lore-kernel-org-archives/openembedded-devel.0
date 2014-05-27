Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f54.google.com (unknown [209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9AF6FA5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 01:06:03 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id bj1so8270897pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AnWTthVR2Hzw4i57QPKyBiv1vR4tEJqT1edKlhbxjIw=;
	b=fzMfZWScNmHOfBeXe4NHtSGBGafFuwKbGdEmMoli0pyLnbG/coVTS6a5RqIZguIOU2
	5dY0hC7p3oYBTVlKM+cfJrSgVlhjZPAyvAN2DqTSv3MpPLpfj8iOvw6emU0bb5JQSB8b
	HeKWFYcQ86MHm0zHDeoC3FQe7oYgCqPXyAc9EgFqoEiC4uQSPFFlK7HseKhVyQtLppD5
	aap+O5XFU4TtlMNy2RbZ/bxQOyHi2Tl7QIBQS0evmIZn6HVRV6EUsPyJP3OlXhSZZ808
	YVwbAlq8P59VzB1+T0Gny5nMEcAf94Dk0RXeFqOCtnjWonN5ylgCSYujLtz8/wyO+xWh
	FB2A==
X-Received: by 10.66.171.138 with SMTP id au10mr32593755pac.102.1401152764851; 
	Mon, 26 May 2014 18:06:04 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	it4sm20260054pbc.39.2014.05.26.18.06.03 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 18:06:04 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 18:05:53 -0700
Message-Id: <1401152753-21109-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] networkmanager: correct test libs install source
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
X-List-Received-Date: Tue, 27 May 2014 01:06:08 -0000

When building out-of-tree, the test binaries are available in the build
directory, not the source directory.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 3c7944d..371344d 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -55,7 +55,7 @@ do_install_append () {
     install -d ${D}${sysconfdir}/dbus-1/event.d
     # Additional test binaries
     install -d ${D}${bindir}
-    install -m 0755 ${S}/test/.libs/libnm* ${D}${bindir}
+    install -m 0755 ${B}/test/.libs/libnm* ${D}${bindir}
 
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
-- 
1.8.3.2


