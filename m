Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3FC7F969
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 21:08:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id b3so12999643wrs.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LMg2Q7oubquMKy8J6zjImuMspWGS4EXwHsFnT53i1Kk=;
	b=nXJHcezqOLztwRhHMYEfSC5BLeJZB/ovDAtoKoPEM7NRnmLkS9iWhnBJR5VQD4TPHN
	9dgzmkPBz6Ioz6xMbuwccz7NOX9bRKof9HEYrgMqdB8TJNzJ3Bfw4csw6Kyj13oR1Qn5
	MqCq7kovR819yJtZCtU5UTWNZoU2eoShIoGf1Fg7/QtJKLhioqd371GvS/98P4FE3YXs
	31Hm1sCewOewHYyI109V3xp1loTsQzKuHSm1UQ3ICd+0+YtggQIWhhL1b2TqWlwkdhxu
	J8NoYL5QdzcTw93gqTR0WXCQIHh1U9vsZ/dDKcu3MnC2Cy0sqkgj79DSrsNRjVZXEcxB
	DHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LMg2Q7oubquMKy8J6zjImuMspWGS4EXwHsFnT53i1Kk=;
	b=M0egfJBp4lSRHtL7wtZDXXQV2x1w8tIQ3C0vTX8m6z2gNOLC/w7UHSqVB9US52SqJB
	EyB1e5PLG0JfmAs+v80PzOIAYowdgns6XEc3XhPsCqrwnziwStEKyBNvsT82SzaZyXe1
	PCM5rgybXUJMiIpcym9sK3o/shjT23KhrO99OliTMOccpKJBxsUs3YE8OPY5uWpv2VLg
	PXHHVVobEDZDJua6XHzlXEwEsOXJgWGUOeUtwemkpYT4lD79tNhMIhxzWc0hM/RIU0bt
	J8Rtn881p6G2RR5X7llV1AmO6sDtRby8r12OvJ9CzydqCNwbXjOQ6XFeBRPg5iH7nnId
	rnTQ==
X-Gm-Message-State: APjAAAWJ1t3twPfZF5e4y2/hgUt/KMcPGEefUlQOydPzexgeqA1KISxS
	4QbRBRR2msFyGL19nMHLZBMH+uIC
X-Google-Smtp-Source: APXvYqxjyq6915nHeM51FC0kTGre+MVlVIKYxB/ZLDPp1xRLkn6cb7THNyz8ahAgAswS4S88323PTQ==
X-Received: by 2002:adf:f686:: with SMTP id v6mr26596216wrp.141.1572901719303; 
	Mon, 04 Nov 2019 13:08:39 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	r5sm17398952wrl.86.2019.11.04.13.08.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 13:08:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 21:08:29 +0000
Message-Id: <20191104210829.65166-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104210829.65166-1-alex.kiernan@gmail.com>
References: <20191104210829.65166-1-alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] ostree: Upgrade 2019.4 -> 2019.5
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
X-List-Received-Date: Mon, 04 Nov 2019 21:08:39 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 .../ostree/{ostree_2019.4.bb => ostree_2019.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2019.4.bb => ostree_2019.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2019.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index 4be02220af87..af782d894d58 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -31,7 +31,7 @@ SRC_URI = " \
     file://0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch \
     file://0003-tests-Avoid-musl-failure-with-cp-a.patch \
 "
-SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
+SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1


