Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 255687FEFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:04:33 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i6so3557379pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2WpiDESSiUjNbv9krrzHRn3OuhUUOVIo0mSF7Ds/fLw=;
	b=THYDPkYv5b8e0X1N2FHpWxLDiokscByet0EpEBEDantg2rHgvM2496SlLD8TxHqnRK
	a0+NxTn2zplWwr7CI01MGHjHdWsvtORgbuHXAkkBr2/gT8vVbAqeaV3JTYWy0RvNPoWB
	EGL38ERzLEDmIcu03ALJQxHiS0/YcGLYgIwcyvCaciAtAtFGj3uE2idCREfA7r2KXPFt
	YrPCsLmTTGFmEFD7W1dZZK2wl6mzl3gWs/IZHH02qJDXB+bC5dp5p88FGppDb+0fs58p
	H5GVCeWacVQIQAj9h8UgahvQarClv+2g0JUmaqx/w97fvfDPEOgZT+xIFpMH1bCdcyjI
	j8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2WpiDESSiUjNbv9krrzHRn3OuhUUOVIo0mSF7Ds/fLw=;
	b=OGdQIiS/THLirrjdQ68WOqj60WIcBcLRxzpMptEhVNj271Fe86Nqffm8/gnzNVV2l7
	rfLjOPaQOyPQLIhYxy1TUviBtX2Y0+axx40M6Zkdt5ILRdQR0JIwcfjnAFJwtnw1AnNp
	rC3FFRfXj1qh7OM1yX1fcKfH9IEhNJzTvnW3usEqUFxQeWXYwvgreGPPJPqtqUhsK73G
	GXIr2EP3eFWgGSvG2SlFwFzO8jU6O8HVehsoXL8BgLwEcTMEZV2NgqfnIvYYuatjeCGo
	M7lemi8fcJVdu6tte90/IoBtmzNrMHwqjBlhBYbTP3hY9pnYML0fpg27ZIbElDQAH4Zt
	Wb7A==
X-Gm-Message-State: APjAAAWt5lVQDdAuIkSG4aei2yvnElxZp6wkjpfexP5CCL/AoqdVIvz8
	3I50DJbeAHUBA6j20nOW/GEWUX3orOM=
X-Google-Smtp-Source: APXvYqwRvU96I9iRBiv1GbKYUT45NafCcC3I3TW2cUG3BCMKe34S7T59cErNckel+8Mzu/LNU3u8/Q==
X-Received: by 2002:a62:ac08:: with SMTP id v8mr3044629pfe.83.1579705473679;
	Wed, 22 Jan 2020 07:04:33 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b92a:2299:32b4:21fd])
	by smtp.gmail.com with ESMTPSA id o7sm3721235pjs.28.2020.01.22.07.04.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 07:04:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 07:04:04 -0800
Message-Id: <20200122150404.37978-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] lib/oeqa/runtime/cases: add python2.py
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
X-List-Received-Date: Wed, 22 Jan 2020 15:04:33 -0000
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


