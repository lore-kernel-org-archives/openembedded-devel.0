Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11781.1795762936931235232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mcL6lZnM;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6789157c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762936; x=1796367736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+2a66rTAtORBs+PP58IjPBzW6XCSh3Aalt9wna91tc=;
        b=mcL6lZnMqulWcF/U9bDTBtCxR+Xf5b8wsYWoFm58fB+q0dGruNM/6Xbe1uYUPjUFCA
         bDNg6MlnjIrA77S38buR99ibSicvhVQXDpY22HEv5sqZzz2TRACXGiVIHC5YFm886jzF
         kCyQyjx76nunFJHE0Jwu89LZqk8F+O6r3w1jaQodIga8Ox/fzIRb0ZsuXYrCePQtEmbg
         o1fQ3K8PlKNmdHREuNM0gup7HIQQw+OPM6csKjxRlpOYXJ/hvMStxjiAwnv0gvZE/w8u
         PEzsyVUrqx9aJVEZTOR6rgoaycwAKRnPMMnSDKEH7g4nOStgM8prxUur9Wy7ykrf26B/
         24hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762936; x=1796367736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+2a66rTAtORBs+PP58IjPBzW6XCSh3Aalt9wna91tc=;
        b=fIRmnsl9yUVsjsGj+ablg1TKhGC3S34Umis2+RSU8BMQGDmLiaL/RBfD6ArfMa3CaM
         qO6OIegJdt+ph+LTyN6tOlT920897EwFU5k/06w64zAChoXv6B+qaYJxDQQmi2t0Zkcq
         1wcse99TJ+aP6mXQiroenYv1VzW6i8oG9/in3lkFwjxqGJ3fg+isF8MqXQvc7Mg8Gnl8
         i5X36pMSFIKhh6HGY1yL6v1l99tW/nDsm1yvTy1aVEWVJdQtD4uD0jMkZnArZMCs8DNT
         Fucivz/nZOZIeiMcrVrBj4AyWsAqux9nBUDK7H9nDSR8/RMcADXwCHellQ3qf03xi3XF
         DTbw==
X-Gm-Message-State: APuU4Z+HHu/l9mL0zT9odq0r7NhE1X1eETIhCTjpHWYjeTbzC3oF4BAs
	vo482vATu6T/sGNpp1797Dp/78042JhOL5IJDOLThe/y2p8YzvNhCmvYBGenro33
X-Gm-Gg: AZFdTZdnCRFc/tqDrrGDr2rfstUdJ4AOBetU3jKW5HvGyPfLb2GO0ry9SGfpM4lx0Sf
	S0bOs/weYubDN2flf4iRxwAsbwX5sca+iVMeymLkYVuWGb/23GMOySc4TIUnHkPPS9HIsr8uko9
	gElQt07Gy2/s2D4cuL5FyoIZ2J8M5z/8vWbAx5o69hrq8ULi3N23mG8x0E7/MvPTT6/gGKB2MIp
	NJyKQtjNu7CD7yxYZ5n2vCueb3fNwIqQxA9RBzWI7wnh+kwG+0vgBloIeRn/jWsB5M+cOGFGyem
	zakFG9yt2NmUDPxr3WRw1L1+tIH9oPyvNTTSLM56RKwOTh/lygypIZXMRBHWWDUy3WiCLSj6KU5
	sTtppfEYwBB9jIpCCN2peo/yk58bM8qzRmQGH9aWrjFFcNh4BIAY6oJZoX8Waf7F3EIAjhQeNq9
	gPvKgizjWpOEWB07Cx5FdOLe7BbN8gD/EDeKOJUm3olQGoJdT3AWlNoxQ1fc+WysBcq514InhEE
	xLsDmoKXCorXooTuMMhwWdmwUaloqo6WZJn1wdARjE+S6i0WILTgo9WNk+Vpen5k24mD8d9g2KC
	C7bNJrZYxWU7mKXfhhDj2WGJkrjtX/BNvp/SkO9/FuXDH97KQP617uD5f96gaz4Pz6fafjIHAU+
	0VPRv4vIZzQObSBrWRjlZ99xYaqrxWjhp9stzITJSfXntTT5MpEDLJqAnwe/ALvM8UxL04+TTmn
	cCY3W9Q+IA3luxl2i1P3Hr33emqmOCdcm+kOqG0nTQVj5ZsGWhBGQHk/khieWBfsutL0HIn3DTM
	3tmcMejM7eCmDxLKsZF18RftMeuWGHjJzpNnXm/VJSuz4Owan2RcPDLCHwK3QzWRO4F7UhrcUzJ
	Zmjj
X-Received: by 2002:a05:701b:42c4:20b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1b55feaa3femr21097529c88.39.1795762936207;
        Thu, 26 Nov 2026 23:02:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 01/21] gexiv2-0.14: Restrict upstream check to the 0.14 series
Date: Thu, 26 Nov 2026 23:01:49 -0800
Message-ID: <20261127070211.2329979-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133328
Content-Type: text/plain; charset="utf-8"

The check scanned all gexiv2 directories and reported 0.16.2, which
is packaged by the gexiv2 recipe. Check only the 0.14 directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
index a193831a23..972179863a 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
@@ -17,6 +17,10 @@ inherit gnomebase gobject-introspection gtk-doc vala
 
 SRC_URI[archive.sha256sum] = "606c28aaae7b1f3ef5c8eabe5e7dffd7c5a1c866d25b7671fb847fe287a72b8b"
 
+# 0.16 is packaged as gexiv2
+UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/gexiv2/0.14/"
+UPSTREAM_CHECK_REGEX = "gexiv2-(?P<pver>0\.14(\.\d+)+)\.tar"
+
 # The command line tool and the python override would clash with the files
 # installed by the current gexiv2 recipe.
 # AI-Generated: this recipe was created with Claude Code.
