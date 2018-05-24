Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 45C7A74AF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:26 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y189-v6so2659100itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2XMsB6fINYsa3BjVGu6sS8BMPxiWGHh0ymjY+chXY5o=;
	b=PbSSohFTl61d2EMgbeDaq61wY99tX5q3U8qIiS9sNBVNKfF8OL+O7vlm7a47Bmcl9D
	qPEGs1Pf81Xf+7ikGNf1DsxzSCRVRHs7217TK0ooX6DC4RRV1ip8fOPG3irBrFAp3p7v
	rsq+55Bwyd8mB8YqLExSvJvdaTEEsYz8LYcUx8Z/gtXostlBz5kmvPOHUXEpJ99bwLrX
	IC3vnuOYzrvAO8bTpgxsGtubSbBURUaW5Vc8XsuRCkOWMHQiDVZPghLWMUDwdbNGRJWR
	L1M5m7ZV3qDlf68ObU7klOAMbKyyJsgWV/rxc0ZcYUBpOE2dYkttZmKBtZGVPESA6FJo
	pBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2XMsB6fINYsa3BjVGu6sS8BMPxiWGHh0ymjY+chXY5o=;
	b=aA9KuP+oLlnM3p1+KQZDRYSenQB7RTi4nP/hndLwmjEuawAV1+A0iuHaMJ0dIczg9d
	6kgECW/T4oyc2XO6B/LX1W73UeAe9s+0ot9Y0lY9liIiZ4z/xlrS/YDVP7kCRO0nLIi+
	d2stscTS/dPx45C5oYKU3Z4NBncdOz5+C1Pvgy5U1X9mgQNEWXBzYDHmBHSaQBai7g3S
	8MBpIh4cGInfL4P+jBKRthnH1rSt3tuQme3wMO+hYEwEf7UJetNeEYd0QykdVGZkL//n
	Zf/GOQe6WrsKFemqi4pZdI4B5tBF9QjBn7Z4QYl5sc6H/aeW1EHmezu68+90+1K2PjQm
	7fYg==
X-Gm-Message-State: ALKqPwdfuA15O0WWvBVGXJ2pbWtSdQBVmnEVBtpOVvIWsPCst0a2itRx
	+Vw4I0Et8qbKeYxMKuLXLavHWr+l
X-Google-Smtp-Source: AB8JxZqQp5ndOMLkk7td4IBWKv0tSlx2Yb9GY8GQ2bZ80SwaqyVyHKJ+3m9AgLo1hA1asqpjlNkkBQ==
X-Received: by 2002:a24:a64d:: with SMTP id
	r13-v6mr9262503iti.124.1527172767248; 
	Thu, 24 May 2018 07:39:27 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:26 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:50 -0400
Message-Id: <20180524143854.24096-14-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 13/17] libssh: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:26 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index 79e7dc5998..e5ea2b8bfa 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -30,5 +30,4 @@ do_configure_prepend () {
         || bbfatal "Failed to disable examples"
 }
 
-FILES_${PN}-dev += "${libdir}/cmake"
 TOOLCHAIN = "gcc"
-- 
2.17.0.582.gccdcbd54c


