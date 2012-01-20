Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RoMvv-0004pG-CZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 23:27:43 +0100
Received: by eaa1 with SMTP id 1so311158eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 14:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dMkWWuFThWSHeeXT5aDgrY8+JOOzSXJwTZi0pqeS7o0=;
	b=ryeoCa9naCeFZFZAY+GO3YAFLy1iyh+6VbfEYN/3JYb8ue6rTBUHF1DPGxA5HW26Zj
	cdbBnCRf13P7ML1mPf6WmOqO5qMT9S0XM1k5vnlMdqdgv7p/VRDsM4L9gYAxJnqbQWjU
	tNGNrLgblI6PRc5crkZsVQy/fY1BQe+s/S8Jc=
Received: by 10.213.8.135 with SMTP id h7mr39352ebh.52.1327098001714;
	Fri, 20 Jan 2012 14:20:01 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b49sm17012582eec.9.2012.01.20.14.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 14:20:01 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 23:18:10 +0100
Message-Id: <1327097890-19037-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH] Add missing librsvg dependency to abiword recipe.
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
X-List-Received-Date: Fri, 20 Jan 2012 22:27:43 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 2d0ec97..07fd989 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -1,5 +1,5 @@
 require abiword-2.5.inc
-DEPENDS += " loudmouth libwmf-native gtkmathview asio"
+DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
 PR = "r1"
-- 
1.7.3.4



