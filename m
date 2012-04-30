Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKJ-0004G7-Pe
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:15 +0200
Received: by wibhj13 with SMTP id hj13so2124807wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GYXoXEqswZ7a645Pw6onbtLdEiBGTtUDb04VtCDpvWw=;
	b=HqCqC4jsaNXs2YrNIpSza/qpN7fQ2s+9e2k+kFJiiUghYXmxX+3aJf2RUh5jxQbvLz
	LhuEMvm37/jod9TV0DedEyw5VIXU7KZND/UzPP1WIet1p6RgKbngeJYuHy3FusR4wQnG
	DDlo2eS1fpxPB/8BoFNGCpI9T5ryx/j1SS2r/dlXLcI1JrSnwK4ejcEwc4Gq31JbrZCG
	qnvHLauZyd/TiL6VcRtYXqMF3Q1pkFlaMKfn5f1GwaxqAof0VK+lMqICE7cFztWiwZkb
	uwJL6Yn2aI4vJi8wpOk3gto25K1lndSTBJWneITgmo98MpypEmDwgePR6T+iKbkSVzjR
	Ho7g==
Received: by 10.180.90.233 with SMTP id bz9mr26008633wib.21.1335767614403;
	Sun, 29 Apr 2012 23:33:34 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	ev10sm26405559wid.10.2012.04.29.23.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:33:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:32:59 +0200
Message-Id: <f1be53fd686a78f1035bc14133e4aa21e12642d2.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/16] gpsd: move files to gpsd dir as they are not version specific
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/{gpsd-3.4 => gpsd}/60-gpsd.rules          |    0
 .../gpsd/{gpsd-3.4 => gpsd}/gpsd                   |    0
 .../gpsd/{gpsd-3.4 => gpsd}/gpsd-default           |    0
 .../gpsd/{gpsd-3.4 => gpsd}/gpsd.service           |    0
 .../gpsd/{gpsd-3.4 => gpsd}/gpsd.socket            |    0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.4 => gpsd}/60-gpsd.rules (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.4 => gpsd}/gpsd (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.4 => gpsd}/gpsd-default (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.4 => gpsd}/gpsd.service (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.4 => gpsd}/gpsd.socket (100%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.4/60-gpsd.rules
rename to meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd
rename to meta-oe/recipes-navigation/gpsd/gpsd/gpsd
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd-default b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd-default
rename to meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.service
rename to meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.socket b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.socket
rename to meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket
-- 
1.7.8.6



