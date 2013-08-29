Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB8C6BE60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:01 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so340903eae.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6g5GlyY7uF/r4QoCxO+Noj5d2IXBhqLb0pEdZGvuRJU=;
	b=0Jl2H59mcOstUeVtzzgJzJ3iIpJ8sZGzgn3JZFmt6ufIPJSEphjgLPybxjK0vZYNG4
	q69hrWpXfnOq46rSY4yHSa3VOdaCc4OHOrMc9iNivZzSsiMTCxpTsj4cNrQq8+gahaEC
	SVXNyqyu6HAX2a6NwxdzyA0I9HgrRVOdYPPzSbjH4zhl1RC0v8PSkwLX+04ZDhp8ra/M
	yBX6rQfDfXJBUzWsodDUqHtmy3tqC5T6ui7MlSPvWck0pRDg35OuB9RlRG0LrX6tzqIY
	UQNjfB7wchaRvubAQwL1fRfmlydM7Qh7qMWMgO+z0+RIN4Qcui/2IXZilmFV0nwfEcco
	syVw==
X-Received: by 10.14.99.193 with SMTP id x41mr5400209eef.52.1377791521630;
	Thu, 29 Aug 2013 08:52:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm47165643eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:47 +0200
Message-Id: <4307151532ba9fdfa3deefe1649b4901e43ef889.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 54/66] packagekit: Add PACKAGECONFIG for service-packs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:52:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index c8de9d8..7d9c2bf 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -18,6 +18,9 @@ SRC_URI[archive.sha256sum] = "0eafd1be5516a41ebc0f0c3acff0b0763da105a4178b5eee0f
 
 S = "${WORKDIR}/PackageKit-${PV}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[service-packs] = "--enable-service-packs,--disable-service-packs,libarchive"
+
 EXTRA_OECONF = "--with-security-framework=dummy \
                 --with-default-backend=opkg \
                 --enable-opkg \
-- 
1.8.3.2


