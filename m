Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5C86011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 12:14:52 +0000 (UTC)
Received: by qkao63 with SMTP id o63so4293894qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=l24RU2sPfgHOxD7aTmFRFeNq5PjCvngywjros0kxOsE=;
	b=fLe3QvDx64OhwjMiO+sY3ILW6zexlH4fRkIqY/zlPdlO5fvB83A9jVkzXvM8rZDjrD
	OBQjfBfc3jx53gkQQj+/8qsuDlDUSzYyW+a6/ZbuGhMa2ap3nMi8QhYhufSQo+NZ26Eh
	kee3iMsuM/qwvjCMD6gkBIkrJSRL1S85h3XC7IA1VPC5C4WsezOVxq/caG3cqipIfkE0
	lMrJTt60XRjL9ZdyAFJsTBT5rKdx2ba3xxNwFgapbgt/vP+ZZqx55cd6WckXfzTKHU2s
	51aH/5AbU6GcaWz+GPgT45bPBp3VNz8HSXAJF9cdhjwiiHmzU1bXoGND7wkP3AGke7Tc
	Tc5A==
X-Received: by 10.55.71.66 with SMTP id u63mr16953313qka.105.1448367293441;
	Tue, 24 Nov 2015 04:14:53 -0800 (PST)
Received: from mario.lab.ossystems.com.br ([177.194.194.57])
	by smtp.gmail.com with ESMTPSA id
	n67sm4184404qkh.18.2015.11.24.04.14.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Nov 2015 04:14:52 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Nov 2015 10:14:37 -0200
Message-Id: <1448367278-3115-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-python][PATCH] python-chardet: add recipe for version 2.3.0
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
X-List-Received-Date: Tue, 24 Nov 2015 12:14:53 -0000

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


