Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360C2D37E2F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:08:25 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9476.1768396098952476851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FepxUMyv;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so6583833a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396098; x=1769000898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSUW0s5FMloVggNHgGUaiGTI3zWYlqIe9ntUB2mwoDI=;
        b=FepxUMyvcdhsQ1oVeIUKhiY7gC6Nwugp71zeuacF7fCLR2q37P2GO4yxjbXuO+iqAc
         pfpCcUrdXgZ3yQk1eyMKj78gXdsCKmUWjia+9nJyBLB+UG/6Pr38OpY37JHiFYuqMU5P
         jakN5e7D4jJIoLZ9TRwHY9ALNjbJuXZnsm8DX95Pva4t54i+Hd90YKJ6WA99YXvGgpA3
         kvgxg6EzvxifezkNlAoMoibPw9jBDah6TA6i00B1oyXGXboZYGM+coAJIa6CVYB7xCX+
         0nQ2Bvf4Ly5/cKqWZn55zxXQrAIWaF2JuYDKd50zVhDeMY+mqd1Hd2BkaXZUQy1xX8Yi
         86FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396098; x=1769000898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSUW0s5FMloVggNHgGUaiGTI3zWYlqIe9ntUB2mwoDI=;
        b=cqW4kTRliolqtA8ptkR1ohdcS5p4lthX/Bg8x1uavUyFmLXxV3OiAZ9gYKup/1Q5rP
         E9koXapMy/yDUyL6rythqWObkpgmtrmwTyzSNzMqAmGrAqG1yHKlq/waljcAZjL18ye6
         H9zW0tOukXZgjZSoQM/z+wOg5zWVoC2eHir9wU4oErUM7IAUMeX99zEBCO945zZAm2J/
         Wz+jZhvfoCep46i2aiThomhP9F4GeurymT35Yxtpd5zSWDgMoiRzsRnKZGywtM4WvMet
         skFh236P5N4akqC48/2yzb5qxoRX+k0fZXZOzyQUkfox/cjbh5+pCo6f0zrR76cJx2Dg
         ociQ==
X-Gm-Message-State: AOJu0Yz+uXvdgHk6LJSRt1puWR1uT6WBYoaalsd58Y+Jbv1c/Y4R98Sg
	BZOPmSEqLpEK+pgMoVyiicZbeSc5ma8Qn0Qqn7LbXEfwTlqOAFCr2BhaAh1wIg==
X-Gm-Gg: AY/fxX4BQq6W/PplSd2zGVH/C9mN/I8Gus5vmeZACG3IzffDBvlBPa/u9g7fbnuB+rH
	Awmf8fc6Rb/b/MZnB6f+LnTI0x+Zorb6r7AhbF4CfARdsPukweybD5F/tARpm2d31F6RbeGR+5r
	hx1jECNiI8IyCjhkFyfwmINQCaHcrEzhkLDrPEIexA9yjAR0qFQ15jGZHsv3MGYAV1uGq7H9IWy
	Rtf47lLV70ZKKk6P5JumJG3aLGN44nxkC8tx+B4OvKZ26K7YIAL4Vjd4l07gJYWBrKEL45GmoNR
	VwFYTIUuUZTZSGKK/9ySWpiJqFOLM8Zs8VocxJfaHwFKEOx22GzFeiqMwmNgVO9AT8CKKV2GXSu
	WdIOzOBrgtDaD7frk2C7TnQJKfOFXvM1Q4tbKNZyPz6Y7ChlWu+ao/n68+79hlTaKQ/h1WEEYBm
	voIG1NBKJTh1l6hh8s/R2eO+w=
X-Received: by 2002:a17:90b:3503:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-3510b0b0300mr2197286a91.12.1768396097781;
        Wed, 14 Jan 2026 05:08:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106914b1esm1296398a91.1.2026.01.14.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:08:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 2/3] python3-virtualenv: patch CVE-2024-53899
Date: Thu, 15 Jan 2026 02:07:59 +1300
Message-ID: <20260114130800.1021123-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
References: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123478

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-53899

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-virtualenv/CVE-2024-53899.patch   | 422 ++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |   2 +
 2 files changed, 424 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
new file mode 100644
index 0000000000..ac1455f353
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
@@ -0,0 +1,422 @@
+From 8675348c70a2d0c4938f0b31c4aa2aba46c00b32 Mon Sep 17 00:00:00 2001
+From: Y5 <124019959+y5c4l3@users.noreply.github.com>
+Date: Fri, 27 Sep 2024 16:16:08 +0000
+Subject: [PATCH] Fix #2768: Quote template strings in activation scripts
+ (#2771)
+
+CVE: CVE-2024-53899
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/86dddeda7c991f8529e1995bbff280fb7b761972]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/virtualenv/activation/bash/activate.sh    |  8 +++----
+ src/virtualenv/activation/batch/__init__.py   |  4 ++++
+ src/virtualenv/activation/cshell/activate.csh |  8 +++----
+ src/virtualenv/activation/fish/activate.fish  |  8 +++----
+ src/virtualenv/activation/nushell/__init__.py | 19 +++++++++++++++++
+ src/virtualenv/activation/nushell/activate.nu |  8 +++----
+ .../activation/powershell/__init__.py         | 12 +++++++++++
+ .../activation/powershell/activate.ps1        |  6 +++---
+ src/virtualenv/activation/python/__init__.py  |  6 +++++-
+ .../activation/python/activate_this.py        |  8 +++----
+ src/virtualenv/activation/via_template.py     | 13 +++++++++++-
+ tests/conftest.py                             |  6 +++++-
+ tests/unit/activation/conftest.py             |  3 +--
+ tests/unit/activation/test_batch.py           | 10 ++++-----
+ tests/unit/activation/test_powershell.py      | 21 +++++++++++++------
+ 16 files changed, 104 insertions(+), 39 deletions(-)
+
+diff --git a/src/virtualenv/activation/bash/activate.sh b/src/virtualenv/activation/bash/activate.sh
+index b06e3fd3..e412509b 100644
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
+index a6d58ebb..3d74ba83 100644
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
+index f0c9cca9..24de5508 100644
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
+index c453caf9..f3cd1f2a 100644
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
+index 68cd4a3b..ef7a79a9 100644
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
+index 19d4fa1d..00a41e0e 100644
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
+index 1f6d0f4e..8489656c 100644
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
+index 5ccfe120..bd30e2ee 100644
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
+index 3126a39f..e900f7ec 100644
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
+index befe8f40..f297cae3 100644
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
+index 373316cf..1f532213 100644
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
+index 03f808fa..b67c2956 100644
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
+index 623c55d4..b30488a8 100644
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
+index ddcb251b..1d22767c 100644
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
+index b32a6a2a..6f36319d 100644
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
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index fee5250c4d..a980727dd6 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
+SRC_URI += "file://CVE-2024-53899.patch"
+
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 

