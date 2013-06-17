Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7986A9C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:06 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id c10so2740382wiw.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/B2TM+AEzf2wCLMED06FA2055ZDoHZO4hNqFrZe7amw=;
	b=MskGyuhObqxvQ86fnUaDqMqk2Sg7KlBjR/q9nzT/tmPK7Z0rofOuXo7mRAewGdS8fg
	AaKAODkmypC0JBnUOhYbR5KMgOhlGu07SOVwkS2oUBwFWNQqSsFYYMKQgD65ZWrYCC/3
	iPRkXGhlsZHdlom/z9LrJSdKg3du6aKvT9SKG78XijhKhu5mC0n1xDxWiyfCJlHcD3fz
	C3EUfSQsNGLuD0mwVMLUHYGHbVT2F2XYd5DMDYoBHdm1Kvy02mXIIVuSjEkoUpy5V7tw
	R1FFYC5vt27yHbsU4LbcB1xDXFy4AVpfJUcaXnsksuiWoRvBj4I0YbSN7ahjXqNx28ZJ
	F89Q==
X-Received: by 10.194.63.46 with SMTP id d14mr9127132wjs.81.1371501307649;
	Mon, 17 Jun 2013 13:35:07 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:07 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:51 +0200
Message-Id: <3bbf14c5402b450a7c3c7b88d4eac92f81ed0c6a.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 8/9] klcc-cross: add SUMMARY
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:07 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
index 0c187d2..b30d165 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
@@ -1,6 +1,7 @@
 PR = "${INC_PR}.0"
 
 require klibc.inc
+SUMMARY = "The klcc crosscompiler for klibc"
 
 export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
 
-- 
1.8.1.5


