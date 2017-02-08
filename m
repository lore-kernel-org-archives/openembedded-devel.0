Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 03D7C71A82
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:37:58 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j13so111431760iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2cqZCggp5cyqllH/1LmJMf3mfT2m3YDZFwd+D+xsx+o=;
	b=If36yRnfJO+jHhoUdr3CU5XThXnV6uVHQ/bZxSlPzTHfcsKLs4VLOzcIQqOcPc2mMU
	/a0iuyuc5uAGs4fUv6GWjhdxsvGLJO3YOAFZXK9Cmi35yDqAmIypCfv2gntStzJpmAKg
	P/VJKkrk9Pxt4QQx3ivpAR1T67n+QWRhGW7NKk+Q/KLSPBTX2yWrXd1JIqfDXBuMFjkS
	17ptm/FJRwimQ13omJ95yI1ZHZ1hZu3BUj2j1jK5gsBualN466HhcfEYOGFLVLsWZI7a
	Me5P8wO5vWGAIHGQTTo2ACm5SESpzG8k5K1J9Nxey8AWLwPihR0Gj6MnFAWHb7Qx/dV5
	Gw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2cqZCggp5cyqllH/1LmJMf3mfT2m3YDZFwd+D+xsx+o=;
	b=TvnHgsSDc7YVwQi4JLYz7pnU1UHJm/0HwEAYl2bu/5BW5mL0f02Skucb4hR7/fU+VI
	peZgodYEPjtIZ7zykAAQmsRKJGhgvZaxx+9XnHaJtm93MJ68CR/v8pKmgvOYa1n+8UQv
	d7u8rFZH2IoDVfn9Dn7re5ZGlr8J1KeEhl52CUTn5GrjIntxoc1PkAB4ECtGglQfd4f1
	a+HHyZQ7ZjYLvtB0vN267ZKNQfADLC401k2ebkBqy6HE5eKTKFJnqUk3e5oL56tUr/BS
	j1qXsqKfi+KcW9ABWKLarpuvhclJCDfRAHFygKsO4XORWWUd/JM00yWXT9x3LCgu1NM5
	H3Zw==
X-Gm-Message-State: AMke39ndWi6ykRVl9h12ongEXurTB+lU9uCsQwJiNLdI35onmFFAGBHQhd2ud3omW11LEUSo
X-Received: by 10.107.158.143 with SMTP id h137mr7605826ioe.43.1486546678878; 
	Wed, 08 Feb 2017 01:37:58 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	x67sm11039035iod.22.2017.02.08.01.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:37:57 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:37:38 +0100
Message-Id: <c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Wed, 08 Feb 2017 09:37:59 -0000

The patches defined in lvm2.inc no longer apply cleanly to 2.02.138
and as no-one has complained, the old version is probably obsolete
and can be removed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
deleted file mode 100644
index 13a866e..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require lvm2.inc
-
-SRC_URI[md5sum] = "c660e02ad4586a1d297b6befbe85556d"
-SRC_URI[sha256sum] = "93878a4ba4f70d9f2d0d919eb85bc51652a58776b5428ec8e7e32769d332f596"
-- 
git-series 0.9.1

