Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B39BE74D56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:13 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i194-v6so18079224pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x+PLXfpmGWZv33ThU+hwm/bHZtiov0yEzhsOtaITA/s=;
	b=dT4W2dP7DripraIh4DQH7GiJPJa4FO6CXSOFoT4f/oWf+KiFkmK2hjwe/5njFdssl8
	cKZfTyTJaKgSkhjG1XCkysDurAPlEPm4aEzB5y5Y/qZURFKyEwQPVBNsEAMMtfg6Yses
	SMtsh5buOG++sMSsvKI/G1rGeSnJXJQaEee4pPxofvcajjWwfcHStJhBUDwRrWRvBqvM
	QePgoWaLgRWx660hIipZSEVgP37ivtwZpYGg1Rf8SkW3h20EL7By6XBM16iRaokubVA5
	2XYHVkkrOvrREy042LH/6WvcAthYrIQLxHut2LjzP78Xnm7O5/QcEt77NgToVWrVwX8U
	ncuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x+PLXfpmGWZv33ThU+hwm/bHZtiov0yEzhsOtaITA/s=;
	b=IWoXSDVKuKhnM1VWvL3tnh0ZWd8lXI3hQEU6+ghyQ590LB4JegrJZb7uY2Vy6fHvmG
	K4c7wHLDp3d9PvwQGS9EhOrKQ2ufpYmZ88n8py4peHvtRABez6U04gAB/7x4+ZMuaCX7
	0CwnSIy5UqlcVhsQlpmMmYJNAGknH/E6ZLMNQzU39V0J583U3QA0b9TwY7a8tTV8pQ8u
	sDgamMsXbVO2VbdzO8SsuT8bnNQpCi/fShPlnVszaE+NtB94NBNPHmzxg6L8x8An0vCo
	QLYGVmnYsRJjyIVJ/wYLKJzBnyhNGarQVUcfABnIrHzwj88xnzkOYKosKe/FdI9f/6/A
	grtw==
X-Gm-Message-State: ALQs6tBO4+pt17cwD11tqm4f2VUqKSpMhefRcCKFwR9ce/3R/pXezBEb
	VpxEzQIGbQFUeWPoF/Xhslg5AQ==
X-Google-Smtp-Source: AB8JxZomSUxnQVN5cO+ug/B7LydSCI6irXHM9NNdlSMgXO+g4ujmR9FqBecFqpGwL3ZVJpKisv+yEg==
X-Received: by 2002:a17:902:9a8b:: with SMTP id
	w11-v6mr33834099plp.75.1525587494791; 
	Sat, 05 May 2018 23:18:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:18:03 -0700
Message-Id: <20180506061804.19509-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180506061804.19509-1-raj.khem@gmail.com>
References: <20180506061804.19509-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] libmbim: Upgrade to 1.16.0
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
X-List-Received-Date: Sun, 06 May 2018 06:18:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
index f89ef9d57..5260c0f14 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
-SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
+SRC_URI[md5sum] = "76ea4d8381989919b1d9b91c818fed80"
+SRC_URI[sha256sum] = "c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2"
-- 
2.17.0


