Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id B8E087CC30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:30:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id h22so9368578wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0T8w1seKTJqXS00GX9xdrtlQzT5QX5o4tDMgHtUHEIU=;
	b=uVF2Tkjuq8xHku/TPSiI0JKOpfqUFYEvUWkledqZDZOMIE33mdh87W12n7n/2LbV2N
	UPzfDJWOnB2MrGNA15ra+wXpJQoXl95eF0rQSTcB6v6vQoTaI6rBvBJ6bobOA0LuDYgS
	B9OYn80NGCvVJUDxo7tMgzBDGow31+6CXk0HBgd+qQfIq+SN23bN6u4BM28psR+g7x5A
	dY9BynD0MLWgaq+Evn4qyzZ6P8vTIjbLwh1XM6DaHrNQQ41pcNuNZ5T6a0DCczh9I4ni
	EvOCSddcUsSFTE4+dID7AohkmmAmhUPVBYSrmFnYPFxrHVuAYTWd8jgTb619KWjh5MAY
	IZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0T8w1seKTJqXS00GX9xdrtlQzT5QX5o4tDMgHtUHEIU=;
	b=Jgsbv7SlFOXoFT8lBQqGnXfxKrLffWbE7nBDeAG6CZcOcF1PS0cy1xKHbDUpGzM80J
	OPRfeetVu7nI0is3Jv44t07k6bAqobFFecM+OXUhI69QXaO2sZ2BIYtklbB0pc+4xMDs
	1KsJ68CthPdGoBY86yOiJQ8F0ihxSUz04NHEV0TJVDbiNjba1MmWTEKLRDPZv8UHnaiX
	NwYU8AN/a7gfjtucq/NwxXZlu0VpD9h9m+hbYSUhaVvQ1RM3CMdPHqch2r5qTmA+n3uH
	WANuZ7hHIPom70dA8mX286w5O9QVVEhdKVk5kSen/iDaGv2OKsL2LAUnCH8uHONUm/FU
	sSOw==
X-Gm-Message-State: AHQUAuY2bCIa9HEuj8eSY0kiwv33lEtnxiby+MqhGC4R0BflhWXnYJ2Z
	pUZS9vX7KqBXMgcL9z6F1+Or088kprh6Wg==
X-Google-Smtp-Source: AHgI3IZfOBymfYKhG2kJa3qZOOaQ7UeziNLq2XYb3yyiuEZ5KdJ/WrPJ5P/ESJfP1eJ1bKV4qpg1HA==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2978222wmj.130.1550856614027; 
	Fri, 22 Feb 2019 09:30:14 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	q24sm1337597wmq.16.2019.02.22.09.30.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:30:12 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 18:29:49 +0100
Message-Id: <20190222172949.3661-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 4/4] udisks: add REQUIRED_DISTRO_FEATURES for polkit
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
X-List-Received-Date: Fri, 22 Feb 2019 17:30:14 -0000
Content-Transfer-Encoding: 8bit

After below commits to add polkit as a required distro feature:
97a1a55 polkit: add polkit as a required distro feature
c049e02 polkit: inherit distro_features_check

Need to add REQUIRED_DISTRO_FEATURES for polkit to avoid error when
trying to build 'world'

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 7cd9992214..3ae8ecc15c 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -22,7 +22,10 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
 SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
 
-inherit autotools-brokensep systemd gtk-doc
+inherit autotools-brokensep systemd gtk-doc distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
 
 PACKAGECONFIG ??= "libdevmapper"
 PACKAGECONFIG[libdevmapper] = "--enable-devmapper,--disable-devmapper,libdevmapper"
-- 
2.20.1


