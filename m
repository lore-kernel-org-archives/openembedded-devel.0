Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id E411F6E630
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:24 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id j35so4997821qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8FmbkeYpc0I4cpL9FigXYAsc/X44NGGxlCnUKF64DoA=;
	b=knfqe5IO7k7LuE/u1vzdkmN3Vk56TYRP4h4BDkiLYREv+FdrZym9GpafOchgB7RpB9
	1Yxohppqf1+FBSvdPkWmMc2BuI2TmHR9Ydr2EAWjH1vP2pnRLqkgoVpuohFykJEb9Qa6
	hSna8H6hZiGNuTLaE4qeSiwUy4IjB6C4gO3iiBJHL0bAVVGnKqzBattUHzIlIpuHA6w6
	oue2yIIZPb/z4kJuAIn/DzKn3tiDIhd+DdL3IUAZOLW5yygfmR6e+LDKcoz3lZoq1clD
	To8X42W1km1yHxr1AzlK59YUSnBVGYKbuy9jgv1j8ZMXIM1bJlf8fUsd1dHbTWn0f3yT
	Wmeg==
X-Gm-Message-State: AD7BkJK3Sw0F1U5qd8erx7ucxFO647YcFfdbsqEsudYb2WhiiSSRpT3HXWJXuRQncMKTSw==
X-Received: by 10.140.171.7 with SMTP id r7mr24685803qhr.79.1458997525685;
	Sat, 26 Mar 2016 06:05:25 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:48 -0400
Message-Id: <799595d166829555b2659d9d5d4ca72353cd2777.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 28/30] python-pyyaml: update to 3.11
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyyaml_3.10.bb => python-pyyaml_3.11.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_3.10.bb => python-pyyaml_3.11.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.11.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_3.11.bb
index 7f20e8b..a017e0e 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.11.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://pyyaml.org/download/pyyaml/PyYAML-${PV}.tar.gz \
            file://setup.py \
 "
 
-SRC_URI[md5sum] = "74c94a383886519e9e7b3dd1ee540247"
-SRC_URI[sha256sum] = "e713da45c96ca53a3a8b48140d4120374db622df16ab71759c9ceb5b8d46fe7c"
+SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
+SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
 
 S = "${WORKDIR}/PyYAML-${PV}"
 
-- 
1.9.1


