Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11753.1795496989459483492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IZVk5izB;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6020; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nud8C6MfAhO70e/JeCx9O4ul2+4Yr47TI6CaL9bZfeI=;
  b=IZVk5izBe8ur678CQjdRnIa7axg1rZMUXL2+LEbLJqqavKC1cHpwXDin
   PIQC7isapqfy/dbU0UsxcSIkL/reb4idMICyrr21+xP1U4xohpFHy6caQ
   6nPJFgibMSz/xxlU92UNindUQb10gsoOTJdbyk54jqGkPTfzGd0Hp/pz4
   bHs/TRd3Yv08IJJ0WUm1qRccxYpsa9jY8JY5wk6nf2H+IDLjFtS3GqfJM
   AnRkivANTS9yeZ/ux3iQPIQehOtF72msUx85FQJo7uxwbVyEzSweChnd7
   cjzNvuPC3J1h0bjXsI1dwrVOeKH3G/zXvp53ZkPXALksrHxBS9T7QjFIk
   g==;
X-CSE-ConnectionGUID: EeA7SiCYRoGviaJ2iVaX/w==
X-CSE-MsgGUID: 5IpJldl8RZmImq6/OgaADw==
X-IPAS-Result: =?us-ascii?q?A0BPAgBXGwVr/8tK/pBaglmCV3VhQkkDhFSPU4IhA4tmk?=
 =?us-ascii?q?kOBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDIw8BGAEeAgoTCRMDAQIDAiYCAiALIwgQC?=
 =?us-ascii?q?YMCAYI6AzcCARGfaJskeoEygQGDKQGBVNhMDYJaAQsUAYEKLoVCgwAgAYUDX?=
 =?us-ascii?q?RgBhH0nGxuBcoEVg2qBBYEaQgKBKoQSgmoEgiJ6EoFUHox5AoFPiElIgQIcA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhC?=
 =?us-ascii?q?AINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4Hl?=
 =?us-ascii?q?BSCeiBhHg8BK4EgZSccknCQSIIhoCBxCiiDeYoUghCPPoV8GjOFW6UXC5h9j?=
 =?us-ascii?q?gqECpFfaIRqgWg8gVlwFYMiCUoZD445g2uGUMgLIzUCCQMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JF+AQE?=
IronPort-Data: A9a23:1HOmNayUvQFSThwhEY16t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUDn
 WobCz+CPauDYGf8fY11PIq39BkDupSHydI2GgU4qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD5MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGw7FNIj+81GO2Zh6
 /0RCmoMUBmzwP3jldpXSsE07igiBMDmJsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkybC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjuKybIOPJIPiqcN9w2eAh
 GbK+zTDMBQ7McXBjh2K+1uAmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:7ZqT/6Fx9VjmNdXapLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:8z1RXWz8KuqxCfAharfEBgU5F+l6SXz2/U3XDFG5AEQzSYOceRiPrfY=
X-Talos-MUID: 9a23:Rrvh7wbqQl05buBT6h70pjVuMJdS0aGPDVlT1rIJsuCoKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62741267"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:45 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 833871800017B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:45 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id B6852CC1250; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 05/12]  python3-virtualenv: fix CVE-2026-113725
Date: Mon, 23 Nov 2026 21:09:35 -0800
Message-Id: <20261124050942.1795310-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132916
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch backports the upstream fix in [1], identified by the
upstream security advisory in [2], to virtualenv 20.25.3.
Apply after the separately packaged Bash prompt-escaping prerequisite.

