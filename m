Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11751.1795496988092403056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fIrZBfbF;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=24569; q=dns/txt;
  s=iport01; t=1795496989; x=1796706589;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iEQgeAbs8R65I6ar/XB0YDneOPx7OdpnFUsJ/JvZvkI=;
  b=fIrZBfbFZWFpvLYddfKXYZjJqBJhzhyoQQkEiqRb8uEZTS6fvPyP/Ajz
   dpIeg1iu1FZKiDSobBF2Uh0fihsk+UGTBtknkbF5JapE3pSg/0JyHhKFx
   VPWDpiE40ztLQRB+U8a2UmwJZc+jDN2+mS6WtUIRp2Vjob85GNBu+MoZ+
   Mklyt0oQQppUTxo+CBJUxr6F2xgJjbUYO1Sys4bfGWobxpTTv8x3Y/wuK
   /noFZP6bu4ClAJzKDsGpJWgY8dgb4pj3mM//vak69K9XD/m2BybmQb5Xu
   0UvMeIQKhHrTSEUDlzZmrEdP4GyYAseDEjINKKg6N+uAbhAa2bpm+kKFh
   A==;
X-CSE-ConnectionGUID: on0+qQjMTB2xz7AM4Or2Fw==
X-CSE-MsgGUID: pJUaKCxKS9uN5bvyP08nuw==
X-IPAS-Result: =?us-ascii?q?A0AbAABOGgVr/8pK/pBaHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YUJJhFeIG4c4gTVsA4tmgyaPHYF+DwEBAQ80HQQBAYQ/RgKOI?=
 =?us-ascii?q?gImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECA?=
 =?us-ascii?q?QMaCQ8BGAE9CRMDAQIDAiYCAiALHQEFCBAJFIJuAYI6AzcCARGfZZskeoEyg?=
 =?us-ascii?q?QGDKQGBVNhMDYJaAQsUAYEKLgGBYYNggwAgAYUDXRgBRIQ5JxsbgXKBFYNqg?=
 =?us-ascii?q?QVLT0IBAQKBJYQVgmoEgiKBDIFUHox5AoFPiElIgQIcA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FG?=
 =?us-ascii?q?iY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4Hk3sZgxoBDVMTGgEHJ?=
 =?us-ascii?q?BcLXRkBB0AkGxsDDZJuEwaQL4IhjACUIHEKKIN5ihSCEI8+hXwaM4QEgVelF?=
 =?us-ascii?q?wuYfYJZiAVJgXZthAqRUSlNhGqBaDyBWXAVgyIJCkAZD44uAQoLg2CBJYNXF?=
 =?us-ascii?q?1FsyAsjNQIBCDIBAQcCBwEMAQMLgWiQACyBUgEB?=
IronPort-Data: A9a23:xYW4MKwikqIIppwjRJp6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUGy
 2IfC2GHMviLamSkfdEjadvno08GuMXUytRqTVY/+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEYwZc4Bw+RSPUsU5
 e5HARVRSQrZqf3jldpXSsE07igiBMDmJsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyaC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjuKybIaEKoziqcN9hmSlr
 0Ht70fCUww8adaB2ALdonSxmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:jENHxan46vh3rdanaYsL6gEQe/DpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:htOfKmOhNNcZme5DXy8/t1ctGOUZWCfN3ij5BhOfEzxHV+jA
X-Talos-MUID: 9a23:cxdOegSt8/BHHJeLRXT0pgxrF+x4wJ//FWZQm4sXg5HUMzFvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62744988"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:44 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 00B9D343F6
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:44 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id A3A2FCC124C; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 01/12]  python3-virtualenv: fix CVE-2024-53899
Date: Mon, 23 Nov 2026 21:09:31 -0800
Message-Id: <20261124050942.1795310-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124050942.1795310-1-hthakar@cisco.com>
References: <20261124050942.1795310-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132913
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the virtualenv community fix from upstream commit
86dddeda7c991f8529e1995bbff280fb7b761972 to quote activation-template
replacement values correctly.

