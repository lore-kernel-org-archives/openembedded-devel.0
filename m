Return-Path: <auh@moto-timo.dev>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA43CEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.932.1689139806205807711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Cbs/n2RL;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5394760004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139804;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=s78ni4FLTA5XHWQB5jH9NZjh7P5rukPkvgsP4IB7b1w=;
	b=Cbs/n2RLg4lIRz6PUDqhHy3lvNBGeJneUSWKoZKUGohBQeijpFkn01rLwkXFE/HIyBhQFz
	F1dDSgAVFbQ7E5WWkcHNg1frFwqOZrnqgLcWHDceV3mHf/81vhU/mPSCzxRRYu9gYv82mO
	wGX2uHaWsk/cLnQvSZZwrmjHLEm3o+dMxq/vwyBHk7LREH+0Y8YrKj7588bgGObwjXVmmw
	PAtHzP6SVdRH+0idlHHseuKIMux7GElTfcXBnDrJYvQKPURKvFnT8Bcd/U0/1M84r0Hehh
	pF0slGQL/jSpacZaGL0x9BVYK/5uUicTT5BRrbiX/5XpezloYULFpM6DG/+/0A==
Content-Type: multipart/mixed; boundary="===============2679779896673164235=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-binwalk: upgrading to 27 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103749
Message-Id: <20230712053010.DA43CEB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:10 +0000 (UTC)

--===============2679779896673164235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-binwalk* to *27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-binwalk-upgrade-2.3.3-27.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 65a2fce66da78b84e47dc761a56aee8c304c4ad2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:16:02 -0500
Subject: [PATCH] python3-binwalk: upgrade 2.3.3 -> 27

---
 ...-on-newer-ubuntu-distros-and-drop-py.patch |  215 ++
 ...02-Remove-python-2.7-from-CI-testing.patch |   21 +
 ...ix-to-distros-under-LTS-and-python-v.patch |   50 +
 ...apply-test-matrix-to-dist-keyword-ex.patch |   60 +
 ...plement-exponent-and-shift-operators.patch |   38 +
 ...d-based-on-modern-realities-with-pyt.patch |  107 +
 ...le-along-with-changes-required-for-s.patch |  137 +
 ...stage-build-and-test-stage-include-D.patch |  158 +
 .../0009-fix-travis-script.patch              |   50 +
 .../0010-still-no-love-for-travis.patch       |   25 +
 ...e-of-cryptodome-since-pycrypto-is-EO.patch |   22 +
 ...empty-password-to-avoid-unzip-stuck-.patch |   23 +
 ...-Ubuntu-Focal-is-Python-3-by-default.patch |   24 +
 ...deps.sh-if-any-install-command-fails.patch |   51 +
 ...d-to-bifurcate-python3-and-python2-d.patch |   63 +
 ...using-issues-use-whatever-pip-the-us.patch |   44 +
 ...ot-preserve-the-specified-python-whe.patch |   23 +
 ...here-is-no-rhyme-or-reason-to-travis.patch |   31 +
 ...ve-the-python-being-used-across-sudo.patch |   56 +
 .../python/python3-binwalk/0020-nop.patch     |   31 +
 .../0021-sasquatch-patch-was-merged.patch     |   56 +
 ...0022-add-third-party-NOTICE-markdown.patch |   27 +
 .../0023-Removed-sensitive-keys.patch         |  220 ++
 ...ecryption-plugin-contains-priprietar.patch |  124 +
 ...5-Updated-version-number-for-release.patch |   22 +
 ...al-low-priv-execution-implementation.patch |   97 +
 ...ption-to-turn-off-privilege-dropping.patch |  152 +
 ...-specifying-a-user-to-run-external-e.patch |  139 +
 ...0029-Initial-symlink-repair-solution.patch |   82 +
 ...nts-and-better-error-output-for-end-.patch |   61 +
 .../0031-Bug-fixes-code-testing.patch         |   70 +
 .../python3-binwalk/0032-Code-cleanup.patch   |   71 +
 ...ectory-traversal-test-fixed-zip-test.patch | 2579 +++++++++++++++++
 ...d-to-include-extraction-security-not.patch |   45 +
 ...al-test-updated-extractor-to-not-for.patch |  152 +
 .../0036-Fixed-code-comment.patch             |   22 +
 ...disable-symlink-sanitization-if-desi.patch |   43 +
 ...binwalk_2.3.3.bb => python3-binwalk_27.bb} |   42 +-
 38 files changed, 5231 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
 rename meta-python/recipes-devtools/python/{python3-binwalk_2.3.3.bb => python3-binwalk_27.bb} (17%)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
