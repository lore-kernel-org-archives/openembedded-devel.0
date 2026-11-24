Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11968.1795496988177392376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T9FAjmyY;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9105; q=dns/txt;
  s=iport01; t=1795496988; x=1796706588;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hetm4kJQYvcJxKtacAz+W9e72orNo43zIfmxKLaPpzk=;
  b=T9FAjmyYQ+SJFMtbkT81By4us7ruCunfA9G0fSDJmIsU22hCibKmv7gW
   YAF7jGDjOuTNfoLKmvXjaf6x3tdfg/iSfvq+Fhzr2x61cJDc6Rn/XHKXP
   v5F7kfbtlrAp6jJKjBlisDJTnEjud5fl+VnfDersXpLukvSBqN76BMWh3
   qXimcReXD8MpJWHggGOA/W449yAL7YtTQZBdF6KHDD1U0IpHl+i8anRar
   a//anJvGApl+UabidEzQbL7K53sPJ+7fckSzKvsLUtqdsy9S6+tqMZFjx
   Agg8DZDcQCJx+M2KoeOPgsf5l9EbjLPyNUG8iOy9BI9aCtxa5AcAeSC/g
   g==;
X-CSE-ConnectionGUID: tlazWadWStmvtbYzUw/Qbw==
X-CSE-MsgGUID: xeNJQNUMTuSDamhvQbtKhw==
X-IPAS-Result: =?us-ascii?q?A0DRAgBXGwVr/9JK/pBaHgEBCxIMggULgld1YUJJA4RUj?=
 =?us-ascii?q?1OCIQOLZpJDgX4PAQEBD0QNBAEBhD9GAo4iAiY1CA4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMPARgBHh8JEwMBAgMCJgICI?=
 =?us-ascii?q?AsjCBAJgwIBgjoDNwIBEZ9omyR6gTKBAYMpAYFU2EwNgloBCxQBgQouhUKDA?=
 =?us-ascii?q?CABhQNdGAGEfScbG4FygRWBF4JTgQWBGkICgScDhBKCagSCInoSgVQejHkCg?=
 =?us-ascii?q?U+ISUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA?=
 =?us-ascii?q?12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmP?=
 =?us-ascii?q?xUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsN?=
 =?us-ascii?q?xUZBD0BbgeUFIInUyABfg8BK4EbRSUDJByScJBIgiGgIHEKKIN5ihSCEI8+h?=
 =?us-ascii?q?XwaM4VbpRcLmH2OCoQKkV8bTYRqgWkBOoFZcBWDIglKGQ+OOYNrhlDICyM1A?=
 =?us-ascii?q?gkDLwEBBwIHAQwBAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:Yd7gh6rRbOdKMn+lKzwOILV3wYReBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmDbvyOM2D2ct53bdm/8xgOsMTXzIMxSlY4ry9jH3kRpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vpzCHNx/
 PAnEywIcAyJtvCL3/WCQPY506zPLOGzVG8eknht13TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA5PYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9JITTGZoJzxzwS
 mTu72nfICg8Cfmj1AGp+3esmNbFgQD7R9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:MWM4D6g+nDXrTU9p8whNU6IwSXBQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:5lEddWyvysGrOvRMCDCnBgUIHsk3TXTR80zMJlGkA1d7daLScFWPrfY=
X-Talos-MUID: 9a23:9LSk9AsywdL+RvTzmM2nlDxEFv5O3oGSFXshmJAGpfCOKQ9wJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60147492"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:44 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 0BFCB18000138
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:44 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id B1B72CC124F; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 04/12]  python3-virtualenv: fix CVE-2026-113726
Date: Mon, 23 Nov 2026 21:09:34 -0800
Message-Id: <20261124050942.1795310-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132911
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix in [1], identified by the
upstream security advisory in [2], to virtualenv 20.25.3.

[1] https://github.com/pypa/virtualenv/commit/5b915367da82bd024b2a0d28d2f98007034b4aa2
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-5vjq-rrrf-7h2q

Package each additional upstream prerequisite or correction in its own
embedded patch with its own upstream metadata.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113726.patch  | 97 +++++++++++++++++++
 .../bash-prompt-escaping-prerequisite.patch   | 42 ++++++++
 .../python/python3-virtualenv_20.25.3.bb      |  2 +
 3 files changed, 141 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-escaping-prerequisite.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
