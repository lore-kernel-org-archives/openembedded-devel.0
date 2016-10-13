Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F89771ACD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:13:48 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z190so7230291qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ccr+Z4m8T4+PeiqcdPYZxCU5OpSTxwzamAnre+TQwvo=;
	b=GFBJ4KCabxdqS7TmyP6WI8ekkDY/P8cjhahUdZwaeK0W66yKw3hT6KYDlmH1CLIsvR
	uJJ8ZkXhMdGO2mv3bzXJe3mbNGMo9hIVyu5COZAb1BOt1VzZVDZaTxYzdGEWbLCgoIWO
	N2auSXL6+H3ofnrOcwvPZPgrGko92fpjEzmlYiirdHEZr1BssQCiREA92ZjefW/6vK+G
	IqTqEUyiaa8hbagjl+3lHj4uMPrw7cLTo7Ag8+qypA5+Gj0RvErEvwyonx5INH3j33L2
	tNktoOKyNv87LWg/+6jDo3HW3rPSaUfUmsaXPsyKsMHvy1t3HeRLCgOq9HLD/QDh/BtK
	5cVw==
X-Gm-Message-State: AA6/9RlaYYAziRFnWxSDdI6UjeNzuwcomiHo+QodQxSf87Iq60TeHS7Bzwnx0buoKPmH3A==
X-Received: by 10.55.16.9 with SMTP id a9mr9854851qkh.268.1476396830479;
	Thu, 13 Oct 2016 15:13:50 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id a26sm5909124qka.2.2016.10.13.15.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:13:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:13:36 -0400
Message-Id: <1476396816-12107-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 3.6.4
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
X-List-Received-Date: Thu, 13 Oct 2016 22:13:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.6.1.bb => python-lxml_3.6.4.bb}             | 0
 .../python/{python3-lxml_3.6.1.bb => python3-lxml_3.6.4.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.6.1.bb => python-lxml_3.6.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.6.1.bb => python3-lxml_3.6.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index b714218..7481b98 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "b27472db50fb794795b767bf713287a0"
-SRC_URI[sha256sum] = "3eefcfbc548f8df38063b26c9686554268c1eb736e52cd230ff148aa550239d1"
+SRC_URI[md5sum] = "6dd7314233029d9dab0156e7b1c7830b"
+SRC_URI[sha256sum] = "61d5d3e00b5821e6cda099b3b4ccfea4527bf7c595e0fb3a7a760490cedd6172"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.6.1.bb b/meta-python/recipes-devtools/python/python-lxml_3.6.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.6.1.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.6.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.6.1.bb b/meta-python/recipes-devtools/python/python3-lxml_3.6.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.6.4.bb
-- 
2.7.4


