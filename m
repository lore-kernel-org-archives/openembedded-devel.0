Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 67DA06ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 11:33:50 +0000 (UTC)
Received: by wiax7 with SMTP id x7so14160785wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2lmmEAsb7WVq1ndyAxLoVrx9dbP6swLGXhWhwtmiQJU=;
	b=ovAmF4S16uIdQWQOJ/4Qp0yPt5V8k/qpEn7u/WFvQvKSp88cvQGWaFc1WMfg42BuBq
	AwFEvlpmTe7vYh7lxbqaXP4s4XARp7zUAMddaY953/xdiJ18/zmf/eCX+Fz2qXHLfrca
	e44X10Nlx1PO1c9T+TQqxLHus1lyMWo2DJTj4db8qw7BKvNPy0iUqGRZU2wGoYmLuqO2
	P95oIZZv5pQ4IolckFpHdi18hW93NUUVluzzS9nThigBzC3JF29EFTeHd+HqH0ytemrO
	wYBsHfX4fgqmANz1UvVrla4CGffxiU0OL/WO8/lEdYPFpbx1dY9ZG6ySQ0RMh2TxVUmp
	ub5g==
X-Received: by 10.180.208.84 with SMTP id mc20mr4201143wic.38.1428665632092;
	Fri, 10 Apr 2015 04:33:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l1sm24427487wiy.20.2015.04.10.04.33.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 04:33:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Apr 2015 13:33:49 +0200
Message-Id: <1428665629-15335-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1428665629-15335-1-git-send-email-Martin.Jansa@gmail.com>
References: <1428665629-15335-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] e-wm: upgrade to 0.19.4
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
X-List-Received-Date: Fri, 10 Apr 2015 11:33:53 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_4_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.19.3.bb => e-wm_0.19.4.bb} | 4 ++--
 meta-efl/recipes-efl/e17/e-wm_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.19.3.bb => e-wm_0.19.4.bb} (80%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.3.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.4.bb
similarity index 80%
rename from meta-efl/recipes-efl/e17/e-wm_0.19.3.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.19.4.bb
index 489cb2d..7082519 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.3.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.4.bb
@@ -15,5 +15,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "001b657528aadafcfae5b89b2c81aee8"
-SRC_URI[sha256sum] = "9d2e3c9e25dd48a8f5948d9c7757863d40f7b5bdbc13fdca5a72fb050e048dec"
+SRC_URI[md5sum] = "f442ae743d7f698aeb78d245dbc57357"
+SRC_URI[sha256sum] = "1bada8285d9125820a71bc8f5ad9d64b1c07776d5ad31dffe7758f4a9e1def06"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
index f4b893b..9eb839b 100644
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-PV = "0.19.3+git${SRCPV}"
+PV = "0.19.4+git${SRCPV}"
 DEFAULT_PREFERENCE = "-2"
 
 SRC_URI = " \
@@ -11,4 +11,4 @@ SRC_URI = " \
 "
 S = "${WORKDIR}/git"
 
-SRCREV = "19e59b6e8148388e7a17f10d4390176a50e2917f"
+SRCREV = "4545d4a70031e0b2565b8d83d5f756bff1a584d0"
-- 
2.3.5


