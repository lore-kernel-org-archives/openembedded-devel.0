Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5A173289
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 15:13:12 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so8704539qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 08:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CYWJawKad1mA4E6egLPI7EncLmU76QQmdIXcDioPa4w=;
	b=V8shA3VECfQSmOOgu+8Kb/Ss0wAiNU0m7ml0XQ0NA75HG6FmyuUcDhB4NaytE6Yqkx
	VWy2TjiyopSvgmxx88svIx+HayiuwlpnTvzmI0zrZ/JmSOQjA+2BNCXyN6pkdYpT+Zou
	ePWqlj0uaERpGdqokHX/VxpE93JVr73btE2/EhILUJHTrW5usidmo4rzaaP0MAca5cFv
	/9hoO2qNjZ6WA6xxQVCzy0x24pvgkTmL8HqX57Ktee5sLx/K5XTIGC24cPXyQwXOXVit
	5qUVEsyfrLG3twdhq4cqp1HAMgwB5HLLjkBYQWMhFaoCN3+ZAqPhuUhLeSRNwAtFdkFg
	JlnA==
X-Gm-Message-State: AOPr4FWmnyp88E0fU0PLlpjPdClbDCAH1Z3qd77bs89ocmfPBIydSIj/Tw0nc+TN74h67Q==
X-Received: by 10.140.29.165 with SMTP id b34mr25591472qgb.100.1462633992599; 
	Sat, 07 May 2016 08:13:12 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a31sm7925350qga.34.2016.05.07.08.13.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 May 2016 08:13:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2016 11:12:49 -0400
Message-Id: <1462633970-14004-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] pypi: update the pypi class to support the updated URL scheme
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
X-List-Received-Date: Sat, 07 May 2016 15:13:13 -0000

pypi has changed the url scheme to use the blake2b rather than names

http://permalink.gmane.org/gmane.linux.distributions.nixos/20158

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 659e1c0..5b96c01 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -12,8 +12,12 @@ PYPI_PACKAGE_EXT ?= "tar.gz"
 def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE', True)
     package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
+    package_hash = d.getVar('PYPI_PACKAGE_HASH', True)
     pv = d.getVar('PV', True)
-    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+    if package_hash:
+        return 'https://pypi.python.org/packages/%s/%s/%s/%s-%s.%s' % ( package_hash[:2], package_hash[2:4], package_hash[4:], package, pv, package_ext)
+    else:
+        return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
-- 
1.9.1


