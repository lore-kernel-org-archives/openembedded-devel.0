Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4F160111
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:42:17 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b32so15971953qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=82reTqYJhp7nFzveD3b1++LsotbSl7SMB8JO1DYEDXw=;
	b=lM4HJBbQpVojcJV6tDKrnA2csXTTbFldQH9JQMZsLrsd/hVKcxCf7ioSMxUV5EfmDU
	Peuw/U3/6KnGXps2n5w1tzN0rsEH1qMygX0/a0yCz6mMDe10jn2lbqDPgOVD5VVK37JK
	88LAmPpih4Muu5D22YUD8bKcMjisqqCwuMlsSG3XkGiUfuk87+NLb8SaRbA66QSPdLHa
	jq5dmzwqjRwzQI6NDF955zOip/kdO+l/P0LLZDBry7UXNim4pjVl9x8G5gH4yK5wHyZC
	HMgQxjKHXlfG9tgwLFHK7jhiPbGTnqEFvDILc343qIEdXDLBj1VvGDg1cEb7X1d5HupD
	I33w==
X-Gm-Message-State: AD7BkJIVPweFqtNNIlrP5KWE3EouTK9lIsef4R5aEsoDHU6gkCM/HvL+8uwjk45jWJOD3A==
X-Received: by 10.140.136.70 with SMTP id 67mr29553990qhi.46.1460374938002;
	Mon, 11 Apr 2016 04:42:18 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id x63sm5902816qhe.5.2016.04.11.04.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 04:42:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 07:41:37 -0400
Message-Id: <1460374897-30992-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460374897-30992-1-git-send-email-derek@asterius.io>
References: <1460374897-30992-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/4] python-whoosh: update to 2.7.4
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
X-List-Received-Date: Mon, 11 Apr 2016 11:42:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-whoosh.inc                 | 4 ++--
 .../python/{python-whoosh_2.7.3.bb => python-whoosh_2.7.4.bb}         | 0
 .../python/{python3-whoosh_2.7.3.bb => python3-whoosh_2.7.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-whoosh_2.7.3.bb => python-whoosh_2.7.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-whoosh_2.7.3.bb => python3-whoosh_2.7.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
index b3cde75..0a2cf3b 100644
--- a/meta-python/recipes-devtools/python/python-whoosh.inc
+++ b/meta-python/recipes-devtools/python/python-whoosh.inc
@@ -7,8 +7,8 @@ Whoosh works can be extended or replaced to meet your needs exactly."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
 
-SRC_URI[md5sum] = "891edeba96cec53604c0cd176284c4cf"
-SRC_URI[sha256sum] = "aa6db447522e208ae652c6ce063bb23cedec47f5ed630121b3debaa011fcb9c4"
+SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
+SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
 
 PYPI_PACKAGE = "Whoosh"
 PYPI_PACKAGE_EXT = "zip"
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.3.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-whoosh_2.7.3.bb
rename to meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.3.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-whoosh_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
-- 
1.9.1


