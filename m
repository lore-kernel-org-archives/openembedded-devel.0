Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30267.1793869209536501694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dWpo9kG+;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=32232; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tBFJ/6kABc/Pmtn7+nOcyzdyEyROqXz7cC1HvpsLN40=;
  b=dWpo9kG+ebtw8TzgfV6G8ucrL7fwEgLd0tsU1gBLxTvYL7j/Qja/Lij8
   /DMyE51Lg5Xy108cktCUcKFeTMKjfMWsdme1Qz1rtyjYZNY1CZKCqoQDA
   AvsXMlYFzMejuuku8mmRtkig6iQXynFfgpWp25btJg9MBIvT5AzAfgiqC
   98kHgJvo9AI+2QTFPQM5U8jf58IF1ZZaQbm0JzxCak9mj/jrud0H0lW8q
   IKKDlDVr8048QL2/OEL0+XjMEFnuiS6futWjXCtrNhtggwgXW1BxpvXh1
   ZmuQpl9POmAx8w/av+2nhIidTVv0Yio/PVP9K28SfKrRVOUPTqdpoQQSW
   g==;
X-CSE-ConnectionGUID: cnHrb/lFTG+o44hf0j70GA==
X-CSE-MsgGUID: gUIXfdMaTVeYAn40sRAVHQ==
X-IPAS-Result: =?us-ascii?q?A0D7AgDGROxq/4//Ja1aglmCV3VgQ0kDhFSPU4IhA4Mci?=
 =?us-ascii?q?EmDJoJBjFWBfg8BAQEPRA0EAQGEP0YCjh0CJjUIDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDGgEIBAsBGAEeHwkTAwECAwImA?=
 =?us-ascii?q?gIgCyMIEAmDAgGCOgM3AxGhDZsken8zgQGDKQGBVNhMDYJaAQsUAYEKLoVAg?=
 =?us-ascii?q?n8gAYUDXRgBhH0nGxuBcoEVgReCUoEFgRpCAoEqhBKCagSCDRWBDIFaHjIzg?=
 =?us-ascii?q?iKDG4ZYAoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YGwYFg?=
 =?us-ascii?q?R2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPQFuB?=
 =?us-ascii?q?5IvghUvLRkGAQEwKSUPAQckgQUbLQQPDBgBGg0OAQ0ykj4TklegIHEKKIN4i?=
 =?us-ascii?q?hSCEI8+hXwaM4QEgVeSQpJUC5h9glmLMYQKkV8LEE2EaYFpATqBWXAVO4JnC?=
 =?us-ascii?q?UoZD445g2uCWYN3yAsmMgIJAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:dP5P8awDMO+0U+yfQSR6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUAx
 2sWCzyFa6vbZ2GmeIwib4W38EhUsJ7cm9YyGQZtr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEowHZcSveJZPU4N8
 qBEKD5VbE/bqMvjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxa4uKIIPXFK25mG6Xm
 0P28WjcCy0kOe22z2bd6UiFuM/2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:kBHvEKikJeaflj3hIPROKdac/3BQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AalC+8mgqd0G9zmXGjj8LH3cknTJueXv91n2XJ2G?=
 =?us-ascii?q?EJiVuFOGVRweSp/tLup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AMk9RcAyZGzAcecLPWuZXJtJVTqaaqKuTKXADnbA?=
 =?us-ascii?q?Ph/eJBAV2Z2+Gth2JYrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543972759"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 2DC241800025F
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 828DDCBEF98; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 08/18] python3-virtualenv: fix CVE-2026-113723
Date: Thu,  5 Nov 2026 00:59:57 -0800
Message-Id: <20261105090007.351866-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131889
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream prompt-handling fix [1] identified by advisory
[3]. Preserve literal prompts across Bash compatibility modes and
leave PS1 unchanged in unsupported POSIX shells.

Include follow-up [2], identified by advisory [4], so later prompt
option changes and child shells cannot execute the stored prompt.
This also fixes CVE-2026-115586, a regression in the initial fix.
Keep only the required Bash/Zsh security changes and regression tests.

