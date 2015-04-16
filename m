Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id CCC6373D64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:21 +0000 (UTC)
Received: by yhla23 with SMTP id a23so4516947yhl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=H4GrTyaK0qYQBSs0mA6s6wmCqsMn3MCu2YY0nyJWL3U=;
	b=GLanH+phWXhtEL8SUdrrMwfR2IPTL8JkVFDPs4su/tMWWTYTBzK2xzE1Z3RaqEQpWT
	B9vbzXsJxUzJ/y8acm6LGi4NcCoEZFHaBVor2QFnDhsP9KQUxBSg94v21HLSvN7X3du4
	ermttu7MQdXd802SbJ2tNMxput6V/17D28SCfGXbKehS/L7wZg2x3eewz4O13fHFNu1C
	Sv0QeqKw0ZR+/XrHRL7NwLNMf3RnwkTtZcsZEuTJBh0jpDbVQLUQaDrVjdJCRbHcJbdK
	vYuquUE1bWeUMJqc7I9CUtEqq0WYqFOC13b16RUr0NzteUhWKFnHgLsSpZ672bbzvJsV
	xj7w==
X-Received: by 10.236.4.65 with SMTP id 41mr25065722yhi.10.1429197502820;
	Thu, 16 Apr 2015 08:18:22 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:22 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:43 -0700
Message-Id: <f334012e50360267e47dd75bddd084d8754ab145.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 5/7] python-pretend: add 0.8.1
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
X-List-Received-Date: Thu, 16 Apr 2015 15:18:21 -0000

python-pretend is required by python-cryptography

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
new file mode 100644
index 0000000..44b584e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A library for stubbing in Python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
+
+SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
+SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
+
+inherit pypi
-- 
2.1.0


