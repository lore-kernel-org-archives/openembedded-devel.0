Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3559F7C5CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 04:59:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n74so4719914pfi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2019 20:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4/pB4ClJzFkKOJyeNKLHXKBlU+zdDY/QGDOj0S7dTX8=;
	b=mkwbkJvP7iAO8mHSYvPlSSZUw3xQjCLlZr1UjV7TuuH+z1xx5QxZt4iSfmkw4/DoMY
	OLHovL+z8E9/T8bHoNDDpg+ihIOp84tW/H4MQO6kTESyglN9PfM8S2iS3KsWzFm/LOer
	59tFZUltbUiBdxnEYRW6bdwO8RcGDK+OKoP4FTCqT/ysCTvDfWdm4Y3lHkapvuhi4I08
	ItsEboR2oaIdTqXjIQbtmHqoORUChI25DPoIbEiZrvfTprdC/paIZFHWeLHnMjVrG+ZH
	zNW0H/oLzalHbsYSBBvi2jUHwR8vMDDLL1F3Lyrad3tJLbveh8NqfU/BHNs2iMQJwgZM
	HPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4/pB4ClJzFkKOJyeNKLHXKBlU+zdDY/QGDOj0S7dTX8=;
	b=WXQPVG1xwP+B59G+Siduvz4BF+zShwg5Y4z/SccnXMZ3gnuD3T8IqGCHOI/tHJWa1v
	zLjtqAam4mJnyRB0vTQv76BDdxlGvlFfmXabRLRsyFnrWOusiD0/fylDhy7z8e+NRBay
	oNhCR8sd35+pxZ/03cKxPXJLvjxCjFVEmu4mZZNfbmTqgtvtDgDvKeIhvBEO0NDt275Y
	UGrFoYJbmbTe8u9Gj0/jmhjud2nbCgZo9Kg/C+YjhO5BtoyseHYTVx28UHRlW1Foi7La
	fvakt88943j9nJSHm+cDZnyjv6lKwQB5SftvUkxo/z48VE2Y/okxfJ1ntjIJLrkH3T0q
	btzg==
X-Gm-Message-State: APjAAAX/De5ML/lEIRYyUgBhzUofS87cz1CbbiqpkxgT8EzorBMAQOfx
	hz7qQLtgvU9tcWsar4nFWqGyaADy
X-Google-Smtp-Source: APXvYqzypo1qIGGdLIz5+xk6SaGHlqw1cOfJ15LUcu/PbtTk3dSUjlj4w8TwdzcRUBSoVhB/a239ZQ==
X-Received: by 2002:a17:902:1125:: with SMTP id
	d34mr24444922pla.75.1551761957930; 
	Mon, 04 Mar 2019 20:59:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::caa9])
	by smtp.gmail.com with ESMTPSA id
	e9sm16750269pfh.42.2019.03.04.20.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 20:59:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2019 20:59:07 -0800
Message-Id: <20190305045907.40923-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190305045907.40923-1-raj.khem@gmail.com>
References: <20190305045907.40923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] dvb-apps: Disable static libraries
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
X-List-Received-Date: Tue, 05 Mar 2019 04:59:17 -0000
Content-Transfer-Encoding: 8bit

It can be undesired linking to a static library
especially when static linking it disabled globally
so lets disable it always here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index edfd164478..ff9eabbb50 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/${BPN}"
 
 inherit perlnative
 
+export enable_static="no"
+
 do_configure() {
     sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh
 }
-- 
2.21.0


