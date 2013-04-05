Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExh-0000GU-4x
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:23 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so1592617eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=P3QcFN/P8AsoDDFeH+TPhjkd3tiFw31m+o6fwHGZDe8=;
	b=sIznIYpheslaiXUj9CjNjNhPle5TRPE4MbZy8EvE4boahAlMTm4flqreyKpa1QayVH
	UFxxpLNjlovlGlSpLOjbQ3fZzl1hfc6tvqs+7mHiDh0NRmhJ4Mk/AOauQzHchlYMy+zC
	AASfnzN38nrI5ALhsif5N0seCeouT7PEtoJNUh8o3IvJDrAuwD16aVh/CjBWn+3nFeFY
	jFPoS9W4kvhVfASg/W7IQw1DdgG9UiEb/vcnqavQblv/mDf8LcVq0KfJBDFslZMONUTg
	i8Sy8jvqpgIXZ2wOWoz5dj2e6Wy36yD7Y61ElF9Q4DMxnbpLUtLC1HBRMZWpUlSej0A+
	lVFw==
X-Received: by 10.15.61.8 with SMTP id h8mr23215038eex.33.1365199266677;
	Fri, 05 Apr 2013 15:01:06 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.01.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:01:06 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:35 +0200
Message-Id: <75b8d7e789abefb5be0b3a33a6714f33de4fbaff.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 5/6] zaurus: remove configurations of models aliased by c7x0 and spitz
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:25 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/borzoi.conf   | 2 --
 conf/machine/boxer.conf    | 2 --
 conf/machine/corgi.conf    | 3 ---
 conf/machine/husky.conf    | 2 --
 conf/machine/shepherd.conf | 3 ---
 conf/machine/terrier.conf  | 2 --
 6 files changed, 14 deletions(-)
 delete mode 100644 conf/machine/borzoi.conf
 delete mode 100644 conf/machine/boxer.conf
 delete mode 100644 conf/machine/corgi.conf
 delete mode 100644 conf/machine/husky.conf
 delete mode 100644 conf/machine/shepherd.conf
 delete mode 100644 conf/machine/terrier.conf

diff --git a/conf/machine/borzoi.conf b/conf/machine/borzoi.conf
deleted file mode 100644
index d037a1f..0000000
--- a/conf/machine/borzoi.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C3100,\n*    because \
-its very similar to the SL-C3000. Use MACHINE = \"spitz\".\n*\n*\n')}"
diff --git a/conf/machine/boxer.conf b/conf/machine/boxer.conf
deleted file mode 100644
index f5afc14..0000000
--- a/conf/machine/boxer.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C860,\n*    because \
-it really is just a Sharp SL-C760 with a different case color. Use MACHINE = \"c7x0\".\n*\n*\n')}"
diff --git a/conf/machine/corgi.conf b/conf/machine/corgi.conf
deleted file mode 100644
index 8055af0..0000000
--- a/conf/machine/corgi.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C700,\n*    because \
-of the similarities of the clamshell series. Use MACHINE = \"c7x0\".\n*\n*\n')}"
-
diff --git a/conf/machine/husky.conf b/conf/machine/husky.conf
deleted file mode 100644
index fae9540..0000000
--- a/conf/machine/husky.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C760,\n*    because \
-of the similarities of the clamshell series. Use MACHINE = \"c7x0\".\n*\n*\n')}"
diff --git a/conf/machine/shepherd.conf b/conf/machine/shepherd.conf
deleted file mode 100644
index 1541712..0000000
--- a/conf/machine/shepherd.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C750,\n*    because \
-of the similarities of the clamshell series. Use MACHINE = \"c7x0\".\n*\n*\n')}"
-
diff --git a/conf/machine/terrier.conf b/conf/machine/terrier.conf
deleted file mode 100644
index ca6a20d..0000000
--- a/conf/machine/terrier.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Sharp SL-C3200,\n*    because \
-its very similar to the SL-C3000/SL-C3100. Use MACHINE = \"spitz\".\n*\n*\n')}"
-- 
1.7.12.4



