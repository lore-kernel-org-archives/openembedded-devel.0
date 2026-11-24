Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11969.1795496989552880003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=X1TaIGE8;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15032; q=dns/txt;
  s=iport01; t=1795496990; x=1796706590;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fbEjA4SO6Asje/G3JC4bFCVYXxyNEeC+NUhsGsBMkMo=;
  b=X1TaIGE8s/nSLfQvSTkBlzLZFRJjjn7Jb7r0KbEU+ic34Qg1gBwb52ep
   EGYLq7mNX3E5uAJ4eBieypIMAimLy2iQrO7Crvko+KxmSD2K3RjZoAZ85
   DoKyv44yJBOnhFlztjuBeH7Uwb036uTc0xmww7cBspTNpGQTKEk6Yp/kR
   RGzDo9p9YNpKUaR9/KPRl+HqsiAOGz9viWz7U42O3BRxzunDU+8sq3VTc
   fNDZ/MX2WtuCjy1Ee+Byb6BKqZ6r+pe3IVuaSrA4GZ5KPD2gdgreKlOJ+
   N5OJ/VDuW6Si/ORYKbY6pgSR3DUEqQ2p8RCWePDKe+lxXaQRXLrcrklmt
   w==;
X-CSE-ConnectionGUID: HaDwIonNSf+dYj7+A9J7Qg==
X-CSE-MsgGUID: Z0xiDRk3Q1OrqsXgctrHjw==
X-IPAS-Result: =?us-ascii?q?A0BOAgBXGwVr/89K/pBaHgEBCxIMggULgld1YUJJA4RUj?=
 =?us-ascii?q?1OCIQOLZoVqjFmBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIw8BGAEbAx8JEwMBAgMCJ?=
 =?us-ascii?q?gICIAsjCBAJgwIBgjoDNwIBEZ9omyR6gTKBAYMpAYFU2EwNgloBCxQBgQouh?=
 =?us-ascii?q?UKDACABhQNdGAGEfScbG4FygRWBF4JTgQWBGkICgSqEEoJqBIIiehKBVB4xj?=
 =?us-ascii?q?EgCgU+ISUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNS?=
 =?us-ascii?q?BEsNxUZBD0BbgeUFIInUxkGAQFgEwsPAQcBI4EZAkUMGQMkHDKSPgUukBWCI?=
 =?us-ascii?q?aAgcQoog3mKFIIQjz6FfBozhASBV6UXC5h9glmLMYQKhQeMTQsbTYRqgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD445g2uEUIIAyAsjNQIJAy8BAQcCBwEMAQMLgWiQACyBUgEB?=
IronPort-Data: A9a23:qo8Bu68ZZnQxSdW5wJMRDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DAbW26Fb/6IMDCmfIxyO4rj/EgA7ZbWxtIyHgI5+H9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kWNKEH2+FxJ1pAt
 vApKm9OR0Gh2Nu5lefTpulE3qzPLeHiMZlavjRryivUSK54B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YPHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oa3boqPJYzTLSlTtnTAt
 mPqxWeiO0g9LsWE+TWO7miMhPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:qPYfDKmtI8M9y2ws9gJL7mMZrNPpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AP9zXLGvcIzyM2666GblI3G086IsFe1HC7XDWBXS?=
 =?us-ascii?q?2SmpYSuLWYA6yp5prxp8=3D?=
X-Talos-MUID: 9a23:J6cXFAmFzIeoVNzACZg0dnpQbNdpz56tU3lUto8foPmLPjBqGzWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62682781"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:46 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 8BB4A180001F6
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id C67FECC2EF4; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 08/12]  python3-virtualenv: fix CVE-2026-113723
Date: Mon, 23 Nov 2026 21:09:38 -0800
Message-Id: <20261124050942.1795310-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132921
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Include the prompt-state correction in [3] to avoid introducing the
known follow-up regression when Bash prompt options change.

[1] https://github.com/pypa/virtualenv/commit/5f48d711731311428aebfae61d46957762155b22
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-6w3r-xr62-4xcp
[3] https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4

Package each additional upstream prerequisite or correction in its own
embedded patch with its own upstream metadata.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113723.patch  |  96 +++++++++++
 .../bash-prompt-state-followup.patch          | 160 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   2 +
 3 files changed, 258 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-state-followup.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
