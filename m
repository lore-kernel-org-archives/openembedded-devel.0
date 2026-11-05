Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30265.1793869209177458011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KJjf27r1;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7840; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+jaZV3gZM7dUEeZZcAb31dxCq0IyiQtkrLceKyRyQT4=;
  b=KJjf27r1Qej6ldKMdPFwNk5WNZCRYC1FPoAcV7yYziaU4AoIFG0z1HIZ
   dwI423dIiAnMY7tdhtk6R9iTkzJK792wMLngsFUU7iqPo9os6LBZZAcVu
   70eQrqumR8U4czycEQsWHE6DswMa0rZRv2nJ6IjlJjXBsBhvwYwW3Yfyk
   WAXrC9vPMPTZzBO/v6g053+Ct+212wFSyQFFeMhNRDMSSEIJ+8SQgiM2h
   9dUDaoZ1RnGrzhXFigLSykihgNOCaRdTCNYtJSgmCOvvcZ2ddYzVLshW8
   KyhcKECvrda51ovHDg7UYeqwluzBIdAkyK1PnaKyCxQOkNSBehQ5VA2C5
   Q==;
X-CSE-ConnectionGUID: 9xL5NoUTSN61bfGZIsE2Xw==
X-CSE-MsgGUID: KkZ4d4nXSX6smRBfAceyGA==
X-IPAS-Result: =?us-ascii?q?A0CFAADGROxq/5P/Ja1aHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?lZ1YAo5SQOEVI9TgiEDgROKUpI8gX4PAQEBD0QNBAEBhD9GAo4dAiY2Bw4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYA?=
 =?us-ascii?q?T0JEwMBAgMCJgICIAsjCBmDAgGCOgM3AxGhDZsken8zgQGDKQGBVNhMDYJaA?=
 =?us-ascii?q?QsUAYEKLgGFP4J/IAGFA10YAUSEOScbG4FygRWCc3aBBYEaQgKFPIJqBIINF?=
 =?us-ascii?q?YEMgVoegweJcwKBUoZxSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvW?=
 =?us-ascii?q?BsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZB?=
 =?us-ascii?q?D0BbgeSL4MRDko2ASsXgQlATA4Bkn0FkESCIaAgcQoog3iKFIIQjz6FfBozh?=
 =?us-ascii?q?ASBV5JCklQLmH2OCoQKkXpNhGmBbwMygVlwFYMiCUoZD44uCwuDYIVkyHcmM?=
 =?us-ascii?q?gIJAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:RHVZYa1AB0H2NaE2L/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYPy
 jcbUGHUOvyKYGX2f492ady3/ElVuZ7cndc1TwVs3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXVESYKsfx9pMJz8X/
 /I3GhEWQ0qzmLfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeSxYIWJIYXXLSlTtmWbl
 D7Ko2LJOSFEL9ml4zSs+X+9qcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:LCoC/qGLC1zj0qOzpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:VGvOoG/mmWSz1eTdRjmVvx8EPp0DdUDh91GOekW2JlRIU5DPeUDFrQ==
X-Talos-MUID: 9a23:Qw2U4Aul9FpJN1Tloc2npzJQaMs05ZSVOB4WlK8steCPOD1fEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544874315"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 28C411800027C
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7748FCBF21E; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 05/18] python3-virtualenv: fix CVE-2026-113776
Date: Thu,  5 Nov 2026 00:59:54 -0800
Message-Id: <20261105090007.351866-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131885
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Replace activation-template placeholders in a
single pass so placeholder names inside substituted paths or prompts
cannot be expanded again as script content.

