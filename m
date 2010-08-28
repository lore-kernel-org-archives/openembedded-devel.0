Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxy-0001rA-AL
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:31 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648315pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=el4Foqu0u+Zm89q4JygF8IWPFBvCjGkXVCwfsANlU4A=;
	b=BL+rriiAgIhG8h8RCIKxnfDIhuxgecErFmzc9PJ2rZ4N7BMKIY8yZgF7AbQfsf+jsj
	PZdhgAP7Mu9UzgEt9Ef+zVsTi8T6EDYGPVR1Aa6zs1lyanOVcNJPloqn+Bygmycrw6yf
	PCZZK7arj7fRHaKjL7iBaJd03Te+qFZVBrd1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fPKhDotQe+mWnrBC1vrXeSzVu7XQQJLut7BHz3e38OKFoOLLEOWH685kWlkFSgBvOx
	I0W83Y32eB4Z9AmHIWM4Zhc0u+ip+J4esTHDqLuGZvXR/MUhWOeLekeqiVqTt7kPiCJE
	KkI8zXQsygQk+yfy9e9E7Db0bXRQBSZWTUmA8=
Received: by 10.142.187.17 with SMTP id k17mr2625389wff.346.1283027101528;
	Sat, 28 Aug 2010 13:25:01 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:26 -0700
Message-Id: <1283027073-12308-17-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 16/23] meta-angstrom-2007.bb, meta-opie.bb: task-opie-bluetooth is added only if it appeas in COMBINED_FEATURES
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/meta/meta-angstrom-2007.bb |    1 -
 recipes/meta/meta-opie.bb          |    6 ++++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/meta/meta-angstrom-2007.bb b/recipes/meta/meta-angstrom-2007.bb
index 8355b10..fbd7f0b 100644
--- a/recipes/meta/meta-angstrom-2007.bb
+++ b/recipes/meta/meta-angstrom-2007.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} += " \
 
 # Browsers know to work on all archs
 RDEPENDS_${PN} += " \
-         gpe-mini-browser \
          midori \
 	 minimo \
          openmoko-browser2 \
diff --git a/recipes/meta/meta-opie.bb b/recipes/meta/meta-opie.bb
index 0a8ed86..1584765 100644
--- a/recipes/meta/meta-opie.bb
+++ b/recipes/meta/meta-opie.bb
@@ -7,11 +7,13 @@ RDEPENDS_${PN} = "task-opie-applets task-opie-apps task-opie-base \
             task-opie-base-applets task-opie-base-apps \
             task-opie-base-decorations task-opie-base-inputmethods \
             task-opie-base-pim task-opie-base-settings \
-            task-opie-base-styles task-opie-bluetooth \
+            task-opie-base-styles \
+            ${@base_contains("COMBINED_FEATURES", "bluetooth", "task-opie-bluetooth", "",d)} \
             task-opie-datebookplugins task-opie-decorations \
             task-opie-extra-apps task-opie-extra-settings \
             task-opie-extra-styles task-opie-extra-games \
-            task-opie-games task-opie-inputmethods task-opie-irda \
+            ${@base_contains("COMBINED_FEATURES", "irda", "task-opie-irda", "",d)} \
+            task-opie-games task-opie-inputmethods \
             task-opie-multimedia task-opie-pim task-opie-settings \
             task-opie-styles task-opie-todayplugins task-opie-wlan"
 
-- 
1.7.1



