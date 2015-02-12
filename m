Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 61506733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:17 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so2994156wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2uv/bj0oPQiYwLLmcumF1ZDMjZb3aKUq35+9D+X6I4k=;
	b=lZ2tClWR3x4i21MYlOtD/rjmOS7P6NIRTV/7XKBqLArHKUXtVt5xaCOu57tteCb3m5
	bLJh+lPB2B+rewdn8wU9WV6boC3RxEdQ07gTvDFOtr6ZtWg2bu2xlKQRYLUYZJDC9t2b
	ZmtvrgjFSCekFcjk6JWOGWQS6ghbyte1Q4L298/xs8LKf7fSgg3mSogSOmIqqa+rA/uh
	Hxw8FzPORX+fdXH/7Ekg6UEVO7liK+tZpd+FlYRT6POw4iGfRom04VuYf0Aud+07IgR3
	iyoc/Ot2gG58Yz8JCfnfc7f0tw8GN1PAtk66UlMeqlZWzu6WhAq6uy33tq7UmnWrDFTw
	kW8w==
X-Received: by 10.194.86.135 with SMTP id p7mr11825456wjz.89.1423776138197;
	Thu, 12 Feb 2015 13:22:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:44 +0100
Message-Id: <1423776119-14981-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/19] network-manager-applet: add PACKAGCONFIG for modemmanager - disabled by default
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:18 -0000
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


