Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxp-0001r3-Vd
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:26 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so1637529pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=h0G3LjZ4Ic5AflmUgLWbNL102P8DFQ7s4mitIJyDd9o=;
	b=DhhSP6qgvrlG53mXHgbjpK36UlTbJgxCtQ23lrjzIftHIR1kz1GQHJPUF8e4m+yhF+
	GYEq4LPFQ2gzzxjFdAZXpI1qWj5yGfR68OEplgNbajGD0ysZDilqGkBJPmNB5M5hrMmo
	NXlLk6/h2563CMPQ9na5UqqPJ5RwmJcvux2hU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=k1kloaO/q9xQCqElAsy8pNW8kgdQCgs/aRvmIBVCWYlQXkU4vR+D0rgCW7f/1Rk/HN
	9+cTpUKPL5P4DLBfcU2tzoRMmzKkPcadY6P210fQi4o1JsA/qx01d+uiadanQryMjMOH
	aycujQmY8Df9Q2IlHUT+g1/huCkXofZn/et3s=
Received: by 10.142.172.1 with SMTP id u1mr2652811wfe.322.1283027093834;
	Sat, 28 Aug 2010 13:24:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:19 -0700
Message-Id: <1283027073-12308-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/23] task-gmae.bb: it uses XSERVER but doesnt really define it so define it.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-gmae.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/tasks/task-gmae.bb b/recipes/tasks/task-gmae.bb
index 1638c98..27f8f7f 100644
--- a/recipes/tasks/task-gmae.bb
+++ b/recipes/tasks/task-gmae.bb
@@ -2,6 +2,13 @@ DESCRIPTION = "GNOME Mobile & Embedded Initiative"
 PR = "r2"
 
 inherit task
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-video-sisusb \
+           xf86-input-keyboard \
+"
 
 PACKAGES = 'gmae-core \
             gmae-toolkit \
-- 
1.7.1



