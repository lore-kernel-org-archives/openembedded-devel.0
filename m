Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2677E0D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 17:41:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f204so2921372wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 10:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9krp869zgdlXB7Ga4WMROvwyZQO5Q/AcM8UqOZ5LS9s=;
	b=MYhdteruAxKxJ9OtzmoCQeWFGnECQKMToVEJFQXZtRYD+uqs9Q4cAlSc1KSElt6ViQ
	sv/OizlIOxh24Ep+dJAqVIL1qlN07zLqN6sgaTpYHwE0k4518diJc74/8PIogFo4hnOr
	r9Nj/CyeX321hn9ib0liWHVHefrF6jLPcojpBewq7K6RvMP+3JcV5ashukn8ePbpccNi
	jGYRYACWf0FLv260TPbbmErJ8uph4TurqMrR/OJdUebuqhu5opmNs13PCa99vv/Xy62V
	5s9nkkLwdYNiGgotMl9oC9fAcMguxpGINQbUnOxYNj7xj9GrQdq6GKdC3IM3+F/tSvxb
	XOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9krp869zgdlXB7Ga4WMROvwyZQO5Q/AcM8UqOZ5LS9s=;
	b=UkXkGK5HKzd1vGABdyTWUCLm8JzKNYgc7VNM6XhnP17O+WjyH19XXyrp2BclkNUUNq
	A0tBWlDmN7Ib8VEUe5Dt1hnCRtLZTR7XW1CIXIMrnKyoqNL5ObPL4mgk+JZu9LqeIJbv
	hXboD1BeXoY8+X5VAVvJkqETKht5MoGomj3kjQMKKpvv8dgVj+VsOiBJAbIP2DOsyoub
	uVU4aa7zBIv4Iwj4sURiSFCv0qsmitkg41xgPpqNEwpiOubpleQIkUc0UTjR79BwkO0Z
	BhDJni3QhcTs293im9+AIH8l9WSbi+uZqvz79KOFiF6PzY8jfPJ7bgp4khtFx620Wi6i
	6vyw==
X-Gm-Message-State: APjAAAXtATqoYs6P7Q545rgeDAx++1XnxXnVFw5x5Dnr1JVDwrrKV/w7
	ba4PmV+17iARg54oAwX2DY5qbQ==
X-Google-Smtp-Source: APXvYqzK3LYFRYI9PsWAlPx8QPpMOlD1EPs76AowO+CFIw0VL9vPmZJ/gAmMMsfVAG+s0I/QtrGecA==
X-Received: by 2002:a1c:dcc2:: with SMTP id t185mr8446803wmg.143.1557510074071;
	Fri, 10 May 2019 10:41:14 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	r64sm14238887wmr.0.2019.05.10.10.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 10:41:13 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 19:41:02 +0200
Message-Id: <20190510174102.19015-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][warrior][thud][PATCH] cpupower: remove LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 10 May 2019 17:41:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpupower is a 'special' recipe since it does "inherit kernelsrc" ,
which essentially means that it doesn't have its own sources, but
reuse the kernel source tree, from virtual/kernel recipe. As such,
checking the license file in cpupower recipe does not seem relevant,
since it does not fetch anything (kernelsrc has "deltask do_fetch")
and the fetching is deferred to the virtual/kernel recipe.

so we are basically checking the COPYING file twice. If there was any
license issue, it would have been caught by virtual/kernel recipe
already.

Hence we remove LIC_FILES_CHKSUM like it is done for perf recipe in
OE-core in meta/recipes-kernel/perf/perf.bb.

It has the nice side effect that BSP layers can use different kernel
versions without worrying about any LICENSE checksum changes in
between kernel versions.

Reported-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7142f09407b81c2221bbf1c5078641ab4bc63ee9)
---
Armin, for our use cases (at least) this is a bug fix, since we use
different kernel versions in our BSP layers.. I am hoping you will
agree to merge it is -stable branches. If you can apply to warrior and thud
where it applies cleanly that would be really nice. It won't apply on sumo, 
i can send another patch later for sumo.
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 928973871..abf1585de 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -2,7 +2,6 @@ SUMMARY = "Shows and sets processor power related values"
 DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
 saving related features of your processor."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-- 
2.20.1