new file mode 100644
index 000000000..4607ef6c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
@@ -0,0 +1,215 @@
+From c1ab4d76969c6e246940266c840f726c872f7237 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 2 Feb 2020 19:07:02 -0700
+Subject: [PATCH] deps: Fix install on newer ubuntu distros and drop python2
+ support.
+
+Dependencies such as jefferson are now python3 only and python2 is no
+longer supported, as it appears all our dependencies have python3
+versions it should be safe to drop python2 support.
+---
+ .travis.yml                | 16 ++++++++++++++--
+ deps.sh                    | 30 +++++++++++++++---------------
+ setup.py                   | 17 ++++++++++++++---
+ src/binwalk/core/compat.py |  5 +----
+ src/binwalk/core/magic.py  |  2 +-
+ src/binwalk/plugins/tar.py |  2 +-
+ 6 files changed, 46 insertions(+), 26 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 3cdebed..34b10c8 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,3 +1,7 @@
++dist: xenial
++addons:
++  apt:
++    update: true
+ language: python
+ arch: 
+  - ppc64le
+@@ -9,13 +13,21 @@ python:
+  - "3.6"
+  - "3.7"
+  - "3.8"
++ - "3.9"
+  - "nightly"
+ install:
++ - ./deps.sh --yes
+  - pip install coverage
+- - pip install backports.lzma
+  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
+-matrix:
++jobs:
++  include:
++   - python: "3.6"
++     dist: bionic
++   - python: "3.8"
++     dist: focal
++   - python: "3.9"
++     dist: focal
+   allow_failures:
+    - python: nightly
+diff --git a/deps.sh b/deps.sh
+index 19892de..5321b37 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -41,24 +41,26 @@ APTGETCMD="apt-get"
+ YUMCMD="yum"
+ if [ $distro = "Kali" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
+-elif [ $distro_version = "17" ]
++    APT_CANDIDATES="git build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
++elif [ $distro_version = "14" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++elif [ $distro_version = "15" ]
++then
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++elif [ $distro_version = "16" ]
++then
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "18" ]
+ then
+     APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ else
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ fi
+-PYTHON2_APT_CANDIDATES="python-crypto python-lzo python-lzma python-pip python-tk"
+-PYTHON3_APT_CANDIDATES="python3-crypto python3-pip python3-tk"
++PYTHON3_APT_CANDIDATES="python3-crypto python3-gnupg python3-pip python3-tk"
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PYTHON2_YUM_CANDIDATES="python-pip python-Bottleneck cpio"
+-APT_CANDIDATES="$APT_CANDIDATES $PYTHON2_APT_CANDIDATES"
+-YUM_CANDIDATES="$YUM_CANDIDATES $PYTHON2_YUM_CANDIDATES"
+-PIP_COMMANDS="pip"
++PIP_COMMANDS="pip3"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -72,7 +74,7 @@ fi
+ function install_yaffshiv
+ {
+     git clone https://github.com/devttys0/yaffshiv
+-    (cd yaffshiv && $SUDO python2 setup.py install)
++    (cd yaffshiv && $SUDO python3 setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+@@ -122,10 +124,7 @@ function install_cramfstools
+ function install_ubireader
+ {
+     git clone https://github.com/jrspruitt/ubi_reader
+-    # Some UBIFS extraction breaks after this commit, due to "Added fatal error check if UBI block extends beyond file size"
+-    # (see this commit: https://github.com/jrspruitt/ubi_reader/commit/af678a5234dc891e8721ec985b1a6e74c77620b6)
+-    # Reset to a known working commit.
+-    (cd ubi_reader && git reset --hard 0955e6b95f07d849a182125919a1f2b6790d5b51 && $SUDO python setup.py install)
++    (cd ubi_reader && $SUDO python3 setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
+ 
+@@ -257,6 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
++install_pip_package setuptools
+ install_pip_package matplotlib
+ install_pip_package capstone
+ install_sasquatch
+diff --git a/setup.py b/setup.py
+index e4fca3f..b747b4d 100755
+--- a/setup.py
++++ b/setup.py
+@@ -1,10 +1,14 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
++import io
+ import os
+ import sys
+ import glob
+ import shutil
+ import subprocess
+-from distutils.core import setup, Command
++try:
++    from setuptools import setup, Command
++except ImportError:
++    from distutils.core import setup, Command
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+@@ -24,7 +28,7 @@ except ImportError:
+ # by binwalk.
+ try:
+     label = subprocess.check_output(["git", "rev-parse", "--short", "HEAD"], stderr=DEVNULL).decode('utf-8')
+-    MODULE_VERSION = "%s-%s" % (MODULE_VERSION, label.strip())
++    MODULE_VERSION = "%s+%s" % (MODULE_VERSION, label.strip())
+ except KeyboardInterrupt as e:
+     raise e
+ except Exception:
+@@ -318,14 +322,21 @@ install_data_files = []
+ for data_dir in ["magic", "config", "plugins", "modules", "core"]:
+     install_data_files.append("%s%s*" % (data_dir, os.path.sep))
+ 
++this_directory = os.path.abspath(os.path.dirname(__file__))
++with io.open(os.path.join(this_directory, 'README.md'), encoding='utf-8') as f:
++    long_description = f.read()
++
+ # Install the module, script, and support files
+ setup(
+     name=MODULE_NAME,
+     version=MODULE_VERSION,
+     description="Firmware analysis tool",
++    long_description=long_description,
++    long_description_content_type='text/markdown',
+     author="Craig Heffner",
+     url="https://github.com/ReFirmLabs/%s" % MODULE_NAME,
+     requires=[],
++    python_requires=">=3",
+     package_dir={"": "src"},
+     packages=[MODULE_NAME],
+     package_data={MODULE_NAME: install_data_files},
+diff --git a/src/binwalk/core/compat.py b/src/binwalk/core/compat.py
+index b5453c5..b610c99 100644
+--- a/src/binwalk/core/compat.py
++++ b/src/binwalk/core/compat.py
+@@ -81,7 +81,4 @@ def user_input(prompt=''):
+     '''
+     For getting raw user input in Python 2 and 3.
+     '''
+-    if PY_MAJOR_VERSION > 2:
+-        return input(prompt)
+-    else:
+-        return raw_input(prompt)
++    return input(prompt)
+diff --git a/src/binwalk/core/magic.py b/src/binwalk/core/magic.py
+index 750bd12..8f7a316 100644
+--- a/src/binwalk/core/magic.py
++++ b/src/binwalk/core/magic.py
+@@ -625,7 +625,7 @@ class Magic(object):
+                     try:
+                         # If the operator value of this signature line is just
+                         # an integer value, use it
+-                        if isinstance(line.opvalue, int) or isinstance(line.opvalue, long):
++                        if isinstance(line.opvalue, int):
+                             opval = line.opvalue
+                         # Else, evaluate the complex expression
+                         else:
+diff --git a/src/binwalk/plugins/tar.py b/src/binwalk/plugins/tar.py
+index be54d8a..da3121a 100644
+--- a/src/binwalk/plugins/tar.py
++++ b/src/binwalk/plugins/tar.py
+@@ -33,7 +33,7 @@ class TarPlugin(binwalk.core.plugin.Plugin):
+                 raise ValueError("invalid tar header")
+         else:
+             n = 0
+-            for i in xrange(len(s) - 1):
++            for i in range(len(s) - 1):
+                 n <<= 8
+                 n += ord(s[i + 1])
+         return n
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch b/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
new file mode 100644
index 000000000..690c7c09b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
@@ -0,0 +1,21 @@
+From 581f3e3c3b59330605e143440dd9e750f2dca1df Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:05:08 -0400
+Subject: [PATCH] Remove python 2.7 from CI testing
+
+---
+ .travis.yml | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 34b10c8..d20236e 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -7,7 +7,6 @@ arch:
+  - ppc64le
+  - amd64
+ python:
+- - "2.7"
+  - "3.4"
+  - "3.5"
+  - "3.6"
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch b/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
new file mode 100644
index 000000000..ff4c77375
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
@@ -0,0 +1,50 @@
+From cae584099ceeaa148e7ad284f4f3c72d44af2b82 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:40:25 -0400
+Subject: [PATCH] reduce test matrix to distros under LTS and python versions
+ currently
+
+---
+ .travis.yml | 18 +++---------------
+ 1 file changed, 3 insertions(+), 15 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index d20236e..e0b78d5 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,32 +1,20 @@
+-dist: xenial
++dist:
++  - bionic
++  - focal
+ addons:
+   apt:
+     update: true
+ language: python
+ arch: 
+- - ppc64le
+  - amd64
+ python:
+- - "3.4"
+- - "3.5"
+  - "3.6"
+  - "3.7"
+  - "3.8"
+  - "3.9"
+- - "nightly"
+ install:
+  - ./deps.sh --yes
+  - pip install coverage
+  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
+-jobs:
+-  include:
+-   - python: "3.6"
+-     dist: bionic
+-   - python: "3.8"
+-     dist: focal
+-   - python: "3.9"
+-     dist: focal
+-  allow_failures:
+-   - python: nightly
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch b/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
new file mode 100644
index 000000000..af9762260
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
@@ -0,0 +1,60 @@
+From 810cc9ef5d63967dba9c2bc47176427fc1cc666d Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:56:00 -0400
+Subject: [PATCH] Travis will not apply test matrix to dist keyword, expand it
+ manually in jobs list
+
+---
+ .travis.yml | 39 +++++++++++++++++++++++++--------------
+ 1 file changed, 25 insertions(+), 14 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index e0b78d5..d2b068d 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,20 +1,31 @@
+-dist:
+-  - bionic
+-  - focal
++os: linux
++dist: bionic
++language: python
++arch: amd64
+ addons:
+   apt:
+     update: true
+-language: python
+-arch: 
+- - amd64
+-python:
+- - "3.6"
+- - "3.7"
+- - "3.8"
+- - "3.9"
+ install:
+- - ./deps.sh --yes
+- - pip install coverage
+- - ./setup.py install
++  - ./deps.sh --yes
++  - pip install coverage
++  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
++jobs:
++  include:
++   - dist: bionic
++     python: 3.6
++   - dist: bionic
++     python: 3.7
++   - dist: bionic
++     python: 3.8
++   - dist: bionic
++     python: 3.9
++   - dist: focal
++     python: 3.6
++   - dist: focal
++     python: 3.7
++   - dist: focal
++     python: 3.8
++   - dist: focal
++     python: 3.9
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch b/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
new file mode 100644
index 000000000..ec3cedd39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
@@ -0,0 +1,38 @@
+From 5ca500407edd177dc6e88afbc42dff7490ce90c3 Mon Sep 17 00:00:00 2001
+From: Marcus T <llamasoft@rm-rf.email>
+Date: Fri, 26 Feb 2021 16:15:36 -0800
+Subject: [PATCH] Actually implement exponent and shift operators
+
+These operators are listed in the "Signature File Format" wiki page but don't actually exist.
+---
+ src/binwalk/core/magic.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/binwalk/core/magic.py b/src/binwalk/core/magic.py
+index 8f7a316..bcc6dc7 100644
+--- a/src/binwalk/core/magic.py
++++ b/src/binwalk/core/magic.py
+@@ -97,7 +97,7 @@ class SignatureLine(object):
+         # AND the data with 0xFF before the comparison is performed).
+         #
+         # We support the following operators:
+-        for operator in ['&', '|', '*', '+', '-', '/', '~', '^']:
++        for operator in ['**', '<<', '>>', '&', '|', '*', '+', '-', '/', '~', '^']:
+             # Look for each operator in self.type
+             if operator in self.type:
+                 # If found, split self.type into the type and operator value
+@@ -632,7 +632,13 @@ class Magic(object):
+                             opval = self._do_math(offset, line.opvalue)
+ 
+                         # Perform the specified operation
+-                        if line.operator == '&':
++                        if line.operator == '**':
++                            dvalue **= opval
++                        elif line.operator == '<<':
++                            dvalue <<= opval
++                        elif line.operator == '>>':
++                            dvalue >>= opval
++                        elif line.operator == '&':
+                             dvalue &= opval
+                         elif line.operator == '|':
+                             dvalue |= opval
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch b/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
new file mode 100644
index 000000000..b064cf823
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
@@ -0,0 +1,107 @@
+From 144107e8cc8aa62a00dbdb4f6f087ccb824bfc6f Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Tue, 16 Mar 2021 00:44:40 -0400
+Subject: [PATCH] Update INSTALL.md based on modern realities with python3
+
+---
+ INSTALL.md | 45 ++++-----------------------------------------
+ 1 file changed, 4 insertions(+), 41 deletions(-)
+
+diff --git a/INSTALL.md b/INSTALL.md
+index f39e95b..a14e8c4 100644
+--- a/INSTALL.md
++++ b/INSTALL.md
+@@ -1,18 +1,13 @@
+ Before You Start
+ ================
+ 
+-Binwalk supports Python 2.7 - 3.x. Although most systems have Python2.7 set as their default Python interpreter, binwalk does run faster in Python3. Installation procedures for both are provided below.
++Binwalk supports Python 3.6+. 
+ 
+ Installation
+ ============
+ 
+ Installation follows the typical Python installation procedure:
+ 
+-```bash
+-# Python2.7
+-$ sudo python setup.py install
+-```
+-
+ ```bash
+ # Python3.x
+ $ sudo python3 setup.py install
+@@ -25,40 +20,21 @@ Dependencies
+ 
+ Besides a Python interpreter, there are no installation dependencies for binwalk. All dependencies are optional run-time dependencies, and unless otherwise specified, are available from most Linux package managers.
+ 
+-Although all binwalk run-time dependencies are optional, the `python-lzma` module is highly recommended for improving the reliability of signature scans. This module is included by default in Python3, but must be installed separately for Python2.7:
+-
+-```bash
+-$ sudo apt-get install python-lzma
+-```
+-
+ Binwalk uses the `nosetest` library for tests and `coverage` for test-coverage:
+ 
+ ```bash
+ $ sudo pip install nose coverage
+ ```
+ 
+-Binwalk uses the `pycrypto` library to decrypt some known encrypted firmware images:
++Binwalk uses the `pycryptodome` (`pycrypto`-compatible module that is still maintained) library to decrypt some known encrypted firmware images:
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install python-crypto
+-```
+-
+-```bash
+-# Python3.x
+-$ sudo apt-get install python3-crypto
++$ sudo pip install pycryptodome
+ ```
+ 
+-Binwalk uses [pyqtgraph](http://www.pyqtgraph.org) to generate graphs and visualizations, which requires the following: 
++Binwalk uses [pyqtgraph](http://www.pyqtgraph.org) to generate graphs and visualizations, which requires the following (exact dependencies may vary based on your distro refer to `deps.sh` for more details): 
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install libqt4-opengl python-opengl python-qt4 python-qt4-gl python-numpy python-scipy python-pip
+-$ sudo pip install pyqtgraph
+-```
+-
+-```bash
+-# Python3.x
+ $ sudo apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pip
+ $ sudo pip3 install pyqtgraph
+ ```
+@@ -66,17 +42,9 @@ $ sudo pip3 install pyqtgraph
+ Binwalk's `--disasm` option requires the [Capstone](http://www.capstone-engine.org/) disassembly framework and its corresponding Python bindings:
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install python-pip
+ $ sudo pip install capstone
+ ```
+ 
+-```bash
+-# Python3.x
+-$ sudo apt-get install python3-pip
+-$ sudo pip3 install capstone
+-```
+-
+ Binwalk relies on multiple external utilties in order to automatically extract/decompress files and data:
+ 
+ ```bash
+@@ -144,11 +112,6 @@ Uninstalling Binwalk
+ 
+ If binwalk has been installed to a standard system location (e.g., via `setup.py install`), it can be removed by running:
+ 
+-```bash
+-# Python2.7
+-$ sudo python setup.py uninstall
+-```
+-
+ ```bash
+ # Python3
+ $ sudo python3 setup.py uninstall
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch b/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
new file mode 100644
index 000000000..64ceb6cb8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
@@ -0,0 +1,137 @@
+From aacbcc4c542670ee51fd87ece292324f6ac2d0d2 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 14:54:39 -0400
+Subject: [PATCH] initial Dockerfile along with changes required for setting
+ locale correctly inside Docker container.
+
+---
+ .dockerignore |  5 +++++
+ Dockerfile    | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ deps.sh       | 18 +++++++---------
+ 3 files changed, 73 insertions(+), 10 deletions(-)
+ create mode 100644 .dockerignore
+ create mode 100644 Dockerfile
+
+diff --git a/.dockerignore b/.dockerignore
+new file mode 100644
+index 0000000..af5c03a
+--- /dev/null
++++ b/.dockerignore
+@@ -0,0 +1,5 @@
++build
++dist
++.coverage
++*.extracted
++*.pyc
+diff --git a/Dockerfile b/Dockerfile
+new file mode 100644
+index 0000000..64451fc
+--- /dev/null
++++ b/Dockerfile
+@@ -0,0 +1,60 @@
++FROM python:3-buster
++
++ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin
++
++# Make stdout/stderr unbuffered. This prevents delay between output and cloud.
++# Might not be needed by all apps, but slow ALL of them. test per app/container
++#ENV PYTHONUNBUFFERED "1"
++
++### To prevent the Debian installer from freaking out on configuration of packages
++ENV DEBIAN_FRONTEND noninteractive
++
++# Pinned versions of few oddball dependencies
++ENV SASQUATCH_COMMIT 3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed
++ENV UBIREADER_COMMIT 0955e6b95f07d849a182125919a1f2b6790d5b51
++ENV BINWALK_COMMIT   3154b0012e7dbaf2b20edd5c0a2350ec64009869
++
++COPY . /tmp
++
++WORKDIR /tmp
++
++### Took out the deps.sh from binwalk's installation script, baked in the dependencies into the main prereqs installation
++### The prereqs that dont come from system's repo, are taken care of later
++RUN set -xue \
++    && apt-get update -qy \
++    && apt-get -t buster dist-upgrade -yq --no-install-recommends -o Dpkg::Options::="--force-confold" \
++    && ./deps.sh --yes \
++    && python3 setup.py install && binwalk -h > /dev/null \
++    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
++    && echo "LANG=en_US.UTF-8" >> /etc/default/locale \
++    && echo "LANGUAGE=en_US:en" >> /etc/default/locale \
++    && echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale \
++    && locale-gen \
++    && apt-get -y autoremove \
++    && apt-get -y autoclean \
++    && useradd -m -u 1000 -s /sbin/nologin appuser \
++    && rm -rf -- \
++        /var/lib/apt/lists/* \
++        /tmp/* /var/tmp/* \
++        /usr/src/app/*.whl /usr/src/app/*.tar.gz \
++        /root/.cache/pip \
++        /usr/src/app/repos \
++        /usr/src/app/.git \
++        /usr/src/app/src
++
++
++ENV DEBIAN_FRONTEND teletype
++# Setup locale. This prevents Python 3 IO encoding issues.
++ENV LANG en_US.UTF-8
++ENV LANGUAGE en_US:en
++ENV LC_ALL en_US.UTF-8
++ENV PYTHONUTF8 "1"
++ENV PYTHONHASHSEED "random"
++
++WORKDIR /home/appuser
++USER appuser
++
++# dummy run because it creates some files on first run in home dir
++RUN binwalk -h > /dev/null
++
++ENTRYPOINT ["binwalk"]
+diff --git a/deps.sh b/deps.sh
+index 5321b37..7c0b391 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -41,23 +41,23 @@ APTGETCMD="apt-get"
+ YUMCMD="yum"
+ if [ $distro = "Kali" ]
+ then
+-    APT_CANDIDATES="git build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
++    APT_CANDIDATES="git locales build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
+ elif [ $distro_version = "14" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "15" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "16" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "18" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ else
+-    APT_CANDIDATES="git build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ fi
+-PYTHON3_APT_CANDIDATES="python3-crypto python3-gnupg python3-pip python3-tk"
++PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+ PIP_COMMANDS="pip3"
+@@ -256,9 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
+-install_pip_package setuptools
+-install_pip_package matplotlib
+-install_pip_package capstone
++install_pip_package "setuptools matplotlib capstone crypto gnupg tk"
+ install_sasquatch
+ install_yaffshiv
+ install_jefferson
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch b/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
new file mode 100644
index 000000000..d462bd693
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
@@ -0,0 +1,158 @@
+From 13d48cf64c9de9732e348b02cab1feb564d8305f Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:31:07 -0400
+Subject: [PATCH] implement multi-stage build and test stage, include Docker
+ build in Travis integration testing
+
+---
+ .dockerignore |  6 ++++++
+ .travis.yml   | 28 +++++++++++++++++-------
+ Dockerfile    | 59 ++++++++++++++++++++++-----------------------------
+ 3 files changed, 51 insertions(+), 42 deletions(-)
+
+diff --git a/.dockerignore b/.dockerignore
+index af5c03a..29f7098 100644
+--- a/.dockerignore
++++ b/.dockerignore
+@@ -3,3 +3,9 @@ dist
+ .coverage
+ *.extracted
+ *.pyc
++.editorconfig
++.gitignore
++images
++Dockerfile
++.dockerignore
++.git
+diff --git a/.travis.yml b/.travis.yml
+index d2b068d..8434a4d 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -13,19 +13,31 @@ script: ./setup.py test
+ cache: pip
+ jobs:
+   include:
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.6
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.7
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.8
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.9
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.6
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.7
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.8
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.9
++   - stage: test
++     services: docker
++     install: 
++       - docker build .
+diff --git a/Dockerfile b/Dockerfile
+index 64451fc..7b6629b 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -1,21 +1,12 @@
+-FROM python:3-buster
++FROM python:3-buster AS build-and-install
+ 
+-ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin
+-
+-# Make stdout/stderr unbuffered. This prevents delay between output and cloud.
+-# Might not be needed by all apps, but slow ALL of them. test per app/container
+-#ENV PYTHONUNBUFFERED "1"
+-
+-### To prevent the Debian installer from freaking out on configuration of packages
+-ENV DEBIAN_FRONTEND noninteractive
+-
+-# Pinned versions of few oddball dependencies
+-ENV SASQUATCH_COMMIT 3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed
+-ENV UBIREADER_COMMIT 0955e6b95f07d849a182125919a1f2b6790d5b51
+-ENV BINWALK_COMMIT   3154b0012e7dbaf2b20edd5c0a2350ec64009869
++ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin \
++    DEBIAN_FRONTEND=noninteractive \
++    SASQUATCH_COMMIT=3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed \
++    UBIREADER_COMMIT=0955e6b95f07d849a182125919a1f2b6790d5b51 \
++    BINWALK_COMMIT=3154b0012e7dbaf2b20edd5c0a2350ec64009869
+ 
+ COPY . /tmp
+-
+ WORKDIR /tmp
+ 
+ ### Took out the deps.sh from binwalk's installation script, baked in the dependencies into the main prereqs installation
+@@ -25,36 +16,36 @@ RUN set -xue \
+     && apt-get -t buster dist-upgrade -yq --no-install-recommends -o Dpkg::Options::="--force-confold" \
+     && ./deps.sh --yes \
+     && python3 setup.py install && binwalk -h > /dev/null \
++    && apt-get -yq purge *-dev git build-essential gcc g++ \
++    && apt-get -y autoremove \
++    && apt-get -y autoclean \
+     && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
+     && echo "LANG=en_US.UTF-8" >> /etc/default/locale \
+     && echo "LANGUAGE=en_US:en" >> /etc/default/locale \
+     && echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale \
+-    && locale-gen \
+-    && apt-get -y autoremove \
+-    && apt-get -y autoclean \
+-    && useradd -m -u 1000 -s /sbin/nologin appuser \
++    && locale-gen
++
++FROM build-and-install AS unit-tests
++RUN pip install coverage nose \
++    && python3 setup.py test \
++    && dd if=/dev/urandom of=/tmp/random.bin bs=1M count=1 && binwalk -J -E /tmp/random.bin
++
++FROM build-and-install AS cleanup-and-release
++RUN useradd -m -u 1000 -s /sbin/nologin appuser \
+     && rm -rf -- \
+         /var/lib/apt/lists/* \
+         /tmp/* /var/tmp/* \
+-        /usr/src/app/*.whl /usr/src/app/*.tar.gz \
+-        /root/.cache/pip \
+-        /usr/src/app/repos \
+-        /usr/src/app/.git \
+-        /usr/src/app/src
+-
++        /root/.cache/pip
+ 
+-ENV DEBIAN_FRONTEND teletype
+ # Setup locale. This prevents Python 3 IO encoding issues.
+-ENV LANG en_US.UTF-8
+-ENV LANGUAGE en_US:en
+-ENV LC_ALL en_US.UTF-8
+-ENV PYTHONUTF8 "1"
+-ENV PYTHONHASHSEED "random"
++ENV DEBIAN_FRONTEND=teletype \
++    LANG=en_US.UTF-8 \
++    LANGUAGE=en_US:en \
++    LC_ALL=en_US.UTF-8 \
++    PYTHONUTF8="1" \
++    PYTHONHASHSEED="random"
+ 
+ WORKDIR /home/appuser
+ USER appuser
+ 
+-# dummy run because it creates some files on first run in home dir
+-RUN binwalk -h > /dev/null
+-
+ ENTRYPOINT ["binwalk"]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch b/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
new file mode 100644
index 000000000..e30f605f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
@@ -0,0 +1,50 @@
+From acc41e284c68f3626df2e5285ab5e7fc2ff8c060 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:47:55 -0400
+Subject: [PATCH] fix travis script
+
+---
+ .travis.yml | 9 +++++----
+ Dockerfile  | 5 +----
+ 2 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 8434a4d..7c74cc7 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -13,6 +13,11 @@ script: ./setup.py test
+ cache: pip
+ jobs:
+   include:
++   - stage: test
++     services: docker
++     install: 
++       - docker build .
++     script: no
+    - stage: test
+      dist: bionic
+      python: 3.6
+@@ -37,7 +42,3 @@ jobs:
+    - stage: test
+      dist: focal
+      python: 3.9
+-   - stage: test
+-     services: docker
+-     install: 
+-       - docker build .
+diff --git a/Dockerfile b/Dockerfile
+index 7b6629b..056b0a0 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -1,10 +1,7 @@
+ FROM python:3-buster AS build-and-install
+ 
+ ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin \
+-    DEBIAN_FRONTEND=noninteractive \
+-    SASQUATCH_COMMIT=3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed \
+-    UBIREADER_COMMIT=0955e6b95f07d849a182125919a1f2b6790d5b51 \
+-    BINWALK_COMMIT=3154b0012e7dbaf2b20edd5c0a2350ec64009869
++    DEBIAN_FRONTEND=noninteractive
+ 
+ COPY . /tmp
+ WORKDIR /tmp
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch b/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
new file mode 100644
index 000000000..ee539ff6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
@@ -0,0 +1,25 @@
+From 6e185f1809b09db81b967a85a87a7aaae2bdc8d5 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:54:40 -0400
+Subject: [PATCH] still no love for travis
+
+---
+ .travis.yml | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 7c74cc7..90f3cfa 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -15,9 +15,8 @@ jobs:
+   include:
+    - stage: test
+      services: docker
+-     install: 
+-       - docker build .
+-     script: no
++     install: echo "No install for this job"
++     script: docker build .
+    - stage: test
+      dist: bionic
+      python: 3.6
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch b/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
new file mode 100644
index 000000000..0a2061a27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
@@ -0,0 +1,22 @@
+From 9f0cba6790292c3c863b30cedad81a059d7b7737 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Tue, 16 Mar 2021 00:14:00 -0400
+Subject: [PATCH] transition to use of cryptodome since pycrypto is EOL
+
+---
+ deps.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps.sh b/deps.sh
+index 7c0b391..9595660 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -256,7 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
+-install_pip_package "setuptools matplotlib capstone crypto gnupg tk"
++install_pip_package "setuptools matplotlib capstone pycryptodome gnupg tk"
+ install_sasquatch
+ install_yaffshiv
+ install_jefferson
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch b/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
new file mode 100644
index 000000000..c063ac5e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
@@ -0,0 +1,23 @@
+From 94f5934b445d6571defdd622ef93c40a1976b26f Mon Sep 17 00:00:00 2001
+From: owl <owl129@126.com>
+Date: Tue, 16 Mar 2021 17:41:09 +0800
+Subject: [PATCH] Call 'unzip' with empty password, to avoid 'unzip' stuck in
+ interactive mode when process encrypt files
+
+---
+ src/binwalk/config/extract.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/binwalk/config/extract.conf b/src/binwalk/config/extract.conf
+index 1b24f06..5b54f72 100644
+--- a/src/binwalk/config/extract.conf
++++ b/src/binwalk/config/extract.conf
+@@ -52,7 +52,7 @@
+ # 7z handles most zip files, but fails on some zip archives, inexplicably seeing
+ # only the *last* entry in the zip archive (though 7z thinks it succeeded). See
+ # StarCam firmware CH-sys-48.53.64.67.zip.
+-^zip archive data:zip:unzip -o '%e':0
++^zip archive data:zip:unzip -P '' -o '%e':0
+ ^zip archive data:zip:jar xvf '%e':0
+ ^zip archive data:zip:7z x -y '%e' -p '':0,1
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch b/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
new file mode 100644
index 000000000..521f6b4a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
@@ -0,0 +1,24 @@
+From e3142e37564f14f98823b56fa40ea35314099756 Mon Sep 17 00:00:00 2001
+From: Christian Clauss <cclauss@me.com>
+Date: Tue, 16 Mar 2021 19:19:33 +0100
+Subject: [PATCH] Ubuntu Focal is Python 3 by default
+
+https://wiki.ubuntu.com/FocalFossa/ReleaseNotes#Python3_by_default
+Several other distros as well.
+---
+ README.md | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/README.md b/README.md
+index c2074cb..55190b7 100644
+--- a/README.md
++++ b/README.md
+@@ -9,7 +9,7 @@ Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extr
+ 
+ ### *** Python 2.7 Deprecation Notice ***
+ 
+-Even though every major Linux distro is still shipping python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively into python3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
++Even though many major Linux distros are still shipping Python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively to Python 3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
+ 
+ ### Installation and Usage
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch b/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
new file mode 100644
index 000000000..9b1428e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
@@ -0,0 +1,51 @@
+From 1a503e8ce57bbf3448be07d45b3cf692a449e62e Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 17:38:31 -0400
+Subject: [PATCH] fail deps.sh if any install command fails
+
+---
+ .gitignore | 1 +
+ deps.sh    | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/.gitignore b/.gitignore
+index af5c03a..b2e167e 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -3,3 +3,4 @@ dist
+ .coverage
+ *.extracted
+ *.pyc
++**/*.egg-info
+\ No newline at end of file
+diff --git a/deps.sh b/deps.sh
+index 9595660..5072c70 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -8,7 +8,9 @@ else
+     YES=0
+ fi
+ 
++set -eu
+ set -o nounset
++set -x
+ 
+ if ! which lsb_release > /dev/null
+ then
+@@ -65,6 +67,7 @@ PIP_COMMANDS="pip3"
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+ then
++    echo "UID is 0, sudo not required"
+     SUDO=""
+ else
+     SUDO="sudo"
+@@ -80,7 +83,7 @@ function install_yaffshiv
+ 
+ function install_sasquatch
+ {
+-    git clone https://github.com/devttys0/sasquatch
++    git clone --quiet --depth 1 --branch "patch-1" https://github.com/eacmen/sasquatch
+     (cd sasquatch && $SUDO ./build.sh)
+     $SUDO rm -rf sasquatch
+ }
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch b/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
new file mode 100644
index 000000000..c6af6968d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
@@ -0,0 +1,63 @@
+From 2480d27373266d9591587cec5f373e0c9cd947fd Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:19:50 -0400
+Subject: [PATCH] we no longer need to bifurcate python3 and python2 deps
+
+---
+ .travis.yml |  1 +
+ deps.sh     | 16 ++--------------
+ 2 files changed, 3 insertions(+), 14 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 90f3cfa..4efe049 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -2,6 +2,7 @@ os: linux
+ dist: bionic
+ language: python
+ arch: amd64
++sudo: true
+ addons:
+   apt:
+     update: true
+diff --git a/deps.sh b/deps.sh
+index 5072c70..03df74b 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,7 +62,7 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PIP_COMMANDS="pip3"
++PIP_COMMANDS="pip"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -134,11 +134,7 @@ function install_ubireader
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-
+-    for PIP_COMMAND in $PIP_COMMANDS
+-    do
+-        $SUDO $PIP_COMMAND install $PACKAGE
+-    done
++    $SUDO pip install $PACKAGE
+ }
+ 
+ function find_path
+@@ -243,14 +239,6 @@ then
+     exit 1
+ fi
+ 
+-# Check to see if we should install modules for python3 as well
+-find_path python3
+-if [ $? -eq 0 ]
+-then
+-     PKG_CANDIDATES="$PKG_CANDIDATES $PKG_PYTHON3_CANDIDATES"
+-     PIP_COMMANDS="pip3 $PIP_COMMANDS"
+-fi
+-
+ # Do the install(s)
+ cd /tmp
+ $SUDO $PKGCMD $PKGCMD_OPTS $PKG_CANDIDATES
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch b/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
new file mode 100644
index 000000000..27f749b82
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
@@ -0,0 +1,44 @@
+From e9ee7eb18e57b8c007695a7f0f22ed6e298313ff Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:40:43 -0400
+Subject: [PATCH] using pip3 is causing issues, use whatever pip the user has
+ in their environment
+
+---
+ .travis.yml | 1 -
+ deps.sh     | 3 +--
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 4efe049..90f3cfa 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -2,7 +2,6 @@ os: linux
+ dist: bionic
+ language: python
+ arch: amd64
+-sudo: true
+ addons:
+   apt:
+     update: true
+diff --git a/deps.sh b/deps.sh
+index 03df74b..230b8cc 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,7 +62,6 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PIP_COMMANDS="pip"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -91,7 +90,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO pip install -r requirements.txt && $SUDO python3 setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch b/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
new file mode 100644
index 000000000..160c93325
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
@@ -0,0 +1,23 @@
+From 68ed04375509d3d1194f770636cacbb26597f747 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:51:57 -0400
+Subject: [PATCH] Travis-CI does not preserve the specified python when
+ invoking sudo
+
+---
+ deps.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps.sh b/deps.sh
+index 230b8cc..8a267b1 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -69,7 +69,7 @@ then
+     echo "UID is 0, sudo not required"
+     SUDO=""
+ else
+-    SUDO="sudo"
++    SUDO="sudo -E"
+     REQUIRED_UTILS="sudo $REQUIRED_UTILS"
+ fi
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch b/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
new file mode 100644
index 000000000..3dce74cf3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
@@ -0,0 +1,31 @@
+From cea511762d429af0678d8a72d5b2bd7f88a8b112 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:55:26 -0400
+Subject: [PATCH] there is no rhyme or reason to travis
+
+---
+ deps.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index 8a267b1..339d66a 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -90,7 +90,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
+@@ -133,7 +133,7 @@ function install_ubireader
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-    $SUDO pip install $PACKAGE
++    $SUDO pip3 install $PACKAGE
+ }
+ 
+ function find_path
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch b/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
new file mode 100644
index 000000000..2e4f948da
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
@@ -0,0 +1,56 @@
+From 607de90eadcfde9798f3c99ba6fcfc243b24f661 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 19:05:02 -0400
+Subject: [PATCH] try to preserve the python being used across sudo
+
+---
+ deps.sh | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index 339d66a..f44d410 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,6 +62,7 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
++PYTHON="$(which python3)"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -76,7 +77,7 @@ fi
+ function install_yaffshiv
+ {
+     git clone https://github.com/devttys0/yaffshiv
+-    (cd yaffshiv && $SUDO python3 setup.py install)
++    (cd yaffshiv && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+@@ -90,7 +91,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO $PYTHON -mpip install -r requirements.txt && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
+@@ -126,14 +127,14 @@ function install_cramfstools
+ function install_ubireader
+ {
+     git clone https://github.com/jrspruitt/ubi_reader
+-    (cd ubi_reader && $SUDO python3 setup.py install)
++    (cd ubi_reader && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
+ 
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-    $SUDO pip3 install $PACKAGE
++    $SUDO $PYTHON -mpip install $PACKAGE
+ }
+ 
+ function find_path
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch b/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
new file mode 100644
index 000000000..240a4a27b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
@@ -0,0 +1,31 @@
+From fefa77456c6152af4ea6a218471ba2abc006fc44 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 19:10:41 -0400
+Subject: [PATCH] nop
+
+---
+ .travis.yml | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 90f3cfa..8b7410a 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -6,11 +6,13 @@ addons:
+   apt:
+     update: true
+ install:
++  - export PYTHON=$(which python3)
+   - ./deps.sh --yes
+-  - pip install coverage
+-  - ./setup.py install
+-script: ./setup.py test
+-cache: pip
++  - sudo -E $PYTHON -mpip install coverage
++  - sudo -E $PYTHON ./setup.py install
++script:
++  - export PYTHON=$(which python3)
++  - sudo -E $PYTHON ./setup.py test
+ jobs:
+   include:
+    - stage: test
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch b/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
new file mode 100644
index 000000000..5a17a9f18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
@@ -0,0 +1,56 @@
+From a80d8d7c06bcefc8833caf85259d2ff0e23027ac Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 21:28:37 -0400
+Subject: [PATCH] sasquatch patch was merged
+
+---
+ deps.sh | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index f44d410..cbd821c 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -76,21 +76,21 @@ fi
+ 
+ function install_yaffshiv
+ {
+-    git clone https://github.com/devttys0/yaffshiv
++    git clone --quiet --depth 1 --branch "master" https://github.com/devttys0/yaffshiv
+     (cd yaffshiv && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+ function install_sasquatch
+ {
+-    git clone --quiet --depth 1 --branch "patch-1" https://github.com/eacmen/sasquatch
++    git clone --quiet --depth 1 --branch "master" https://github.com/devttys0/sasquatch
+     (cd sasquatch && $SUDO ./build.sh)
+     $SUDO rm -rf sasquatch
+ }
+ 
+ function install_jefferson
+ {
+-    git clone https://github.com/sviehb/jefferson
++    git clone --quiet --depth 1 --branch "master" https://github.com/sviehb/jefferson
+     (cd jefferson && $SUDO $PYTHON -mpip install -r requirements.txt && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf jefferson
+ }
+@@ -113,7 +113,7 @@ function install_cramfstools
+   INSTALL_LOCATION=/usr/local/bin
+ 
+   # https://github.com/torvalds/linux/blob/master/fs/cramfs/README#L106
+-  git clone https://github.com/npitre/cramfs-tools
++  git clone --quiet --depth 1 --branch "master" https://github.com/npitre/cramfs-tools
+   # There is no "make install"
+   (cd cramfs-tools \
+   && make \
+@@ -126,7 +126,7 @@ function install_cramfstools
+ 
+ function install_ubireader
+ {
+-    git clone https://github.com/jrspruitt/ubi_reader
++    git clone --quiet --depth 1 --branch "master" https://github.com/jrspruitt/ubi_reader
+     (cd ubi_reader && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch b/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
new file mode 100644
index 000000000..778ed04c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
@@ -0,0 +1,27 @@
+From 0b75c20c9e34d478538a8903f827be6932de6e71 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Sun, 28 Mar 2021 22:22:31 -0400
+Subject: [PATCH] add third party NOTICE markdown
+
+---
+ NOTICE.md | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+ create mode 100644 NOTICE.md
+
+diff --git a/NOTICE.md b/NOTICE.md
+new file mode 100644
+index 0000000..4602d9e
+--- /dev/null
++++ b/NOTICE.md
+@@ -0,0 +1,11 @@
++# File with code "borrowed from" the Python programming language
++
++
++Copyright (c) 2002 Lars Gustaebel <lars@gustaebel.de>
++All rights reserved.
++
++Permission  is  hereby granted,  free  of charge,  to  any person obtaining a  copy of  this software  and associated documentation files  (the  "Software"),  to   deal  in  the  Software   without restriction,  including  without limitation  the  rights to  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies  of  the  Software,  and to  permit  persons  to  whom the Software  is  furnished  to  do  so,  subject  to  the  following conditions:
++
++The above copyright  notice and this  permission notice shall  be included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS  IS", WITHOUT WARRANTY OF ANY  KIND, EXPRESS OR IMPLIED, INCLUDING  BUT NOT LIMITED TO  THE WARRANTIES OF  MERCHANTABILITY,  FITNESS   FOR  A  PARTICULAR   PURPOSE  AND NONINFRINGEMENT.  IN  NO  EVENT SHALL  THE  AUTHORS  OR COPYRIGHT HOLDERS  BE LIABLE  FOR ANY  CLAIM, DAMAGES  OR OTHER  LIABILITY, WHETHER  IN AN  ACTION OF  CONTRACT, TORT  OR OTHERWISE,  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch b/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
new file mode 100644
index 000000000..977664127
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
@@ -0,0 +1,220 @@
+From 8126fe51336ab2e7068a060e4307595a75d385dd Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 18 Jun 2021 04:20:59 -0700
+Subject: [PATCH] Removed sensitive keys
+
+---
+ src/binwalk/plugins/pgp.py | 204 -------------------------------------
+ 1 file changed, 204 deletions(-)
+ delete mode 100644 src/binwalk/plugins/pgp.py
+
+diff --git a/src/binwalk/plugins/pgp.py b/src/binwalk/plugins/pgp.py
+deleted file mode 100644
+index f38ee2f..0000000
+--- a/src/binwalk/plugins/pgp.py
++++ /dev/null
+@@ -1,204 +0,0 @@
+-#!/usr/bin/env python
+-
+-import errno
+-import shutil
+-import tempfile
+-import binwalk.core.plugin
+-import binwalk.core.compat
+-import binwalk.core.common
+-try:
+-    # Requires the python-gnupg library
+-    from gnupg import GPG
+-except ImportError as e:
+-    GPG = None
+-
+-
+-class PgpDecryptor(binwalk.core.plugin.Plugin):
+-
+-    '''
+-    Plugin to decrypt, validate, and extract PGP encrypted firmware.
+-    '''
+-    MODULES = ["Signature"]
+-
+-    EDDA2E82EDC7030C_KEY = """-----BEGIN PGP PRIVATE KEY BLOCK-----
+-
+-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
+-=c6nn
+------END PGP PRIVATE KEY BLOCK-----"""
+-
+-    F18B47DF3F881C75_KEY = """-----BEGIN PGP PRIVATE KEY BLOCK-----
+-
+-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
+-=UtFV
+------END PGP PRIVATE KEY BLOCK-----"""
+-
+-    EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION = "PGP RSA encrypted session key - keyid: EDDA2E82 EDC7030C RSA".lower()
+-
+-    F18B47DF3F881C75_SIGNATURE_DESCRIPTION = "PGP RSA encrypted session key - keyid: F18B47DF 3F881C75 RSA".lower()
+-
+-    def init(self):
+-        if GPG is None:
+-            self.enabled = False
+-        else:
+-            self.enabled = True
+-
+-        if self.enabled is True and self.module.extractor.enabled is True:
+-            # Add extraction rules for encrypted PGP firmware signature
+-            # results
+-            self.module.extractor.add_rule(txtrule=None,
+-                regex="^%s" % self.EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION,
+-                extension="gpg",
+-                cmd=self._decrypt_and_extract_EDDA2E82EDC7030C)
+-            self.module.extractor.add_rule(txtrule=None,
+-                regex="^%s" % self.F18B47DF3F881C75_SIGNATURE_DESCRIPTION,
+-                extension="gpg",
+-                cmd=self._decrypt_and_extract_F18B47DF3F881C75)
+-
+-    def _decrypt_and_extract_EDDA2E82EDC7030C(self, fname):
+-        return self._decrypt_and_extract(fname, self.EDDA2E82EDC7030C_KEY)
+-
+-    def _decrypt_and_extract_F18B47DF3F881C75(self, fname):
+-        return self._decrypt_and_extract(fname, self.F18B47DF3F881C75_KEY)
+-
+-    def _decrypt_and_extract(self, fname, key):
+-        '''
+-        This does the extraction (e.g., it decrypts the image and writes it to a new file on disk).
+-        '''
+-        with open(fname, "rb") as fp_in:
+-            encrypted_data = fp_in.read()
+-
+-            decrypted_data = self._pgp_decrypt(encrypted_data, key)
+-
+-            with open(binwalk.core.common.unique_file_name(fname[:-4], "dec"), "wb") as fp_out:
+-                fp_out.write(decrypted_data)
+-        return True
+-
+-    def _pgp_decrypt(self, encrypted_firmware, key):
+-        '''
+-        This does the actual decryption.
+-        '''
+-        try:
+-            tmp_dir = tempfile.mkdtemp()
+-            gpg = GPG(gnupghome=tmp_dir)
+-            gpg.import_keys(key)
+-            decrypted_data = gpg.decrypt(encrypted_firmware)
+-        finally:
+-            try:
+-                shutil.rmtree(tmp_dir)
+-            except OSError as exc:
+-                if exc.errno != errno.ENOENT:
+-                    raise
+-
+-        return bytes(decrypted_data.data)
+-
+-    def scan(self, result):
+-        '''
+-        Validate signature results.
+-        '''
+-        if result.valid is True:
+-            if result.description.lower().startswith(self.EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION) is True:
+-                result.description += ", Verizon BHR4 <eu@greenwavereality.com>"
+-            elif result.description.lower().startswith(self.F18B47DF3F881C75_SIGNATURE_DESCRIPTION) is True:
+-                result.description += ", Verizon BHR4 <eu@greenwavesystems.com>"
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch b/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
new file mode 100644
index 000000000..ecb34e8de
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
@@ -0,0 +1,124 @@
+From ab45eaac867ee2d9c7eafb7175bdf60a5b958f1c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 9 Aug 2021 05:52:04 -0700
+Subject: [PATCH] Removed hilink decryption plugin; contains priprietary crypto
+ key(s).
+
+---
+ src/binwalk/config/extract.conf |  1 -
+ src/binwalk/plugins/hilink.py   | 94 ---------------------------------
+ 2 files changed, 95 deletions(-)
+ delete mode 100644 src/binwalk/plugins/hilink.py
+
+diff --git a/src/binwalk/config/extract.conf b/src/binwalk/config/extract.conf
+index 5b54f72..f64ba34 100644
+--- a/src/binwalk/config/extract.conf
++++ b/src/binwalk/config/extract.conf
+@@ -14,7 +14,6 @@
+ #   o zlib
+ #   o cpio
+ #   o Raw LZMA/deflate streams
+-#   o Hilink encrypted uImage firmware
+ #   o D-Link "ROMFSv9.0" file systems
+ #
+ # There are also alternative extractors for the following file formats, implemented as plugins:
+diff --git a/src/binwalk/plugins/hilink.py b/src/binwalk/plugins/hilink.py
+deleted file mode 100644
+index 581a530..0000000
+--- a/src/binwalk/plugins/hilink.py
++++ /dev/null
+@@ -1,94 +0,0 @@
+-#!/usr/bin/env python
+-
+-import struct
+-import string
+-import binwalk.core.plugin
+-import binwalk.core.compat
+-import binwalk.core.common
+-try:
+-    # Requires the pycrypto library
+-    from Crypto.Cipher import DES
+-except ImportError as e:
+-    DES = None
+-
+-
+-class HilinkDecryptor(binwalk.core.plugin.Plugin):
+-
+-    '''
+-    Plugin to decrypt, validate, and extract Hilink encrypted firmware.
+-    '''
+-    MODULES = ["Signature"]
+-
+-    DES_KEY = "H@L9K*(3"
+-    SIGNATURE_DESCRIPTION = "Encrypted Hilink uImage firmware".lower()
+-
+-    def init(self):
+-        if DES is None:
+-            self.enabled = False
+-        else:
+-            self.enabled = True
+-
+-        if self.enabled is True and self.module.extractor.enabled is True:
+-            # Add an extraction rule for encrypted Hilink firmware signature
+-            # results
+-            self.module.extractor.add_rule(regex="^%s" % self.SIGNATURE_DESCRIPTION,
+-                extension="enc",
+-                cmd=self._decrypt_and_extract)
+-
+-    def _decrypt_and_extract(self, fname):
+-        '''
+-        This does the extraction (e.g., it decrypts the image and writes it to a new file on disk).
+-        '''
+-        with open(fname, "r") as fp_in:
+-            encrypted_data = fp_in.read()
+-
+-            decrypted_data = self._hilink_decrypt(encrypted_data)
+-
+-            with open(binwalk.core.common.unique_file_name(fname[:-4], "dec"), "w") as fp_out:
+-                fp_out.write(decrypted_data)
+-
+-    def _hilink_decrypt(self, encrypted_firmware):
+-        '''
+-        This does the actual decryption.
+-        '''
+-        cipher = DES.new(self.DES_KEY, DES.MODE_ECB)
+-
+-        p1 = encrypted_firmware[0:3]
+-        p2 = encrypted_firmware[3:]
+-        p2 += b"\x00" * (8 - (len(p2) % 8))
+-
+-        d1 = p1 + cipher.decrypt(p2)
+-        d1 += b"\x00" * (8 - (len(d1) % 8))
+-
+-        return cipher.decrypt(d1)
+-
+-    def scan(self, result):
+-        '''
+-        Validate signature results.
+-        '''
+-        if self.enabled is True:
+-            if result.valid is True:
+-                if result.description.lower().startswith(self.SIGNATURE_DESCRIPTION) is True:
+-                    # Read in the first 64 bytes of the suspected encrypted
+-                    # uImage header
+-                    fd = self.module.config.open_file(result.file.path, offset=result.offset)
+-                    encrypted_header_data = binwalk.core.compat.str2bytes(fd.read(64))
+-                    fd.close()
+-
+-                    # Decrypt the header
+-                    decrypted_header_data = self._hilink_decrypt(encrypted_header_data)
+-
+-                    # Pull out the image size and image name fields from the decrypted uImage header
+-                    # and add them to the printed description.
+-                    result.size = struct.unpack(b">L", decrypted_header_data[12:16])[0]
+-                    result.description += ", size: %d" % (result.size)
+-                    # NOTE: The description field should be 32 bytes? Hilink seems to use only 24 bytes for this field,
+-                    #       even though the header size is still 64 bytes?
+-                    result.description += ', image name: "%s"' % binwalk.core.compat.bytes2str(decrypted_header_data[32:56]).strip("\x00")
+-
+-                    # Do some basic validation on the decrypted size and image
+-                    # name fields
+-                    if result.size > (result.file.size - result.offset):
+-                        result.valid = False
+-                    if not all(c in string.printable for c in result.description):
+-                        result.valid = False
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch b/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
new file mode 100644
index 000000000..62ac19412
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
@@ -0,0 +1,22 @@
+From 5d6124fc533f82b7b1e35b898e6891334421983e Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 16 Aug 2021 06:56:07 -0700
+Subject: [PATCH] Updated version number for release
+
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index b747b4d..9b9f6cd 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@ except ImportError:
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+-MODULE_VERSION = "2.2.1"
++MODULE_VERSION = "2.3.2"
+ SCRIPT_NAME = MODULE_NAME
+ MODULE_DIRECTORY = os.path.dirname(os.path.realpath(__file__))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch b/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
new file mode 100644
index 000000000..712f603f7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
@@ -0,0 +1,97 @@
+From 9c73e26826f55337650d3aeb82fcde98bd2a0e0f Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Wed, 1 Sep 2021 07:10:37 -0700
+Subject: [PATCH] Initial low-priv execution implementation
+
+---
+ src/binwalk/modules/extractor.py | 34 ++++++++++++++++++++++++++++----
+ 1 file changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 6194f5c..346f0fb 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -4,6 +4,7 @@
+ 
+ import os
+ import re
++import pwd
+ import stat
+ import shlex
+ import tempfile
+@@ -47,6 +48,9 @@ class Extractor(Module):
+     # squashfs-root-0).
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
++    # Unprivileged user account to execute external extraction utilities
++    UNPRIVILEGED_USER_NAME = 'binwalksafe'
++
+     TITLE = 'Extraction'
+     ORDER = 9
+     PRIMARY = False
+@@ -121,6 +125,10 @@ class Extractor(Module):
+     ]
+ 
+     def load(self):
++        user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
++        self.unpriv_uid = user_info.pw_uid
++        self.unpriv_gid = user_info.pw_gid
++
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+         self.extract_rules = []
+@@ -534,6 +542,9 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
++        # Make sure unpriv user can access this directory
++        os.chown(output_directory, self.unpriv_uid, self.unpriv_gid)
++
+         return output_directory
+ 
+     def cleanup_extracted_files(self, tf=None):
+@@ -826,6 +837,9 @@ class Extractor(Module):
+             # Cleanup
+             fdout.close()
+             fdin.close()
++
++            # Make sure unprivileged user can access this file
++            os.chown(fname, self.unpriv_uid, self.unpriv_gid)
+         except KeyboardInterrupt as e:
+             raise e
+         except Exception as e:
+@@ -873,8 +887,7 @@ class Extractor(Module):
+                 # Generate unique file paths for all paths in the current
+                 # command that are surrounded by UNIQUE_PATH_DELIMITER
+                 while self.UNIQUE_PATH_DELIMITER in cmd:
+-                    need_unique_path = cmd.split(self.UNIQUE_PATH_DELIMITER)[
+-                        1].split(self.UNIQUE_PATH_DELIMITER)[0]
++                    need_unique_path = cmd.split(self.UNIQUE_PATH_DELIMITER)[1].split(self.UNIQUE_PATH_DELIMITER)[0]
+                     unique_path = binwalk.core.common.unique_file_name(need_unique_path)
+                     cmd = cmd.replace(self.UNIQUE_PATH_DELIMITER + need_unique_path + self.UNIQUE_PATH_DELIMITER, unique_path)
+ 
+@@ -885,9 +898,22 @@ class Extractor(Module):
+                     # command with fname
+                     command = command.strip().replace(self.FILE_NAME_PLACEHOLDER, fname)
+ 
+-                    binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+-                    rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++                    # Fork a child to drop privs
++                    child_pid = os.fork()
++                    if child_pid is 0:
++                        # Switch to unprivileged user
++                        binwalk.core.common.debug("Dropping privileges to user '%s'" % self.UNPRIVILEGED_USER_NAME)
++                        os.setgid(self.unpriv_uid)
++                        os.setuid(self.unpriv_gid)
++
++                        # Execute external extractor
++                        binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
++                        rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++                        sys.exit(rval)
++                    else:
++                        rval = os.wait()
+ 
++                    # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+                     else:
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch b/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
new file mode 100644
index 000000000..a3b14d0ef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
@@ -0,0 +1,152 @@
+From 568457d330af625804da28f01716d52d54994b9d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Wed, 1 Sep 2021 08:51:09 -0700
+Subject: [PATCH] Added option to turn off privilege dropping
+
+---
+ src/binwalk/modules/extractor.py | 82 +++++++++++++++++++++-----------
+ 1 file changed, 54 insertions(+), 28 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 346f0fb..361b041 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -11,6 +11,7 @@ import tempfile
+ import subprocess
+ import binwalk.core.common
+ from binwalk.core.compat import *
++from binwalk.core.exceptions import ModuleException
+ from binwalk.core.module import Module, Option, Kwarg
+ from binwalk.core.common import file_size, file_md5, unique_file_name, BlockFile
+ 
+@@ -49,7 +50,7 @@ class Extractor(Module):
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
+     # Unprivileged user account to execute external extraction utilities
+-    UNPRIVILEGED_USER_NAME = 'binwalksafe'
++    UNPRIVILEGED_USER_NAME = 'binwalk_safe_user_69'
+ 
+     TITLE = 'Extraction'
+     ORDER = 9
+@@ -108,6 +109,10 @@ class Extractor(Module):
+                long='subdirs',
+                kwargs={'extract_into_subdirs': True},
+                description="Extract into sub-directories named by the offset"),
++        Option(short='0',
++               long='unsafe',
++               kwargs={'unsafe_extraction': True},
++               description="Execute external extractions without dropping privileges"),
+     ]
+ 
+     KWARGS = [
+@@ -122,12 +127,25 @@ class Extractor(Module):
+         Kwarg(name='manual_rules', default=[]),
+         Kwarg(name='matryoshka', default=0),
+         Kwarg(name='enabled', default=False),
++        Kwarg(name='unsafe_extraction', default=False),
+     ]
+ 
+     def load(self):
+-        user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
+-        self.unpriv_uid = user_info.pw_uid
+-        self.unpriv_gid = user_info.pw_gid
++        self.unpriv_uid = None
++        self.unpriv_gid = None
++
++        if self.enabled is True and self.unsafe_extraction is False:
++            if os.getuid() != 0:
++                raise ModuleException("Binwalk requires root privileges to safely execute external extraction utilities as an unprivileged user.")
++
++            self.shell_call('useradd %s' % self.UNPRIVILEGED_USER_NAME)
++
++            user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
++            self.unpriv_uid = user_info.pw_uid
++            self.unpriv_gid = user_info.pw_gid
++        else:
++            self.unpriv_uid = os.getuid()
++            self.unpriv_gid = os.getgid()
+ 
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+@@ -860,7 +878,6 @@ class Extractor(Module):
+ 
+         Returns True on success, False on failure, or None if the external extraction utility could not be found.
+         '''
+-        tmp = None
+         rval = 0
+         retval = True
+         command_list = []
+@@ -879,11 +896,6 @@ class Extractor(Module):
+                     retval = False
+                     binwalk.core.common.warning("Internal extractor '%s' failed with exception: '%s'" % (str(cmd), str(e)))
+             elif cmd:
+-                # If not in debug mode, create a temporary file to redirect
+-                # stdout and stderr to
+-                if not binwalk.core.common.DEBUG:
+-                    tmp = tempfile.TemporaryFile()
+-
+                 # Generate unique file paths for all paths in the current
+                 # command that are surrounded by UNIQUE_PATH_DELIMITER
+                 while self.UNIQUE_PATH_DELIMITER in cmd:
+@@ -898,21 +910,9 @@ class Extractor(Module):
+                     # command with fname
+                     command = command.strip().replace(self.FILE_NAME_PLACEHOLDER, fname)
+ 
+-                    # Fork a child to drop privs
+-                    child_pid = os.fork()
+-                    if child_pid is 0:
+-                        # Switch to unprivileged user
+-                        binwalk.core.common.debug("Dropping privileges to user '%s'" % self.UNPRIVILEGED_USER_NAME)
+-                        os.setgid(self.unpriv_uid)
+-                        os.setuid(self.unpriv_gid)
+-
+-                        # Execute external extractor
+-                        binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+-                        rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+-                        sys.exit(rval)
+-                    else:
+-                        rval = os.wait()
+-
++                    # Execute external extractor
++                    rval = self.shell_call(command)
++                    
+                     # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+@@ -935,7 +935,33 @@ class Extractor(Module):
+             binwalk.core.common.warning("Extractor.execute failed to run external extractor '%s': %s, '%s' might not be installed correctly" % (str(cmd), str(e), str(cmd)))
+             retval = None
+ 
+-        if tmp is not None:
+-            tmp.close()
+-
+         return (retval, '&&'.join(command_list))
++
++    def shell_call(self, command):
++        # Fork a child to drop privs
++        child_pid = os.fork()
++        if child_pid is 0:
++            # Switch to unprivileged user, if one has been set
++            if self.unpriv_uid is not None and self.unpriv_gid is not None:
++                binwalk.core.common.debug("Dropping privileges to %d:%d" % (self.unpriv_uid, self.unpriv_gid))
++                os.setgid(self.unpriv_uid)
++                os.setuid(self.unpriv_gid)
++
++            # If not in debug mode, create a temporary file to redirect
++            # stdout and stderr to
++            if not binwalk.core.common.DEBUG:
++                tmp = tempfile.TemporaryFile()
++            else:
++                tmp = None
++
++            # Execute command
++            binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
++            rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++
++            # Clean up temp file
++            if tmp is not None:
++                tmp.close()
++
++            sys.exit(rval)
++        else:
++            return os.wait()[1]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch b/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
new file mode 100644
index 000000000..14df0397f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
@@ -0,0 +1,139 @@
+From c34f1932702fd16f39aa0f0b2156848d3e297ae5 Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 3 Sep 2021 09:03:34 -0700
+Subject: [PATCH] Added option for specifying a user to run external extraction
+ utilties as
+
+---
+ src/binwalk/modules/extractor.py | 70 +++++++++++++++-----------------
+ 1 file changed, 32 insertions(+), 38 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 361b041..da96b78 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -92,6 +92,11 @@ class Extractor(Module):
+                type=int,
+                kwargs={'max_count': 0},
+                description='Limit the number of extracted files'),
++        Option(short='0',
++               long='run-as',
++               type=str,
++               kwargs={'runas_user': 0},
++               description="Execute external extraction utilities with the specified user's privileges"),
+         #Option(short='u',
+         #       long='limit',
+         #       type=int,
+@@ -109,10 +114,6 @@ class Extractor(Module):
+                long='subdirs',
+                kwargs={'extract_into_subdirs': True},
+                description="Extract into sub-directories named by the offset"),
+-        Option(short='0',
+-               long='unsafe',
+-               kwargs={'unsafe_extraction': True},
+-               description="Execute external extractions without dropping privileges"),
+     ]
+ 
+     KWARGS = [
+@@ -127,25 +128,24 @@ class Extractor(Module):
+         Kwarg(name='manual_rules', default=[]),
+         Kwarg(name='matryoshka', default=0),
+         Kwarg(name='enabled', default=False),
+-        Kwarg(name='unsafe_extraction', default=False),
++        Kwarg(name='runas_user', default=None),
+     ]
+ 
+     def load(self):
+-        self.unpriv_uid = None
+-        self.unpriv_gid = None
+-
+-        if self.enabled is True and self.unsafe_extraction is False:
+-            if os.getuid() != 0:
+-                raise ModuleException("Binwalk requires root privileges to safely execute external extraction utilities as an unprivileged user.")
+-
+-            self.shell_call('useradd %s' % self.UNPRIVILEGED_USER_NAME)
+-
+-            user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
+-            self.unpriv_uid = user_info.pw_uid
+-            self.unpriv_gid = user_info.pw_gid
+-        else:
+-            self.unpriv_uid = os.getuid()
+-            self.unpriv_gid = os.getgid()
++        self.runas_uid = None
++        self.runas_gid = None
++
++        if self.enabled is True:
++            if self.runas_user is None:
++                if os.getuid() == 0:
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=<user name>.")
++            
++                self.runas_uid = os.getuid()
++                self.runas_gid = os.getgid()
++            else:
++                user_info = pwd.getpwnam(self.runas_user)
++                self.runas_uid = user_info.pw_uid
++                self.runas_gid = user_info.pw_gid
+ 
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+@@ -560,8 +560,8 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
+-        # Make sure unpriv user can access this directory
+-        os.chown(output_directory, self.unpriv_uid, self.unpriv_gid)
++        # Make sure runas user can access this directory
++        os.chown(output_directory, self.runas_uid, self.runas_gid)
+ 
+         return output_directory
+ 
+@@ -856,8 +856,8 @@ class Extractor(Module):
+             fdout.close()
+             fdin.close()
+ 
+-            # Make sure unprivileged user can access this file
+-            os.chown(fname, self.unpriv_uid, self.unpriv_gid)
++            # Make sure runasileged user can access this file
++            os.chown(fname, self.runas_uid, self.runas_gid)
+         except KeyboardInterrupt as e:
+             raise e
+         except Exception as e:
+@@ -938,19 +938,17 @@ class Extractor(Module):
+         return (retval, '&&'.join(command_list))
+ 
+     def shell_call(self, command):
+-        # Fork a child to drop privs
+         child_pid = os.fork()
+         if child_pid is 0:
+-            # Switch to unprivileged user, if one has been set
+-            if self.unpriv_uid is not None and self.unpriv_gid is not None:
+-                binwalk.core.common.debug("Dropping privileges to %d:%d" % (self.unpriv_uid, self.unpriv_gid))
+-                os.setgid(self.unpriv_uid)
+-                os.setuid(self.unpriv_gid)
+-
+-            # If not in debug mode, create a temporary file to redirect
+-            # stdout and stderr to
++            # Switch to the run-as user privileges, if one has been set
++            if self.runas_uid is not None and self.runas_gid is not None:
++                binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
++                os.setgid(self.runas_uid)
++                os.setuid(self.runas_gid)
++
++            # If not in debug mode, redirect output to /dev/null
+             if not binwalk.core.common.DEBUG:
+-                tmp = tempfile.TemporaryFile()
++                tmp = subprocess.DEVNULL
+             else:
+                 tmp = None
+ 
+@@ -958,10 +956,6 @@ class Extractor(Module):
+             binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+             rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+ 
+-            # Clean up temp file
+-            if tmp is not None:
+-                tmp.close()
+-
+             sys.exit(rval)
+         else:
+             return os.wait()[1]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch b/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
new file mode 100644
index 000000000..36e1db6c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
@@ -0,0 +1,82 @@
+From a097ccf2476cb1db0a0621da6aaf368593d1b5cf Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 3 Sep 2021 09:52:30 -0700
+Subject: [PATCH] Initial symlink 'repair' solution
+
+---
+ src/binwalk/modules/extractor.py | 51 +++++++++++++++++++-------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index da96b78..917559b 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -174,8 +174,8 @@ class Extractor(Module):
+             self.config.verbose = True
+ 
+     def add_pending(self, f):
+-        # Ignore symlinks
+-        if os.path.islink(f):
++        # Ignore symlinks, don't add new files unless recursion was requested
++        if os.path.islink(f) or not self.matryoshka:
+             return
+ 
+         # Get the file mode to check and see if it's a block/char device
+@@ -286,25 +286,27 @@ class Extractor(Module):
+ 
+                     # If recursion was specified, and the file is not the same
+                     # one we just dd'd
+-                    if (self.matryoshka and
+-                        file_path != dd_file_path and
+-                        scan_extracted_files and
+-                            self.directory in real_file_path):
+-                        # If the recursion level of this file is less than or
+-                        # equal to our desired recursion level
+-                        if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
+-                            # If this is a directory and we are supposed to process directories for this extractor,
+-                            # then add all files under that directory to the
+-                            # list of pending files.
+-                            if os.path.isdir(file_path):
+-                                for root, dirs, files in os.walk(file_path):
+-                                    for f in files:
+-                                        full_path = os.path.join(root, f)
+-                                        self.add_pending(full_path)
+-                            # If it's just a file, it to the list of pending
+-                            # files
+-                            else:
+-                                self.add_pending(file_path)
++                    if file_path != dd_file_path:
++                        # If this is a directory and we are supposed to process directories for this extractor,
++                        # then add all files under that directory to the
++                        # list of pending files.
++                        if os.path.isdir(file_path):
++                            for root, dirs, files in os.walk(file_path):
++                                for f in files:
++                                    full_path = os.path.join(root, f)
++                                    
++                                    if os.path.islink(full_path):
++                                        self.symlink_repair(full_path)
++
++                                    # If the recursion level of this file is less than or equal to our desired recursion level
++                                    if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
++                                        if scan_extracted_files and self.directory in real_file_path:
++                                                self.add_pending(full_path)
++
++                        # If it's just a file, it to the list of pending
++                        # files
++                        elif scan_extracted_files and self.directory in real_file_path:
++                            self.add_pending(file_path)
+ 
+                 # Update the last directory listing for the next time we
+                 # extract a file to this same output directory
+@@ -959,3 +961,10 @@ class Extractor(Module):
+             sys.exit(rval)
+         else:
+             return os.wait()[1]
++
++    def symlink_repair(self, symlink):
++        linktarget = os.path.realpath(symlink)
++        if not linktarget.startswith(self.directory):
++            os.remove(symlink)
++            os.symlink(os.devnull, symlink)
++            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s" % (symlink, linktarget))
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch b/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
new file mode 100644
index 000000000..9d5c53fce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
@@ -0,0 +1,61 @@
+From 803cdb11f46077af07ac5e9a4912b42adcb9ddfb Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 06:54:33 -0700
+Subject: [PATCH] Added code comments and better error output for end user
+
+---
+ src/binwalk/modules/extractor.py | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 917559b..962ad32 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -137,16 +137,26 @@ class Extractor(Module):
+ 
+         if self.enabled is True:
+             if self.runas_user is None:
+-                if os.getuid() == 0:
+-                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=<user name>.")
++                # Get some info about the current user we're running under
++                user_info = pwd.getpwuid(os.getuid())
++
++                # Don't run as root, unless explicitly instructed to
++                if user_info.pw_uid == 0:
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=%s (binwalk itself must be run as root)." % user_info.pw_name)
+             
+-                self.runas_uid = os.getuid()
+-                self.runas_gid = os.getgid()
++                # Run external applications as the current user 
++                self.runas_uid = user_info.pw_uid
++                self.runas_gid = user_info.pw_gid
+             else:
++                # Run external applications as the specified user
+                 user_info = pwd.getpwnam(self.runas_user)
+                 self.runas_uid = user_info.pw_uid
+                 self.runas_gid = user_info.pw_gid
+ 
++                # Make sure we'll have permissions to switch to the different user
++                if self.runas_uid != os.getuid() and os.getuid() != 0:
++                    raise ModuleException("In order to execute third party applications as %s, binwalk must be run with root privileges." % self.runas_user)
++
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+         self.extract_rules = []
+@@ -858,7 +868,7 @@ class Extractor(Module):
+             fdout.close()
+             fdin.close()
+ 
+-            # Make sure runasileged user can access this file
++            # Make sure run-as user can access this file
+             os.chown(fname, self.runas_uid, self.runas_gid)
+         except KeyboardInterrupt as e:
+             raise e
+@@ -965,6 +975,6 @@ class Extractor(Module):
+     def symlink_repair(self, symlink):
+         linktarget = os.path.realpath(symlink)
+         if not linktarget.startswith(self.directory):
++            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; for security, changing link target to %s." % (symlink, linktarget, os.devnull))
+             os.remove(symlink)
+             os.symlink(os.devnull, symlink)
+-            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s" % (symlink, linktarget))
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch b/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
new file mode 100644
index 000000000..f0d0ce88a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
@@ -0,0 +1,70 @@
+From f2c1f93a69e9ea756dbe87c7b79a58959ab2151d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 07:44:16 -0700
+Subject: [PATCH] Bug fixes, code testing
+
+---
+ src/binwalk/modules/extractor.py | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 962ad32..8b3e622 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -142,7 +142,7 @@ class Extractor(Module):
+ 
+                 # Don't run as root, unless explicitly instructed to
+                 if user_info.pw_uid == 0:
+-                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=%s (binwalk itself must be run as root)." % user_info.pw_name)
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure. If you wish to have extraction utilities executed as the current user, use '--run-as=%s' (binwalk itself must be run as root)." % user_info.pw_name)
+             
+                 # Run external applications as the current user 
+                 self.runas_uid = user_info.pw_uid
+@@ -297,16 +297,19 @@ class Extractor(Module):
+                     # If recursion was specified, and the file is not the same
+                     # one we just dd'd
+                     if file_path != dd_file_path:
++                        # Symlinks can cause security issues if they point outside the extraction directory.
++                        self.symlink_sanitizer(file_path)
++
+                         # If this is a directory and we are supposed to process directories for this extractor,
+                         # then add all files under that directory to the
+                         # list of pending files.
+                         if os.path.isdir(file_path):
+                             for root, dirs, files in os.walk(file_path):
++                                # Symlinks can cause security issues if they point outside the extraction directory.
++                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files])
++
+                                 for f in files:
+                                     full_path = os.path.join(root, f)
+-                                    
+-                                    if os.path.islink(full_path):
+-                                        self.symlink_repair(full_path)
+ 
+                                     # If the recursion level of this file is less than or equal to our desired recursion level
+                                     if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
+@@ -972,9 +975,18 @@ class Extractor(Module):
+         else:
+             return os.wait()[1]
+ 
+-    def symlink_repair(self, symlink):
+-        linktarget = os.path.realpath(symlink)
+-        if not linktarget.startswith(self.directory):
+-            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; for security, changing link target to %s." % (symlink, linktarget, os.devnull))
+-            os.remove(symlink)
+-            os.symlink(os.devnull, symlink)
++    def symlink_sanitizer(self, file_list):
++        # Allows either a single file path, or a list of file paths to be passed in for sanitization.
++        if type(file_list) is not list:
++            file_list = [file_list]
++        
++        # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
++        for file_name in file_list:
++            if os.path.islink(file_name):
++                linktarget = os.path.realpath(file_name)
++                binwalk.core.common.debug("Analysing symlink: %s -> %s" % (file_name, linktarget))
++
++                if not linktarget.startswith(self.directory) and linktarget != os.devnull:
++                    binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; changing link target to %s for security purposes." % (file_name, linktarget, os.devnull))
++                    os.remove(file_name)
++                    os.symlink(os.devnull, file_name)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch b/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
new file mode 100644
index 000000000..5e897ce42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
@@ -0,0 +1,71 @@
+From d2739fdf6fcd48dce41f394474240cc3372e339f Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:20:55 -0700
+Subject: [PATCH] Code cleanup
+
+---
+ src/binwalk/modules/extractor.py | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 8b3e622..97174eb 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -49,9 +49,6 @@ class Extractor(Module):
+     # squashfs-root-0).
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
+-    # Unprivileged user account to execute external extraction utilities
+-    UNPRIVILEGED_USER_NAME = 'binwalk_safe_user_69'
+-
+     TITLE = 'Extraction'
+     ORDER = 9
+     PRIMARY = False
+@@ -143,8 +140,8 @@ class Extractor(Module):
+                 # Don't run as root, unless explicitly instructed to
+                 if user_info.pw_uid == 0:
+                     raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure. If you wish to have extraction utilities executed as the current user, use '--run-as=%s' (binwalk itself must be run as root)." % user_info.pw_name)
+-            
+-                # Run external applications as the current user 
++
++                # Run external applications as the current user
+                 self.runas_uid = user_info.pw_uid
+                 self.runas_gid = user_info.pw_gid
+             else:
+@@ -323,8 +320,7 @@ class Extractor(Module):
+ 
+                 # Update the last directory listing for the next time we
+                 # extract a file to this same output directory
+-                self.last_directory_listing[
+-                    extraction_directory] = directory_listing
++                self.last_directory_listing[extraction_directory] = directory_listing
+ 
+     def append_rule(self, r):
+         self.extract_rules.append(r.copy())
+@@ -575,7 +571,7 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
+-        # Make sure runas user can access this directory
++        # Make sure run-as user can access this directory
+         os.chown(output_directory, self.runas_uid, self.runas_gid)
+ 
+         return output_directory
+@@ -927,7 +923,7 @@ class Extractor(Module):
+ 
+                     # Execute external extractor
+                     rval = self.shell_call(command)
+-                    
++
+                     # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+@@ -979,7 +975,7 @@ class Extractor(Module):
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
+-        
++
+         # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
+         for file_name in file_list:
+             if os.path.islink(file_name):
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch b/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
new file mode 100644
index 000000000..5e4fa88ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
@@ -0,0 +1,2579 @@
+From 290947c6d0b01259dfaa7d5dda7bef93a0e3fe6d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:43:19 -0700
+Subject: [PATCH] Added directory traversal test; fixed zip test.
+
+---
+ testing/tests/input-vectors/dirtraversal.tar | Bin 0 -> 276480 bytes
+ testing/tests/test_dirtraversal.py           |  31 +++++++++++++++++++
+ testing/tests/test_firmware_zip.py           |   2 --
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+ create mode 100644 testing/tests/input-vectors/dirtraversal.tar
+ create mode 100644 testing/tests/test_dirtraversal.py
+
+diff --git a/testing/tests/input-vectors/dirtraversal.tar b/testing/tests/input-vectors/dirtraversal.tar
+new file mode 100644
+index 0000000000000000000000000000000000000000..6b2c306dff7beede3dd3c0fb105eb48f7d225a66
+GIT binary patch
+literal 276480
+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%0D|)qyh`L2ktS#0
+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
+zb1Mt(c7aM<pjn(gO#{u%0A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
+
+literal 0
+HcmV?d00001
+
+diff --git a/testing/tests/test_dirtraversal.py b/testing/tests/test_dirtraversal.py
+new file mode 100644
+index 0000000..dc371d5
+--- /dev/null
++++ b/testing/tests/test_dirtraversal.py
+@@ -0,0 +1,31 @@
++import os
++import binwalk
++from nose.tools import eq_, ok_
++
++def test_dirtraversal():
++    '''
++    Test: Open dirtraversal.tar, scan for signatures.
++    Verify that dangerous symlinks have been sanitized.
++    '''
++    bad_symlink_file_list = ['foo', 'bar', 'foo2', 'bar2']
++    good_symlink_file_list = ['README_link', 'README2_link']
++
++    input_vector_file = os.path.join(os.path.dirname(__file__),
++                                     "input-vectors",
++                                     "dirtraversal.tar")
++
++    scan_result = binwalk.scan(input_vector_file,
++                               signature=True,
++                               extract=True,
++                               quiet=True)
++
++    # Test number of modules used
++    eq_(len(scan_result), 1)
++
++    # Make sure the bad symlinks have been sanitized and the
++    # good symlinks have not been sanitized.
++    for result in scan_result[0].results:
++        if result.file.name in bad_symlink_file_list:
++            assert_equal(os.path.realpath(result.file.path), os.devnull)
++        elif result.file.name in good_symlink_file_list:
++            assert_not_equal(os.path.realpath(result.file.path), os.devnull)
+diff --git a/testing/tests/test_firmware_zip.py b/testing/tests/test_firmware_zip.py
+index 69d1133..58b486c 100644
+--- a/testing/tests/test_firmware_zip.py
++++ b/testing/tests/test_firmware_zip.py
+@@ -10,8 +10,6 @@ def test_firmware_zip():
+     '''
+     expected_results = [
+ 	[0, 'Zip archive data, at least v1.0 to extract, name: dir655_revB_FW_203NA/'],
+-	[51, 'Zip archive data, at least v2.0 to extract, compressed size: 6395868, uncompressed size: 6422554, name: dir655_revB_FW_203NA/DIR655B1_FW203NAB02.bin'],
+-	[6395993, 'Zip archive data, at least v2.0 to extract, compressed size: 14243, uncompressed size: 61440, name: dir655_revB_FW_203NA/dir655_revB_release_notes_203NA.doc'],
+ 	[6410581, 'End of Zip archive, footer length: 22'],
+ 
+     ]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch b/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
new file mode 100644
index 000000000..548722c27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
@@ -0,0 +1,45 @@
+From 874e94f8bd6817847f6761069fad960df25d9f6c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:54:51 -0700
+Subject: [PATCH] Updated README.md to include extraction security notice.
+
+---
+ README.md | 7 +++++++
+ setup.py  | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/README.md b/README.md
+index 55190b7..cba5c4c 100644
+--- a/README.md
++++ b/README.md
+@@ -7,10 +7,17 @@
+ 
+ Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extracting firmware images.
+ 
++
++### *** Extraction Security Notice ***
++
++Prior to Binwalk v2.3.3, extracted archives could create symlinks which point anywhere on the file system, potentially resulting in a directory traversal attack if subsequent extraction utilties blindly follow these symlinks. More generically, Binwalk makes use of many third-party extraction utilties which may have unpatched security issues; Binwalk v2.3.3 and later allows external extraction tools to be run as an unprivileged user using the `run-as` command line option (this requires Binwalk itself to be run with root privileges). Additionally, Binwalk v2.3.3 and later will refuse to perform extraction as root unless `--run-as=root` is specified.
++
++
+ ### *** Python 2.7 Deprecation Notice ***
+ 
+ Even though many major Linux distros are still shipping Python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively to Python 3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
+ 
++
+ ### Installation and Usage
+ 
+ * [Installation](./INSTALL.md)
+diff --git a/setup.py b/setup.py
+index 9b9f6cd..1c6a555 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@ except ImportError:
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+-MODULE_VERSION = "2.3.2"
++MODULE_VERSION = "2.3.3"
+ SCRIPT_NAME = MODULE_NAME
+ MODULE_DIRECTORY = os.path.dirname(os.path.realpath(__file__))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch b/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
new file mode 100644
index 000000000..dde7317e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
@@ -0,0 +1,152 @@
+From 7ae9f43efb1c4428c57184c732bc8bb575a911f9 Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 6 Sep 2021 07:27:43 -0700
+Subject: [PATCH] Fixed dirtraversal test; updated extractor to not fork unless
+ necessary (nose tests don't like sys.exit)
+
+---
+ src/binwalk/modules/extractor.py   | 52 +++++++++++++++++++-----------
+ testing/tests/test_dirtraversal.py | 26 ++++++++-------
+ 2 files changed, 47 insertions(+), 31 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 97174eb..11eab0d 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -295,7 +295,7 @@ class Extractor(Module):
+                     # one we just dd'd
+                     if file_path != dd_file_path:
+                         # Symlinks can cause security issues if they point outside the extraction directory.
+-                        self.symlink_sanitizer(file_path)
++                        self.symlink_sanitizer(file_path, extraction_directory)
+ 
+                         # If this is a directory and we are supposed to process directories for this extractor,
+                         # then add all files under that directory to the
+@@ -303,7 +303,7 @@ class Extractor(Module):
+                         if os.path.isdir(file_path):
+                             for root, dirs, files in os.walk(file_path):
+                                 # Symlinks can cause security issues if they point outside the extraction directory.
+-                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files])
++                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files], extraction_directory)
+ 
+                                 for f in files:
+                                     full_path = os.path.join(root, f)
+@@ -949,29 +949,43 @@ class Extractor(Module):
+         return (retval, '&&'.join(command_list))
+ 
+     def shell_call(self, command):
+-        child_pid = os.fork()
+-        if child_pid is 0:
+-            # Switch to the run-as user privileges, if one has been set
+-            if self.runas_uid is not None and self.runas_gid is not None:
+-                binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
+-                os.setgid(self.runas_uid)
+-                os.setuid(self.runas_gid)
+-
+-            # If not in debug mode, redirect output to /dev/null
+-            if not binwalk.core.common.DEBUG:
+-                tmp = subprocess.DEVNULL
+-            else:
+-                tmp = None
+-
+-            # Execute command
++        # If not in debug mode, redirect output to /dev/null
++        if not binwalk.core.common.DEBUG:
++            tmp = subprocess.DEVNULL
++        else:
++            tmp = None
++
++        # If a run-as user is not the current user, we'll need to switch privileges to that user account
++        if self.runas_uid != os.getuid():
++            binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
++            
++            # Fork a child process
++            child_pid = os.fork()
++            if child_pid is 0:
++                # Switch to the run-as user privileges, if one has been set
++                if self.runas_uid is not None and self.runas_gid is not None:
++                    os.setgid(self.runas_uid)
++                    os.setuid(self.runas_gid)
++        else:
++            # child_pid of None indicates that no os.fork() occured
++            child_pid = None
++            
++        # If we're the child, or there was no os.fork(), execute the command
++        if child_pid in [0, None]:
+             binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+             rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+ 
++        # A true child process should exit with the subprocess exit value
++        if child_pid is 0:
+             sys.exit(rval)
++        # If no os.fork() happened, just return the subprocess exit value
++        elif child_pid is None:
++            return rval
++        # Else, os.fork() happened and we're the parent. Wait and return the child's exit value.
+         else:
+             return os.wait()[1]
+ 
+-    def symlink_sanitizer(self, file_list):
++    def symlink_sanitizer(self, file_list, extraction_directory):
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
+@@ -982,7 +996,7 @@ class Extractor(Module):
+                 linktarget = os.path.realpath(file_name)
+                 binwalk.core.common.debug("Analysing symlink: %s -> %s" % (file_name, linktarget))
+ 
+-                if not linktarget.startswith(self.directory) and linktarget != os.devnull:
++                if not linktarget.startswith(extraction_directory) and linktarget != os.devnull:
+                     binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; changing link target to %s for security purposes." % (file_name, linktarget, os.devnull))
+                     os.remove(file_name)
+                     os.symlink(os.devnull, file_name)
+diff --git a/testing/tests/test_dirtraversal.py b/testing/tests/test_dirtraversal.py
+index dc371d5..66ef003 100644
+--- a/testing/tests/test_dirtraversal.py
++++ b/testing/tests/test_dirtraversal.py
+@@ -1,31 +1,33 @@
+ import os
+ import binwalk
+-from nose.tools import eq_, ok_
++from nose.tools import eq_, ok_, assert_equal, assert_not_equal
+ 
+ def test_dirtraversal():
+     '''
+     Test: Open dirtraversal.tar, scan for signatures.
+     Verify that dangerous symlinks have been sanitized.
+     '''
+-    bad_symlink_file_list = ['foo', 'bar', 'foo2', 'bar2']
+-    good_symlink_file_list = ['README_link', 'README2_link']
++    bad_symlink_file_list = ['foo', 'bar', 'subdir/foo2', 'subdir/bar2']
++    good_symlink_file_list = ['subdir/README_link', 'README2_link']
+ 
+     input_vector_file = os.path.join(os.path.dirname(__file__),
+                                      "input-vectors",
+                                      "dirtraversal.tar")
+ 
++    output_directory = os.path.join(os.path.dirname(__file__),
++                                    "input-vectors",
++                                    "_dirtraversal.tar.extracted")
++
+     scan_result = binwalk.scan(input_vector_file,
+                                signature=True,
+                                extract=True,
+-                               quiet=True)
+-
+-    # Test number of modules used
+-    eq_(len(scan_result), 1)
++                               quiet=True)[0]
+ 
+     # Make sure the bad symlinks have been sanitized and the
+     # good symlinks have not been sanitized.
+-    for result in scan_result[0].results:
+-        if result.file.name in bad_symlink_file_list:
+-            assert_equal(os.path.realpath(result.file.path), os.devnull)
+-        elif result.file.name in good_symlink_file_list:
+-            assert_not_equal(os.path.realpath(result.file.path), os.devnull)
++    for symlink in bad_symlink_file_list:
++        linktarget = os.path.realpath(os.path.join(output_directory, symlink))
++        assert_equal(linktarget, os.devnull)
++    for symlink in good_symlink_file_list:
++        linktarget = os.path.realpath(os.path.join(output_directory, symlink))
++        assert_not_equal(linktarget, os.devnull)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch b/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
new file mode 100644
index 000000000..c850b4e8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
@@ -0,0 +1,22 @@
+From 9af20734f6dd1443b1fdee5e91a29463486ee16c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 6 Sep 2021 09:23:23 -0700
+Subject: [PATCH] Fixed code comment
+
+---
+ src/binwalk/modules/extractor.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 11eab0d..4c2aa02 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -990,7 +990,7 @@ class Extractor(Module):
+         if type(file_list) is not list:
+             file_list = [file_list]
+ 
+-        # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
++        # Sanitize any files in the list that are symlinks outside of the specified extraction directory.
+         for file_name in file_list:
+             if os.path.islink(file_name):
+                 linktarget = os.path.realpath(file_name)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch b/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
new file mode 100644
index 000000000..b459707a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
@@ -0,0 +1,43 @@
+From 90aaa25b506e2139a48e60e212c6755fac3410af Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Tue, 7 Sep 2021 06:55:17 -0700
+Subject: [PATCH] Added option to disable symlink sanitization if desired
+
+---
+ src/binwalk/modules/extractor.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 4c2aa02..4e4660a 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -99,6 +99,10 @@ class Extractor(Module):
+         #       type=int,
+         #       kwargs={'recursive_max_size': 0},
+         #       description="Limit the total size of all extracted files"),
++        Option(short='1',
++               long='preserve-symlinks',
++               kwargs={'do_not_sanitize_symlinks': True},
++               description="Do not sanitize extracted symlinks that point outside the extraction directory (dangerous)"),
+         Option(short='r',
+                long='rm',
+                kwargs={'remove_after_execute': True},
+@@ -118,6 +122,7 @@ class Extractor(Module):
+         Kwarg(name='recursive_max_size', default=None),
+         Kwarg(name='max_count', default=None),
+         Kwarg(name='base_directory', default=None),
++        Kwarg(name='do_not_sanitize_symlinks', default=False),
+         Kwarg(name='remove_after_execute', default=False),
+         Kwarg(name='load_default_rules', default=False),
+         Kwarg(name='run_extractors', default=True),
+@@ -986,6 +991,10 @@ class Extractor(Module):
+             return os.wait()[1]
+ 
+     def symlink_sanitizer(self, file_list, extraction_directory):
++        # User can disable this if desired
++        if self.do_not_sanitize_symlinks is True:
++            return 
++
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
similarity index 17%
rename from meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-binwalk_27.bb
index 1a55a3e4a..f4234dc88 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
@@ -6,9 +6,47 @@ HOMEPAGE = "https://github.com/ReFirmLabs/binwalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65bbee055d3ea3bfc475f07aecf4de64"
 
-SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
+SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master \
+           file://0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch \
+           file://0002-Remove-python-2.7-from-CI-testing.patch \
+           file://0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch \
+           file://0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch \
+           file://0005-Actually-implement-exponent-and-shift-operators.patch \
+           file://0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch \
+           file://0007-initial-Dockerfile-along-with-changes-required-for-s.patch \
+           file://0008-implement-multi-stage-build-and-test-stage-include-D.patch \
+           file://0009-fix-travis-script.patch \
+           file://0010-still-no-love-for-travis.patch \
+           file://0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch \
+           file://0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch \
+           file://0013-Ubuntu-Focal-is-Python-3-by-default.patch \
+           file://0014-fail-deps.sh-if-any-install-command-fails.patch \
+           file://0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch \
+           file://0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch \
+           file://0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch \
+           file://0018-there-is-no-rhyme-or-reason-to-travis.patch \
+           file://0019-try-to-preserve-the-python-being-used-across-sudo.patch \
+           file://0020-nop.patch \
+           file://0021-sasquatch-patch-was-merged.patch \
+           file://0022-add-third-party-NOTICE-markdown.patch \
+           file://0023-Removed-sensitive-keys.patch \
+           file://0024-Removed-hilink-decryption-plugin-contains-priprietar.patch \
+           file://0025-Updated-version-number-for-release.patch \
+           file://0026-Initial-low-priv-execution-implementation.patch \
+           file://0027-Added-option-to-turn-off-privilege-dropping.patch \
+           file://0028-Added-option-for-specifying-a-user-to-run-external-e.patch \
+           file://0029-Initial-symlink-repair-solution.patch \
+           file://0030-Added-code-comments-and-better-error-output-for-end-.patch \
+           file://0031-Bug-fixes-code-testing.patch \
+           file://0032-Code-cleanup.patch \
+           file://0033-Added-directory-traversal-test-fixed-zip-test.patch \
+           file://0034-Updated-README.md-to-include-extraction-security-not.patch \
+           file://0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch \
+           file://0036-Fixed-code-comment.patch \
+           file://0037-Added-option-to-disable-symlink-sanitization-if-desi.patch \
+           "
 
-SRCREV = "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
+SRCREV = "750635d9114f8e2886d99e3b7379712f72072dd9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============2679779896673164235==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-binwalk-upgrade-2.3.3-27.patch"

From 65a2fce66da78b84e47dc761a56aee8c304c4ad2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:16:02 -0500
Subject: [PATCH] python3-binwalk: upgrade 2.3.3 -> 27

---
 ...-on-newer-ubuntu-distros-and-drop-py.patch |  215 ++
 ...02-Remove-python-2.7-from-CI-testing.patch |   21 +
 ...ix-to-distros-under-LTS-and-python-v.patch |   50 +
 ...apply-test-matrix-to-dist-keyword-ex.patch |   60 +
 ...plement-exponent-and-shift-operators.patch |   38 +
 ...d-based-on-modern-realities-with-pyt.patch |  107 +
 ...le-along-with-changes-required-for-s.patch |  137 +
 ...stage-build-and-test-stage-include-D.patch |  158 +
 .../0009-fix-travis-script.patch              |   50 +
 .../0010-still-no-love-for-travis.patch       |   25 +
 ...e-of-cryptodome-since-pycrypto-is-EO.patch |   22 +
 ...empty-password-to-avoid-unzip-stuck-.patch |   23 +
 ...-Ubuntu-Focal-is-Python-3-by-default.patch |   24 +
 ...deps.sh-if-any-install-command-fails.patch |   51 +
 ...d-to-bifurcate-python3-and-python2-d.patch |   63 +
 ...using-issues-use-whatever-pip-the-us.patch |   44 +
 ...ot-preserve-the-specified-python-whe.patch |   23 +
 ...here-is-no-rhyme-or-reason-to-travis.patch |   31 +
 ...ve-the-python-being-used-across-sudo.patch |   56 +
 .../python/python3-binwalk/0020-nop.patch     |   31 +
 .../0021-sasquatch-patch-was-merged.patch     |   56 +
 ...0022-add-third-party-NOTICE-markdown.patch |   27 +
 .../0023-Removed-sensitive-keys.patch         |  220 ++
 ...ecryption-plugin-contains-priprietar.patch |  124 +
 ...5-Updated-version-number-for-release.patch |   22 +
 ...al-low-priv-execution-implementation.patch |   97 +
 ...ption-to-turn-off-privilege-dropping.patch |  152 +
 ...-specifying-a-user-to-run-external-e.patch |  139 +
 ...0029-Initial-symlink-repair-solution.patch |   82 +
 ...nts-and-better-error-output-for-end-.patch |   61 +
 .../0031-Bug-fixes-code-testing.patch         |   70 +
 .../python3-binwalk/0032-Code-cleanup.patch   |   71 +
 ...ectory-traversal-test-fixed-zip-test.patch | 2579 +++++++++++++++++
 ...d-to-include-extraction-security-not.patch |   45 +
 ...al-test-updated-extractor-to-not-for.patch |  152 +
 .../0036-Fixed-code-comment.patch             |   22 +
 ...disable-symlink-sanitization-if-desi.patch |   43 +
 ...binwalk_2.3.3.bb => python3-binwalk_27.bb} |   42 +-
 38 files changed, 5231 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
 rename meta-python/recipes-devtools/python/{python3-binwalk_2.3.3.bb => python3-binwalk_27.bb} (17%)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
new file mode 100644
index 000000000..4607ef6c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
@@ -0,0 +1,215 @@
+From c1ab4d76969c6e246940266c840f726c872f7237 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 2 Feb 2020 19:07:02 -0700
+Subject: [PATCH] deps: Fix install on newer ubuntu distros and drop python2
+ support.
+
+Dependencies such as jefferson are now python3 only and python2 is no
+longer supported, as it appears all our dependencies have python3
+versions it should be safe to drop python2 support.
+---
+ .travis.yml                | 16 ++++++++++++++--
+ deps.sh                    | 30 +++++++++++++++---------------
+ setup.py                   | 17 ++++++++++++++---
+ src/binwalk/core/compat.py |  5 +----
+ src/binwalk/core/magic.py  |  2 +-
+ src/binwalk/plugins/tar.py |  2 +-
+ 6 files changed, 46 insertions(+), 26 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 3cdebed..34b10c8 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,3 +1,7 @@
++dist: xenial
++addons:
++  apt:
++    update: true
+ language: python
+ arch: 
+  - ppc64le
+@@ -9,13 +13,21 @@ python:
+  - "3.6"
+  - "3.7"
+  - "3.8"
++ - "3.9"
+  - "nightly"
+ install:
++ - ./deps.sh --yes
+  - pip install coverage
+- - pip install backports.lzma
+  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
+-matrix:
++jobs:
++  include:
++   - python: "3.6"
++     dist: bionic
++   - python: "3.8"
++     dist: focal
++   - python: "3.9"
++     dist: focal
+   allow_failures:
+    - python: nightly
+diff --git a/deps.sh b/deps.sh
+index 19892de..5321b37 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -41,24 +41,26 @@ APTGETCMD="apt-get"
+ YUMCMD="yum"
+ if [ $distro = "Kali" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
+-elif [ $distro_version = "17" ]
++    APT_CANDIDATES="git build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
++elif [ $distro_version = "14" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++elif [ $distro_version = "15" ]
++then
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++elif [ $distro_version = "16" ]
++then
++    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "18" ]
+ then
+     APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ else
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ fi
+-PYTHON2_APT_CANDIDATES="python-crypto python-lzo python-lzma python-pip python-tk"
+-PYTHON3_APT_CANDIDATES="python3-crypto python3-pip python3-tk"
++PYTHON3_APT_CANDIDATES="python3-crypto python3-gnupg python3-pip python3-tk"
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PYTHON2_YUM_CANDIDATES="python-pip python-Bottleneck cpio"
+-APT_CANDIDATES="$APT_CANDIDATES $PYTHON2_APT_CANDIDATES"
+-YUM_CANDIDATES="$YUM_CANDIDATES $PYTHON2_YUM_CANDIDATES"
+-PIP_COMMANDS="pip"
++PIP_COMMANDS="pip3"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -72,7 +74,7 @@ fi
+ function install_yaffshiv
+ {
+     git clone https://github.com/devttys0/yaffshiv
+-    (cd yaffshiv && $SUDO python2 setup.py install)
++    (cd yaffshiv && $SUDO python3 setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+@@ -122,10 +124,7 @@ function install_cramfstools
+ function install_ubireader
+ {
+     git clone https://github.com/jrspruitt/ubi_reader
+-    # Some UBIFS extraction breaks after this commit, due to "Added fatal error check if UBI block extends beyond file size"
+-    # (see this commit: https://github.com/jrspruitt/ubi_reader/commit/af678a5234dc891e8721ec985b1a6e74c77620b6)
+-    # Reset to a known working commit.
+-    (cd ubi_reader && git reset --hard 0955e6b95f07d849a182125919a1f2b6790d5b51 && $SUDO python setup.py install)
++    (cd ubi_reader && $SUDO python3 setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
+ 
+@@ -257,6 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
++install_pip_package setuptools
+ install_pip_package matplotlib
+ install_pip_package capstone
+ install_sasquatch
+diff --git a/setup.py b/setup.py
+index e4fca3f..b747b4d 100755
+--- a/setup.py
++++ b/setup.py
+@@ -1,10 +1,14 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
++import io
+ import os
+ import sys
+ import glob
+ import shutil
+ import subprocess
+-from distutils.core import setup, Command
++try:
++    from setuptools import setup, Command
++except ImportError:
++    from distutils.core import setup, Command
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+@@ -24,7 +28,7 @@ except ImportError:
+ # by binwalk.
+ try:
+     label = subprocess.check_output(["git", "rev-parse", "--short", "HEAD"], stderr=DEVNULL).decode('utf-8')
+-    MODULE_VERSION = "%s-%s" % (MODULE_VERSION, label.strip())
++    MODULE_VERSION = "%s+%s" % (MODULE_VERSION, label.strip())
+ except KeyboardInterrupt as e:
+     raise e
+ except Exception:
+@@ -318,14 +322,21 @@ install_data_files = []
+ for data_dir in ["magic", "config", "plugins", "modules", "core"]:
+     install_data_files.append("%s%s*" % (data_dir, os.path.sep))
+ 
++this_directory = os.path.abspath(os.path.dirname(__file__))
++with io.open(os.path.join(this_directory, 'README.md'), encoding='utf-8') as f:
++    long_description = f.read()
++
+ # Install the module, script, and support files
+ setup(
+     name=MODULE_NAME,
+     version=MODULE_VERSION,
+     description="Firmware analysis tool",
++    long_description=long_description,
++    long_description_content_type='text/markdown',
+     author="Craig Heffner",
+     url="https://github.com/ReFirmLabs/%s" % MODULE_NAME,
+     requires=[],
++    python_requires=">=3",
+     package_dir={"": "src"},
+     packages=[MODULE_NAME],
+     package_data={MODULE_NAME: install_data_files},
+diff --git a/src/binwalk/core/compat.py b/src/binwalk/core/compat.py
+index b5453c5..b610c99 100644
+--- a/src/binwalk/core/compat.py
++++ b/src/binwalk/core/compat.py
+@@ -81,7 +81,4 @@ def user_input(prompt=''):
+     '''
+     For getting raw user input in Python 2 and 3.
+     '''
+-    if PY_MAJOR_VERSION > 2:
+-        return input(prompt)
+-    else:
+-        return raw_input(prompt)
++    return input(prompt)
+diff --git a/src/binwalk/core/magic.py b/src/binwalk/core/magic.py
+index 750bd12..8f7a316 100644
+--- a/src/binwalk/core/magic.py
++++ b/src/binwalk/core/magic.py
+@@ -625,7 +625,7 @@ class Magic(object):
+                     try:
+                         # If the operator value of this signature line is just
+                         # an integer value, use it
+-                        if isinstance(line.opvalue, int) or isinstance(line.opvalue, long):
++                        if isinstance(line.opvalue, int):
+                             opval = line.opvalue
+                         # Else, evaluate the complex expression
+                         else:
+diff --git a/src/binwalk/plugins/tar.py b/src/binwalk/plugins/tar.py
+index be54d8a..da3121a 100644
+--- a/src/binwalk/plugins/tar.py
++++ b/src/binwalk/plugins/tar.py
+@@ -33,7 +33,7 @@ class TarPlugin(binwalk.core.plugin.Plugin):
+                 raise ValueError("invalid tar header")
+         else:
+             n = 0
+-            for i in xrange(len(s) - 1):
++            for i in range(len(s) - 1):
+                 n <<= 8
+                 n += ord(s[i + 1])
+         return n
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch b/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
new file mode 100644
index 000000000..690c7c09b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
@@ -0,0 +1,21 @@
+From 581f3e3c3b59330605e143440dd9e750f2dca1df Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:05:08 -0400
+Subject: [PATCH] Remove python 2.7 from CI testing
+
+---
+ .travis.yml | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 34b10c8..d20236e 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -7,7 +7,6 @@ arch:
+  - ppc64le
+  - amd64
+ python:
+- - "2.7"
+  - "3.4"
+  - "3.5"
+  - "3.6"
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch b/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
new file mode 100644
index 000000000..ff4c77375
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
@@ -0,0 +1,50 @@
+From cae584099ceeaa148e7ad284f4f3c72d44af2b82 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:40:25 -0400
+Subject: [PATCH] reduce test matrix to distros under LTS and python versions
+ currently
+
+---
+ .travis.yml | 18 +++---------------
+ 1 file changed, 3 insertions(+), 15 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index d20236e..e0b78d5 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,32 +1,20 @@
+-dist: xenial
++dist:
++  - bionic
++  - focal
+ addons:
+   apt:
+     update: true
+ language: python
+ arch: 
+- - ppc64le
+  - amd64
+ python:
+- - "3.4"
+- - "3.5"
+  - "3.6"
+  - "3.7"
+  - "3.8"
+  - "3.9"
+- - "nightly"
+ install:
+  - ./deps.sh --yes
+  - pip install coverage
+  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
+-jobs:
+-  include:
+-   - python: "3.6"
+-     dist: bionic
+-   - python: "3.8"
+-     dist: focal
+-   - python: "3.9"
+-     dist: focal
+-  allow_failures:
+-   - python: nightly
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch b/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
new file mode 100644
index 000000000..af9762260
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
@@ -0,0 +1,60 @@
+From 810cc9ef5d63967dba9c2bc47176427fc1cc666d Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <eacmen@gmail.com>
+Date: Sun, 14 Mar 2021 17:56:00 -0400
+Subject: [PATCH] Travis will not apply test matrix to dist keyword, expand it
+ manually in jobs list
+
+---
+ .travis.yml | 39 +++++++++++++++++++++++++--------------
+ 1 file changed, 25 insertions(+), 14 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index e0b78d5..d2b068d 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -1,20 +1,31 @@
+-dist:
+-  - bionic
+-  - focal
++os: linux
++dist: bionic
++language: python
++arch: amd64
+ addons:
+   apt:
+     update: true
+-language: python
+-arch: 
+- - amd64
+-python:
+- - "3.6"
+- - "3.7"
+- - "3.8"
+- - "3.9"
+ install:
+- - ./deps.sh --yes
+- - pip install coverage
+- - ./setup.py install
++  - ./deps.sh --yes
++  - pip install coverage
++  - ./setup.py install
+ script: ./setup.py test
+ cache: pip
++jobs:
++  include:
++   - dist: bionic
++     python: 3.6
++   - dist: bionic
++     python: 3.7
++   - dist: bionic
++     python: 3.8
++   - dist: bionic
++     python: 3.9
++   - dist: focal
++     python: 3.6
++   - dist: focal
++     python: 3.7
++   - dist: focal
++     python: 3.8
++   - dist: focal
++     python: 3.9
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch b/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
new file mode 100644
index 000000000..ec3cedd39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
@@ -0,0 +1,38 @@
+From 5ca500407edd177dc6e88afbc42dff7490ce90c3 Mon Sep 17 00:00:00 2001
+From: Marcus T <llamasoft@rm-rf.email>
+Date: Fri, 26 Feb 2021 16:15:36 -0800
+Subject: [PATCH] Actually implement exponent and shift operators
+
+These operators are listed in the "Signature File Format" wiki page but don't actually exist.
+---
+ src/binwalk/core/magic.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/binwalk/core/magic.py b/src/binwalk/core/magic.py
+index 8f7a316..bcc6dc7 100644
+--- a/src/binwalk/core/magic.py
++++ b/src/binwalk/core/magic.py
+@@ -97,7 +97,7 @@ class SignatureLine(object):
+         # AND the data with 0xFF before the comparison is performed).
+         #
+         # We support the following operators:
+-        for operator in ['&', '|', '*', '+', '-', '/', '~', '^']:
++        for operator in ['**', '<<', '>>', '&', '|', '*', '+', '-', '/', '~', '^']:
+             # Look for each operator in self.type
+             if operator in self.type:
+                 # If found, split self.type into the type and operator value
+@@ -632,7 +632,13 @@ class Magic(object):
+                             opval = self._do_math(offset, line.opvalue)
+ 
+                         # Perform the specified operation
+-                        if line.operator == '&':
++                        if line.operator == '**':
++                            dvalue **= opval
++                        elif line.operator == '<<':
++                            dvalue <<= opval
++                        elif line.operator == '>>':
++                            dvalue >>= opval
++                        elif line.operator == '&':
+                             dvalue &= opval
+                         elif line.operator == '|':
+                             dvalue |= opval
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch b/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
new file mode 100644
index 000000000..b064cf823
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
@@ -0,0 +1,107 @@
+From 144107e8cc8aa62a00dbdb4f6f087ccb824bfc6f Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Tue, 16 Mar 2021 00:44:40 -0400
+Subject: [PATCH] Update INSTALL.md based on modern realities with python3
+
+---
+ INSTALL.md | 45 ++++-----------------------------------------
+ 1 file changed, 4 insertions(+), 41 deletions(-)
+
+diff --git a/INSTALL.md b/INSTALL.md
+index f39e95b..a14e8c4 100644
+--- a/INSTALL.md
++++ b/INSTALL.md
+@@ -1,18 +1,13 @@
+ Before You Start
+ ================
+ 
+-Binwalk supports Python 2.7 - 3.x. Although most systems have Python2.7 set as their default Python interpreter, binwalk does run faster in Python3. Installation procedures for both are provided below.
++Binwalk supports Python 3.6+. 
+ 
+ Installation
+ ============
+ 
+ Installation follows the typical Python installation procedure:
+ 
+-```bash
+-# Python2.7
+-$ sudo python setup.py install
+-```
+-
+ ```bash
+ # Python3.x
+ $ sudo python3 setup.py install
+@@ -25,40 +20,21 @@ Dependencies
+ 
+ Besides a Python interpreter, there are no installation dependencies for binwalk. All dependencies are optional run-time dependencies, and unless otherwise specified, are available from most Linux package managers.
+ 
+-Although all binwalk run-time dependencies are optional, the `python-lzma` module is highly recommended for improving the reliability of signature scans. This module is included by default in Python3, but must be installed separately for Python2.7:
+-
+-```bash
+-$ sudo apt-get install python-lzma
+-```
+-
+ Binwalk uses the `nosetest` library for tests and `coverage` for test-coverage:
+ 
+ ```bash
+ $ sudo pip install nose coverage
+ ```
+ 
+-Binwalk uses the `pycrypto` library to decrypt some known encrypted firmware images:
++Binwalk uses the `pycryptodome` (`pycrypto`-compatible module that is still maintained) library to decrypt some known encrypted firmware images:
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install python-crypto
+-```
+-
+-```bash
+-# Python3.x
+-$ sudo apt-get install python3-crypto
++$ sudo pip install pycryptodome
+ ```
+ 
+-Binwalk uses [pyqtgraph](http://www.pyqtgraph.org) to generate graphs and visualizations, which requires the following: 
++Binwalk uses [pyqtgraph](http://www.pyqtgraph.org) to generate graphs and visualizations, which requires the following (exact dependencies may vary based on your distro refer to `deps.sh` for more details): 
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install libqt4-opengl python-opengl python-qt4 python-qt4-gl python-numpy python-scipy python-pip
+-$ sudo pip install pyqtgraph
+-```
+-
+-```bash
+-# Python3.x
+ $ sudo apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pip
+ $ sudo pip3 install pyqtgraph
+ ```
+@@ -66,17 +42,9 @@ $ sudo pip3 install pyqtgraph
+ Binwalk's `--disasm` option requires the [Capstone](http://www.capstone-engine.org/) disassembly framework and its corresponding Python bindings:
+ 
+ ```bash
+-# Python2.7
+-$ sudo apt-get install python-pip
+ $ sudo pip install capstone
+ ```
+ 
+-```bash
+-# Python3.x
+-$ sudo apt-get install python3-pip
+-$ sudo pip3 install capstone
+-```
+-
+ Binwalk relies on multiple external utilties in order to automatically extract/decompress files and data:
+ 
+ ```bash
+@@ -144,11 +112,6 @@ Uninstalling Binwalk
+ 
+ If binwalk has been installed to a standard system location (e.g., via `setup.py install`), it can be removed by running:
+ 
+-```bash
+-# Python2.7
+-$ sudo python setup.py uninstall
+-```
+-
+ ```bash
+ # Python3
+ $ sudo python3 setup.py uninstall
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch b/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
new file mode 100644
index 000000000..64ceb6cb8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
@@ -0,0 +1,137 @@
+From aacbcc4c542670ee51fd87ece292324f6ac2d0d2 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 14:54:39 -0400
+Subject: [PATCH] initial Dockerfile along with changes required for setting
+ locale correctly inside Docker container.
+
+---
+ .dockerignore |  5 +++++
+ Dockerfile    | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ deps.sh       | 18 +++++++---------
+ 3 files changed, 73 insertions(+), 10 deletions(-)
+ create mode 100644 .dockerignore
+ create mode 100644 Dockerfile
+
+diff --git a/.dockerignore b/.dockerignore
+new file mode 100644
+index 0000000..af5c03a
+--- /dev/null
++++ b/.dockerignore
+@@ -0,0 +1,5 @@
++build
++dist
++.coverage
++*.extracted
++*.pyc
+diff --git a/Dockerfile b/Dockerfile
+new file mode 100644
+index 0000000..64451fc
+--- /dev/null
++++ b/Dockerfile
+@@ -0,0 +1,60 @@
++FROM python:3-buster
++
++ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin
++
++# Make stdout/stderr unbuffered. This prevents delay between output and cloud.
++# Might not be needed by all apps, but slow ALL of them. test per app/container
++#ENV PYTHONUNBUFFERED "1"
++
++### To prevent the Debian installer from freaking out on configuration of packages
++ENV DEBIAN_FRONTEND noninteractive
++
++# Pinned versions of few oddball dependencies
++ENV SASQUATCH_COMMIT 3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed
++ENV UBIREADER_COMMIT 0955e6b95f07d849a182125919a1f2b6790d5b51
++ENV BINWALK_COMMIT   3154b0012e7dbaf2b20edd5c0a2350ec64009869
++
++COPY . /tmp
++
++WORKDIR /tmp
++
++### Took out the deps.sh from binwalk's installation script, baked in the dependencies into the main prereqs installation
++### The prereqs that dont come from system's repo, are taken care of later
++RUN set -xue \
++    && apt-get update -qy \
++    && apt-get -t buster dist-upgrade -yq --no-install-recommends -o Dpkg::Options::="--force-confold" \
++    && ./deps.sh --yes \
++    && python3 setup.py install && binwalk -h > /dev/null \
++    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
++    && echo "LANG=en_US.UTF-8" >> /etc/default/locale \
++    && echo "LANGUAGE=en_US:en" >> /etc/default/locale \
++    && echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale \
++    && locale-gen \
++    && apt-get -y autoremove \
++    && apt-get -y autoclean \
++    && useradd -m -u 1000 -s /sbin/nologin appuser \
++    && rm -rf -- \
++        /var/lib/apt/lists/* \
++        /tmp/* /var/tmp/* \
++        /usr/src/app/*.whl /usr/src/app/*.tar.gz \
++        /root/.cache/pip \
++        /usr/src/app/repos \
++        /usr/src/app/.git \
++        /usr/src/app/src
++
++
++ENV DEBIAN_FRONTEND teletype
++# Setup locale. This prevents Python 3 IO encoding issues.
++ENV LANG en_US.UTF-8
++ENV LANGUAGE en_US:en
++ENV LC_ALL en_US.UTF-8
++ENV PYTHONUTF8 "1"
++ENV PYTHONHASHSEED "random"
++
++WORKDIR /home/appuser
++USER appuser
++
++# dummy run because it creates some files on first run in home dir
++RUN binwalk -h > /dev/null
++
++ENTRYPOINT ["binwalk"]
+diff --git a/deps.sh b/deps.sh
+index 5321b37..7c0b391 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -41,23 +41,23 @@ APTGETCMD="apt-get"
+ YUMCMD="yum"
+ if [ $distro = "Kali" ]
+ then
+-    APT_CANDIDATES="git build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
++    APT_CANDIDATES="git locales build-essential qt5base-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract util-linux firmware-mod-kit cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop cpio"
+ elif [ $distro_version = "14" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "15" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "16" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsprogs cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ elif [ $distro_version = "18" ]
+ then
+-    APT_CANDIDATES="git build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential libqt4-opengl mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ else
+-    APT_CANDIDATES="git build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
++    APT_CANDIDATES="git locales build-essential qtbase5-dev mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit default-jdk lzop srecord cpio"
+ fi
+-PYTHON3_APT_CANDIDATES="python3-crypto python3-gnupg python3-pip python3-tk"
++PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+ PIP_COMMANDS="pip3"
+@@ -256,9 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
+-install_pip_package setuptools
+-install_pip_package matplotlib
+-install_pip_package capstone
++install_pip_package "setuptools matplotlib capstone crypto gnupg tk"
+ install_sasquatch
+ install_yaffshiv
+ install_jefferson
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch b/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
new file mode 100644
index 000000000..d462bd693
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
@@ -0,0 +1,158 @@
+From 13d48cf64c9de9732e348b02cab1feb564d8305f Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:31:07 -0400
+Subject: [PATCH] implement multi-stage build and test stage, include Docker
+ build in Travis integration testing
+
+---
+ .dockerignore |  6 ++++++
+ .travis.yml   | 28 +++++++++++++++++-------
+ Dockerfile    | 59 ++++++++++++++++++++++-----------------------------
+ 3 files changed, 51 insertions(+), 42 deletions(-)
+
+diff --git a/.dockerignore b/.dockerignore
+index af5c03a..29f7098 100644
+--- a/.dockerignore
++++ b/.dockerignore
+@@ -3,3 +3,9 @@ dist
+ .coverage
+ *.extracted
+ *.pyc
++.editorconfig
++.gitignore
++images
++Dockerfile
++.dockerignore
++.git
+diff --git a/.travis.yml b/.travis.yml
+index d2b068d..8434a4d 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -13,19 +13,31 @@ script: ./setup.py test
+ cache: pip
+ jobs:
+   include:
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.6
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.7
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.8
+-   - dist: bionic
++   - stage: test
++     dist: bionic
+      python: 3.9
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.6
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.7
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.8
+-   - dist: focal
++   - stage: test
++     dist: focal
+      python: 3.9
++   - stage: test
++     services: docker
++     install: 
++       - docker build .
+diff --git a/Dockerfile b/Dockerfile
+index 64451fc..7b6629b 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -1,21 +1,12 @@
+-FROM python:3-buster
++FROM python:3-buster AS build-and-install
+ 
+-ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin
+-
+-# Make stdout/stderr unbuffered. This prevents delay between output and cloud.
+-# Might not be needed by all apps, but slow ALL of them. test per app/container
+-#ENV PYTHONUNBUFFERED "1"
+-
+-### To prevent the Debian installer from freaking out on configuration of packages
+-ENV DEBIAN_FRONTEND noninteractive
+-
+-# Pinned versions of few oddball dependencies
+-ENV SASQUATCH_COMMIT 3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed
+-ENV UBIREADER_COMMIT 0955e6b95f07d849a182125919a1f2b6790d5b51
+-ENV BINWALK_COMMIT   3154b0012e7dbaf2b20edd5c0a2350ec64009869
++ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin \
++    DEBIAN_FRONTEND=noninteractive \
++    SASQUATCH_COMMIT=3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed \
++    UBIREADER_COMMIT=0955e6b95f07d849a182125919a1f2b6790d5b51 \
++    BINWALK_COMMIT=3154b0012e7dbaf2b20edd5c0a2350ec64009869
+ 
+ COPY . /tmp
+-
+ WORKDIR /tmp
+ 
+ ### Took out the deps.sh from binwalk's installation script, baked in the dependencies into the main prereqs installation
+@@ -25,36 +16,36 @@ RUN set -xue \
+     && apt-get -t buster dist-upgrade -yq --no-install-recommends -o Dpkg::Options::="--force-confold" \
+     && ./deps.sh --yes \
+     && python3 setup.py install && binwalk -h > /dev/null \
++    && apt-get -yq purge *-dev git build-essential gcc g++ \
++    && apt-get -y autoremove \
++    && apt-get -y autoclean \
+     && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
+     && echo "LANG=en_US.UTF-8" >> /etc/default/locale \
+     && echo "LANGUAGE=en_US:en" >> /etc/default/locale \
+     && echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale \
+-    && locale-gen \
+-    && apt-get -y autoremove \
+-    && apt-get -y autoclean \
+-    && useradd -m -u 1000 -s /sbin/nologin appuser \
++    && locale-gen
++
++FROM build-and-install AS unit-tests
++RUN pip install coverage nose \
++    && python3 setup.py test \
++    && dd if=/dev/urandom of=/tmp/random.bin bs=1M count=1 && binwalk -J -E /tmp/random.bin
++
++FROM build-and-install AS cleanup-and-release
++RUN useradd -m -u 1000 -s /sbin/nologin appuser \
+     && rm -rf -- \
+         /var/lib/apt/lists/* \
+         /tmp/* /var/tmp/* \
+-        /usr/src/app/*.whl /usr/src/app/*.tar.gz \
+-        /root/.cache/pip \
+-        /usr/src/app/repos \
+-        /usr/src/app/.git \
+-        /usr/src/app/src
+-
++        /root/.cache/pip
+ 
+-ENV DEBIAN_FRONTEND teletype
+ # Setup locale. This prevents Python 3 IO encoding issues.
+-ENV LANG en_US.UTF-8
+-ENV LANGUAGE en_US:en
+-ENV LC_ALL en_US.UTF-8
+-ENV PYTHONUTF8 "1"
+-ENV PYTHONHASHSEED "random"
++ENV DEBIAN_FRONTEND=teletype \
++    LANG=en_US.UTF-8 \
++    LANGUAGE=en_US:en \
++    LC_ALL=en_US.UTF-8 \
++    PYTHONUTF8="1" \
++    PYTHONHASHSEED="random"
+ 
+ WORKDIR /home/appuser
+ USER appuser
+ 
+-# dummy run because it creates some files on first run in home dir
+-RUN binwalk -h > /dev/null
+-
+ ENTRYPOINT ["binwalk"]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch b/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
new file mode 100644
index 000000000..e30f605f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
@@ -0,0 +1,50 @@
+From acc41e284c68f3626df2e5285ab5e7fc2ff8c060 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:47:55 -0400
+Subject: [PATCH] fix travis script
+
+---
+ .travis.yml | 9 +++++----
+ Dockerfile  | 5 +----
+ 2 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 8434a4d..7c74cc7 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -13,6 +13,11 @@ script: ./setup.py test
+ cache: pip
+ jobs:
+   include:
++   - stage: test
++     services: docker
++     install: 
++       - docker build .
++     script: no
+    - stage: test
+      dist: bionic
+      python: 3.6
+@@ -37,7 +42,3 @@ jobs:
+    - stage: test
+      dist: focal
+      python: 3.9
+-   - stage: test
+-     services: docker
+-     install: 
+-       - docker build .
+diff --git a/Dockerfile b/Dockerfile
+index 7b6629b..056b0a0 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -1,10 +1,7 @@
+ FROM python:3-buster AS build-and-install
+ 
+ ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/src/app/bin \
+-    DEBIAN_FRONTEND=noninteractive \
+-    SASQUATCH_COMMIT=3e0cc40fc6dbe32bd3a5e6c553b3320d5d91ceed \
+-    UBIREADER_COMMIT=0955e6b95f07d849a182125919a1f2b6790d5b51 \
+-    BINWALK_COMMIT=3154b0012e7dbaf2b20edd5c0a2350ec64009869
++    DEBIAN_FRONTEND=noninteractive
+ 
+ COPY . /tmp
+ WORKDIR /tmp
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch b/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
new file mode 100644
index 000000000..ee539ff6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
@@ -0,0 +1,25 @@
+From 6e185f1809b09db81b967a85a87a7aaae2bdc8d5 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Mon, 15 Mar 2021 23:54:40 -0400
+Subject: [PATCH] still no love for travis
+
+---
+ .travis.yml | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 7c74cc7..90f3cfa 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -15,9 +15,8 @@ jobs:
+   include:
+    - stage: test
+      services: docker
+-     install: 
+-       - docker build .
+-     script: no
++     install: echo "No install for this job"
++     script: docker build .
+    - stage: test
+      dist: bionic
+      python: 3.6
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch b/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
new file mode 100644
index 000000000..0a2061a27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
@@ -0,0 +1,22 @@
+From 9f0cba6790292c3c863b30cedad81a059d7b7737 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Tue, 16 Mar 2021 00:14:00 -0400
+Subject: [PATCH] transition to use of cryptodome since pycrypto is EOL
+
+---
+ deps.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps.sh b/deps.sh
+index 7c0b391..9595660 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -256,7 +256,7 @@ if [ $? -ne 0 ]
+     echo "Package installation failed: $PKG_CANDIDATES"
+     exit 1
+ fi
+-install_pip_package "setuptools matplotlib capstone crypto gnupg tk"
++install_pip_package "setuptools matplotlib capstone pycryptodome gnupg tk"
+ install_sasquatch
+ install_yaffshiv
+ install_jefferson
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch b/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
new file mode 100644
index 000000000..c063ac5e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
@@ -0,0 +1,23 @@
+From 94f5934b445d6571defdd622ef93c40a1976b26f Mon Sep 17 00:00:00 2001
+From: owl <owl129@126.com>
+Date: Tue, 16 Mar 2021 17:41:09 +0800
+Subject: [PATCH] Call 'unzip' with empty password, to avoid 'unzip' stuck in
+ interactive mode when process encrypt files
+
+---
+ src/binwalk/config/extract.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/binwalk/config/extract.conf b/src/binwalk/config/extract.conf
+index 1b24f06..5b54f72 100644
+--- a/src/binwalk/config/extract.conf
++++ b/src/binwalk/config/extract.conf
+@@ -52,7 +52,7 @@
+ # 7z handles most zip files, but fails on some zip archives, inexplicably seeing
+ # only the *last* entry in the zip archive (though 7z thinks it succeeded). See
+ # StarCam firmware CH-sys-48.53.64.67.zip.
+-^zip archive data:zip:unzip -o '%e':0
++^zip archive data:zip:unzip -P '' -o '%e':0
+ ^zip archive data:zip:jar xvf '%e':0
+ ^zip archive data:zip:7z x -y '%e' -p '':0,1
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch b/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
new file mode 100644
index 000000000..521f6b4a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
@@ -0,0 +1,24 @@
+From e3142e37564f14f98823b56fa40ea35314099756 Mon Sep 17 00:00:00 2001
+From: Christian Clauss <cclauss@me.com>
+Date: Tue, 16 Mar 2021 19:19:33 +0100
+Subject: [PATCH] Ubuntu Focal is Python 3 by default
+
+https://wiki.ubuntu.com/FocalFossa/ReleaseNotes#Python3_by_default
+Several other distros as well.
+---
+ README.md | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/README.md b/README.md
+index c2074cb..55190b7 100644
+--- a/README.md
++++ b/README.md
+@@ -9,7 +9,7 @@ Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extr
+ 
+ ### *** Python 2.7 Deprecation Notice ***
+ 
+-Even though every major Linux distro is still shipping python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively into python3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
++Even though many major Linux distros are still shipping Python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively to Python 3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
+ 
+ ### Installation and Usage
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch b/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
new file mode 100644
index 000000000..9b1428e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
@@ -0,0 +1,51 @@
+From 1a503e8ce57bbf3448be07d45b3cf692a449e62e Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 17:38:31 -0400
+Subject: [PATCH] fail deps.sh if any install command fails
+
+---
+ .gitignore | 1 +
+ deps.sh    | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/.gitignore b/.gitignore
+index af5c03a..b2e167e 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -3,3 +3,4 @@ dist
+ .coverage
+ *.extracted
+ *.pyc
++**/*.egg-info
+\ No newline at end of file
+diff --git a/deps.sh b/deps.sh
+index 9595660..5072c70 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -8,7 +8,9 @@ else
+     YES=0
+ fi
+ 
++set -eu
+ set -o nounset
++set -x
+ 
+ if ! which lsb_release > /dev/null
+ then
+@@ -65,6 +67,7 @@ PIP_COMMANDS="pip3"
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+ then
++    echo "UID is 0, sudo not required"
+     SUDO=""
+ else
+     SUDO="sudo"
+@@ -80,7 +83,7 @@ function install_yaffshiv
+ 
+ function install_sasquatch
+ {
+-    git clone https://github.com/devttys0/sasquatch
++    git clone --quiet --depth 1 --branch "patch-1" https://github.com/eacmen/sasquatch
+     (cd sasquatch && $SUDO ./build.sh)
+     $SUDO rm -rf sasquatch
+ }
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch b/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
new file mode 100644
index 000000000..c6af6968d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
@@ -0,0 +1,63 @@
+From 2480d27373266d9591587cec5f373e0c9cd947fd Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:19:50 -0400
+Subject: [PATCH] we no longer need to bifurcate python3 and python2 deps
+
+---
+ .travis.yml |  1 +
+ deps.sh     | 16 ++--------------
+ 2 files changed, 3 insertions(+), 14 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 90f3cfa..4efe049 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -2,6 +2,7 @@ os: linux
+ dist: bionic
+ language: python
+ arch: amd64
++sudo: true
+ addons:
+   apt:
+     update: true
+diff --git a/deps.sh b/deps.sh
+index 5072c70..03df74b 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,7 +62,7 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PIP_COMMANDS="pip3"
++PIP_COMMANDS="pip"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -134,11 +134,7 @@ function install_ubireader
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-
+-    for PIP_COMMAND in $PIP_COMMANDS
+-    do
+-        $SUDO $PIP_COMMAND install $PACKAGE
+-    done
++    $SUDO pip install $PACKAGE
+ }
+ 
+ function find_path
+@@ -243,14 +239,6 @@ then
+     exit 1
+ fi
+ 
+-# Check to see if we should install modules for python3 as well
+-find_path python3
+-if [ $? -eq 0 ]
+-then
+-     PKG_CANDIDATES="$PKG_CANDIDATES $PKG_PYTHON3_CANDIDATES"
+-     PIP_COMMANDS="pip3 $PIP_COMMANDS"
+-fi
+-
+ # Do the install(s)
+ cd /tmp
+ $SUDO $PKGCMD $PKGCMD_OPTS $PKG_CANDIDATES
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch b/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
new file mode 100644
index 000000000..27f749b82
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
@@ -0,0 +1,44 @@
+From e9ee7eb18e57b8c007695a7f0f22ed6e298313ff Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:40:43 -0400
+Subject: [PATCH] using pip3 is causing issues, use whatever pip the user has
+ in their environment
+
+---
+ .travis.yml | 1 -
+ deps.sh     | 3 +--
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 4efe049..90f3cfa 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -2,7 +2,6 @@ os: linux
+ dist: bionic
+ language: python
+ arch: amd64
+-sudo: true
+ addons:
+   apt:
+     update: true
+diff --git a/deps.sh b/deps.sh
+index 03df74b..230b8cc 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,7 +62,6 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
+-PIP_COMMANDS="pip"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -91,7 +90,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO pip install -r requirements.txt && $SUDO python3 setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch b/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
new file mode 100644
index 000000000..160c93325
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
@@ -0,0 +1,23 @@
+From 68ed04375509d3d1194f770636cacbb26597f747 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:51:57 -0400
+Subject: [PATCH] Travis-CI does not preserve the specified python when
+ invoking sudo
+
+---
+ deps.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps.sh b/deps.sh
+index 230b8cc..8a267b1 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -69,7 +69,7 @@ then
+     echo "UID is 0, sudo not required"
+     SUDO=""
+ else
+-    SUDO="sudo"
++    SUDO="sudo -E"
+     REQUIRED_UTILS="sudo $REQUIRED_UTILS"
+ fi
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch b/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
new file mode 100644
index 000000000..3dce74cf3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
@@ -0,0 +1,31 @@
+From cea511762d429af0678d8a72d5b2bd7f88a8b112 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 18:55:26 -0400
+Subject: [PATCH] there is no rhyme or reason to travis
+
+---
+ deps.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index 8a267b1..339d66a 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -90,7 +90,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
+@@ -133,7 +133,7 @@ function install_ubireader
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-    $SUDO pip install $PACKAGE
++    $SUDO pip3 install $PACKAGE
+ }
+ 
+ function find_path
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch b/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
new file mode 100644
index 000000000..2e4f948da
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
@@ -0,0 +1,56 @@
+From 607de90eadcfde9798f3c99ba6fcfc243b24f661 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 19:05:02 -0400
+Subject: [PATCH] try to preserve the python being used across sudo
+
+---
+ deps.sh | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index 339d66a..f44d410 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -62,6 +62,7 @@ fi
+ PYTHON3_APT_CANDIDATES=""
+ PYTHON3_YUM_CANDIDATES=""
+ YUM_CANDIDATES="git gcc gcc-c++ make openssl-devel qtwebkit-devel qt-devel gzip bzip2 tar arj p7zip p7zip-plugins cabextract squashfs-tools zlib zlib-devel lzo lzo-devel xz xz-compat-libs xz-libs xz-devel xz-lzma-compat python-backports-lzma lzip pyliblzma perl-Compress-Raw-Lzma lzop srecord"
++PYTHON="$(which python3)"
+ 
+ # Check for root privileges
+ if [ $UID -eq 0 ]
+@@ -76,7 +77,7 @@ fi
+ function install_yaffshiv
+ {
+     git clone https://github.com/devttys0/yaffshiv
+-    (cd yaffshiv && $SUDO python3 setup.py install)
++    (cd yaffshiv && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+@@ -90,7 +91,7 @@ function install_sasquatch
+ function install_jefferson
+ {
+     git clone https://github.com/sviehb/jefferson
+-    (cd jefferson && $SUDO pip3 install -r requirements.txt && $SUDO python3 setup.py install)
++    (cd jefferson && $SUDO $PYTHON -mpip install -r requirements.txt && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf jefferson
+ }
+ 
+@@ -126,14 +127,14 @@ function install_cramfstools
+ function install_ubireader
+ {
+     git clone https://github.com/jrspruitt/ubi_reader
+-    (cd ubi_reader && $SUDO python3 setup.py install)
++    (cd ubi_reader && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
+ 
+ function install_pip_package
+ {
+     PACKAGE="$1"
+-    $SUDO pip3 install $PACKAGE
++    $SUDO $PYTHON -mpip install $PACKAGE
+ }
+ 
+ function find_path
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch b/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
new file mode 100644
index 000000000..240a4a27b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
@@ -0,0 +1,31 @@
+From fefa77456c6152af4ea6a218471ba2abc006fc44 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 19:10:41 -0400
+Subject: [PATCH] nop
+
+---
+ .travis.yml | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/.travis.yml b/.travis.yml
+index 90f3cfa..8b7410a 100644
+--- a/.travis.yml
++++ b/.travis.yml
+@@ -6,11 +6,13 @@ addons:
+   apt:
+     update: true
+ install:
++  - export PYTHON=$(which python3)
+   - ./deps.sh --yes
+-  - pip install coverage
+-  - ./setup.py install
+-script: ./setup.py test
+-cache: pip
++  - sudo -E $PYTHON -mpip install coverage
++  - sudo -E $PYTHON ./setup.py install
++script:
++  - export PYTHON=$(which python3)
++  - sudo -E $PYTHON ./setup.py test
+ jobs:
+   include:
+    - stage: test
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch b/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
new file mode 100644
index 000000000..5a17a9f18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
@@ -0,0 +1,56 @@
+From a80d8d7c06bcefc8833caf85259d2ff0e23027ac Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Wed, 24 Mar 2021 21:28:37 -0400
+Subject: [PATCH] sasquatch patch was merged
+
+---
+ deps.sh | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/deps.sh b/deps.sh
+index f44d410..cbd821c 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -76,21 +76,21 @@ fi
+ 
+ function install_yaffshiv
+ {
+-    git clone https://github.com/devttys0/yaffshiv
++    git clone --quiet --depth 1 --branch "master" https://github.com/devttys0/yaffshiv
+     (cd yaffshiv && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf yaffshiv
+ }
+ 
+ function install_sasquatch
+ {
+-    git clone --quiet --depth 1 --branch "patch-1" https://github.com/eacmen/sasquatch
++    git clone --quiet --depth 1 --branch "master" https://github.com/devttys0/sasquatch
+     (cd sasquatch && $SUDO ./build.sh)
+     $SUDO rm -rf sasquatch
+ }
+ 
+ function install_jefferson
+ {
+-    git clone https://github.com/sviehb/jefferson
++    git clone --quiet --depth 1 --branch "master" https://github.com/sviehb/jefferson
+     (cd jefferson && $SUDO $PYTHON -mpip install -r requirements.txt && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf jefferson
+ }
+@@ -113,7 +113,7 @@ function install_cramfstools
+   INSTALL_LOCATION=/usr/local/bin
+ 
+   # https://github.com/torvalds/linux/blob/master/fs/cramfs/README#L106
+-  git clone https://github.com/npitre/cramfs-tools
++  git clone --quiet --depth 1 --branch "master" https://github.com/npitre/cramfs-tools
+   # There is no "make install"
+   (cd cramfs-tools \
+   && make \
+@@ -126,7 +126,7 @@ function install_cramfstools
+ 
+ function install_ubireader
+ {
+-    git clone https://github.com/jrspruitt/ubi_reader
++    git clone --quiet --depth 1 --branch "master" https://github.com/jrspruitt/ubi_reader
+     (cd ubi_reader && $SUDO $PYTHON setup.py install)
+     $SUDO rm -rf ubi_reader
+ }
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch b/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
new file mode 100644
index 000000000..778ed04c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
@@ -0,0 +1,27 @@
+From 0b75c20c9e34d478538a8903f827be6932de6e71 Mon Sep 17 00:00:00 2001
+From: Peter Eacmen <peacmen@refirmlabs.com>
+Date: Sun, 28 Mar 2021 22:22:31 -0400
+Subject: [PATCH] add third party NOTICE markdown
+
+---
+ NOTICE.md | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+ create mode 100644 NOTICE.md
+
+diff --git a/NOTICE.md b/NOTICE.md
+new file mode 100644
+index 0000000..4602d9e
+--- /dev/null
++++ b/NOTICE.md
+@@ -0,0 +1,11 @@
++# File with code "borrowed from" the Python programming language
++
++
++Copyright (c) 2002 Lars Gustaebel <lars@gustaebel.de>
++All rights reserved.
++
++Permission  is  hereby granted,  free  of charge,  to  any person obtaining a  copy of  this software  and associated documentation files  (the  "Software"),  to   deal  in  the  Software   without restriction,  including  without limitation  the  rights to  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies  of  the  Software,  and to  permit  persons  to  whom the Software  is  furnished  to  do  so,  subject  to  the  following conditions:
++
++The above copyright  notice and this  permission notice shall  be included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS  IS", WITHOUT WARRANTY OF ANY  KIND, EXPRESS OR IMPLIED, INCLUDING  BUT NOT LIMITED TO  THE WARRANTIES OF  MERCHANTABILITY,  FITNESS   FOR  A  PARTICULAR   PURPOSE  AND NONINFRINGEMENT.  IN  NO  EVENT SHALL  THE  AUTHORS  OR COPYRIGHT HOLDERS  BE LIABLE  FOR ANY  CLAIM, DAMAGES  OR OTHER  LIABILITY, WHETHER  IN AN  ACTION OF  CONTRACT, TORT  OR OTHERWISE,  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch b/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
new file mode 100644
index 000000000..977664127
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
@@ -0,0 +1,220 @@
+From 8126fe51336ab2e7068a060e4307595a75d385dd Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 18 Jun 2021 04:20:59 -0700
+Subject: [PATCH] Removed sensitive keys
+
+---
+ src/binwalk/plugins/pgp.py | 204 -------------------------------------
+ 1 file changed, 204 deletions(-)
+ delete mode 100644 src/binwalk/plugins/pgp.py
+
+diff --git a/src/binwalk/plugins/pgp.py b/src/binwalk/plugins/pgp.py
+deleted file mode 100644
+index f38ee2f..0000000
+--- a/src/binwalk/plugins/pgp.py
++++ /dev/null
+@@ -1,204 +0,0 @@
+-#!/usr/bin/env python
+-
+-import errno
+-import shutil
+-import tempfile
+-import binwalk.core.plugin
+-import binwalk.core.compat
+-import binwalk.core.common
+-try:
+-    # Requires the python-gnupg library
+-    from gnupg import GPG
+-except ImportError as e:
+-    GPG = None
+-
+-
+-class PgpDecryptor(binwalk.core.plugin.Plugin):
+-
+-    '''
+-    Plugin to decrypt, validate, and extract PGP encrypted firmware.
+-    '''
+-    MODULES = ["Signature"]
+-
+-    EDDA2E82EDC7030C_KEY = """-----BEGIN PGP PRIVATE KEY BLOCK-----
+-
+-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
+-=c6nn
+------END PGP PRIVATE KEY BLOCK-----"""
+-
+-    F18B47DF3F881C75_KEY = """-----BEGIN PGP PRIVATE KEY BLOCK-----
+-
+-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
+-=UtFV
+------END PGP PRIVATE KEY BLOCK-----"""
+-
+-    EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION = "PGP RSA encrypted session key - keyid: EDDA2E82 EDC7030C RSA".lower()
+-
+-    F18B47DF3F881C75_SIGNATURE_DESCRIPTION = "PGP RSA encrypted session key - keyid: F18B47DF 3F881C75 RSA".lower()
+-
+-    def init(self):
+-        if GPG is None:
+-            self.enabled = False
+-        else:
+-            self.enabled = True
+-
+-        if self.enabled is True and self.module.extractor.enabled is True:
+-            # Add extraction rules for encrypted PGP firmware signature
+-            # results
+-            self.module.extractor.add_rule(txtrule=None,
+-                regex="^%s" % self.EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION,
+-                extension="gpg",
+-                cmd=self._decrypt_and_extract_EDDA2E82EDC7030C)
+-            self.module.extractor.add_rule(txtrule=None,
+-                regex="^%s" % self.F18B47DF3F881C75_SIGNATURE_DESCRIPTION,
+-                extension="gpg",
+-                cmd=self._decrypt_and_extract_F18B47DF3F881C75)
+-
+-    def _decrypt_and_extract_EDDA2E82EDC7030C(self, fname):
+-        return self._decrypt_and_extract(fname, self.EDDA2E82EDC7030C_KEY)
+-
+-    def _decrypt_and_extract_F18B47DF3F881C75(self, fname):
+-        return self._decrypt_and_extract(fname, self.F18B47DF3F881C75_KEY)
+-
+-    def _decrypt_and_extract(self, fname, key):
+-        '''
+-        This does the extraction (e.g., it decrypts the image and writes it to a new file on disk).
+-        '''
+-        with open(fname, "rb") as fp_in:
+-            encrypted_data = fp_in.read()
+-
+-            decrypted_data = self._pgp_decrypt(encrypted_data, key)
+-
+-            with open(binwalk.core.common.unique_file_name(fname[:-4], "dec"), "wb") as fp_out:
+-                fp_out.write(decrypted_data)
+-        return True
+-
+-    def _pgp_decrypt(self, encrypted_firmware, key):
+-        '''
+-        This does the actual decryption.
+-        '''
+-        try:
+-            tmp_dir = tempfile.mkdtemp()
+-            gpg = GPG(gnupghome=tmp_dir)
+-            gpg.import_keys(key)
+-            decrypted_data = gpg.decrypt(encrypted_firmware)
+-        finally:
+-            try:
+-                shutil.rmtree(tmp_dir)
+-            except OSError as exc:
+-                if exc.errno != errno.ENOENT:
+-                    raise
+-
+-        return bytes(decrypted_data.data)
+-
+-    def scan(self, result):
+-        '''
+-        Validate signature results.
+-        '''
+-        if result.valid is True:
+-            if result.description.lower().startswith(self.EDDA2E82EDC7030C_SIGNATURE_DESCRIPTION) is True:
+-                result.description += ", Verizon BHR4 <eu@greenwavereality.com>"
+-            elif result.description.lower().startswith(self.F18B47DF3F881C75_SIGNATURE_DESCRIPTION) is True:
+-                result.description += ", Verizon BHR4 <eu@greenwavesystems.com>"
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch b/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
new file mode 100644
index 000000000..ecb34e8de
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
@@ -0,0 +1,124 @@
+From ab45eaac867ee2d9c7eafb7175bdf60a5b958f1c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 9 Aug 2021 05:52:04 -0700
+Subject: [PATCH] Removed hilink decryption plugin; contains priprietary crypto
+ key(s).
+
+---
+ src/binwalk/config/extract.conf |  1 -
+ src/binwalk/plugins/hilink.py   | 94 ---------------------------------
+ 2 files changed, 95 deletions(-)
+ delete mode 100644 src/binwalk/plugins/hilink.py
+
+diff --git a/src/binwalk/config/extract.conf b/src/binwalk/config/extract.conf
+index 5b54f72..f64ba34 100644
+--- a/src/binwalk/config/extract.conf
++++ b/src/binwalk/config/extract.conf
+@@ -14,7 +14,6 @@
+ #   o zlib
+ #   o cpio
+ #   o Raw LZMA/deflate streams
+-#   o Hilink encrypted uImage firmware
+ #   o D-Link "ROMFSv9.0" file systems
+ #
+ # There are also alternative extractors for the following file formats, implemented as plugins:
+diff --git a/src/binwalk/plugins/hilink.py b/src/binwalk/plugins/hilink.py
+deleted file mode 100644
+index 581a530..0000000
+--- a/src/binwalk/plugins/hilink.py
++++ /dev/null
+@@ -1,94 +0,0 @@
+-#!/usr/bin/env python
+-
+-import struct
+-import string
+-import binwalk.core.plugin
+-import binwalk.core.compat
+-import binwalk.core.common
+-try:
+-    # Requires the pycrypto library
+-    from Crypto.Cipher import DES
+-except ImportError as e:
+-    DES = None
+-
+-
+-class HilinkDecryptor(binwalk.core.plugin.Plugin):
+-
+-    '''
+-    Plugin to decrypt, validate, and extract Hilink encrypted firmware.
+-    '''
+-    MODULES = ["Signature"]
+-
+-    DES_KEY = "H@L9K*(3"
+-    SIGNATURE_DESCRIPTION = "Encrypted Hilink uImage firmware".lower()
+-
+-    def init(self):
+-        if DES is None:
+-            self.enabled = False
+-        else:
+-            self.enabled = True
+-
+-        if self.enabled is True and self.module.extractor.enabled is True:
+-            # Add an extraction rule for encrypted Hilink firmware signature
+-            # results
+-            self.module.extractor.add_rule(regex="^%s" % self.SIGNATURE_DESCRIPTION,
+-                extension="enc",
+-                cmd=self._decrypt_and_extract)
+-
+-    def _decrypt_and_extract(self, fname):
+-        '''
+-        This does the extraction (e.g., it decrypts the image and writes it to a new file on disk).
+-        '''
+-        with open(fname, "r") as fp_in:
+-            encrypted_data = fp_in.read()
+-
+-            decrypted_data = self._hilink_decrypt(encrypted_data)
+-
+-            with open(binwalk.core.common.unique_file_name(fname[:-4], "dec"), "w") as fp_out:
+-                fp_out.write(decrypted_data)
+-
+-    def _hilink_decrypt(self, encrypted_firmware):
+-        '''
+-        This does the actual decryption.
+-        '''
+-        cipher = DES.new(self.DES_KEY, DES.MODE_ECB)
+-
+-        p1 = encrypted_firmware[0:3]
+-        p2 = encrypted_firmware[3:]
+-        p2 += b"\x00" * (8 - (len(p2) % 8))
+-
+-        d1 = p1 + cipher.decrypt(p2)
+-        d1 += b"\x00" * (8 - (len(d1) % 8))
+-
+-        return cipher.decrypt(d1)
+-
+-    def scan(self, result):
+-        '''
+-        Validate signature results.
+-        '''
+-        if self.enabled is True:
+-            if result.valid is True:
+-                if result.description.lower().startswith(self.SIGNATURE_DESCRIPTION) is True:
+-                    # Read in the first 64 bytes of the suspected encrypted
+-                    # uImage header
+-                    fd = self.module.config.open_file(result.file.path, offset=result.offset)
+-                    encrypted_header_data = binwalk.core.compat.str2bytes(fd.read(64))
+-                    fd.close()
+-
+-                    # Decrypt the header
+-                    decrypted_header_data = self._hilink_decrypt(encrypted_header_data)
+-
+-                    # Pull out the image size and image name fields from the decrypted uImage header
+-                    # and add them to the printed description.
+-                    result.size = struct.unpack(b">L", decrypted_header_data[12:16])[0]
+-                    result.description += ", size: %d" % (result.size)
+-                    # NOTE: The description field should be 32 bytes? Hilink seems to use only 24 bytes for this field,
+-                    #       even though the header size is still 64 bytes?
+-                    result.description += ', image name: "%s"' % binwalk.core.compat.bytes2str(decrypted_header_data[32:56]).strip("\x00")
+-
+-                    # Do some basic validation on the decrypted size and image
+-                    # name fields
+-                    if result.size > (result.file.size - result.offset):
+-                        result.valid = False
+-                    if not all(c in string.printable for c in result.description):
+-                        result.valid = False
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch b/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
new file mode 100644
index 000000000..62ac19412
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
@@ -0,0 +1,22 @@
+From 5d6124fc533f82b7b1e35b898e6891334421983e Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 16 Aug 2021 06:56:07 -0700
+Subject: [PATCH] Updated version number for release
+
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index b747b4d..9b9f6cd 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@ except ImportError:
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+-MODULE_VERSION = "2.2.1"
++MODULE_VERSION = "2.3.2"
+ SCRIPT_NAME = MODULE_NAME
+ MODULE_DIRECTORY = os.path.dirname(os.path.realpath(__file__))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch b/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
new file mode 100644
index 000000000..712f603f7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
@@ -0,0 +1,97 @@
+From 9c73e26826f55337650d3aeb82fcde98bd2a0e0f Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Wed, 1 Sep 2021 07:10:37 -0700
+Subject: [PATCH] Initial low-priv execution implementation
+
+---
+ src/binwalk/modules/extractor.py | 34 ++++++++++++++++++++++++++++----
+ 1 file changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 6194f5c..346f0fb 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -4,6 +4,7 @@
+ 
+ import os
+ import re
++import pwd
+ import stat
+ import shlex
+ import tempfile
+@@ -47,6 +48,9 @@ class Extractor(Module):
+     # squashfs-root-0).
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
++    # Unprivileged user account to execute external extraction utilities
++    UNPRIVILEGED_USER_NAME = 'binwalksafe'
++
+     TITLE = 'Extraction'
+     ORDER = 9
+     PRIMARY = False
+@@ -121,6 +125,10 @@ class Extractor(Module):
+     ]
+ 
+     def load(self):
++        user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
++        self.unpriv_uid = user_info.pw_uid
++        self.unpriv_gid = user_info.pw_gid
++
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+         self.extract_rules = []
+@@ -534,6 +542,9 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
++        # Make sure unpriv user can access this directory
++        os.chown(output_directory, self.unpriv_uid, self.unpriv_gid)
++
+         return output_directory
+ 
+     def cleanup_extracted_files(self, tf=None):
+@@ -826,6 +837,9 @@ class Extractor(Module):
+             # Cleanup
+             fdout.close()
+             fdin.close()
++
++            # Make sure unprivileged user can access this file
++            os.chown(fname, self.unpriv_uid, self.unpriv_gid)
+         except KeyboardInterrupt as e:
+             raise e
+         except Exception as e:
+@@ -873,8 +887,7 @@ class Extractor(Module):
+                 # Generate unique file paths for all paths in the current
+                 # command that are surrounded by UNIQUE_PATH_DELIMITER
+                 while self.UNIQUE_PATH_DELIMITER in cmd:
+-                    need_unique_path = cmd.split(self.UNIQUE_PATH_DELIMITER)[
+-                        1].split(self.UNIQUE_PATH_DELIMITER)[0]
++                    need_unique_path = cmd.split(self.UNIQUE_PATH_DELIMITER)[1].split(self.UNIQUE_PATH_DELIMITER)[0]
+                     unique_path = binwalk.core.common.unique_file_name(need_unique_path)
+                     cmd = cmd.replace(self.UNIQUE_PATH_DELIMITER + need_unique_path + self.UNIQUE_PATH_DELIMITER, unique_path)
+ 
+@@ -885,9 +898,22 @@ class Extractor(Module):
+                     # command with fname
+                     command = command.strip().replace(self.FILE_NAME_PLACEHOLDER, fname)
+ 
+-                    binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+-                    rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++                    # Fork a child to drop privs
++                    child_pid = os.fork()
++                    if child_pid is 0:
++                        # Switch to unprivileged user
++                        binwalk.core.common.debug("Dropping privileges to user '%s'" % self.UNPRIVILEGED_USER_NAME)
++                        os.setgid(self.unpriv_uid)
++                        os.setuid(self.unpriv_gid)
++
++                        # Execute external extractor
++                        binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
++                        rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++                        sys.exit(rval)
++                    else:
++                        rval = os.wait()
+ 
++                    # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+                     else:
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch b/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
new file mode 100644
index 000000000..a3b14d0ef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
@@ -0,0 +1,152 @@
+From 568457d330af625804da28f01716d52d54994b9d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Wed, 1 Sep 2021 08:51:09 -0700
+Subject: [PATCH] Added option to turn off privilege dropping
+
+---
+ src/binwalk/modules/extractor.py | 82 +++++++++++++++++++++-----------
+ 1 file changed, 54 insertions(+), 28 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 346f0fb..361b041 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -11,6 +11,7 @@ import tempfile
+ import subprocess
+ import binwalk.core.common
+ from binwalk.core.compat import *
++from binwalk.core.exceptions import ModuleException
+ from binwalk.core.module import Module, Option, Kwarg
+ from binwalk.core.common import file_size, file_md5, unique_file_name, BlockFile
+ 
+@@ -49,7 +50,7 @@ class Extractor(Module):
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
+     # Unprivileged user account to execute external extraction utilities
+-    UNPRIVILEGED_USER_NAME = 'binwalksafe'
++    UNPRIVILEGED_USER_NAME = 'binwalk_safe_user_69'
+ 
+     TITLE = 'Extraction'
+     ORDER = 9
+@@ -108,6 +109,10 @@ class Extractor(Module):
+                long='subdirs',
+                kwargs={'extract_into_subdirs': True},
+                description="Extract into sub-directories named by the offset"),
++        Option(short='0',
++               long='unsafe',
++               kwargs={'unsafe_extraction': True},
++               description="Execute external extractions without dropping privileges"),
+     ]
+ 
+     KWARGS = [
+@@ -122,12 +127,25 @@ class Extractor(Module):
+         Kwarg(name='manual_rules', default=[]),
+         Kwarg(name='matryoshka', default=0),
+         Kwarg(name='enabled', default=False),
++        Kwarg(name='unsafe_extraction', default=False),
+     ]
+ 
+     def load(self):
+-        user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
+-        self.unpriv_uid = user_info.pw_uid
+-        self.unpriv_gid = user_info.pw_gid
++        self.unpriv_uid = None
++        self.unpriv_gid = None
++
++        if self.enabled is True and self.unsafe_extraction is False:
++            if os.getuid() != 0:
++                raise ModuleException("Binwalk requires root privileges to safely execute external extraction utilities as an unprivileged user.")
++
++            self.shell_call('useradd %s' % self.UNPRIVILEGED_USER_NAME)
++
++            user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
++            self.unpriv_uid = user_info.pw_uid
++            self.unpriv_gid = user_info.pw_gid
++        else:
++            self.unpriv_uid = os.getuid()
++            self.unpriv_gid = os.getgid()
+ 
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+@@ -860,7 +878,6 @@ class Extractor(Module):
+ 
+         Returns True on success, False on failure, or None if the external extraction utility could not be found.
+         '''
+-        tmp = None
+         rval = 0
+         retval = True
+         command_list = []
+@@ -879,11 +896,6 @@ class Extractor(Module):
+                     retval = False
+                     binwalk.core.common.warning("Internal extractor '%s' failed with exception: '%s'" % (str(cmd), str(e)))
+             elif cmd:
+-                # If not in debug mode, create a temporary file to redirect
+-                # stdout and stderr to
+-                if not binwalk.core.common.DEBUG:
+-                    tmp = tempfile.TemporaryFile()
+-
+                 # Generate unique file paths for all paths in the current
+                 # command that are surrounded by UNIQUE_PATH_DELIMITER
+                 while self.UNIQUE_PATH_DELIMITER in cmd:
+@@ -898,21 +910,9 @@ class Extractor(Module):
+                     # command with fname
+                     command = command.strip().replace(self.FILE_NAME_PLACEHOLDER, fname)
+ 
+-                    # Fork a child to drop privs
+-                    child_pid = os.fork()
+-                    if child_pid is 0:
+-                        # Switch to unprivileged user
+-                        binwalk.core.common.debug("Dropping privileges to user '%s'" % self.UNPRIVILEGED_USER_NAME)
+-                        os.setgid(self.unpriv_uid)
+-                        os.setuid(self.unpriv_gid)
+-
+-                        # Execute external extractor
+-                        binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+-                        rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+-                        sys.exit(rval)
+-                    else:
+-                        rval = os.wait()
+-
++                    # Execute external extractor
++                    rval = self.shell_call(command)
++                    
+                     # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+@@ -935,7 +935,33 @@ class Extractor(Module):
+             binwalk.core.common.warning("Extractor.execute failed to run external extractor '%s': %s, '%s' might not be installed correctly" % (str(cmd), str(e), str(cmd)))
+             retval = None
+ 
+-        if tmp is not None:
+-            tmp.close()
+-
+         return (retval, '&&'.join(command_list))
++
++    def shell_call(self, command):
++        # Fork a child to drop privs
++        child_pid = os.fork()
++        if child_pid is 0:
++            # Switch to unprivileged user, if one has been set
++            if self.unpriv_uid is not None and self.unpriv_gid is not None:
++                binwalk.core.common.debug("Dropping privileges to %d:%d" % (self.unpriv_uid, self.unpriv_gid))
++                os.setgid(self.unpriv_uid)
++                os.setuid(self.unpriv_gid)
++
++            # If not in debug mode, create a temporary file to redirect
++            # stdout and stderr to
++            if not binwalk.core.common.DEBUG:
++                tmp = tempfile.TemporaryFile()
++            else:
++                tmp = None
++
++            # Execute command
++            binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
++            rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
++
++            # Clean up temp file
++            if tmp is not None:
++                tmp.close()
++
++            sys.exit(rval)
++        else:
++            return os.wait()[1]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch b/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
new file mode 100644
index 000000000..14df0397f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
@@ -0,0 +1,139 @@
+From c34f1932702fd16f39aa0f0b2156848d3e297ae5 Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 3 Sep 2021 09:03:34 -0700
+Subject: [PATCH] Added option for specifying a user to run external extraction
+ utilties as
+
+---
+ src/binwalk/modules/extractor.py | 70 +++++++++++++++-----------------
+ 1 file changed, 32 insertions(+), 38 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 361b041..da96b78 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -92,6 +92,11 @@ class Extractor(Module):
+                type=int,
+                kwargs={'max_count': 0},
+                description='Limit the number of extracted files'),
++        Option(short='0',
++               long='run-as',
++               type=str,
++               kwargs={'runas_user': 0},
++               description="Execute external extraction utilities with the specified user's privileges"),
+         #Option(short='u',
+         #       long='limit',
+         #       type=int,
+@@ -109,10 +114,6 @@ class Extractor(Module):
+                long='subdirs',
+                kwargs={'extract_into_subdirs': True},
+                description="Extract into sub-directories named by the offset"),
+-        Option(short='0',
+-               long='unsafe',
+-               kwargs={'unsafe_extraction': True},
+-               description="Execute external extractions without dropping privileges"),
+     ]
+ 
+     KWARGS = [
+@@ -127,25 +128,24 @@ class Extractor(Module):
+         Kwarg(name='manual_rules', default=[]),
+         Kwarg(name='matryoshka', default=0),
+         Kwarg(name='enabled', default=False),
+-        Kwarg(name='unsafe_extraction', default=False),
++        Kwarg(name='runas_user', default=None),
+     ]
+ 
+     def load(self):
+-        self.unpriv_uid = None
+-        self.unpriv_gid = None
+-
+-        if self.enabled is True and self.unsafe_extraction is False:
+-            if os.getuid() != 0:
+-                raise ModuleException("Binwalk requires root privileges to safely execute external extraction utilities as an unprivileged user.")
+-
+-            self.shell_call('useradd %s' % self.UNPRIVILEGED_USER_NAME)
+-
+-            user_info = pwd.getpwnam(self.UNPRIVILEGED_USER_NAME)
+-            self.unpriv_uid = user_info.pw_uid
+-            self.unpriv_gid = user_info.pw_gid
+-        else:
+-            self.unpriv_uid = os.getuid()
+-            self.unpriv_gid = os.getgid()
++        self.runas_uid = None
++        self.runas_gid = None
++
++        if self.enabled is True:
++            if self.runas_user is None:
++                if os.getuid() == 0:
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=<user name>.")
++            
++                self.runas_uid = os.getuid()
++                self.runas_gid = os.getgid()
++            else:
++                user_info = pwd.getpwnam(self.runas_user)
++                self.runas_uid = user_info.pw_uid
++                self.runas_gid = user_info.pw_gid
+ 
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+@@ -560,8 +560,8 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
+-        # Make sure unpriv user can access this directory
+-        os.chown(output_directory, self.unpriv_uid, self.unpriv_gid)
++        # Make sure runas user can access this directory
++        os.chown(output_directory, self.runas_uid, self.runas_gid)
+ 
+         return output_directory
+ 
+@@ -856,8 +856,8 @@ class Extractor(Module):
+             fdout.close()
+             fdin.close()
+ 
+-            # Make sure unprivileged user can access this file
+-            os.chown(fname, self.unpriv_uid, self.unpriv_gid)
++            # Make sure runasileged user can access this file
++            os.chown(fname, self.runas_uid, self.runas_gid)
+         except KeyboardInterrupt as e:
+             raise e
+         except Exception as e:
+@@ -938,19 +938,17 @@ class Extractor(Module):
+         return (retval, '&&'.join(command_list))
+ 
+     def shell_call(self, command):
+-        # Fork a child to drop privs
+         child_pid = os.fork()
+         if child_pid is 0:
+-            # Switch to unprivileged user, if one has been set
+-            if self.unpriv_uid is not None and self.unpriv_gid is not None:
+-                binwalk.core.common.debug("Dropping privileges to %d:%d" % (self.unpriv_uid, self.unpriv_gid))
+-                os.setgid(self.unpriv_uid)
+-                os.setuid(self.unpriv_gid)
+-
+-            # If not in debug mode, create a temporary file to redirect
+-            # stdout and stderr to
++            # Switch to the run-as user privileges, if one has been set
++            if self.runas_uid is not None and self.runas_gid is not None:
++                binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
++                os.setgid(self.runas_uid)
++                os.setuid(self.runas_gid)
++
++            # If not in debug mode, redirect output to /dev/null
+             if not binwalk.core.common.DEBUG:
+-                tmp = tempfile.TemporaryFile()
++                tmp = subprocess.DEVNULL
+             else:
+                 tmp = None
+ 
+@@ -958,10 +956,6 @@ class Extractor(Module):
+             binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+             rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+ 
+-            # Clean up temp file
+-            if tmp is not None:
+-                tmp.close()
+-
+             sys.exit(rval)
+         else:
+             return os.wait()[1]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch b/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
new file mode 100644
index 000000000..36e1db6c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
@@ -0,0 +1,82 @@
+From a097ccf2476cb1db0a0621da6aaf368593d1b5cf Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Fri, 3 Sep 2021 09:52:30 -0700
+Subject: [PATCH] Initial symlink 'repair' solution
+
+---
+ src/binwalk/modules/extractor.py | 51 +++++++++++++++++++-------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index da96b78..917559b 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -174,8 +174,8 @@ class Extractor(Module):
+             self.config.verbose = True
+ 
+     def add_pending(self, f):
+-        # Ignore symlinks
+-        if os.path.islink(f):
++        # Ignore symlinks, don't add new files unless recursion was requested
++        if os.path.islink(f) or not self.matryoshka:
+             return
+ 
+         # Get the file mode to check and see if it's a block/char device
+@@ -286,25 +286,27 @@ class Extractor(Module):
+ 
+                     # If recursion was specified, and the file is not the same
+                     # one we just dd'd
+-                    if (self.matryoshka and
+-                        file_path != dd_file_path and
+-                        scan_extracted_files and
+-                            self.directory in real_file_path):
+-                        # If the recursion level of this file is less than or
+-                        # equal to our desired recursion level
+-                        if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
+-                            # If this is a directory and we are supposed to process directories for this extractor,
+-                            # then add all files under that directory to the
+-                            # list of pending files.
+-                            if os.path.isdir(file_path):
+-                                for root, dirs, files in os.walk(file_path):
+-                                    for f in files:
+-                                        full_path = os.path.join(root, f)
+-                                        self.add_pending(full_path)
+-                            # If it's just a file, it to the list of pending
+-                            # files
+-                            else:
+-                                self.add_pending(file_path)
++                    if file_path != dd_file_path:
++                        # If this is a directory and we are supposed to process directories for this extractor,
++                        # then add all files under that directory to the
++                        # list of pending files.
++                        if os.path.isdir(file_path):
++                            for root, dirs, files in os.walk(file_path):
++                                for f in files:
++                                    full_path = os.path.join(root, f)
++                                    
++                                    if os.path.islink(full_path):
++                                        self.symlink_repair(full_path)
++
++                                    # If the recursion level of this file is less than or equal to our desired recursion level
++                                    if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
++                                        if scan_extracted_files and self.directory in real_file_path:
++                                                self.add_pending(full_path)
++
++                        # If it's just a file, it to the list of pending
++                        # files
++                        elif scan_extracted_files and self.directory in real_file_path:
++                            self.add_pending(file_path)
+ 
+                 # Update the last directory listing for the next time we
+                 # extract a file to this same output directory
+@@ -959,3 +961,10 @@ class Extractor(Module):
+             sys.exit(rval)
+         else:
+             return os.wait()[1]
++
++    def symlink_repair(self, symlink):
++        linktarget = os.path.realpath(symlink)
++        if not linktarget.startswith(self.directory):
++            os.remove(symlink)
++            os.symlink(os.devnull, symlink)
++            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s" % (symlink, linktarget))
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch b/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
new file mode 100644
index 000000000..9d5c53fce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
@@ -0,0 +1,61 @@
+From 803cdb11f46077af07ac5e9a4912b42adcb9ddfb Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 06:54:33 -0700
+Subject: [PATCH] Added code comments and better error output for end user
+
+---
+ src/binwalk/modules/extractor.py | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 917559b..962ad32 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -137,16 +137,26 @@ class Extractor(Module):
+ 
+         if self.enabled is True:
+             if self.runas_user is None:
+-                if os.getuid() == 0:
+-                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=<user name>.")
++                # Get some info about the current user we're running under
++                user_info = pwd.getpwuid(os.getuid())
++
++                # Don't run as root, unless explicitly instructed to
++                if user_info.pw_uid == 0:
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=%s (binwalk itself must be run as root)." % user_info.pw_name)
+             
+-                self.runas_uid = os.getuid()
+-                self.runas_gid = os.getgid()
++                # Run external applications as the current user 
++                self.runas_uid = user_info.pw_uid
++                self.runas_gid = user_info.pw_gid
+             else:
++                # Run external applications as the specified user
+                 user_info = pwd.getpwnam(self.runas_user)
+                 self.runas_uid = user_info.pw_uid
+                 self.runas_gid = user_info.pw_gid
+ 
++                # Make sure we'll have permissions to switch to the different user
++                if self.runas_uid != os.getuid() and os.getuid() != 0:
++                    raise ModuleException("In order to execute third party applications as %s, binwalk must be run with root privileges." % self.runas_user)
++
+         # Holds a list of extraction rules loaded either from a file or when
+         # manually specified.
+         self.extract_rules = []
+@@ -858,7 +868,7 @@ class Extractor(Module):
+             fdout.close()
+             fdin.close()
+ 
+-            # Make sure runasileged user can access this file
++            # Make sure run-as user can access this file
+             os.chown(fname, self.runas_uid, self.runas_gid)
+         except KeyboardInterrupt as e:
+             raise e
+@@ -965,6 +975,6 @@ class Extractor(Module):
+     def symlink_repair(self, symlink):
+         linktarget = os.path.realpath(symlink)
+         if not linktarget.startswith(self.directory):
++            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; for security, changing link target to %s." % (symlink, linktarget, os.devnull))
+             os.remove(symlink)
+             os.symlink(os.devnull, symlink)
+-            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s" % (symlink, linktarget))
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch b/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
new file mode 100644
index 000000000..f0d0ce88a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
@@ -0,0 +1,70 @@
+From f2c1f93a69e9ea756dbe87c7b79a58959ab2151d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 07:44:16 -0700
+Subject: [PATCH] Bug fixes, code testing
+
+---
+ src/binwalk/modules/extractor.py | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 962ad32..8b3e622 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -142,7 +142,7 @@ class Extractor(Module):
+ 
+                 # Don't run as root, unless explicitly instructed to
+                 if user_info.pw_uid == 0:
+-                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure.\nIf you wish to have extraction utilities executed as the current user, use --run-as=%s (binwalk itself must be run as root)." % user_info.pw_name)
++                    raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure. If you wish to have extraction utilities executed as the current user, use '--run-as=%s' (binwalk itself must be run as root)." % user_info.pw_name)
+             
+                 # Run external applications as the current user 
+                 self.runas_uid = user_info.pw_uid
+@@ -297,16 +297,19 @@ class Extractor(Module):
+                     # If recursion was specified, and the file is not the same
+                     # one we just dd'd
+                     if file_path != dd_file_path:
++                        # Symlinks can cause security issues if they point outside the extraction directory.
++                        self.symlink_sanitizer(file_path)
++
+                         # If this is a directory and we are supposed to process directories for this extractor,
+                         # then add all files under that directory to the
+                         # list of pending files.
+                         if os.path.isdir(file_path):
+                             for root, dirs, files in os.walk(file_path):
++                                # Symlinks can cause security issues if they point outside the extraction directory.
++                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files])
++
+                                 for f in files:
+                                     full_path = os.path.join(root, f)
+-                                    
+-                                    if os.path.islink(full_path):
+-                                        self.symlink_repair(full_path)
+ 
+                                     # If the recursion level of this file is less than or equal to our desired recursion level
+                                     if len(real_file_path.split(self.directory)[1].split(os.path.sep)) <= self.matryoshka:
+@@ -972,9 +975,18 @@ class Extractor(Module):
+         else:
+             return os.wait()[1]
+ 
+-    def symlink_repair(self, symlink):
+-        linktarget = os.path.realpath(symlink)
+-        if not linktarget.startswith(self.directory):
+-            binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; for security, changing link target to %s." % (symlink, linktarget, os.devnull))
+-            os.remove(symlink)
+-            os.symlink(os.devnull, symlink)
++    def symlink_sanitizer(self, file_list):
++        # Allows either a single file path, or a list of file paths to be passed in for sanitization.
++        if type(file_list) is not list:
++            file_list = [file_list]
++        
++        # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
++        for file_name in file_list:
++            if os.path.islink(file_name):
++                linktarget = os.path.realpath(file_name)
++                binwalk.core.common.debug("Analysing symlink: %s -> %s" % (file_name, linktarget))
++
++                if not linktarget.startswith(self.directory) and linktarget != os.devnull:
++                    binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; changing link target to %s for security purposes." % (file_name, linktarget, os.devnull))
++                    os.remove(file_name)
++                    os.symlink(os.devnull, file_name)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch b/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
new file mode 100644
index 000000000..5e897ce42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
@@ -0,0 +1,71 @@
+From d2739fdf6fcd48dce41f394474240cc3372e339f Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:20:55 -0700
+Subject: [PATCH] Code cleanup
+
+---
+ src/binwalk/modules/extractor.py | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 8b3e622..97174eb 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -49,9 +49,6 @@ class Extractor(Module):
+     # squashfs-root-0).
+     UNIQUE_PATH_DELIMITER = '%%'
+ 
+-    # Unprivileged user account to execute external extraction utilities
+-    UNPRIVILEGED_USER_NAME = 'binwalk_safe_user_69'
+-
+     TITLE = 'Extraction'
+     ORDER = 9
+     PRIMARY = False
+@@ -143,8 +140,8 @@ class Extractor(Module):
+                 # Don't run as root, unless explicitly instructed to
+                 if user_info.pw_uid == 0:
+                     raise ModuleException("Binwalk extraction uses many third party utilities, which may not be secure. If you wish to have extraction utilities executed as the current user, use '--run-as=%s' (binwalk itself must be run as root)." % user_info.pw_name)
+-            
+-                # Run external applications as the current user 
++
++                # Run external applications as the current user
+                 self.runas_uid = user_info.pw_uid
+                 self.runas_gid = user_info.pw_gid
+             else:
+@@ -323,8 +320,7 @@ class Extractor(Module):
+ 
+                 # Update the last directory listing for the next time we
+                 # extract a file to this same output directory
+-                self.last_directory_listing[
+-                    extraction_directory] = directory_listing
++                self.last_directory_listing[extraction_directory] = directory_listing
+ 
+     def append_rule(self, r):
+         self.extract_rules.append(r.copy())
+@@ -575,7 +571,7 @@ class Extractor(Module):
+         else:
+             output_directory = self.extraction_directories[path]
+ 
+-        # Make sure runas user can access this directory
++        # Make sure run-as user can access this directory
+         os.chown(output_directory, self.runas_uid, self.runas_gid)
+ 
+         return output_directory
+@@ -927,7 +923,7 @@ class Extractor(Module):
+ 
+                     # Execute external extractor
+                     rval = self.shell_call(command)
+-                    
++
+                     # Check the return value to see if extraction was successful or not
+                     if rval in codes:
+                         retval = True
+@@ -979,7 +975,7 @@ class Extractor(Module):
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
+-        
++
+         # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
+         for file_name in file_list:
+             if os.path.islink(file_name):
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch b/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
new file mode 100644
index 000000000..5e4fa88ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
@@ -0,0 +1,2579 @@
+From 290947c6d0b01259dfaa7d5dda7bef93a0e3fe6d Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:43:19 -0700
+Subject: [PATCH] Added directory traversal test; fixed zip test.
+
+---
+ testing/tests/input-vectors/dirtraversal.tar | Bin 0 -> 276480 bytes
+ testing/tests/test_dirtraversal.py           |  31 +++++++++++++++++++
+ testing/tests/test_firmware_zip.py           |   2 --
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+ create mode 100644 testing/tests/input-vectors/dirtraversal.tar
+ create mode 100644 testing/tests/test_dirtraversal.py
+
+diff --git a/testing/tests/input-vectors/dirtraversal.tar b/testing/tests/input-vectors/dirtraversal.tar
+new file mode 100644
+index 0000000000000000000000000000000000000000..6b2c306dff7beede3dd3c0fb105eb48f7d225a66
+GIT binary patch
+literal 276480
+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%0D|)qyh`L2ktS#0
+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
+zb1Mt(c7aM<pjn(gO#{u%0A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
+
+literal 0
+HcmV?d00001
+
+diff --git a/testing/tests/test_dirtraversal.py b/testing/tests/test_dirtraversal.py
+new file mode 100644
+index 0000000..dc371d5
+--- /dev/null
++++ b/testing/tests/test_dirtraversal.py
+@@ -0,0 +1,31 @@
++import os
++import binwalk
++from nose.tools import eq_, ok_
++
++def test_dirtraversal():
++    '''
++    Test: Open dirtraversal.tar, scan for signatures.
++    Verify that dangerous symlinks have been sanitized.
++    '''
++    bad_symlink_file_list = ['foo', 'bar', 'foo2', 'bar2']
++    good_symlink_file_list = ['README_link', 'README2_link']
++
++    input_vector_file = os.path.join(os.path.dirname(__file__),
++                                     "input-vectors",
++                                     "dirtraversal.tar")
++
++    scan_result = binwalk.scan(input_vector_file,
++                               signature=True,
++                               extract=True,
++                               quiet=True)
++
++    # Test number of modules used
++    eq_(len(scan_result), 1)
++
++    # Make sure the bad symlinks have been sanitized and the
++    # good symlinks have not been sanitized.
++    for result in scan_result[0].results:
++        if result.file.name in bad_symlink_file_list:
++            assert_equal(os.path.realpath(result.file.path), os.devnull)
++        elif result.file.name in good_symlink_file_list:
++            assert_not_equal(os.path.realpath(result.file.path), os.devnull)
+diff --git a/testing/tests/test_firmware_zip.py b/testing/tests/test_firmware_zip.py
+index 69d1133..58b486c 100644
+--- a/testing/tests/test_firmware_zip.py
++++ b/testing/tests/test_firmware_zip.py
+@@ -10,8 +10,6 @@ def test_firmware_zip():
+     '''
+     expected_results = [
+ 	[0, 'Zip archive data, at least v1.0 to extract, name: dir655_revB_FW_203NA/'],
+-	[51, 'Zip archive data, at least v2.0 to extract, compressed size: 6395868, uncompressed size: 6422554, name: dir655_revB_FW_203NA/DIR655B1_FW203NAB02.bin'],
+-	[6395993, 'Zip archive data, at least v2.0 to extract, compressed size: 14243, uncompressed size: 61440, name: dir655_revB_FW_203NA/dir655_revB_release_notes_203NA.doc'],
+ 	[6410581, 'End of Zip archive, footer length: 22'],
+ 
+     ]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch b/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
new file mode 100644
index 000000000..548722c27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
@@ -0,0 +1,45 @@
+From 874e94f8bd6817847f6761069fad960df25d9f6c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Sun, 5 Sep 2021 08:54:51 -0700
+Subject: [PATCH] Updated README.md to include extraction security notice.
+
+---
+ README.md | 7 +++++++
+ setup.py  | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/README.md b/README.md
+index 55190b7..cba5c4c 100644
+--- a/README.md
++++ b/README.md
+@@ -7,10 +7,17 @@
+ 
+ Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extracting firmware images.
+ 
++
++### *** Extraction Security Notice ***
++
++Prior to Binwalk v2.3.3, extracted archives could create symlinks which point anywhere on the file system, potentially resulting in a directory traversal attack if subsequent extraction utilties blindly follow these symlinks. More generically, Binwalk makes use of many third-party extraction utilties which may have unpatched security issues; Binwalk v2.3.3 and later allows external extraction tools to be run as an unprivileged user using the `run-as` command line option (this requires Binwalk itself to be run with root privileges). Additionally, Binwalk v2.3.3 and later will refuse to perform extraction as root unless `--run-as=root` is specified.
++
++
+ ### *** Python 2.7 Deprecation Notice ***
+ 
+ Even though many major Linux distros are still shipping Python 2.7 as the default interpreter in their currently stable release, we are making the difficult decision to move binwalk support exclusively to Python 3. This is likely to make many upset and others rejoice. If you need to install binwalk into a Python 2.7 environment we will be creating a tag `python27` that will be a snapshot of `master` before all of these major changes are made. Thank you for being patient with us through this transition process.
+ 
++
+ ### Installation and Usage
+ 
+ * [Installation](./INSTALL.md)
+diff --git a/setup.py b/setup.py
+index 9b9f6cd..1c6a555 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@ except ImportError:
+ from distutils.dir_util import remove_tree
+ 
+ MODULE_NAME = "binwalk"
+-MODULE_VERSION = "2.3.2"
++MODULE_VERSION = "2.3.3"
+ SCRIPT_NAME = MODULE_NAME
+ MODULE_DIRECTORY = os.path.dirname(os.path.realpath(__file__))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch b/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
new file mode 100644
index 000000000..dde7317e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
@@ -0,0 +1,152 @@
+From 7ae9f43efb1c4428c57184c732bc8bb575a911f9 Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 6 Sep 2021 07:27:43 -0700
+Subject: [PATCH] Fixed dirtraversal test; updated extractor to not fork unless
+ necessary (nose tests don't like sys.exit)
+
+---
+ src/binwalk/modules/extractor.py   | 52 +++++++++++++++++++-----------
+ testing/tests/test_dirtraversal.py | 26 ++++++++-------
+ 2 files changed, 47 insertions(+), 31 deletions(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 97174eb..11eab0d 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -295,7 +295,7 @@ class Extractor(Module):
+                     # one we just dd'd
+                     if file_path != dd_file_path:
+                         # Symlinks can cause security issues if they point outside the extraction directory.
+-                        self.symlink_sanitizer(file_path)
++                        self.symlink_sanitizer(file_path, extraction_directory)
+ 
+                         # If this is a directory and we are supposed to process directories for this extractor,
+                         # then add all files under that directory to the
+@@ -303,7 +303,7 @@ class Extractor(Module):
+                         if os.path.isdir(file_path):
+                             for root, dirs, files in os.walk(file_path):
+                                 # Symlinks can cause security issues if they point outside the extraction directory.
+-                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files])
++                                self.symlink_sanitizer([os.path.join(root, x) for x in dirs+files], extraction_directory)
+ 
+                                 for f in files:
+                                     full_path = os.path.join(root, f)
+@@ -949,29 +949,43 @@ class Extractor(Module):
+         return (retval, '&&'.join(command_list))
+ 
+     def shell_call(self, command):
+-        child_pid = os.fork()
+-        if child_pid is 0:
+-            # Switch to the run-as user privileges, if one has been set
+-            if self.runas_uid is not None and self.runas_gid is not None:
+-                binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
+-                os.setgid(self.runas_uid)
+-                os.setuid(self.runas_gid)
+-
+-            # If not in debug mode, redirect output to /dev/null
+-            if not binwalk.core.common.DEBUG:
+-                tmp = subprocess.DEVNULL
+-            else:
+-                tmp = None
+-
+-            # Execute command
++        # If not in debug mode, redirect output to /dev/null
++        if not binwalk.core.common.DEBUG:
++            tmp = subprocess.DEVNULL
++        else:
++            tmp = None
++
++        # If a run-as user is not the current user, we'll need to switch privileges to that user account
++        if self.runas_uid != os.getuid():
++            binwalk.core.common.debug("Switching privileges to %s (%d:%d)" % (self.runas_user, self.runas_uid, self.runas_gid))
++            
++            # Fork a child process
++            child_pid = os.fork()
++            if child_pid is 0:
++                # Switch to the run-as user privileges, if one has been set
++                if self.runas_uid is not None and self.runas_gid is not None:
++                    os.setgid(self.runas_uid)
++                    os.setuid(self.runas_gid)
++        else:
++            # child_pid of None indicates that no os.fork() occured
++            child_pid = None
++            
++        # If we're the child, or there was no os.fork(), execute the command
++        if child_pid in [0, None]:
+             binwalk.core.common.debug("subprocess.call(%s, stdout=%s, stderr=%s)" % (command, str(tmp), str(tmp)))
+             rval = subprocess.call(shlex.split(command), stdout=tmp, stderr=tmp)
+ 
++        # A true child process should exit with the subprocess exit value
++        if child_pid is 0:
+             sys.exit(rval)
++        # If no os.fork() happened, just return the subprocess exit value
++        elif child_pid is None:
++            return rval
++        # Else, os.fork() happened and we're the parent. Wait and return the child's exit value.
+         else:
+             return os.wait()[1]
+ 
+-    def symlink_sanitizer(self, file_list):
++    def symlink_sanitizer(self, file_list, extraction_directory):
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
+@@ -982,7 +996,7 @@ class Extractor(Module):
+                 linktarget = os.path.realpath(file_name)
+                 binwalk.core.common.debug("Analysing symlink: %s -> %s" % (file_name, linktarget))
+ 
+-                if not linktarget.startswith(self.directory) and linktarget != os.devnull:
++                if not linktarget.startswith(extraction_directory) and linktarget != os.devnull:
+                     binwalk.core.common.warning("Symlink points outside of the extraction directory: %s -> %s; changing link target to %s for security purposes." % (file_name, linktarget, os.devnull))
+                     os.remove(file_name)
+                     os.symlink(os.devnull, file_name)
+diff --git a/testing/tests/test_dirtraversal.py b/testing/tests/test_dirtraversal.py
+index dc371d5..66ef003 100644
+--- a/testing/tests/test_dirtraversal.py
++++ b/testing/tests/test_dirtraversal.py
+@@ -1,31 +1,33 @@
+ import os
+ import binwalk
+-from nose.tools import eq_, ok_
++from nose.tools import eq_, ok_, assert_equal, assert_not_equal
+ 
+ def test_dirtraversal():
+     '''
+     Test: Open dirtraversal.tar, scan for signatures.
+     Verify that dangerous symlinks have been sanitized.
+     '''
+-    bad_symlink_file_list = ['foo', 'bar', 'foo2', 'bar2']
+-    good_symlink_file_list = ['README_link', 'README2_link']
++    bad_symlink_file_list = ['foo', 'bar', 'subdir/foo2', 'subdir/bar2']
++    good_symlink_file_list = ['subdir/README_link', 'README2_link']
+ 
+     input_vector_file = os.path.join(os.path.dirname(__file__),
+                                      "input-vectors",
+                                      "dirtraversal.tar")
+ 
++    output_directory = os.path.join(os.path.dirname(__file__),
++                                    "input-vectors",
++                                    "_dirtraversal.tar.extracted")
++
+     scan_result = binwalk.scan(input_vector_file,
+                                signature=True,
+                                extract=True,
+-                               quiet=True)
+-
+-    # Test number of modules used
+-    eq_(len(scan_result), 1)
++                               quiet=True)[0]
+ 
+     # Make sure the bad symlinks have been sanitized and the
+     # good symlinks have not been sanitized.
+-    for result in scan_result[0].results:
+-        if result.file.name in bad_symlink_file_list:
+-            assert_equal(os.path.realpath(result.file.path), os.devnull)
+-        elif result.file.name in good_symlink_file_list:
+-            assert_not_equal(os.path.realpath(result.file.path), os.devnull)
++    for symlink in bad_symlink_file_list:
++        linktarget = os.path.realpath(os.path.join(output_directory, symlink))
++        assert_equal(linktarget, os.devnull)
++    for symlink in good_symlink_file_list:
++        linktarget = os.path.realpath(os.path.join(output_directory, symlink))
++        assert_not_equal(linktarget, os.devnull)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch b/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
new file mode 100644
index 000000000..c850b4e8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
@@ -0,0 +1,22 @@
+From 9af20734f6dd1443b1fdee5e91a29463486ee16c Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Mon, 6 Sep 2021 09:23:23 -0700
+Subject: [PATCH] Fixed code comment
+
+---
+ src/binwalk/modules/extractor.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 11eab0d..4c2aa02 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -990,7 +990,7 @@ class Extractor(Module):
+         if type(file_list) is not list:
+             file_list = [file_list]
+ 
+-        # Sanitize any files in the list that are symlinks outside of the self.directory extraction directory.
++        # Sanitize any files in the list that are symlinks outside of the specified extraction directory.
+         for file_name in file_list:
+             if os.path.islink(file_name):
+                 linktarget = os.path.realpath(file_name)
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch b/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
new file mode 100644
index 000000000..b459707a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
@@ -0,0 +1,43 @@
+From 90aaa25b506e2139a48e60e212c6755fac3410af Mon Sep 17 00:00:00 2001
+From: devttys0 <cheffner@refirmlabs.com>
+Date: Tue, 7 Sep 2021 06:55:17 -0700
+Subject: [PATCH] Added option to disable symlink sanitization if desired
+
+---
+ src/binwalk/modules/extractor.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/binwalk/modules/extractor.py b/src/binwalk/modules/extractor.py
+index 4c2aa02..4e4660a 100644
+--- a/src/binwalk/modules/extractor.py
++++ b/src/binwalk/modules/extractor.py
+@@ -99,6 +99,10 @@ class Extractor(Module):
+         #       type=int,
+         #       kwargs={'recursive_max_size': 0},
+         #       description="Limit the total size of all extracted files"),
++        Option(short='1',
++               long='preserve-symlinks',
++               kwargs={'do_not_sanitize_symlinks': True},
++               description="Do not sanitize extracted symlinks that point outside the extraction directory (dangerous)"),
+         Option(short='r',
+                long='rm',
+                kwargs={'remove_after_execute': True},
+@@ -118,6 +122,7 @@ class Extractor(Module):
+         Kwarg(name='recursive_max_size', default=None),
+         Kwarg(name='max_count', default=None),
+         Kwarg(name='base_directory', default=None),
++        Kwarg(name='do_not_sanitize_symlinks', default=False),
+         Kwarg(name='remove_after_execute', default=False),
+         Kwarg(name='load_default_rules', default=False),
+         Kwarg(name='run_extractors', default=True),
+@@ -986,6 +991,10 @@ class Extractor(Module):
+             return os.wait()[1]
+ 
+     def symlink_sanitizer(self, file_list, extraction_directory):
++        # User can disable this if desired
++        if self.do_not_sanitize_symlinks is True:
++            return 
++
+         # Allows either a single file path, or a list of file paths to be passed in for sanitization.
+         if type(file_list) is not list:
+             file_list = [file_list]
diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
similarity index 17%
rename from meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-binwalk_27.bb
index 1a55a3e4a..f4234dc88 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
@@ -6,9 +6,47 @@ HOMEPAGE = "https://github.com/ReFirmLabs/binwalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65bbee055d3ea3bfc475f07aecf4de64"
 
-SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
+SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master \
+           file://0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch \
+           file://0002-Remove-python-2.7-from-CI-testing.patch \
+           file://0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch \
+           file://0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch \
+           file://0005-Actually-implement-exponent-and-shift-operators.patch \
+           file://0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch \
+           file://0007-initial-Dockerfile-along-with-changes-required-for-s.patch \
+           file://0008-implement-multi-stage-build-and-test-stage-include-D.patch \
+           file://0009-fix-travis-script.patch \
+           file://0010-still-no-love-for-travis.patch \
+           file://0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch \
+           file://0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch \
+           file://0013-Ubuntu-Focal-is-Python-3-by-default.patch \
+           file://0014-fail-deps.sh-if-any-install-command-fails.patch \
+           file://0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch \
+           file://0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch \
+           file://0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch \
+           file://0018-there-is-no-rhyme-or-reason-to-travis.patch \
+           file://0019-try-to-preserve-the-python-being-used-across-sudo.patch \
+           file://0020-nop.patch \
+           file://0021-sasquatch-patch-was-merged.patch \
+           file://0022-add-third-party-NOTICE-markdown.patch \
+           file://0023-Removed-sensitive-keys.patch \
+           file://0024-Removed-hilink-decryption-plugin-contains-priprietar.patch \
+           file://0025-Updated-version-number-for-release.patch \
+           file://0026-Initial-low-priv-execution-implementation.patch \
+           file://0027-Added-option-to-turn-off-privilege-dropping.patch \
+           file://0028-Added-option-for-specifying-a-user-to-run-external-e.patch \
+           file://0029-Initial-symlink-repair-solution.patch \
+           file://0030-Added-code-comments-and-better-error-output-for-end-.patch \
+           file://0031-Bug-fixes-code-testing.patch \
+           file://0032-Code-cleanup.patch \
+           file://0033-Added-directory-traversal-test-fixed-zip-test.patch \
+           file://0034-Updated-README.md-to-include-extraction-security-not.patch \
+           file://0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch \
+           file://0036-Fixed-code-comment.patch \
+           file://0037-Added-option-to-disable-symlink-sanitization-if-desi.patch \
+           "
 
-SRCREV = "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
+SRCREV = "750635d9114f8e2886d99e3b7379712f72072dd9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============2679779896673164235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12618 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:096e8b900f38cdbcb8e4fc7d933c9d7747826e62"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:096e8b900f38cdbcb8e4fc7d933c9d7747826e62"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:096e8b900f38cdbcb8e4fc7d933c9d7747826e62"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 252 Local 23 Mirrors 219 Missed 10 Current 139 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running task 1053 of 1346 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_fetch)
NOTE: recipe python3-binwalk-27-r0: task do_fetch: Started
NOTE: recipe python3-binwalk-27-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 1346 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_unpack)
NOTE: Running task 1331 of 1346 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-binwalk-27-r0: task do_unpack: Started
NOTE: recipe python3-binwalk-27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-binwalk-27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-binwalk-27-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 1346 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch)
NOTE: Running task 1333 of 1346 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_collect_spdx_deps)
NOTE: recipe python3-binwalk-27-r0: task do_patch: Started
NOTE: recipe python3-binwalk-27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-binwalk-27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-binwalk-27-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1333 tasks of which 1328 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-binwalk-27-r0 do_patch: Applying patch '0033-Added-directory-traversal-test-fixed-zip-test.patch' on target directory '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-binwalk/27-r0/git'
CmdError('quilt --quiltrc /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-binwalk/27-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0033-Added-directory-traversal-test-fixed-zip-test.patch
File testing/tests/input-vectors/dirtraversal.tar: git binary diffs are not supported.
patching file testing/tests/test_dirtraversal.py
patching file testing/tests/test_firmware_zip.py
Patch 0033-Added-directory-traversal-test-fixed-zip-test.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-binwalk/27-r0/temp/log.do_patch.454752
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch) failed with exit code '1'

--===============2679779896673164235==--

