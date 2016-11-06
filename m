Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3C671A4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so13518622wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kPLFavwgKZjCMdrfjMqE7WaXeyLR7Fyi4akEjD8v5Ls=;
	b=LMmy63NO+0X14nDSPsJ7K+uGn39P7NT+tmsqGwdBSgNI9t3talth8oa9VQtkLJyuRI
	f/PBo1Tn/MKIpzIK0h/Eku9SDhTTE1KdiSsSFCBUfkvl91UnIakWTWv07qVxAgfJ9x2r
	EurwapV07fSXk1ncp1qeJ0veN8/hJlrv0xfOvYTAnf9NT+2PqypERfg7Ly6MxLiLHfgA
	Nd9ffw0OCUBFcm/NKgBvMCPgWuw8x74Kif7dYp2W611jecdn2griZKpxVa3b34seaYnk
	NfXDvm+poc5ASB4ukcTNSD7WJEg/yHSw6EfJZv+/MF/O+czlxQ00QPMWbNfxjzZJ2iUe
	bJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kPLFavwgKZjCMdrfjMqE7WaXeyLR7Fyi4akEjD8v5Ls=;
	b=izktQEqtmAXbMlnnwte/G3TZc7qI6q6tNdeik2t9t4zEfU8XJ3cKBYSulEmBIdvijC
	SIL8UhXt3bbiOtesDsmGHJ8f0UH1GvK8C/UVoYhYlFGCusLkZPWWu4kv5y4ksmDLqw+R
	7ZE9EOwEs9G603nlTLhwirvLggoEQENcnN6WHUIiXML4mJgkQ/rEYQ8MIIOxAdVI4yBn
	HZhkE5jwrv7Fl28uJkDT15jeqo1mhKQ5yJmaY5W1yt85bYNYhJsXfH6ZJ4gffJrs1xqG
	6yt/iCV8FCdO2AALjJHYQgJWZySdzudQaeXJvfaQY2XCZtZ7zx53JRLkxoHhnlopdmcj
	FtZQ==
X-Gm-Message-State: ABUngvdLokUCDqlmvQQ5qDwTrPG/VJEc41D/Y3mabfrnuohks+hlNsb3Pc0RJ8Pn3Lu2xQ==
X-Received: by 10.194.205.1 with SMTP id lc1mr2875826wjc.192.1478470036254;
	Sun, 06 Nov 2016 14:07:16 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:45 +0100
Message-Id: <1478470013-27247-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] xfce4-netload-plugin: update to 1.3.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-netload-plugin_1.2.4.bb => xfce4-netload-plugin_1.3.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.4.bb => xfce4-netload-plugin_1.3.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb
index c9f7a2a..9e31ebe 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "ce53e1135e4bff5afcd899627110bd11"
-SRC_URI[sha256sum] = "fface918822c012d806717116566e54947ad7613b9290b45a18e2d5ffb8730d3"
+SRC_URI[md5sum] = "9b625d8ad513085f2e1569171db00b44"
+SRC_URI[sha256sum] = "615a280a1bc6c1e3f40755798217a230fd022f7744b095e7df978b63f25c8057"
-- 
2.5.5


