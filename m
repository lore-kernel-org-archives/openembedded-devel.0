Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2Tog-0001Zk-5k
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 22:43:06 +0100
Received: by mail-wi0-f181.google.com with SMTP id hm6so2234711wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GWaES4UtPqXNLlez22mPkwm3kgFoz9SNd6pjB88DeKg=;
	b=w8i6oO6BpZ3I7LDmZH1yDSYM71rI2vx8jMtht96R1TsR3QA0op9/M8MebLBUthojfx
	h6CA4SilILFay4+R3JUTUA7UbWK3Q6xtCMW2yuVKwpEuDYyEztinf91EMgj+uKdWSpm+
	3RPcB98FTPOGXVC+7SbiQENiarV6UtvXfKXkgsDkhJ+RTIa257Xhwen4X0LWqUhBFwM8
	iKhB/JA1coFS6tjDbJ/522ez+PIJYlRLBL8RoJl3ifm7MWHCAE73DG6X+g4RAFn1PgkV
	OJC5wCMVVsJtXp6YUQNlo9S/X7iuRhkcqBxY1ca1cvtIXQoWQ7Ztx3atGb5bd+r5zfau
	PQSg==
X-Received: by 10.180.85.103 with SMTP id g7mr13125211wiz.29.1360013237760;
	Mon, 04 Feb 2013 13:27:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s10sm24132791wiw.4.2013.02.04.13.27.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 13:27:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 22:27:14 +0100
Message-Id: <1360013234-32521-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-browser] firefox-l10n, firefox-addon: use RDEPENDS_${PN}
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
X-List-Received-Date: Mon, 04 Feb 2013 21:43:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
 recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mozilla/firefox-addon/firefox-addon.inc
index 88e3821..24e0c18 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon.inc
+++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
@@ -2,7 +2,7 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-RDEPENDS = "firefox"
+RDEPENDS_${PN} = "firefox"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 95e86a7..2369318 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -2,7 +2,7 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-RDEPENDS = "firefox"
+RDEPENDS_${PN} = "firefox"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
-- 
1.8.1.2



