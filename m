Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30043.1793869213943589263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FeYunsF+;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15622; q=dns/txt;
  s=iport01; t=1793869214; x=1795078814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M3nweJTNEzrV6xj68EGGXJ79wkeBfRQ2Ih9kJwa8T0I=;
  b=FeYunsF+a0XuqJPl2vDt/IL0LqhCYsihq68Z+1VO8Xv/IEIy4AG4ceIp
   Q0OZ7XNPQsk+wxAXC1hp5NzUJF4h2wWOlPoC1Hhp4thVYQYGDrI86lnbc
   +xDLuCCEhxAq1TtaN40Cq5hW26ttrTsi2lqIayHcRXallEvsmZyqYHEwS
   +IQxUmL2dqdJuvIADFmdtx9n/DgRubWeweLd0+jPIwKNk7HzlMfkr+A+b
   wHpjXrxCRkur7BWT1SMSBK9Oh3c6Kwk5F/bxlbWaS8YjCy3wfQxHaHi9Y
   99wR6C9AE5EDyodlRUvvWyFQz3b0mOYgcmWUgUlxEJnInqKDDQUyncOfa
   g==;
X-CSE-ConnectionGUID: rNPPvyWCRTecre8l5SoYpA==
X-CSE-MsgGUID: 2Z1+fUOkTleEnS6Q0uE3FA==
X-IPAS-Result: =?us-ascii?q?A0AnAABHRexq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJA4RUiBuHOIIhA4tlkjyBfg8BAQEPRA0EAQGEP0YCjh0CJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIwQLARgBH?=
 =?us-ascii?q?h8JEwMBAgMCJgICIAsjCBAJgwIBgjoDNwMRoQ2bJHp/M4EBgykBgVTYTA2CW?=
 =?us-ascii?q?gELFAGBCi4BhT+CfyABhQNdGAGEfScbG4FygRWDaYEFgRpCAoEqhBKCagSCI?=
 =?us-ascii?q?oEMgVoeMoxIAoFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEP?=
 =?us-ascii?q?QFuB5IvgnEgAV8fDwErgVpSHJJwkEmCIaAgcQoog3iKFIIQjz6FfBozhASBV?=
 =?us-ascii?q?6N/gRcLmH2CWYsxhAqRXxhQhGmBaDyBWXAVgyIJShkPjjmDa4ZQyAsmMgIJA?=
 =?us-ascii?q?y8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:B+ynmqowdzCpK8T42e/mMJcRytleBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmOPKnbZjT9KdlyO96/pE0O7MPTnNVjGQVprHg9EyxD9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vxROVlQ5
 MMzEgwAZQqO1+br+7WKUsA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWGZsMwhzF/
 Qoq+UyjMEhZOuG4ygaB/1+qvbH2xT7WA6w7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZN5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrYUD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:+xTR/6GMsOIx6pZ+pLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:zjAhmmzE0gnD7TR7osJiBgUOPPgdbGzi503sLkSiBDZtFYaSeEe5rfY=
X-Talos-MUID: 9a23:Th6G3wnK4XQBhHPTq6xjdno4Bp4r7ZmJC3wJnLgAgJe9bTFdYBm02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544614253"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 28BBE180003C1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7B26CCBF234; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 06/18] python3-virtualenv: fix CVE-2026-113726
Date: Thu,  5 Nov 2026 00:59:55 -0800
Message-Id: <20261105090007.351866-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131897
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream Zsh prompt fix [1] identified by advisory [3].
Include prerequisite [2] to provide the prompt-escaping block and
regression-test fixture that the fix uses but 21.2.1 does not contain.

Escape prompt values before Zsh expands PS1, including when
PROMPT_SUBST is enabled after activation, and preserve literal percent
signs in the displayed environment name.

[1] https://github.com/pypa/virtualenv/commit/5b915367da82bd024b2a0d28d2f98007034b4aa2
[2] https://github.com/pypa/virtualenv/commit/a70c1dac43e2ee7e618132b572072395af5d8a9b
[3] https://github.com/pypa/virtualenv/security/advisories/GHSA-5vjq-rrrf-7h2q

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-113726-dependent.patch           | 168 ++++++++++++++++++
 .../python3-virtualenv/CVE-2026-113726.patch  | 149 ++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |   2 +
 3 files changed, 319 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch
