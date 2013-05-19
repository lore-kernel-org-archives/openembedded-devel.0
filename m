Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17X-000054-IQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:43 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so3106074eak.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=3/qLZ7awU5+/eUtKVvNrCBn2gE4s3VTTwbpyZAvJBZI=;
	b=q157GX249sMyeKnD2Tv6n2RRryaNFq0sSdR4OvI+qr6DZnLbJA+U8NbwUgcPAMNUF5
	/IsGJCoc6Er1P3CZUdRAxY0tHZdaQH1a7qcgCRDOXiMn/sYXS382fRX04F+7JTPV8j2c
	WgUVF1sYOTLEMjXNE3uLGd1ey5jd8g3oy4GcjMK4RSsu//xycaDG84UN1n1hzZ7AZu/u
	4i8vQjIU4N7SerDfzEsj5IfSjnzxFUoHRGt9S7ZUK/9NnmmtDMugVw/rszxtsE0EgBom
	tso5BskSqbwpkbUq6Edni5jh4PqsJzB6IYzpN8rkg7XyV+jNNa/SG48twp2KtGahfVH8
	ApPw==
X-Received: by 10.15.23.69 with SMTP id g45mr152332233eeu.25.1368959245314;
	Sun, 19 May 2013 03:27:25 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:03 +0200
Message-Id: <1368959233-28288-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 01/11] mm-common: update to 0.9.6
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
X-List-Received-Date: Sun, 19 May 2013 10:45:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb |   10 ----------
 meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
deleted file mode 100644
index c49b4c8..0000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit gnomebase
-
-SRC_URI[archive.md5sum] = "4a4dad67fc8d7e0c529f3a8c6ba4d8b2"
-SRC_URI[archive.sha256sum] = "9c602dba89d264a4719db996b9b169716df2d4d10bcd24e56fc3572865a5cb8b"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
new file mode 100644
index 0000000..f7e2507
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
@@ -0,0 +1,12 @@
+inherit gnomebase
+
+GNOME_COMPRESS_TYPE="xz"
+
+SRC_URI[archive.md5sum] = "3b23749ab39441c392c016ce74632678"
+SRC_URI[archive.sha256sum] = "7c37158a1f37604705a9b9305d3b335fb8256f5de701c8801269dde4e2ce7dde"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.4.4



