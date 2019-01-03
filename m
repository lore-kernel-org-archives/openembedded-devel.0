Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id D8A7B6BDE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:48 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n190so28055630wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=u6rlkfLguqOPiE5fcNFPWKwsHJpcpB0OaA3JemYyhw0=;
	b=pKjHMoO3araHMw9YwYBkhnqpTJ6zpzc/mYO4VXMG+mbyls97CzUi5Lrxd9yL8xcMi9
	uw+zvaMmuQFChHa82luHwx9nayd6WFG+MTgR0W8S7RO2J3s/Ntgh2pcWI1vgL6ItjVcx
	NZGnpKkIYOKqJ03XFxByeom72SUX3ukIcLSwilnJyInptJXkJo39rMuMMBI8Ov6jqjOt
	vc1JsGFw0+m0J/MOFB0H+CQoZ6dLqVdA52emSEzCpbNkxspYqvhKhlY+pgkd1q1QqJXJ
	T8nqGh/jLfFJ1awGBXDrLBsev+qAlte5Hhw5e6TYL+uF+1Z8UtwwgrNWfNfmiQGAuTRv
	n0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u6rlkfLguqOPiE5fcNFPWKwsHJpcpB0OaA3JemYyhw0=;
	b=gNy+q6kkrCHXPJGVhwE/9nLnTXp/RinkrALNxYlkTUj2u3lY76LgNhdyci40YL3L0m
	skLbiA4qABpaIWtxdPJizitSxsW5Tg/8CFDRZbJDwH5uSWaHU8+B5AcDg5ue9gDrPfRF
	/unhMmdZArfsEMX0lZeTtd4xZhi0PAA59X/Spp3/mS+lVl6AuUgLLKDLaAJP3RhAPvyw
	uJZ6xZPxCcIDKwmUre5nfthH1UqlNFMvZi1D7cff3dSdfhm1VWSqa5SeYQeGNYRBnUyK
	ls2tymlvVDpn4t1I2p3rqIitSrmPcJOtJxMMF0D/lxbxih8YdnUnR8I+3hkxUdTmq+m3
	qDFg==
X-Gm-Message-State: AA+aEWZP1BQ5daSDoiSlZIhaO4jPCEGb/hAfnbYRoNzPz6an94rtwGAA
	vW6UW7rcJKgj3+MNgYd2pTIHxdg9
X-Google-Smtp-Source: ALg8bN6Pb/ek8PjOP5fa1fwSI3gxLbbJXwgKMu7AiFvEvsxj+U1AyMsENR9HlLQSBxbbxjjgwPJqsw==
X-Received: by 2002:a1c:6e06:: with SMTP id j6mr37564326wmc.3.1546477969085;
	Wed, 02 Jan 2019 17:12:49 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:17 +0100
Message-Id: <20190103011222.7686-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] xfce4-panel: upgrade 4.13.3 -> 4.13.4
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.13.3.bb => xfce4-panel_4.13.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.3.bb => xfce4-panel_4.13.4.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
index f1abf6675..18e054c9d 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "0ccb448e3792949eb0ae9db8dc22789b"
-SRC_URI[sha256sum] = "b467feb7ee9797ad12f56a152570e42a96b94ad63580d45536aabee282440ce8"
+SRC_URI[md5sum] = "c0f132fed2110d37f351aadc9e80a034"
+SRC_URI[sha256sum] = "36ffd26ef7f5867c01ba310475b4358ff0e588cfd5599a266f0037a6c20052a1"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
-- 
2.20.1


