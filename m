Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11751.1795496988092403056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JSjqLnPi;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8336; q=dns/txt;
  s=iport01; t=1795496988; x=1796706588;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/15FUcI2x2paAYbuKnfI1SEY1fc4hQtDA/m4m0JsX0g=;
  b=JSjqLnPiimOsxfz7ogweZ5Usi/8MibG11PAxY0D0Fl/kyx5PrLwJoEUt
   +OPSX/aoa4hJNXE/IdN1A70AQT2hGLzdLHOGK+sUXs8psK4oTHpeopLZR
   M+J7NIVCn7Js7rJn6QRmDv4F+BdyrKB2FDtn5WvdmFDYt7m8Ce+5a4bdO
   UHKV/WiiEWFakMGSI1F9ZjyCI7SxiI89b9sJMu/E/7YuEcm1jAqFNiD3K
   +wjtHMTHCpZ4Lh5Kp4BV8gJxXJUyBmrf1jsyzhLtESFRAkm3w12snbc7E
   Cq8dlOXd21mnigXy0eyd9YL/LBqG3Gn4x6Gzz8Bchgky+PQkoh0Az9rhm
   Q==;
X-CSE-ConnectionGUID: wC1xHJ74RlKm2UCVMxiNGQ==
X-CSE-MsgGUID: +2+2QsciQYajRr3+X7rn7w==
X-IPAS-Result: =?us-ascii?q?A0AGAwBOGgVr/85K/pBaglmCV3VhQkmEV49TgTVsA4tmh?=
 =?us-ascii?q?WqMWYF+DwEBAQ9EDQQBAYQ/RgKOIgImNgcOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9HAMBAgMCJgICIAsjCBmDA?=
 =?us-ascii?q?gGCOgM3AgERuwl6fzOBAYMpAYFU2EwNgloBCxQBgQouhUKDACABhQNdGAFEh?=
 =?us-ascii?q?DknGxuBcoQJdoEFgRpCAoU8gmoEgiKBDIFUHjEzjBUCgU+ISUiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD0BbgeUFIMaA?=
 =?us-ascii?q?Q0jXQErgRkHQJNYBZBDgiGgIHEKKIN5ihSCEI8+hXwaM4QElBqSVAuYfYJZi?=
 =?us-ascii?q?zGECpFfG02EaoFvATSBWXAVO4JnCUoZD44vCguDYM5bIzUCCTIBAQcCBwEMA?=
 =?us-ascii?q?QMLgWiQACyBUgEB?=
IronPort-Data: A9a23:YvUUtKJ16gSfAJ5OFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS3jNSn
 DdOD2qEMv+MYmajKdF2Povlpk9XvZ+HxtdiSgEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1xJxgmHa9HptxzImQUy
 NcmDSAMSD+60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIrj+SxYYqKEjCMbYYP3Ryhv
 WnHxlXwACsAb5+vliCDrW3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkveS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:gYMATqkuOOuDg8RHIruav/YMSmHpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AH0k3CGtKEEFD7Ga3n0I6sRo26Is6WSTN7FWPf3W?=
 =?us-ascii?q?8KmMzdZarbE+R3oxdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AkYZHtw4vC36E3EA5+wlDoJiNxowruef0MVsGkKw?=
 =?us-ascii?q?3ssu+L3czC2iHimuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62744987"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:44 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 0388118000231
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:44 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id A6852CC124D; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 02/12]  python3-virtualenv: fix CVE-2026-113776
Date: Mon, 23 Nov 2026 21:09:32 -0800
Message-Id: <20261124050942.1795310-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132909
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport upstream commit 602b26623a724827ff171bf11fef4ad186d01f74
to substitute activation-template placeholders in one pass. This keeps
placeholder names inside already quoted values unchanged.

