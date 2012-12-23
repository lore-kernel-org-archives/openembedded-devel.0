Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkpx-0001ir-I8
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:58 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so3107557eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=vHcvIZFZ96HenPVU0Ts+AzRJQTNiA9lD3rD4GuqB5Fw=;
	b=fkZzb49ub+Zqfhhq3QlrgCfXmtnYMmKjy0G2JOrjqJKtVlKb3dNxEenMz18HmeLpUS
	bh+8yTEiBN9THBuEy1hXNHGf4JY7w+Hm/D8HZehdybxPkaDcYfw3I4ZX0t+3oI/TRkx7
	mF3geq2rG0gY8oQmJ7NftQ4b+AnJT2AoS2cMC3+W4V3QZa6BbwE2OeCRCqgyN41gU0iL
	saDyVzbY3PDyHell+mdnn8E5Rq1PR3SluwbyOgoecjhLjFI2XsEPJVEE7NywyTDcNrbV
	GsQAeQJyfRofmGqFqVdwxX9TWyDLlnUQbXm7af/E6x7Y42I6Wsg+Xf95ksDShhcpOh30
	YvzA==
X-Received: by 10.14.2.66 with SMTP id 42mr48288247eee.7.1356265476955;
	Sun, 23 Dec 2012 04:24:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm34558879eep.5.2012.12.23.04.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:43 +0100
Message-Id: <4a8abf1a45f2fb8b2702e55ba4e9b02989a267e5.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/30] nautilus3: add FILESEXTRAPATHS to find correct no-try-run-strftime.diff first
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:04 -0000
X-List-Received-Date: Sun, 23 Dec 2012 12:40:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
index 5dc4451..19de470 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
@@ -6,11 +6,13 @@ LICENSE="GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "libnotify3 gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
 # optional: tracker
 
+# to include nautilus3/no-try-run-strftime.diff before the rest
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
 BPN = "nautilus"
 inherit gnome
 
-- 
1.8.0.2



