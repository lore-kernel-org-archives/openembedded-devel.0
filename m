Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0igH-0007Mx-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 01:06:37 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so861176eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.105.140 as permitted sender) client-ip=10.213.105.140; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.105.140 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.105.140])
	by 10.213.105.140 with SMTP id t12mr75014ebo.71.1330041497939 (num_hops
	= 1); Thu, 23 Feb 2012 15:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qSec3196L7Sz/enChj7tu8t0k3mXJFOzhEHmYC1YrJM=;
	b=VtXCFU8yi3NGzI4F2T16i4weg9MQ588+wsF6aHMw19MIuHYcvPCABwPC+iKmT58xfn
	qh0SYVkQvcbUNEs9KVjD8+XBiar9RFAh0xRGrw1pPKEI/8TvF8VjJoE+r61fDosJwYsc
	IfcWJHNM1CecekbFlxg06IzakG01QP9rVesMA=
Received: by 10.213.105.140 with SMTP id t12mr48069ebo.71.1330041497873;
	Thu, 23 Feb 2012 15:58:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm11225436eef.2.2012.02.23.15.58.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 15:58:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 00:57:55 +0100
Message-Id: <ae5ffb9395228a23b41045fc703e1920932529ae.1330041429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <280e44ecc1bb5cdb682cf9d369986b6c34bed125.1330041429.git.Martin.Jansa@gmail.com>
References: <280e44ecc1bb5cdb682cf9d369986b6c34bed125.1330041429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330041429.git.Martin.Jansa@gmail.com>
References: <cover.1330041429.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] meta-oe: include systemd-serialgetty in SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Fri, 24 Feb 2012 00:06:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 0a3a9ef..cf13a71 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -23,4 +23,4 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_openembedded-layer = "6"
 
-SIGGEN_EXCLUDERECIPES_ABISAFE += "pointercal-xinput"
+SIGGEN_EXCLUDERECIPES_ABISAFE += "pointercal-xinput systemd-serialgetty"
-- 
1.7.8.4



