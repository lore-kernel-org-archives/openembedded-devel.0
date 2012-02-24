Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S13hw-0003ey-VW
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 23:33:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1346543eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.202.200 as permitted sender) client-ip=10.14.202.200; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.202.200 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.202.200])
	by 10.14.202.200 with SMTP id d48mr2574782eeo.24.1330122324311
	(num_hops = 1); Fri, 24 Feb 2012 14:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6TVTzcP+jgKM0kodlxU/mqeRzfyNm/lRGAvAjPEFvgw=;
	b=xnZwB09YTMCdHskTclEr1Dg6bp1rXaJuhj0sk4Lr9Gkp/rEJ1xfddlg3N+vg0t57VP
	iARBnBMEV6EmNvYH6UXm3Ag0HB+SGffsc7ze+dsrtwzgwZ9TCcvWiRjRkUH3kZyhkx2P
	hyvyugmr68F5TX3UW9fxFWoxqfKXuw3Z0HKyo=
Received: by 10.14.202.200 with SMTP id d48mr1915771eeo.24.1330122324261;
	Fri, 24 Feb 2012 14:25:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm23253711eeb.4.2012.02.24.14.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 14:25:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 23:24:42 +0100
Message-Id: <a2a63c079259009a676d5614df9c619b60ff874a.1330122206.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
References: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330122206.git.Martin.Jansa@gmail.com>
References: <cover.1330122206.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] meta-oe: add mplayer-common to SIGGEN_EXCLUDERECIPES_ABISAFE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 22:33:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index cf13a71..7369df1 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -23,4 +23,8 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_openembedded-layer = "6"
 
-SIGGEN_EXCLUDERECIPES_ABISAFE += "pointercal-xinput systemd-serialgetty"
+SIGGEN_EXCLUDERECIPES_ABISAFE += " \
+  pointercal-xinput \
+  systemd-serialgetty \
+  mplayer-common \
+"
-- 
1.7.8.4



