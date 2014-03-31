Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7583E6F811
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 05:40:05 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so7340432iec.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 22:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lu0JceMDzDSBVsEWN0F71HLqpymN8yEOytUOq3bprLE=;
	b=eN5yKgT8bIuuExtoZvGxzNvo+bTV1wn9y+OZoQKI59bMXNylfJmdUxmaSE+E76niFR
	ApEkGaA/FjiHcINhrpX02SKWhwTgLRPX8OMWxTJNx8fYuxgnfa1CXLziTNeh24BcGYrc
	Lq/BotzrYGJGDDEKbIfHNuu7DagBsjpwir4Easxe7bMp9lZG6U1e3qkLPQIUkHPTiMRk
	xlyJaYxE3vmZxHNdMqfqNhBi+pmoR5erxXyRoWAYzqwbYUqbTQP+Lvo/7sjdPSk5VWZw
	+LHC6Z5YdoMOIIP7r9Byi8pZV9OhiRCWabdx8wnBWb0PMBw65k9qziShflMUY7ham4V0
	bQOg==
X-Gm-Message-State: ALoCoQkEvVI45ow1cqtruZiWw2hdc1TNNQOm4T3GscH5GywXbUmr/5DbyDdEJFViwrr03FHjtvtj
X-Received: by 10.43.138.210 with SMTP id it18mr27708291icc.23.1396244407018; 
	Sun, 30 Mar 2014 22:40:07 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id bf7sm23150365igb.9.2014.03.30.22.40.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 22:40:06 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 01:39:57 -0400
Message-Id: <1396244397-4124-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-oe][PATCH] utouch-evemu: force serial build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2014 05:40:07 -0000

My build always fails if allowed to build in parallel:

    | make[2]: *** No rule to make target `evemu-record.1', needed by `all-am'.  Stop.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index 0efe79e..1dd5a86 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -13,3 +13,5 @@ SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 PV = "1.0.5+git${SRCPV}"
 
 S = "${WORKDIR}/git/"
+
+PARALLEL_MAKE = ""
-- 
1.9.0


