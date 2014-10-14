Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 182AE71801
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:41 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so18158wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=c9L2eR2WYIwTCDcan09xqnDTs1R3LDTzoc6yncuG47s=;
	b=XqokSWMwy139f3d3F67rmPqkl2Avjy21iaK0Ai2eFmX8XJZu/nNQHiphuNHJROioNi
	MwgOOMaksoXt0QLwjtCWRkx7J2525HGGUTBZpR5w2Yp0+CxXBq5XQoKlVy8fMy5cm3NU
	EGNB5K5BOKV8DV0k1x/HlPpz96ubLXjkacaOmsAbl1Kdo4sEHQdl+dPkIEG+G82lXyhO
	amFKNEqm4iN0LD5BZxh3FjEmUbGx2xMdFdhgCa87s50TDjVSNYzQ86n14KzQodu2w7u+
	c6N2SCCBciwkqWYR+hCj/rkx8frG5egbW9p0eMDDPSJX40Cy15uiuO1zlwuzVmyGAD0h
	8RRA==
X-Received: by 10.194.87.4 with SMTP id t4mr8168710wjz.42.1413324882279;
	Tue, 14 Oct 2014 15:14:42 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:16 +0200
Message-Id: <1413324868-11856-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/15] xfce4-terminal: update to 0.6.3
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.6.2.bb => xfce4-terminal_0.6.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.2.bb => xfce4-terminal_0.6.3.bb} (67%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
similarity index 67%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
index 8b2619d..1049b27 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "d5cdb302bd770c9f2d30262c26639006"
-SRC_URI[sha256sum] = "3d92422288d26311880af694bb4e02c9235997ca307a5e85001bf6bef65c3b35"
+SRC_URI[md5sum] = "6a2816d8b0933cd707ed456ceb731399"
+SRC_URI[sha256sum] = "912f4716c2395a14a80620ef982b4af1e2a67a8df9a1ef0b802ecae826057e08"
-- 
1.8.3.1