Include the activation scripts, interpreter-specific quoting methods and
upstream test changes. Omit the changelog and Ruff configuration updates,
and refresh the patch context for virtualenv 20.25.3.

Carry the PowerShell delimiter correction from upstream
876c5ba473a311c14933eb767cc18f5d4ab3df7c in a separate embedded patch,
including its adapted delimiter and activation tests.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-virtualenv/CVE-2024-53899.patch   | 427 ++++++++++++++++++
 .../powershell-curly-quotes.patch             | 103 +++++
 .../python/python3-virtualenv_20.25.3.bb      |   5 +-
 3 files changed, 534 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/powershell-curly-quotes.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
new file mode 100644
index 0000000000..6a43e2dc31
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
@@ -0,0 +1,427 @@
+From 86dddeda7c991f8529e1995bbff280fb7b761972 Mon Sep 17 00:00:00 2001
+From: Y5 <124019959+y5c4l3@users.noreply.github.com>
+Date: Fri, 27 Sep 2024 16:16:08 +0000
+Subject: [PATCH] Fix #2768: Quote template strings in activation scripts
+ (#2771)
+
+CVE: CVE-2024-53899
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/86dddeda7c991f8529e1995bbff280fb7b761972]
+
+Backport Changes:
+ - Omit docs/changelog/2768.bugfix.rst and pyproject.toml, which only update
+   release notes and lint metadata.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/bash/activate.sh        |  8 ++++----
+ src/virtualenv/activation/batch/__init__.py       |  4 ++++
+ src/virtualenv/activation/cshell/activate.csh     |  8 ++++----
+ src/virtualenv/activation/fish/activate.fish      |  8 ++++----
+ src/virtualenv/activation/nushell/__init__.py     | 19 +++++++++++++++++++
+ src/virtualenv/activation/nushell/activate.nu     |  8 ++++----
+ src/virtualenv/activation/powershell/__init__.py  | 12 ++++++++++++
+ src/virtualenv/activation/powershell/activate.ps1 |  6 +++---
+ src/virtualenv/activation/python/__init__.py      |  6 +++++-
+ src/virtualenv/activation/python/activate_this.py |  8 ++++----
+ src/virtualenv/activation/via_template.py         | 13 ++++++++++++-
+ tests/conftest.py                                 |  6 +++++-
+ tests/unit/activation/conftest.py                 |  3 +--
+ tests/unit/activation/test_batch.py               | 10 +++++-----
+ tests/unit/activation/test_powershell.py          | 21 +++++++++++++++------
+ 15 files changed, 101 insertions(+), 39 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index b06e3fd33ac58101c2bfdbf47773d10ad3888a55..e412509b800a932ef3f0ea6f236ab078e13d2b55 100644
+--- a/src/virtualenv/activation/bash/activate.sh
++++ b/src/virtualenv/activation/bash/activate.sh
+@@ -45,18 +45,18 @@ deactivate () {
+ # unset irrelevant variables
+ deactivate nondestructive
+ 
+-VIRTUAL_ENV='__VIRTUAL_ENV__'
++VIRTUAL_ENV=__VIRTUAL_ENV__
+ if ([ "$OSTYPE" = "cygwin" ] || [ "$OSTYPE" = "msys" ]) && $(command -v cygpath &> /dev/null) ; then
+     VIRTUAL_ENV=$(cygpath -u "$VIRTUAL_ENV")
+ fi
+ export VIRTUAL_ENV
+ 
+ _OLD_VIRTUAL_PATH="$PATH"
+-PATH="$VIRTUAL_ENV/__BIN_NAME__:$PATH"
++PATH="$VIRTUAL_ENV/"__BIN_NAME__":$PATH"
+ export PATH
+ 
+-if [ "x__VIRTUAL_PROMPT__" != x ] ; then
+-    VIRTUAL_ENV_PROMPT="__VIRTUAL_PROMPT__"
++if [ "x"__VIRTUAL_PROMPT__ != x ] ; then
++    VIRTUAL_ENV_PROMPT=__VIRTUAL_PROMPT__
+ else
+     VIRTUAL_ENV_PROMPT=$(basename "$VIRTUAL_ENV")
+ fi
+diff --git a/src/virtualenv/activation/batch/__init__.py b/src/virtualenv/activation/batch/__init__.py
+index a6d58ebb4f7122f3ad51215abc9fc0938f468111..3d74ba8350571c28aba60a6e1acea1ee661e6dcd 100644
+--- a/src/virtualenv/activation/batch/__init__.py
++++ b/src/virtualenv/activation/batch/__init__.py
+@@ -15,6 +15,10 @@ class BatchActivator(ViaTemplateActivator):
+         yield "deactivate.bat"
+         yield "pydoc.bat"
+ 
++    @staticmethod
++    def quote(string):
++        return string
++
+     def instantiate_template(self, replacements, template, creator):
+         # ensure the text has all newlines as \r\n - required by batch
+         base = super().instantiate_template(replacements, template, creator)
+diff --git a/src/virtualenv/activation/cshell/activate.csh b/src/virtualenv/activation/cshell/activate.csh
+index f0c9cca96a10d2ae6e96f53709395bda1410f7f4..24de5508b9771284693dc5141909435f9b97304e 100644
+--- a/src/virtualenv/activation/cshell/activate.csh
++++ b/src/virtualenv/activation/cshell/activate.csh
+@@ -10,15 +10,15 @@ alias deactivate 'test $?_OLD_VIRTUAL_PATH != 0 && setenv PATH "$_OLD_VIRTUAL_PA
+ # Unset irrelevant variables.
+ deactivate nondestructive
+ 
+-setenv VIRTUAL_ENV '__VIRTUAL_ENV__'
++setenv VIRTUAL_ENV __VIRTUAL_ENV__
+ 
+ set _OLD_VIRTUAL_PATH="$PATH:q"
+-setenv PATH "$VIRTUAL_ENV:q/__BIN_NAME__:$PATH:q"
++setenv PATH "$VIRTUAL_ENV:q/"__BIN_NAME__":$PATH:q"
+ 
+ 
+ 
+-if ('__VIRTUAL_PROMPT__' != "") then
+-    setenv VIRTUAL_ENV_PROMPT '__VIRTUAL_PROMPT__'
++if (__VIRTUAL_PROMPT__ != "") then
++    setenv VIRTUAL_ENV_PROMPT __VIRTUAL_PROMPT__
+ else
+     setenv VIRTUAL_ENV_PROMPT "$VIRTUAL_ENV:t:q"
+ endif
+diff --git a/src/virtualenv/activation/fish/activate.fish b/src/virtualenv/activation/fish/activate.fish
+index c453caf9edae1bac76e5f8a0c37200b9eef27f48..f3cd1f2ab1451087e2a0f4f26cd46be52136548f 100644
+--- a/src/virtualenv/activation/fish/activate.fish
++++ b/src/virtualenv/activation/fish/activate.fish
+@@ -58,7 +58,7 @@ end
+ # Unset irrelevant variables.
+ deactivate nondestructive
+ 
+-set -gx VIRTUAL_ENV '__VIRTUAL_ENV__'
++set -gx VIRTUAL_ENV __VIRTUAL_ENV__
+ 
+ # https://github.com/fish-shell/fish-shell/issues/436 altered PATH handling
+ if test (echo $FISH_VERSION | head -c 1) -lt 3
+@@ -66,12 +66,12 @@ if test (echo $FISH_VERSION | head -c 1) -lt 3
+ else
+     set -gx _OLD_VIRTUAL_PATH $PATH
+ end
+-set -gx PATH "$VIRTUAL_ENV"'/__BIN_NAME__' $PATH
++set -gx PATH "$VIRTUAL_ENV"'/'__BIN_NAME__ $PATH
+ 
+ # Prompt override provided?
+ # If not, just use the environment name.
+-if test -n '__VIRTUAL_PROMPT__'
+-    set -gx VIRTUAL_ENV_PROMPT '__VIRTUAL_PROMPT__'
++if test -n __VIRTUAL_PROMPT__
++    set -gx VIRTUAL_ENV_PROMPT __VIRTUAL_PROMPT__
+ else
+     set -gx VIRTUAL_ENV_PROMPT (basename "$VIRTUAL_ENV")
+ end
+diff --git a/src/virtualenv/activation/nushell/__init__.py b/src/virtualenv/activation/nushell/__init__.py
+index 68cd4a3b4aca0751139ae14e8709c7e8b1a00ef0..ef7a79a9c4237f07d754d3476707ffce1ff28df4 100644
+--- a/src/virtualenv/activation/nushell/__init__.py
++++ b/src/virtualenv/activation/nushell/__init__.py
+@@ -7,6 +7,25 @@ class NushellActivator(ViaTemplateActivator):
+     def templates(self):
+         yield "activate.nu"
+ 
++    @staticmethod
++    def quote(string):
++        """
++        Nushell supports raw strings like: r###'this is a string'###.
++
++        This method finds the maximum continuous sharps in the string and then
++        quote it with an extra sharp.
++        """
++        max_sharps = 0
++        current_sharps = 0
++        for char in string:
++            if char == "#":
++                current_sharps += 1
++                max_sharps = max(current_sharps, max_sharps)
++            else:
++                current_sharps = 0
++        wrapping = "#" * (max_sharps + 1)
++        return f"r{wrapping}'{string}'{wrapping}"
++
+     def replacements(self, creator, dest_folder):  # noqa: ARG002
+         return {
+             "__VIRTUAL_PROMPT__": "" if self.flag_prompt is None else self.flag_prompt,
+diff --git a/src/virtualenv/activation/nushell/activate.nu b/src/virtualenv/activation/nushell/activate.nu
+index 19d4fa1d776c2441ad8aebe003a5adb354cf1e98..00a41e0e81333885f688925e5c403f336b2dc2fc 100644
+--- a/src/virtualenv/activation/nushell/activate.nu
++++ b/src/virtualenv/activation/nushell/activate.nu
+@@ -32,8 +32,8 @@ export-env {
+       }
+     }
+ 
+-    let virtual_env = '__VIRTUAL_ENV__'
+-    let bin = '__BIN_NAME__'
++    let virtual_env = __VIRTUAL_ENV__
++    let bin = __BIN_NAME__
+ 
+     let is_windows = ($nu.os-info.family) == 'windows'
+     let path_name = (if (has-env 'Path') {
+@@ -47,10 +47,10 @@ export-env {
+     let new_path = ($env | get $path_name | prepend $venv_path)
+ 
+     # If there is no default prompt, then use the env name instead
+-    let virtual_env_prompt = (if ('__VIRTUAL_PROMPT__' | is-empty) {
++    let virtual_env_prompt = (if (__VIRTUAL_PROMPT__ | is-empty) {
+         ($virtual_env | path basename)
+     } else {
+-        '__VIRTUAL_PROMPT__'
++        __VIRTUAL_PROMPT__
+     })
+ 
+     let new_env = {
+diff --git a/src/virtualenv/activation/powershell/__init__.py b/src/virtualenv/activation/powershell/__init__.py
+index 1f6d0f4e4efcbb6f3b29dab93168d9dd43e21a7d..8489656cc7e9ffa6a6a03fa2694052a0f94aa76f 100644
+--- a/src/virtualenv/activation/powershell/__init__.py
++++ b/src/virtualenv/activation/powershell/__init__.py
+@@ -7,6 +7,18 @@ class PowerShellActivator(ViaTemplateActivator):
+     def templates(self):
+         yield "activate.ps1"
+ 
++    @staticmethod
++    def quote(string):
++        """
++        This should satisfy PowerShell quoting rules [1], unless the quoted
++        string is passed directly to Windows native commands [2].
++
++        [1]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules
++        [2]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parsing#passing-arguments-that-contain-quote-characters
++        """  # noqa: D205
++        string = string.replace("'", "''")
++        return f"'{string}'"
++
+ 
+ __all__ = [
+     "PowerShellActivator",
+diff --git a/src/virtualenv/activation/powershell/activate.ps1 b/src/virtualenv/activation/powershell/activate.ps1
+index 5ccfe120c69ce03f0527afc1e011190fd4f1cdab..bd30e2eed53cb4167a62ea7769be6a4b7a3f63a8 100644
+--- a/src/virtualenv/activation/powershell/activate.ps1
++++ b/src/virtualenv/activation/powershell/activate.ps1
+@@ -37,8 +37,8 @@ deactivate -nondestructive
+ $VIRTUAL_ENV = $BASE_DIR
+ $env:VIRTUAL_ENV = $VIRTUAL_ENV
+ 
+-if ("__VIRTUAL_PROMPT__" -ne "") {
+-    $env:VIRTUAL_ENV_PROMPT = "__VIRTUAL_PROMPT__"
++if (__VIRTUAL_PROMPT__ -ne "") {
++    $env:VIRTUAL_ENV_PROMPT = __VIRTUAL_PROMPT__
+ }
+ else {
+     $env:VIRTUAL_ENV_PROMPT = $( Split-Path $env:VIRTUAL_ENV -Leaf )
+@@ -46,7 +46,7 @@ else {
+ 
+ New-Variable -Scope global -Name _OLD_VIRTUAL_PATH -Value $env:PATH
+ 
+-$env:PATH = "$env:VIRTUAL_ENV/__BIN_NAME____PATH_SEP__" + $env:PATH
++$env:PATH = "$env:VIRTUAL_ENV/" + __BIN_NAME__ + __PATH_SEP__ + $env:PATH
+ if (!$env:VIRTUAL_ENV_DISABLE_PROMPT) {
+     function global:_old_virtual_prompt {
+         ""
+diff --git a/src/virtualenv/activation/python/__init__.py b/src/virtualenv/activation/python/__init__.py
+index 3126a39f2d476740fa894252d479c426d1e60bb9..e900f7ec9a871d79c5ba896d864bc457d10904fa 100644
+--- a/src/virtualenv/activation/python/__init__.py
++++ b/src/virtualenv/activation/python/__init__.py
+@@ -10,10 +10,14 @@ class PythonActivator(ViaTemplateActivator):
+     def templates(self):
+         yield "activate_this.py"
+ 
++    @staticmethod
++    def quote(string):
++        return repr(string)
++
+     def replacements(self, creator, dest_folder):
+         replacements = super().replacements(creator, dest_folder)
+         lib_folders = OrderedDict((os.path.relpath(str(i), str(dest_folder)), None) for i in creator.libs)
+-        lib_folders = os.pathsep.join(lib_folders.keys()).replace("\\", "\\\\")  # escape Windows path characters
++        lib_folders = os.pathsep.join(lib_folders.keys())
+         replacements.update(
+             {
+                 "__LIB_FOLDERS__": lib_folders,
+diff --git a/src/virtualenv/activation/python/activate_this.py b/src/virtualenv/activation/python/activate_this.py
+index befe8f405cb795b122fadacd417f4a27d55424a9..f297cae35849fe3f31fbc88e105f871a661ded67 100644
+--- a/src/virtualenv/activation/python/activate_this.py
++++ b/src/virtualenv/activation/python/activate_this.py
+@@ -19,18 +19,18 @@ except NameError as exc:
+     raise AssertionError(msg) from exc
+ 
+ bin_dir = os.path.dirname(abs_file)
+-base = bin_dir[: -len("__BIN_NAME__") - 1]  # strip away the bin part from the __file__, plus the path separator
++base = bin_dir[: -len(__BIN_NAME__) - 1]  # strip away the bin part from the __file__, plus the path separator
+ 
+ # prepend bin to PATH (this file is inside the bin directory)
+ os.environ["PATH"] = os.pathsep.join([bin_dir, *os.environ.get("PATH", "").split(os.pathsep)])
+ os.environ["VIRTUAL_ENV"] = base  # virtual env is right above bin directory
+-os.environ["VIRTUAL_ENV_PROMPT"] = "__VIRTUAL_PROMPT__" or os.path.basename(base)  # noqa: SIM222
++os.environ["VIRTUAL_ENV_PROMPT"] = __VIRTUAL_PROMPT__ or os.path.basename(base)
+ 
+ # add the virtual environments libraries to the host python import mechanism
+ prev_length = len(sys.path)
+-for lib in "__LIB_FOLDERS__".split(os.pathsep):
++for lib in __LIB_FOLDERS__.split(os.pathsep):
+     path = os.path.realpath(os.path.join(bin_dir, lib))
+-    site.addsitedir(path.decode("utf-8") if "__DECODE_PATH__" else path)
++    site.addsitedir(path.decode("utf-8") if __DECODE_PATH__ else path)
+ sys.path[:] = sys.path[prev_length:] + sys.path[0:prev_length]
+ 
+ sys.real_prefix = sys.prefix
+diff --git a/src/virtualenv/activation/via_template.py b/src/virtualenv/activation/via_template.py
+index 373316cf586d5703b838990447f6a7270b5a1f57..1f532213c3a915a113b780cc0ee1a0cdb0f841a2 100644
+--- a/src/virtualenv/activation/via_template.py
++++ b/src/virtualenv/activation/via_template.py
+@@ -1,6 +1,7 @@
+ from __future__ import annotations
+ 
+ import os
++import shlex
+ import sys
+ from abc import ABC, abstractmethod
+ 
+@@ -21,6 +22,16 @@ class ViaTemplateActivator(Activator, ABC):
+     def templates(self):
+         raise NotImplementedError
+ 
++    @staticmethod
++    def quote(string):
++        """
++        Quote strings in the activation script.
++
++        :param string: the string to quote
++        :return: quoted string that works in the activation script
++        """
++        return shlex.quote(string)
++
+     def generate(self, creator):
+         dest_folder = creator.bin_dir
+         replacements = self.replacements(creator, dest_folder)
+@@ -63,7 +74,7 @@ class ViaTemplateActivator(Activator, ABC):
+         text = binary.decode("utf-8", errors="strict")
+         for key, value in replacements.items():
+             value_uni = self._repr_unicode(creator, value)
+-            text = text.replace(key, value_uni)
++            text = text.replace(key, self.quote(value_uni))
+         return text
+ 
+     @staticmethod
+diff --git a/tests/conftest.py b/tests/conftest.py
+index 03f808faee8a5507c6346025e4fa47be7803e71c..b67c295688a9c000f2e817d93486bdfb5ee302e2 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -275,7 +275,11 @@ def is_inside_ci():
+ 
+ @pytest.fixture(scope="session")
+ def special_char_name():
+-    base = "e-$ èрт🚒♞中片-j"
++    base = "'\";&&e-$ èрт🚒♞中片-j"
++    if IS_WIN:
++        # get rid of invalid characters on Windows
++        base = base.replace('"', "")
++        base = base.replace(";", "")
+     # workaround for pypy3 https://bitbucket.org/pypy/pypy/issues/3147/venv-non-ascii-support-windows
+     encoding = "ascii" if IS_WIN else sys.getfilesystemencoding()
+     # let's not include characters that the file system cannot encode)
+diff --git a/tests/unit/activation/conftest.py b/tests/unit/activation/conftest.py
+index 623c55d4e4de94067055b789b0cb1e488f244d1b..b30488a8590d86ec222259fd6ef99da8a2885186 100644
+--- a/tests/unit/activation/conftest.py
++++ b/tests/unit/activation/conftest.py
+@@ -6,7 +6,6 @@ import subprocess
+ import sys
+ from os.path import dirname, normcase
+ from pathlib import Path
+-from shlex import quote
+ from subprocess import Popen
+ 
+ import pytest
+@@ -153,7 +152,7 @@ class ActivationTester:
+         assert out[-1] == "None", raw
+ 
+     def quote(self, s):
+-        return quote(s)
++        return self.of_class.quote(s)
+ 
+     def python_cmd(self, cmd):
+         return f"{os.path.basename(sys.executable)} -c {self.quote(cmd)}"
+diff --git a/tests/unit/activation/test_batch.py b/tests/unit/activation/test_batch.py
+index ddcb251b4b92f709023e5621819c8f9ec5cb43f0..1d22767c37c072b118591edbcdcaba7aef4ba3c7 100644
+--- a/tests/unit/activation/test_batch.py
++++ b/tests/unit/activation/test_batch.py
+@@ -1,7 +1,5 @@
+ from __future__ import annotations
+ 
+-from shlex import quote
+-
+ import pytest
+ 
+ from virtualenv.activation import BatchActivator
+@@ -26,10 +24,12 @@ def test_batch(activation_tester_class, activation_tester, tmp_path):
+             return ["@echo off", *super()._get_test_lines(activate_script)]
+ 
+         def quote(self, s):
+-            """double quotes needs to be single, and single need to be double"""
+-            return "".join(("'" if c == '"' else ('"' if c == "'" else c)) for c in quote(s))
++            if '"' in s or " " in s:
++                text = s.replace('"', r"\"")
++                return f'"{text}"'
++            return s
+ 
+         def print_prompt(self):
+-            return "echo %PROMPT%"
++            return 'echo "%PROMPT%"'
+ 
+     activation_tester(Batch)
+diff --git a/tests/unit/activation/test_powershell.py b/tests/unit/activation/test_powershell.py
+index b32a6a2a346c4cc511011998ccdf82a913c12d14..6f36319d6fa7e5779df895caa0d6ab1c2c354235 100644
+--- a/tests/unit/activation/test_powershell.py
++++ b/tests/unit/activation/test_powershell.py
+@@ -1,7 +1,6 @@
+ from __future__ import annotations
+ 
+ import sys
+-from shlex import quote
+ 
+ import pytest
+ 
+@@ -21,11 +20,6 @@ def test_powershell(activation_tester_class, activation_tester, monkeypatch):
+             self.activate_cmd = "."
+             self.script_encoding = "utf-8-sig"
+ 
+-        def quote(self, s):
+-            """powershell double quote needed for quotes within single quotes"""
+-            text = quote(s)
+-            return text.replace('"', '""') if sys.platform == "win32" else text
+-
+         def _get_test_lines(self, activate_script):
+             return super()._get_test_lines(activate_script)
+ 
+@@ -35,4 +29,19 @@ def test_powershell(activation_tester_class, activation_tester, monkeypatch):
+         def print_prompt(self):
+             return "prompt"
+ 
++        def quote(self, s):
++            """
++            Tester will pass strings to native commands on Windows so extra
++            parsing rules are used. Check `PowerShellActivator.quote` for more
++            details.
++            """
++            text = PowerShellActivator.quote(s)
++            return text.replace('"', '""') if sys.platform == "win32" else text
++
++        def activate_call(self, script):
++            # Commands are called without quotes in PowerShell
++            cmd = self.activate_cmd
++            scr = self.quote(str(script))
++            return f"{cmd} {scr}".strip()
++
+     activation_tester(PowerShell)
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/powershell-curly-quotes.patch b/meta-python/recipes-devtools/python/python3-virtualenv/powershell-curly-quotes.patch
new file mode 100644
index 0000000000..740937a9a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/powershell-curly-quotes.patch
@@ -0,0 +1,103 @@
+From 876c5ba473a311c14933eb767cc18f5d4ab3df7c Mon Sep 17 00:00:00 2001
+From: Bernát Gábor <gaborjbernat@gmail.com>
+Subject: [PATCH] 🐛 fix(activation): escape PowerShell curly single quotes
+ (#3325)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+PowerShell treats U+2018-U+201B as single-quote delimiters just like the
+ASCII apostrophe, so a prompt, environment name or Tcl/Tk library path
+carrying one closed quote()'s literal early and ran the trailing text.
+Double each of those code points too, matching how PowerShell escapes a
+quote inside a single-quoted string.
+
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/876c5ba473a311c14933eb767cc18f5d4ab3df7c]
+
+Backport Changes:
+ - Apply the five-delimiter rule with a compact str.replace loop over
+   ASCII apostrophe and U+2018-U+201B, doubling each delimiter. Retain the
+   original fix's quoting docstring instead of the follow-up's explanatory
+   comments. Omit docs/changelog/3325.bugfix.rst (release notes).
+ - Retain the older untyped method signature. Add unittest delimiter checks
+   and generated activation coverage; omit unavailable Tcl/Tk fixtures.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/virtualenv/activation/powershell/__init__.py   |  3 +-
+ .../activation/test_cve_powershell_curly_quotes.py | 53 ++++++++++++++++++++++
+ 2 files changed, 55 insertions(+), 1 deletion(-)
+
+diff --git a/src/virtualenv/activation/powershell/__init__.py b/src/virtualenv/activation/powershell/__init__.py
+index 8489656cc7e9ffa6a6a03fa2694052a0f94aa76f..6cbae10e6ea623d54605c91a40fc7386620fb1dd 100644
+--- a/src/virtualenv/activation/powershell/__init__.py
++++ b/src/virtualenv/activation/powershell/__init__.py
+@@ -16,7 +16,8 @@ class PowerShellActivator(ViaTemplateActivator):
+         [1]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules
+         [2]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parsing#passing-arguments-that-contain-quote-characters
+         """  # noqa: D205
+-        string = string.replace("'", "''")
++        for delimiter in "'\u2018\u2019\u201a\u201b":
++            string = string.replace(delimiter, delimiter * 2)
+         return f"'{string}'"
+ 
+ 
+diff --git a/tests/unit/activation/test_cve_powershell_curly_quotes.py b/tests/unit/activation/test_cve_powershell_curly_quotes.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..bcc31bb3526f5b5cca98427d59576c013937df90
+--- /dev/null
++++ b/tests/unit/activation/test_cve_powershell_curly_quotes.py
+@@ -0,0 +1,53 @@
++"""PowerShell's single-quoted literals recognize typographic delimiters."""
++from __future__ import annotations
++
++import json
++import shutil
++import subprocess
++import tempfile
++import unittest
++from pathlib import Path
++
++from virtualenv.activation import PowerShellActivator
++from virtualenv.run import cli_run
++
++
++class PowerShellCurlyQuoteTests(unittest.TestCase):
++    def test_all_single_quote_delimiters_are_literal(self):
++        cases = [
++            ("owner's", "'owner''s'"),
++            ("owner\u2018s", "'owner\u2018\u2018s'"),
++            ("owner\u2019s", "'owner\u2019\u2019s'"),
++            ("owner\u201as", "'owner\u201a\u201as'"),
++            ("owner\u201bs", "'owner\u201b\u201bs'"),
++            ("", "''"),
++            ("two words", "'two words'"),
++        ]
++        for value, expected in cases:
++            with self.subTest(value=value):
++                self.assertEqual(PowerShellActivator.quote(value), expected)
++
++    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is not installed")
++    def test_generated_activation_preserves_typographic_prompt(self):
++        with tempfile.TemporaryDirectory() as directory:
++            dest = Path(directory) / "env"
++            prompt = "owner's \u2018plain\u2019 \u201aquoted\u201b prompt"
++            cli_run([
++                "--without-pip", "--no-periodic-update", "--activators", "powershell",
++                "--prompt", prompt, str(dest),
++            ])
++            wrapper = Path(directory) / "check.ps1"
++            wrapper.write_text(
++                '. $args[0]\n@($env:VIRTUAL_ENV, $env:VIRTUAL_ENV_PROMPT) | ConvertTo-Json -Compress\n',
++                encoding="utf-8-sig",
++            )
++            result = subprocess.run(
++                ["pwsh", "-NoLogo", "-NoProfile", "-NonInteractive", "-File", str(wrapper),
++                 str(dest / "bin/activate.ps1")],
++                check=True, capture_output=True, text=True, encoding="utf-8", timeout=30,
++            )
++            self.assertEqual(json.loads(result.stdout), [str(dest), prompt])
++
++
++if __name__ == "__main__":
++    unittest.main()
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 5cb99647b3..c9aad9fc3c 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -6,7 +6,10 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI += "file://CVE-2026-22702.patch"
+SRC_URI += "file://CVE-2026-22702.patch \
+            file://CVE-2024-53899.patch \
+            file://powershell-curly-quotes.patch \
+"
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

