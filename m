Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeV-0002TC-Su
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:25:03 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+8OlN+cYarCx7DcdZwlS25QO2oXGEAvHO4iMSpv+p14=;
	b=K01uyPiKniwOiFCQ3u3s+1LZpI3J5Cs7bKwmHdKpcmKo0UHMq9Xg2p+hrno6+KRzJ0
	Xe9CW+HA1CGGw/PDT6Pa6n5e0IH8OUbXlLbdwXsGBSO8UZqcRuT6IaVYkAnSgIztjflA
	ByxoWiYs73swTcZiZPbq1+8m0t1WrtA7pvtHh+FgmsraFbOiAgPKhtGXhBG6wANk1BwE
	IFscmpcNySkrpzRp/PHaGbf8t8jAKj0rkdXUibNjZv8QuQENrRhUpr17XID05+cNwF0X
	HQkvQ5QUJ6S/578NO8E3Y6IVDetysGj1X0v7+W4q8mgKL5Iag+no9FAArGVCFicoseEr
	HaWg==
Received: by 10.180.20.99 with SMTP id m3mr7317729wie.16.1344125603545;
	Sat, 04 Aug 2012 17:13:23 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:59 +0200
Message-Id: <1344126001-19256-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 14/16] angstrom-task-gnome3: remove unused packages
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
X-List-Received-Date: Sun, 05 Aug 2012 00:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome3.bb b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
index 14f1998..8fdbec7 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome3.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome3.bb
@@ -9,7 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome3-cups task-gnome3-pulseaudio task-gnome3-themes task-gnome3-totem task-gnome3-xserver-base "
+PACKAGES += "task-gnome3-themes task-gnome3-xserver-base "
 
 RDEPENDS_task-gnome3-themes = " \
   angstrom-gnome-icon-theme-enable \
-- 
1.7.4.4



