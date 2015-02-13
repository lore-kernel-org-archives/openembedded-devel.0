Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A30B3733CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:16 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so14708220wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2uv/bj0oPQiYwLLmcumF1ZDMjZb3aKUq35+9D+X6I4k=;
	b=KLwG0GHXNCyrElZGoLcrcWgspPFm9NsRvju79gifdHtR9QuQtghprTP3fL8L1K1Ucd
	k0fZ/xO2DVj1VXUNteI7FOUL8O+mgambWwzqGiBVepExd5w4lDbxobLNbU9BTCmcbWVR
	vMOD0epMopmlbq8AroHhJpdFeA2vMRP4ekYutCN4//6AnoxgsRnQnFmryxt+dfoK4+kQ
	j5uW3+Mfx8WmXKLHVppJtb/cQZ/rpnI8aDMQlFQcUX+aABLXXg28wafoxejyu3+qyPjJ
	fWJpt7k3lFGNRv5QSmLxf2zNKOeA+FJrMqc34TK0FTTUcdkUctJvjZLGk/ab8srR3PVj
	W3Lw==
X-Received: by 10.180.92.199 with SMTP id co7mr12991144wib.47.1423810937363;
	Thu, 12 Feb 2015 23:02:17 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:44 +0100
Message-Id: <1423810919-9857-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 04/19] network-manager-applet: add PACKAGCONFIG for modemmanager - disabled by default
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

by updating modemmanager configuration of network-manager-applet now auto
detects modemmanager - the old version had no (lib)mm-glib. By using a
packageconfig build is deterministic again.

Fixes:

| WARNING: QA Issue: network-manager-applet rdepends on modemmanager, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.10.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index 545b2cf..00cea74 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -22,6 +22,7 @@ EXTRA_OECONF += " \
 "
 
 PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
+PACKAGECONFIG[modemmanager] = "--with-modem-manager-1,--without-modem-manager-1,modemmanager"
 PACKAGECONFIG ??= ""
 
 do_configure_append() {
-- 
1.9.3


