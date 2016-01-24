Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 53342770A6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:35:28 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id o11so8426034qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3rj3px5S066c6xZIkH0Pwe08Z01e7O2RXcPc4u7JeIk=;
	b=Rat/E9K2eHc621aZsqKVJMn4g3o87KvsJKyGBLvukBeODTzjxDBBSqg8WyCcxFQjk1
	hL78pxsWkjBoqIFAioyoLJ0+OyFPCBiuaMrWf07MzBoVcAnCbN1MtxS88FynXBehmTYM
	OpzMZAbx0PYArfHfL5mutdPtshvY+zV0D0dvBYgHqBLNm6IMF16p5TrBH76Piznpptpj
	i1uVP/zP1jthEvJaN5/HxgHgxOVrHk28QGY7mwntOdbWYOtzyXEhqGCbb5niKcxLfl4E
	+ihE58F1eciQqKt5VDS1iFGxDp6OlAzfAz7DuBY2FZJjhRKrfS11JQoednRaLj4crA/R
	/9RA==
X-Gm-Message-State: AG10YORGftaB975QfjbKOmawgNH7y6kPAyO+9sgazCFlrCFc0BTb8Isk3CAN8pSCWUsMog==
X-Received: by 10.140.102.11 with SMTP id v11mr15725904qge.39.1453642528935;
	Sun, 24 Jan 2016 05:35:28 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	u16sm6877295qka.22.2016.01.24.05.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:35:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:35:19 -0500
Message-Id: <1453642519-4510-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453642519-4510-1-git-send-email-derek@asterius.io>
References: <1453642519-4510-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 2/2] php: update to 5.6.17 and 5.5.31
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
X-List-Received-Date: Sun, 24 Jan 2016 13:35:28 -0000

Fixes CVE-2016-1903 and other bugs
https://secure.php.net/ChangeLog-5.php
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1903

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch                           | 0
 meta-oe/recipes-devtools/php/php_5.5.30.bb                           | 4 ----
 meta-oe/recipes-devtools/php/php_5.5.31.bb                           | 4 ++++
 meta-oe/recipes-devtools/php/php_5.6.16.bb                           | 5 -----
 meta-oe/recipes-devtools/php/php_5.6.17.bb                           | 5 +++++
 5 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.16 => php-5.6.17}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.30.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.31.bb
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.6.16.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.6.17.bb

diff --git a/meta-oe/recipes-devtools/php/php-5.6.16/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.17/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.16/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.17/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.5.30.bb b/meta-oe/recipes-devtools/php/php_5.5.30.bb
deleted file mode 100644
index 2bfadc1..0000000
--- a/meta-oe/recipes-devtools/php/php_5.5.30.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require php.inc
-
-SRC_URI[md5sum] = "181d153c9fba7ff46534df1bdab4d853"
-SRC_URI[sha256sum] = "e7332a713cecdd1cb44a1b1336739885c9789f633f0f51236b25e48ab03c3b29"
diff --git a/meta-oe/recipes-devtools/php/php_5.5.31.bb b/meta-oe/recipes-devtools/php/php_5.5.31.bb
new file mode 100644
index 0000000..cdd89b4
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.5.31.bb
@@ -0,0 +1,4 @@
+require php.inc
+
+SRC_URI[md5sum] = "ebb66ad8e2bcf1a966b10d86e81a0119"
+SRC_URI[sha256sum] = "fb4a382b9a9dceb749b7ef047d8251320bc8d371c843714e5b4f4b70d61ba277"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.16.bb b/meta-oe/recipes-devtools/php/php_5.6.16.bb
deleted file mode 100644
index 822c090..0000000
--- a/meta-oe/recipes-devtools/php/php_5.6.16.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require php.inc
-
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "765b164b89af1f03ae2fdf39a4e4e1df"
-SRC_URI[sha256sum] = "4fe6f40964c1bfaba05fc144ba20a2cdad33e11685f4f101ea5a48b98bbcd2ae"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.17.bb b/meta-oe/recipes-devtools/php/php_5.6.17.bb
new file mode 100644
index 0000000..d92d92b
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.6.17.bb
@@ -0,0 +1,5 @@
+require php.inc
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
+SRC_URI[md5sum] = "23e2183852b172a8e2b2c739b7dde4ca"
+SRC_URI[sha256sum] = "77b45f56a1e63e75bb22b42cfb8b438ec4083c59ce774b4d7c1685544b7add3b"
-- 
1.9.1