[1] https://github.com/pypa/virtualenv/commit/c3104e02474b652832a9bbaae79f6e1696296932
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-vxj4-q4g9-crj7

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113725.patch  | 76 +++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
new file mode 100644
index 0000000000..f6eae79dbd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
@@ -0,0 +1,76 @@
+From c3104e02474b652832a9bbaae79f6e1696296932 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Sun, 11 Oct 2026 17:36:53 -0700
+Subject: [PATCH] 🐛 fix(activation): escape the bash prompt for both PS1 passes (#3390)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+bash handles `PS1` in two passes each time it draws the prompt: it first
+decodes backslash prompt escapes, turning `\\` into `\` and `\$` into
+`$` (or `#` for root), and then expands the result. The bash `activate`
+script escaped the environment name for the expansion pass only (#3326),
+so a backslash in the name undoes that escaping. 🔐 A name such as
+`a\$(touch PWNED)`, from the directory, `--prompt` or
+`VIRTUALENV_PROMPT`, runs the command each time bash draws the prompt.
+For root, `\$` decodes to `#`, so the same name renders wrong but runs
+nothing.
+
+Under bash, `activate` now escapes backslashes, dollar signs and
+backticks a second time, so both passes leave the name literal. zsh does
+no decode pass, so it keeps the single escaping added in 5b915367. The
+prompt tests gain cases for a backslash before `$(...)` and before
+backticks, and for names with a backslash before `$`, before a backtick,
+doubled, and trailing; they render through bash 5.2 and zsh 5.9 and pass
+as root and as an unprivileged user.
+
+Every release up to 21.14.6 is affected, and earlier releases before
+21.13.0 do not escape the name at all.
+
+CVE: CVE-2026-113725
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/c3104e02474b652832a9bbaae79f6e1696296932]
+
+Backport Changes:
+ - Refresh context for the older activation block, after the separately
+   applied Bash prerequisite and CVE-2026-113726 patches.
+ - Extend the locally adapted prompt-rendering checks for Bash instead of
+   applying the newer upstream tests; omit docs/changelog/3390.bugfix.rst.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 8 +++++++-
+ tests/unit/activation/test_bash.py         | 2 +-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 24a840867374e0f20f04449e2b81f14c1cd54b41..416a65224cd5fcb9395985e3497c36f80d97924c 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -74,7 +74,13 @@ if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
+     # bash, and zsh under PROMPT_SUBST, re-expand backslashes, dollar signs and backticks in PS1 on every redraw;
+     # zsh gets the escaping even without the option, since a user can set it after activation. The guards keep
+     # the substitution away from POSIX shells such as dash, which reject it with "Bad substitution"
+-    if [ -n "${BASH_VERSION-}${ZSH_VERSION-}" ]; then
++    if [ -n "${BASH_VERSION-}" ]; then
++        # bash first decodes its backslash prompt escapes, turning \\ into \ and \$ into $ (or # for root), and only
++        # then expands the result, so each character needs escaping for both passes
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\\\\\}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\\\$}"
++        _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\\\`}"
++    elif [ -n "${ZSH_VERSION-}" ]; then
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\\/\\\\}"
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\$/\\\$}"
+         _VIRTUAL_PROMPT="${_VIRTUAL_PROMPT//\`/\\\`}"
+diff --git a/tests/unit/activation/test_bash.py b/tests/unit/activation/test_bash.py
+index 6ee96e424bfa482ecd6aa3efd913e46151c9c234..f9ddc40f771031b7fcc46a917dbe998eee4aa677 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -26,7 +26,7 @@ def test_bash(raise_on_non_source_class, activation_tester):
+ 
+ 
+ @pytest.mark.skipif(IS_WIN, reason="requires POSIX shell activation")
+-@pytest.mark.parametrize("shell", ["zsh"])
++@pytest.mark.parametrize("shell", ["bash", "zsh"])
+ @pytest.mark.parametrize("prompt", ["plain", r"a\$HOME%tail", r"doubled\\slashes"])
+ def test_prompt_is_rendered_literally(tmp_path, shell, prompt):
+     """Shell prompt decoding must preserve characters supplied as prompt data."""
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index a6cba8a946..6407eed276 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://CVE-2026-22702.patch \
             file://fish3-multibyte-quoting.patch \
             file://bash-prompt-escaping-prerequisite.patch \
             file://CVE-2026-113726.patch \
+            file://CVE-2026-113725.patch \
 "
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-- 
2.35.6

