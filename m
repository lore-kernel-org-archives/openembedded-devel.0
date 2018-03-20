Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5185178992
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:12:25 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b198so1504927qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u6Ie6CmyZbfiYg1SKvf+JXDJp//Dwb0CW6ZivfZmyig=;
	b=MJq1uLJGyIjP/ylMxwi6XeR4cv5EzCVr2zmgWwQu0q4j2lzSPvio/++I7IL/yt3gSE
	j3a2xcjdht/dhAETGCyYfQHIkZLn5P8Rw0SE2DTz/Eob0mH9DCNdcQHehrN51fiqe+rV
	/8T5C+HKpmBWmDZug+2Aqp1DyKytKWzftidUxk+5YFXxwJmE6ofRvtIq5xTI3CdzyL+x
	CYST0NzmBnHAIAzot1JkULHheJmHG9+A4MgYdDDQ1A7wfUDG0UKQ/UHj9wwu+obULq2M
	ZF72PhwMib6tuPXQ04nBoC/DVIbiVyH5LVp5gF0nZo2tXYWOQ6kg7XtRsi/MadE7lvnS
	vU2A==
X-Gm-Message-State: AElRT7F+LH+YK4K+sAIbrBbsqFKYSBC6OEmUPPZBmUVXVx8clfeAiDNA
	XMZYpTLtE3c46NeVac5ek/bsNBoz
X-Google-Smtp-Source: AG47ELtE2AkpuM/sPtDl+AhspiRUIj678Hls5JU6MZmCanBLu7spWN/L+fgaaYn/cBjE0XXKVC77Uw==
X-Received: by 10.55.52.4 with SMTP id b4mr23856135qka.315.1521551546039;
	Tue, 20 Mar 2018 06:12:26 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id q2sm1196320qtf.54.2018.03.20.06.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:12:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:12:16 -0400
Message-Id: <1521551536-32461-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-isort: add shell and datetime to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:12:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-isort.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
index c9e8192..6d13e5f 100644
--- a/meta-python/recipes-devtools/python/python-isort.inc
+++ b/meta-python/recipes-devtools/python/python-isort.inc
@@ -8,3 +8,8 @@ SRC_URI[md5sum] = "fb554e9c8f9aa76e333a03d470a5cf52"
 SRC_URI[sha256sum] = "b9c40e9750f3d77e6e4d441d8b0266cf555e7cdabdcff33c4fd06366ca761ef8"
 
 inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-shell \
+"
-- 
2.7.4


