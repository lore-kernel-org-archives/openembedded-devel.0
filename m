Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1196E7E584
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:40:07 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id u14so25160185ljj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=q1B666hrOoQeWn4oG7fiy5OGuTuKy+PzZDnEQdPRuaQ=;
	b=tudtZE1AWutnPDMYcpVZX6JtREGeLJ8+wZX5KDfGx51vYq6+AnGWawoId14sumLqOK
	jqoUfxwjK6dphC7KES7RG1J/AiuQgGB6MgR4opIM390vejBvGjaiN6zCsV4e6QsPGJ3G
	UUw92dP/ksEyi0927jU1VUU5BRrkwo/ssElVhWJCWJUvvUWBNWJ90NDgVRF+9ZS/ZJjL
	jhtm+019J9uEXetZ9Xr6z9YUxGH7Pj/6XGKWBXaHnxw3prpVhX0/nHDWqLIaWbPJuhLs
	tkFCXIpKb2e55q3Gtce+P0YfT5/wKeHDAHGbntlv4LrycLNwRtLsf/tEdwNxbCZ+Fmw+
	2mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q1B666hrOoQeWn4oG7fiy5OGuTuKy+PzZDnEQdPRuaQ=;
	b=Rfz2b/P3TuCO+pdeQdG05hzgbGcFfa8ahmFRT6ZvrCLtEZl1x6rs1idp/7xKJC0T5a
	8WjwdC5TZyK0TpjqAcCPe44yw5q4gTSWGmQgha9Eg8SahUwoer0so6rmU6AwxXGOw6x+
	SZ24rLgHu0YQ/ncKLMQpF4fwI05aJuw09fmr2/zx7PempcYAiXb3/5rM/B3Q/M46BQUr
	QAqUgwevTbNMu0ZKaaNza5AXOFNpGt+GiRiyt+lMfT6vSkO4Qrm7UgElUiay512QQYz2
	cLb3/jZm552/GjSB9SWO6J9oonnQJdNkiYG3YvWPHFdSetRMvSg1ldJyDQ9avih7KA+r
	UrsQ==
X-Gm-Message-State: APjAAAX56XaT5hpCI6U7Uzoht45qxzvwFCpog9NIMwdRWlDn+vNVT9ja
	dSxEZXSLL5jh2s+BFAZwH2gyevCF1Iw=
X-Google-Smtp-Source: APXvYqyiRD0PrXqRq/aW2XzexPxG6fXNzey6Wn+g6hOgKxRjQvBiPadCagx/lc/J3GrUZizHDToJ+w==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr2821870ljm.211.1568328008454; 
	Thu, 12 Sep 2019 15:40:08 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id x14sm946143lfe.3.2019.09.12.15.40.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:40:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:40:01 +0200
Message-Id: <20190912224001.28092-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] tree: update to 1.8.0
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
X-List-Received-Date: Thu, 12 Sep 2019 22:40:08 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/tree/{tree_1.7.0.bb => tree_1.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/tree/{tree_1.7.0.bb => tree_1.8.0.bb} (80%)

diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.8.0.bb
similarity index 80%
rename from meta-oe/recipes-support/tree/tree_1.7.0.bb
rename to meta-oe/recipes-support/tree/tree_1.8.0.bb
index 5eff55263..01b1ac384 100644
--- a/meta-oe/recipes-support/tree/tree_1.7.0.bb
+++ b/meta-oe/recipes-support/tree/tree_1.8.0.bb
@@ -5,8 +5,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
-SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
+SRC_URI[md5sum] = "715191c7f369be377fc7cc8ce0ccd835"
+SRC_URI[sha256sum] = "715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.17.1


