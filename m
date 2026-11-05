Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30039.1793869208884754057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U9NJWKo+;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6123; q=dns/txt;
  s=iport01; t=1793869209; x=1795078809;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jr78Psx0EA+J8L1RsAkrZ+h2IBxFB8DqSejh7vMQg5k=;
  b=U9NJWKo+sKsGDuKIPnpJntxt3g4Nm9LCrFuQ0qQVweTSRCWrzMyIU/E1
   /WaZAtlM676BQPzRs6tSQKuA8EyV1eBdVfCV132sMBeG73V6ojt5iDFG2
   qz6kP0bfCBbsYogQ5IWQmlFyWKaYE44Y5pA1DsvOu0nOR4LQ4k5T8s9u2
   CAeRDPn2dvE0Fnc3TVZqQF7zW0TrM6LxKkNhelr9gceRyuUKNRp/t2LRq
   atSJehj83o8riYbVtyRmk/jUvgZ6B/sHdQgVZFES6Lm0/1yrVY1tDLVu/
   1rY/gzeCV7crGny5c9RsJ5ByMg8njZm7r/+IZiwpPNWAyoxfMNS5NmvlY
   A==;
X-CSE-ConnectionGUID: 1gI1LRw+QOe0i65W6V00wg==
X-CSE-MsgGUID: Wy4M6ih8TAujowXVj6hv7w==
X-IPAS-Result: =?us-ascii?q?A0BCAwBRROxq/43/Ja1aHgEBCxIMggULgld1YENJA4RUj?=
 =?us-ascii?q?1OCIQOLZZQ6DwEBAQ9EDQQBAYQ/RgKOHQImNwYOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMjDwEYAR4CChMJEwMBAgMCJgICI?=
 =?us-ascii?q?AsjCBAJgwIBgjoDNwMRoQabJHqBMoEBgykBgVTYTA2CWgELFAGBCi6FQIJ/I?=
 =?us-ascii?q?AGFA10YAYR9JxsbgXKBFYNpgQWBGkICgScDhBKCagSCIoEMgVoejHoCgVKGc?=
 =?us-ascii?q?UiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHYEegRKBB12BK?=
 =?us-ascii?q?yheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?AsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ9AW4Hki+DEWAfDwErg?=
 =?us-ascii?q?SCBDByScJBJgiGgIHEKKIN4ihSCEI8+hXwaM4VbpRYLmH2OCoQKkV9ohGmBf?=
 =?us-ascii?q?iaBWXAVgyIJShkPjjmDa4ZQyAsmMgIJAy8BAQcCBwEMAQMLgWiQAIF+AQE?=
IronPort-Data: A9a23:EsV2FKwEAs5qB0firtl6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 GFLDz2OPq6OZmWhc9Bzao22phgOucXXn9VqTlBprVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBg5HNQ8wPk0OEZDr
 f1GdQ9TUEjbmO3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxbYONI4XSHK25mG6nt
 z7joWX5Ui0zKd6Y1gq78CysmLDQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3Uf9Mqr/cNUUJo24rg+cdyAaV5oJeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7290ey7MBDhHP1OkOws1MmZPTUO0VHAROoJ0WKh+UyDJ8SUzIFgPM
 lbH5SWcOeRMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3ANsruvmvK1Cd2u+cEQYY3knOu6It8fVyE6E3PYHa?=
 =?us-ascii?q?fBD5oFuCqF2HIoLxrxp8=3D?=
X-Talos-MUID: 9a23:QC4U+Aq6tHkG8IFItwIezw5zaOI24qT+NGkQk5IZi/eGayxuZCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="545101101"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 297CE180005CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7E993CBEF8A; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 07/18] python3-virtualenv: fix CVE-2026-113725
Date: Thu,  5 Nov 2026 00:59:56 -0800
Message-Id: <20261105090007.351866-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131886
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. Escape the Bash prompt for both its backslash
decoding and expansion passes so backslashes cannot undo quoting.

[1] https://github.com/pypa/virtualenv/commit/c3104e02474b652832a9bbaae79f6e1696296932
[2] https://github.com/pypa/virtualenv/security/advisories/GHSA-vxj4-q4g9-crj7

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2026-113725.patch  | 88 +++++++++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
new file mode 100644
index 0000000000..56bc9a41eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
@@ -0,0 +1,88 @@
+From c3104e02474b652832a9bbaae79f6e1696296932 Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Date: Sun, 11 Oct 2026 17:36:53 -0700
+Subject: [PATCH] 🐛 fix(activation): escape the bash prompt for both PS1
+ passes (#3390)
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
+- Omit the release-only changelog fragment; the release documentation
+  directory is absent from the 21.2.1 source distribution.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh | 8 +++++++-
+ tests/unit/activation/test_bash.py         | 6 ++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index 0a372ff..1551d85 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -119,7 +119,13 @@ if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
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
+index defd2ed..4512932 100644
+--- a/tests/unit/activation/test_bash.py
++++ b/tests/unit/activation/test_bash.py
+@@ -200,6 +200,8 @@ def prompt_after_activate(
+         pytest.param("x$(touch PWNED)y", "env", id="prompt-command-substitution"),
+         pytest.param("x`touch PWNED`y", "env", id="prompt-backticks"),
+         pytest.param("x${$(touch PWNED)}y", "env", id="prompt-parameter-expansion"),
++        pytest.param("x\\$(touch PWNED)y", "env", id="prompt-backslash-command-substitution"),
++        pytest.param("x\\`touch PWNED`y", "env", id="prompt-backslash-backticks"),
+         pytest.param(None, "x$(touch PWNED)y", id="dirname-command-substitution"),
+     ],
+ )
+@@ -217,6 +219,10 @@ def test_prompt_does_not_run_commands(
+     [
+         pytest.param("myenv", id="plain"),
+         pytest.param("a%n$HOME\\b`c`", id="special-characters"),
++        pytest.param("a\\$HOME", id="backslash-before-dollar"),
++        pytest.param("a\\`c`", id="backslash-before-backtick"),
++        pytest.param("x\\\\y", id="doubled-backslash"),
++        pytest.param("e\\", id="trailing-backslash"),
+     ],
+ )
+ def test_prompt_renders_name_literally(
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index cfb220fe41..9cf1ea3b6b 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
     file://CVE-2026-113776.patch \
     file://CVE-2026-113726-dependent.patch \
     file://CVE-2026-113726.patch \
+    file://CVE-2026-113725.patch \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