new file mode 100644
index 0000000000..42f7eb3df8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
@@ -0,0 +1,97 @@
+From 5b915367da82bd024b2a0d28d2f98007034b4aa2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
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
+Backport Changes:
+ - Apply after bash-prompt-escaping-prerequisite.patch and retain the
+   older activation block's layout and explicit PS1 export.
+ - Replace newer upstream test fixtures with prompt-rendering checks for
+   the older test layout.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 11 +++++++---
+ tests/unit/activation/test_bash.py         | 33 ++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 3 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index ced5f5d0e86b79975a70a1cfb596dd7f74ceb297..24a840867374e0f20f04449e2b81f14c1cd54b41 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -71,13 +71,18 @@ fi
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
+index 4c92b733c03f9be6f2be1f2e4f5df77dfb064450..6ee96e424bfa482ecd6aa3efd913e46151c9c234 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -23,3 +23,36 @@ def test_bash(raise_on_non_source_class, activation_tester):
+             return self.print_os_env_var("PS1")
+ 
+     activation_tester(Bash)
++
++
++@pytest.mark.skipif(IS_WIN, reason="requires POSIX shell activation")
++@pytest.mark.parametrize("shell", ["zsh"])
++@pytest.mark.parametrize("prompt", ["plain", r"a\$HOME%tail", r"doubled\\slashes"])
++def test_prompt_is_rendered_literally(tmp_path, shell, prompt):
++    """Shell prompt decoding must preserve characters supplied as prompt data."""
++    import os
++    import shlex
++    import shutil
++    import subprocess
++    from pathlib import Path
++
++    executable = shutil.which(shell)
++    if executable is None:
++        pytest.skip(f"{shell} is not available")
++    template = Path(__file__).resolve().parents[3] / "src/virtualenv/activation/bash/activate.sh"
++    script = template.read_text(encoding="utf-8")
++    script = script.replace("__VIRTUAL_ENV__", shlex.quote(str(tmp_path / "env")))
++    script = script.replace("__BIN_NAME__", shlex.quote("bin"))
++    script = script.replace("__VIRTUAL_PROMPT__", shlex.quote(prompt))
++    activation = tmp_path / "activate"
++    activation.write_text(script, encoding="utf-8")
++    options = ["--noprofile", "--norc", "-i"] if shell == "bash" else ["-f", "-i"]
++    setup = "setopt promptsubst\n" if shell == "zsh" else ""
++    commands = setup + "PS1='BASE>'\nsource " + shlex.quote(str(activation)) + "\nexit\n"
++    env = {**os.environ, "TERM": "dumb"}
++    env.pop("VIRTUAL_ENV_DISABLE_PROMPT", None)
++    result = subprocess.run(
++        [executable, *options], input=commands, text=True, capture_output=True,
++        env=env, timeout=10, check=True,
++    )
++    assert f"({prompt}) BASE>" in result.stderr
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-escaping-prerequisite.patch b/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-escaping-prerequisite.patch
new file mode 100644
index 0000000000..889d1bf274
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-escaping-prerequisite.patch
@@ -0,0 +1,42 @@
+From a70c1dac43e2ee7e618132b572072395af5d8a9b Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sat, 26 Sep 2026 09:35:09 -0700
+Subject: [PATCH] 🐛 fix(activation): stop bash re-expanding the prompt in PS1 (#3326)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/a70c1dac43e2ee7e618132b572072395af5d8a9b]
+
+Backport Changes:
+ - Apply the Bash prompt-escaping prerequisite to the older prompt block.
+ - Omit the newer upstream test fixtures and release-only changelog.
+   Prompt-rendering coverage is retained in the following CVE backports.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index e412509b800a932ef3f0ea6f236ab078e13d2b55..ced5f5d0e86b79975a70a1cfb596dd7f74ceb297 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -70,7 +70,16 @@ fi
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
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 8837d39ec9..a6cba8a946 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -12,6 +12,8 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://powershell-curly-quotes.patch \
             file://CVE-2026-113732.patch \
             file://fish3-multibyte-quoting.patch \
+            file://bash-prompt-escaping-prerequisite.patch \
+            file://CVE-2026-113726.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