[1] https://github.com/pypa/virtualenv/commit/5f48d711731311428aebfae61d46957762155b22
[2] https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4
[3] https://github.com/pypa/virtualenv/security/advisories/GHSA-6w3r-xr62-4xcp
[4] https://github.com/pypa/virtualenv/security/advisories/GHSA-cx6f-vjhg-g3cc

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113723.patch  | 233 ++++++++
 .../python3-virtualenv/CVE-2026-115586.patch  | 526 ++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   2 +
 3 files changed, 761 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
new file mode 100644
index 0000000000..d38b22a29a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
@@ -0,0 +1,233 @@
+From 5f48d711731311428aebfae61d46957762155b22 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 17 Oct 2026 02:35:17 -0700
+Subject: [PATCH] 🐛 fix(bash): preserve literal prompts in supported shells
+ (#3418)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113723
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/5f48d711731311428aebfae61d46957762155b22]
+
+Backport Changes:
+- Apply the prompt changes to 21.2.1's top-level activation block,
+  without importing the newer relocation wrapper; retain its PS1 export.
+- Add the missing Final import and replace the older print_prompt()
+  test helper with the upstream updated renderer.
+- Omit the upstream release changelog fragment.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh |  39 ++++----
+ tests/unit/activation/test_bash.py         | 105 +++++++++++++++++++--
+ 2 files changed, 115 insertions(+), 29 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 1551d85..992ad94 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -113,29 +113,26 @@ if [ __TK_LIBRARY__ != "" ]; then
+     export TK_LIBRARY
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
+     export PS1
+ fi
+ 
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index 4512932..8c84544 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -3,7 +3,7 @@ from __future__ import annotations
+ import shutil
+ import subprocess
+ from argparse import Namespace
+-from typing import TYPE_CHECKING
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
+ 
+@@ -16,6 +16,48 @@ if TYPE_CHECKING:
+     from pathlib import Path
+ 
+ 
++_BASH: Final = shutil.which("bash")
++
++
++@pytest.mark.skipif(_BASH is None or (IS_WIN and "\\git\\" not in _BASH.lower()), reason="requires native bash")
++@pytest.mark.parametrize(
++    ("setup", "expected"),
++    [
++        pytest.param("", "(${VIRTUAL_ENV_PROMPT-}) base ", id="bash"),
++        pytest.param("unset BASH_VERSION ZSH_VERSION;", "base ", id="unrecognized-shell"),
++    ],
++)
++def test_prompt_requires_known_shell(tmp_path: Path, current_fastest: str, setup: str, expected: str) -> None:
++    session: Final = cli_run([
++        str(tmp_path / "env"),
++        "--creator",
++        current_fastest,
++        "--without-pip",
++        "--no-periodic-update",
++        "--activators",
++        "bash",
++        "--prompt",
++        "example",
++    ])
++    result: Final = subprocess.run(
++        [
++            _BASH,
++            "--norc",
++            "--noprofile",
++            "-c",
++            f'{setup} PS1="base "; . "$1"; printf "%s|%s" "$PS1" "$VIRTUAL_ENV_PROMPT"',
++            "test",
++            str(session.creator.bin_dir / "activate"),
++        ],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        timeout=30,
++        check=True,
++    )
++    assert result.stdout == f"{expected}|example"
++
++
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+ @pytest.mark.parametrize(
+     ("tcl_lib", "tk_lib", "present"),
+@@ -225,9 +267,14 @@ def test_prompt_does_not_run_commands(
+         pytest.param("e\\", id="trailing-backslash"),
+     ],
+ )
++@pytest.mark.parametrize("compatibility", [pytest.param("42", id="bash42"), pytest.param("51", id="bash51")])
+ def test_prompt_renders_name_literally(
+-    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str
++    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]],
++    prompt: str,
++    compatibility: str,
++    monkeypatch: pytest.MonkeyPatch,
+ ) -> None:
++    monkeypatch.setenv("BASH_COMPAT", compatibility)
+     _, rendered = prompt_after_activate(prompt, "env")
+ 
+     assert rendered.startswith(f"({prompt}) ")
+@@ -249,14 +296,20 @@ def test_bash_activate_sources_under_dash(tmp_path: Path, current_fastest: str)
+     ])
+ 
+     result = subprocess.run(
+-        ["dash", "-c", '. "$1" && printf "%s" "$VIRTUAL_ENV"', "dash", str(dest / "bin" / "activate")],
++        [
++            "dash",
++            "-c",
++            'PS1="base "; . "$1" && printf "%s|%s" "$VIRTUAL_ENV" "$PS1"',
++            "dash",
++            str(dest / "bin" / "activate"),
++        ],
+         capture_output=True,
+         text=True,
+         encoding="utf-8",
+         check=False,
+     )
+ 
+-    assert (result.returncode, result.stdout) == (0, str(dest))
++    assert (result.returncode, result.stdout) == (0, f"{dest}|base ")
+ 
+ 
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+@@ -278,12 +331,48 @@ def test_bash(raise_on_non_source_class, hashing_enabled, activation_tester) ->
+         def activate_call(self, script):
+             return super().activate_call(script) + " || exit 1"
+ 
+-        def print_prompt(self):
+-            # render PS1 the way bash draws it, since the activator escapes the prompt for that expansion; bash before
+-            # 4.4 lacks ${PS1@P}, so undo the escapes the way its prompt expansion would
++        def print_prompt(self) -> str:
+             return (
+                 'if ((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1] >= 404)); then printf "%s\\n" "${PS1@P}"; '
+-                "else printf '%s\\n' \"$PS1\" | sed 's/\\\\\\([$`\\\\]\\)/\\1/g'; fi"
++                "else case \"$PS1\" in '(${VIRTUAL_ENV_PROMPT-}) '*) "
++                "printf '(%s) %s\\n' \"$VIRTUAL_ENV_PROMPT\" \"${PS1#'(${VIRTUAL_ENV_PROMPT-}) '}\";; "
++                "*) printf '%s\\n' \"$PS1\";; esac; fi"
+             )
+ 
+     activation_tester(Bash)
++
++
++@pytest.mark.skipif(IS_WIN, reason="requires POSIX bash")
++@pytest.mark.parametrize(
++    ("before", "after", "expected"),
++    [
++        pytest.param("shopt -u promptvars", "", "(x$(touch PWNED)y) __END__", id="promptvars-disabled"),
++        pytest.param(
++            "shopt -u promptvars; set -o posix", "", "(x$(touch PWNED)y) __END__", id="promptvars-disabled-posix"
++        ),
++        pytest.param("", "set -u; unset VIRTUAL_ENV_PROMPT", "() __END__", id="unset-with-nounset"),
++    ],
++)
++def test_bash_prompt_options(tmp_path: Path, current_fastest: str, before: str, after: str, expected: str) -> None:
++    session: Final = cli_run([
++        "--without-pip",
++        str(tmp_path / "env"),
++        "--creator",
++        current_fastest,
++        "--no-periodic-update",
++        "--activators",
++        "bash",
++        "--prompt",
++        "x$(touch PWNED)y",
++    ])
++    result: Final = subprocess.run(
++        ["bash", "--noprofile", "--norc", "-i"],
++        input=f"{before}\nPS1=__END__\n. {BashActivator.quote(str(session.creator.bin_dir / 'activate'))}\n{after}\nexit\n",
++        cwd=tmp_path,
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        check=True,
++    )
++    assert expected in result.stderr
++    assert "unbound variable" not in result.stderr
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch
new file mode 100644
index 0000000000..d7ce06675c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch
@@ -0,0 +1,526 @@
+From 3598e201f6f044e389136b2347a8a919ac03c5f4 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Thu, 22 Oct 2026 13:06:22 -0700
+Subject: [PATCH] 🐛 fix(bash): escape the prompt for every PS1 state (#3466)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-115586
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/3598e201f6f044e389136b2347a8a919ac03c5f4]
+
+Backport Changes:
+- Apply the Bash prompt changes to the top-level activation block and
+  retain 21.2.1's existing PS1 export; do not add the relocation wrapper.
+- Restrict the shared prompt matrix, driver and display helpers to Bash
+  and Zsh, preserving every upstream payload, state and action for those
+  shells. Omit the other activator branches, including Xonsh, which is
+  absent from 21.2.1, and adjust helper documentation to this scope.
+- Replace str.removeprefix() with equivalent slicing for Python 3.8.
+- Add shlex to the older Bash test module for the upstream child-shell
+  regression. Omit the relocation-wrapper regression because its
+  wrapper is absent.
+- Carry the deterministic upstream matrix test instead of introducing
+  its new Hypothesis property suite and dependency infrastructure.
+- Omit unrelated redirect/RECORD write changes and their tests, Windows
+  copy handling, CI/CodeQL/tooling updates, and documentation changes;
+  the 21.2.1 source archive does not contain the documentation tree.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh |  45 +++--
+ tests/prompt_matrix.py                     | 194 +++++++++++++++++++++
+ tests/unit/activation/test_activator.py    |  19 ++
+ tests/unit/activation/test_bash.py         | 123 ++++++-------
+ 4 files changed, 305 insertions(+), 76 deletions(-)
+ create mode 100644 tests/prompt_matrix.py
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 992ad94..2c9d29c 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -49,6 +49,11 @@ deactivate () {
+         unset _OLD_VIRTUAL_PS1
+     fi
+ 
++    if [ -n "${_OLD_VIRTUAL_PSVAR+x}" ] ; then
++        psvar[9]="$_OLD_VIRTUAL_PSVAR"
++        unset _OLD_VIRTUAL_PSVAR
++    fi
++
+     unset VIRTUAL_ENV
+     unset VIRTUAL_ENV_PROMPT
+     if [ ! "${1-}" = "nondestructive" ] ; then
+@@ -116,23 +121,33 @@ fi
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
+-        _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT//\\/\\\\}"
+-        if [ -n "${ZSH_VERSION-}" ]; then
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
+-            _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
+-        fi
+-        PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
+-        unset _VIRTUAL_PROMPT
++        # zsh inserts a psvar entry into the prompt as data under every prompt option, so the value needs no
++        # escaping, and the %9v reference holds nothing for another shell to expand when PS1 is exported. The guard
++        # above keeps POSIX shells such as dash away from the array assignment
++        _OLD_VIRTUAL_PSVAR="${psvar[9]-}"
++        psvar[9]="$VIRTUAL_ENV_PROMPT"
++        _VIRTUAL_PROMPT='%9v'
+     fi
++    PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
++    unset _VIRTUAL_PROMPT
+     export PS1
+ fi
+ 
+diff --git a/tests/prompt_matrix.py b/tests/prompt_matrix.py
+new file mode 100644
+index 0000000..7bd0a4c
+--- /dev/null
++++ b/tests/prompt_matrix.py
+@@ -0,0 +1,194 @@
++"""Prompt payloads, the shell states that change how a stored prompt is read, and one driver for Bash and Zsh activation."""
++
++from __future__ import annotations
++
++import re
++import shlex
++import shutil
++import subprocess
++from argparse import Namespace
++from typing import TYPE_CHECKING, Final, NamedTuple
++from unittest.mock import create_autospec
++
++from python_discovery import PythonInfo
++
++from virtualenv.activation import BashActivator
++from virtualenv.create.creator import Creator
++from virtualenv.info import IS_WIN
++
++if TYPE_CHECKING:
++    from pathlib import Path
++
++
++class Shell(NamedTuple):
++    activator: str
++    script: str
++    program: str
++    states: dict[str, str]
++    actions: dict[str, str]
++    payloads: dict[str, str]
++
++
++PROMPT_PAYLOADS: Final = {
++    "command-substitution": "x$(touch PWNED)y",
++    "backticks": "x`touch PWNED`y",
++    "parameter-expansion": "x${$(touch PWNED)}y",
++    "backslash-dollar": "x\\$(touch PWNED)y",
++    "two-backslashes-dollar": "x\\\\$(touch PWNED)y",
++    "three-backslashes-dollar": "x\\\\\\$(touch PWNED)y",
++    "backslash-backtick": "x\\`touch PWNED`y",
++    "quote-breakout": "x'$(touch PWNED)'y",
++    "fish-backslash-quote": "x\\'$(touch PWNED)'\\'",
++    "statement-separator": "a;touch PWNED;b",
++    "placeholder": "A__VIRTUAL_NAME__B$(touch PWNED)",
++    "history": "x!!y",
++    "percent": "x%ny",
++    "trailing-backslash": "e\\",
++}
++
++SHELLS: Final = {
++    "bash": Shell(
++        "bash",
++        "activate",
++        "bash",
++        {
++            "default": "",
++            "promptvars-off": "shopt -u promptvars",
++            "posix": "set -o posix",
++            "compat42": "BASH_COMPAT=42",
++            "compat42-promptvars-off": "BASH_COMPAT=42; shopt -u promptvars",
++            "patsub-off": "shopt -u patsub_replacement",
++            "compat42-patsub-off": "BASH_COMPAT=42; shopt -u patsub_replacement",
++            "nounset": "set -u",
++        },
++        {
++            "none": "",
++            "promptvars-on": "shopt -s promptvars",
++            "promptvars-off": "shopt -u promptvars",
++            "posix": "set -o posix",
++            "nounset-unset": "set -u; unset VIRTUAL_ENV_PROMPT",
++            "child-bash": "export PS1; bash --noprofile --norc -i <<<exit 2>/dev/null",
++            "child-dash": "export PS1; dash -i <<<exit 2>/dev/null",
++            "child-zsh": "export PS1; zsh -f -i <<<exit 2>/dev/null",
++        },
++        PROMPT_PAYLOADS,
++    ),
++    "zsh": Shell(
++        "bash",
++        "activate",
++        "zsh",
++        {"default": "", "prompt-subst": "setopt prompt_subst"},
++        {
++            "none": "",
++            "prompt-subst-on": "setopt prompt_subst",
++            "prompt-subst-off": "unsetopt prompt_subst",
++            "promptbang": "setopt promptbang",
++            "emulate-sh": "emulate sh",
++            "child-bash": "export PS1; bash --noprofile --norc -i <<<exit 2>/dev/null",
++        },
++        PROMPT_PAYLOADS,
++    ),
++}
++
++PROMPT_CASES: Final = [
++    (shell, state, action, payload)
++    for shell, spec in SHELLS.items()
++    for state in spec.states
++    for action in spec.actions
++    for payload in spec.payloads
++]
++
++
++def unavailable(shell: str, action: str) -> str | None:
++    """Why the shell, or the child shell the action starts, cannot run here; None when both can."""
++    if IS_WIN:
++        return f"{shell} activation needs a POSIX system"
++    child: Final = action[len("child-") :] if action.startswith("child-") else None
++    for program in (SHELLS[shell].program, child):
++        if program is not None and shutil.which(program) is None:
++            return f"{program} is not installed"
++    return None
++
++
++def generate_script(shell: str, root: Path, prompt: str) -> Path:
++    """Render the shell's activation script in process; the scripts depend on the prompt, not on a real interpreter."""
++    activator: Final = {
++        "bash": BashActivator,
++        "zsh": BashActivator,
++    }[shell]
++    creator: Final = create_autospec(
++        Creator,
++        instance=True,
++        dest=root,
++        bin_dir=root / "bin",
++        interpreter=create_autospec(PythonInfo, instance=True, tcl_lib=None, tk_lib=None),
++        pyenv_cfg={},
++        env_name="env",
++    )
++    creator.bin_dir.mkdir(parents=True)
++    activator(Namespace(prompt=prompt)).generate(creator)
++    return creator.bin_dir / SHELLS[shell].script
++
++
++def run_prompt(shell: str, script: Path, state: str, action: str, cwd: Path) -> subprocess.CompletedProcess[str]:
++    """Activate under the state, apply the later action, and draw the prompt the way that shell does."""
++    spec: Final = SHELLS[shell]
++    before: Final = spec.states[state]
++    after: Final = spec.actions[action]
++    stdin = ""
++    env: dict[str, str] | None = None
++    if shell in {"bash", "zsh"}:
++        # interactive shells draw PS1 before each command they read, so the last draw follows the later action; child
++        # shells an action starts still draw the inherited prompt, into /dev/null, so it cannot mix with the parent's
++        argv = [spec.program, "--noprofile", "--norc", "-i"] if shell == "bash" else [spec.program, "-f", "-i"]
++        stdin = f"{before}\nPS1=__END__\n. {shlex.quote(str(script))}\n{after}\nexit\n"
++    # an empty stdin keeps a child shell from waiting on the test runner's input
++    return subprocess.run(
++        argv,
++        input=stdin,
++        cwd=cwd,
++        env=env,
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        errors="replace",
++        check=False,
++        timeout=120,
++    )
++
++
++def drawn_prompt(shell: str, result: subprocess.CompletedProcess[str]) -> str:
++    """The last prompt an interactive bash or zsh drew, up to the __END__ sentinel."""
++    output: Final = result.stderr
++    last: Final = output.rsplit("__END__", 1)[0].rsplit("\n", 1)[-1]
++    return last + "__END__"
++
++
++def prompt_shown(shell: str, result: subprocess.CompletedProcess[str], prompt: str, state: str, action: str) -> bool:
++    """Whether the shell showed the prompt the way its display rule says."""
++    pattern: Final = _drawn_pattern(shell, prompt, state, action)
++    return re.fullmatch(rf"\({pattern}\) __END__", drawn_prompt(shell, result)) is not None
++
++
++def _drawn_pattern(shell: str, prompt: str, state: str, action: str) -> str:
++    if shell != "bash":
++        # zsh inserts the psvar entry as data under every prompt option
++        return re.escape(prompt)
++    promptvars: Final = {"promptvars-on": True, "promptvars-off": False}.get(action, "promptvars-off" not in state)
++    if "posix" in {state, action}:
++        # posix mode draws !! as ! and a lone ! as the history number
++        return "!".join(r"\d+".join(map(re.escape, piece.split("!"))) for piece in prompt.split("!!"))
++    # without promptvars only the escape-decoding pass runs, so the escapes for the expansion pass stay visible
++    return re.escape(prompt if promptvars else prompt.replace("\\", "\\\\").replace("`", "\\`"))
++
++
++__all__ = [
++    "PROMPT_CASES",
++    "PROMPT_PAYLOADS",
++    "SHELLS",
++    "drawn_prompt",
++    "generate_script",
++    "prompt_shown",
++    "run_prompt",
++    "unavailable",
++]
+diff --git a/tests/unit/activation/test_activator.py b/tests/unit/activation/test_activator.py
+index 03481c2..8e71600 100644
+--- a/tests/unit/activation/test_activator.py
++++ b/tests/unit/activation/test_activator.py
+@@ -1,12 +1,17 @@
+ from __future__ import annotations
+ 
+ from argparse import Namespace
++from typing import TYPE_CHECKING, Final
+ 
+ import pytest
++from prompt_matrix import PROMPT_CASES, SHELLS, generate_script, prompt_shown, run_prompt, unavailable
+ 
+ from virtualenv.activation import BashActivator, CShellActivator, FishActivator, PythonActivator
+ from virtualenv.activation.activator import Activator
+ 
++if TYPE_CHECKING:
++    from pathlib import Path
++
+ 
+ @pytest.mark.parametrize("activator_class", [BashActivator, CShellActivator, FishActivator, PythonActivator])
+ def test_template_substitution_does_not_expand_replacement_values(monkeypatch, activator_class) -> None:
+@@ -35,3 +40,17 @@ def test_activator_prompt_cwd(monkeypatch, tmp_path) -> None:
+ 
+     activator = FakeActivator(Namespace(prompt="."))
+     assert activator.flag_prompt == "magic"
++
++
++@pytest.mark.slow
++@pytest.mark.parametrize("case", PROMPT_CASES, ids=["-".join(case) for case in PROMPT_CASES])
++def test_activator_prompt_stays_data(tmp_path: Path, case: tuple[str, str, str, str]) -> None:
++    shell, state, action, payload = case
++    if reason := unavailable(shell, action):
++        pytest.skip(reason)
++    prompt: Final = SHELLS[shell].payloads[payload]
++    result: Final = run_prompt(shell, generate_script(shell, tmp_path / "env", prompt), state, action, tmp_path)
++
++    assert ((tmp_path / "PWNED").exists(), prompt_shown(shell, result, prompt, state, action)) == (False, True), (
++        result.stdout + result.stderr
++    )
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index 8c84544..8d6d00b 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -1,11 +1,13 @@
+ from __future__ import annotations
+ 
++import shlex
+ import shutil
+ import subprocess
+ from argparse import Namespace
+ from typing import TYPE_CHECKING, Final
+ 
+ import pytest
++from prompt_matrix import generate_script
+ 
+ from virtualenv.activation import BashActivator
+ from virtualenv.info import IS_WIN
+@@ -23,7 +25,7 @@ _BASH: Final = shutil.which("bash")
+ @pytest.mark.parametrize(
+     ("setup", "expected"),
+     [
+-        pytest.param("", "(${VIRTUAL_ENV_PROMPT-}) base ", id="bash"),
++        pytest.param("", "(example) base ", id="bash"),
+         pytest.param("unset BASH_VERSION ZSH_VERSION;", "base ", id="unrecognized-shell"),
+     ],
+ )
+@@ -237,49 +239,20 @@ def prompt_after_activate(
+ 
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+ @pytest.mark.parametrize(
+-    ("prompt", "env_name"),
++    "env_name",
+     [
+-        pytest.param("x$(touch PWNED)y", "env", id="prompt-command-substitution"),
+-        pytest.param("x`touch PWNED`y", "env", id="prompt-backticks"),
+-        pytest.param("x${$(touch PWNED)}y", "env", id="prompt-parameter-expansion"),
+-        pytest.param("x\\$(touch PWNED)y", "env", id="prompt-backslash-command-substitution"),
+-        pytest.param("x\\`touch PWNED`y", "env", id="prompt-backslash-backticks"),
+-        pytest.param(None, "x$(touch PWNED)y", id="dirname-command-substitution"),
++        pytest.param("x$(touch PWNED)y", id="dirname-command-substitution"),
++        pytest.param("A__VIRTUAL_NAME__B/x'$(touch PWNED)'y", id="placeholder-in-parent-dir"),
+     ],
+ )
+-def test_prompt_does_not_run_commands(
+-    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str | None, env_name: str
++def test_prompt_dirname_does_not_run_commands(
++    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], env_name: str
+ ) -> None:
+-    work_dir, _ = prompt_after_activate(prompt, env_name)
++    work_dir, _ = prompt_after_activate(None, env_name)
+ 
+     assert not (work_dir / "PWNED").exists()
+ 
+ 
+-@pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+-@pytest.mark.parametrize(
+-    "prompt",
+-    [
+-        pytest.param("myenv", id="plain"),
+-        pytest.param("a%n$HOME\\b`c`", id="special-characters"),
+-        pytest.param("a\\$HOME", id="backslash-before-dollar"),
+-        pytest.param("a\\`c`", id="backslash-before-backtick"),
+-        pytest.param("x\\\\y", id="doubled-backslash"),
+-        pytest.param("e\\", id="trailing-backslash"),
+-    ],
+-)
+-@pytest.mark.parametrize("compatibility", [pytest.param("42", id="bash42"), pytest.param("51", id="bash51")])
+-def test_prompt_renders_name_literally(
+-    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]],
+-    prompt: str,
+-    compatibility: str,
+-    monkeypatch: pytest.MonkeyPatch,
+-) -> None:
+-    monkeypatch.setenv("BASH_COMPAT", compatibility)
+-    _, rendered = prompt_after_activate(prompt, "env")
+-
+-    assert rendered.startswith(f"({prompt}) ")
+-
+-
+ @pytest.mark.skipif(IS_WIN or shutil.which("dash") is None, reason="needs dash as a POSIX shell")
+ def test_bash_activate_sources_under_dash(tmp_path: Path, current_fastest: str) -> None:
+     dest = tmp_path / "env"
+@@ -334,45 +307,73 @@ def test_bash(raise_on_non_source_class, hashing_enabled, activation_tester) ->
+         def print_prompt(self) -> str:
+             return (
+                 'if ((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1] >= 404)); then printf "%s\\n" "${PS1@P}"; '
+-                "else case \"$PS1\" in '(${VIRTUAL_ENV_PROMPT-}) '*) "
+-                "printf '(%s) %s\\n' \"$VIRTUAL_ENV_PROMPT\" \"${PS1#'(${VIRTUAL_ENV_PROMPT-}) '}\";; "
+-                "*) printf '%s\\n' \"$PS1\";; esac; fi"
++                "else printf 'exit\\n' | PS1=\"$PS1\" bash --noprofile --norc -i 2>&1 >/dev/null; fi"
+             )
+ 
+     activation_tester(Bash)
+ 
+ 
++@pytest.mark.skipif(IS_WIN, reason="requires POSIX bash")
++@pytest.mark.parametrize("setup", [pytest.param("", id="default"), pytest.param("BASH_COMPAT=42; ", id="compat42")])
++def test_bash_prompt_stored_form(tmp_path: Path, setup: str) -> None:
++    result: Final = subprocess.run(
++        [
++            "bash",
++            "--norc",
++            "--noprofile",
++            "-c",
++            f'{setup}PS1=__END__; . "$1"; printf "%s" "$PS1"',
++            "test",
++            str(generate_script("bash", tmp_path / "env", "a\\b$c`d")),
++        ],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        check=True,
++    )
++
++    assert result.stdout == "(a\\\\\\\\b\\$c\\`d) __END__"
++
++
+ @pytest.mark.skipif(IS_WIN, reason="requires POSIX bash")
+ @pytest.mark.parametrize(
+-    ("before", "after", "expected"),
++    "child",
+     [
+-        pytest.param("shopt -u promptvars", "", "(x$(touch PWNED)y) __END__", id="promptvars-disabled"),
+-        pytest.param(
+-            "shopt -u promptvars; set -o posix", "", "(x$(touch PWNED)y) __END__", id="promptvars-disabled-posix"
+-        ),
+-        pytest.param("", "set -u; unset VIRTUAL_ENV_PROMPT", "() __END__", id="unset-with-nounset"),
++        pytest.param(["bash", "--noprofile", "--norc", "-i"], id="child-bash"),
++        pytest.param(["dash", "-i"], id="child-dash"),
+     ],
+ )
+-def test_bash_prompt_options(tmp_path: Path, current_fastest: str, before: str, after: str, expected: str) -> None:
+-    session: Final = cli_run([
+-        "--without-pip",
+-        str(tmp_path / "env"),
+-        "--creator",
+-        current_fastest,
+-        "--no-periodic-update",
+-        "--activators",
+-        "bash",
+-        "--prompt",
+-        "x$(touch PWNED)y",
+-    ])
++def test_bash_child_shell_draws_inherited_prompt(tmp_path: Path, child: list[str]) -> None:
++    if shutil.which(child[0]) is None:
++        pytest.skip(f"{child[0]} is not installed")
++    subprocess.run(
++        ["bash", "--norc", "--noprofile", "-c", f"export PS1='$(touch CANARY)'; {shlex.join(child)} <<<exit"],
++        cwd=tmp_path,
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        check=True,
++    )
++
++    assert (tmp_path / "CANARY").exists()
++
++
++@pytest.mark.skipif(IS_WIN or shutil.which("zsh") is None, reason="requires zsh")
++def test_zsh_deactivate_restores_psvar(tmp_path: Path) -> None:
+     result: Final = subprocess.run(
+-        ["bash", "--noprofile", "--norc", "-i"],
+-        input=f"{before}\nPS1=__END__\n. {BashActivator.quote(str(session.creator.bin_dir / 'activate'))}\n{after}\nexit\n",
++        [
++            "zsh",
++            "-f",
++            "-c",
++            'psvar=(a b); . "$1"; print -r -- "$psvar[9]"; deactivate; print -r -- "${(j:,:)psvar}"',
++            "zsh",
++            str(generate_script("zsh", tmp_path / "env", "plain")),
++        ],
+         cwd=tmp_path,
+         capture_output=True,
+         text=True,
+         encoding="utf-8",
+         check=True,
+     )
+-    assert expected in result.stderr
+-    assert "unbound variable" not in result.stderr
++
++    assert result.stdout == "plain\na,b,,,,,,,\n"
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 9cf1ea3b6b..2c584361ab 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -21,6 +21,8 @@ SRC_URI += " \
     file://CVE-2026-113726-dependent.patch \
     file://CVE-2026-113726.patch \
     file://CVE-2026-113725.patch \
+    file://CVE-2026-113723.patch \
+    file://CVE-2026-115586.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

