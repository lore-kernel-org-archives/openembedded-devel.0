Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1RVRTb-0002xl-KW
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 18:28:19 +0100
Received: by eaad13 with SMTP id d13so3390980eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=VblT145YU+LKZhVHYoYVynJVUmidkRWp8H6oB0ev8hg=;
	b=AhbEiT9hT/rVGPbGPY3349IOqRaF89gijTQ+tIMRSVk0XaiPapkTJAopv/y8GhXJVk
	Hg8/iOufE69ok9ixJ+G1yDmqtWrwx2WD9ARZ7sJVyZwkejwI/MDDn5oObMthHaeVvhyQ
	AKTmQKoRjhacKUkTNgyrVUbJ0GdaER4Rgj5X4=
Received: by 10.213.5.20 with SMTP id 20mr1046118ebt.144.1322587295407;
	Tue, 29 Nov 2011 09:21:35 -0800 (PST)
Received: from wunderer.oneaccess.intra ([92.103.82.100])
	by mx.google.com with ESMTPS id o4sm107304860eeb.0.2011.11.29.09.21.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 09:21:34 -0800 (PST)
Sender: tristan <blunderer@gmail.com>
From: Tristan Lelong <tristan.lelong@blunderer.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2011 18:21:23 +0100
Message-Id: <1322587283-10162-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH] libroxml: Add version 2.1.2
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
X-List-Received-Date: Tue, 29 Nov 2011 17:28:19 -0000

Fix some xpath bugs

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 recipes/libroxml/libroxml_2.1.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libroxml/libroxml_2.1.2.bb

diff --git a/recipes/libroxml/libroxml_2.1.2.bb b/recipes/libroxml/libroxml_2.1.2.bb
new file mode 100644
index 0000000..8fb4210
--- /dev/null
+++ b/recipes/libroxml/libroxml_2.1.2.bb
@@ -0,0 +1,5 @@
+require libroxml.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d4b93d3f59721aa688eed28f806276a9"
+SRC_URI[sha256sum] = "9ba0657894d137a1669e1098f45b71b95ad8a18ccf3876b1d25fe64cf7576274"
-- 
1.7.7.3



