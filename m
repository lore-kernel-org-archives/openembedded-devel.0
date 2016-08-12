Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id ADECC731DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:18:41 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so1137065qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZVG6XnLrGpcSQwKvGvko99AaF//+51TNaG9qvWV2N6I=;
	b=LyIEix9W3HfnesDAbsw5D3cxbqiFygKs+LdEnm+n0eeOdMZjLSgzibntJuqnoEy//G
	q0CuaGALC+pgpFGXEzmwFuegvtG5t6e+k2cv/Skac3BshEu8RytqflLefQuYK2OY4KbZ
	0tAJpAK2Y1pN4xsqVMmB125NhKuD37FU+a28z55DbfGCpZHNX/u3aZDWMYQNk7dgdeyX
	4lG7lg1Vmmqr05nD/Cq78FOIRHZoT64stZKswZguKiA7WWsiFfxuvQ4MiBW80F6CZ1Dr
	9CRNXQOaSqf3UWmyItKIvGhQspb9cYo2WCttiIuRFLKutgxIyByLezsluZLaSOSKk3a/
	RTHw==
X-Gm-Message-State: AEkooutSOrhzhJa26d0WCKZX+Z+w+TxUt0Hyq9BGy0nJ6t+6T5ZkPmC+gWtF0j5K92vvXA==
X-Received: by 10.237.55.225 with SMTP id j88mr18251754qtb.131.1471018722469; 
	Fri, 12 Aug 2016 09:18:42 -0700 (PDT)
Received: from argos.minotaurinc.com (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id g3sm3501233qkf.35.2016.08.12.09.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 09:18:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:17:42 -0400
Message-Id: <1471018662-16225-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-lxml: update to version 3.6.1
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
X-List-Received-Date: Fri, 12 Aug 2016 16:18:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.6.0.bb => python-lxml_3.6.1.bb}             | 0
 .../python/{python3-lxml_3.6.0.bb => python3-lxml_3.6.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.6.0.bb => python-lxml_3.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.6.0.bb => python3-lxml_3.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 0473417..b714218 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "5957cc384bd6e83934be35c057ec03b6"
-SRC_URI[sha256sum] = "9c74ca28a7f0c30dca8872281b3c47705e21217c8bc63912d95c9e2a7cac6bdf"
+SRC_URI[md5sum] = "b27472db50fb794795b767bf713287a0"
+SRC_URI[sha256sum] = "3eefcfbc548f8df38063b26c9686554268c1eb736e52cd230ff148aa550239d1"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.6.0.bb b/meta-python/recipes-devtools/python/python-lxml_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.6.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.6.0.bb b/meta-python/recipes-devtools/python/python3-lxml_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.6.1.bb
-- 
1.9.1


