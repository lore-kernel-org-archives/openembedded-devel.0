Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE047293D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:31:26 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so10179648wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 10:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s2NaWouQI5sIblzeOmC9rLZbHCRUmF8pquWfZaJZJRc=;
	b=EPxb1mwHDzCsv/L1v7RLowDKfZni1mij9qWOliMPN2fyFvRQJIrPrMcaeteY8dLpYx
	0KcvTTAruwTTt/im5nf0I9uqpW1hhrpyCf1TmZrKqiol+VgpJEonGgFrGxXd4HrTfdI0
	Ax2nc5KXEJqErSOMoSlr3qnbn6eyVdQPiuIGFQnY/Pf/8YyugQTLDM6uecKTZ+BKF7ka
	DEKv/yev3xPX+W0LkD66evDGoCDVOL+hxUHep47lrh4U/30l4waTkBmvFL8RzvLYHwA1
	bAi/BC+1wkt6HVQJ6CCNcIrGLlDAqKCcbp33j1KFG10oFovqDXajjucgEwbGGtj737x2
	6IIw==
X-Received: by 10.194.2.240 with SMTP id 16mr182300787wjx.108.1420569086043;
	Tue, 06 Jan 2015 10:31:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jp3sm14921579wid.9.2015.01.06.10.31.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 10:31:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 19:31:25 +0100
Message-Id: <1420569085-9816-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1420569085-9816-1-git-send-email-Martin.Jansa@gmail.com>
References: <1420569085-9816-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] efl, elementary: upgrade to 1.12.2
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
X-List-Received-Date: Tue, 06 Jan 2015 18:31:30 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/efl_and_elementary_1_12_2_releases/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{efl_1.12.1.bb => efl_1.12.2.bb}             | 4 ++--
 .../recipes-efl/efl/{elementary_1.12.1.bb => elementary_1.12.2.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.12.1.bb => efl_1.12.2.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.12.1.bb => elementary_1.12.2.bb} (79%)

diff --git a/meta-efl/recipes-efl/efl/efl_1.12.1.bb b/meta-efl/recipes-efl/efl/efl_1.12.2.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.12.1.bb
rename to meta-efl/recipes-efl/efl/efl_1.12.2.bb
index 6b79a1d..0d5b090 100644
--- a/meta-efl/recipes-efl/efl/efl_1.12.1.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.12.2.bb
@@ -6,8 +6,8 @@ SRC_URI = "\
     file://0002-evas_3d-Add-Eet.h-includes.patch \
 "
 
-SRC_URI[md5sum] = "ac784b11bd1854459c05a78d783aae57"
-SRC_URI[sha256sum] = "c1074c91e98e15fead0e1999bf7bc7dc5e7205a790655cd9b0ba332c38835fce"
+SRC_URI[md5sum] = "27b8578e5797ee2c484d886fb49704f2"
+SRC_URI[sha256sum] = "dc4a3fe448e0a8019030fe7c045de30d9ac1e92033620fbfbefb761c3ba9ddce"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.12.1.bb b/meta-efl/recipes-efl/efl/elementary_1.12.2.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.12.1.bb
rename to meta-efl/recipes-efl/efl/elementary_1.12.2.bb
index dd7a9a9..9e6f2ea 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.12.1.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.12.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "26af05e3c30676cc761566a3cb7e5611"
-SRC_URI[sha256sum] = "65a5274e21355dcdf9182447013c5874391faa2791d46aa96551050d298208dc"
+SRC_URI[md5sum] = "b01329104e8eb61be1581e24a1951eaf"
+SRC_URI[sha256sum] = "b1b84dd061b6e93f38bbba4c91ea4c9b5de5d190828b5c00fb051a6e61834b62"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-- 
2.2.1


