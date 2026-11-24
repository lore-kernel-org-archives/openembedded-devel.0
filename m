Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11752.1795496988276601818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eNS9h2Ft;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11907; q=dns/txt;
  s=iport01; t=1795496988; x=1796706588;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RV6LiT1s6kuCt3DNjy5n2p4GaPIrvlzAyO2XdhVyOHI=;
  b=eNS9h2FtaASJYD5Us8eTkuGH4QZspO6hW/XWFFSgAebuHznlKnkzXGb2
   EnF0G/piYATxqcnjWHql8gvAOEfBMa6MrdKbIA5t/HU8B2G1WzYza3hhy
   crFyVcYAv+OsWyNzPe2QwE0WYdD0+ojyr7WLQT8lgimyZXF386NfWNcJk
   xkYX3RNAVUZGw6SvXPLqTu32w0020hgendbtycmGc/wNQZrNu5GD6A09e
   2Qgn7+Y+iIXd11BApQmn7spnKjkiWmUl0Ik6qxFP5JK3jSvf6UqjCAsAT
   0XAoBgPJNWH0AKW3BuHgF/taMeeoRGNXHutW9t3tA9JLTUT8qhMdSCtnn
   g==;
X-CSE-ConnectionGUID: 36B5ipZFTTe8HvNlYtiaBQ==
X-CSE-MsgGUID: UiDYY/vjR/2jzlPesEu9pw==
X-IPAS-Result: =?us-ascii?q?A0AcAAADGgVr/9NK/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YUJJA4RUiBuHOIIhA4MciEqSQ4F+DwEBAQ9EDQQBAYQ/RgKOI?=
 =?us-ascii?q?gImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECA?=
 =?us-ascii?q?QMjDwEYAR0BHwkTAwECAwImAgIgCyMIEAmDAgGCOgM3AgERn2ObJHqBMoEBg?=
 =?us-ascii?q?ykBgVTYTA2CWgELFAGBCi4BhUGDACABhQNdGAFEhDknGxuBcoEVgReCU4EFS?=
 =?us-ascii?q?09CAoU8gmoEgiJ6EoFUHox5AoFPiElIgQIcA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSCJ3MBehMBK4EZAkUlJ5MMk?=
 =?us-ascii?q?EiCIaAgcQoog3mKFIIQjz6FfBozhVulFwuYfY4KhAqFB4xNC2iEaoFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOYNrgSWBNIF3ygsjNQIJAy8BAQcCBwEMAQMLgWiQACyBUgEB?=
IronPort-Data: A9a23:lG6VI6+tc/tnBHoOHAESDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GYbDG7XPanYamv1edsgadu18BxQ65fUytNqSAc+qSlEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ltY6dF+/5FL11y+
 Kw4NhYJXwyCjsiPlefTpulE3qzPLeHiMZlavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW8YYeIJ4LSLSlTtnuZi
 lP3uHr7OFZANs6b8Tee32/9nvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:qFaAHKwzUZqXLOojFCWpKrPwDr1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOHYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AdwomT2kBI2c+x06acfPHY5w5yqzXOSaD5irRO32?=
 =?us-ascii?q?WNVpkGJ2Lb1uh5KJtufM7zg=3D=3D?=
X-Talos-MUID: 9a23:5h8RlQUH8XvlENbq/ALtqABTc9lq2eP0ClIJqZgdltTVLTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="59955560"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:44 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 0921B180001D1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:44 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id AC019CC124E; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 03/12]  python3-virtualenv: fix CVE-2026-113732
Date: Mon, 23 Nov 2026 21:09:33 -0800
Message-Id: <20261124050942.1795310-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132912
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix in [1], identified by the
upstream security advisory in [2], to virtualenv 20.25.3.

[1] https://github.com/pypa/virtualenv/commit/3bddeaf8d02c3ee7f576503efb082f8f494cfcab
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-c947-3pg5-gm8q

Include the corrected Fish 3 multibyte and legacy-locale quoting
from upstream 685435d7fb53da12da99e195ee2753f5ca083249, with
activation-level path and prompt coverage.

Package each additional upstream prerequisite or correction in its own
embedded patch with its own upstream metadata.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113732.patch  |  66 +++++++
 .../fish3-multibyte-quoting.patch             | 165 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   2 +
 3 files changed, 233 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/fish3-multibyte-quoting.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732.patch