new file mode 100644
index 0000000000..cba08d5cc2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
@@ -0,0 +1,96 @@
+From 5f48d711731311428aebfae61d46957762155b22 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:35:17 -0700
+Subject: [PATCH] 🐛 fix(bash): preserve literal prompts in supported shells (#3418)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113723
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/5f48d711731311428aebfae61d46957762155b22]
+
+Backport Changes:
+ - Refresh the activation change for the older prompt block and retain
+   the existing zsh handling. Drop the older explicit PS1 export to match
+   upstream handling of prompts in child shells.
+ - Update the older activation tester to render PS1. The separate prompt
+   state follow-up carries the adapted compatibility and transition tests.
+   Omit newer upstream fixtures and docs/changelog/3418.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 40 ++++++++++++++----------------
+ tests/unit/activation/test_bash.py         |  7 +++++-
+ 2 files changed, 24 insertions(+), 23 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 416a65224cd5fcb9395985e3497c36f80d97924c..07e8201103f8c86ffd4eddb0eb6b6f45d08724f1 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -68,30 +68,26 @@ if ! [ -z "${PYTHONHOME+_}" ] ; then
+     unset PYTHONHOME
+ fi
+ 
+-if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
++if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] &&
++    { [ -n "${BASH_VERSION-}" ] || [ -n "${ZSH_VERSION-}" ]; }; then
+     _OLD_VIRTUAL_PS1="${PS1-}"
+-    _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT}"
+-    # bash, and zsh under PROMPT_SUBST, re-expand backslashes, dollar signs and backticks in PS1 on every redraw;
+-    # zsh gets the escaping even without the option, since a user can set it after activation. The guards keep
+-    # the substitution away from POSIX shells such as dash, which reject it with "Bad substitution"
+-    if [ -n "${BASH_VERSION-}" ]; then
+-        # bash first decodes its backslash prompt escapes, turning \\ into \ and \$ into $ (or # for root), and only
+-        # then expands the result, so each character needs escaping for both passes
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\\\\\}"
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\\\$}"
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\\\`}"
+-    elif [ -n "${ZSH_VERSION-}" ]; then
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\}"
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
++    # bash expands PS1 after decoding its prompt escapes when promptvars is on or in posix mode, so the prompt holds a
++    # reference to the variable and its value never reaches that expansion; otherwise only the decode runs and
++    # backslashes need doubling. zsh re-expands backslashes, dollar signs and backticks under PROMPT_SUBST, which a
++    # user can set after activation, and reads % as a prompt escape. The guards keep the substitutions away from
++    # POSIX shells such as dash, which reject them with "Bad substitution"
++    if [ -n "${BASH_VERSION-}" ] && { shopt -q promptvars || shopt -qo posix; }; then
++        PS1='(${VIRTUAL_ENV_PROMPT-}) '"${PS1-}"
++    else
++        _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT//\\/\\\\}"
++        if [ -n "${ZSH_VERSION-}" ]; then
++            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
++            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
++            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
++        fi
++        PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
++        unset _VIRTUAL_PROMPT
+     fi
+-    # zsh expands % sequences in PS1 as prompt escapes
+-    if [ -n "${ZSH_VERSION-}" ]; then
+-        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
+-    fi
+-    PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
+-    unset _VIRTUAL_PROMPT
+-    export PS1
+ fi
+ 
+ # Make sure to unalias pydoc if it's already there
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index f9ddc40f771031b7fcc46a917dbe998eee4aa677..fee118109bc47ac00df3955b28a80983405282c6 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -20,7 +20,12 @@ def test_bash(raise_on_non_source_class, activation_tester):
+             )
+ 
+         def print_prompt(self):
+-            return self.print_os_env_var("PS1")
++            return (
++                'if ((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1] >= 404)); then printf "%s\\n" "${PS1@P}"; '
++                "else case \"$PS1\" in '(${VIRTUAL_ENV_PROMPT-}) '*) "
++                "printf '(%s) %s\\n' \"$VIRTUAL_ENV_PROMPT\" \"${PS1#'(${VIRTUAL_ENV_PROMPT-}) '}\";; "
++                "*) printf '%s\\n' \"$PS1\";; esac; fi"
++            )
+ 
+     activation_tester(Bash)
+ 
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-state-followup.patch b/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-state-followup.patch
new file mode 100644
index 0000000000..5ca622906c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-state-followup.patch
@@ -0,0 +1,160 @@
+From 3598e201f6f044e389136b2347a8a919ac03c5f4 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Thu, 22 Oct 2026 13:06:22 -0700
+Subject: [PATCH] 🐛 fix(bash): escape the prompt for every PS1 state (#3466)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4]
+
+Backport Changes:
+ - Select the Bash prompt-state correction only. Retain the existing
+   zsh escaping instead of introducing the newer psvar mechanism.
+ - Add compatible unittest coverage for benign prompt values, compatibility
+   levels, unknown shells, nounset, and option transitions in both directions.
+ - Omit the other upstream source, tooling, test-fixture and documentation
+   changes, including docs/changelog/3466.bugfix.rst. The RECORD-writing
+   subset is applied separately by seed-record-exclusive-write.patch.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh    | 36 +++++++-----
+ tests/unit/activation/test_cve_2026_113723.py | 79 +++++++++++++++++++++++++++
+ 2 files changed, 101 insertions(+), 14 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 07e8201103f8c86ffd4eddb0eb6b6f45d08724f1..ea1c0d66a3da0af942d36ac1cf040d2c0b4839f3 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -71,23 +71,31 @@ fi
+ if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] &&
+     { [ -n "${BASH_VERSION-}" ] || [ -n "${ZSH_VERSION-}" ]; }; then
+     _OLD_VIRTUAL_PS1="${PS1-}"
+-    # bash expands PS1 after decoding its prompt escapes when promptvars is on or in posix mode, so the prompt holds a
+-    # reference to the variable and its value never reaches that expansion; otherwise only the decode runs and
+-    # backslashes need doubling. zsh re-expands backslashes, dollar signs and backticks under PROMPT_SUBST, which a
+-    # user can set after activation, and reads % as a prompt escape. The guards keep the substitutions away from
+-    # POSIX shells such as dash, which reject them with "Bad substitution"
+-    if [ -n "${BASH_VERSION-}" ] && { shopt -q promptvars || shopt -qo posix; }; then
+-        PS1='(${VIRTUAL_ENV_PROMPT-}) '"${PS1-}"
++    if [ -n "${BASH_VERSION-}" ]; then
++        # bash decodes its prompt escapes on every draw and expands the result when promptvars is on or in posix
++        # mode; both can change after activation and an exported PS1 reaches child shells, so the value gets escaped
++        # for both passes whatever the state is now. The escapes are built by concatenation because the replacement
++        # in ${var//pat/rep} loses backslashes depending on the bash version, BASH_COMPAT and patsub_replacement
++        _VIRTUAL_REST=$VIRTUAL_ENV_PROMPT
++        _VIRTUAL_PROMPT=
++        while [ -n "$_VIRTUAL_REST" ]; do
++            _VIRTUAL_CHAR=${_VIRTUAL_REST%"${_VIRTUAL_REST#?}"}
++            _VIRTUAL_REST=${_VIRTUAL_REST#?}
++            case $_VIRTUAL_CHAR in
++                \\) _VIRTUAL_PROMPT="$_VIRTUAL_PROMPT\\\\\\\\" ;;
++                \$ | \`) _VIRTUAL_PROMPT="$_VIRTUAL_PROMPT\\$_VIRTUAL_CHAR" ;;
++                *) _VIRTUAL_PROMPT="$_VIRTUAL_PROMPT$_VIRTUAL_CHAR" ;;
++            esac
++        done
++        unset _VIRTUAL_REST _VIRTUAL_CHAR
+     else
+         _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT//\\/\\\\}"
+-        if [ -n "${ZSH_VERSION-}" ]; then
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
+-        fi
+-        PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
+-        unset _VIRTUAL_PROMPT
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
+     fi
++    PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
++    unset _VIRTUAL_PROMPT
+ fi
+ 
+ # Make sure to unalias pydoc if it's already there
+diff --git a/tests/unit/activation/test_cve_2026_113723.py b/tests/unit/activation/test_cve_2026_113723.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..27c4596952332451b6d52082b26ad4505bca77f3
+--- /dev/null
++++ b/tests/unit/activation/test_cve_2026_113723.py
+@@ -0,0 +1,79 @@
++from __future__ import annotations
++
++import os
++import shlex
++import shutil
++import subprocess
++import tempfile
++import unittest
++from pathlib import Path
++
++
++@unittest.skipIf(os.name == "nt", "requires POSIX shell activation")
++class TestPromptCompatibility(unittest.TestCase):
++    def activation(self, root, prompt):
++        template = Path(__file__).resolve().parents[3] / "src/virtualenv/activation/bash/activate.sh"
++        text = template.read_text(encoding="utf-8")
++        for key, value in {
++            "__VIRTUAL_ENV__": str(root / "env"),
++            "__BIN_NAME__": "bin",
++            "__VIRTUAL_PROMPT__": prompt,
++        }.items():
++            text = text.replace(key, shlex.quote(value))
++        activate = root / "activate"
++        activate.write_text(text, encoding="utf-8")
++        return activate
++
++    def run_bash(self, activate, before="", after="", compatibility="42"):
++        env = {**os.environ, "TERM": "dumb", "BASH_COMPAT": compatibility}
++        env.pop("VIRTUAL_ENV_DISABLE_PROMPT", None)
++        commands = before + "\nPS1='BASE>'\n. " + shlex.quote(str(activate)) + "\n" + after + "\nexit\n"
++        return subprocess.run(
++            ["bash", "--noprofile", "--norc", "-i"], input=commands,
++            text=True, capture_output=True, env=env, timeout=10, check=True,
++        )
++
++    @unittest.skipUnless(shutil.which("bash"), "bash is not available")
++    def test_literal_prompt_with_compatibility_and_option_changes(self):
++        for compatibility in ("42", "44"):
++            for before, after in (
++                ("", ""),
++                ("shopt -u promptvars", "shopt -s promptvars"),
++                ("shopt -u promptvars", "set -o posix"),
++                ("shopt -u promptvars; set -o posix", ""),
++            ):
++                for prompt in ("plain", r"a\$HOME%tail", r"doubled\\slashes"):
++                    with self.subTest(compatibility=compatibility, before=before, after=after, prompt=prompt):
++                        with tempfile.TemporaryDirectory() as folder:
++                            activate = self.activation(Path(folder), prompt)
++                            result = self.run_bash(activate, before, after, compatibility)
++                            self.assertIn(f"({prompt}) BASE>", result.stderr)
++
++    @unittest.skipUnless(shutil.which("bash"), "bash is not available")
++    def test_promptvars_on_to_off_keeps_plain_prompt(self):
++        for prompt in ("plain", "two words", "owner's env"):
++            with self.subTest(prompt=prompt), tempfile.TemporaryDirectory() as folder:
++                activate = self.activation(Path(folder), prompt)
++                result = self.run_bash(activate, before="shopt -s promptvars", after="shopt -u promptvars")
++                self.assertIn(f"({prompt}) BASE>", result.stderr)
++                self.assertNotIn("${VIRTUAL_ENV_PROMPT-}", result.stderr)
++
++    @unittest.skipUnless(shutil.which("bash"), "bash is not available")
++    def test_unset_prompt_with_nounset(self):
++        with tempfile.TemporaryDirectory() as folder:
++            activate = self.activation(Path(folder), "plain")
++            result = self.run_bash(activate, after="set -u; unset VIRTUAL_ENV_PROMPT")
++            self.assertIn("(plain) BASE>", result.stderr)
++            self.assertNotIn("unbound variable", result.stderr)
++
++    @unittest.skipUnless(shutil.which("bash"), "bash is not available")
++    def test_unknown_shell_keeps_existing_prompt(self):
++        with tempfile.TemporaryDirectory() as folder:
++            activate = self.activation(Path(folder), "plain")
++            result = subprocess.run(
++                ["bash", "--noprofile", "--norc", "-c",
++                 'unset BASH_VERSION ZSH_VERSION; PS1=base; . "$1"; printf "%s" "$PS1"',
++                 "test", str(activate)],
++                text=True, capture_output=True, timeout=10, check=True,
++            )
++            self.assertEqual(result.stdout, "base")
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 21f419844b..fecbc723a6 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -18,6 +18,8 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://CVE-2026-113715.patch \
             file://ensure-within-prerequisite.patch \
             file://CVE-2026-113716.patch \
+            file://CVE-2026-113723.patch \
+            file://bash-prompt-state-followup.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

