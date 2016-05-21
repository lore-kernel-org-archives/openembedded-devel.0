Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id BDD5470149
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 12:58:57 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i22so18116456ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 05:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pRu1Er1ahxvMNC0RW1T9yvBR8OctKRe8+C5+fs9rEYk=;
	b=E8nBv34UwPnPw2S4qG0cnPZp4++ezJGiC63hWAcetOfv+l76B9gENyG7POJpS3i+pj
	vyXRZfEsn1ReEpJw74BSnrQCeD1EPE0juRnIfWov22q0U9fUBbqfENh4FAyx89UyBSBJ
	iFClw/Zk8pv29Pu3q3GjPPEdm8nfeM/56e4VVQKZXC8axNfSyLvf3lVzW1DTnHYEalPj
	wLqVFR4IBjeqrZi+/i2mXU2GlPU3i2fGCOdkPSDzvWxMSl7AVseci7OQ6WbC1Xz6BEai
	XnEzY2hvlcMKUfsCeyzEFtSU3KWju9GNr38YZPJTSLwfSilvOq1JoHSANBvNQ02Kvp+/
	McQw==
X-Gm-Message-State: AOPr4FXadaETs3EVo7IbL9EXyIf6AcqtbSTNDclTe3Pf30zfADlMTal8noTEj6QqxfubLw==
X-Received: by 10.129.97.85 with SMTP id v82mr4579590ywb.109.1463835538774;
	Sat, 21 May 2016 05:58:58 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	j3sm13893590ywj.32.2016.05.21.05.58.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 05:58:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 08:58:39 -0400
Message-Id: <1463835519-6491-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-mock: update to version 2.0.0
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
X-List-Received-Date: Sat, 21 May 2016 12:58:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-mock_1.3.0.bb => python-mock_2.0.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mock_1.3.0.bb => python-mock_2.0.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python-mock_1.3.0.bb b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-mock_1.3.0.bb
rename to meta-python/recipes-devtools/python/python-mock_2.0.0.bb
index 8a7894c..eb473d2 100644
--- a/meta-python/recipes-devtools/python/python-mock_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
@@ -2,8 +2,9 @@ SUMMARY = "A Python Mocking and Patching Library for Testing"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
-SRC_URI[md5sum] = "73ee8a4afb3ff4da1b4afa287f39fdeb"
-SRC_URI[sha256sum] = "1e247dbecc6ce057299eb7ee019ad68314bb93152e81d9a6110d35f4d5eca0f6"
+SRC_URI[md5sum] = "0febfafd14330c9dcaa40de2d82d40ad"
+SRC_URI[sha256sum] = "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
+PYPI_PACKAGE_HASH = "0c53014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f"
 
 inherit pypi setuptools
 
-- 
1.9.1


