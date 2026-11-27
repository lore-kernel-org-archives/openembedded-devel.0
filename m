Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11799.1795762957396965879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rC0Cnd7S;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so11576666c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762957; x=1796367757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrsTdzMN8eByYOE4VFfzamxV2Lidl3UnHeiEX4Q4/sw=;
        b=rC0Cnd7SYu8LnNfOdCsuhHDkQtWnWSGnH/o1BxGp+GLw4SCL/2QBWwsbAE1C1NN6Wq
         +R37BIcQws2jt8PIFCxPJvxXpzA2bVV6st1FIDQvvRsKZvs2VbkQtIfgTDUtSZ4EH9a+
         lVArEiRU0yncJAuTKcu8OuCOQo1yLYwHqoHoypItd8iIVQy7AF/CVdDKpXYoXzg/GL7s
         DNrpGxd7P2ruEfli65EzMzkkW4u7qkPe3wCTVV51jUdEaKjn3/oPZD/w+tzNLjOB2C3n
         6IkW/WNObKmv7otvnA3WKgpVioiyXM4Op698WxrQi5yVlwQYNHsvV1dohdiehJBirzwO
         oKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762957; x=1796367757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QrsTdzMN8eByYOE4VFfzamxV2Lidl3UnHeiEX4Q4/sw=;
        b=yIXNXm+M/p+FquzcXwGQG3xI6A1B7efnp/4oeCaj1orPma/Jdm030qVfRrrp8CboXK
         UdW8i4i1L4lZ2fm8DMh5UVT+WmWuNmgaPGEgc/XbkgiuRWtcItwhghnciy8LrdprAdtY
         VOBzAR1Sh8ngGXzh2CYNdNXyCn51NroQoULtSpP2h1bf8RQCIug89ZciUIThRmt8PbWq
         F9q5tEGzDMyCUlUlwJsJGNuDR92WfjdZPHpC0pyTgXuc3V5eail6tWB/DeQffyvTUlOt
         GM5fM57KTRPZVtl7c9ZoJADH+OrowCb5uXUjE4aK2ZManAuBwvlzdw2x3pqg8CLPpY7B
         4uwg==
X-Gm-Message-State: APuU4Z/TTh/rb5kWhyO4AqiqjBjH0RzR3WSHFS2Z5pT2JcuYbs1P5N4j
	+KmCMmAD6PuC/FX2GaKHZO4sfJfsGlh4IakL40xs2tf6iG2YZVikd88QMAw4OVEQ
X-Gm-Gg: AZFdTZd4koKubIwW3whY9+vXbm9IXrRjpKfcocBdn/DNyDkOwGIULpDCTkDYd2Akoq2
	4BIrO1YJ/aUV36l+SgSYEPKH5O3BdKui1Viii8PraB9xNdVYaaxRn7UEGhoI7SaEO5flcrmKIJj
	oINM99c64wfvFiY95FAAb6C8kImD5gLQKopTnwPK+E2x47dTcAGTGdLYxC2oRAnynFmi41fyqa9
	bwrjfGbWrBWGMfbtK2ZK//5+1rFRuDr7h7WXAAVJ1AmoOXFLr4abgrnfNBdxbEOlmWiRuosUu4+
	ikTf8tkwBy3BlVPpIShmFZ2IOUGDj4T7TTY0WOXL+dao0PZmQcTm01LNz5ib+bHCU++Z9oLSM1l
	EniwAo2Jk2IxhzyUlPY6sq9KfsUPe/HkNKqBaP5gliXfsi+SwC7Q41RJ6HL2G0lTYjC144Js7Ra
	Bqk8QY8la+HDfDb8ezl5R0hAdV8Uix0CyYBWkIrLf6h2vZwzuAAEtCk1YuI81Q6SLndFjYu9Iz0
	isfY9uJnMEgiEUq4OCo9c7fykwgZa0b7ub443+mso+v8u4VPxW5eN0QJQ7mUhX/gcnUCWXCqAeq
	gI1G6HXzpoDPrERMNbH57OzpQqZ2ajaMcKfCLDakQm6ltmUmoiYyVo2YHZ2BBB8yvdsdobfAtUR
	7yuLwiIa+0X97/J2FcL2gFxClIDdrEl+/EeXac5JmgF/eLVTiSV73pXjvCFcOhF3KmJeY1Fovhc
	f8dMvfVsG9aOJMh1d8XqFOZ692BFD3BpvMOArH51c0pLsxZ6ecxIrD0Iq3te+NzKpDGLdiM22tM
	JTpz6f3bFRCE8xl3q6gmIDdCekCnQJLz8WKSnS0iqWjg36+vBZJi3Tq1C4WOduXTX+QW3SxOILE
	HtxsvwPJFTyp0AN7JA6xkISNZA==
X-Received: by 2002:a05:7023:a5b:20b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1b5568b9f5dmr21223678c88.28.1795762956491;
        Thu, 26 Nov 2026 23:02:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 20/21] libgedit-gfls: upgrade 0.5.0 -> 0.5.1
Date: Thu, 26 Nov 2026 23:02:08 -0800
Message-ID: <20261127070211.2329979-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133347
Content-Type: text/plain; charset="utf-8"

Documentation updates and translation updates only.

Recipe: add UPSTREAM_CHECK_GITTAGREGEX so only release tags are seen.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gedit/{libgedit-gfls_0.5.0.bb => libgedit-gfls_0.5.1.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.5.0.bb => libgedit-gfls_0.5.1.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.1.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.1.bb
index 2b00f595cd..b6dd9ddea4 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.1.bb
@@ -8,7 +8,8 @@ DEPENDS = "glib-2.0 gtk+3"
 inherit gobject-introspection features_check gtk-doc gnomebase
 
 SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "8ff9380b1796aa141c07f335ac10a405f39f988f"
+SRCREV = "67eeb41199e52e00a8308d556d52c3541de2504e"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
