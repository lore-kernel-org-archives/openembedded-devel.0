Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id E8BBC7F343
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 05:06:10 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c19so56862068lfm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2019 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mNxTA3cDSSNEU5NisnP9XmVTzqaXnc0knASz3KvHpkY=;
	b=Srn2372gTg587jh2OOPhkuh6qsvhj+g6l4J6CZaVyYrzqb9dCn+I3aHd2YmjXYC3Bx
	nOk55P7bXOuM9RRiuwjWrLspr7eejJMhc1HqiTm7wEZfQPOTc6+M0E5tLdTjzkN8kPjY
	RNpU/3/tBC1Zghl69vtNU5vDW5/CLN3mf1u+gvTfDP722lutnwMDpF27PYMTM44YB73D
	jWsPi/ZzoI5iWA5s1r8jZvV1uG9Qfwu5cDrRu9bUx4NpFsact5LWmZef0VysxLLo/Q+t
	IUju+ddl6ANMwqiOuZ3QQ3kQfSfPciJYebiLs4eVrmlD2rl32OxrZ9C6BhWO8FjAxroP
	mYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mNxTA3cDSSNEU5NisnP9XmVTzqaXnc0knASz3KvHpkY=;
	b=AIyRpO2WrQBdTHOiVln5cfUD2fMR4IIBGNNYnJAt2RlfCzL1hVUueWNiKUgnVOHCFt
	N6O0YHh/w/wxZS8xKl/t3/sJKHgNw4t7qHFy/SAjygyXUxs89cP2cYFLa7U2JP3Ispkn
	mVdHYAgtW+jnv/RzfiPkCHxKLrDEHAnPBwdcVVGrOki4vSqHkI+feFfHG1MjNsC1WgOx
	rwz+9LpXp3ofV6DnqnACxAURM50ZFK/L+QXRveUv9Pu3iV5QtO9SEtBEbVjfk72xNRUX
	E6IXaLjxPpfg1IYqfsac1ZJ/Oy6GJMaf15n/qyMRfqyc9i3lV4b1643mnlTRA4dU7lEf
	Jxsw==
X-Gm-Message-State: APjAAAXbZr8FR/G/3Y6oBJfQDvoE7DBJh8SRMcrOcE7BRmxvqnaFzI+1
	1g/IHX4qghQSvcfE3+N7yoiz0lYw
X-Google-Smtp-Source: APXvYqyK8ip4DxdP6168l6/y9Te4bcU8cjwzOUSvtBP1gHDYeWOrVcIOptas9T+odE5vZ+d0KattSQ==
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr18769919lfp.72.1564981570893; 
	Sun, 04 Aug 2019 22:06:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	u13sm14541090lfl.61.2019.08.04.22.06.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 22:06:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 07:06:04 +0200
Message-Id: <20190805050604.26541-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] dhcpcd: update to 8.0.2
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
X-List-Received-Date: Mon, 05 Aug 2019 05:06:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_8.0.1.bb => dhcpcd_8.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.0.1.bb => dhcpcd_8.0.2.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
index 6438daea7..79d1dada0 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
@@ -11,8 +11,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
-SRC_URI[md5sum] = "b9c3b3a116f1abafc346f80cb511f8c1"
-SRC_URI[sha256sum] = "031f4fbef5ad41b44714fec343ff5be898e3e3cd5e7c53d6ef3aaec43cdba931"
+SRC_URI[md5sum] = "c0375a1f725f1c191b43af60e4f7175b"
+SRC_URI[sha256sum] = "33a26ad561546cd2cfe1e6de6352a85df72b41c37def8c7eb00e90e57c627a5c"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.17.1


