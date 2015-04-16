Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 249F673D59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:19 +0000 (UTC)
Received: by ykfa3 with SMTP id a3so5016272ykf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rpw71Wm6jnAxR720NLf/icuSkP3jY+BHiVJV4Zq64hI=;
	b=U4Htb7sdoMDD4iy+Ix4t+jLJDJ7ixiA0AOPvRRexi3gx4aJajQqTwrUjUZKYnP+8rJ
	2U4wXM8m6RNz3TBr+TC3COH+OUe8u6l4KuwBOJ41NEknNEqzwtMdkf4MrUg1u0At9N9b
	TXttehzk/Z5AiYRwMFVp6HsGBTptYphFnkX7+GGwmoFyC3RdKoIUteDoGfIMt7VDP4E0
	SZD7IBRPXVlNSZQeY4ogMIB8mYuci62kdStJhqFfSvOYnt4pQkhL4L5eOZlNB66QAgop
	gc55x1ZqBFe0FUDa4lA8opW7mPAKyhBFuPp0pY2Tt+0TN8POGcig2t/vLOmjxciYgL41
	EjZw==
X-Received: by 10.236.201.49 with SMTP id a37mr24600728yho.86.1429197500782;
	Thu, 16 Apr 2015 08:18:20 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:20 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:41 -0700
Message-Id: <52fbce25eef8e42b9f82cd63be00df654cc7988d.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 3/7] python-pytest: add 2.7.0
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
X-List-Received-Date: Thu, 16 Apr 2015 15:18:23 -0000

python-pytest is required for ptest of python-cryptography

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
new file mode 100644
index 0000000..14dc85b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Simple powerful teting with Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "14cde91b1106c937c48497728ea37dc6"
+SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d045519d6"
+
+RDEPENDS_${PN} = "python-py"
+
+inherit pypi
-- 
2.1.0


