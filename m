Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id B15107318E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:42:15 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id j35so15935380qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z23eJnqug1BpJs9iIy+rG5tZYkK4VsrNV/8uXj7tbq4=;
	b=PzHMDydw9fl9FtXw6Us5JieghQE9hNmfZ7kjM8qoYwtZYcN9qTkDWga+G55NdwHVrg
	tEWe5PeBCptP5JYdYMEU/OIx3bo/8lFbcPE0CndCUHTXlE8abDBPQ1B4L08fkKU1SfVh
	cJWOOM4nYK+zMDaNBKJM7dW/Q0UH+5FWxGfkwHq4vcyylMPLDQhkYVT/r4R5SPUF0uP5
	tiFbIV/NCxSJSpj/Yx4G9KmHe3sFIUn42dIbPK+n6Y2yg0UO18M/zypAAyNOrV+f/xZa
	JtIfMyVn0Zk0ClSxOXbe/tko3eOuZgwSB/+jBDyHqlgEwERihNUXutxLp4k3Oy5w5GiS
	uN5w==
X-Gm-Message-State: AD7BkJL4LJotmM4na7Y1olXp4tXJO0URKrtWyqDRlRNuBDFbmj7PFTUDTU/aOtCIROIfrg==
X-Received: by 10.140.228.68 with SMTP id y65mr29294164qhb.78.1460374936450;
	Mon, 11 Apr 2016 04:42:16 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id x63sm5902816qhe.5.2016.04.11.04.42.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 04:42:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 07:41:35 -0400
Message-Id: <1460374897-30992-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460374897-30992-1-git-send-email-derek@asterius.io>
References: <1460374897-30992-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/4] python-dateutil: update to 2.5.2
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
X-List-Received-Date: Mon, 11 Apr 2016 11:42:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc               | 4 ++--
 .../python/{python-dateutil_2.5.1.bb => python-dateutil_2.5.2.bb}     | 0
 .../python/{python3-dateutil_2.5.1.bb => python3-dateutil_2.5.2.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.5.1.bb => python-dateutil_2.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.5.1.bb => python3-dateutil_2.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 0a95d81..a944ef2 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
 PR = "r0"
 
-SRC_URI[md5sum] = "2769f13c596427558136b34977a95269"
-SRC_URI[sha256sum] = "40d1bc468c7df50aff9e7a12c14687f9180efcff86900ee2963f9f2c13b5d7a9"
+SRC_URI[md5sum] = "eafe168e8f404bf384514f5116eedbb6"
+SRC_URI[sha256sum] = "063907ef47f6e187b8fe0728952e4effb587a34f2dc356888646f9b71fbb2e4b"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi 
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.5.1.bb b/meta-python/recipes-devtools/python/python-dateutil_2.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.5.1.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.5.2.bb
-- 
1.9.1


