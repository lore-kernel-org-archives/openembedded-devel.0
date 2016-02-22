Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id E68A2771A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:34 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id b67so110642701qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7/97HLlrjezXAfgovM4h7jsAlHXpNnAYRVf+pmZlIFk=;
	b=SYhSUY32IV3t75HFAEnn5ySLN/NNoqmkZIQ2rtsNr23it70pgOOc6zlCfdqqhL/akR
	OtKafK/uSbNEg9DmYehqwL+IBcvU7ndZgjm56p+TI6NAh+b1RJr+5C6XBn8TDinVZabi
	oUBcFUwF97XfOvkhnqdmBaGz6EW6vI4KKgZWVp0JsNtL7EUvex1wFIpF+Rz73e8Zerk3
	34Eq4QVs4YploQBooGSsXRjw5/Z6Uz1e/4PM7ScFBmvJcx02++dYXUau0Ac7g+/a4EIY
	yUjKNdETh4+uMw7ZshgX6M7P5hvl/QGQa5MQReBgHod5TPa9Cs6k13B9yq0bI+bpQUv9
	DJBQ==
X-Gm-Message-State: AG10YORd2NrCvO9CPm30eYnJnPdI4KnKyjHCtB3vfKhE3e2BarBhIUA+0fB6PcXZkXsARg==
X-Received: by 10.140.226.135 with SMTP id w129mr36897250qhb.4.1456148135189; 
	Mon, 22 Feb 2016 05:35:35 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:02 -0500
Message-Id: <1456148105-9644-8-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 08/11] python-mock: update to 1.3.0
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-mock_1.0.1.bb => python-mock_1.3.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mock_1.0.1.bb => python-mock_1.3.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb b/meta-python/recipes-devtools/python/python-mock_1.3.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-mock_1.0.1.bb
rename to meta-python/recipes-devtools/python/python-mock_1.3.0.bb
index d336f61..8a7894c 100644
--- a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-mock_1.3.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A Python Mocking and Patching Library for Testing"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
-SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
-SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
+SRC_URI[md5sum] = "73ee8a4afb3ff4da1b4afa287f39fdeb"
+SRC_URI[sha256sum] = "1e247dbecc6ce057299eb7ee019ad68314bb93152e81d9a6110d35f4d5eca0f6"
 
 inherit pypi setuptools
 
-- 
1.9.1


