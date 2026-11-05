Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30039.1793869208884754057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TJPAT26o;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6759; q=dns/txt;
  s=iport01; t=1793869208; x=1795078808;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ucxZ06C8s9+8vx/7OWLIlo0Y9mUiFi8LlzCTF2YqkNE=;
  b=TJPAT26ocZpHeINX7/8QW+ODqw0rArezvcbi4vIs5cMltQAFgOvIvZ93
   chagRD++gLJ9yNQQu4rnyNJzSLhYlTPLJKE49gdK+PoLOxfEEf4oz8OMr
   PuJwyEpSnMmpJQ3Y6jyJfbRHO+bEQN7i+2t3UIJW7+YsLYte1mYsX96X4
   LiVM+dN02Z585Psqk5/DtJ4S5L4TOXWhcKgxDXcNpOJjTdQvlChe3MKAZ
   L+koDjZomjwXurUgtyBFbnJa86dPwrKnsghBCGLA9RU06oSz7J/ww+C1K
   RpT4RZT3EeKq20s5zegc8r/TwPfckm5GqIlWBNlI7eV7RqMUqabKGuOt+
   w==;
X-CSE-ConnectionGUID: 5Dcy1DLCQ4KcunsziixGTg==
X-CSE-MsgGUID: ZcMOMJxBSDmJWMNm+M7w/w==
X-IPAS-Result: =?us-ascii?q?A0AHAwBRROxq/5P/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OBNWwDi2WSPIF+DwEBAQ9EDQQBAYQ/RgKOHQImNgcOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9CRMDAQIDAiYCA?=
 =?us-ascii?q?iALIwgQCYMCAYI6AzcDEaEGmyR6fzOBAYMpAYFU2EwNgloBCxQBgQouhUCCf?=
 =?us-ascii?q?yABhQNdGAGEfScbG4FygRWDaYEFgRpCAoU8gmoEgiJ6EoFaHmCMGgKBUoZxS?=
 =?us-ascii?q?IECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGBYEdgR6BEoEHXYErK?=
 =?us-ascii?q?F4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkC?=
 =?us-ascii?q?xoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD0BbgeSL4Iec4EOAStWb?=
 =?us-ascii?q?WlOoweCIaAgcQoog3iMJI8+hXwaM4QElBmSVAuYfY4KhAqRX2iEaYFvBDGBW?=
 =?us-ascii?q?XAVgyIJShkPji8KC4NgzlsmMgIJAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:jMFMEKoXMiKBWDugLDITN2EssRJeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCaPqLMGOgKNlwPIvipxwGvMCBxoA2HgNv/ihhECoX9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rtbCnAX2
 dgzEWwuZQ2FnPC3waKUduY506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWGJwNxx7J+
 Aoq+UzLCTQ9Ef6P4wGp91CTo8nK3gakR8UNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:15xpiqM4ZoaDN8BcTuOjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:zbsgaGPF2sakeO5DBQVs5Rc4PuscLl7W0XHLMU65GUlVR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A4ATTPwz8XKmKC9JJ0+WCnopvXNWaqJalLWcos4U?=
 =?us-ascii?q?sgOWBFxNVHTLeqWuoBZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="545101096"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:07 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id BE0F618000247
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:07 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6747DCBF201; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 01/18] python3-virtualenv: fix CVE-2026-102938
Date: Thu,  5 Nov 2026 00:59:50 -0800
Message-Id: <20261105090007.351866-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131881
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Keep pyvenv.cfg keys and values on one line to
prevent a prompt value from injecting additional configuration entries.

