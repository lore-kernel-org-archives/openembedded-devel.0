Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED446D682
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 03:02:51 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id u6so2042575plm.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aQW3i/PiZQQLNCQUz3zPXiyQuroA6EeBhy39hVW8XA8=;
	b=LMayE6iEydRYLLntiESXLGwaT0K6GPLrQP5JBcRaz6NPCHUjMm/x02TKWyWpNKLHJV
	LC/S3u0RxzUW5HuIg0esRYYrD3LtRZtUz95uVxPscqmr/O33uhMyL7rCvs3ufL73izmJ
	OnYBU1hYVjKRxQIPvNc6m+Js55tw0+Wksn5K17WQ7ePaKzxPg0UpQu4JoXf2fk9patPt
	yXFYU5cIUhJv/xSrqICZ+YpNbBNHqCT1Vs5tFm0lWAOWYiwIBwsZHyQlYEdF/HM29hcP
	iFASYluhw1UPDqV37VGcfzkXzzj2ntQMMopATFS9AHblYp4JhFuh3zxsqq+mRbHCddxk
	s2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aQW3i/PiZQQLNCQUz3zPXiyQuroA6EeBhy39hVW8XA8=;
	b=kd5YdlJTNKI+AdzWNsVdjaN13CgSaFFLTq4bcNhrpGmgE6Cod1opbNcHu6B4JFoxhw
	QZK2ZkA3P+sfChTeULOFP6WY86cX7OQN4TR6HQ6FoQ2xU91ynjuMTbemWmlLRCA///F4
	/54JofLFv7xCSuJ1PgswxJFg+zlu9w4U5l7sIWSFlTvEWiaPa+t2qT0qJxOAtr4kQRcJ
	Pedgv310V0nEIpW7jnQdRiU8ca8FwRyXr5IWjWS1leLqxKq4H9vyfIBvRWsFKZ9KUR4g
	AYk0cmLNHlbOsEMIMQktl4isA2KWvS+izyFKgRgKaM7PBHR2Ot+wkTFlclLTEAvXhHvD
	XQrQ==
X-Gm-Message-State: AA+aEWZ8fHYdbPt5lVKRBIjg9clTOMrXEirtTv932X4F8kAhaW1n4nPK
	YS+IPG06W5lKTsPJdsxXEC8/k/qBdKA=
X-Google-Smtp-Source: AFSGD/VqJt1fSzUDE0NvtdM3t/jTTUnvhQ4DiKpQtCf3jFO4FvCp/tsuoIVP98X10xdOlTQ+ZdsdLQ==
X-Received: by 2002:a17:902:8507:: with SMTP id
	bj7-v6mr3866336plb.99.1543546972078; 
	Thu, 29 Nov 2018 19:02:52 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	q199sm10364448pfc.97.2018.11.29.19.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 19:02:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 19:02:39 -0800
Message-Id: <20181130030239.32139-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130030239.32139-1-raj.khem@gmail.com>
References: <20181130030239.32139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] poppler: Upgrade to 0.71.0
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
X-List-Received-Date: Fri, 30 Nov 2018 03:02:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../poppler/{poppler_0.70.1.bb => poppler_0.71.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.70.1.bb => poppler_0.71.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.70.1.bb b/meta-oe/recipes-support/poppler/poppler_0.71.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.70.1.bb
rename to meta-oe/recipes-support/poppler/poppler_0.71.0.bb
index b618f28c5f..371648d1ae 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.70.1.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.71.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "fdb0699e9aa20e81acd1a50701374c8b"
-SRC_URI[sha256sum] = "66972047d9ef8162cc8c389d7e7698291dfc9f2b3e4ea9a9f08ae604107451bd"
+SRC_URI[md5sum] = "b505011e49e922c83f3ffb57ab40bc28"
+SRC_URI[sha256sum] = "badbecd2dddf63352fd85ec08a9c2ed122fdadacf2a34fcb4cc227c4d01f2cf9"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.19.2


