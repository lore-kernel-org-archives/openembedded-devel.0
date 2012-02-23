Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0igA-0007Mx-8M
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 01:06:30 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so861176eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:58:10 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.1 as permitted sender) client-ip=10.14.45.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.1 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.1])
	by 10.14.45.1 with SMTP id o1mr2013716eeb.72.1330041490710 (num_hops =
	1); Thu, 23 Feb 2012 15:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=59GjTB5M+6JajuxJsOC8m5rUWqlNkaanC2fHZuQxqG4=;
	b=TRIBVYB0g1BZ8qta6hPr6kIwymoljDzk4WXnCQwA57DeDnvAaHZrd54XOq9ZrSfn1P
	xoj/Nk5uquPA9enZIv3SAH7MyXaP90Z/ZJTg9k5exoVw+yLyBpoa6S2HMUvlJ4Lxvt3R
	3TE394WFgCFElBYnbyG7uDxZhrzwkVp8hse68=
Received: by 10.14.45.1 with SMTP id o1mr1545898eeb.72.1330041490645;
	Thu, 23 Feb 2012 15:58:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm11223998eef.2.2012.02.23.15.58.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 15:58:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 00:57:54 +0100
Message-Id: <a1d9f3c6c78233465a89f621dd5122fd25e2ec41.1330041429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <280e44ecc1bb5cdb682cf9d369986b6c34bed125.1330041429.git.Martin.Jansa@gmail.com>
References: <280e44ecc1bb5cdb682cf9d369986b6c34bed125.1330041429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330041429.git.Martin.Jansa@gmail.com>
References: <cover.1330041429.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] meta-oe: include pointercal-xinput in SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Fri, 24 Feb 2012 00:06:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 267616b..0a3a9ef 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -22,3 +22,5 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 # other layers.
 
 BBFILE_PRIORITY_openembedded-layer = "6"
+
+SIGGEN_EXCLUDERECIPES_ABISAFE += "pointercal-xinput"
-- 
1.7.8.4



