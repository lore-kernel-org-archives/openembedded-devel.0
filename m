Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B45E37504B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 16:48:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id a3-v6so1396246wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1khQS4ggnxI6UWHvEs5Gte0kpFQzjpjVIxZI57dUDno=;
	b=jHWadrheRgn398jomwjmHal3KRw67DH3wjD8n6HUztkxLNtwoKGPfS1DvQVL+fNkkk
	AJGKIngIbaIelRgnb7XedhZ6nyLnxTHpEIUklYXp1OEH6yPQn8gQ79lXjQm3DAkB7TF4
	cRqr/wPdEjbiNcmouFq/qdP7CfVgC9/CIw3SHP5xlbX08BgZmd+7hyX8fUYAdoRS3Pyo
	DzC7tHeOEUT+c6sDQGClTROSJstNNU1h3y6MCmu96Zy0kfUEF3mkQbmbmkQyzqngvyki
	qgSeCpzHJyuS/j0A4xwdODo+8A4p5qoK0g6g9w9pTTwRPdFtfEMRWDYhOlwNhzIGHIa+
	OQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1khQS4ggnxI6UWHvEs5Gte0kpFQzjpjVIxZI57dUDno=;
	b=gZ6x3tWCrBd3LivqlLMntCOWknLoofH2x5SZgUxSrls+TSYlD8uIfTBTSvbtB9z/yy
	pUsXn5i06UuozezurClXP6+UYZRDxDxzoVyq9tab4KgVxbI1bbGiDd6Y4b0swSXUZOQN
	0iF2lFKSR19MCPkOt6KWZXTH2pAYQyo2CwHdqXWi2EayraJkJ7xdFJQ704yWNWTH+vYA
	UHvSraKexzkEIbbwPrXoKoEfjzrtzE5j7i9ZHfl1m4tdhYU8nRDjtIORDN1cdqwNWm+z
	c0S4V2lGRXhUDxQlo0KuqwEM3LcH47Ruapx53FbTwBWLv3I4GZh9nwfMXosWCnW3O+pm
	iXPQ==
X-Gm-Message-State: AOUpUlFv3fq5iIB1gnakDj6/6n8h32VyYukQX8M55OIp+AnuKnDcZkhy
	or+Mhthmqlc4eC7C1mRuOzRhwEe5
X-Google-Smtp-Source: AAOMgpf5t9B0weIQQuADgXNz0se7ShyZaMxYQ2hN4RO1/CD+aJaDpPJBxHuZmhioosNgX2UqFakCbw==
X-Received: by 2002:adf:8405:: with SMTP id 5-v6mr9482016wrf.167.1532364514202;
	Mon, 23 Jul 2018 09:48:34 -0700 (PDT)
Received: from localhost.localdomain ([2.43.248.104])
	by smtp.gmail.com with ESMTPSA id
	x204-v6sm20840239wme.33.2018.07.23.09.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 09:48:33 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 18:48:26 +0200
Message-Id: <20180723164826.29256-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723164826.29256-1-costamagnagianfranco@yahoo.it>
References: <20180723164826.29256-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] meta-oe: update websocketpp to 0.8.1, drop all patches
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
X-List-Received-Date: Mon, 23 Jul 2018 16:48:34 -0000

---
 .../0001-Fix-issue-599.patch                           |  0
 .../4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch     |  0
 .../9ddb300d874a30db35e3ad58f188944bef0bf31b.patch     |  0
 .../disable-tests.patch                                |  0
 .../{websocketpp_0.7.0.bb => websocketpp_0.8.1.bb}     | 10 ++--------
 5 files changed, 2 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.7.0 => websocketpp-0.8.1}/0001-Fix-issue-599.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.7.0 => websocketpp-0.8.1}/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.7.0 => websocketpp-0.8.1}/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp-0.7.0 => websocketpp-0.8.1}/disable-tests.patch (100%)
 rename meta-oe/recipes-support/websocketpp/{websocketpp_0.7.0.bb => websocketpp_0.8.1.bb} (57%)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Fix-issue-599.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch
rename to meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/disable-tests.patch
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
similarity index 57%
rename from meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb
rename to meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 65fc974b6..75a5f886a 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -7,14 +7,8 @@ DEPENDS = "openssl boost zlib"
 
 SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https;branch=master"
 
-# tag 0.7.0
-SRCREV= "378437aecdcb1dfe62096ffd5d944bf1f640ccc3"
-
-SRC_URI += "file://0001-Fix-issue-599.patch \
-            file://9ddb300d874a30db35e3ad58f188944bef0bf31b.patch \
-            file://4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch \
-            file://disable-tests.patch \
- "
+# tag 0.8.1
+SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