new file mode 100644
index 0000000000..452c69432a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732.patch
@@ -0,0 +1,66 @@
+From 3bddeaf8d02c3ee7f576503efb082f8f494cfcab Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Wed, 30 Sep 2026 22:59:45 -0700
+Subject: [PATCH] Merge commit from fork
+
+FishActivator inherited shlex.quote, whose POSIX rules leave a backslash
+literal inside single quotes. fish reads \' there as an escaped quote, so a
+path or --prompt with a backslash before a quote ended the literal early and
+ran the rest as commands, without any error from fish.
+
+Give FishActivator its own quote() that escapes backslashes and quotes.
+
+CVE: CVE-2026-113732
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3bddeaf8d02c3ee7f576503efb082f8f494cfcab]
+
+Backport Changes:
+ - Adapt the quoting method to the older untyped FishActivator interface.
+ - Replace the newer upstream fixtures with quote-value checks for this
+   test layout; the older source has no Tcl/Tk activation paths.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/fish/__init__.py |  6 ++++++
+ tests/unit/activation/test_fish.py         | 12 ++++++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/src/virtualenv/activation/fish/__init__.py b/src/virtualenv/activation/fish/__init__.py
+index 57f790f47382be6c1ed5d10a9e627e71be562e42..a402ce1d4483f1ea329d736405136d22e41eb543 100644
+--- a/src/virtualenv/activation/fish/__init__.py
++++ b/src/virtualenv/activation/fish/__init__.py
+@@ -7,6 +7,12 @@ class FishActivator(ViaTemplateActivator):
+     def templates(self):
+         yield "activate.fish"
+ 
++    @staticmethod
++    def quote(string):
++        # fish reads \\ and \' as escapes inside single quotes, unlike POSIX sh, so shlex.quote's output lets a
++        # backslash before a quote end the literal early
++        return "'" + string.replace("\\", "\\\\").replace("'", "\\'") + "'"
++
+ 
+ __all__ = [
+     "FishActivator",
+diff --git a/tests/unit/activation/test_fish.py b/tests/unit/activation/test_fish.py
+index 6a92a27909077d18eeb4674594dd878fe49899a5..8a9397ea5fb15d600082ed27f873f4264a908c18 100644
+--- a/tests/unit/activation/test_fish.py
++++ b/tests/unit/activation/test_fish.py
+@@ -6,6 +6,18 @@ from virtualenv.activation import FishActivator
+ from virtualenv.info import IS_WIN
+ 
+ 
++@pytest.mark.parametrize(
++    ("value", "expected"),
++    [
++        ("", "''"),
++        ("plain path", "'plain path'"),
++        ("a\\b'c", "'a\\\\b\\'c'"),
++    ],
++)
++def test_fish_quote(value, expected):
++    assert FishActivator.quote(value) == expected
++
++
+ @pytest.mark.skipif(IS_WIN, reason="we have not setup fish in CI yet")
+ def test_fish(activation_tester_class, activation_tester, monkeypatch, tmp_path):
+     monkeypatch.setenv("HOME", str(tmp_path))
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/fish3-multibyte-quoting.patch b/meta-python/recipes-devtools/python/python3-virtualenv/fish3-multibyte-quoting.patch
new file mode 100644
index 0000000000..20ed6cb465
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/fish3-multibyte-quoting.patch
@@ -0,0 +1,165 @@
+From 685435d7fb53da12da99e195ee2753f5ca083249 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:08:22 -0700
+Subject: [PATCH] 🐛 fix(fish): separate escapes from multibyte text (#3413)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113732
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/685435d7fb53da12da99e195ee2753f5ca083249]
+
+Backport Changes:
+ - Refresh FishActivator context for 20.25.3 and omit the release-only
+   changelog fragment.
+ - Adapt the literal quoting tests to the existing pytest layout and add
+   unittest checks that run without a Fish installation. Add benign generated
+   activation path/prompt checks for UTF-8 and Fish 3 legacy multibyte locales,
+   skipping unavailable shells or locales. The older source has no Tcl/Tk paths.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/fish/__init__.py    |  7 +-
+ tests/unit/activation/test_cve_2026_113732.py | 96 +++++++++++++++++++++++++++
+ tests/unit/activation/test_fish.py            |  2 +-
+ 3 files changed, 101 insertions(+), 4 deletions(-)
+
+diff --git a/src/virtualenv/activation/fish/__init__.py b/src/virtualenv/activation/fish/__init__.py
+index a402ce1d4483f1ea329d736405136d22e41eb543..6da51ddd2ad02b4fc7f16e177ecd2694518a54b5 100644
+--- a/src/virtualenv/activation/fish/__init__.py
++++ b/src/virtualenv/activation/fish/__init__.py
+@@ -1,5 +1,7 @@
+ from __future__ import annotations
+ 
++import re
++
+ from virtualenv.activation.via_template import ViaTemplateActivator
+ 
+ 
+@@ -9,9 +11,8 @@ class FishActivator(ViaTemplateActivator):
+ 
+     @staticmethod
+     def quote(string):
+-        # fish reads \\ and \' as escapes inside single quotes, unlike POSIX sh, so shlex.quote's output lets a
+-        # backslash before a quote end the literal early
+-        return "'" + string.replace("\\", "\\\\").replace("'", "\\'") + "'"
++        # Keep escapes beside ASCII quotes so legacy decoders cannot absorb them into a preceding multibyte character.
++        return "'" + re.sub(r"[\\']", lambda match: f"'\\{match.group()}'", string) + "'"
+ 
+ 
+ __all__ = [
+diff --git a/tests/unit/activation/test_cve_2026_113732.py b/tests/unit/activation/test_cve_2026_113732.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..c7619b07d57411fd82e85aecdcec5f83cf11452e
+--- /dev/null
++++ b/tests/unit/activation/test_cve_2026_113732.py
+@@ -0,0 +1,96 @@
++from __future__ import annotations
++
++import os
++import shutil
++import subprocess
++import tempfile
++import unittest
++from argparse import Namespace
++from pathlib import Path
++from types import SimpleNamespace
++
++
++class TestFishQuote(unittest.TestCase):
++    def test_empty(self):
++        from virtualenv.activation import FishActivator
++
++        self.assertEqual(FishActivator.quote(""), "''")
++
++    def test_space(self):
++        from virtualenv.activation import FishActivator
++
++        self.assertEqual(FishActivator.quote("plain text"), "'plain text'")
++
++    def test_unicode_apostrophe(self):
++        from virtualenv.activation import FishActivator
++
++        self.assertEqual(FishActivator.quote("café's"), "'café'\\''s'")
++
++    def test_unicode_backslash(self):
++        from virtualenv.activation import FishActivator
++
++        self.assertEqual(FishActivator.quote("café\\path"), "'café'\\\\'path'")
++
++
++@unittest.skipIf(os.name == "nt", "requires POSIX fish activation")
++@unittest.skipUnless(shutil.which("fish"), "fish is not available")
++class TestFishActivationValues(unittest.TestCase):
++    @staticmethod
++    def available_locales():
++        if not shutil.which("locale"):
++            return set()
++        result = subprocess.run(["locale", "-a"], capture_output=True, text=True, check=True)
++        return set(result.stdout.splitlines())
++
++    def check_activation(self, locale_name, name, prompt):
++        from virtualenv.activation import FishActivator
++
++        with tempfile.TemporaryDirectory() as folder:
++            root = Path(folder)
++            dest = root / name
++            bin_dir = dest / "bin"
++            bin_dir.mkdir(parents=True)
++            creator = SimpleNamespace(dest=dest, bin_dir=bin_dir, env_name=name, pyenv_cfg={})
++            [activate] = FishActivator(Namespace(prompt=prompt)).generate(creator)
++            env = {**os.environ, "HOME": str(root), "LC_ALL": locale_name}
++            env.pop("VIRTUAL_ENV_DISABLE_PROMPT", None)
++            result = subprocess.run(
++                [
++                    "fish", "--no-config", "-c",
++                    'function fish_prompt; printf BASE; end; source $argv[1]; '
++                    'printf "%s\\n" "$VIRTUAL_ENV" "$VIRTUAL_ENV_PROMPT"; fish_prompt',
++                    str(activate),
++                ],
++                env=env, capture_output=True, timeout=10, check=True,
++            )
++            expected = f"{dest}\n{prompt}\n({prompt}) BASE\n".encode("utf-8")
++            self.assertEqual(result.stdout, expected)
++
++    def test_utf8_paths_and_prompts(self):
++        available = self.available_locales()
++        locale_name = next((name for name in ("C.UTF-8", "C.utf8", "en_US.UTF-8", "en_US.utf8") if name in available), None)
++        if locale_name is None:
++            self.skipTest("a UTF-8 locale is not available")
++        for name, prompt in (
++            ("two words", "plain prompt"),
++            ("owner's\\env", "owner's\\prompt"),
++            ("euro€'env", "euro€'prompt"),
++        ):
++            with self.subTest(name=name, prompt=prompt):
++                self.check_activation(locale_name, name, prompt)
++
++    def test_fish3_legacy_locale_paths_and_prompts(self):
++        version = subprocess.run(["fish", "--version"], capture_output=True, text=True, check=True).stdout
++        if "version 3." not in version:
++            self.skipTest("the legacy locale regression requires fish 3")
++        available = self.available_locales()
++        locales = [name for name in ("ja_JP.eucjp", "zh_CN.gbk", "zh_CN.gb18030", "zh_TW.big5") if name in available]
++        if not locales:
++            self.skipTest("a legacy multibyte locale is not available")
++        for locale_name in locales:
++            for name, prompt in (
++                ("euro€'env", "euro€'prompt"),
++                ("euro€\\env", "euro€\\prompt"),
++            ):
++                with self.subTest(locale=locale_name, name=name, prompt=prompt):
++                    self.check_activation(locale_name, name, prompt)
+diff --git a/tests/unit/activation/test_fish.py b/tests/unit/activation/test_fish.py
+index 8a9397ea5fb15d600082ed27f873f4264a908c18..f1ce6e93a893d8bbf2f6c2d3a51e884a9c901f3a 100644
+--- a/tests/unit/activation/test_fish.py
++++ b/tests/unit/activation/test_fish.py
+@@ -11,7 +11,7 @@ from virtualenv.info import IS_WIN
+     [
+         ("", "''"),
+         ("plain path", "'plain path'"),
+-        ("a\\b'c", "'a\\\\b\\'c'"),
++        ("a\\b'c", "'a'\\\\'b'\\''c'"),
+     ],
+ )
+ def test_fish_quote(value, expected):
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index c13c1b96ba..8837d39ec9 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -10,6 +10,8 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2024-53899.patch \
             file://CVE-2026-113776.patch \
             file://powershell-curly-quotes.patch \
+            file://CVE-2026-113732.patch \
+            file://fish3-multibyte-quoting.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

