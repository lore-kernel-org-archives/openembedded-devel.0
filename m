Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C03707706C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a140so1212571wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H4X+D0Wo2A0Rahw/w8nIKO9GqB20AdOCEewSAO3mRr0=;
	b=PbuOBqaLsOMmEsJSGWB3X6EBEDCJF+sIJ3LJEpoemFOerVdt9PKTbKpuCUG/K70Jhb
	caBrVsjA/TeO6m9ERZrYSTjYha2wgog6vO9nwi+Ef5ZGaehd+F0sUB7MS9dcg0YYkOm+
	+GpoESvWm53RG8fVa/hW1++qxRUdhC5m4sI+S6s7iAYa7imYKcv3JIHYZ5ZdttG6F5Xg
	jNt8Fpw1JrUHwrKUTmyRC8jhM++rhuSb16QiSKYjpfdUvLZ+jjXeeYxc1Wd9dzOd71LP
	eoBojExelDvlY+vRL3kvna5df0itsdgqicT7+QHnMJ8a6LSVKsNuar3SkwRB1asorXmY
	KCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H4X+D0Wo2A0Rahw/w8nIKO9GqB20AdOCEewSAO3mRr0=;
	b=H+m3xJXAFXrVK4ab9uT6NnRgRiDnABgUEnUjCPlG+kH/dBU/n1oxrpSYbuH+XOG+Vv
	V3Ticja/SxTMDk3b/ygVXhzzWP60EEib4xWKqcidRSyWk1by6kLeR5/kWFZLA/J6p2Oj
	tBsbq0d3bVARLNDW7eIi6d0EU2lu4c8/OHsJ5Ddiw5Lh1se6AyLlwn204hMlZc3d3LUI
	2S9mJPyfu0NP7xvmDt1oVAjWeEtTXAWndlb7VgVkp/Cof51qYAUPmGX3BaOhWFd/4ZB4
	ltuHT/TeNV24uhINsXq7phG0NQWA86gLFQgon+uD5XfPMDcNrlfYFvQcOkZ+KWfv89+j
	t45Q==
X-Gm-Message-State: AD7BkJKf/L9yzJk/m8zdWF43/IEx5z49CT5RSGlbzrSG2cLYN/7xZD1m4DeJqmYa7EIcDg==
X-Received: by 10.28.226.212 with SMTP id z203mr15994290wmg.73.1459834742417; 
	Mon, 04 Apr 2016 22:39:02 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:15 +0200
Message-Id: <1459834720-17165-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 06/31] qtquickcontrols: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquickcontrols_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 1e25d6e..900b57d 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
+SRCREV = "85c2d2cce4c7d49bc425ccd0be2bbd9841b7e79b"
-- 
2.5.5


