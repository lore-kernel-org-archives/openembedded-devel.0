Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF09273D56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:20 +0000 (UTC)
Received: by yhla23 with SMTP id a23so4516886yhl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wgnKyerURmr4TQy+xYhYgwzsS6LLhXwI77+y38vtoZk=;
	b=ANMSZrzLeT0aeqV3r7c3ditsI67wV+4MraBrLWRekw2+UaLLlaQujh06RQthvCRY+A
	aOvjCjX8gsTwgOrvgSh9blWeIQEzSsyD/UclEJz7EZTaRyIzFVD85Qz2Oai0acEXyosP
	tkis7tSh9yXHXuafz87cva4J70EJMu6sto+Ba4YaitRLXOd6R/Zfn3/JqyXhq9azBR0B
	Hc9rzj1TW6tl7phXQlW2ql3NEadsWduJQuEC54bL/YWdKNLu9VOAKZTzFsXoWxMJnH3A
	hS1KeU9IdpJKxJ28www1wJfcFQ2z6xgUIOomellqg+VUP5X/Xlb+lDJqPwoWyXpXaScD
	ue+w==
X-Received: by 10.236.21.164 with SMTP id r24mr25152125yhr.150.1429197501779; 
	Thu, 16 Apr 2015 08:18:21 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:21 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:42 -0700
Message-Id: <2c878f89561b7832e92e68fef394fddf3eaa5bd4.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 4/7] python-iso8601: add 0.1.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 15:18:20 -0000

python-iso8601 is required by python-cryptography

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb

diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
new file mode 100644
index 0000000..227de54
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Simple module to parse ISO 8601 dates"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
+
+SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
+SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
+
+inherit pypi
-- 
2.1.0


