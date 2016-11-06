Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6228371A8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p190so13518600wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HD7Lk3nLNw/KpE4/8Dzl52yfDtgZtKb4drwSyefwl5Y=;
	b=K5H19KVkE9anmblIO+YURDadnBvUb2W2OWJwKvqAmKyjCwWY8SwTrTWkxTgrileHCx
	FEI9U6unFF/JpVCSPQTtD0zdxnqN5IoN7xTBcBiqFviecLujZNLkKittSlaqGT5H9oBh
	uFJ0TofRDIchu6DwhAh50BIDHB92OUid5TKj7V16Gx/JGSNOjWQc+6KeS2PuN6V6TcQ1
	VdTT7aqdTGwacQAIgeS4ZBW0xxQKyTgEaf37gSsms8tckKa8h0Xg0GYLkl6nS/oVi6cS
	UdG+PfcAhDxsaKu0ctpAf0ze/IIK8LZ03JNQWs3BKlP8Y1oO4vdy/nfcdYOMT6ua9+U8
	ZCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HD7Lk3nLNw/KpE4/8Dzl52yfDtgZtKb4drwSyefwl5Y=;
	b=AG0CNAqtAmAQ+/5WgbqLEq9XMV3yZA/j1mbuHJLRTkxUmdbh9mpjvlQh+K47V5ua64
	xsBswI4xmqkA4t36fzQGMLHy3Q0MEw+yslXVT0hVCyVGC23y5v1BscfD1DEKDrOOqfZN
	lx2MCsG3X5jGb4XOIejc+X4HvTLxkU7ivA/QfQM9OnGzQUoL/7FiPuXCWUarJDj/qAdY
	sZ8PRB/x/GVpTubpxMynLk5ccJAwKh/qFQjblvXKwWqnahwVrpNygmGaDD0GD0epw49D
	WmHZ+tCBhSjapj+pQI+oSctVzIT0omgMEgWVfX3SkxZHGFbGmiAaAxoluoZjEaPYgR8F
	Jj0w==
X-Gm-Message-State: ABUngvdTI7exsXQIhsbkT5WgB9fs9/MoWIvnvSX0gAxTo/9JSwlALTLI/FrGGlTgKymLEw==
X-Received: by 10.194.113.234 with SMTP id jb10mr2827977wjb.19.1478470035433; 
	Sun, 06 Nov 2016 14:07:15 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:44 +0100
Message-Id: <1478470013-27247-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] xfce4-mpc-plugin: update to 0.5.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-mpc-plugin_0.4.5.bb => xfce4-mpc-plugin_0.5.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.4.5.bb => xfce4-mpc-plugin_0.5.0.bb} (72%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
similarity index 72%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
index 964f5d3..f709e4d 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.5.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
@@ -11,5 +11,5 @@ DEPENDS += "libmpd"
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
-SRC_URI[md5sum] = "718e64748e46908a44cd0b96eacbda28"
-SRC_URI[sha256sum] = "e71f57a28915c57459d6ce0eeeee1d0934f523c0ed083158c3d3b3836fc06fcf"
+SRC_URI[md5sum] = "13d5d95ef0c305bac45fde6231258e5d"
+SRC_URI[sha256sum] = "f1320916ae3112e6825699652a502cebfa78bb006c649b42d3d331dfe57b6cb0"
-- 
2.5.5


