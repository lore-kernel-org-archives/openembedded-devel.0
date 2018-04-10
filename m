Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B86474A25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:42 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id x4-v6so6226944pln.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9c277O09fIkejMSqXSprhWVFOZ2Aaw0TplO1PHDBa0M=;
	b=ZgJHlc3iS5MFDwEe2h+lwupMaTnE7s/Q0lfp9+tqNIfC3MYDNfq07zJm7/e26SRU/S
	KVjq0lb/f8H7/IkhhL5fGmQ6gAlG517jrZQ2UwUJMC4cBiR0JVuG9v1hPeXsFC6Df7j+
	je/6m5dsKIdmPt9Rm0wY+axr9QTMmO0js9Gx4avyWiQfDe/WaddvrmDfYz7gPN/dSN8y
	/sG1Kl75inEaL42je/aBcoBkCzNeERab7CL+t1bXJr1r4ahJ3Bt7gLcYQTxbU+5jcq1L
	8moQYhn5q/r8GdIgcfBfqcjN22p6QmX2paPReuG4jJW5QFKBBeMzVUnR5a0W3wGvAqlF
	0/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9c277O09fIkejMSqXSprhWVFOZ2Aaw0TplO1PHDBa0M=;
	b=br9ppX+my+q1VSqw2Ez8uGnhKgRUKzflBJL8g0Ce6WfhJfB+HA9tW5zEPdyt0a+9qU
	GyaladA8aODuat3xt0BW/0FlVmwtm/DyinK9N2etuKZuXTOZ06rPv9IbIY1l8249W5jr
	eZqEGgMcywDv+BDOP2UJMI+Gk2I2wZU3dEYJxSuFj6qmXd3EVhw5Yjwlu1LD3MNeCauv
	LENs5dOJM7r21wCHr3C+6lSsdLKOQzKPoW2CQpId7L3wF2oWsahtTlhi/14yiauJyAq6
	xNtOGGwaXv3PFXrsjWjZJ2g/3SNBG+4nsW7QrinDLdNaAiS6uVJDOyCzVr1utf8Z6nDf
	SYEw==
X-Gm-Message-State: AElRT7EVxN2jMUtPc8c3v7YZvXBRfxDf6O5NwzVl+WksVW5DPhiwu0WF
	uwr5Dxb7vwWIzx/MGemvnAQgPw==
X-Google-Smtp-Source: AIpwx4/9Twsw+mrIBi2a9lWiUijY/w0MowXAtD7mxj+90zH2CWPgl0yK4yhrDyXVmk+OWmOmTcpqQQ==
X-Received: by 2002:a17:902:a24:: with SMTP id
	33-v6mr41180814plo.72.1523319764174; 
	Mon, 09 Apr 2018 17:22:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:32 -0700
Message-Id: <1523319756-8431-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 06/10] gnome-system-monitor: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:43 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
index 61af92b..9b6ce17 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
@@ -12,7 +12,9 @@ DEPENDS = " \
     libwnck3 \
 "
 
-inherit gnomebase
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "fcd59867c07f8c4853b1e28d60cbc037"
 SRC_URI[archive.sha256sum] = "f848a8c2ca5e164cf09d3a205dd49e4e4bf4b60d43b0969c10443eb519d0e6b3"
-- 
2.7.4


