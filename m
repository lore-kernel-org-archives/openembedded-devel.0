Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4BEF78635
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so12948296wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iJQdVlqo3381YzAMJj24j/8AGXPChMWy3fFu6gT5m6s=;
	b=UdJ4gC/IeQkuD3oG5J9bHQz0eFyFMpKdg1v64Xck2ZkAZ9MyupphEyhgaW7pNGSAR3
	EzQGC1vCN2XIG9MH3rUOZ99w96q1jsGnNoDBLQSnud/WQ5BGSwa73JVCftf1drPZA5fe
	3bP7HdKWnLTRtp7P7qVTHEO0mT9NwbyAAPXqlNOJJ9o4Mt5qmcEF9m/jxkCRbeeJAg+g
	v+fe+wgZV7R3LYbG6k3yvDntmJJFgWSlodVtzobPB5Fc0umW1p3Fb3nWvpBZgyi08TVl
	KFEatI7BalY4o6y1ToSeqQqMjPgE+r/kayspIxQfCQczH8gA5OH9DvHyB3fUT7AbrO92
	YKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iJQdVlqo3381YzAMJj24j/8AGXPChMWy3fFu6gT5m6s=;
	b=g8hPkJzNEJeL0B4BG80pj7DbHUxkyF+3WOTqqJtVSjjvfXB3Y3tFkDmeawB0zr02f5
	bz3W7Ti+/TUqJO9qMuMTxQERolbu52HWTNf8EnDR58roKYrhnuRYXGEfP8XYi4ccO7cx
	lxRj1cul+C/SCWAoFBSdiiWPo05hiC0XUW0c1UJ3t7fBFESr8wjTqVbSW22ifm4Hqrhx
	PoLSlVCJVQ+nxVDRRDO514ffgaO/qgWGL+7/dLbMSjruYZBZVy1AfOIslk6Q5z+6TWuv
	5vkdFwA5KqEz9dwCWdHnLXOqOSoZLjrkAPu95V5nNrMW7diBeLKKf25OGky+UrKYUoJK
	lfxw==
X-Gm-Message-State: AElRT7Gl+L30oco7OCbfGbFvRZK9PnHtlDWgcUZtlGCAfFEdJQ03+dPU
	IoNHQtILjaGFmyww9NXU6avoxA==
X-Google-Smtp-Source: AG47ELtKs0SJa5Y5CNqnl3PLd8wkO5MMFihpNuPKxdF5JIgp1JHWs/k61bR9Bd8dd1U3eQBb0nIJtw==
X-Received: by 10.28.158.197 with SMTP id h188mr13533379wme.72.1521981338715; 
	Sun, 25 Mar 2018 05:35:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:07 +0200
Message-Id: <20180325123520.16452-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/20] xfce4-settings: update 4.12.2 -> 4.12.3
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 093be0a93..bf9bd3102 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,12 +13,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.2 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.3 \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRCREV = "e097ea5f95f8cbc3f23b6558aae2b772d6322591"
+SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
 S = "${WORKDIR}/git"
-PV = "4.12.2+git${SRCPV}"
+PV = "4.12.3+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.14.3