Retain renderer checks and Bash/Python activation coverage for literal
placeholder names, adapted to virtualenv 20.25.3.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113776.patch  | 148 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
new file mode 100644
index 0000000000..c956aaa0f8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
@@ -0,0 +1,148 @@
+From 602b26623a724827ff171bf11fef4ad186d01f74 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Wed, 30 Sep 2026 23:01:05 -0700
+Subject: [PATCH] Merge commit from fork
+
+instantiate_template replaced one placeholder at a time across the whole
+template, so a placeholder name inside an already quoted value, such as a
+parent directory named __VIRTUAL_NAME__, was rewritten from inside the
+finished literal. The second value's quotes closed the first, and the rest
+of the path ran as code in bash, fish, xonsh and activate_this.py; in csh
+the prompt display tokens broke activate.csh the same way.
+
+Build every token's final text first and substitute them in one regex pass,
+with the csh display tokens joining that pass through substitutions().
+
+CVE: CVE-2026-113776
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/602b26623a724827ff171bf11fef4ad186d01f74]
+
+Backport Changes:
+ - Retain the untyped 20.25.3 method signatures. Omit the newer C shell
+   display-token override, whose tokens and helpers are absent here.
+ - Exercise literal placeholder names through unittest renderer and actual
+   Bash/Python activation checks for the older test layout.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/via_template.py     | 21 ++++++--
+ tests/unit/activation/test_cve_2026_113776.py | 73 +++++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+), 4 deletions(-)
+
+diff --git a/src/virtualenv/activation/via_template.py b/src/virtualenv/activation/via_template.py
+index 1f532213c3a915a113b780cc0ee1a0cdb0f841a2..a1c7b5b62a0062a1ffc8591bf05ba2254dcccc7e 100644
+--- a/src/virtualenv/activation/via_template.py
++++ b/src/virtualenv/activation/via_template.py
+@@ -1,6 +1,7 @@
+ from __future__ import annotations
+ 
+ import os
++import re
+ import shlex
+ import sys
+ from abc import ABC, abstractmethod
+@@ -72,10 +73,22 @@ class ViaTemplateActivator(Activator, ABC):
+         # read content as binary to avoid platform specific line normalization (\n -> \r\n)
+         binary = read_binary(self.__module__, template)
+         text = binary.decode("utf-8", errors="strict")
+-        for key, value in replacements.items():
+-            value_uni = self._repr_unicode(creator, value)
+-            text = text.replace(key, self.quote(value_uni))
+-        return text
++        substitutions = self.substitutions(replacements, creator)
++        # one pass over the template, so a placeholder name inside an already quoted value (a path component named
++        # __VIRTUAL_NAME__) stays data instead of being rewritten by a later key from inside the finished literal
++        pattern = re.compile("|".join(re.escape(key) for key in sorted(substitutions, key=len, reverse=True)))
++        return pattern.sub(lambda match: substitutions[match.group()], text)
++
++    def substitutions(self, replacements, creator):
++        """Map each placeholder to the final text that replaces it in the template.
++
++        :param replacements: the raw placeholder values
++        :param creator: the creator of the environment
++
++        :returns: the placeholder to substituted text mapping
++
++        """
++        return {key: self.quote(self._repr_unicode(creator, value)) for key, value in replacements.items()}
+ 
+     @staticmethod
+     def _repr_unicode(creator, value):  # noqa: ARG004
+diff --git a/tests/unit/activation/test_cve_2026_113776.py b/tests/unit/activation/test_cve_2026_113776.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..3a767dd44a92882b9705d7ff847928dc1e7a2b78
+--- /dev/null
++++ b/tests/unit/activation/test_cve_2026_113776.py
+@@ -0,0 +1,73 @@
++"""Keep placeholder names in activation values as literal data."""
++from __future__ import annotations
++
++import json
++import os
++from pathlib import Path
++import shutil
++import subprocess
++import sys
++import tempfile
++from types import SimpleNamespace
++import unittest
++from unittest.mock import patch
++
++from virtualenv.activation import BashActivator, PythonActivator
++from virtualenv.run import cli_run
++
++
++class TemplateSubstitutionTests(unittest.TestCase):
++    def test_replacement_values_are_not_rescanned(self):
++        values = {
++            "__VIRTUAL_ENV__": "/parent__VIRTUAL_NAME__/owner's env",
++            "__VIRTUAL_NAME__": "plain",
++            "__VIRTUAL_PROMPT__": "show __VIRTUAL_ENV__ literally",
++        }
++        template = "\n".join(values).encode()
++        for activator_type in (BashActivator, PythonActivator):
++            activator = activator_type(SimpleNamespace(prompt=None))
++            expected = "\n".join(activator.quote(value) for value in values.values())
++            for order in (list(values), list(reversed(values))):
++                with self.subTest(activator=activator_type.__name__, order=order), patch(
++                    "virtualenv.activation.via_template.read_binary", return_value=template
++                ):
++                    result = activator.instantiate_template({key: values[key] for key in order}, "template", None)
++                    self.assertEqual(result, expected)
++
++    def test_longest_token_is_matched_first(self):
++        activator = BashActivator(SimpleNamespace(prompt=None))
++        with patch("virtualenv.activation.via_template.read_binary", return_value=b"__TOKEN__LONG __UNKNOWN__"):
++            result = activator.instantiate_template({"__TOKEN__": "short", "__TOKEN__LONG": "long"}, "template", None)
++        self.assertEqual(result, "long __UNKNOWN__")
++
++    def test_activation_preserves_placeholder_names_in_path_and_prompt(self):
++        bash = shutil.which("bash")
++        if bash is None:
++            self.skipTest("bash is not installed")
++        with tempfile.TemporaryDirectory() as directory:
++            dest = Path(directory) / "parent__VIRTUAL_NAME__" / "owner's env"
++            prompt = "plain __VIRTUAL_ENV__ and __VIRTUAL_NAME__"
++            cli_run([
++                "--without-pip", "--no-periodic-update", "--activators", "bash,python",
++                "--prompt", prompt, str(dest),
++            ])
++            result = subprocess.run(
++                [bash, "--noprofile", "--norc", "-c",
++                 '. "$1"; printf "%s\\n%s\\n" "$VIRTUAL_ENV" "$VIRTUAL_ENV_PROMPT"',
++                 "activation-check", str(dest / "bin/activate")],
++                check=True, capture_output=True, text=True,
++            )
++            self.assertEqual(result.stdout.splitlines(), [str(dest), prompt])
++            code = (
++                "import json, os, runpy, sys; runpy.run_path(sys.argv[1]); "
++                "print(json.dumps([os.environ['VIRTUAL_ENV'], os.environ['VIRTUAL_ENV_PROMPT']]))"
++            )
++            result = subprocess.run(
++                [sys.executable, "-c", code, str(dest / "bin/activate_this.py")],
++                check=True, capture_output=True, text=True, env=os.environ.copy(),
++            )
++            self.assertEqual(json.loads(result.stdout), [str(dest), prompt])
++
++
++if __name__ == "__main__":
++    unittest.main()
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index c9aad9fc3c..c13c1b96ba 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
 SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2024-53899.patch \
+            file://CVE-2026-113776.patch \
             file://powershell-curly-quotes.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
-- 
2.35.6

