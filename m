Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 00B456011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 12:15:06 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so4313452qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 04:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=l24RU2sPfgHOxD7aTmFRFeNq5PjCvngywjros0kxOsE=;
	b=qSu3SBOsfUbwGbVJNqMoavg1VIlbUxUxu4jvjnXHqiXpGO9w9ka8nuOq96FwulKC+m
	byyYIC/jSkV1uH3gHW2b7TLWYp3xolKu1Aac5Taqk0UUl231jpIaqSdzHRZF4h/VB5po
	kDSYCsOnVH7En844+mQmVSrMS519xH12S9JfhHZayj4/9J0W+wgp2eWMn4JovYfPMw6k
	KarZMlN54d9kgURYDbdh1yCU2Z5k+miBFJk6PDBG8F7p/4IhtVCGwbGGxnQDXtA4BJYE
	7TnQcfrxN+uSp78UeIEqm6k0Cdm1YB94QIYmUb9oGaoojRmQyPKLSDwmavzCDUKZoWbu
	iygQ==
X-Received: by 10.55.78.82 with SMTP id c79mr32257434qkb.44.1448367306704;
	Tue, 24 Nov 2015 04:15:06 -0800 (PST)
Received: from mario.lab.ossystems.com.br ([177.194.194.57])
	by smtp.gmail.com with ESMTPSA id
	n67sm4184404qkh.18.2015.11.24.04.15.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Nov 2015 04:15:06 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Nov 2015 10:14:38 -0200
Message-Id: <1448367278-3115-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448367278-3115-1-git-send-email-mario@ossystems.com.br>
References: <1448367278-3115-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] python-chardet: add recipe for version 2.3.0
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
X-List-Received-Date: Tue, 24 Nov 2015 12:15:07 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
new file mode 100644
index 0000000..25326aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
+SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
+
+inherit pypi
-- 
2.1.4