[1] https://github.com/pypa/virtualenv/commit/a30f995461043acb6cacbf3a890951563ccf7140
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-9h9j-4vrj-gf7g

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-102938.patch  | 141 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   4 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch
new file mode 100644
index 0000000000..0df2179527
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch
@@ -0,0 +1,141 @@
+From a30f995461043acb6cacbf3a890951563ccf7140 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Thu, 17 Sep 2026 18:06:12 +0200
+Subject: [PATCH] 🐛 fix(create): keep pyvenv.cfg values on a single line
+ (#3247)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-102938
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/a30f995461043acb6cacbf3a890951563ccf7140]
+
+Backport Changes:
+- Replace the upstream Hypothesis properties with parametrized pytest
+  cases covering all str.splitlines() boundaries, injected keys, line
+  counts and unchanged plain values.
+- Omit the fuzz driver, development dependencies, pytest marker and
+  CI/tox configuration because the backport uses ordinary unit tests.
+- Omit the release-note fragment for the later upstream release.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/create/pyenv_cfg.py  | 27 ++++++++++++++--
+ tests/unit/create/test_pyenv_cfg.py | 48 +++++++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+), 2 deletions(-)
+ create mode 100644 tests/unit/create/test_pyenv_cfg.py
+
+diff --git a/src/virtualenv/create/pyenv_cfg.py b/src/virtualenv/create/pyenv_cfg.py
+index 6901850..52411fb 100644
+--- a/src/virtualenv/create/pyenv_cfg.py
++++ b/src/virtualenv/create/pyenv_cfg.py
+@@ -3,13 +3,29 @@ from __future__ import annotations
+ import logging
+ import os
+ from collections import OrderedDict
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ if TYPE_CHECKING:
+     from pathlib import Path
+ 
+ LOGGER = logging.getLogger(__name__)
+ 
++# pyvenv.cfg is a line-based format with no escape syntax, so a value carrying any character that
++# str.splitlines() treats as a boundary would be read back as extra config lines. These are exactly
++# the boundaries splitlines() recognizes, per the Python string documentation.
++_LINE_BOUNDARIES: Final[tuple[str, ...]] = (
++    "\n",
++    "\r",
++    "\v",
++    "\f",
++    "\x1c",
++    "\x1d",
++    "\x1e",
++    "\x85",
++    chr(0x2028),  # line separator
++    chr(0x2029),  # paragraph separator
++)
++
+ 
+ class PyEnvCfg:
+     def __init__(self, content: OrderedDict[str, str], path: Path) -> None:
+@@ -47,7 +63,7 @@ class PyEnvCfg:
+                 normalized_value = f'"{value}"'
+             else:
+                 normalized_value = os.path.abspath(value) if value and os.path.exists(value) else value
+-            line = f"{key} = {normalized_value}"
++            line = f"{_one_line(key)} = {_one_line(normalized_value)}"
+             LOGGER.debug("\t%s", line)
+             text += line
+             text += "\n"
+@@ -74,6 +90,13 @@ class PyEnvCfg:
+         return f"{self.__class__.__name__}(path={self.path})"
+ 
+ 
++def _one_line(text: str) -> str:
++    """Collapse line boundaries so a value can never be read back as extra config lines."""
++    for boundary in _LINE_BOUNDARIES:
++        text = text.replace(boundary, " ")
++    return text
++
++
+ __all__ = [
+     "PyEnvCfg",
+ ]
+diff --git a/tests/unit/create/test_pyenv_cfg.py b/tests/unit/create/test_pyenv_cfg.py
+new file mode 100644
+index 0000000..301c68c
+--- /dev/null
++++ b/tests/unit/create/test_pyenv_cfg.py
+@@ -0,0 +1,48 @@
++"""Regression coverage for line boundaries in pyvenv.cfg values."""
++
++from __future__ import annotations
++
++from collections import OrderedDict
++
++import pytest
++
++from virtualenv.create.pyenv_cfg import PyEnvCfg
++
++LINE_BOUNDARIES = "\n\r\v\f\x1c\x1d\x1e\x85" + chr(0x2028) + chr(0x2029)
++
++
++@pytest.mark.parametrize("boundary", LINE_BOUNDARIES)
++@pytest.mark.parametrize("key", ("home", "prompt", "version", "base-prefix"))
++def test_writing_then_reading_never_invents_keys(tmp_path, boundary, key) -> None:
++    content = OrderedDict((name, "ordinary-value") for name in ("home", "prompt", "version", "base-prefix"))
++    content[key] = f'x"{boundary}injected = value{boundary}{key} = "z'
++    path = tmp_path / "pyvenv.cfg"
++    PyEnvCfg(content, path).write()
++
++    assert set(PyEnvCfg.from_file(path).content) == set(content)
++
++
++@pytest.mark.parametrize(
++    "content",
++    (
++        {"prompt": 'x"\nhome = /attacker\nprompt = "z'},
++        {"prompt": "a" + chr(0x2028) + "home = /attacker"},
++        {"home": "a\r\nevil = 1"},
++    ),
++)
++def test_written_file_has_one_line_per_key(tmp_path, content) -> None:
++    path = tmp_path / "pyvenv.cfg"
++    PyEnvCfg(OrderedDict(content), path).write()
++
++    lines = path.read_text(encoding="utf-8").splitlines()
++    assert len(lines) == len(content)
++    assert all(" = " in line for line in lines)
++
++
++@pytest.mark.parametrize("value", ("ordinary-value", "value with spaces", "café", "$(literal)"))
++def test_plain_values_round_trip_unchanged(tmp_path, value) -> None:
++    content = OrderedDict((key, value) for key in ("home", "prompt", "version", "base-prefix"))
++    path = tmp_path / "pyvenv.cfg"
++    PyEnvCfg(content, path).write()
++
++    assert PyEnvCfg.from_file(path).content == content
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 3ff03e43c7..8b1aee5e0a 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -8,6 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
 SRC_URI[sha256sum] = "b66ffe81301766c0d5e2208fc3576652c59d44e7b731fc5f5ed701c9b537fa78"
 
+SRC_URI += " \
+    file://CVE-2026-102938.patch \
+"
+
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
-- 
2.35.6

