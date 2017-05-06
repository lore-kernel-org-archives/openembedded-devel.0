Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40ADC77819
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 May 2017 19:18:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s62so5016744pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 May 2017 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B+zoP8/ds107j2ZM7jGrLBHSalo6+cTQrclo/H2nSK4=;
	b=tUGceNwziY5532pJvccut64wGL7aE8r6c2pLBeXiSuqWnMPsQYDEhHveEEOyS6CmWN
	0gwhJFO2a6BRKLW4PFAmKE5xurfhCnuv4IYIN+Meo213GjLvz37C0xnu0qyMYW9eFR4H
	eGrz9HpwqO0ecqm6PHnbUNO5cxvFHNXbbv456reld4VvLmYU1cAfsd+FJq+tSGohH77t
	u1e2ngNoNw0aAeOrBh2HKty/MEdYE6VccaJHhZWo55WVPN3ty1bYKw5jvDWCpRNrjcZw
	afjBhmlLIUQPrUOebLKdJLlrm01yO3mileqdAiiMUh1243TxRwZvile71w+CD7yJJiy+
	osRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B+zoP8/ds107j2ZM7jGrLBHSalo6+cTQrclo/H2nSK4=;
	b=drvtwMVMfBsjOzCJr7MnlDe1YrKRV6HEOvcXnuWIp6/Zi07/oosPsGDig4uKpxetxD
	Q1TXm9jsOyDhtx/FrIpv+65ZD2nQizpZl2XwzlPx5zEvlJj5WSyi2tJCztBBIxTAlUkM
	B5RqrK/hY1/r1WBXh0JiO3tV7qvyL9JfYk7t/IgkMpw9/WGvN+GgHwteuyWr4rNVVI7x
	gMtD4TMip9bjMj0qWZeMfIR/KeHqezjkV80Bsid0jYLv1o0gre6rucTjXFErrVBhepo3
	DaYMoTGokKpjTgK9eJtOsTdbTE7RE02gmYx5KxViAmu3d1IN3xQ4oRiNQOfOVIdP9Vbo
	x/hg==
X-Gm-Message-State: AN3rC/631b/unbu5to/71DwRCYD8Edqn5nGKhA7XBJu0zp/SqJQ8iT7u
	tLlva0Pf7O5/Qw==
X-Received: by 10.84.217.215 with SMTP id d23mr41437539plj.114.1494098332454; 
	Sat, 06 May 2017 12:18:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8882:b8c::d586])
	by smtp.gmail.com with ESMTPSA id
	p62sm14237888pfp.48.2017.05.06.12.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 12:18:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 May 2017 12:18:40 -0700
Message-Id: <20170506191840.26070-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170506191840.26070-1-raj.khem@gmail.com>
References: <20170506191840.26070-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] glmark2: Update to latest and fix build on pi
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
X-List-Received-Date: Sat, 06 May 2017 19:18:51 -0000

when using userland it does not work since it needs
libgbm from mesa.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 26c5c0482..d8fc30779 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -12,13 +12,14 @@ DEPENDS = "libpng12 jpeg"
 
 PV = "2014.03+${SRCPV}"
 
-SRC_URI = " \
-    git://github.com/glmark2/glmark2.git;protocol=https \
+COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
+
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
     file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
     file://Fix-configure-for-sqrt-check.patch \
 "
-SRCREV = "f413c5b423250b4fde8f95639ad368d5b02c5b9b"
+SRCREV = "7215c0f337dae0b232535549c37fca441747a891"
 
 S = "${WORKDIR}/git"
 
-- 
2.12.2


