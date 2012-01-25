Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpzsM-0001Tk-KB
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 11:14:46 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1627056eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zphImCjztJmqk8S+MGLkWizDF0kiJh48dToobCHVrK4=;
	b=ob5Rdqu9j0+frV7zaPuIpzoFAlR2kzUvtmtnw1QM9miQL5//PN8QgpRrcZzvLBuuGo
	UlKWX31MEFkyDnQmr8FcChM8YrGoiDvsiczncWtJN+tZskmjiTF2+AhAqvtF+Ulcur9J
	soe/RKsFPUfiR17H5+x8wHN/5qeUVbwWmiRKE=
Received: by 10.14.17.91 with SMTP id i67mr6091216eei.10.1327486022549;
	Wed, 25 Jan 2012 02:07:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm79416319eeb.11.2012.01.25.02.07.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:07:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:06:39 +0100
Message-Id: <b068c10f8a35fbd95e9474ab707ca62aeff3dd2c.1327485929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <a9957f330a7b791a8eba677a2c672923ba4601ed.1327485929.git.Martin.Jansa@gmail.com>
References: <a9957f330a7b791a8eba677a2c672923ba4601ed.1327485929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327485929.git.Martin.Jansa@gmail.com>
References: <cover.1327485929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/3] mplayer2: bump PR to rebuild against newer libav
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
X-List-Received-Date: Wed, 25 Jan 2012 10:14:46 -0000

* libav now produces libavformat53 instead of libavformat52

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 7ed9055..3e4d369 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.8.4



