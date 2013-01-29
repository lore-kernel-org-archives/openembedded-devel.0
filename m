Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0AZy-00063S-0B
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:46:23 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so371182pac.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=0xrjNSS4iJ0b0d+8yxqBbJW99f9mc6qJ+ps+wRNMXmU=;
	b=xVtJuDMQ/yQT2iQJl+FwSEk8fPmZpMCr/ipyMUKIeUxhx35chMnPOC+rSiHpzi+3bx
	HF4wK/QLmD1f6EWhYYEKBdeddOTbMoc75FQDqaOnEg1ICradGqrp4srRyIhpginWvF1W
	7zVb42bE5YQTkLmjqcq6hPmos+GaNaFs9blUs9i1/38WlkzJkTJ5mHOpW1GD7zoR45+z
	qsoyZsgEUvmwiiRsMwJLn1xOpaJX3dZE0R4ASQKKwfI9FV3KFKlQjkmBM9IL8DCisjwp
	J3spZUghnKwA77x+HNv03Yb/evIaXz0zJtHGp29lAWR7EqTYGmEaJ0sCXGGjojxi0q0V
	EVmA==
X-Received: by 10.68.224.130 with SMTP id rc2mr1803202pbc.156.1359462641595;
	Tue, 29 Jan 2013 04:30:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t7sm8854847pax.17.2013.01.29.04.30.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:30:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:53 +0100
Message-Id: <960c2d6177413206ee78b8d9d092fa93c5ea62a3.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] gnome-panel3: exclude from world
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
X-List-Received-Date: Tue, 29 Jan 2013 12:46:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index bd21ca1..3aadd2b 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -4,6 +4,9 @@ LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 BPN = "gnome-panel"
 PR = "r1"
 
+# conflicts with gnome-panel, because they provide the same package
+# http://patches.openembedded.org/patch/43105/
+EXCLUDE_FROM_WORLD = "1"
 DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
1.8.1.2