new file mode 100644
index 0000000000..3c43b70fe8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch
@@ -0,0 +1,168 @@
+From a70c1dac43e2ee7e618132b572072395af5d8a9b Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 26 Sep 2026 09:35:09 -0700
+Subject: [PATCH] 🐛 fix(activation): stop bash re-expanding the prompt in PS1
+ (#3326)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-113726
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/a70c1dac43e2ee7e618132b572072395af5d8a9b]
+
+Backport Changes:
+- Update the 21.2.1 activation tester's print_os_env_var("PS1") call
+  to use upstream's rendered-prompt check instead of its later raw-printf
+  implementation.
+- Omit the release-only changelog fragment; the release documentation
+  directory is absent from the 21.2.1 source distribution.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh |  11 ++-
+ tests/unit/activation/test_bash.py         | 102 ++++++++++++++++++++-
+ 2 files changed, 111 insertions(+), 2 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 18a78e5..76b9c39 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -115,7 +115,16 @@ fi
+ 
+ if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
+     _OLD_VIRTUAL_PS1="${PS1-}"
+-    PS1="(${VIRTUAL_ENV_PROMPT}) ${PS1-}"
++    _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT}"
++    # bash re-expands backslashes, dollar signs and backticks in PS1 on every redraw; the guard keeps the
++    # bash-only substitution away from POSIX shells such as dash, which reject it with "Bad substitution"
++    if [ -n "${BASH_VERSION-}" ]; then
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
++    fi
++    PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
++    unset _VIRTUAL_PROMPT
+     export PS1
+ fi
+ 
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index df3aaf3..e3608f1 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -141,6 +141,101 @@ def test_bash_activate_relocation_does_not_run_path_commands(
+     assert not (work_dir / "PWNED").exists()
+ 
+ 
++@pytest.fixture
++def bash_prompt_after_activate(tmp_path: Path, current_fastest: str) -> Callable[[str | None, str], tuple[Path, str]]:
++    version = subprocess.run(
++        ["bash", "-c", 'printf "%s" "$((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1]))"'],
++        capture_output=True,
++        text=True,
++        check=True,
++    ).stdout
++    if int(version) < 404:
++        pytest.skip("${PS1@P} needs bash 4.4 or later")
++
++    def build(prompt: str | None, env_name: str) -> tuple[Path, str]:
++        dest = tmp_path / env_name
++        args = [
++            "--without-pip",
++            str(dest),
++            "--creator",
++            current_fastest,
++            "--no-periodic-update",
++            "--activators",
++            "bash",
++        ]
++        if prompt is not None:
++            args += ["--prompt", prompt]
++        cli_run(args)
++        activate = dest / "bin" / "activate"
++        work_dir = tmp_path / "workdir"
++        work_dir.mkdir(exist_ok=True)
++        # the path is passed as $1 so the outer shell cannot expand a payload dir name while locating the script;
++        # ${PS1@P} then forces bash to render the prompt exactly as it does before each interactive command
++        result = subprocess.run(
++            ["bash", "--norc", "--noprofile", "-c", 'source "$1"; printf "%s" "${PS1@P}"', "bash", str(activate)],
++            capture_output=True,
++            text=True,
++            cwd=str(work_dir),
++            encoding="utf-8",
++            check=False,
++        )
++        return work_dir, result.stdout
++
++    return build
++
++
++@pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
++@pytest.mark.parametrize(
++    ("prompt", "env_name"),
++    [
++        pytest.param("x$(touch PWNED)y", "env", id="prompt-command-substitution"),
++        pytest.param("x`touch PWNED`y", "env", id="prompt-backticks"),
++        pytest.param(None, "x$(touch PWNED)y", id="dirname-command-substitution"),
++    ],
++)
++def test_bash_prompt_does_not_run_commands(
++    bash_prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str | None, env_name: str
++) -> None:
++    work_dir, _ = bash_prompt_after_activate(prompt, env_name)
++
++    assert not (work_dir / "PWNED").exists()
++
++
++@pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
++def test_bash_prompt_keeps_plain_name_visible(
++    bash_prompt_after_activate: Callable[[str | None, str], tuple[Path, str]],
++) -> None:
++    _, rendered = bash_prompt_after_activate("myenv", "env")
++
++    assert rendered.startswith("(myenv) ")
++
++
++@pytest.mark.skipif(IS_WIN or shutil.which("dash") is None, reason="needs dash as a POSIX shell")
++def test_bash_activate_sources_under_dash(tmp_path: Path, current_fastest: str) -> None:
++    dest = tmp_path / "env"
++    cli_run([
++        "--without-pip",
++        str(dest),
++        "--creator",
++        current_fastest,
++        "--no-periodic-update",
++        "--activators",
++        "bash",
++        "--prompt",
++        "x$y",
++    ])
++
++    result = subprocess.run(
++        ["dash", "-c", '. "$1" && printf "%s" "$VIRTUAL_ENV"', "dash", str(dest / "bin" / "activate")],
++        capture_output=True,
++        text=True,
++        encoding="utf-8",
++        check=False,
++    )
++
++    assert (result.returncode, result.stdout) == (0, str(dest))
++
++
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+ @pytest.mark.parametrize("hashing_enabled", [True, False])
+ def test_bash(raise_on_non_source_class, hashing_enabled, activation_tester) -> None:
+@@ -161,6 +256,11 @@ def test_bash(raise_on_non_source_class, hashing_enabled, activation_tester) ->
+             return super().activate_call(script) + " || exit 1"
+ 
+         def print_prompt(self):
+-            return self.print_os_env_var("PS1")
++            # render PS1 the way bash draws it, since the activator escapes the prompt for that expansion; bash before
++            # 4.4 lacks ${PS1@P}, so undo the escapes the way its prompt expansion would
++            return (
++                'if ((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1] >= 404)); then printf "%s\\n" "${PS1@P}"; '
++                "else printf '%s\\n' \"$PS1\" | sed 's/\\\\\\([$`\\\\]\\)/\\1/g'; fi"
++            )
+ 
+     activation_tester(Bash)
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
new file mode 100644
index 0000000000..96c1879a06
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
@@ -0,0 +1,149 @@
+From 5b915367da82bd024b2a0d28d2f98007034b4aa2 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Fri, 2 Oct 2026 06:40:23 -0700
+Subject: [PATCH] Merge commit from fork
+
+The bash activate script, which zsh also sources, escaped backslashes,
+dollar signs and backticks in the environment name only under bash.
+zsh with PROMPT_SUBST re-expands PS1 at every prompt draw, so a name
+such as x$(touch PWNED)y ran as a command each time the prompt showed.
+
+Apply the same escaping under zsh, also when PROMPT_SUBST is off since
+it can be set after activation, and double % so zsh shows the name
+instead of reading it as prompt escapes. The prompt tests now render
+PS1 through zsh as well as bash.
+
+CVE: CVE-2026-113726
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/5b915367da82bd024b2a0d28d2f98007034b4aa2]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 11 +++--
+ tests/unit/activation/test_bash.py         | 57 ++++++++++++++--------
+ 2 files changed, 45 insertions(+), 23 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 76b9c39..0a372ff 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -116,13 +116,18 @@ fi
+ if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
+     _OLD_VIRTUAL_PS1="${PS1-}"
+     _VIRTUAL_PROMPT="${VIRTUAL_ENV_PROMPT}"
+-    # bash re-expands backslashes, dollar signs and backticks in PS1 on every redraw; the guard keeps the
+-    # bash-only substitution away from POSIX shells such as dash, which reject it with "Bad substitution"
+-    if [ -n "${BASH_VERSION-}" ]; then
++    # bash, and zsh under PROMPT_SUBST, re-expand backslashes, dollar signs and backticks in PS1 on every redraw;
++    # zsh gets the escaping even without the option, since a user can set it after activation. The guards keep
++    # the substitution away from POSIX shells such as dash, which reject it with "Bad substitution"
++    if [ -n "${BASH_VERSION-}${ZSH_VERSION-}" ]; then
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\}"
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
+     fi
++    # zsh expands % sequences in PS1 as prompt escapes
++    if [ -n "${ZSH_VERSION-}" ]; then
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\%/%%}"
++    fi
+     PS1="(${_VIRTUAL_PROMPT}) ${PS1-}"
+     unset _VIRTUAL_PROMPT
+     export PS1
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index e3608f1..defd2ed 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -141,16 +141,21 @@ def test_bash_activate_relocation_does_not_run_path_commands(
+     assert not (work_dir / "PWNED").exists()
+ 
+ 
+-@pytest.fixture
+-def bash_prompt_after_activate(tmp_path: Path, current_fastest: str) -> Callable[[str | None, str], tuple[Path, str]]:
+-    version = subprocess.run(
+-        ["bash", "-c", 'printf "%s" "$((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1]))"'],
+-        capture_output=True,
+-        text=True,
+-        check=True,
+-    ).stdout
+-    if int(version) < 404:
+-        pytest.skip("${PS1@P} needs bash 4.4 or later")
++@pytest.fixture(params=["bash", "zsh"])
++def prompt_after_activate(
++    request: pytest.FixtureRequest, tmp_path: Path, current_fastest: str
++) -> Callable[[str | None, str], tuple[Path, str]]:
++    if shutil.which(shell := request.param) is None:
++        pytest.skip(f"{shell} is not installed")
++    if shell == "bash":
++        version = subprocess.run(
++            ["bash", "-c", 'printf "%s" "$((BASH_VERSINFO[0] * 100 + BASH_VERSINFO[1]))"'],
++            capture_output=True,
++            text=True,
++            check=True,
++        ).stdout
++        if int(version) < 404:
++            pytest.skip("${PS1@P} needs bash 4.4 or later")
+ 
+     def build(prompt: str | None, env_name: str) -> tuple[Path, str]:
+         dest = tmp_path / env_name
+@@ -166,13 +171,17 @@ def bash_prompt_after_activate(tmp_path: Path, current_fastest: str) -> Callable
+         if prompt is not None:
+             args += ["--prompt", prompt]
+         cli_run(args)
+-        activate = dest / "bin" / "activate"
+         work_dir = tmp_path / "workdir"
+         work_dir.mkdir(exist_ok=True)
+         # the path is passed as $1 so the outer shell cannot expand a payload dir name while locating the script;
+-        # ${PS1@P} then forces bash to render the prompt exactly as it does before each interactive command
++        # ${PS1@P} renders the prompt exactly as bash does before each interactive command, and in zsh (e) applies
++        # what PROMPT_SUBST does at each draw before (%) expands the prompt escapes
++        render = {
++            "bash": ["bash", "--norc", "--noprofile", "-c", 'source "$1"; printf "%s" "${PS1@P}"'],
++            "zsh": ["zsh", "-f", "-c", 'setopt prompt_subst; source "$1"; print -rn -- "${(%)${(e)PS1}}"'],
++        }[shell]
+         result = subprocess.run(
+-            ["bash", "--norc", "--noprofile", "-c", 'source "$1"; printf "%s" "${PS1@P}"', "bash", str(activate)],
++            [*render, shell, str(dest / "bin" / "activate")],
+             capture_output=True,
+             text=True,
+             cwd=str(work_dir),
+@@ -190,24 +199,32 @@ def bash_prompt_after_activate(tmp_path: Path, current_fastest: str) -> Callable
+     [
+         pytest.param("x$(touch PWNED)y", "env", id="prompt-command-substitution"),
+         pytest.param("x`touch PWNED`y", "env", id="prompt-backticks"),
++        pytest.param("x${$(touch PWNED)}y", "env", id="prompt-parameter-expansion"),
+         pytest.param(None, "x$(touch PWNED)y", id="dirname-command-substitution"),
+     ],
+ )
+-def test_bash_prompt_does_not_run_commands(
+-    bash_prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str | None, env_name: str
++def test_prompt_does_not_run_commands(
++    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str | None, env_name: str
+ ) -> None:
+-    work_dir, _ = bash_prompt_after_activate(prompt, env_name)
++    work_dir, _ = prompt_after_activate(prompt, env_name)
+ 
+     assert not (work_dir / "PWNED").exists()
+ 
+ 
+ @pytest.mark.skipif(IS_WIN, reason="Github Actions ships with WSL bash")
+-def test_bash_prompt_keeps_plain_name_visible(
+-    bash_prompt_after_activate: Callable[[str | None, str], tuple[Path, str]],
++@pytest.mark.parametrize(
++    "prompt",
++    [
++        pytest.param("myenv", id="plain"),
++        pytest.param("a%n$HOME\\b`c`", id="special-characters"),
++    ],
++)
++def test_prompt_renders_name_literally(
++    prompt_after_activate: Callable[[str | None, str], tuple[Path, str]], prompt: str
+ ) -> None:
+-    _, rendered = bash_prompt_after_activate("myenv", "env")
++    _, rendered = prompt_after_activate(prompt, "env")
+ 
+-    assert rendered.startswith("(myenv) ")
++    assert rendered.startswith(f"({prompt}) ")
+ 
+ 
+ @pytest.mark.skipif(IS_WIN or shutil.which("dash") is None, reason="needs dash as a POSIX shell")
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index 65e50d3f88..cfb220fe41 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -18,6 +18,8 @@ SRC_URI += " \
     file://CVE-2026-113732_p1.patch \
     file://CVE-2026-113732_p2.patch \
     file://CVE-2026-113776.patch \
+    file://CVE-2026-113726-dependent.patch \
+    file://CVE-2026-113726.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