[1] https://github.com/pypa/virtualenv/commit/602b26623a724827ff171bf11fef4ad186d01f74
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-8rjx-v5ww-45pp

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113776.patch  | 133 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
new file mode 100644
index 0000000000..c1e034edb5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
@@ -0,0 +1,133 @@
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
+- Omit the Csh display-token override and its specific test: 21.2.1 has
+  no separate display-token substitution or prompt-literal helpers.
+  Its Csh activator uses the corrected shared template substitution.
+- Exercise upstream's placeholder-in-parent-directory regression through
+  the existing Bash relocation fixture, since 21.2.1 lacks the later
+  prompt-test fixture. Add direct one-pass substitution checks for the
+  existing Bash, Csh, Fish and Python activators, and retain the 21.2.1
+  special-character fixture's other characters.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/via_template.py | 21 +++++++++++++++++----
+ tests/conftest.py                         |  3 ++-
+ tests/unit/activation/test_activator.py   | 16 ++++++++++++++++
+ tests/unit/activation/test_bash.py        |  1 +
+ 4 files changed, 36 insertions(+), 5 deletions(-)
+
+diff --git a/src/virtualenv/activation/via_template.py b/src/virtualenv/activation/via_template.py
+index 926c2b0..3af9dc5 100644
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
+@@ -84,10 +85,22 @@ class ViaTemplateActivator(Activator, ABC):
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
++    def substitutions(self, replacements: dict[str, str], creator: Creator) -> dict[str, str]:
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
+     def _repr_unicode(creator: Creator, value: str) -> str:  # noqa: ARG004
+diff --git a/tests/conftest.py b/tests/conftest.py
+index 3ec4147..f27c450 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -279,7 +279,8 @@ def is_inside_ci():
+ 
+ @pytest.fixture(scope="session")
+ def special_char_name():
+-    base = "'\";&&e-$ èрт🚒♞中片-j"
++    # __VIRTUAL_NAME__ is a template placeholder, and must stay data when the path embeds it
++    base = "'\";&&e-$ __VIRTUAL_NAME__èрт🚒♞中片-j"
+     if IS_WIN:
+         # get rid of invalid characters on Windows
+         base = base.replace('"', "")
+diff --git a/tests/unit/activation/test_activator.py b/tests/unit/activation/test_activator.py
+index 21be96d..03481c2 100644
+--- a/tests/unit/activation/test_activator.py
++++ b/tests/unit/activation/test_activator.py
+@@ -4,9 +4,25 @@ from argparse import Namespace
+ 
+ import pytest
+ 
++from virtualenv.activation import BashActivator, CShellActivator, FishActivator, PythonActivator
+ from virtualenv.activation.activator import Activator
+ 
+ 
++@pytest.mark.parametrize("activator_class", [BashActivator, CShellActivator, FishActivator, PythonActivator])
++def test_template_substitution_does_not_expand_replacement_values(monkeypatch, activator_class) -> None:
++    template = b"__VIRTUAL_ENV__ __VIRTUAL_NAME__"
++    monkeypatch.setattr("virtualenv.activation.via_template.read_binary", lambda *_: template)
++    activator = activator_class(Namespace(prompt=None))
++    replacements = {
++        "__VIRTUAL_ENV__": "A__VIRTUAL_NAME__B/x'$(touch PWNED)'y",
++        "__VIRTUAL_NAME__": "x'$(touch PWNED)'y",
++    }
++
++    actual = activator.instantiate_template(replacements, "unused", None)
++
++    assert actual == " ".join(activator.quote(value) for value in replacements.values())
++
++
+ @pytest.mark.graalpy
+ def test_activator_prompt_cwd(monkeypatch, tmp_path) -> None:
+     class FakeActivator(Activator):
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index 00ac55f..df3aaf3 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -130,6 +130,7 @@ def test_bash_activate_relocation_resolves_virtual_env(
+         pytest.param("x'$(id > PWNED)'y", id="command-substitution"),
+         pytest.param("x'`id > PWNED`'y", id="backticks"),
+         pytest.param("a';id > PWNED;'b", id="statement-separator"),
++        pytest.param("A__VIRTUAL_NAME__B/x'$(touch PWNED)'y", id="placeholder-in-parent-dir"),
+     ],
+ )
+ def test_bash_activate_relocation_does_not_run_path_commands(
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 66354956b9..65e50d3f88 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://CVE-2026-102925.patch \
     file://CVE-2026-113732_p1.patch \
     file://CVE-2026-113732_p2.patch \
+    file://CVE-2026-113776.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

