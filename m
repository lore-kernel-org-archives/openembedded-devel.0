Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 23068605F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:33:05 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 4so1659649pgd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2WpiDESSiUjNbv9krrzHRn3OuhUUOVIo0mSF7Ds/fLw=;
	b=nXPnLf1BlBzrA34lacapwuIYISLS16GoX/JBd25iOs3Gkefx3kMp0QAJouVfhOvqw6
	MNQf/Ngo7V/AboZmxI+G88e42QPB1J8Sdoac6D9b/Vg85ImmPvC5OOGUexivarsFdpkE
	XLB5L5RL9OUdgdEQiTUrA7/AnMTxvERMEMEbSYSfel6rsX3zEauw4wHYEg5vLHxjZ3ir
	GSo47Qq+/WnWZzdgW53xK9dPl6LVyleBumvtUadoA02Yax/QqcNm0W8OAzy9Cbz+281j
	QfZx6sEbPvKO3/uU62aXeQxHeX3QY/cMWQAzb3NiNzfGEJqdSlY4xdz2uC+KKTMVTWVY
	ApJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2WpiDESSiUjNbv9krrzHRn3OuhUUOVIo0mSF7Ds/fLw=;
	b=DlRGHwSejjGpPXcrrkV/7Df70HqokaygZ3aIynpiJGGDceE1Hqwy0eZfD6hZNIts+D
	22nagu1mVBvqkZqbcgvYKzmWzS2RT9HN+belywAZu0pMV2xA0wsVK4MtSy0zmifhZPT7
	voLjQ5VFKlHSMlbOVyEcUY5WfM7c/QoSgbs0kggDllM4gZJ2AOM/9MF+3R9OqAhe2Gvj
	eVo7rn6+UXpZcxcwtsEDYzIG+n8LCovIWk8SLxkOaYQ2k0IE+SvCLY/vUN52i69dGyzS
	shoY4JmR8h9rrbbPg6lnWOkU9ykMfQ7qFlOdGTLf9bhCumVrNnDUx8AA/D9iUUxQ1JpP
	Ro9w==
X-Gm-Message-State: APjAAAUzB4i3IcLl77mKLfT6Zfw08QALF/py7i/hDOg/EOKfxdfhPJeC
	6ns8yN0RbtZcSlTbazrKGNsGjDPT6z7mWA==
X-Google-Smtp-Source: APXvYqylyym4X9WxQVFtQkMoSwKnS4662yX9V23DXJC6fVxD6QRaN64C1FY7QH23eVV53odZafIxBA==
X-Received: by 2002:a63:4303:: with SMTP id q3mr2989894pga.439.1580364365428; 
	Wed, 29 Jan 2020 22:06:05 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c00:5907:d290:cfc0])
	by smtp.gmail.com with ESMTPSA id
	t63sm4829667pfb.70.2020.01.29.22.06.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 22:06:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jan 2020 22:05:33 -0800
Message-Id: <20200130060534.5679-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][zeus][PATCH 1/2] lib/oeqa/runtime/cases: add python2.py
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:05 -0000
Content-Transfer-Encoding: 8bit

Refactor the python3 test from oe-core to do very
basic acceptance test of python2.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 lib/oeqa/runtime/cases/python2.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 lib/oeqa/runtime/cases/python2.py

diff --git a/lib/oeqa/runtime/cases/python2.py b/lib/oeqa/runtime/cases/python2.py
new file mode 100644
index 00000000..8afa2ac9
--- /dev/null
+++ b/lib/oeqa/runtime/cases/python2.py
@@ -0,0 +1,20 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+
+class PythonTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['python-core'])
+    def test_python(self):
+        cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+        status, output = self.target.run(cmd)
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "Hello, world", msg=msg)
-- 
2.25.0


