Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1DF177E91
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:11:50 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q8so1925114qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdGRvur5R1u6s3dfIPFihiXK9zyqA33ZDeQtqB18Bzc=;
	b=I9W5h0WnIWU5VDMijaNjot+vznOf8QUaa4aCu3I2BN1gv5MOR3lQO7UXLMYr2PkKJn
	EnfiPzCRANUfCd+4Esk+CyyVJkVdoe5kBevq2wS66bL7UOaL9iLEXjZNIpjUGcauJIyr
	/OuCoBEYTU+p2Bxs7C+qInyp8SONW+me4b5GfpP2Q+P82PV92rB4dJdHpm1tmXLYjy4M
	pi5OCYfUtQE8cN3EjYPGTAKBeaz/AQ3hJFbshtNmvF9nRwjzVmKllIJzwNjrck7Nyx2D
	y4EWgz8xrTGQtJt0tRZvMtW71wkUSk9KClyzOHKtku7yqFodLTN7VpoUpJzaShwj6A9Y
	vSWg==
X-Gm-Message-State: AHPjjUhpsbssA0ZZjj2lWUDRJcLCYUwZITjLDolZWhhlYa4Xotbis9mu
	MYtf8lN9HjG2h92mJudX+iNwhwZm
X-Google-Smtp-Source: AOwi7QCs2oMawXSv3P+MsQ5IHhS0M+F3CW7MRP95xuyQXKpOelOL86Ecel8ujyGkqDqTkCKzvdJrWQ==
X-Received: by 10.200.25.78 with SMTP id g14mr7808606qtk.48.1505920311606;
	Wed, 20 Sep 2017 08:11:51 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	e64sm1436547qkc.15.2017.09.20.08.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 08:11:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 11:11:32 -0400
Message-Id: <1505920293-28115-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505920293-28115-1-git-send-email-derek@asterius.io>
References: <1505920293-28115-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 2/3] php: update stable version to 5.6.31
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 15:11:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0001-Add-lpthread-to-link.patch                   |  0
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch            |  0
 meta-oe/recipes-devtools/php/php_5.6.26.bb            | 19 -------------------
 meta-oe/recipes-devtools/php/php_5.6.31.bb            | 10 ++++++++++
 4 files changed, 10 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.26 => php-5.6.31}/0001-Add-lpthread-to-link.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-5.6.26 => php-5.6.31}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.6.26.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.31.bb

diff --git a/meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch b/meta-oe/recipes-devtools/php/php-5.6.31/0001-Add-lpthread-to-link.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch
rename to meta-oe/recipes-devtools/php/php-5.6.31/0001-Add-lpthread-to-link.patch
diff --git a/meta-oe/recipes-devtools/php/php-5.6.26/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.31/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.26/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.31/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
deleted file mode 100644
index 7e566b1..0000000
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require php.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
-
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
-            file://pthread-check-threads-m4.patch \
-            file://0001-Add-lpthread-to-link.patch \
-           "
-SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
-SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
-
-python () {
-    ver = d.getVar('PV')
-    if not d.getVar('php_'+ver+'_OK'):
-        msg = "%s disables itself because of many outstanding CVEs!" % (ver)
-        msg = msg + " Define php_%s_OK = '1' to build it." % (ver)
-        raise bb.parse.SkipPackage(msg)
-}
-
diff --git a/meta-oe/recipes-devtools/php/php_5.6.31.bb b/meta-oe/recipes-devtools/php/php_5.6.31.bb
new file mode 100644
index 0000000..dd8047b
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.6.31.bb
@@ -0,0 +1,10 @@
+require php.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
+            file://pthread-check-threads-m4.patch \
+            file://0001-Add-lpthread-to-link.patch \
+           "
+SRC_URI[md5sum] = "620abe25e0d6cd5f041a360a30ce5783"
+SRC_URI[sha256sum] = "8f397169cb65f0539f3bcb04060f97770d73e19074a37bd2c58b98ebf6ecb10f"
-- 
2.7.4


