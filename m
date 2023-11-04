Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9124C3DA6E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2205.1699061894870868941
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yxb8InTo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mSOekcE8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b97fb0b48-f2865354-1354-4b07-9f0b-779a0e731a1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vhC+C+9M6H3lB9OUyeHmSeCBkFb4ElYf4RZ2g1aBMa4=;
	b=Yxb8InTo9zcV1z0E/SJJtYOX0ZAfPf2+zv+Zy79Sfg5TkAnFc5L6OdN14SWh5TRN
	Ejn2AtbZg86SQO+ynDxdk+dM2WEI3Xzx4AGjkTCzXBLRXDnT2plrClUDFBu0ftPaZne
	czAFckxbyxijura2mv7dvFEfgGFYZEBMaZQUBZCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vhC+C+9M6H3lB9OUyeHmSeCBkFb4ElYf4RZ2g1aBMa4=;
	b=mSOekcE8eTbfjZKLD6tO7FxcRfTnCcPZPZEfNUeEIjKM5G4NSpk2hZftyY01hg6X
	CwfkgyJAoSKDkwhQtHUtBofht2HMHt6zlZ2dnefuKsrMhCGaWqiwncTwBTvg3aOkFDv
	HOE28TrDLHb37paaspBkUr1N6gG61EZcI5/vxx6o=
Content-Type: multipart/mixed; boundary="===============8254768403365547186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-binwalk: upgrading to 27 FAILED
Message-ID: <0101018b97fb0b48-f2865354-1354-4b07-9f0b-779a0e731a1b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106114

--===============8254768403365547186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-binwalk* to *27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-binwalk-upgrade-2.3.4-27.patch
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
From 24d473a9f519fce4745d0954d4a49b0cbd032dc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:13:00 +0000
Subject: [PATCH] python3-binwalk: upgrade 2.3.4 -> 27

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
 ...038-Remove-unstuff-from-dependencies.patch |   70 +
 ...th-traversal-in-PFS-extractor-script.patch |   24 +
 ...binwalk_2.3.4.bb => python3-binwalk_27.bb} |   44 +-
 40 files changed, 5327 insertions(+), 2 deletions(-)
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
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0038-Remove-unstuff-from-dependencies.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk/0039-fix-path-traversal-in-PFS-extractor-script.patch
 rename meta-python/recipes-devtools/python/{python3-binwalk_2.3.4.bb => python3-binwalk_27.bb} (17%)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
new file mode 100644
index 000000000..3b99fcb7a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0001-deps-Fix-install-on-newer-ubuntu-distros-and-drop-py.patch
@@ -0,0 +1,215 @@
+From 269b566ddc0eca5660557a60a98f57f9ab7b0de4 Mon Sep 17 00:00:00 2001
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
index 000000000..369099060
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0002-Remove-python-2.7-from-CI-testing.patch
@@ -0,0 +1,21 @@
+From b566d3f8c439a8a63c08d63ec46317f847a60602 Mon Sep 17 00:00:00 2001
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
index 000000000..9fbbdd240
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0003-reduce-test-matrix-to-distros-under-LTS-and-python-v.patch
@@ -0,0 +1,50 @@
+From 5060efab343d3c671056c9c86c962f8f35ed6888 Mon Sep 17 00:00:00 2001
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
index 000000000..4074cc469
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0004-Travis-will-not-apply-test-matrix-to-dist-keyword-ex.patch
@@ -0,0 +1,60 @@
+From a94a7a298d852d36decffaf35740b45fed9abcf0 Mon Sep 17 00:00:00 2001
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
index 000000000..378c1d7c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0005-Actually-implement-exponent-and-shift-operators.patch
@@ -0,0 +1,38 @@
+From ea355d31c529203319fb02e25776862469235530 Mon Sep 17 00:00:00 2001
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
index 000000000..d7ca305d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0006-Update-INSTALL.md-based-on-modern-realities-with-pyt.patch
@@ -0,0 +1,107 @@
+From 3c5a7f3fb632f3c47863e2cd2aa426e206fd1418 Mon Sep 17 00:00:00 2001
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
index 000000000..a4ceb38aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0007-initial-Dockerfile-along-with-changes-required-for-s.patch
@@ -0,0 +1,137 @@
+From eca8b57f2a4f4c3fd96c3f9af704acd006781f5a Mon Sep 17 00:00:00 2001
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
index 000000000..c71f7ec39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0008-implement-multi-stage-build-and-test-stage-include-D.patch
@@ -0,0 +1,158 @@
+From 2e38ec2193973f58dae36458ea20d04a26d60bf9 Mon Sep 17 00:00:00 2001
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
index 000000000..70bef0a03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0009-fix-travis-script.patch
@@ -0,0 +1,50 @@
+From 3fee03a4e3f56ce6443ab65ba2e2f4bf5395a290 Mon Sep 17 00:00:00 2001
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
index 000000000..edb0b23ad
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0010-still-no-love-for-travis.patch
@@ -0,0 +1,25 @@
+From 1c4dc974a963d697131300032617b5014045f62f Mon Sep 17 00:00:00 2001
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
index 000000000..b8e7f4ca5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0011-transition-to-use-of-cryptodome-since-pycrypto-is-EO.patch
@@ -0,0 +1,22 @@
+From 872a64b00859980b507888fa9b6ad6a2ebf580d5 Mon Sep 17 00:00:00 2001
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
index 000000000..a1ac46948
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0012-Call-unzip-with-empty-password-to-avoid-unzip-stuck-.patch
@@ -0,0 +1,23 @@
+From fb10d3ca530be6c15c605de9da1c10e1e25f7a78 Mon Sep 17 00:00:00 2001
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
index 000000000..aafa0d58c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0013-Ubuntu-Focal-is-Python-3-by-default.patch
@@ -0,0 +1,24 @@
+From 5d3a3776463fb7b8361ef218478be929d9b8ad56 Mon Sep 17 00:00:00 2001
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
index 000000000..619a483ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0014-fail-deps.sh-if-any-install-command-fails.patch
@@ -0,0 +1,51 @@
+From e30f80dfda34d0845dd5edc58ffcfcf27b84b82d Mon Sep 17 00:00:00 2001
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
index 000000000..2e382d801
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0015-we-no-longer-need-to-bifurcate-python3-and-python2-d.patch
@@ -0,0 +1,63 @@
+From 8a2e786affb071843f1a808b084d5e09e6f0039f Mon Sep 17 00:00:00 2001
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
index 000000000..b2a8dc1e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0016-using-pip3-is-causing-issues-use-whatever-pip-the-us.patch
@@ -0,0 +1,44 @@
+From dcb40801aee8be06a391db83d3057c00c3efd864 Mon Sep 17 00:00:00 2001
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
index 000000000..726672323
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0017-Travis-CI-does-not-preserve-the-specified-python-whe.patch
@@ -0,0 +1,23 @@
+From e040cd82631a62ce5fe2cbc5f330f6fe2f0c76a4 Mon Sep 17 00:00:00 2001
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
index 000000000..d7b6c325c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0018-there-is-no-rhyme-or-reason-to-travis.patch
@@ -0,0 +1,31 @@
+From 4d69f01da8519d58ba0713aa12c837ef423c604d Mon Sep 17 00:00:00 2001
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
index 000000000..80f1b3bcd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0019-try-to-preserve-the-python-being-used-across-sudo.patch
@@ -0,0 +1,56 @@
+From 815942bcaad93b16369be2e70e61eb6feed211b4 Mon Sep 17 00:00:00 2001
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
index 000000000..c67ac20c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0020-nop.patch
@@ -0,0 +1,31 @@
+From 846dc0ec0ee0b1526416dc2c7336e0ccc3ac87a6 Mon Sep 17 00:00:00 2001
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
index 000000000..02c3e0d55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0021-sasquatch-patch-was-merged.patch
@@ -0,0 +1,56 @@
+From b6f7935e632fc0cd71a567e48b0e8204bad70378 Mon Sep 17 00:00:00 2001
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
index 000000000..c15c17d3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0022-add-third-party-NOTICE-markdown.patch
@@ -0,0 +1,27 @@
+From 141f74eea9eb4f699b152e4e0e8a7d6bdf302997 Mon Sep 17 00:00:00 2001
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
index 000000000..b06441553
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0023-Removed-sensitive-keys.patch
@@ -0,0 +1,220 @@
+From ffdf56c89ab5d03905199ed04f129c2ad15d8f0d Mon Sep 17 00:00:00 2001
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
index 000000000..263c05b2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0024-Removed-hilink-decryption-plugin-contains-priprietar.patch
@@ -0,0 +1,124 @@
+From c4f595b61f051543e880017b7159b5e50a97831a Mon Sep 17 00:00:00 2001
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
index 000000000..2e8399123
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0025-Updated-version-number-for-release.patch
@@ -0,0 +1,22 @@
+From a9fdb5fb62372c5814d8fe64326ba799969974a1 Mon Sep 17 00:00:00 2001
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
index 000000000..e43e90531
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0026-Initial-low-priv-execution-implementation.patch
@@ -0,0 +1,97 @@
+From d2484b30a1bfa6af60262f9ba687757e749f30ec Mon Sep 17 00:00:00 2001
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
index 000000000..cde70437f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0027-Added-option-to-turn-off-privilege-dropping.patch
@@ -0,0 +1,152 @@
+From 64516591763f2570fc5356449218a99903b53a48 Mon Sep 17 00:00:00 2001
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
index 000000000..1fd8ce723
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0028-Added-option-for-specifying-a-user-to-run-external-e.patch
@@ -0,0 +1,139 @@
+From 18c02d7aca30c8f77cb371c62d1089911007084b Mon Sep 17 00:00:00 2001
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
index 000000000..0f0ca3404
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0029-Initial-symlink-repair-solution.patch
@@ -0,0 +1,82 @@
+From 7b5ae494207cc6b5aed367db98ef6870a8da2a3f Mon Sep 17 00:00:00 2001
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
index 000000000..2e603086d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0030-Added-code-comments-and-better-error-output-for-end-.patch
@@ -0,0 +1,61 @@
+From bae0968d71cecc9f0b9bcb3d9d5c68d46f816ca5 Mon Sep 17 00:00:00 2001
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
index 000000000..b23820d86
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0031-Bug-fixes-code-testing.patch
@@ -0,0 +1,70 @@
+From feee6bd6fb676a43b4a971421410e26faede1b57 Mon Sep 17 00:00:00 2001
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
index 000000000..79cad1c05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0032-Code-cleanup.patch
@@ -0,0 +1,71 @@
+From 6c045997eb475c5ccce9f8445a09b91217122836 Mon Sep 17 00:00:00 2001
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
index 000000000..805ca9125
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0033-Added-directory-traversal-test-fixed-zip-test.patch
@@ -0,0 +1,2579 @@
+From 685e0c6d99ef7f370735a24923d800088b66fadb Mon Sep 17 00:00:00 2001
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
index 000000000..3344e33b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0034-Updated-README.md-to-include-extraction-security-not.patch
@@ -0,0 +1,45 @@
+From 5fef2877cd97cd74904841b0a130020ebf7372da Mon Sep 17 00:00:00 2001
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
index 000000000..87f42c725
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0035-Fixed-dirtraversal-test-updated-extractor-to-not-for.patch
@@ -0,0 +1,152 @@
+From b9a46207d7750ef94f8e6c8cc190f46d1f54dffc Mon Sep 17 00:00:00 2001
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
index 000000000..b092b8150
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0036-Fixed-code-comment.patch
@@ -0,0 +1,22 @@
+From 64a52c59fa9077ab8634bd99b9ee814663573321 Mon Sep 17 00:00:00 2001
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
index 000000000..de2f46521
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0037-Added-option-to-disable-symlink-sanitization-if-desi.patch
@@ -0,0 +1,43 @@
+From 5a9bdf32e3f882c7a2ca90e503e568e734f26565 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0038-Remove-unstuff-from-dependencies.patch b/meta-python/recipes-devtools/python/python3-binwalk/0038-Remove-unstuff-from-dependencies.patch
new file mode 100644
index 000000000..df6ecbe30
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0038-Remove-unstuff-from-dependencies.patch
@@ -0,0 +1,70 @@
+From 39c5d9b2ce789f732f25d9c6ea77e952525e84cc Mon Sep 17 00:00:00 2001
+From: Eric Owle <ericowle@microsoft.com>
+Date: Tue, 20 Sep 2022 11:44:20 -0400
+Subject: [PATCH] Remove unstuff from dependencies
+
+---
+ INSTALL.md                      |  6 ------
+ deps.sh                         | 12 ------------
+ src/binwalk/config/extract.conf |  1 -
+ 3 files changed, 19 deletions(-)
+
+diff --git a/INSTALL.md b/INSTALL.md
+index a14e8c4..0f0c91c 100644
+--- a/INSTALL.md
++++ b/INSTALL.md
+@@ -79,12 +79,6 @@ $ git clone https://github.com/devttys0/yaffshiv
+ $ (cd yaffshiv && sudo python setup.py install)
+ ```
+ 
+-```bash
+-# Install unstuff (closed source) to extract StuffIt archive files
+-$ wget -O - http://downloads.tuxfamily.org/sdtraces/stuffit520.611linux-i386.tar.gz | tar -zxv
+-$ sudo cp bin/unstuff /usr/local/bin/
+-```
+-
+ Note that for Debian/Ubuntu users, all of the above dependencies can be installed automatically using the included `deps.sh` script:
+ 
+ ```bash
+diff --git a/deps.sh b/deps.sh
+index cbd821c..5a8a098 100755
+--- a/deps.sh
++++ b/deps.sh
+@@ -95,17 +95,6 @@ function install_jefferson
+     $SUDO rm -rf jefferson
+ }
+ 
+-function install_unstuff
+-{
+-    mkdir -p /tmp/unstuff
+-    cd /tmp/unstuff
+-
+-    wget -O - http://downloads.tuxfamily.org/sdtraces/stuffit520.611linux-i386.tar.gz | tar -zxv
+-    $SUDO cp bin/unstuff /usr/local/bin/
+-    cd -
+-    rm -rf /tmp/unstuff
+-}
+-
+ function install_cramfstools
+ {
+   # Downloads cramfs tools from sourceforge and installs them to $INSTALL_LOCATION
+@@ -251,7 +240,6 @@ install_pip_package "setuptools matplotlib capstone pycryptodome gnupg tk"
+ install_sasquatch
+ install_yaffshiv
+ install_jefferson
+-install_unstuff
+ install_ubireader
+ 
+ if [ $distro_version = "18" ]
+diff --git a/src/binwalk/config/extract.conf b/src/binwalk/config/extract.conf
+index f64ba34..c0c60c9 100644
+--- a/src/binwalk/config/extract.conf
++++ b/src/binwalk/config/extract.conf
+@@ -37,7 +37,6 @@
+ ^lha:lha:lha efi '%e'
+ ^iso 9660:iso:7z x '%e' -oiso-root
+ ^microsoft cabinet archive:cab:cabextract '%e'
+-^stuffit:sit:unstuff '%e'
+ ^osx dmg:dmg:7z x '%e'
+ ^lzo compressed data:lzo:lzop -f -d '%e'
+ ^intel hex:hex:srec_cat '%e' -Intel -Output '%e.bin' -Binary
diff --git a/meta-python/recipes-devtools/python/python3-binwalk/0039-fix-path-traversal-in-PFS-extractor-script.patch b/meta-python/recipes-devtools/python/python3-binwalk/0039-fix-path-traversal-in-PFS-extractor-script.patch
new file mode 100644
index 000000000..c719e377c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk/0039-fix-path-traversal-in-PFS-extractor-script.patch
@@ -0,0 +1,24 @@
+From f338104b9480e7a16156d5e9fbb586fa1ea42d30 Mon Sep 17 00:00:00 2001
+From: Quentin Kaiser <quentin.kaiser@onekey.com>
+Date: Wed, 26 Oct 2022 21:25:01 +0200
+Subject: [PATCH] fix path traversal in PFS extractor script.
+
+os.path.join does not fully resolve a path so the condition that follows
+will never be true. Fixed by resolving the path using os.path.abspath.
+---
+ src/binwalk/plugins/unpfs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/binwalk/plugins/unpfs.py b/src/binwalk/plugins/unpfs.py
+index 9513c8b..b93e0da 100644
+--- a/src/binwalk/plugins/unpfs.py
++++ b/src/binwalk/plugins/unpfs.py
+@@ -104,7 +104,7 @@ class PFSExtractor(binwalk.core.plugin.Plugin):
+                 data = binwalk.core.common.BlockFile(fname, 'rb')
+                 data.seek(fs.get_end_of_meta_data())
+                 for entry in fs.entries():
+-                    outfile_path = os.path.join(out_dir, entry.fname)
++                    outfile_path = os.path.abspath(os.path.join(out_dir, entry.fname))
+                     if not outfile_path.startswith(out_dir):
+                         binwalk.core.common.warning("Unpfs extractor detected directory traversal attempt for file: '%s'. Refusing to extract." % outfile_path)
+                     else:
diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
similarity index 17%
rename from meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
rename to meta-python/recipes-devtools/python/python3-binwalk_27.bb
index 0b7d97fcc..c6e2f2394 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_27.bb
@@ -6,9 +6,49 @@ HOMEPAGE = "https://github.com/ReFirmLabs/binwalk"
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
+           file://0038-Remove-unstuff-from-dependencies.patch \
+           file://0039-fix-path-traversal-in-PFS-extractor-script.patch \
+           "
 
-SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
+SRCREV = "750635d9114f8e2886d99e3b7379712f72072dd9"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8254768403365547186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4910 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:a5cae6c41d6708210ee4911b36370bdb6a895b3b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 352 Local 341 Mirrors 0 Missed 11 Current 280 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 292 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_recipe_qa_setscene)
NOTE: recipe python3-binwalk-27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-binwalk-27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1419 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_fetch)
NOTE: recipe python3-binwalk-27-r0: task do_fetch: Started
NOTE: recipe python3-binwalk-27-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_unpack)
NOTE: Running task 1768 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-binwalk-27-r0: task do_unpack: Started
NOTE: recipe python3-binwalk-27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-binwalk-27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-binwalk-27-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch)
NOTE: Running task 1770 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_collect_spdx_deps)
NOTE: recipe python3-binwalk-27-r0: task do_patch: Started
NOTE: recipe python3-binwalk-27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-binwalk-27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-binwalk-27-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1770 tasks of which 1765 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103201229.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103201229.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-binwalk-27-r0 do_patch: Applying patch '0033-Added-directory-traversal-test-fixed-zip-test.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-binwalk/27/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-binwalk/27/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0033-Added-directory-traversal-test-fixed-zip-test.patch
File testing/tests/input-vectors/dirtraversal.tar: git binary diffs are not supported.
patching file testing/tests/test_dirtraversal.py
patching file testing/tests/test_firmware_zip.py
Patch 0033-Added-directory-traversal-test-fixed-zip-test.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-binwalk/27/temp/log.do_patch.2803836
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-binwalk_27.bb:do_patch) failed with exit code '1'

--===============8254768403365547186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-binwalk-upgrade-2.3.4-27.patch"

RnJvbSAyNGQ0NzNhOWY1MTlmY2U0NzQ1ZDA5NTRkNGE0OWIwY2JkMDMyZGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDoxMzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmlud2FsazogdXBncmFkZSAyLjMuNCAtPiAyNwoKLS0tCiAuLi4tb24tbmV3ZXItdWJ1
bnR1LWRpc3Ryb3MtYW5kLWRyb3AtcHkucGF0Y2ggfCAgMjE1ICsrCiAuLi4wMi1SZW1vdmUtcHl0
aG9uLTIuNy1mcm9tLUNJLXRlc3RpbmcucGF0Y2ggfCAgIDIxICsKIC4uLml4LXRvLWRpc3Ryb3Mt
dW5kZXItTFRTLWFuZC1weXRob24tdi5wYXRjaCB8ICAgNTAgKwogLi4uYXBwbHktdGVzdC1tYXRy
aXgtdG8tZGlzdC1rZXl3b3JkLWV4LnBhdGNoIHwgICA2MCArCiAuLi5wbGVtZW50LWV4cG9uZW50
LWFuZC1zaGlmdC1vcGVyYXRvcnMucGF0Y2ggfCAgIDM4ICsKIC4uLmQtYmFzZWQtb24tbW9kZXJu
LXJlYWxpdGllcy13aXRoLXB5dC5wYXRjaCB8ICAxMDcgKwogLi4ubGUtYWxvbmctd2l0aC1jaGFu
Z2VzLXJlcXVpcmVkLWZvci1zLnBhdGNoIHwgIDEzNyArCiAuLi5zdGFnZS1idWlsZC1hbmQtdGVz
dC1zdGFnZS1pbmNsdWRlLUQucGF0Y2ggfCAgMTU4ICsKIC4uLi8wMDA5LWZpeC10cmF2aXMtc2Ny
aXB0LnBhdGNoICAgICAgICAgICAgICB8ICAgNTAgKwogLi4uLzAwMTAtc3RpbGwtbm8tbG92ZS1m
b3ItdHJhdmlzLnBhdGNoICAgICAgIHwgICAyNSArCiAuLi5lLW9mLWNyeXB0b2RvbWUtc2luY2Ut
cHljcnlwdG8taXMtRU8ucGF0Y2ggfCAgIDIyICsKIC4uLmVtcHR5LXBhc3N3b3JkLXRvLWF2b2lk
LXVuemlwLXN0dWNrLS5wYXRjaCB8ICAgMjMgKwogLi4uLVVidW50dS1Gb2NhbC1pcy1QeXRob24t
My1ieS1kZWZhdWx0LnBhdGNoIHwgICAyNCArCiAuLi5kZXBzLnNoLWlmLWFueS1pbnN0YWxsLWNv
bW1hbmQtZmFpbHMucGF0Y2ggfCAgIDUxICsKIC4uLmQtdG8tYmlmdXJjYXRlLXB5dGhvbjMtYW5k
LXB5dGhvbjItZC5wYXRjaCB8ICAgNjMgKwogLi4udXNpbmctaXNzdWVzLXVzZS13aGF0ZXZlci1w
aXAtdGhlLXVzLnBhdGNoIHwgICA0NCArCiAuLi5vdC1wcmVzZXJ2ZS10aGUtc3BlY2lmaWVkLXB5
dGhvbi13aGUucGF0Y2ggfCAgIDIzICsKIC4uLmhlcmUtaXMtbm8tcmh5bWUtb3ItcmVhc29uLXRv
LXRyYXZpcy5wYXRjaCB8ICAgMzEgKwogLi4udmUtdGhlLXB5dGhvbi1iZWluZy11c2VkLWFjcm9z
cy1zdWRvLnBhdGNoIHwgICA1NiArCiAuLi4vcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDIwLW5v
cC5wYXRjaCAgICAgfCAgIDMxICsKIC4uLi8wMDIxLXNhc3F1YXRjaC1wYXRjaC13YXMtbWVyZ2Vk
LnBhdGNoICAgICB8ICAgNTYgKwogLi4uMDAyMi1hZGQtdGhpcmQtcGFydHktTk9USUNFLW1hcmtk
b3duLnBhdGNoIHwgICAyNyArCiAuLi4vMDAyMy1SZW1vdmVkLXNlbnNpdGl2ZS1rZXlzLnBhdGNo
ICAgICAgICAgfCAgMjIwICsrCiAuLi5lY3J5cHRpb24tcGx1Z2luLWNvbnRhaW5zLXByaXByaWV0
YXIucGF0Y2ggfCAgMTI0ICsKIC4uLjUtVXBkYXRlZC12ZXJzaW9uLW51bWJlci1mb3ItcmVsZWFz
ZS5wYXRjaCB8ICAgMjIgKwogLi4uYWwtbG93LXByaXYtZXhlY3V0aW9uLWltcGxlbWVudGF0aW9u
LnBhdGNoIHwgICA5NyArCiAuLi5wdGlvbi10by10dXJuLW9mZi1wcml2aWxlZ2UtZHJvcHBpbmcu
cGF0Y2ggfCAgMTUyICsKIC4uLi1zcGVjaWZ5aW5nLWEtdXNlci10by1ydW4tZXh0ZXJuYWwtZS5w
YXRjaCB8ICAxMzkgKwogLi4uMDAyOS1Jbml0aWFsLXN5bWxpbmstcmVwYWlyLXNvbHV0aW9uLnBh
dGNoIHwgICA4MiArCiAuLi5udHMtYW5kLWJldHRlci1lcnJvci1vdXRwdXQtZm9yLWVuZC0ucGF0
Y2ggfCAgIDYxICsKIC4uLi8wMDMxLUJ1Zy1maXhlcy1jb2RlLXRlc3RpbmcucGF0Y2ggICAgICAg
ICB8ICAgNzAgKwogLi4uL3B5dGhvbjMtYmlud2Fsay8wMDMyLUNvZGUtY2xlYW51cC5wYXRjaCAg
IHwgICA3MSArCiAuLi5lY3RvcnktdHJhdmVyc2FsLXRlc3QtZml4ZWQtemlwLXRlc3QucGF0Y2gg
fCAyNTc5ICsrKysrKysrKysrKysrKysrCiAuLi5kLXRvLWluY2x1ZGUtZXh0cmFjdGlvbi1zZWN1
cml0eS1ub3QucGF0Y2ggfCAgIDQ1ICsKIC4uLmFsLXRlc3QtdXBkYXRlZC1leHRyYWN0b3ItdG8t
bm90LWZvci5wYXRjaCB8ICAxNTIgKwogLi4uLzAwMzYtRml4ZWQtY29kZS1jb21tZW50LnBhdGNo
ICAgICAgICAgICAgIHwgICAyMiArCiAuLi5kaXNhYmxlLXN5bWxpbmstc2FuaXRpemF0aW9uLWlm
LWRlc2kucGF0Y2ggfCAgIDQzICsKIC4uLjAzOC1SZW1vdmUtdW5zdHVmZi1mcm9tLWRlcGVuZGVu
Y2llcy5wYXRjaCB8ICAgNzAgKwogLi4udGgtdHJhdmVyc2FsLWluLVBGUy1leHRyYWN0b3Itc2Ny
aXB0LnBhdGNoIHwgICAyNCArCiAuLi5iaW53YWxrXzIuMy40LmJiID0+IHB5dGhvbjMtYmlud2Fs
a18yNy5iYn0gfCAgIDQ0ICstCiA0MCBmaWxlcyBjaGFuZ2VkLCA1MzI3IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDEtZGVwcy1GaXgtaW5zdGFsbC1vbi1u
ZXdlci11YnVudHUtZGlzdHJvcy1hbmQtZHJvcC1weS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDAy
LVJlbW92ZS1weXRob24tMi43LWZyb20tQ0ktdGVzdGluZy5wYXRjaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8w
MDAzLXJlZHVjZS10ZXN0LW1hdHJpeC10by1kaXN0cm9zLXVuZGVyLUxUUy1hbmQtcHl0aG9uLXYu
cGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJpbndhbGsvMDAwNC1UcmF2aXMtd2lsbC1ub3QtYXBwbHktdGVzdC1tYXRy
aXgtdG8tZGlzdC1rZXl3b3JkLWV4LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDUtQWN0dWFsbHkt
aW1wbGVtZW50LWV4cG9uZW50LWFuZC1zaGlmdC1vcGVyYXRvcnMucGF0Y2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndh
bGsvMDAwNi1VcGRhdGUtSU5TVEFMTC5tZC1iYXNlZC1vbi1tb2Rlcm4tcmVhbGl0aWVzLXdpdGgt
cHl0LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDctaW5pdGlhbC1Eb2NrZXJmaWxlLWFsb25nLXdp
dGgtY2hhbmdlcy1yZXF1aXJlZC1mb3Itcy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDA4LWltcGxl
bWVudC1tdWx0aS1zdGFnZS1idWlsZC1hbmQtdGVzdC1zdGFnZS1pbmNsdWRlLUQucGF0Y2gKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWJpbndhbGsvMDAwOS1maXgtdHJhdmlzLXNjcmlwdC5wYXRjaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8w
MDEwLXN0aWxsLW5vLWxvdmUtZm9yLXRyYXZpcy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDExLXRy
YW5zaXRpb24tdG8tdXNlLW9mLWNyeXB0b2RvbWUtc2luY2UtcHljcnlwdG8taXMtRU8ucGF0Y2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJpbndhbGsvMDAxMi1DYWxsLXVuemlwLXdpdGgtZW1wdHktcGFzc3dvcmQtdG8tYXZv
aWQtdW56aXAtc3R1Y2stLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTMtVWJ1bnR1LUZvY2FsLWlz
LVB5dGhvbi0zLWJ5LWRlZmF1bHQucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxNC1mYWlsLWRlcHMu
c2gtaWYtYW55LWluc3RhbGwtY29tbWFuZC1mYWlscy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDE1
LXdlLW5vLWxvbmdlci1uZWVkLXRvLWJpZnVyY2F0ZS1weXRob24zLWFuZC1weXRob24yLWQucGF0
Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJpbndhbGsvMDAxNi11c2luZy1waXAzLWlzLWNhdXNpbmctaXNzdWVzLXVzZS13
aGF0ZXZlci1waXAtdGhlLXVzLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTctVHJhdmlzLUNJLWRv
ZXMtbm90LXByZXNlcnZlLXRoZS1zcGVjaWZpZWQtcHl0aG9uLXdoZS5wYXRjaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlu
d2Fsay8wMDE4LXRoZXJlLWlzLW5vLXJoeW1lLW9yLXJlYXNvbi10by10cmF2aXMucGF0Y2gKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWJpbndhbGsvMDAxOS10cnktdG8tcHJlc2VydmUtdGhlLXB5dGhvbi1iZWluZy11c2VkLWFj
cm9zcy1zdWRvLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjAtbm9wLnBhdGNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53
YWxrLzAwMjEtc2FzcXVhdGNoLXBhdGNoLXdhcy1tZXJnZWQucGF0Y2gKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsv
MDAyMi1hZGQtdGhpcmQtcGFydHktTk9USUNFLW1hcmtkb3duLnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxr
LzAwMjMtUmVtb3ZlZC1zZW5zaXRpdmUta2V5cy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDI0LVJl
bW92ZWQtaGlsaW5rLWRlY3J5cHRpb24tcGx1Z2luLWNvbnRhaW5zLXByaXByaWV0YXIucGF0Y2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJpbndhbGsvMDAyNS1VcGRhdGVkLXZlcnNpb24tbnVtYmVyLWZvci1yZWxlYXNlLnBh
dGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iaW53YWxrLzAwMjYtSW5pdGlhbC1sb3ctcHJpdi1leGVjdXRpb24taW1wbGVt
ZW50YXRpb24ucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyNy1BZGRlZC1vcHRpb24tdG8tdHVybi1v
ZmYtcHJpdmlsZWdlLWRyb3BwaW5nLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjgtQWRkZWQtb3B0
aW9uLWZvci1zcGVjaWZ5aW5nLWEtdXNlci10by1ydW4tZXh0ZXJuYWwtZS5wYXRjaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Ymlud2Fsay8wMDI5LUluaXRpYWwtc3ltbGluay1yZXBhaXItc29sdXRpb24ucGF0Y2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJpbndhbGsvMDAzMC1BZGRlZC1jb2RlLWNvbW1lbnRzLWFuZC1iZXR0ZXItZXJyb3Itb3V0cHV0
LWZvci1lbmQtLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzEtQnVnLWZpeGVzLWNvZGUtdGVzdGlu
Zy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDMyLUNvZGUtY2xlYW51cC5wYXRjaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlu
d2Fsay8wMDMzLUFkZGVkLWRpcmVjdG9yeS10cmF2ZXJzYWwtdGVzdC1maXhlZC16aXAtdGVzdC5w
YXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYmlud2Fsay8wMDM0LVVwZGF0ZWQtUkVBRE1FLm1kLXRvLWluY2x1ZGUtZXh0
cmFjdGlvbi1zZWN1cml0eS1ub3QucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzNS1GaXhlZC1kaXJ0
cmF2ZXJzYWwtdGVzdC11cGRhdGVkLWV4dHJhY3Rvci10by1ub3QtZm9yLnBhdGNoCiBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1i
aW53YWxrLzAwMzYtRml4ZWQtY29kZS1jb21tZW50LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzct
QWRkZWQtb3B0aW9uLXRvLWRpc2FibGUtc3ltbGluay1zYW5pdGl6YXRpb24taWYtZGVzaS5wYXRj
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmlud2Fsay8wMDM4LVJlbW92ZS11bnN0dWZmLWZyb20tZGVwZW5kZW5jaWVzLnBh
dGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iaW53YWxrLzAwMzktZml4LXBhdGgtdHJhdmVyc2FsLWluLVBGUy1leHRyYWN0
b3Itc2NyaXB0LnBhdGNoCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtYmlud2Fsa18yLjMuNC5iYiA9PiBweXRob24zLWJpbndhbGtfMjcuYmJ9ICgx
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1iaW53YWxrLzAwMDEtZGVwcy1GaXgtaW5zdGFsbC1vbi1uZXdlci11YnVudHUtZGlzdHJv
cy1hbmQtZHJvcC1weS5wYXRjaCBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmlud2Fsay8wMDAxLWRlcHMtRml4LWluc3RhbGwtb24tbmV3ZXItdWJ1bnR1LWRp
c3Ryb3MtYW5kLWRyb3AtcHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwLi4zYjk5ZmNiN2EKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwMS1kZXBzLUZpeC1pbnN0YWxsLW9uLW5l
d2VyLXVidW50dS1kaXN0cm9zLWFuZC1kcm9wLXB5LnBhdGNoCkBAIC0wLDAgKzEsMjE1IEBACitG
cm9tIDI2OWI1NjZkZGMwZWNhNTY2MDU1N2E2MGE5OGY1N2Y5YWI3YjBkZTQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KK0RhdGU6IFN1biwgMiBGZWIgMjAyMCAxOTowNzowMiAtMDcwMAorU3ViamVjdDogW1BB
VENIXSBkZXBzOiBGaXggaW5zdGFsbCBvbiBuZXdlciB1YnVudHUgZGlzdHJvcyBhbmQgZHJvcCBw
eXRob24yCisgc3VwcG9ydC4KKworRGVwZW5kZW5jaWVzIHN1Y2ggYXMgamVmZmVyc29uIGFyZSBu
b3cgcHl0aG9uMyBvbmx5IGFuZCBweXRob24yIGlzIG5vCitsb25nZXIgc3VwcG9ydGVkLCBhcyBp
dCBhcHBlYXJzIGFsbCBvdXIgZGVwZW5kZW5jaWVzIGhhdmUgcHl0aG9uMwordmVyc2lvbnMgaXQg
c2hvdWxkIGJlIHNhZmUgdG8gZHJvcCBweXRob24yIHN1cHBvcnQuCistLS0KKyAudHJhdmlzLnlt
bCAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrLS0KKyBkZXBzLnNoICAgICAgICAg
ICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQorIHNldHVwLnB5
ICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKystLS0KKyBzcmMvYmlud2Fsay9j
b3JlL2NvbXBhdC5weSB8ICA1ICstLS0tCisgc3JjL2JpbndhbGsvY29yZS9tYWdpYy5weSAgfCAg
MiArLQorIHNyYy9iaW53YWxrL3BsdWdpbnMvdGFyLnB5IHwgIDIgKy0KKyA2IGZpbGVzIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvLnRy
YXZpcy55bWwgYi8udHJhdmlzLnltbAoraW5kZXggM2NkZWJlZC4uMzRiMTBjOCAxMDA2NDQKKy0t
LSBhLy50cmF2aXMueW1sCisrKysgYi8udHJhdmlzLnltbAorQEAgLTEsMyArMSw3IEBACisrZGlz
dDogeGVuaWFsCisrYWRkb25zOgorKyAgYXB0OgorKyAgICB1cGRhdGU6IHRydWUKKyBsYW5ndWFn
ZTogcHl0aG9uCisgYXJjaDogCisgIC0gcHBjNjRsZQorQEAgLTksMTMgKzEzLDIxIEBAIHB5dGhv
bjoKKyAgLSAiMy42IgorICAtICIzLjciCisgIC0gIjMuOCIKKysgLSAiMy45IgorICAtICJuaWdo
dGx5IgorIGluc3RhbGw6CisrIC0gLi9kZXBzLnNoIC0teWVzCisgIC0gcGlwIGluc3RhbGwgY292
ZXJhZ2UKKy0gLSBwaXAgaW5zdGFsbCBiYWNrcG9ydHMubHptYQorICAtIC4vc2V0dXAucHkgaW5z
dGFsbAorIHNjcmlwdDogLi9zZXR1cC5weSB0ZXN0CisgY2FjaGU6IHBpcAorLW1hdHJpeDoKKytq
b2JzOgorKyAgaW5jbHVkZToKKysgICAtIHB5dGhvbjogIjMuNiIKKysgICAgIGRpc3Q6IGJpb25p
YworKyAgIC0gcHl0aG9uOiAiMy44IgorKyAgICAgZGlzdDogZm9jYWwKKysgICAtIHB5dGhvbjog
IjMuOSIKKysgICAgIGRpc3Q6IGZvY2FsCisgICBhbGxvd19mYWlsdXJlczoKKyAgICAtIHB5dGhv
bjogbmlnaHRseQorZGlmZiAtLWdpdCBhL2RlcHMuc2ggYi9kZXBzLnNoCitpbmRleCAxOTg5MmRl
Li41MzIxYjM3IDEwMDc1NQorLS0tIGEvZGVwcy5zaAorKysrIGIvZGVwcy5zaAorQEAgLTQxLDI0
ICs0MSwyNiBAQCBBUFRHRVRDTUQ9ImFwdC1nZXQiCisgWVVNQ01EPSJ5dW0iCisgaWYgWyAkZGlz
dHJvID0gIkthbGkiIF0KKyB0aGVuCistICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgYnVpbGQtZXNz
ZW50aWFsIGxpYnF0NC1vcGVuZ2wgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBw
N3ppcCBwN3ppcC1mdWxsIGNhYmV4dHJhY3QgdXRpbC1saW51eCBmaXJtd2FyZS1tb2Qta2l0IGNy
YW1mc3N3YXAgc3F1YXNoZnMtdG9vbHMgemxpYjFnLWRldiBsaWJsem1hLWRldiBsaWJsem8yLWRl
diBzbGV1dGhraXQgZGVmYXVsdC1qZGsgbHpvcCBjcGlvIgorLWVsaWYgWyAkZGlzdHJvX3ZlcnNp
b24gPSAiMTciIF0KKysgICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1lc3NlbnRpYWwgcXQ1
YmFzZS1kZXYgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1m
dWxsIGNhYmV4dHJhY3QgdXRpbC1saW51eCBmaXJtd2FyZS1tb2Qta2l0IGNyYW1mc3N3YXAgc3F1
YXNoZnMtdG9vbHMgemxpYjFnLWRldiBsaWJsem1hLWRldiBsaWJsem8yLWRldiBzbGV1dGhraXQg
ZGVmYXVsdC1qZGsgbHpvcCBjcGlvIgorK2VsaWYgWyAkZGlzdHJvX3ZlcnNpb24gPSAiMTQiIF0K
KyB0aGVuCistICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgYnVpbGQtZXNzZW50aWFsIGxpYnF0NC1v
cGVuZ2wgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1mdWxs
IGNhYmV4dHJhY3QgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6bGliMWctZGV2IGxpYmx6bWEt
ZGV2IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBsem9wIHNyZWNvcmQgY3BpbyIK
KysgICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1lc3NlbnRpYWwgbGlicXQ0LW9wZW5nbCBt
dGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNhIHA3emlwIHA3emlwLWZ1bGwgY2FiZXh0
cmFjdCBjcmFtZnNwcm9ncyBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xzIHpsaWIxZy1kZXYgbGli
bHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRrIGx6b3Agc3JlY29yZCBj
cGlvIgorK2VsaWYgWyAkZGlzdHJvX3ZlcnNpb24gPSAiMTUiIF0KKyt0aGVuCisrICAgIEFQVF9D
QU5ESURBVEVTPSJnaXQgYnVpbGQtZXNzZW50aWFsIGxpYnF0NC1vcGVuZ2wgbXRkLXV0aWxzIGd6
aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1mdWxsIGNhYmV4dHJhY3QgY3JhbWZz
cHJvZ3MgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6bGliMWctZGV2IGxpYmx6bWEtZGV2IGxp
Ymx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBsem9wIHNyZWNvcmQgY3BpbyIKKytlbGlm
IFsgJGRpc3Ryb192ZXJzaW9uID0gIjE2IiBdCisrdGhlbgorKyAgICBBUFRfQ0FORElEQVRFUz0i
Z2l0IGJ1aWxkLWVzc2VudGlhbCBsaWJxdDQtb3BlbmdsIG10ZC11dGlscyBnemlwIGJ6aXAyIHRh
ciBhcmogbGhhc2EgcDd6aXAgcDd6aXAtZnVsbCBjYWJleHRyYWN0IGNyYW1mc3Byb2dzIGNyYW1m
c3N3YXAgc3F1YXNoZnMtdG9vbHMgemxpYjFnLWRldiBsaWJsem1hLWRldiBsaWJsem8yLWRldiBz
bGV1dGhraXQgZGVmYXVsdC1qZGsgbHpvcCBzcmVjb3JkIGNwaW8iCisgZWxpZiBbICRkaXN0cm9f
dmVyc2lvbiA9ICIxOCIgXQorIHRoZW4KKyAgICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1l
c3NlbnRpYWwgbGlicXQ0LW9wZW5nbCBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNh
IHA3emlwIHA3emlwLWZ1bGwgY2FiZXh0cmFjdCBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xzIHps
aWIxZy1kZXYgbGlibHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRrIGx6
b3Agc3JlY29yZCBjcGlvIgorIGVsc2UKKy0gICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1l
c3NlbnRpYWwgbGlicXQ0LW9wZW5nbCBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNh
IHA3emlwIHA3emlwLWZ1bGwgY2FiZXh0cmFjdCBjcmFtZnNwcm9ncyBjcmFtZnNzd2FwIHNxdWFz
aGZzLXRvb2xzIHpsaWIxZy1kZXYgbGlibHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRl
ZmF1bHQtamRrIGx6b3Agc3JlY29yZCBjcGlvIgorKyAgICBBUFRfQ0FORElEQVRFUz0iZ2l0IGJ1
aWxkLWVzc2VudGlhbCBxdGJhc2U1LWRldiBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxo
YXNhIHA3emlwIHA3emlwLWZ1bGwgY2FiZXh0cmFjdCBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xz
IHpsaWIxZy1kZXYgbGlibHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRr
IGx6b3Agc3JlY29yZCBjcGlvIgorIGZpCistUFlUSE9OMl9BUFRfQ0FORElEQVRFUz0icHl0aG9u
LWNyeXB0byBweXRob24tbHpvIHB5dGhvbi1sem1hIHB5dGhvbi1waXAgcHl0aG9uLXRrIgorLVBZ
VEhPTjNfQVBUX0NBTkRJREFURVM9InB5dGhvbjMtY3J5cHRvIHB5dGhvbjMtcGlwIHB5dGhvbjMt
dGsiCisrUFlUSE9OM19BUFRfQ0FORElEQVRFUz0icHl0aG9uMy1jcnlwdG8gcHl0aG9uMy1nbnVw
ZyBweXRob24zLXBpcCBweXRob24zLXRrIgorIFBZVEhPTjNfWVVNX0NBTkRJREFURVM9IiIKKyBZ
VU1fQ0FORElEQVRFUz0iZ2l0IGdjYyBnY2MtYysrIG1ha2Ugb3BlbnNzbC1kZXZlbCBxdHdlYmtp
dC1kZXZlbCBxdC1kZXZlbCBnemlwIGJ6aXAyIHRhciBhcmogcDd6aXAgcDd6aXAtcGx1Z2lucyBj
YWJleHRyYWN0IHNxdWFzaGZzLXRvb2xzIHpsaWIgemxpYi1kZXZlbCBsem8gbHpvLWRldmVsIHh6
IHh6LWNvbXBhdC1saWJzIHh6LWxpYnMgeHotZGV2ZWwgeHotbHptYS1jb21wYXQgcHl0aG9uLWJh
Y2twb3J0cy1sem1hIGx6aXAgcHlsaWJsem1hIHBlcmwtQ29tcHJlc3MtUmF3LUx6bWEgbHpvcCBz
cmVjb3JkIgorLVBZVEhPTjJfWVVNX0NBTkRJREFURVM9InB5dGhvbi1waXAgcHl0aG9uLUJvdHRs
ZW5lY2sgY3BpbyIKKy1BUFRfQ0FORElEQVRFUz0iJEFQVF9DQU5ESURBVEVTICRQWVRIT04yX0FQ
VF9DQU5ESURBVEVTIgorLVlVTV9DQU5ESURBVEVTPSIkWVVNX0NBTkRJREFURVMgJFBZVEhPTjJf
WVVNX0NBTkRJREFURVMiCistUElQX0NPTU1BTkRTPSJwaXAiCisrUElQX0NPTU1BTkRTPSJwaXAz
IgorIAorICMgQ2hlY2sgZm9yIHJvb3QgcHJpdmlsZWdlcworIGlmIFsgJFVJRCAtZXEgMCBdCitA
QCAtNzIsNyArNzQsNyBAQCBmaQorIGZ1bmN0aW9uIGluc3RhbGxfeWFmZnNoaXYKKyB7CisgICAg
IGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vZGV2dHR5czAveWFmZnNoaXYKKy0gICAgKGNk
IHlhZmZzaGl2ICYmICRTVURPIHB5dGhvbjIgc2V0dXAucHkgaW5zdGFsbCkKKysgICAgKGNkIHlh
ZmZzaGl2ICYmICRTVURPIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbCkKKyAgICAgJFNVRE8gcm0g
LXJmIHlhZmZzaGl2CisgfQorIAorQEAgLTEyMiwxMCArMTI0LDcgQEAgZnVuY3Rpb24gaW5zdGFs
bF9jcmFtZnN0b29scworIGZ1bmN0aW9uIGluc3RhbGxfdWJpcmVhZGVyCisgeworICAgICBnaXQg
Y2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2pyc3BydWl0dC91YmlfcmVhZGVyCistICAgICMgU29t
ZSBVQklGUyBleHRyYWN0aW9uIGJyZWFrcyBhZnRlciB0aGlzIGNvbW1pdCwgZHVlIHRvICJBZGRl
ZCBmYXRhbCBlcnJvciBjaGVjayBpZiBVQkkgYmxvY2sgZXh0ZW5kcyBiZXlvbmQgZmlsZSBzaXpl
IgorLSAgICAjIChzZWUgdGhpcyBjb21taXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9qcnNwcnVpdHQv
dWJpX3JlYWRlci9jb21taXQvYWY2NzhhNTIzNGRjODkxZTg3MjFlYzk4NWIxYTZlNzRjNzc2MjBi
NikKKy0gICAgIyBSZXNldCB0byBhIGtub3duIHdvcmtpbmcgY29tbWl0LgorLSAgICAoY2QgdWJp
X3JlYWRlciAmJiBnaXQgcmVzZXQgLS1oYXJkIDA5NTVlNmI5NWYwN2Q4NDlhMTgyMTI1OTE5YTFm
MmI2NzkwZDViNTEgJiYgJFNVRE8gcHl0aG9uIHNldHVwLnB5IGluc3RhbGwpCisrICAgIChjZCB1
YmlfcmVhZGVyICYmICRTVURPIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbCkKKyAgICAgJFNVRE8g
cm0gLXJmIHViaV9yZWFkZXIKKyB9CisgCitAQCAtMjU3LDYgKzI1Niw3IEBAIGlmIFsgJD8gLW5l
IDAgXQorICAgICBlY2hvICJQYWNrYWdlIGluc3RhbGxhdGlvbiBmYWlsZWQ6ICRQS0dfQ0FORElE
QVRFUyIKKyAgICAgZXhpdCAxCisgZmkKKytpbnN0YWxsX3BpcF9wYWNrYWdlIHNldHVwdG9vbHMK
KyBpbnN0YWxsX3BpcF9wYWNrYWdlIG1hdHBsb3RsaWIKKyBpbnN0YWxsX3BpcF9wYWNrYWdlIGNh
cHN0b25lCisgaW5zdGFsbF9zYXNxdWF0Y2gKK2RpZmYgLS1naXQgYS9zZXR1cC5weSBiL3NldHVw
LnB5CitpbmRleCBlNGZjYTNmLi5iNzQ3YjRkIDEwMDc1NQorLS0tIGEvc2V0dXAucHkKKysrKyBi
L3NldHVwLnB5CitAQCAtMSwxMCArMSwxNCBAQAorLSMhL3Vzci9iaW4vZW52IHB5dGhvbgorKyMh
L3Vzci9iaW4vZW52IHB5dGhvbjMKKytpbXBvcnQgaW8KKyBpbXBvcnQgb3MKKyBpbXBvcnQgc3lz
CisgaW1wb3J0IGdsb2IKKyBpbXBvcnQgc2h1dGlsCisgaW1wb3J0IHN1YnByb2Nlc3MKKy1mcm9t
IGRpc3R1dGlscy5jb3JlIGltcG9ydCBzZXR1cCwgQ29tbWFuZAorK3RyeToKKysgICAgZnJvbSBz
ZXR1cHRvb2xzIGltcG9ydCBzZXR1cCwgQ29tbWFuZAorK2V4Y2VwdCBJbXBvcnRFcnJvcjoKKysg
ICAgZnJvbSBkaXN0dXRpbHMuY29yZSBpbXBvcnQgc2V0dXAsIENvbW1hbmQKKyBmcm9tIGRpc3R1
dGlscy5kaXJfdXRpbCBpbXBvcnQgcmVtb3ZlX3RyZWUKKyAKKyBNT0RVTEVfTkFNRSA9ICJiaW53
YWxrIgorQEAgLTI0LDcgKzI4LDcgQEAgZXhjZXB0IEltcG9ydEVycm9yOgorICMgYnkgYmlud2Fs
ay4KKyB0cnk6CisgICAgIGxhYmVsID0gc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoWyJnaXQiLCAi
cmV2LXBhcnNlIiwgIi0tc2hvcnQiLCAiSEVBRCJdLCBzdGRlcnI9REVWTlVMTCkuZGVjb2RlKCd1
dGYtOCcpCistICAgIE1PRFVMRV9WRVJTSU9OID0gIiVzLSVzIiAlIChNT0RVTEVfVkVSU0lPTiwg
bGFiZWwuc3RyaXAoKSkKKysgICAgTU9EVUxFX1ZFUlNJT04gPSAiJXMrJXMiICUgKE1PRFVMRV9W
RVJTSU9OLCBsYWJlbC5zdHJpcCgpKQorIGV4Y2VwdCBLZXlib2FyZEludGVycnVwdCBhcyBlOgor
ICAgICByYWlzZSBlCisgZXhjZXB0IEV4Y2VwdGlvbjoKK0BAIC0zMTgsMTQgKzMyMiwyMSBAQCBp
bnN0YWxsX2RhdGFfZmlsZXMgPSBbXQorIGZvciBkYXRhX2RpciBpbiBbIm1hZ2ljIiwgImNvbmZp
ZyIsICJwbHVnaW5zIiwgIm1vZHVsZXMiLCAiY29yZSJdOgorICAgICBpbnN0YWxsX2RhdGFfZmls
ZXMuYXBwZW5kKCIlcyVzKiIgJSAoZGF0YV9kaXIsIG9zLnBhdGguc2VwKSkKKyAKKyt0aGlzX2Rp
cmVjdG9yeSA9IG9zLnBhdGguYWJzcGF0aChvcy5wYXRoLmRpcm5hbWUoX19maWxlX18pKQorK3dp
dGggaW8ub3Blbihvcy5wYXRoLmpvaW4odGhpc19kaXJlY3RvcnksICdSRUFETUUubWQnKSwgZW5j
b2Rpbmc9J3V0Zi04JykgYXMgZjoKKysgICAgbG9uZ19kZXNjcmlwdGlvbiA9IGYucmVhZCgpCisr
CisgIyBJbnN0YWxsIHRoZSBtb2R1bGUsIHNjcmlwdCwgYW5kIHN1cHBvcnQgZmlsZXMKKyBzZXR1
cCgKKyAgICAgbmFtZT1NT0RVTEVfTkFNRSwKKyAgICAgdmVyc2lvbj1NT0RVTEVfVkVSU0lPTiwK
KyAgICAgZGVzY3JpcHRpb249IkZpcm13YXJlIGFuYWx5c2lzIHRvb2wiLAorKyAgICBsb25nX2Rl
c2NyaXB0aW9uPWxvbmdfZGVzY3JpcHRpb24sCisrICAgIGxvbmdfZGVzY3JpcHRpb25fY29udGVu
dF90eXBlPSd0ZXh0L21hcmtkb3duJywKKyAgICAgYXV0aG9yPSJDcmFpZyBIZWZmbmVyIiwKKyAg
ICAgdXJsPSJodHRwczovL2dpdGh1Yi5jb20vUmVGaXJtTGFicy8lcyIgJSBNT0RVTEVfTkFNRSwK
KyAgICAgcmVxdWlyZXM9W10sCisrICAgIHB5dGhvbl9yZXF1aXJlcz0iPj0zIiwKKyAgICAgcGFj
a2FnZV9kaXI9eyIiOiAic3JjIn0sCisgICAgIHBhY2thZ2VzPVtNT0RVTEVfTkFNRV0sCisgICAg
IHBhY2thZ2VfZGF0YT17TU9EVUxFX05BTUU6IGluc3RhbGxfZGF0YV9maWxlc30sCitkaWZmIC0t
Z2l0IGEvc3JjL2JpbndhbGsvY29yZS9jb21wYXQucHkgYi9zcmMvYmlud2Fsay9jb3JlL2NvbXBh
dC5weQoraW5kZXggYjU0NTNjNS4uYjYxMGM5OSAxMDA2NDQKKy0tLSBhL3NyYy9iaW53YWxrL2Nv
cmUvY29tcGF0LnB5CisrKysgYi9zcmMvYmlud2Fsay9jb3JlL2NvbXBhdC5weQorQEAgLTgxLDcg
KzgxLDQgQEAgZGVmIHVzZXJfaW5wdXQocHJvbXB0PScnKToKKyAgICAgJycnCisgICAgIEZvciBn
ZXR0aW5nIHJhdyB1c2VyIGlucHV0IGluIFB5dGhvbiAyIGFuZCAzLgorICAgICAnJycKKy0gICAg
aWYgUFlfTUFKT1JfVkVSU0lPTiA+IDI6CistICAgICAgICByZXR1cm4gaW5wdXQocHJvbXB0KQor
LSAgICBlbHNlOgorLSAgICAgICAgcmV0dXJuIHJhd19pbnB1dChwcm9tcHQpCisrICAgIHJldHVy
biBpbnB1dChwcm9tcHQpCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvY29yZS9tYWdpYy5weSBi
L3NyYy9iaW53YWxrL2NvcmUvbWFnaWMucHkKK2luZGV4IDc1MGJkMTIuLjhmN2EzMTYgMTAwNjQ0
CistLS0gYS9zcmMvYmlud2Fsay9jb3JlL21hZ2ljLnB5CisrKysgYi9zcmMvYmlud2Fsay9jb3Jl
L21hZ2ljLnB5CitAQCAtNjI1LDcgKzYyNSw3IEBAIGNsYXNzIE1hZ2ljKG9iamVjdCk6CisgICAg
ICAgICAgICAgICAgICAgICB0cnk6CisgICAgICAgICAgICAgICAgICAgICAgICAgIyBJZiB0aGUg
b3BlcmF0b3IgdmFsdWUgb2YgdGhpcyBzaWduYXR1cmUgbGluZSBpcyBqdXN0CisgICAgICAgICAg
ICAgICAgICAgICAgICAgIyBhbiBpbnRlZ2VyIHZhbHVlLCB1c2UgaXQKKy0gICAgICAgICAgICAg
ICAgICAgICAgICBpZiBpc2luc3RhbmNlKGxpbmUub3B2YWx1ZSwgaW50KSBvciBpc2luc3RhbmNl
KGxpbmUub3B2YWx1ZSwgbG9uZyk6CisrICAgICAgICAgICAgICAgICAgICAgICAgaWYgaXNpbnN0
YW5jZShsaW5lLm9wdmFsdWUsIGludCk6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9w
dmFsID0gbGluZS5vcHZhbHVlCisgICAgICAgICAgICAgICAgICAgICAgICAgIyBFbHNlLCBldmFs
dWF0ZSB0aGUgY29tcGxleCBleHByZXNzaW9uCisgICAgICAgICAgICAgICAgICAgICAgICAgZWxz
ZToKK2RpZmYgLS1naXQgYS9zcmMvYmlud2Fsay9wbHVnaW5zL3Rhci5weSBiL3NyYy9iaW53YWxr
L3BsdWdpbnMvdGFyLnB5CitpbmRleCBiZTU0ZDhhLi5kYTMxMjFhIDEwMDY0NAorLS0tIGEvc3Jj
L2JpbndhbGsvcGx1Z2lucy90YXIucHkKKysrKyBiL3NyYy9iaW53YWxrL3BsdWdpbnMvdGFyLnB5
CitAQCAtMzMsNyArMzMsNyBAQCBjbGFzcyBUYXJQbHVnaW4oYmlud2Fsay5jb3JlLnBsdWdpbi5Q
bHVnaW4pOgorICAgICAgICAgICAgICAgICByYWlzZSBWYWx1ZUVycm9yKCJpbnZhbGlkIHRhciBo
ZWFkZXIiKQorICAgICAgICAgZWxzZToKKyAgICAgICAgICAgICBuID0gMAorLSAgICAgICAgICAg
IGZvciBpIGluIHhyYW5nZShsZW4ocykgLSAxKToKKysgICAgICAgICAgICBmb3IgaSBpbiByYW5n
ZShsZW4ocykgLSAxKToKKyAgICAgICAgICAgICAgICAgbiA8PD0gOAorICAgICAgICAgICAgICAg
ICBuICs9IG9yZChzW2kgKyAxXSkKKyAgICAgICAgIHJldHVybiBuCmRpZmYgLS1naXQgYS9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwMi1SZW1v
dmUtcHl0aG9uLTIuNy1mcm9tLUNJLXRlc3RpbmcucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwMi1SZW1vdmUtcHl0aG9uLTIuNy1m
cm9tLUNJLXRlc3RpbmcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
Li4zNjkwOTkwNjAKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwMi1SZW1vdmUtcHl0aG9uLTIuNy1mcm9tLUNJ
LXRlc3RpbmcucGF0Y2gKQEAgLTAsMCArMSwyMSBAQAorRnJvbSBiNTY2ZDNmOGM0MzlhOGE2M2Mw
OGQ2M2VjNDYzMTdmODQ3YTYwNjAyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0
ZXIgRWFjbWVuIDxlYWNtZW5AZ21haWwuY29tPgorRGF0ZTogU3VuLCAxNCBNYXIgMjAyMSAxNzow
NTowOCAtMDQwMAorU3ViamVjdDogW1BBVENIXSBSZW1vdmUgcHl0aG9uIDIuNyBmcm9tIENJIHRl
c3RpbmcKKworLS0tCisgLnRyYXZpcy55bWwgfCAxIC0KKyAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQorCitkaWZmIC0tZ2l0IGEvLnRyYXZpcy55bWwgYi8udHJhdmlzLnltbAoraW5kZXgg
MzRiMTBjOC4uZDIwMjM2ZSAxMDA2NDQKKy0tLSBhLy50cmF2aXMueW1sCisrKysgYi8udHJhdmlz
LnltbAorQEAgLTcsNyArNyw2IEBAIGFyY2g6CisgIC0gcHBjNjRsZQorICAtIGFtZDY0CisgcHl0
aG9uOgorLSAtICIyLjciCisgIC0gIjMuNCIKKyAgLSAiMy41IgorICAtICIzLjYiCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsv
MDAwMy1yZWR1Y2UtdGVzdC1tYXRyaXgtdG8tZGlzdHJvcy11bmRlci1MVFMtYW5kLXB5dGhvbi12
LnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53
YWxrLzAwMDMtcmVkdWNlLXRlc3QtbWF0cml4LXRvLWRpc3Ryb3MtdW5kZXItTFRTLWFuZC1weXRo
b24tdi5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjlmYmJkZDI0
MAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmlud2Fsay8wMDAzLXJlZHVjZS10ZXN0LW1hdHJpeC10by1kaXN0cm9zLXVuZGVy
LUxUUy1hbmQtcHl0aG9uLXYucGF0Y2gKQEAgLTAsMCArMSw1MCBAQAorRnJvbSA1MDYwZWZhYjM0
M2QzYzY3MTA1NmM5Yzg2Yzk2MmY4ZjM1ZWQ2ODg4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogUGV0ZXIgRWFjbWVuIDxlYWNtZW5AZ21haWwuY29tPgorRGF0ZTogU3VuLCAxNCBNYXIg
MjAyMSAxNzo0MDoyNSAtMDQwMAorU3ViamVjdDogW1BBVENIXSByZWR1Y2UgdGVzdCBtYXRyaXgg
dG8gZGlzdHJvcyB1bmRlciBMVFMgYW5kIHB5dGhvbiB2ZXJzaW9ucworIGN1cnJlbnRseQorCist
LS0KKyAudHJhdmlzLnltbCB8IDE4ICsrKy0tLS0tLS0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvLnRyYXZp
cy55bWwgYi8udHJhdmlzLnltbAoraW5kZXggZDIwMjM2ZS4uZTBiNzhkNSAxMDA2NDQKKy0tLSBh
Ly50cmF2aXMueW1sCisrKysgYi8udHJhdmlzLnltbAorQEAgLTEsMzIgKzEsMjAgQEAKKy1kaXN0
OiB4ZW5pYWwKKytkaXN0OgorKyAgLSBiaW9uaWMKKysgIC0gZm9jYWwKKyBhZGRvbnM6CisgICBh
cHQ6CisgICAgIHVwZGF0ZTogdHJ1ZQorIGxhbmd1YWdlOiBweXRob24KKyBhcmNoOiAKKy0gLSBw
cGM2NGxlCisgIC0gYW1kNjQKKyBweXRob246CistIC0gIjMuNCIKKy0gLSAiMy41IgorICAtICIz
LjYiCisgIC0gIjMuNyIKKyAgLSAiMy44IgorICAtICIzLjkiCistIC0gIm5pZ2h0bHkiCisgaW5z
dGFsbDoKKyAgLSAuL2RlcHMuc2ggLS15ZXMKKyAgLSBwaXAgaW5zdGFsbCBjb3ZlcmFnZQorICAt
IC4vc2V0dXAucHkgaW5zdGFsbAorIHNjcmlwdDogLi9zZXR1cC5weSB0ZXN0CisgY2FjaGU6IHBp
cAorLWpvYnM6CistICBpbmNsdWRlOgorLSAgIC0gcHl0aG9uOiAiMy42IgorLSAgICAgZGlzdDog
YmlvbmljCistICAgLSBweXRob246ICIzLjgiCistICAgICBkaXN0OiBmb2NhbAorLSAgIC0gcHl0
aG9uOiAiMy45IgorLSAgICAgZGlzdDogZm9jYWwKKy0gIGFsbG93X2ZhaWx1cmVzOgorLSAgIC0g
cHl0aG9uOiBuaWdodGx5CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwNC1UcmF2aXMtd2lsbC1ub3QtYXBwbHktdGVzdC1t
YXRyaXgtdG8tZGlzdC1rZXl3b3JkLWV4LnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDQtVHJhdmlzLXdpbGwtbm90LWFwcGx5LXRl
c3QtbWF0cml4LXRvLWRpc3Qta2V5d29yZC1leC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAuLjQwNzRjYzQ2OQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDA0LVRyYXZpcy13aWxs
LW5vdC1hcHBseS10ZXN0LW1hdHJpeC10by1kaXN0LWtleXdvcmQtZXgucGF0Y2gKQEAgLTAsMCAr
MSw2MCBAQAorRnJvbSBhOTRhN2EyOThkODUyZDM2ZGVjZmZhZjM1NzQwYjQ1ZmVkOWFiY2YwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgRWFjbWVuIDxlYWNtZW5AZ21haWwu
Y29tPgorRGF0ZTogU3VuLCAxNCBNYXIgMjAyMSAxNzo1NjowMCAtMDQwMAorU3ViamVjdDogW1BB
VENIXSBUcmF2aXMgd2lsbCBub3QgYXBwbHkgdGVzdCBtYXRyaXggdG8gZGlzdCBrZXl3b3JkLCBl
eHBhbmQgaXQKKyBtYW51YWxseSBpbiBqb2JzIGxpc3QKKworLS0tCisgLnRyYXZpcy55bWwgfCAz
OSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdl
ZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS8udHJh
dmlzLnltbCBiLy50cmF2aXMueW1sCitpbmRleCBlMGI3OGQ1Li5kMmIwNjhkIDEwMDY0NAorLS0t
IGEvLnRyYXZpcy55bWwKKysrKyBiLy50cmF2aXMueW1sCitAQCAtMSwyMCArMSwzMSBAQAorLWRp
c3Q6CistICAtIGJpb25pYworLSAgLSBmb2NhbAorK29zOiBsaW51eAorK2Rpc3Q6IGJpb25pYwor
K2xhbmd1YWdlOiBweXRob24KKythcmNoOiBhbWQ2NAorIGFkZG9uczoKKyAgIGFwdDoKKyAgICAg
dXBkYXRlOiB0cnVlCistbGFuZ3VhZ2U6IHB5dGhvbgorLWFyY2g6IAorLSAtIGFtZDY0CistcHl0
aG9uOgorLSAtICIzLjYiCistIC0gIjMuNyIKKy0gLSAiMy44IgorLSAtICIzLjkiCisgaW5zdGFs
bDoKKy0gLSAuL2RlcHMuc2ggLS15ZXMKKy0gLSBwaXAgaW5zdGFsbCBjb3ZlcmFnZQorLSAtIC4v
c2V0dXAucHkgaW5zdGFsbAorKyAgLSAuL2RlcHMuc2ggLS15ZXMKKysgIC0gcGlwIGluc3RhbGwg
Y292ZXJhZ2UKKysgIC0gLi9zZXR1cC5weSBpbnN0YWxsCisgc2NyaXB0OiAuL3NldHVwLnB5IHRl
c3QKKyBjYWNoZTogcGlwCisram9iczoKKysgIGluY2x1ZGU6CisrICAgLSBkaXN0OiBiaW9uaWMK
KysgICAgIHB5dGhvbjogMy42CisrICAgLSBkaXN0OiBiaW9uaWMKKysgICAgIHB5dGhvbjogMy43
CisrICAgLSBkaXN0OiBiaW9uaWMKKysgICAgIHB5dGhvbjogMy44CisrICAgLSBkaXN0OiBiaW9u
aWMKKysgICAgIHB5dGhvbjogMy45CisrICAgLSBkaXN0OiBmb2NhbAorKyAgICAgcHl0aG9uOiAz
LjYKKysgICAtIGRpc3Q6IGZvY2FsCisrICAgICBweXRob246IDMuNworKyAgIC0gZGlzdDogZm9j
YWwKKysgICAgIHB5dGhvbjogMy44CisrICAgLSBkaXN0OiBmb2NhbAorKyAgICAgcHl0aG9uOiAz
LjkKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmlud2Fsay8wMDA1LUFjdHVhbGx5LWltcGxlbWVudC1leHBvbmVudC1hbmQtc2hpZnQtb3Bl
cmF0b3JzLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iaW53YWxrLzAwMDUtQWN0dWFsbHktaW1wbGVtZW50LWV4cG9uZW50LWFuZC1zaGlmdC1vcGVy
YXRvcnMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4zNzhjMWQ3
YzYKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJpbndhbGsvMDAwNS1BY3R1YWxseS1pbXBsZW1lbnQtZXhwb25lbnQtYW5kLXNo
aWZ0LW9wZXJhdG9ycy5wYXRjaApAQCAtMCwwICsxLDM4IEBACitGcm9tIGVhMzU1ZDMxYzUyOTIw
MzMxOWZiMDJlMjU3NzY4NjI0NjkyMzU1MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBNYXJjdXMgVCA8bGxhbWFzb2Z0QHJtLXJmLmVtYWlsPgorRGF0ZTogRnJpLCAyNiBGZWIgMjAy
MSAxNjoxNTozNiAtMDgwMAorU3ViamVjdDogW1BBVENIXSBBY3R1YWxseSBpbXBsZW1lbnQgZXhw
b25lbnQgYW5kIHNoaWZ0IG9wZXJhdG9ycworCitUaGVzZSBvcGVyYXRvcnMgYXJlIGxpc3RlZCBp
biB0aGUgIlNpZ25hdHVyZSBGaWxlIEZvcm1hdCIgd2lraSBwYWdlIGJ1dCBkb24ndCBhY3R1YWxs
eSBleGlzdC4KKy0tLQorIHNyYy9iaW53YWxrL2NvcmUvbWFnaWMucHkgfCAxMCArKysrKysrKy0t
CisgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlm
ZiAtLWdpdCBhL3NyYy9iaW53YWxrL2NvcmUvbWFnaWMucHkgYi9zcmMvYmlud2Fsay9jb3JlL21h
Z2ljLnB5CitpbmRleCA4ZjdhMzE2Li5iY2M2ZGM3IDEwMDY0NAorLS0tIGEvc3JjL2JpbndhbGsv
Y29yZS9tYWdpYy5weQorKysrIGIvc3JjL2JpbndhbGsvY29yZS9tYWdpYy5weQorQEAgLTk3LDcg
Kzk3LDcgQEAgY2xhc3MgU2lnbmF0dXJlTGluZShvYmplY3QpOgorICAgICAgICAgIyBBTkQgdGhl
IGRhdGEgd2l0aCAweEZGIGJlZm9yZSB0aGUgY29tcGFyaXNvbiBpcyBwZXJmb3JtZWQpLgorICAg
ICAgICAgIworICAgICAgICAgIyBXZSBzdXBwb3J0IHRoZSBmb2xsb3dpbmcgb3BlcmF0b3JzOgor
LSAgICAgICAgZm9yIG9wZXJhdG9yIGluIFsnJicsICd8JywgJyonLCAnKycsICctJywgJy8nLCAn
ficsICdeJ106CisrICAgICAgICBmb3Igb3BlcmF0b3IgaW4gWycqKicsICc8PCcsICc+PicsICcm
JywgJ3wnLCAnKicsICcrJywgJy0nLCAnLycsICd+JywgJ14nXToKKyAgICAgICAgICAgICAjIExv
b2sgZm9yIGVhY2ggb3BlcmF0b3IgaW4gc2VsZi50eXBlCisgICAgICAgICAgICAgaWYgb3BlcmF0
b3IgaW4gc2VsZi50eXBlOgorICAgICAgICAgICAgICAgICAjIElmIGZvdW5kLCBzcGxpdCBzZWxm
LnR5cGUgaW50byB0aGUgdHlwZSBhbmQgb3BlcmF0b3IgdmFsdWUKK0BAIC02MzIsNyArNjMyLDEz
IEBAIGNsYXNzIE1hZ2ljKG9iamVjdCk6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9w
dmFsID0gc2VsZi5fZG9fbWF0aChvZmZzZXQsIGxpbmUub3B2YWx1ZSkKKyAKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAjIFBlcmZvcm0gdGhlIHNwZWNpZmllZCBvcGVyYXRpb24KKy0gICAgICAg
ICAgICAgICAgICAgICAgICBpZiBsaW5lLm9wZXJhdG9yID09ICcmJzoKKysgICAgICAgICAgICAg
ICAgICAgICAgICBpZiBsaW5lLm9wZXJhdG9yID09ICcqKic6CisrICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGR2YWx1ZSAqKj0gb3B2YWwKKysgICAgICAgICAgICAgICAgICAgICAgICBlbGlm
IGxpbmUub3BlcmF0b3IgPT0gJzw8JzoKKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHZh
bHVlIDw8PSBvcHZhbAorKyAgICAgICAgICAgICAgICAgICAgICAgIGVsaWYgbGluZS5vcGVyYXRv
ciA9PSAnPj4nOgorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdmFsdWUgPj49IG9wdmFs
CisrICAgICAgICAgICAgICAgICAgICAgICAgZWxpZiBsaW5lLm9wZXJhdG9yID09ICcmJzoKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZHZhbHVlICY9IG9wdmFsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgZWxpZiBsaW5lLm9wZXJhdG9yID09ICd8JzoKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHZhbHVlIHw9IG9wdmFsCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwNi1VcGRhdGUtSU5TVEFMTC5t
ZC1iYXNlZC1vbi1tb2Rlcm4tcmVhbGl0aWVzLXdpdGgtcHl0LnBhdGNoIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDYtVXBkYXRlLUlOU1RB
TEwubWQtYmFzZWQtb24tbW9kZXJuLXJlYWxpdGllcy13aXRoLXB5dC5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmQ3Y2EzMDVkNwotLS0gL2Rldi9udWxsCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDA2
LVVwZGF0ZS1JTlNUQUxMLm1kLWJhc2VkLW9uLW1vZGVybi1yZWFsaXRpZXMtd2l0aC1weXQucGF0
Y2gKQEAgLTAsMCArMSwxMDcgQEAKK0Zyb20gM2M1YTdmM2ZiNjMyZjNjNDc4NjNlMmNkMmFhNDI2
ZTIwNmZkMTQxOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIEVhY21lbiA8
cGVhY21lbkByZWZpcm1sYWJzLmNvbT4KK0RhdGU6IFR1ZSwgMTYgTWFyIDIwMjEgMDA6NDQ6NDAg
LTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gVXBkYXRlIElOU1RBTEwubWQgYmFzZWQgb24gbW9kZXJu
IHJlYWxpdGllcyB3aXRoIHB5dGhvbjMKKworLS0tCisgSU5TVEFMTC5tZCB8IDQ1ICsrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvSU5TVEFMTC5t
ZCBiL0lOU1RBTEwubWQKK2luZGV4IGYzOWU5NWIuLmExNGU4YzQgMTAwNjQ0CistLS0gYS9JTlNU
QUxMLm1kCisrKysgYi9JTlNUQUxMLm1kCitAQCAtMSwxOCArMSwxMyBAQAorIEJlZm9yZSBZb3Ug
U3RhcnQKKyA9PT09PT09PT09PT09PT09CisgCistQmlud2FsayBzdXBwb3J0cyBQeXRob24gMi43
IC0gMy54LiBBbHRob3VnaCBtb3N0IHN5c3RlbXMgaGF2ZSBQeXRob24yLjcgc2V0IGFzIHRoZWly
IGRlZmF1bHQgUHl0aG9uIGludGVycHJldGVyLCBiaW53YWxrIGRvZXMgcnVuIGZhc3RlciBpbiBQ
eXRob24zLiBJbnN0YWxsYXRpb24gcHJvY2VkdXJlcyBmb3IgYm90aCBhcmUgcHJvdmlkZWQgYmVs
b3cuCisrQmlud2FsayBzdXBwb3J0cyBQeXRob24gMy42Ky4gCisgCisgSW5zdGFsbGF0aW9uCisg
PT09PT09PT09PT09CisgCisgSW5zdGFsbGF0aW9uIGZvbGxvd3MgdGhlIHR5cGljYWwgUHl0aG9u
IGluc3RhbGxhdGlvbiBwcm9jZWR1cmU6CisgCistYGBgYmFzaAorLSMgUHl0aG9uMi43CistJCBz
dWRvIHB5dGhvbiBzZXR1cC5weSBpbnN0YWxsCistYGBgCistCisgYGBgYmFzaAorICMgUHl0aG9u
My54CisgJCBzdWRvIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbAorQEAgLTI1LDQwICsyMCwyMSBA
QCBEZXBlbmRlbmNpZXMKKyAKKyBCZXNpZGVzIGEgUHl0aG9uIGludGVycHJldGVyLCB0aGVyZSBh
cmUgbm8gaW5zdGFsbGF0aW9uIGRlcGVuZGVuY2llcyBmb3IgYmlud2Fsay4gQWxsIGRlcGVuZGVu
Y2llcyBhcmUgb3B0aW9uYWwgcnVuLXRpbWUgZGVwZW5kZW5jaWVzLCBhbmQgdW5sZXNzIG90aGVy
d2lzZSBzcGVjaWZpZWQsIGFyZSBhdmFpbGFibGUgZnJvbSBtb3N0IExpbnV4IHBhY2thZ2UgbWFu
YWdlcnMuCisgCistQWx0aG91Z2ggYWxsIGJpbndhbGsgcnVuLXRpbWUgZGVwZW5kZW5jaWVzIGFy
ZSBvcHRpb25hbCwgdGhlIGBweXRob24tbHptYWAgbW9kdWxlIGlzIGhpZ2hseSByZWNvbW1lbmRl
ZCBmb3IgaW1wcm92aW5nIHRoZSByZWxpYWJpbGl0eSBvZiBzaWduYXR1cmUgc2NhbnMuIFRoaXMg
bW9kdWxlIGlzIGluY2x1ZGVkIGJ5IGRlZmF1bHQgaW4gUHl0aG9uMywgYnV0IG11c3QgYmUgaW5z
dGFsbGVkIHNlcGFyYXRlbHkgZm9yIFB5dGhvbjIuNzoKKy0KKy1gYGBiYXNoCistJCBzdWRvIGFw
dC1nZXQgaW5zdGFsbCBweXRob24tbHptYQorLWBgYAorLQorIEJpbndhbGsgdXNlcyB0aGUgYG5v
c2V0ZXN0YCBsaWJyYXJ5IGZvciB0ZXN0cyBhbmQgYGNvdmVyYWdlYCBmb3IgdGVzdC1jb3ZlcmFn
ZToKKyAKKyBgYGBiYXNoCisgJCBzdWRvIHBpcCBpbnN0YWxsIG5vc2UgY292ZXJhZ2UKKyBgYGAK
KyAKKy1CaW53YWxrIHVzZXMgdGhlIGBweWNyeXB0b2AgbGlicmFyeSB0byBkZWNyeXB0IHNvbWUg
a25vd24gZW5jcnlwdGVkIGZpcm13YXJlIGltYWdlczoKKytCaW53YWxrIHVzZXMgdGhlIGBweWNy
eXB0b2RvbWVgIChgcHljcnlwdG9gLWNvbXBhdGlibGUgbW9kdWxlIHRoYXQgaXMgc3RpbGwgbWFp
bnRhaW5lZCkgbGlicmFyeSB0byBkZWNyeXB0IHNvbWUga25vd24gZW5jcnlwdGVkIGZpcm13YXJl
IGltYWdlczoKKyAKKyBgYGBiYXNoCistIyBQeXRob24yLjcKKy0kIHN1ZG8gYXB0LWdldCBpbnN0
YWxsIHB5dGhvbi1jcnlwdG8KKy1gYGAKKy0KKy1gYGBiYXNoCistIyBQeXRob24zLngKKy0kIHN1
ZG8gYXB0LWdldCBpbnN0YWxsIHB5dGhvbjMtY3J5cHRvCisrJCBzdWRvIHBpcCBpbnN0YWxsIHB5
Y3J5cHRvZG9tZQorIGBgYAorIAorLUJpbndhbGsgdXNlcyBbcHlxdGdyYXBoXShodHRwOi8vd3d3
LnB5cXRncmFwaC5vcmcpIHRvIGdlbmVyYXRlIGdyYXBocyBhbmQgdmlzdWFsaXphdGlvbnMsIHdo
aWNoIHJlcXVpcmVzIHRoZSBmb2xsb3dpbmc6IAorK0JpbndhbGsgdXNlcyBbcHlxdGdyYXBoXSho
dHRwOi8vd3d3LnB5cXRncmFwaC5vcmcpIHRvIGdlbmVyYXRlIGdyYXBocyBhbmQgdmlzdWFsaXph
dGlvbnMsIHdoaWNoIHJlcXVpcmVzIHRoZSBmb2xsb3dpbmcgKGV4YWN0IGRlcGVuZGVuY2llcyBt
YXkgdmFyeSBiYXNlZCBvbiB5b3VyIGRpc3RybyByZWZlciB0byBgZGVwcy5zaGAgZm9yIG1vcmUg
ZGV0YWlscyk6IAorIAorIGBgYGJhc2gKKy0jIFB5dGhvbjIuNworLSQgc3VkbyBhcHQtZ2V0IGlu
c3RhbGwgbGlicXQ0LW9wZW5nbCBweXRob24tb3BlbmdsIHB5dGhvbi1xdDQgcHl0aG9uLXF0NC1n
bCBweXRob24tbnVtcHkgcHl0aG9uLXNjaXB5IHB5dGhvbi1waXAKKy0kIHN1ZG8gcGlwIGluc3Rh
bGwgcHlxdGdyYXBoCistYGBgCistCistYGBgYmFzaAorLSMgUHl0aG9uMy54CisgJCBzdWRvIGFw
dC1nZXQgaW5zdGFsbCBsaWJxdDQtb3BlbmdsIHB5dGhvbjMtb3BlbmdsIHB5dGhvbjMtcHlxdDQg
cHl0aG9uMy1weXF0NC5xdG9wZW5nbCBweXRob24zLW51bXB5IHB5dGhvbjMtc2NpcHkgcHl0aG9u
My1waXAKKyAkIHN1ZG8gcGlwMyBpbnN0YWxsIHB5cXRncmFwaAorIGBgYAorQEAgLTY2LDE3ICs0
Miw5IEBAICQgc3VkbyBwaXAzIGluc3RhbGwgcHlxdGdyYXBoCisgQmlud2FsaydzIGAtLWRpc2Fz
bWAgb3B0aW9uIHJlcXVpcmVzIHRoZSBbQ2Fwc3RvbmVdKGh0dHA6Ly93d3cuY2Fwc3RvbmUtZW5n
aW5lLm9yZy8pIGRpc2Fzc2VtYmx5IGZyYW1ld29yayBhbmQgaXRzIGNvcnJlc3BvbmRpbmcgUHl0
aG9uIGJpbmRpbmdzOgorIAorIGBgYGJhc2gKKy0jIFB5dGhvbjIuNworLSQgc3VkbyBhcHQtZ2V0
IGluc3RhbGwgcHl0aG9uLXBpcAorICQgc3VkbyBwaXAgaW5zdGFsbCBjYXBzdG9uZQorIGBgYAor
IAorLWBgYGJhc2gKKy0jIFB5dGhvbjMueAorLSQgc3VkbyBhcHQtZ2V0IGluc3RhbGwgcHl0aG9u
My1waXAKKy0kIHN1ZG8gcGlwMyBpbnN0YWxsIGNhcHN0b25lCistYGBgCistCisgQmlud2FsayBy
ZWxpZXMgb24gbXVsdGlwbGUgZXh0ZXJuYWwgdXRpbHRpZXMgaW4gb3JkZXIgdG8gYXV0b21hdGlj
YWxseSBleHRyYWN0L2RlY29tcHJlc3MgZmlsZXMgYW5kIGRhdGE6CisgCisgYGBgYmFzaAorQEAg
LTE0NCwxMSArMTEyLDYgQEAgVW5pbnN0YWxsaW5nIEJpbndhbGsKKyAKKyBJZiBiaW53YWxrIGhh
cyBiZWVuIGluc3RhbGxlZCB0byBhIHN0YW5kYXJkIHN5c3RlbSBsb2NhdGlvbiAoZS5nLiwgdmlh
IGBzZXR1cC5weSBpbnN0YWxsYCksIGl0IGNhbiBiZSByZW1vdmVkIGJ5IHJ1bm5pbmc6CisgCist
YGBgYmFzaAorLSMgUHl0aG9uMi43CistJCBzdWRvIHB5dGhvbiBzZXR1cC5weSB1bmluc3RhbGwK
Ky1gYGAKKy0KKyBgYGBiYXNoCisgIyBQeXRob24zCisgJCBzdWRvIHB5dGhvbjMgc2V0dXAucHkg
dW5pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJpbndhbGsvMDAwNy1pbml0aWFsLURvY2tlcmZpbGUtYWxvbmctd2l0aC1jaGFu
Z2VzLXJlcXVpcmVkLWZvci1zLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDctaW5pdGlhbC1Eb2NrZXJmaWxlLWFsb25nLXdpdGgt
Y2hhbmdlcy1yZXF1aXJlZC1mb3Itcy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAuLmE0Y2ViMzhhYQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDA3LWluaXRpYWwtRG9ja2VyZmls
ZS1hbG9uZy13aXRoLWNoYW5nZXMtcmVxdWlyZWQtZm9yLXMucGF0Y2gKQEAgLTAsMCArMSwxMzcg
QEAKK0Zyb20gZWNhOGI1N2YyYTRmNGMzZmQ5NmMzZjlhZjcwNGFjZDAwNjc4MWY1YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIEVhY21lbiA8cGVhY21lbkByZWZpcm1sYWJz
LmNvbT4KK0RhdGU6IE1vbiwgMTUgTWFyIDIwMjEgMTQ6NTQ6MzkgLTA0MDAKK1N1YmplY3Q6IFtQ
QVRDSF0gaW5pdGlhbCBEb2NrZXJmaWxlIGFsb25nIHdpdGggY2hhbmdlcyByZXF1aXJlZCBmb3Ig
c2V0dGluZworIGxvY2FsZSBjb3JyZWN0bHkgaW5zaWRlIERvY2tlciBjb250YWluZXIuCisKKy0t
LQorIC5kb2NrZXJpZ25vcmUgfCAgNSArKysrKworIERvY2tlcmZpbGUgICAgfCA2MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyBkZXBzLnNoICAg
ICAgIHwgMTggKysrKysrKy0tLS0tLS0tLQorIDMgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCisgY3JlYXRlIG1vZGUgMTAwNjQ0IC5kb2NrZXJpZ25vcmUK
KyBjcmVhdGUgbW9kZSAxMDA2NDQgRG9ja2VyZmlsZQorCitkaWZmIC0tZ2l0IGEvLmRvY2tlcmln
bm9yZSBiLy5kb2NrZXJpZ25vcmUKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAw
Li5hZjVjMDNhCistLS0gL2Rldi9udWxsCisrKysgYi8uZG9ja2VyaWdub3JlCitAQCAtMCwwICsx
LDUgQEAKKytidWlsZAorK2Rpc3QKKysuY292ZXJhZ2UKKysqLmV4dHJhY3RlZAorKyoucHljCitk
aWZmIC0tZ2l0IGEvRG9ja2VyZmlsZSBiL0RvY2tlcmZpbGUKK25ldyBmaWxlIG1vZGUgMTAwNjQ0
CitpbmRleCAwMDAwMDAwLi42NDQ1MWZjCistLS0gL2Rldi9udWxsCisrKysgYi9Eb2NrZXJmaWxl
CitAQCAtMCwwICsxLDYwIEBACisrRlJPTSBweXRob246My1idXN0ZXIKKysKKytFTlYgUEFUSCAv
dXNyL2xvY2FsL3NiaW46L3Vzci9sb2NhbC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9i
aW46L3Vzci9zcmMvYXBwL2JpbgorKworKyMgTWFrZSBzdGRvdXQvc3RkZXJyIHVuYnVmZmVyZWQu
IFRoaXMgcHJldmVudHMgZGVsYXkgYmV0d2VlbiBvdXRwdXQgYW5kIGNsb3VkLgorKyMgTWlnaHQg
bm90IGJlIG5lZWRlZCBieSBhbGwgYXBwcywgYnV0IHNsb3cgQUxMIG9mIHRoZW0uIHRlc3QgcGVy
IGFwcC9jb250YWluZXIKKysjRU5WIFBZVEhPTlVOQlVGRkVSRUQgIjEiCisrCisrIyMjIFRvIHBy
ZXZlbnQgdGhlIERlYmlhbiBpbnN0YWxsZXIgZnJvbSBmcmVha2luZyBvdXQgb24gY29uZmlndXJh
dGlvbiBvZiBwYWNrYWdlcworK0VOViBERUJJQU5fRlJPTlRFTkQgbm9uaW50ZXJhY3RpdmUKKysK
KysjIFBpbm5lZCB2ZXJzaW9ucyBvZiBmZXcgb2RkYmFsbCBkZXBlbmRlbmNpZXMKKytFTlYgU0FT
UVVBVENIX0NPTU1JVCAzZTBjYzQwZmM2ZGJlMzJiZDNhNWU2YzU1M2IzMzIwZDVkOTFjZWVkCisr
RU5WIFVCSVJFQURFUl9DT01NSVQgMDk1NWU2Yjk1ZjA3ZDg0OWExODIxMjU5MTlhMWYyYjY3OTBk
NWI1MQorK0VOViBCSU5XQUxLX0NPTU1JVCAgIDMxNTRiMDAxMmU3ZGJhZjJiMjBlZGQ1YzBhMjM1
MGVjNjQwMDk4NjkKKysKKytDT1BZIC4gL3RtcAorKworK1dPUktESVIgL3RtcAorKworKyMjIyBU
b29rIG91dCB0aGUgZGVwcy5zaCBmcm9tIGJpbndhbGsncyBpbnN0YWxsYXRpb24gc2NyaXB0LCBi
YWtlZCBpbiB0aGUgZGVwZW5kZW5jaWVzIGludG8gdGhlIG1haW4gcHJlcmVxcyBpbnN0YWxsYXRp
b24KKysjIyMgVGhlIHByZXJlcXMgdGhhdCBkb250IGNvbWUgZnJvbSBzeXN0ZW0ncyByZXBvLCBh
cmUgdGFrZW4gY2FyZSBvZiBsYXRlcgorK1JVTiBzZXQgLXh1ZSBcCisrICAgICYmIGFwdC1nZXQg
dXBkYXRlIC1xeSBcCisrICAgICYmIGFwdC1nZXQgLXQgYnVzdGVyIGRpc3QtdXBncmFkZSAteXEg
LS1uby1pbnN0YWxsLXJlY29tbWVuZHMgLW8gRHBrZzo6T3B0aW9uczo6PSItLWZvcmNlLWNvbmZv
bGQiIFwKKysgICAgJiYgLi9kZXBzLnNoIC0teWVzIFwKKysgICAgJiYgcHl0aG9uMyBzZXR1cC5w
eSBpbnN0YWxsICYmIGJpbndhbGsgLWggPiAvZGV2L251bGwgXAorKyAgICAmJiBlY2hvICJlbl9V
Uy5VVEYtOCBVVEYtOCIgPj4gL2V0Yy9sb2NhbGUuZ2VuIFwKKysgICAgJiYgZWNobyAiTEFORz1l
bl9VUy5VVEYtOCIgPj4gL2V0Yy9kZWZhdWx0L2xvY2FsZSBcCisrICAgICYmIGVjaG8gIkxBTkdV
QUdFPWVuX1VTOmVuIiA+PiAvZXRjL2RlZmF1bHQvbG9jYWxlIFwKKysgICAgJiYgZWNobyAiTENf
QUxMPWVuX1VTLlVURi04IiA+PiAvZXRjL2RlZmF1bHQvbG9jYWxlIFwKKysgICAgJiYgbG9jYWxl
LWdlbiBcCisrICAgICYmIGFwdC1nZXQgLXkgYXV0b3JlbW92ZSBcCisrICAgICYmIGFwdC1nZXQg
LXkgYXV0b2NsZWFuIFwKKysgICAgJiYgdXNlcmFkZCAtbSAtdSAxMDAwIC1zIC9zYmluL25vbG9n
aW4gYXBwdXNlciBcCisrICAgICYmIHJtIC1yZiAtLSBcCisrICAgICAgICAvdmFyL2xpYi9hcHQv
bGlzdHMvKiBcCisrICAgICAgICAvdG1wLyogL3Zhci90bXAvKiBcCisrICAgICAgICAvdXNyL3Ny
Yy9hcHAvKi53aGwgL3Vzci9zcmMvYXBwLyoudGFyLmd6IFwKKysgICAgICAgIC9yb290Ly5jYWNo
ZS9waXAgXAorKyAgICAgICAgL3Vzci9zcmMvYXBwL3JlcG9zIFwKKysgICAgICAgIC91c3Ivc3Jj
L2FwcC8uZ2l0IFwKKysgICAgICAgIC91c3Ivc3JjL2FwcC9zcmMKKysKKysKKytFTlYgREVCSUFO
X0ZST05URU5EIHRlbGV0eXBlCisrIyBTZXR1cCBsb2NhbGUuIFRoaXMgcHJldmVudHMgUHl0aG9u
IDMgSU8gZW5jb2RpbmcgaXNzdWVzLgorK0VOViBMQU5HIGVuX1VTLlVURi04CisrRU5WIExBTkdV
QUdFIGVuX1VTOmVuCisrRU5WIExDX0FMTCBlbl9VUy5VVEYtOAorK0VOViBQWVRIT05VVEY4ICIx
IgorK0VOViBQWVRIT05IQVNIU0VFRCAicmFuZG9tIgorKworK1dPUktESVIgL2hvbWUvYXBwdXNl
cgorK1VTRVIgYXBwdXNlcgorKworKyMgZHVtbXkgcnVuIGJlY2F1c2UgaXQgY3JlYXRlcyBzb21l
IGZpbGVzIG9uIGZpcnN0IHJ1biBpbiBob21lIGRpcgorK1JVTiBiaW53YWxrIC1oID4gL2Rldi9u
dWxsCisrCisrRU5UUllQT0lOVCBbImJpbndhbGsiXQorZGlmZiAtLWdpdCBhL2RlcHMuc2ggYi9k
ZXBzLnNoCitpbmRleCA1MzIxYjM3Li43YzBiMzkxIDEwMDc1NQorLS0tIGEvZGVwcy5zaAorKysr
IGIvZGVwcy5zaAorQEAgLTQxLDIzICs0MSwyMyBAQCBBUFRHRVRDTUQ9ImFwdC1nZXQiCisgWVVN
Q01EPSJ5dW0iCisgaWYgWyAkZGlzdHJvID0gIkthbGkiIF0KKyB0aGVuCistICAgIEFQVF9DQU5E
SURBVEVTPSJnaXQgYnVpbGQtZXNzZW50aWFsIHF0NWJhc2UtZGV2IG10ZC11dGlscyBnemlwIGJ6
aXAyIHRhciBhcmogbGhhc2EgcDd6aXAgcDd6aXAtZnVsbCBjYWJleHRyYWN0IHV0aWwtbGludXgg
ZmlybXdhcmUtbW9kLWtpdCBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xzIHpsaWIxZy1kZXYgbGli
bHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRrIGx6b3AgY3BpbyIKKysg
ICAgQVBUX0NBTkRJREFURVM9ImdpdCBsb2NhbGVzIGJ1aWxkLWVzc2VudGlhbCBxdDViYXNlLWRl
diBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNhIHA3emlwIHA3emlwLWZ1bGwgY2Fi
ZXh0cmFjdCB1dGlsLWxpbnV4IGZpcm13YXJlLW1vZC1raXQgY3JhbWZzc3dhcCBzcXVhc2hmcy10
b29scyB6bGliMWctZGV2IGxpYmx6bWEtZGV2IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0
LWpkayBsem9wIGNwaW8iCisgZWxpZiBbICRkaXN0cm9fdmVyc2lvbiA9ICIxNCIgXQorIHRoZW4K
Ky0gICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1lc3NlbnRpYWwgbGlicXQ0LW9wZW5nbCBt
dGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNhIHA3emlwIHA3emlwLWZ1bGwgY2FiZXh0
cmFjdCBjcmFtZnNwcm9ncyBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xzIHpsaWIxZy1kZXYgbGli
bHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRrIGx6b3Agc3JlY29yZCBj
cGlvIgorKyAgICBBUFRfQ0FORElEQVRFUz0iZ2l0IGxvY2FsZXMgYnVpbGQtZXNzZW50aWFsIGxp
YnF0NC1vcGVuZ2wgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3pp
cC1mdWxsIGNhYmV4dHJhY3QgY3JhbWZzcHJvZ3MgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6
bGliMWctZGV2IGxpYmx6bWEtZGV2IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBs
em9wIHNyZWNvcmQgY3BpbyIKKyBlbGlmIFsgJGRpc3Ryb192ZXJzaW9uID0gIjE1IiBdCisgdGhl
bgorLSAgICBBUFRfQ0FORElEQVRFUz0iZ2l0IGJ1aWxkLWVzc2VudGlhbCBsaWJxdDQtb3Blbmds
IG10ZC11dGlscyBnemlwIGJ6aXAyIHRhciBhcmogbGhhc2EgcDd6aXAgcDd6aXAtZnVsbCBjYWJl
eHRyYWN0IGNyYW1mc3Byb2dzIGNyYW1mc3N3YXAgc3F1YXNoZnMtdG9vbHMgemxpYjFnLWRldiBs
aWJsem1hLWRldiBsaWJsem8yLWRldiBzbGV1dGhraXQgZGVmYXVsdC1qZGsgbHpvcCBzcmVjb3Jk
IGNwaW8iCisrICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgbG9jYWxlcyBidWlsZC1lc3NlbnRpYWwg
bGlicXQ0LW9wZW5nbCBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNhIHA3emlwIHA3
emlwLWZ1bGwgY2FiZXh0cmFjdCBjcmFtZnNwcm9ncyBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xz
IHpsaWIxZy1kZXYgbGlibHptYS1kZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRr
IGx6b3Agc3JlY29yZCBjcGlvIgorIGVsaWYgWyAkZGlzdHJvX3ZlcnNpb24gPSAiMTYiIF0KKyB0
aGVuCistICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgYnVpbGQtZXNzZW50aWFsIGxpYnF0NC1vcGVu
Z2wgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1mdWxsIGNh
YmV4dHJhY3QgY3JhbWZzcHJvZ3MgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6bGliMWctZGV2
IGxpYmx6bWEtZGV2IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBsem9wIHNyZWNv
cmQgY3BpbyIKKysgICAgQVBUX0NBTkRJREFURVM9ImdpdCBsb2NhbGVzIGJ1aWxkLWVzc2VudGlh
bCBsaWJxdDQtb3BlbmdsIG10ZC11dGlscyBnemlwIGJ6aXAyIHRhciBhcmogbGhhc2EgcDd6aXAg
cDd6aXAtZnVsbCBjYWJleHRyYWN0IGNyYW1mc3Byb2dzIGNyYW1mc3N3YXAgc3F1YXNoZnMtdG9v
bHMgemxpYjFnLWRldiBsaWJsem1hLWRldiBsaWJsem8yLWRldiBzbGV1dGhraXQgZGVmYXVsdC1q
ZGsgbHpvcCBzcmVjb3JkIGNwaW8iCisgZWxpZiBbICRkaXN0cm9fdmVyc2lvbiA9ICIxOCIgXQor
IHRoZW4KKy0gICAgQVBUX0NBTkRJREFURVM9ImdpdCBidWlsZC1lc3NlbnRpYWwgbGlicXQ0LW9w
ZW5nbCBtdGQtdXRpbHMgZ3ppcCBiemlwMiB0YXIgYXJqIGxoYXNhIHA3emlwIHA3emlwLWZ1bGwg
Y2FiZXh0cmFjdCBjcmFtZnNzd2FwIHNxdWFzaGZzLXRvb2xzIHpsaWIxZy1kZXYgbGlibHptYS1k
ZXYgbGlibHpvMi1kZXYgc2xldXRoa2l0IGRlZmF1bHQtamRrIGx6b3Agc3JlY29yZCBjcGlvIgor
KyAgICBBUFRfQ0FORElEQVRFUz0iZ2l0IGxvY2FsZXMgYnVpbGQtZXNzZW50aWFsIGxpYnF0NC1v
cGVuZ2wgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1mdWxs
IGNhYmV4dHJhY3QgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6bGliMWctZGV2IGxpYmx6bWEt
ZGV2IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBsem9wIHNyZWNvcmQgY3BpbyIK
KyBlbHNlCistICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgYnVpbGQtZXNzZW50aWFsIHF0YmFzZTUt
ZGV2IG10ZC11dGlscyBnemlwIGJ6aXAyIHRhciBhcmogbGhhc2EgcDd6aXAgcDd6aXAtZnVsbCBj
YWJleHRyYWN0IGNyYW1mc3N3YXAgc3F1YXNoZnMtdG9vbHMgemxpYjFnLWRldiBsaWJsem1hLWRl
diBsaWJsem8yLWRldiBzbGV1dGhraXQgZGVmYXVsdC1qZGsgbHpvcCBzcmVjb3JkIGNwaW8iCisr
ICAgIEFQVF9DQU5ESURBVEVTPSJnaXQgbG9jYWxlcyBidWlsZC1lc3NlbnRpYWwgcXRiYXNlNS1k
ZXYgbXRkLXV0aWxzIGd6aXAgYnppcDIgdGFyIGFyaiBsaGFzYSBwN3ppcCBwN3ppcC1mdWxsIGNh
YmV4dHJhY3QgY3JhbWZzc3dhcCBzcXVhc2hmcy10b29scyB6bGliMWctZGV2IGxpYmx6bWEtZGV2
IGxpYmx6bzItZGV2IHNsZXV0aGtpdCBkZWZhdWx0LWpkayBsem9wIHNyZWNvcmQgY3BpbyIKKyBm
aQorLVBZVEhPTjNfQVBUX0NBTkRJREFURVM9InB5dGhvbjMtY3J5cHRvIHB5dGhvbjMtZ251cGcg
cHl0aG9uMy1waXAgcHl0aG9uMy10ayIKKytQWVRIT04zX0FQVF9DQU5ESURBVEVTPSIiCisgUFlU
SE9OM19ZVU1fQ0FORElEQVRFUz0iIgorIFlVTV9DQU5ESURBVEVTPSJnaXQgZ2NjIGdjYy1jKysg
bWFrZSBvcGVuc3NsLWRldmVsIHF0d2Via2l0LWRldmVsIHF0LWRldmVsIGd6aXAgYnppcDIgdGFy
IGFyaiBwN3ppcCBwN3ppcC1wbHVnaW5zIGNhYmV4dHJhY3Qgc3F1YXNoZnMtdG9vbHMgemxpYiB6
bGliLWRldmVsIGx6byBsem8tZGV2ZWwgeHogeHotY29tcGF0LWxpYnMgeHotbGlicyB4ei1kZXZl
bCB4ei1sem1hLWNvbXBhdCBweXRob24tYmFja3BvcnRzLWx6bWEgbHppcCBweWxpYmx6bWEgcGVy
bC1Db21wcmVzcy1SYXctTHptYSBsem9wIHNyZWNvcmQiCisgUElQX0NPTU1BTkRTPSJwaXAzIgor
QEAgLTI1Niw5ICsyNTYsNyBAQCBpZiBbICQ/IC1uZSAwIF0KKyAgICAgZWNobyAiUGFja2FnZSBp
bnN0YWxsYXRpb24gZmFpbGVkOiAkUEtHX0NBTkRJREFURVMiCisgICAgIGV4aXQgMQorIGZpCist
aW5zdGFsbF9waXBfcGFja2FnZSBzZXR1cHRvb2xzCistaW5zdGFsbF9waXBfcGFja2FnZSBtYXRw
bG90bGliCistaW5zdGFsbF9waXBfcGFja2FnZSBjYXBzdG9uZQorK2luc3RhbGxfcGlwX3BhY2th
Z2UgInNldHVwdG9vbHMgbWF0cGxvdGxpYiBjYXBzdG9uZSBjcnlwdG8gZ251cGcgdGsiCisgaW5z
dGFsbF9zYXNxdWF0Y2gKKyBpbnN0YWxsX3lhZmZzaGl2CisgaW5zdGFsbF9qZWZmZXJzb24KZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlu
d2Fsay8wMDA4LWltcGxlbWVudC1tdWx0aS1zdGFnZS1idWlsZC1hbmQtdGVzdC1zdGFnZS1pbmNs
dWRlLUQucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJpbndhbGsvMDAwOC1pbXBsZW1lbnQtbXVsdGktc3RhZ2UtYnVpbGQtYW5kLXRlc3Qtc3RhZ2Ut
aW5jbHVkZS1ELnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYzcx
ZjdlYzM5Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iaW53YWxrLzAwMDgtaW1wbGVtZW50LW11bHRpLXN0YWdlLWJ1aWxkLWFu
ZC10ZXN0LXN0YWdlLWluY2x1ZGUtRC5wYXRjaApAQCAtMCwwICsxLDE1OCBAQAorRnJvbSAyZTM4
ZWMyMTkzOTczZjU4ZGFlMzY0NThlYTIwZDA0YTI2ZDYwYmY5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogUGV0ZXIgRWFjbWVuIDxwZWFjbWVuQHJlZmlybWxhYnMuY29tPgorRGF0ZTog
TW9uLCAxNSBNYXIgMjAyMSAyMzozMTowNyAtMDQwMAorU3ViamVjdDogW1BBVENIXSBpbXBsZW1l
bnQgbXVsdGktc3RhZ2UgYnVpbGQgYW5kIHRlc3Qgc3RhZ2UsIGluY2x1ZGUgRG9ja2VyCisgYnVp
bGQgaW4gVHJhdmlzIGludGVncmF0aW9uIHRlc3RpbmcKKworLS0tCisgLmRvY2tlcmlnbm9yZSB8
ICA2ICsrKysrKworIC50cmF2aXMueW1sICAgfCAyOCArKysrKysrKysrKysrKysrKy0tLS0tLS0K
KyBEb2NrZXJmaWxlICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCisgMyBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA0MiBk
ZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhLy5kb2NrZXJpZ25vcmUgYi8uZG9ja2VyaWdub3Jl
CitpbmRleCBhZjVjMDNhLi4yOWY3MDk4IDEwMDY0NAorLS0tIGEvLmRvY2tlcmlnbm9yZQorKysr
IGIvLmRvY2tlcmlnbm9yZQorQEAgLTMsMyArMyw5IEBAIGRpc3QKKyAuY292ZXJhZ2UKKyAqLmV4
dHJhY3RlZAorICoucHljCisrLmVkaXRvcmNvbmZpZworKy5naXRpZ25vcmUKKytpbWFnZXMKKytE
b2NrZXJmaWxlCisrLmRvY2tlcmlnbm9yZQorKy5naXQKK2RpZmYgLS1naXQgYS8udHJhdmlzLnlt
bCBiLy50cmF2aXMueW1sCitpbmRleCBkMmIwNjhkLi44NDM0YTRkIDEwMDY0NAorLS0tIGEvLnRy
YXZpcy55bWwKKysrKyBiLy50cmF2aXMueW1sCitAQCAtMTMsMTkgKzEzLDMxIEBAIHNjcmlwdDog
Li9zZXR1cC5weSB0ZXN0CisgY2FjaGU6IHBpcAorIGpvYnM6CisgICBpbmNsdWRlOgorLSAgIC0g
ZGlzdDogYmlvbmljCisrICAgLSBzdGFnZTogdGVzdAorKyAgICAgZGlzdDogYmlvbmljCisgICAg
ICBweXRob246IDMuNgorLSAgIC0gZGlzdDogYmlvbmljCisrICAgLSBzdGFnZTogdGVzdAorKyAg
ICAgZGlzdDogYmlvbmljCisgICAgICBweXRob246IDMuNworLSAgIC0gZGlzdDogYmlvbmljCisr
ICAgLSBzdGFnZTogdGVzdAorKyAgICAgZGlzdDogYmlvbmljCisgICAgICBweXRob246IDMuOAor
LSAgIC0gZGlzdDogYmlvbmljCisrICAgLSBzdGFnZTogdGVzdAorKyAgICAgZGlzdDogYmlvbmlj
CisgICAgICBweXRob246IDMuOQorLSAgIC0gZGlzdDogZm9jYWwKKysgICAtIHN0YWdlOiB0ZXN0
CisrICAgICBkaXN0OiBmb2NhbAorICAgICAgcHl0aG9uOiAzLjYKKy0gICAtIGRpc3Q6IGZvY2Fs
CisrICAgLSBzdGFnZTogdGVzdAorKyAgICAgZGlzdDogZm9jYWwKKyAgICAgIHB5dGhvbjogMy43
CistICAgLSBkaXN0OiBmb2NhbAorKyAgIC0gc3RhZ2U6IHRlc3QKKysgICAgIGRpc3Q6IGZvY2Fs
CisgICAgICBweXRob246IDMuOAorLSAgIC0gZGlzdDogZm9jYWwKKysgICAtIHN0YWdlOiB0ZXN0
CisrICAgICBkaXN0OiBmb2NhbAorICAgICAgcHl0aG9uOiAzLjkKKysgICAtIHN0YWdlOiB0ZXN0
CisrICAgICBzZXJ2aWNlczogZG9ja2VyCisrICAgICBpbnN0YWxsOiAKKysgICAgICAgLSBkb2Nr
ZXIgYnVpbGQgLgorZGlmZiAtLWdpdCBhL0RvY2tlcmZpbGUgYi9Eb2NrZXJmaWxlCitpbmRleCA2
NDQ1MWZjLi43YjY2MjliIDEwMDY0NAorLS0tIGEvRG9ja2VyZmlsZQorKysrIGIvRG9ja2VyZmls
ZQorQEAgLTEsMjEgKzEsMTIgQEAKKy1GUk9NIHB5dGhvbjozLWJ1c3RlcgorK0ZST00gcHl0aG9u
OjMtYnVzdGVyIEFTIGJ1aWxkLWFuZC1pbnN0YWxsCisgCistRU5WIFBBVEggL3Vzci9sb2NhbC9z
YmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi91c3Ivc3Jj
L2FwcC9iaW4KKy0KKy0jIE1ha2Ugc3Rkb3V0L3N0ZGVyciB1bmJ1ZmZlcmVkLiBUaGlzIHByZXZl
bnRzIGRlbGF5IGJldHdlZW4gb3V0cHV0IGFuZCBjbG91ZC4KKy0jIE1pZ2h0IG5vdCBiZSBuZWVk
ZWQgYnkgYWxsIGFwcHMsIGJ1dCBzbG93IEFMTCBvZiB0aGVtLiB0ZXN0IHBlciBhcHAvY29udGFp
bmVyCistI0VOViBQWVRIT05VTkJVRkZFUkVEICIxIgorLQorLSMjIyBUbyBwcmV2ZW50IHRoZSBE
ZWJpYW4gaW5zdGFsbGVyIGZyb20gZnJlYWtpbmcgb3V0IG9uIGNvbmZpZ3VyYXRpb24gb2YgcGFj
a2FnZXMKKy1FTlYgREVCSUFOX0ZST05URU5EIG5vbmludGVyYWN0aXZlCistCistIyBQaW5uZWQg
dmVyc2lvbnMgb2YgZmV3IG9kZGJhbGwgZGVwZW5kZW5jaWVzCistRU5WIFNBU1FVQVRDSF9DT01N
SVQgM2UwY2M0MGZjNmRiZTMyYmQzYTVlNmM1NTNiMzMyMGQ1ZDkxY2VlZAorLUVOViBVQklSRUFE
RVJfQ09NTUlUIDA5NTVlNmI5NWYwN2Q4NDlhMTgyMTI1OTE5YTFmMmI2NzkwZDViNTEKKy1FTlYg
QklOV0FMS19DT01NSVQgICAzMTU0YjAwMTJlN2RiYWYyYjIwZWRkNWMwYTIzNTBlYzY0MDA5ODY5
CisrRU5WIFBBVEg9L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNy
L2Jpbjovc2JpbjovYmluOi91c3Ivc3JjL2FwcC9iaW4gXAorKyAgICBERUJJQU5fRlJPTlRFTkQ9
bm9uaW50ZXJhY3RpdmUgXAorKyAgICBTQVNRVUFUQ0hfQ09NTUlUPTNlMGNjNDBmYzZkYmUzMmJk
M2E1ZTZjNTUzYjMzMjBkNWQ5MWNlZWQgXAorKyAgICBVQklSRUFERVJfQ09NTUlUPTA5NTVlNmI5
NWYwN2Q4NDlhMTgyMTI1OTE5YTFmMmI2NzkwZDViNTEgXAorKyAgICBCSU5XQUxLX0NPTU1JVD0z
MTU0YjAwMTJlN2RiYWYyYjIwZWRkNWMwYTIzNTBlYzY0MDA5ODY5CisgCisgQ09QWSAuIC90bXAK
Ky0KKyBXT1JLRElSIC90bXAKKyAKKyAjIyMgVG9vayBvdXQgdGhlIGRlcHMuc2ggZnJvbSBiaW53
YWxrJ3MgaW5zdGFsbGF0aW9uIHNjcmlwdCwgYmFrZWQgaW4gdGhlIGRlcGVuZGVuY2llcyBpbnRv
IHRoZSBtYWluIHByZXJlcXMgaW5zdGFsbGF0aW9uCitAQCAtMjUsMzYgKzE2LDM2IEBAIFJVTiBz
ZXQgLXh1ZSBcCisgICAgICYmIGFwdC1nZXQgLXQgYnVzdGVyIGRpc3QtdXBncmFkZSAteXEgLS1u
by1pbnN0YWxsLXJlY29tbWVuZHMgLW8gRHBrZzo6T3B0aW9uczo6PSItLWZvcmNlLWNvbmZvbGQi
IFwKKyAgICAgJiYgLi9kZXBzLnNoIC0teWVzIFwKKyAgICAgJiYgcHl0aG9uMyBzZXR1cC5weSBp
bnN0YWxsICYmIGJpbndhbGsgLWggPiAvZGV2L251bGwgXAorKyAgICAmJiBhcHQtZ2V0IC15cSBw
dXJnZSAqLWRldiBnaXQgYnVpbGQtZXNzZW50aWFsIGdjYyBnKysgXAorKyAgICAmJiBhcHQtZ2V0
IC15IGF1dG9yZW1vdmUgXAorKyAgICAmJiBhcHQtZ2V0IC15IGF1dG9jbGVhbiBcCisgICAgICYm
IGVjaG8gImVuX1VTLlVURi04IFVURi04IiA+PiAvZXRjL2xvY2FsZS5nZW4gXAorICAgICAmJiBl
Y2hvICJMQU5HPWVuX1VTLlVURi04IiA+PiAvZXRjL2RlZmF1bHQvbG9jYWxlIFwKKyAgICAgJiYg
ZWNobyAiTEFOR1VBR0U9ZW5fVVM6ZW4iID4+IC9ldGMvZGVmYXVsdC9sb2NhbGUgXAorICAgICAm
JiBlY2hvICJMQ19BTEw9ZW5fVVMuVVRGLTgiID4+IC9ldGMvZGVmYXVsdC9sb2NhbGUgXAorLSAg
ICAmJiBsb2NhbGUtZ2VuIFwKKy0gICAgJiYgYXB0LWdldCAteSBhdXRvcmVtb3ZlIFwKKy0gICAg
JiYgYXB0LWdldCAteSBhdXRvY2xlYW4gXAorLSAgICAmJiB1c2VyYWRkIC1tIC11IDEwMDAgLXMg
L3NiaW4vbm9sb2dpbiBhcHB1c2VyIFwKKysgICAgJiYgbG9jYWxlLWdlbgorKworK0ZST00gYnVp
bGQtYW5kLWluc3RhbGwgQVMgdW5pdC10ZXN0cworK1JVTiBwaXAgaW5zdGFsbCBjb3ZlcmFnZSBu
b3NlIFwKKysgICAgJiYgcHl0aG9uMyBzZXR1cC5weSB0ZXN0IFwKKysgICAgJiYgZGQgaWY9L2Rl
di91cmFuZG9tIG9mPS90bXAvcmFuZG9tLmJpbiBicz0xTSBjb3VudD0xICYmIGJpbndhbGsgLUog
LUUgL3RtcC9yYW5kb20uYmluCisrCisrRlJPTSBidWlsZC1hbmQtaW5zdGFsbCBBUyBjbGVhbnVw
LWFuZC1yZWxlYXNlCisrUlVOIHVzZXJhZGQgLW0gLXUgMTAwMCAtcyAvc2Jpbi9ub2xvZ2luIGFw
cHVzZXIgXAorICAgICAmJiBybSAtcmYgLS0gXAorICAgICAgICAgL3Zhci9saWIvYXB0L2xpc3Rz
LyogXAorICAgICAgICAgL3RtcC8qIC92YXIvdG1wLyogXAorLSAgICAgICAgL3Vzci9zcmMvYXBw
Lyoud2hsIC91c3Ivc3JjL2FwcC8qLnRhci5neiBcCistICAgICAgICAvcm9vdC8uY2FjaGUvcGlw
IFwKKy0gICAgICAgIC91c3Ivc3JjL2FwcC9yZXBvcyBcCistICAgICAgICAvdXNyL3NyYy9hcHAv
LmdpdCBcCistICAgICAgICAvdXNyL3NyYy9hcHAvc3JjCistCisrICAgICAgICAvcm9vdC8uY2Fj
aGUvcGlwCisgCistRU5WIERFQklBTl9GUk9OVEVORCB0ZWxldHlwZQorICMgU2V0dXAgbG9jYWxl
LiBUaGlzIHByZXZlbnRzIFB5dGhvbiAzIElPIGVuY29kaW5nIGlzc3Vlcy4KKy1FTlYgTEFORyBl
bl9VUy5VVEYtOAorLUVOViBMQU5HVUFHRSBlbl9VUzplbgorLUVOViBMQ19BTEwgZW5fVVMuVVRG
LTgKKy1FTlYgUFlUSE9OVVRGOCAiMSIKKy1FTlYgUFlUSE9OSEFTSFNFRUQgInJhbmRvbSIKKytF
TlYgREVCSUFOX0ZST05URU5EPXRlbGV0eXBlIFwKKysgICAgTEFORz1lbl9VUy5VVEYtOCBcCisr
ICAgIExBTkdVQUdFPWVuX1VTOmVuIFwKKysgICAgTENfQUxMPWVuX1VTLlVURi04IFwKKysgICAg
UFlUSE9OVVRGOD0iMSIgXAorKyAgICBQWVRIT05IQVNIU0VFRD0icmFuZG9tIgorIAorIFdPUktE
SVIgL2hvbWUvYXBwdXNlcgorIFVTRVIgYXBwdXNlcgorIAorLSMgZHVtbXkgcnVuIGJlY2F1c2Ug
aXQgY3JlYXRlcyBzb21lIGZpbGVzIG9uIGZpcnN0IHJ1biBpbiBob21lIGRpcgorLVJVTiBiaW53
YWxrIC1oID4gL2Rldi9udWxsCistCisgRU5UUllQT0lOVCBbImJpbndhbGsiXQpkaWZmIC0tZ2l0
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAw
MDktZml4LXRyYXZpcy1zY3JpcHQucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAwOS1maXgtdHJhdmlzLXNjcmlwdC5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjcwYmVmMGEwMwotLS0gL2Rldi9udWxs
CisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fs
ay8wMDA5LWZpeC10cmF2aXMtc2NyaXB0LnBhdGNoCkBAIC0wLDAgKzEsNTAgQEAKK0Zyb20gM2Zl
ZTAzYTRlM2Y1NmNlNjQ0M2FiNjViYTJlMmY0YmY1Mzk1YTI5MCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IFBldGVyIEVhY21lbiA8cGVhY21lbkByZWZpcm1sYWJzLmNvbT4KK0RhdGU6
IE1vbiwgMTUgTWFyIDIwMjEgMjM6NDc6NTUgLTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gZml4IHRy
YXZpcyBzY3JpcHQKKworLS0tCisgLnRyYXZpcy55bWwgfCA5ICsrKysrLS0tLQorIERvY2tlcmZp
bGUgIHwgNSArLS0tLQorIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvLnRyYXZpcy55bWwgYi8udHJhdmlzLnltbAoraW5kZXgg
ODQzNGE0ZC4uN2M3NGNjNyAxMDA2NDQKKy0tLSBhLy50cmF2aXMueW1sCisrKysgYi8udHJhdmlz
LnltbAorQEAgLTEzLDYgKzEzLDExIEBAIHNjcmlwdDogLi9zZXR1cC5weSB0ZXN0CisgY2FjaGU6
IHBpcAorIGpvYnM6CisgICBpbmNsdWRlOgorKyAgIC0gc3RhZ2U6IHRlc3QKKysgICAgIHNlcnZp
Y2VzOiBkb2NrZXIKKysgICAgIGluc3RhbGw6IAorKyAgICAgICAtIGRvY2tlciBidWlsZCAuCisr
ICAgICBzY3JpcHQ6IG5vCisgICAgLSBzdGFnZTogdGVzdAorICAgICAgZGlzdDogYmlvbmljCisg
ICAgICBweXRob246IDMuNgorQEAgLTM3LDcgKzQyLDMgQEAgam9iczoKKyAgICAtIHN0YWdlOiB0
ZXN0CisgICAgICBkaXN0OiBmb2NhbAorICAgICAgcHl0aG9uOiAzLjkKKy0gICAtIHN0YWdlOiB0
ZXN0CistICAgICBzZXJ2aWNlczogZG9ja2VyCistICAgICBpbnN0YWxsOiAKKy0gICAgICAgLSBk
b2NrZXIgYnVpbGQgLgorZGlmZiAtLWdpdCBhL0RvY2tlcmZpbGUgYi9Eb2NrZXJmaWxlCitpbmRl
eCA3YjY2MjliLi4wNTZiMGEwIDEwMDY0NAorLS0tIGEvRG9ja2VyZmlsZQorKysrIGIvRG9ja2Vy
ZmlsZQorQEAgLTEsMTAgKzEsNyBAQAorIEZST00gcHl0aG9uOjMtYnVzdGVyIEFTIGJ1aWxkLWFu
ZC1pbnN0YWxsCisgCisgRU5WIFBBVEg9L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91
c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi91c3Ivc3JjL2FwcC9iaW4gXAorLSAgICBERUJJ
QU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUgXAorLSAgICBTQVNRVUFUQ0hfQ09NTUlUPTNlMGNj
NDBmYzZkYmUzMmJkM2E1ZTZjNTUzYjMzMjBkNWQ5MWNlZWQgXAorLSAgICBVQklSRUFERVJfQ09N
TUlUPTA5NTVlNmI5NWYwN2Q4NDlhMTgyMTI1OTE5YTFmMmI2NzkwZDViNTEgXAorLSAgICBCSU5X
QUxLX0NPTU1JVD0zMTU0YjAwMTJlN2RiYWYyYjIwZWRkNWMwYTIzNTBlYzY0MDA5ODY5CisrICAg
IERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFjdGl2ZQorIAorIENPUFkgLiAvdG1wCisgV09SS0RJ
UiAvdG1wCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJpbndhbGsvMDAxMC1zdGlsbC1uby1sb3ZlLWZvci10cmF2aXMucGF0Y2ggYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxMC1zdGls
bC1uby1sb3ZlLWZvci10cmF2aXMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwLi5lZGIwYjIzYWQKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxMC1zdGlsbC1uby1sb3ZlLWZvci10
cmF2aXMucGF0Y2gKQEAgLTAsMCArMSwyNSBAQAorRnJvbSAxYzRkYzk3NGE5NjNkNjk3MTMxMzAw
MDMyNjE3YjUwMTQwNDVmNjJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIg
RWFjbWVuIDxwZWFjbWVuQHJlZmlybWxhYnMuY29tPgorRGF0ZTogTW9uLCAxNSBNYXIgMjAyMSAy
Mzo1NDo0MCAtMDQwMAorU3ViamVjdDogW1BBVENIXSBzdGlsbCBubyBsb3ZlIGZvciB0cmF2aXMK
KworLS0tCisgLnRyYXZpcy55bWwgfCA1ICsrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhLy50cmF2aXMueW1sIGIvLnRy
YXZpcy55bWwKK2luZGV4IDdjNzRjYzcuLjkwZjNjZmEgMTAwNjQ0CistLS0gYS8udHJhdmlzLnlt
bAorKysrIGIvLnRyYXZpcy55bWwKK0BAIC0xNSw5ICsxNSw4IEBAIGpvYnM6CisgICBpbmNsdWRl
OgorICAgIC0gc3RhZ2U6IHRlc3QKKyAgICAgIHNlcnZpY2VzOiBkb2NrZXIKKy0gICAgIGluc3Rh
bGw6IAorLSAgICAgICAtIGRvY2tlciBidWlsZCAuCistICAgICBzY3JpcHQ6IG5vCisrICAgICBp
bnN0YWxsOiBlY2hvICJObyBpbnN0YWxsIGZvciB0aGlzIGpvYiIKKysgICAgIHNjcmlwdDogZG9j
a2VyIGJ1aWxkIC4KKyAgICAtIHN0YWdlOiB0ZXN0CisgICAgICBkaXN0OiBiaW9uaWMKKyAgICAg
IHB5dGhvbjogMy42CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJpbndhbGsvMDAxMS10cmFuc2l0aW9uLXRvLXVzZS1vZi1jcnlwdG9kb21l
LXNpbmNlLXB5Y3J5cHRvLWlzLUVPLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTEtdHJhbnNpdGlvbi10by11c2Utb2YtY3J5cHRv
ZG9tZS1zaW5jZS1weWNyeXB0by1pcy1FTy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAuLmI4ZTdmNGNhNQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDExLXRyYW5zaXRpb24tdG8t
dXNlLW9mLWNyeXB0b2RvbWUtc2luY2UtcHljcnlwdG8taXMtRU8ucGF0Y2gKQEAgLTAsMCArMSwy
MiBAQAorRnJvbSA4NzJhNjRiMDA4NTk5ODBiNTA3ODg4ZmE5YjZhZDZhMmViZjU4MGQ1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgRWFjbWVuIDxwZWFjbWVuQHJlZmlybWxh
YnMuY29tPgorRGF0ZTogVHVlLCAxNiBNYXIgMjAyMSAwMDoxNDowMCAtMDQwMAorU3ViamVjdDog
W1BBVENIXSB0cmFuc2l0aW9uIHRvIHVzZSBvZiBjcnlwdG9kb21lIHNpbmNlIHB5Y3J5cHRvIGlz
IEVPTAorCistLS0KKyBkZXBzLnNoIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvZGVwcy5zaCBiL2RlcHMuc2gKK2lu
ZGV4IDdjMGIzOTEuLjk1OTU2NjAgMTAwNzU1CistLS0gYS9kZXBzLnNoCisrKysgYi9kZXBzLnNo
CitAQCAtMjU2LDcgKzI1Niw3IEBAIGlmIFsgJD8gLW5lIDAgXQorICAgICBlY2hvICJQYWNrYWdl
IGluc3RhbGxhdGlvbiBmYWlsZWQ6ICRQS0dfQ0FORElEQVRFUyIKKyAgICAgZXhpdCAxCisgZmkK
Ky1pbnN0YWxsX3BpcF9wYWNrYWdlICJzZXR1cHRvb2xzIG1hdHBsb3RsaWIgY2Fwc3RvbmUgY3J5
cHRvIGdudXBnIHRrIgorK2luc3RhbGxfcGlwX3BhY2thZ2UgInNldHVwdG9vbHMgbWF0cGxvdGxp
YiBjYXBzdG9uZSBweWNyeXB0b2RvbWUgZ251cGcgdGsiCisgaW5zdGFsbF9zYXNxdWF0Y2gKKyBp
bnN0YWxsX3lhZmZzaGl2CisgaW5zdGFsbF9qZWZmZXJzb24KZGlmZiAtLWdpdCBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDEyLUNhbGwtdW56
aXAtd2l0aC1lbXB0eS1wYXNzd29yZC10by1hdm9pZC11bnppcC1zdHVjay0ucGF0Y2ggYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxMi1DYWxs
LXVuemlwLXdpdGgtZW1wdHktcGFzc3dvcmQtdG8tYXZvaWQtdW56aXAtc3R1Y2stLnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYTFhYzQ2OTQ4Ci0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53
YWxrLzAwMTItQ2FsbC11bnppcC13aXRoLWVtcHR5LXBhc3N3b3JkLXRvLWF2b2lkLXVuemlwLXN0
dWNrLS5wYXRjaApAQCAtMCwwICsxLDIzIEBACitGcm9tIGZiMTBkM2NhNTMwYmU2YzE1YzYwNWRl
OWRhMWMxMGUxZTI1ZjdhNzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBvd2wgPG93
bDEyOUAxMjYuY29tPgorRGF0ZTogVHVlLCAxNiBNYXIgMjAyMSAxNzo0MTowOSArMDgwMAorU3Vi
amVjdDogW1BBVENIXSBDYWxsICd1bnppcCcgd2l0aCBlbXB0eSBwYXNzd29yZCwgdG8gYXZvaWQg
J3VuemlwJyBzdHVjayBpbgorIGludGVyYWN0aXZlIG1vZGUgd2hlbiBwcm9jZXNzIGVuY3J5cHQg
ZmlsZXMKKworLS0tCisgc3JjL2JpbndhbGsvY29uZmlnL2V4dHJhY3QuY29uZiB8IDIgKy0KKyAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdp
dCBhL3NyYy9iaW53YWxrL2NvbmZpZy9leHRyYWN0LmNvbmYgYi9zcmMvYmlud2Fsay9jb25maWcv
ZXh0cmFjdC5jb25mCitpbmRleCAxYjI0ZjA2Li41YjU0ZjcyIDEwMDY0NAorLS0tIGEvc3JjL2Jp
bndhbGsvY29uZmlnL2V4dHJhY3QuY29uZgorKysrIGIvc3JjL2JpbndhbGsvY29uZmlnL2V4dHJh
Y3QuY29uZgorQEAgLTUyLDcgKzUyLDcgQEAKKyAjIDd6IGhhbmRsZXMgbW9zdCB6aXAgZmlsZXMs
IGJ1dCBmYWlscyBvbiBzb21lIHppcCBhcmNoaXZlcywgaW5leHBsaWNhYmx5IHNlZWluZworICMg
b25seSB0aGUgKmxhc3QqIGVudHJ5IGluIHRoZSB6aXAgYXJjaGl2ZSAodGhvdWdoIDd6IHRoaW5r
cyBpdCBzdWNjZWVkZWQpLiBTZWUKKyAjIFN0YXJDYW0gZmlybXdhcmUgQ0gtc3lzLTQ4LjUzLjY0
LjY3LnppcC4KKy1eemlwIGFyY2hpdmUgZGF0YTp6aXA6dW56aXAgLW8gJyVlJzowCisrXnppcCBh
cmNoaXZlIGRhdGE6emlwOnVuemlwIC1QICcnIC1vICclZSc6MAorIF56aXAgYXJjaGl2ZSBkYXRh
OnppcDpqYXIgeHZmICclZSc6MAorIF56aXAgYXJjaGl2ZSBkYXRhOnppcDo3eiB4IC15ICclZScg
LXAgJyc6MCwxCisgCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJpbndhbGsvMDAxMy1VYnVudHUtRm9jYWwtaXMtUHl0aG9uLTMtYnktZGVm
YXVsdC5wYXRjaCBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Ymlud2Fsay8wMDEzLVVidW50dS1Gb2NhbC1pcy1QeXRob24tMy1ieS1kZWZhdWx0LnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYWFmYTBkNThjCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53
YWxrLzAwMTMtVWJ1bnR1LUZvY2FsLWlzLVB5dGhvbi0zLWJ5LWRlZmF1bHQucGF0Y2gKQEAgLTAs
MCArMSwyNCBAQAorRnJvbSA1ZDNhMzc3NjQ2M2ZiN2I4MzYxZWYyMTg0NzhiZTkyOWQ5YjhhZDU2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQ2hyaXN0aWFuIENsYXVzcyA8Y2NsYXVz
c0BtZS5jb20+CitEYXRlOiBUdWUsIDE2IE1hciAyMDIxIDE5OjE5OjMzICswMTAwCitTdWJqZWN0
OiBbUEFUQ0hdIFVidW50dSBGb2NhbCBpcyBQeXRob24gMyBieSBkZWZhdWx0CisKK2h0dHBzOi8v
d2lraS51YnVudHUuY29tL0ZvY2FsRm9zc2EvUmVsZWFzZU5vdGVzI1B5dGhvbjNfYnlfZGVmYXVs
dAorU2V2ZXJhbCBvdGhlciBkaXN0cm9zIGFzIHdlbGwuCistLS0KKyBSRUFETUUubWQgfCAyICst
CisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYg
LS1naXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQKK2luZGV4IGMyMDc0Y2IuLjU1MTkwYjcgMTAw
NjQ0CistLS0gYS9SRUFETUUubWQKKysrKyBiL1JFQURNRS5tZAorQEAgLTksNyArOSw3IEBAIEJp
bndhbGsgaXMgYSBmYXN0LCBlYXN5IHRvIHVzZSB0b29sIGZvciBhbmFseXppbmcsIHJldmVyc2Ug
ZW5naW5lZXJpbmcsIGFuZCBleHRyCisgCisgIyMjICoqKiBQeXRob24gMi43IERlcHJlY2F0aW9u
IE5vdGljZSAqKioKKyAKKy1FdmVuIHRob3VnaCBldmVyeSBtYWpvciBMaW51eCBkaXN0cm8gaXMg
c3RpbGwgc2hpcHBpbmcgcHl0aG9uIDIuNyBhcyB0aGUgZGVmYXVsdCBpbnRlcnByZXRlciBpbiB0
aGVpciBjdXJyZW50bHkgc3RhYmxlIHJlbGVhc2UsIHdlIGFyZSBtYWtpbmcgdGhlIGRpZmZpY3Vs
dCBkZWNpc2lvbiB0byBtb3ZlIGJpbndhbGsgc3VwcG9ydCBleGNsdXNpdmVseSBpbnRvIHB5dGhv
bjMuIFRoaXMgaXMgbGlrZWx5IHRvIG1ha2UgbWFueSB1cHNldCBhbmQgb3RoZXJzIHJlam9pY2Uu
IElmIHlvdSBuZWVkIHRvIGluc3RhbGwgYmlud2FsayBpbnRvIGEgUHl0aG9uIDIuNyBlbnZpcm9u
bWVudCB3ZSB3aWxsIGJlIGNyZWF0aW5nIGEgdGFnIGBweXRob24yN2AgdGhhdCB3aWxsIGJlIGEg
c25hcHNob3Qgb2YgYG1hc3RlcmAgYmVmb3JlIGFsbCBvZiB0aGVzZSBtYWpvciBjaGFuZ2VzIGFy
ZSBtYWRlLiBUaGFuayB5b3UgZm9yIGJlaW5nIHBhdGllbnQgd2l0aCB1cyB0aHJvdWdoIHRoaXMg
dHJhbnNpdGlvbiBwcm9jZXNzLgorK0V2ZW4gdGhvdWdoIG1hbnkgbWFqb3IgTGludXggZGlzdHJv
cyBhcmUgc3RpbGwgc2hpcHBpbmcgUHl0aG9uIDIuNyBhcyB0aGUgZGVmYXVsdCBpbnRlcnByZXRl
ciBpbiB0aGVpciBjdXJyZW50bHkgc3RhYmxlIHJlbGVhc2UsIHdlIGFyZSBtYWtpbmcgdGhlIGRp
ZmZpY3VsdCBkZWNpc2lvbiB0byBtb3ZlIGJpbndhbGsgc3VwcG9ydCBleGNsdXNpdmVseSB0byBQ
eXRob24gMy4gVGhpcyBpcyBsaWtlbHkgdG8gbWFrZSBtYW55IHVwc2V0IGFuZCBvdGhlcnMgcmVq
b2ljZS4gSWYgeW91IG5lZWQgdG8gaW5zdGFsbCBiaW53YWxrIGludG8gYSBQeXRob24gMi43IGVu
dmlyb25tZW50IHdlIHdpbGwgYmUgY3JlYXRpbmcgYSB0YWcgYHB5dGhvbjI3YCB0aGF0IHdpbGwg
YmUgYSBzbmFwc2hvdCBvZiBgbWFzdGVyYCBiZWZvcmUgYWxsIG9mIHRoZXNlIG1ham9yIGNoYW5n
ZXMgYXJlIG1hZGUuIFRoYW5rIHlvdSBmb3IgYmVpbmcgcGF0aWVudCB3aXRoIHVzIHRocm91Z2gg
dGhpcyB0cmFuc2l0aW9uIHByb2Nlc3MuCisgCisgIyMjIEluc3RhbGxhdGlvbiBhbmQgVXNhZ2UK
KyAKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmlud2Fsay8wMDE0LWZhaWwtZGVwcy5zaC1pZi1hbnktaW5zdGFsbC1jb21tYW5kLWZhaWxz
LnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53
YWxrLzAwMTQtZmFpbC1kZXBzLnNoLWlmLWFueS1pbnN0YWxsLWNvbW1hbmQtZmFpbHMucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi42MTlhNDgzY2EKLS0tIC9kZXYv
bnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJp
bndhbGsvMDAxNC1mYWlsLWRlcHMuc2gtaWYtYW55LWluc3RhbGwtY29tbWFuZC1mYWlscy5wYXRj
aApAQCAtMCwwICsxLDUxIEBACitGcm9tIGUzMGY4MGRmZGEzNGQwODQ1ZGQ1ZWRjNThmZmNmY2Yy
N2I4NGI4MmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBFYWNtZW4gPHBl
YWNtZW5AcmVmaXJtbGFicy5jb20+CitEYXRlOiBXZWQsIDI0IE1hciAyMDIxIDE3OjM4OjMxIC0w
NDAwCitTdWJqZWN0OiBbUEFUQ0hdIGZhaWwgZGVwcy5zaCBpZiBhbnkgaW5zdGFsbCBjb21tYW5k
IGZhaWxzCisKKy0tLQorIC5naXRpZ25vcmUgfCAxICsKKyBkZXBzLnNoICAgIHwgNSArKysrLQor
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYg
LS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQoraW5kZXggYWY1YzAzYS4uYjJlMTY3ZSAx
MDA2NDQKKy0tLSBhLy5naXRpZ25vcmUKKysrKyBiLy5naXRpZ25vcmUKK0BAIC0zLDMgKzMsNCBA
QCBkaXN0CisgLmNvdmVyYWdlCisgKi5leHRyYWN0ZWQKKyAqLnB5YworKyoqLyouZWdnLWluZm8K
K1wgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQorZGlmZiAtLWdpdCBhL2RlcHMuc2ggYi9kZXBz
LnNoCitpbmRleCA5NTk1NjYwLi41MDcyYzcwIDEwMDc1NQorLS0tIGEvZGVwcy5zaAorKysrIGIv
ZGVwcy5zaAorQEAgLTgsNyArOCw5IEBAIGVsc2UKKyAgICAgWUVTPTAKKyBmaQorIAorK3NldCAt
ZXUKKyBzZXQgLW8gbm91bnNldAorK3NldCAteAorIAorIGlmICEgd2hpY2ggbHNiX3JlbGVhc2Ug
PiAvZGV2L251bGwKKyB0aGVuCitAQCAtNjUsNiArNjcsNyBAQCBQSVBfQ09NTUFORFM9InBpcDMi
CisgIyBDaGVjayBmb3Igcm9vdCBwcml2aWxlZ2VzCisgaWYgWyAkVUlEIC1lcSAwIF0KKyB0aGVu
CisrICAgIGVjaG8gIlVJRCBpcyAwLCBzdWRvIG5vdCByZXF1aXJlZCIKKyAgICAgU1VETz0iIgor
IGVsc2UKKyAgICAgU1VETz0ic3VkbyIKK0BAIC04MCw3ICs4Myw3IEBAIGZ1bmN0aW9uIGluc3Rh
bGxfeWFmZnNoaXYKKyAKKyBmdW5jdGlvbiBpbnN0YWxsX3Nhc3F1YXRjaAorIHsKKy0gICAgZ2l0
IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZ0dHlzMC9zYXNxdWF0Y2gKKysgICAgZ2l0IGNs
b25lIC0tcXVpZXQgLS1kZXB0aCAxIC0tYnJhbmNoICJwYXRjaC0xIiBodHRwczovL2dpdGh1Yi5j
b20vZWFjbWVuL3Nhc3F1YXRjaAorICAgICAoY2Qgc2FzcXVhdGNoICYmICRTVURPIC4vYnVpbGQu
c2gpCisgICAgICRTVURPIHJtIC1yZiBzYXNxdWF0Y2gKKyB9CmRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxNS13ZS1uby1s
b25nZXItbmVlZC10by1iaWZ1cmNhdGUtcHl0aG9uMy1hbmQtcHl0aG9uMi1kLnBhdGNoIGIvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTUtd2Ut
bm8tbG9uZ2VyLW5lZWQtdG8tYmlmdXJjYXRlLXB5dGhvbjMtYW5kLXB5dGhvbjItZC5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjJlMzgyZDgwMQotLS0gL2Rldi9u
dWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlu
d2Fsay8wMDE1LXdlLW5vLWxvbmdlci1uZWVkLXRvLWJpZnVyY2F0ZS1weXRob24zLWFuZC1weXRo
b24yLWQucGF0Y2gKQEAgLTAsMCArMSw2MyBAQAorRnJvbSA4YTJlNzg2YWZmYjA3MTg0M2YxYTgw
OGIwODRkNWUwOWU2ZjAwMzlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIg
RWFjbWVuIDxwZWFjbWVuQHJlZmlybWxhYnMuY29tPgorRGF0ZTogV2VkLCAyNCBNYXIgMjAyMSAx
ODoxOTo1MCAtMDQwMAorU3ViamVjdDogW1BBVENIXSB3ZSBubyBsb25nZXIgbmVlZCB0byBiaWZ1
cmNhdGUgcHl0aG9uMyBhbmQgcHl0aG9uMiBkZXBzCisKKy0tLQorIC50cmF2aXMueW1sIHwgIDEg
KworIGRlcHMuc2ggICAgIHwgMTYgKystLS0tLS0tLS0tLS0tLQorIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhLy50cmF2aXMu
eW1sIGIvLnRyYXZpcy55bWwKK2luZGV4IDkwZjNjZmEuLjRlZmUwNDkgMTAwNjQ0CistLS0gYS8u
dHJhdmlzLnltbAorKysrIGIvLnRyYXZpcy55bWwKK0BAIC0yLDYgKzIsNyBAQCBvczogbGludXgK
KyBkaXN0OiBiaW9uaWMKKyBsYW5ndWFnZTogcHl0aG9uCisgYXJjaDogYW1kNjQKKytzdWRvOiB0
cnVlCisgYWRkb25zOgorICAgYXB0OgorICAgICB1cGRhdGU6IHRydWUKK2RpZmYgLS1naXQgYS9k
ZXBzLnNoIGIvZGVwcy5zaAoraW5kZXggNTA3MmM3MC4uMDNkZjc0YiAxMDA3NTUKKy0tLSBhL2Rl
cHMuc2gKKysrKyBiL2RlcHMuc2gKK0BAIC02Miw3ICs2Miw3IEBAIGZpCisgUFlUSE9OM19BUFRf
Q0FORElEQVRFUz0iIgorIFBZVEhPTjNfWVVNX0NBTkRJREFURVM9IiIKKyBZVU1fQ0FORElEQVRF
Uz0iZ2l0IGdjYyBnY2MtYysrIG1ha2Ugb3BlbnNzbC1kZXZlbCBxdHdlYmtpdC1kZXZlbCBxdC1k
ZXZlbCBnemlwIGJ6aXAyIHRhciBhcmogcDd6aXAgcDd6aXAtcGx1Z2lucyBjYWJleHRyYWN0IHNx
dWFzaGZzLXRvb2xzIHpsaWIgemxpYi1kZXZlbCBsem8gbHpvLWRldmVsIHh6IHh6LWNvbXBhdC1s
aWJzIHh6LWxpYnMgeHotZGV2ZWwgeHotbHptYS1jb21wYXQgcHl0aG9uLWJhY2twb3J0cy1sem1h
IGx6aXAgcHlsaWJsem1hIHBlcmwtQ29tcHJlc3MtUmF3LUx6bWEgbHpvcCBzcmVjb3JkIgorLVBJ
UF9DT01NQU5EUz0icGlwMyIKKytQSVBfQ09NTUFORFM9InBpcCIKKyAKKyAjIENoZWNrIGZvciBy
b290IHByaXZpbGVnZXMKKyBpZiBbICRVSUQgLWVxIDAgXQorQEAgLTEzNCwxMSArMTM0LDcgQEAg
ZnVuY3Rpb24gaW5zdGFsbF91YmlyZWFkZXIKKyBmdW5jdGlvbiBpbnN0YWxsX3BpcF9wYWNrYWdl
CisgeworICAgICBQQUNLQUdFPSIkMSIKKy0KKy0gICAgZm9yIFBJUF9DT01NQU5EIGluICRQSVBf
Q09NTUFORFMKKy0gICAgZG8KKy0gICAgICAgICRTVURPICRQSVBfQ09NTUFORCBpbnN0YWxsICRQ
QUNLQUdFCistICAgIGRvbmUKKysgICAgJFNVRE8gcGlwIGluc3RhbGwgJFBBQ0tBR0UKKyB9Cisg
CisgZnVuY3Rpb24gZmluZF9wYXRoCitAQCAtMjQzLDE0ICsyMzksNiBAQCB0aGVuCisgICAgIGV4
aXQgMQorIGZpCisgCistIyBDaGVjayB0byBzZWUgaWYgd2Ugc2hvdWxkIGluc3RhbGwgbW9kdWxl
cyBmb3IgcHl0aG9uMyBhcyB3ZWxsCistZmluZF9wYXRoIHB5dGhvbjMKKy1pZiBbICQ/IC1lcSAw
IF0KKy10aGVuCistICAgICBQS0dfQ0FORElEQVRFUz0iJFBLR19DQU5ESURBVEVTICRQS0dfUFlU
SE9OM19DQU5ESURBVEVTIgorLSAgICAgUElQX0NPTU1BTkRTPSJwaXAzICRQSVBfQ09NTUFORFMi
CistZmkKKy0KKyAjIERvIHRoZSBpbnN0YWxsKHMpCisgY2QgL3RtcAorICRTVURPICRQS0dDTUQg
JFBLR0NNRF9PUFRTICRQS0dfQ0FORElEQVRFUwpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTYtdXNpbmctcGlwMy1pcy1j
YXVzaW5nLWlzc3Vlcy11c2Utd2hhdGV2ZXItcGlwLXRoZS11cy5wYXRjaCBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDE2LXVzaW5nLXBpcDMt
aXMtY2F1c2luZy1pc3N1ZXMtdXNlLXdoYXRldmVyLXBpcC10aGUtdXMucGF0Y2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5iMmE4ZGMxZTYKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAx
Ni11c2luZy1waXAzLWlzLWNhdXNpbmctaXNzdWVzLXVzZS13aGF0ZXZlci1waXAtdGhlLXVzLnBh
dGNoCkBAIC0wLDAgKzEsNDQgQEAKK0Zyb20gZGNiNDA4MDFhZWU4YmUwNmEzOTFkYjgzZDMwNTdj
MDBjM2VmZDg2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIEVhY21lbiA8
cGVhY21lbkByZWZpcm1sYWJzLmNvbT4KK0RhdGU6IFdlZCwgMjQgTWFyIDIwMjEgMTg6NDA6NDMg
LTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gdXNpbmcgcGlwMyBpcyBjYXVzaW5nIGlzc3VlcywgdXNl
IHdoYXRldmVyIHBpcCB0aGUgdXNlciBoYXMKKyBpbiB0aGVpciBlbnZpcm9ubWVudAorCistLS0K
KyAudHJhdmlzLnltbCB8IDEgLQorIGRlcHMuc2ggICAgIHwgMyArLS0KKyAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvLnRyYXZp
cy55bWwgYi8udHJhdmlzLnltbAoraW5kZXggNGVmZTA0OS4uOTBmM2NmYSAxMDA2NDQKKy0tLSBh
Ly50cmF2aXMueW1sCisrKysgYi8udHJhdmlzLnltbAorQEAgLTIsNyArMiw2IEBAIG9zOiBsaW51
eAorIGRpc3Q6IGJpb25pYworIGxhbmd1YWdlOiBweXRob24KKyBhcmNoOiBhbWQ2NAorLXN1ZG86
IHRydWUKKyBhZGRvbnM6CisgICBhcHQ6CisgICAgIHVwZGF0ZTogdHJ1ZQorZGlmZiAtLWdpdCBh
L2RlcHMuc2ggYi9kZXBzLnNoCitpbmRleCAwM2RmNzRiLi4yMzBiOGNjIDEwMDc1NQorLS0tIGEv
ZGVwcy5zaAorKysrIGIvZGVwcy5zaAorQEAgLTYyLDcgKzYyLDYgQEAgZmkKKyBQWVRIT04zX0FQ
VF9DQU5ESURBVEVTPSIiCisgUFlUSE9OM19ZVU1fQ0FORElEQVRFUz0iIgorIFlVTV9DQU5ESURB
VEVTPSJnaXQgZ2NjIGdjYy1jKysgbWFrZSBvcGVuc3NsLWRldmVsIHF0d2Via2l0LWRldmVsIHF0
LWRldmVsIGd6aXAgYnppcDIgdGFyIGFyaiBwN3ppcCBwN3ppcC1wbHVnaW5zIGNhYmV4dHJhY3Qg
c3F1YXNoZnMtdG9vbHMgemxpYiB6bGliLWRldmVsIGx6byBsem8tZGV2ZWwgeHogeHotY29tcGF0
LWxpYnMgeHotbGlicyB4ei1kZXZlbCB4ei1sem1hLWNvbXBhdCBweXRob24tYmFja3BvcnRzLWx6
bWEgbHppcCBweWxpYmx6bWEgcGVybC1Db21wcmVzcy1SYXctTHptYSBsem9wIHNyZWNvcmQiCist
UElQX0NPTU1BTkRTPSJwaXAiCisgCisgIyBDaGVjayBmb3Igcm9vdCBwcml2aWxlZ2VzCisgaWYg
WyAkVUlEIC1lcSAwIF0KK0BAIC05MSw3ICs5MCw3IEBAIGZ1bmN0aW9uIGluc3RhbGxfc2FzcXVh
dGNoCisgZnVuY3Rpb24gaW5zdGFsbF9qZWZmZXJzb24KKyB7CisgICAgIGdpdCBjbG9uZSBodHRw
czovL2dpdGh1Yi5jb20vc3ZpZWhiL2plZmZlcnNvbgorLSAgICAoY2QgamVmZmVyc29uICYmICRT
VURPIHBpcDMgaW5zdGFsbCAtciByZXF1aXJlbWVudHMudHh0ICYmICRTVURPIHB5dGhvbjMgc2V0
dXAucHkgaW5zdGFsbCkKKysgICAgKGNkIGplZmZlcnNvbiAmJiAkU1VETyBwaXAgaW5zdGFsbCAt
ciByZXF1aXJlbWVudHMudHh0ICYmICRTVURPIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbCkKKyAg
ICAgJFNVRE8gcm0gLXJmIGplZmZlcnNvbgorIH0KKyAKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDE3LVRyYXZpcy1DSS1k
b2VzLW5vdC1wcmVzZXJ2ZS10aGUtc3BlY2lmaWVkLXB5dGhvbi13aGUucGF0Y2ggYi9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxNy1UcmF2aXMt
Q0ktZG9lcy1ub3QtcHJlc2VydmUtdGhlLXNwZWNpZmllZC1weXRob24td2hlLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNzI2NjcyMzIzCi0tLSAvZGV2L251bGwK
KysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxr
LzAwMTctVHJhdmlzLUNJLWRvZXMtbm90LXByZXNlcnZlLXRoZS1zcGVjaWZpZWQtcHl0aG9uLXdo
ZS5wYXRjaApAQCAtMCwwICsxLDIzIEBACitGcm9tIGUwNDBjZDgyNjMxYTYyY2U1ZmUyY2JjNWYz
MzBmNmZlMmYwYzc2YTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBFYWNt
ZW4gPHBlYWNtZW5AcmVmaXJtbGFicy5jb20+CitEYXRlOiBXZWQsIDI0IE1hciAyMDIxIDE4OjUx
OjU3IC0wNDAwCitTdWJqZWN0OiBbUEFUQ0hdIFRyYXZpcy1DSSBkb2VzIG5vdCBwcmVzZXJ2ZSB0
aGUgc3BlY2lmaWVkIHB5dGhvbiB3aGVuCisgaW52b2tpbmcgc3VkbworCistLS0KKyBkZXBzLnNo
IHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQor
CitkaWZmIC0tZ2l0IGEvZGVwcy5zaCBiL2RlcHMuc2gKK2luZGV4IDIzMGI4Y2MuLjhhMjY3YjEg
MTAwNzU1CistLS0gYS9kZXBzLnNoCisrKysgYi9kZXBzLnNoCitAQCAtNjksNyArNjksNyBAQCB0
aGVuCisgICAgIGVjaG8gIlVJRCBpcyAwLCBzdWRvIG5vdCByZXF1aXJlZCIKKyAgICAgU1VETz0i
IgorIGVsc2UKKy0gICAgU1VETz0ic3VkbyIKKysgICAgU1VETz0ic3VkbyAtRSIKKyAgICAgUkVR
VUlSRURfVVRJTFM9InN1ZG8gJFJFUVVJUkVEX1VUSUxTIgorIGZpCisgCmRpZmYgLS1naXQgYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxOC10
aGVyZS1pcy1uby1yaHltZS1vci1yZWFzb24tdG8tdHJhdmlzLnBhdGNoIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTgtdGhlcmUtaXMtbm8t
cmh5bWUtb3ItcmVhc29uLXRvLXRyYXZpcy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAuLmQ3YjZjMzI1YwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDE4LXRoZXJlLWlzLW5vLXJo
eW1lLW9yLXJlYXNvbi10by10cmF2aXMucGF0Y2gKQEAgLTAsMCArMSwzMSBAQAorRnJvbSA0ZDY5
ZjAxZGE4NTE5ZDU4YmEwNzEzYWExMmM4MzdlZjQyM2M2MDRkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogUGV0ZXIgRWFjbWVuIDxwZWFjbWVuQHJlZmlybWxhYnMuY29tPgorRGF0ZTog
V2VkLCAyNCBNYXIgMjAyMSAxODo1NToyNiAtMDQwMAorU3ViamVjdDogW1BBVENIXSB0aGVyZSBp
cyBubyByaHltZSBvciByZWFzb24gdG8gdHJhdmlzCisKKy0tLQorIGRlcHMuc2ggfCA0ICsrLS0K
KyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZm
IC0tZ2l0IGEvZGVwcy5zaCBiL2RlcHMuc2gKK2luZGV4IDhhMjY3YjEuLjMzOWQ2NmEgMTAwNzU1
CistLS0gYS9kZXBzLnNoCisrKysgYi9kZXBzLnNoCitAQCAtOTAsNyArOTAsNyBAQCBmdW5jdGlv
biBpbnN0YWxsX3Nhc3F1YXRjaAorIGZ1bmN0aW9uIGluc3RhbGxfamVmZmVyc29uCisgeworICAg
ICBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3N2aWVoYi9qZWZmZXJzb24KKy0gICAgKGNk
IGplZmZlcnNvbiAmJiAkU1VETyBwaXAgaW5zdGFsbCAtciByZXF1aXJlbWVudHMudHh0ICYmICRT
VURPIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbCkKKysgICAgKGNkIGplZmZlcnNvbiAmJiAkU1VE
TyBwaXAzIGluc3RhbGwgLXIgcmVxdWlyZW1lbnRzLnR4dCAmJiAkU1VETyBweXRob24zIHNldHVw
LnB5IGluc3RhbGwpCisgICAgICRTVURPIHJtIC1yZiBqZWZmZXJzb24KKyB9CisgCitAQCAtMTMz
LDcgKzEzMyw3IEBAIGZ1bmN0aW9uIGluc3RhbGxfdWJpcmVhZGVyCisgZnVuY3Rpb24gaW5zdGFs
bF9waXBfcGFja2FnZQorIHsKKyAgICAgUEFDS0FHRT0iJDEiCistICAgICRTVURPIHBpcCBpbnN0
YWxsICRQQUNLQUdFCisrICAgICRTVURPIHBpcDMgaW5zdGFsbCAkUEFDS0FHRQorIH0KKyAKKyBm
dW5jdGlvbiBmaW5kX3BhdGgKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDE5LXRyeS10by1wcmVzZXJ2ZS10aGUtcHl0aG9u
LWJlaW5nLXVzZWQtYWNyb3NzLXN1ZG8ucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAxOS10cnktdG8tcHJlc2VydmUtdGhlLXB5dGhv
bi1iZWluZy11c2VkLWFjcm9zcy1zdWRvLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMC4uODBmMWIzYmNkCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMTktdHJ5LXRvLXByZXNlcnZl
LXRoZS1weXRob24tYmVpbmctdXNlZC1hY3Jvc3Mtc3Vkby5wYXRjaApAQCAtMCwwICsxLDU2IEBA
CitGcm9tIDgxNTk0MmJjYWFkOTNiMTYzNjliZTJlNzBlNjFlYjZmZWVkMjExYjQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBFYWNtZW4gPHBlYWNtZW5AcmVmaXJtbGFicy5j
b20+CitEYXRlOiBXZWQsIDI0IE1hciAyMDIxIDE5OjA1OjAyIC0wNDAwCitTdWJqZWN0OiBbUEFU
Q0hdIHRyeSB0byBwcmVzZXJ2ZSB0aGUgcHl0aG9uIGJlaW5nIHVzZWQgYWNyb3NzIHN1ZG8KKwor
LS0tCisgZGVwcy5zaCB8IDkgKysrKystLS0tCisgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2RlcHMuc2ggYi9kZXBzLnNoCitp
bmRleCAzMzlkNjZhLi5mNDRkNDEwIDEwMDc1NQorLS0tIGEvZGVwcy5zaAorKysrIGIvZGVwcy5z
aAorQEAgLTYyLDYgKzYyLDcgQEAgZmkKKyBQWVRIT04zX0FQVF9DQU5ESURBVEVTPSIiCisgUFlU
SE9OM19ZVU1fQ0FORElEQVRFUz0iIgorIFlVTV9DQU5ESURBVEVTPSJnaXQgZ2NjIGdjYy1jKysg
bWFrZSBvcGVuc3NsLWRldmVsIHF0d2Via2l0LWRldmVsIHF0LWRldmVsIGd6aXAgYnppcDIgdGFy
IGFyaiBwN3ppcCBwN3ppcC1wbHVnaW5zIGNhYmV4dHJhY3Qgc3F1YXNoZnMtdG9vbHMgemxpYiB6
bGliLWRldmVsIGx6byBsem8tZGV2ZWwgeHogeHotY29tcGF0LWxpYnMgeHotbGlicyB4ei1kZXZl
bCB4ei1sem1hLWNvbXBhdCBweXRob24tYmFja3BvcnRzLWx6bWEgbHppcCBweWxpYmx6bWEgcGVy
bC1Db21wcmVzcy1SYXctTHptYSBsem9wIHNyZWNvcmQiCisrUFlUSE9OPSIkKHdoaWNoIHB5dGhv
bjMpIgorIAorICMgQ2hlY2sgZm9yIHJvb3QgcHJpdmlsZWdlcworIGlmIFsgJFVJRCAtZXEgMCBd
CitAQCAtNzYsNyArNzcsNyBAQCBmaQorIGZ1bmN0aW9uIGluc3RhbGxfeWFmZnNoaXYKKyB7Cisg
ICAgIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vZGV2dHR5czAveWFmZnNoaXYKKy0gICAg
KGNkIHlhZmZzaGl2ICYmICRTVURPIHB5dGhvbjMgc2V0dXAucHkgaW5zdGFsbCkKKysgICAgKGNk
IHlhZmZzaGl2ICYmICRTVURPICRQWVRIT04gc2V0dXAucHkgaW5zdGFsbCkKKyAgICAgJFNVRE8g
cm0gLXJmIHlhZmZzaGl2CisgfQorIAorQEAgLTkwLDcgKzkxLDcgQEAgZnVuY3Rpb24gaW5zdGFs
bF9zYXNxdWF0Y2gKKyBmdW5jdGlvbiBpbnN0YWxsX2plZmZlcnNvbgorIHsKKyAgICAgZ2l0IGNs
b25lIGh0dHBzOi8vZ2l0aHViLmNvbS9zdmllaGIvamVmZmVyc29uCistICAgIChjZCBqZWZmZXJz
b24gJiYgJFNVRE8gcGlwMyBpbnN0YWxsIC1yIHJlcXVpcmVtZW50cy50eHQgJiYgJFNVRE8gcHl0
aG9uMyBzZXR1cC5weSBpbnN0YWxsKQorKyAgICAoY2QgamVmZmVyc29uICYmICRTVURPICRQWVRI
T04gLW1waXAgaW5zdGFsbCAtciByZXF1aXJlbWVudHMudHh0ICYmICRTVURPICRQWVRIT04gc2V0
dXAucHkgaW5zdGFsbCkKKyAgICAgJFNVRE8gcm0gLXJmIGplZmZlcnNvbgorIH0KKyAKK0BAIC0x
MjYsMTQgKzEyNywxNCBAQCBmdW5jdGlvbiBpbnN0YWxsX2NyYW1mc3Rvb2xzCisgZnVuY3Rpb24g
aW5zdGFsbF91YmlyZWFkZXIKKyB7CisgICAgIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20v
anJzcHJ1aXR0L3ViaV9yZWFkZXIKKy0gICAgKGNkIHViaV9yZWFkZXIgJiYgJFNVRE8gcHl0aG9u
MyBzZXR1cC5weSBpbnN0YWxsKQorKyAgICAoY2QgdWJpX3JlYWRlciAmJiAkU1VETyAkUFlUSE9O
IHNldHVwLnB5IGluc3RhbGwpCisgICAgICRTVURPIHJtIC1yZiB1YmlfcmVhZGVyCisgfQorIAor
IGZ1bmN0aW9uIGluc3RhbGxfcGlwX3BhY2thZ2UKKyB7CisgICAgIFBBQ0tBR0U9IiQxIgorLSAg
ICAkU1VETyBwaXAzIGluc3RhbGwgJFBBQ0tBR0UKKysgICAgJFNVRE8gJFBZVEhPTiAtbXBpcCBp
bnN0YWxsICRQQUNLQUdFCisgfQorIAorIGZ1bmN0aW9uIGZpbmRfcGF0aApkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjAt
bm9wLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1i
aW53YWxrLzAwMjAtbm9wLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MC4uYzY3YWMyMGM1Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjAtbm9wLnBhdGNoCkBAIC0wLDAgKzEsMzEg
QEAKK0Zyb20gODQ2ZGMwZWMwZWUwYjE1MjY0MTZkYzJjNzMzNmUwY2NjM2FjODdhNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIEVhY21lbiA8cGVhY21lbkByZWZpcm1sYWJz
LmNvbT4KK0RhdGU6IFdlZCwgMjQgTWFyIDIwMjEgMTk6MTA6NDEgLTA0MDAKK1N1YmplY3Q6IFtQ
QVRDSF0gbm9wCisKKy0tLQorIC50cmF2aXMueW1sIHwgMTAgKysrKysrLS0tLQorIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS8u
dHJhdmlzLnltbCBiLy50cmF2aXMueW1sCitpbmRleCA5MGYzY2ZhLi44Yjc0MTBhIDEwMDY0NAor
LS0tIGEvLnRyYXZpcy55bWwKKysrKyBiLy50cmF2aXMueW1sCitAQCAtNiwxMSArNiwxMyBAQCBh
ZGRvbnM6CisgICBhcHQ6CisgICAgIHVwZGF0ZTogdHJ1ZQorIGluc3RhbGw6CisrICAtIGV4cG9y
dCBQWVRIT049JCh3aGljaCBweXRob24zKQorICAgLSAuL2RlcHMuc2ggLS15ZXMKKy0gIC0gcGlw
IGluc3RhbGwgY292ZXJhZ2UKKy0gIC0gLi9zZXR1cC5weSBpbnN0YWxsCistc2NyaXB0OiAuL3Nl
dHVwLnB5IHRlc3QKKy1jYWNoZTogcGlwCisrICAtIHN1ZG8gLUUgJFBZVEhPTiAtbXBpcCBpbnN0
YWxsIGNvdmVyYWdlCisrICAtIHN1ZG8gLUUgJFBZVEhPTiAuL3NldHVwLnB5IGluc3RhbGwKKytz
Y3JpcHQ6CisrICAtIGV4cG9ydCBQWVRIT049JCh3aGljaCBweXRob24zKQorKyAgLSBzdWRvIC1F
ICRQWVRIT04gLi9zZXR1cC5weSB0ZXN0Cisgam9iczoKKyAgIGluY2x1ZGU6CisgICAgLSBzdGFn
ZTogdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iaW53YWxrLzAwMjEtc2FzcXVhdGNoLXBhdGNoLXdhcy1tZXJnZWQucGF0Y2ggYi9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyMS1z
YXNxdWF0Y2gtcGF0Y2gtd2FzLW1lcmdlZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAuLjAyYzNlMGQ1NQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDIxLXNhc3F1YXRjaC1wYXRj
aC13YXMtbWVyZ2VkLnBhdGNoCkBAIC0wLDAgKzEsNTYgQEAKK0Zyb20gYjZmNzkzNWU2MzJmYzBj
ZDcxYTU2N2U0OGIwZTgyMDRiYWQ3MDM3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IFBldGVyIEVhY21lbiA8cGVhY21lbkByZWZpcm1sYWJzLmNvbT4KK0RhdGU6IFdlZCwgMjQgTWFy
IDIwMjEgMjE6Mjg6MzcgLTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2FzcXVhdGNoIHBhdGNoIHdh
cyBtZXJnZWQKKworLS0tCisgZGVwcy5zaCB8IDEwICsrKysrLS0tLS0KKyAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvZGVwcy5z
aCBiL2RlcHMuc2gKK2luZGV4IGY0NGQ0MTAuLmNiZDgyMWMgMTAwNzU1CistLS0gYS9kZXBzLnNo
CisrKysgYi9kZXBzLnNoCitAQCAtNzYsMjEgKzc2LDIxIEBAIGZpCisgCisgZnVuY3Rpb24gaW5z
dGFsbF95YWZmc2hpdgorIHsKKy0gICAgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZ0
dHlzMC95YWZmc2hpdgorKyAgICBnaXQgY2xvbmUgLS1xdWlldCAtLWRlcHRoIDEgLS1icmFuY2gg
Im1hc3RlciIgaHR0cHM6Ly9naXRodWIuY29tL2RldnR0eXMwL3lhZmZzaGl2CisgICAgIChjZCB5
YWZmc2hpdiAmJiAkU1VETyAkUFlUSE9OIHNldHVwLnB5IGluc3RhbGwpCisgICAgICRTVURPIHJt
IC1yZiB5YWZmc2hpdgorIH0KKyAKKyBmdW5jdGlvbiBpbnN0YWxsX3Nhc3F1YXRjaAorIHsKKy0g
ICAgZ2l0IGNsb25lIC0tcXVpZXQgLS1kZXB0aCAxIC0tYnJhbmNoICJwYXRjaC0xIiBodHRwczov
L2dpdGh1Yi5jb20vZWFjbWVuL3Nhc3F1YXRjaAorKyAgICBnaXQgY2xvbmUgLS1xdWlldCAtLWRl
cHRoIDEgLS1icmFuY2ggIm1hc3RlciIgaHR0cHM6Ly9naXRodWIuY29tL2RldnR0eXMwL3Nhc3F1
YXRjaAorICAgICAoY2Qgc2FzcXVhdGNoICYmICRTVURPIC4vYnVpbGQuc2gpCisgICAgICRTVURP
IHJtIC1yZiBzYXNxdWF0Y2gKKyB9CisgCisgZnVuY3Rpb24gaW5zdGFsbF9qZWZmZXJzb24KKyB7
CistICAgIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vc3ZpZWhiL2plZmZlcnNvbgorKyAg
ICBnaXQgY2xvbmUgLS1xdWlldCAtLWRlcHRoIDEgLS1icmFuY2ggIm1hc3RlciIgaHR0cHM6Ly9n
aXRodWIuY29tL3N2aWVoYi9qZWZmZXJzb24KKyAgICAgKGNkIGplZmZlcnNvbiAmJiAkU1VETyAk
UFlUSE9OIC1tcGlwIGluc3RhbGwgLXIgcmVxdWlyZW1lbnRzLnR4dCAmJiAkU1VETyAkUFlUSE9O
IHNldHVwLnB5IGluc3RhbGwpCisgICAgICRTVURPIHJtIC1yZiBqZWZmZXJzb24KKyB9CitAQCAt
MTEzLDcgKzExMyw3IEBAIGZ1bmN0aW9uIGluc3RhbGxfY3JhbWZzdG9vbHMKKyAgIElOU1RBTExf
TE9DQVRJT049L3Vzci9sb2NhbC9iaW4KKyAKKyAgICMgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZh
bGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2ZzL2NyYW1mcy9SRUFETUUjTDEwNgorLSAgZ2l0IGNsb25l
IGh0dHBzOi8vZ2l0aHViLmNvbS9ucGl0cmUvY3JhbWZzLXRvb2xzCisrICBnaXQgY2xvbmUgLS1x
dWlldCAtLWRlcHRoIDEgLS1icmFuY2ggIm1hc3RlciIgaHR0cHM6Ly9naXRodWIuY29tL25waXRy
ZS9jcmFtZnMtdG9vbHMKKyAgICMgVGhlcmUgaXMgbm8gIm1ha2UgaW5zdGFsbCIKKyAgIChjZCBj
cmFtZnMtdG9vbHMgXAorICAgJiYgbWFrZSBcCitAQCAtMTI2LDcgKzEyNiw3IEBAIGZ1bmN0aW9u
IGluc3RhbGxfY3JhbWZzdG9vbHMKKyAKKyBmdW5jdGlvbiBpbnN0YWxsX3ViaXJlYWRlcgorIHsK
Ky0gICAgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9qcnNwcnVpdHQvdWJpX3JlYWRlcgor
KyAgICBnaXQgY2xvbmUgLS1xdWlldCAtLWRlcHRoIDEgLS1icmFuY2ggIm1hc3RlciIgaHR0cHM6
Ly9naXRodWIuY29tL2pyc3BydWl0dC91YmlfcmVhZGVyCisgICAgIChjZCB1YmlfcmVhZGVyICYm
ICRTVURPICRQWVRIT04gc2V0dXAucHkgaW5zdGFsbCkKKyAgICAgJFNVRE8gcm0gLXJmIHViaV9y
ZWFkZXIKKyB9CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJpbndhbGsvMDAyMi1hZGQtdGhpcmQtcGFydHktTk9USUNFLW1hcmtkb3duLnBh
dGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxr
LzAwMjItYWRkLXRoaXJkLXBhcnR5LU5PVElDRS1tYXJrZG93bi5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmMxNWMxN2QzYQotLS0gL2Rldi9udWxsCisrKyBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDIyLWFk
ZC10aGlyZC1wYXJ0eS1OT1RJQ0UtbWFya2Rvd24ucGF0Y2gKQEAgLTAsMCArMSwyNyBAQAorRnJv
bSAxNDFmNzRlZWE5ZWI0ZjY5OWIxNTJlNGUwZThhN2Q2YmRmMzAyOTk3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgRWFjbWVuIDxwZWFjbWVuQHJlZmlybWxhYnMuY29tPgor
RGF0ZTogU3VuLCAyOCBNYXIgMjAyMSAyMjoyMjozMSAtMDQwMAorU3ViamVjdDogW1BBVENIXSBh
ZGQgdGhpcmQgcGFydHkgTk9USUNFIG1hcmtkb3duCisKKy0tLQorIE5PVElDRS5tZCB8IDExICsr
KysrKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKKyBjcmVhdGUgbW9k
ZSAxMDA2NDQgTk9USUNFLm1kCisKK2RpZmYgLS1naXQgYS9OT1RJQ0UubWQgYi9OT1RJQ0UubWQK
K25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi40NjAyZDllCistLS0gL2Rldi9u
dWxsCisrKysgYi9OT1RJQ0UubWQKK0BAIC0wLDAgKzEsMTEgQEAKKysjIEZpbGUgd2l0aCBjb2Rl
ICJib3Jyb3dlZCBmcm9tIiB0aGUgUHl0aG9uIHByb2dyYW1taW5nIGxhbmd1YWdlCisrCisrCisr
Q29weXJpZ2h0IChjKSAyMDAyIExhcnMgR3VzdGFlYmVsIDxsYXJzQGd1c3RhZWJlbC5kZT4KKytB
bGwgcmlnaHRzIHJlc2VydmVkLgorKworK1Blcm1pc3Npb24gIGlzICBoZXJlYnkgZ3JhbnRlZCwg
IGZyZWUgIG9mIGNoYXJnZSwgIHRvICBhbnkgcGVyc29uIG9idGFpbmluZyBhICBjb3B5IG9mICB0
aGlzIHNvZnR3YXJlICBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICAodGhlICAi
U29mdHdhcmUiKSwgIHRvICAgZGVhbCAgaW4gIHRoZSAgU29mdHdhcmUgICB3aXRob3V0IHJlc3Ry
aWN0aW9uLCAgaW5jbHVkaW5nICB3aXRob3V0IGxpbWl0YXRpb24gIHRoZSAgcmlnaHRzIHRvICB1
c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2Us
IGFuZC9vciBzZWxsIGNvcGllcyAgb2YgIHRoZSAgU29mdHdhcmUsICBhbmQgdG8gIHBlcm1pdCAg
cGVyc29ucyAgdG8gIHdob20gdGhlIFNvZnR3YXJlICBpcyAgZnVybmlzaGVkICB0byAgZG8gIHNv
LCAgc3ViamVjdCAgdG8gIHRoZSAgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisrCisrVGhlIGFib3Zl
IGNvcHlyaWdodCAgbm90aWNlIGFuZCB0aGlzICBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCAgYmUg
aW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisrCisrVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyAgSVMiLCBXSVRIT1VUIFdB
UlJBTlRZIE9GIEFOWSAgS0lORCwgRVhQUkVTUyBPUiBJTVBMSUVELCBJTkNMVURJTkcgIEJVVCBO
T1QgTElNSVRFRCBUTyAgVEhFIFdBUlJBTlRJRVMgT0YgIE1FUkNIQU5UQUJJTElUWSwgIEZJVE5F
U1MgICBGT1IgIEEgIFBBUlRJQ1VMQVIgICBQVVJQT1NFICBBTkQgTk9OSU5GUklOR0VNRU5ULiAg
SU4gIE5PICBFVkVOVCBTSEFMTCAgVEhFICBBVVRIT1JTICBPUiBDT1BZUklHSFQgSE9MREVSUyAg
QkUgTElBQkxFICBGT1IgQU5ZICBDTEFJTSwgREFNQUdFUyAgT1IgT1RIRVIgIExJQUJJTElUWSwg
V0hFVEhFUiAgSU4gQU4gIEFDVElPTiBPRiAgQ09OVFJBQ1QsIFRPUlQgIE9SIE9USEVSV0lTRSwg
IEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUg
T1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCmRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAy
My1SZW1vdmVkLXNlbnNpdGl2ZS1rZXlzLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjMtUmVtb3ZlZC1zZW5zaXRpdmUta2V5cy5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmIwNjQ0MTU1MwotLS0g
L2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmlud2Fsay8wMDIzLVJlbW92ZWQtc2Vuc2l0aXZlLWtleXMucGF0Y2gKQEAgLTAsMCArMSwy
MjAgQEAKK0Zyb20gZmZkZjU2Yzg5YWI1ZDAzOTA1MTk5ZWQwNGYxMjljMmFkMTVkOGYwZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRldnR0eXMwIDxjaGVmZm5lckByZWZpcm1sYWJz
LmNvbT4KK0RhdGU6IEZyaSwgMTggSnVuIDIwMjEgMDQ6MjA6NTkgLTA3MDAKK1N1YmplY3Q6IFtQ
QVRDSF0gUmVtb3ZlZCBzZW5zaXRpdmUga2V5cworCistLS0KKyBzcmMvYmlud2Fsay9wbHVnaW5z
L3BncC5weSB8IDIwNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisgMSBm
aWxlIGNoYW5nZWQsIDIwNCBkZWxldGlvbnMoLSkKKyBkZWxldGUgbW9kZSAxMDA2NDQgc3JjL2Jp
bndhbGsvcGx1Z2lucy9wZ3AucHkKKworZGlmZiAtLWdpdCBhL3NyYy9iaW53YWxrL3BsdWdpbnMv
cGdwLnB5IGIvc3JjL2JpbndhbGsvcGx1Z2lucy9wZ3AucHkKK2RlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAoraW5kZXggZjM4ZWUyZi4uMDAwMDAwMAorLS0tIGEvc3JjL2JpbndhbGsvcGx1Z2lucy9w
Z3AucHkKKysrKyAvZGV2L251bGwKK0BAIC0xLDIwNCArMCwwIEBACistIyEvdXNyL2Jpbi9lbnYg
cHl0aG9uCistCistaW1wb3J0IGVycm5vCistaW1wb3J0IHNodXRpbAorLWltcG9ydCB0ZW1wZmls
ZQorLWltcG9ydCBiaW53YWxrLmNvcmUucGx1Z2luCistaW1wb3J0IGJpbndhbGsuY29yZS5jb21w
YXQKKy1pbXBvcnQgYmlud2Fsay5jb3JlLmNvbW1vbgorLXRyeToKKy0gICAgIyBSZXF1aXJlcyB0
aGUgcHl0aG9uLWdudXBnIGxpYnJhcnkKKy0gICAgZnJvbSBnbnVwZyBpbXBvcnQgR1BHCistZXhj
ZXB0IEltcG9ydEVycm9yIGFzIGU6CistICAgIEdQRyA9IE5vbmUKKy0KKy0KKy1jbGFzcyBQZ3BE
ZWNyeXB0b3IoYmlud2Fsay5jb3JlLnBsdWdpbi5QbHVnaW4pOgorLQorLSAgICAnJycKKy0gICAg
UGx1Z2luIHRvIGRlY3J5cHQsIHZhbGlkYXRlLCBhbmQgZXh0cmFjdCBQR1AgZW5jcnlwdGVkIGZp
cm13YXJlLgorLSAgICAnJycKKy0gICAgTU9EVUxFUyA9IFsiU2lnbmF0dXJlIl0KKy0KKy0gICAg
RUREQTJFODJFREM3MDMwQ19LRVkgPSAiIiItLS0tLUJFR0lOIFBHUCBQUklWQVRFIEtFWSBCTE9D
Sy0tLS0tCistCistbFFPWUJGTFA2YVFCQ0FDcFhld2NmejV0RmpDQStIYWVUYWZZRThtaHZ0U2Fi
M0QxZVlxQ0pUY0RkcUM4d0pFdworLTliYlVSMWNHcVpZZXY5b1JqVEcvZ0dVR2JiVG9xcW1BQW5l
RWk1KzFpMEFCSFQ4VGh2RjM0RzJuQWE1Mjhkd3cKKy05a2ZPdDg0MmQ4Mm9qeGhGN2t4L0tqZUxE
U2FvUGFZWGJncEt5SzhTNENjSk0zQ09idmJ4WWFmWkFpR2ZITFFDCistWGNCUEllKzh2YjZUKzZL
bkRsNmtLNVR1ZWo5YnpFelJHTi9VZHZVaDMxSkVkdEZaSllwTlk1VVJZbGpOcHd3UworLVl4d0du
OWNPTHUrSUJvbjJPT2NpQXd1eGtNMi9QMWJuNks1MFFSek1NYnRWWmVyQkxRVkNiS1RZZTU1ZjJs
MUYKKy1CTEozaVhMT0k3T1d2MUl3OVRWMnZIM29XQ2RwRExoSnUxNTNBQkVCQUFFQUIvc0Z0dHl4
cjNJSWxkcm9GdzlRCistS0ZnLzR1eGNKVEgySTBscjRZQnFBMTNDVGxKK1c5US9reUsvM0hKVUVB
ME5GNHNBMUVNMzdnU1A2Q0ZXUjUvSworLXZsL2xuSEpmTDl0bWVPUDVGdHRNZGZRdEozemVtQ3JH
Tk11dEdWTFVwVXZPalVRVDQvRGlkTkd2N1lSKzRQN3cKKy1HUm5jSVJPVnhFaW5qUHZyWDZvUm15
cGh3M0hBRHJPeUtPNWUxYnpibWJBTzJaQVRjMElTT2VNeXVEWkZHOHJhCistM2c1bVl0Z2NIUUx0
c1JoUnp5TkVjbnFHZjR1aUhNckxrYUFPeVB3bWZ1YmNJZE1oWUl1YXFTSkZvV2pjTnZRbgorLUQ5
SHI0d3lCNFhSZE1XU0YvRXlUSFFERTBMZ3NLNCtnbS9NU2JoRG5MVko1QVVFVklja2JmVmJkNk96
a1FmR2sKKy11M0pGQkFESUYzL0JFUGgwL1crV3VLUytHbnI1RUQzTzVJeDZZbmJENXNCbGpBbDhZ
b3RCOG5tRnpSNG13NGo1CistUkxzYWRSVEZwcHpVS2FvMmxoVW54OXF4WTBCalUzcXpUQXRFZldO
ZEFNbTcvalJjbWRldWF5S0ZyZEhISUpxTgorLUFpd0ltRHJWK3FROEM5RTROOGgybWVxSzdjR3Jk
NW1wVGs3QXJlWUNFSWxNZmdwUEZRUUEyTEN1TlhqbGtndjMKKy11NjBIWXJUSkF3RlpDaVVWcXNX
cFFXQ3ppQzRNM2tvOU9kdFplNlo3MTNWdVNTOWJVVU1OQTdVQ1d6ZXcwTngxCistbFJLdjI0bUVM
NlNUTnBJLy9kYTVxbDNpbXJMb0s0YlROR3dRQXMvV3lDUEVVdGlmdHZWWTdHb2EyWEVobTVaUgor
LXFxWjMxWTJRY2ZHQlEwT3VTQmVRUUZiR3hvc3N1bHNELzFrNCs1bWxtUy91UmVVV3NIb2FDd2d3
aXMzY25ESG4KKy1HYmV2ZHcwQXF6ZnhSeEtSY2p6cVRmdE1Zc3JwZFZxRXZ1RjVld2ovWXRaRmJG
c0NaM29YS2txRnBxNnFZNjRECistdUw0bVBoMGdpS3lrRHhlUGJlZ09CaExYTmRaZkJwV1pKYlBH
OWN2dTVwMnFqZWpSN2RtK3UrMXkvak9IbkQxNAorLU9KWmNROHpMQkE3Z1BZbTBKbFpsY21sNmIy
NGdRa2hTTkNBOFpYVkFaM0psWlc1M1lYWmxjbVZoYkdsMGVTNWoKKy1iMjAraVFFNEJCTUJBZ0Fp
QlFKU3orbWtBaHNEQmdzSkNBY0RBZ1lWQ0FJSkNnc0VGZ0lEQVFJZUFRSVhnQUFLCistQ1JDcngw
aFJabUoyNVpjRUNBQ2JjTW9IZVJFdWxkYjdkN1U4NEJnb2M2Y3lUNGZpOHRUNEJabWVPVWQ5ZGMv
aQorLWRWV3NxWXBjV1E4NGVESUI0TmticEJjOWNYYi9kdWY0UUtlQi9iNG1LOUpsWWlMcGJWaito
c1JuM2s5YjMydzIKKy1CRGk5aWtZWUZBa0pobFBvZHcva01JMEhnTnY2bEoxZDlIWUhiUEs0Q2JJ
a1JCa3VOVEFLYzhaTlNBVjg2MXF0CistMmpkZlNSZktGV05CS0Jkak9zUmFOZDc4VlBBc1VBOUY1
T1JWNnFyK1RBZ1FLT3UzVzRwdWFubzh6bmtDZER0aworLXhVNmZ3ekRGYlVLU3dDZ3dCUzBlR3ZL
NCtzQU5NRHNUQ3FmVnlaRGN5L2ZOWkdFSWlza0J0NWViMFdPTFQ5QXcKKy1HYUtxcFJhdlN1akF5
WEljNVYvbmpVdlJTRkhSeW1uZk0vTmZ3b3d0blFPWUJGTFA2YVFCQ0FEUCthZTFRN3FnCista1BV
Q3JBMXlkWndIdm9leXc0cGRRbHRlUURkMitIMldrbHlwOFZOTVMwRlJhNjdoZzJNaWh2NDBETWwz
SktURgorLWMrWmhHOUI5UDhoUHorU1RKUHRpZGc4Y2ttSVA5Z3h4SmNBNmRKLzVzSWFhT1FockJJ
WTU2S3kwWllPa1hqLzIKKy1mOHlNeEZSMHh3bE1XREphY0Z5TzBicUhMWWFZc2VOQzdZeXNRSlBD
RFlEMWxKNzZYOEVaZGdZZ3c2c1ArSzl6CistUzBjczR0N0dmSTlPajRydXFTVlR3OTUwSlVTR2xM
aUpNQ1U2SzdtSTc4R0NnellnRTN4TDJYVXJMMjJRdXRObworLVdBemo3T0NZaGlXUmFoNkNPZUl2
TiszdWNKQ2ZDakg0dHMvOGxuc3RNTDhydTcvNjdSaHlhTjc5alpscC93QSsKKy1GSEIvaE5JNTlx
ZmhBQkVCQUFFQUIvc0duTGUrNlBoNDVLYnZodkFXQXFSN2NBeXhLNnVkWDYvWE9TZ3lSMy81Cist
cnExVXgxd0lQYy9Gc294Z3RkeEw0NW9YSmsxczlPeXFyTzdIQ1ZyNWNuTFFTOG9tL2ZyaWxHR1NY
VnFTQ3BiMgorLWJYWjFQVkk5UG1Zbkp0ZE1UTHhtUUs0bC9hQy84L0dwYVFLRU9yVTdNYjFMVUxZ
SUgxQ29CMFc4aUw5aDRTejYKKy1LcFBkV1dPWVJIbW5qdmd0WFFpS3U0alRQQnlzU1ZUeTU2WWov
K29tKzg4WEluUDFURFcxZW0zeVlCR2N6ektoCistbThxaU5uRWtJU0Q2SGl0YmdqVmJ2YWJxaUI5
dkdtRXpPdWdKUmdWU3ZZNTE0ektGbThzL25JbzdZOFNuUjBVZAorLXJwTmRMZWJ4KzROVFVMblVo
cDJsZWdQRFhMS1ZRc2JnTkUyejBldjdHRFdoQkFEbFQ4QVVFNFUzeHNJOHdhNG4KKy1kVFBsOU04
RXVhOXhudUtOYi9mWUtoTjM0Si9GWFhSOXJEZnpDWENINEM5elQ1OFV4VEtUZTlNRUVpbWx2dUhZ
CistQ3RzNVJJbWNHcC9nNHhxelY3eTRiUTlMUjhCWnNlb1dwTWRoZGZvbFVkeTk3Mi9acU10RWxR
dERnbGEwREJHWAorLWlkOWQ5aGRJcERCbUtOS0tPU2tuZFFMTWNRUUE2QzR5bEhVQ05NQzR0UVZU
bXp5bEZhWXlUcmUzT0l4YWQ4WHAKKy1OZFZncHFYNDJpbDVOaWI0RUR6NzJHTEliWkFpQ3hpMWw1
RlRWdVVZL0x6MjNqeHFTYk5SSjVObWRKS1dnQWNUCistR25RdTRHQlh1UkxObCt0WHk3VWNWdzNa
NTNqRVdubXFEa053Q2Mzb3pKRDdSZXcvMFgwYnJpTmVjU3dLc3hKcQorLS9PcWVDbkVEL2lKSlVa
QzRhb3RwZlJxM24yR3J6YXZ6eGVwUml6L1UzT3VoQnhhMExSNHhJSERyYXByNVhRU0UKKy1hellz
ZytaeTF1RytOTzJqNU52bUp3U0tDaFY0Z0k1SjY2cUhETFJBV2JUN1hHZXVrYjNyZ1h1MnVoc3g0
TlJqCistR0FHa2ZBcVJuS210Z0lWeUR1cXF0VzR2UlNtekxoSWpNZDJRRENhTWZTeUF0Yis5TWx0
b1BzZUpBUjhFR0FFQworLUFBa0ZBbExQNmFRQ0d3d0FDZ2tRcThkSVVXWmlkdVg4RUFmK0xyYzNa
aWZ5NHRpUVU3bXpqa25ZY1pZQldWcmoKKy02RiszRk9ua2ErWmc3dXdLY0JLNmZIUWFqQ2xDWGdM
bVBtTFROeVlhd2FqMnRNNTdUTFlYOVNzYmRDQTlOZzNiCistMGlNeUNpeE9IWTJPdW5UUXY0d0NZ
aW1HV3M2V1VYa1V3bENGaG5HR2FQcUxIa3hYV0VnaXF1OElLZ2phQTJVTgorLUIva0xDaExWZ254
cWtsQU1DMkFXVDFtVDRybWZqWTZlZldvekVqZUhPR05UYWd4VDBlZk4zU3cwMXhpdG9la0YKKy1i
MStqdkU1SzBFQUtkZE14U1VicHY1VjRrdUJROWdvbVplaTZobDJ4ZVlxamxiT0FvaFhqWFkxVmlU
aWV6M0lFCistTXRiRjl5OWQwK09vYW5pQW1aVldzdWZ4amFmMjduNkRkVC9TKzdKdDFmVHFUWTlR
WUFKVmQ3M0tvZz09CistPWM2bm4KKy0tLS0tLUVORCBQR1AgUFJJVkFURSBLRVkgQkxPQ0stLS0t
LSIiIgorLQorLSAgICBGMThCNDdERjNGODgxQzc1X0tFWSA9ICIiIi0tLS0tQkVHSU4gUEdQIFBS
SVZBVEUgS0VZIEJMT0NLLS0tLS0KKy0KKy1sUU9YQkZVcmh2Y0JDQUNZTHJlc1RUNCtTN1lBb3Fj
dFczVldYdG9pRkZjL2hSK2tIWnZocEtkUWpZaXJvclJ5CistYVl2OXhDWWM1WSs2UmgvbXBRRllJ
YlpvTXF4dFRaNWtmMDJrUXlYWFI3bURoaVd1MGIzUzhxNGRVSi9oeXk0RQorLVExb1laRE1YOXQ5
RWw2MEFlaUI5QUV6RXBpUGxPclQyczc3UGZleFIzNGU0dVE1R0lNWlZvU001V0I3MzRaVVcKKy1x
dW15aFBlR2czMTA4bTROcHVNaXRTb1JVSlc2ODNKMG9XRmYvYi9yWEVsZStvbllhYWZlQUF1WlRr
RndEOHMzCistN1d3V0dQUHlPS0RVZ0hpMXFwdkIza1RzOVIrT09KZUJGQTVScHB4KzAxQm1HZElt
VlhnbWZGK1ZIL3JQZDZveAorLWZXSEJKNzJRdWN0OW9aZHVmbStkL0ZObUhGbXdKelV3bEVQSkFC
RUJBQUVBQi9qRUszU1lwdm1WVkFOSXptS3kKKy1GVE1zSXhrTTFTdWl0ZmdUbGhkYXh1VG04WXM3
dElEbSt5ZDU5MThwNE1GbFhQL0NVUEZxcWdwNFJ0bitEQkFoCistZS9pWnhmVUJqWE9XRjFaOEEr
S3VDaVpubzRaMWlYUElDd29ZWnhGMTBzWDdwWWxkRkJETkVaWGo2RVpkTjFBTworLXM2VkQwdzdP
ZTFaNHlCT2VVcUZYd0YrbmlmTjgxR3d5TzNSblVXSXBibWVFRTk0Vno5VS9jU255eHdYeXdDaG0K
Ky1kUThOVCtDRVAwbyt5cGtjZjF2MktOSWNVZHJnSjk5NVozc0xWaHNxT2M4WCtmV2ZXMDRIUXVF
cElYMmJMRjYrCistbFFkS0tiRjBvSzE1WmYvOEZtbUdyaDlVaDA3bjg3a3dEWE5wR3REaVROc1Fn
T25nWU5xTDZpUHl0TEt2NnhBSgorLWhpRUVBTU4ybzVSY0h3WDF5NGRqY012TlV1bWZTc21BQ3Bu
RFBCQTNtUGZ3WGNtemk1RGhXV25XYXYvd2FJQUMKKy0zakUyYkJtVlJjSFpmNXcvUDBEODZ4WE9v
Wk1jcUc4OHNpQUw3UTV4WklTMkJXWHgwN2s4VW1Na0pjUkdFY1VmCistSkp6ZjlnejNjd080ZWlT
bUFlSU5BdVdWQUxTS1RXaEFDSVNHdHE2SzRpMkJRNTFWQkFESFVJb1l3Y3ZGdytIeAorLVVQeUls
S0dNRC9kUXF2eDVnVk5oUStxdjdVbzMzRUZkdDY4OXl6Wnl0WUdSQUwzekFFRFRKVURzTFZkWms0
QmUKKy15WnBkQVdIMWJJdUtGcE5rS2ZIWElvVDI3Z0RleHRuaUFSZFNCdS9PdmhBeEFFb1IwN0Jx
WjFUWFBLMW85d2d6CistOWFraTZTQWdxRHRTckh2TytxcjhTNVJaOHlCc3BRUC9lYmhndE9SZmF5
bG1VTlZrSGcxSkVFMHhRa3lJWnA0WAorLXpydzJKbWVCV0pHMWVqL29YNVBjQUh6S3pXVjJnZHZ5
OWd5dkNFY0VqWUsxWDA3WDU5bVZMSUszZ0dFd0JKcHYKKy1iWHFDb1RXNTlyOE9kZU9NcHp6V1Yy
MkF2ZE9yTHovTFY1NENXRThiUGlieGcxd25LVWQ4MjNXNzBNU01TZXZOCistSU91YlRlY0pQMkU1
YnJRbVZtVnlhWHB2YmlCQ1NGSTBJRHhsZFVCbmNtVmxibmRoZG1WemVYTjBaVzF6TG1OdgorLWJU
NkpBVGdFRXdFQ0FDSUZBbFVyaHZjQ0d3TUdDd2tJQndNQ0JoVUlBZ2tLQ3dRV0FnTUJBaDRCQWhl
QUFBb0oKKy1FSlJmM1BTOTI0ZC95VzRJQUpJN3QrRDQwUVd6NVVYZWlTb1liN1U3VUxGR1dxdkZS
aisxNG9RZ0lEd3lLdkpBCisteHcyY0VsRVNIdTFSbWJoSitoS0R4bS9JTXhqUk1wOGdXeU1LNXIr
SGNLSitTOCs5RzVJMnMzeFJtSStQaTNyRQorLUF1WW9Id3M3UGpqNjBsV1E4TTFyVDErazN0a2Vl
L296WjlrR3BmclA1RkJIMS9mT09FclVtMGdka3RBNUZtREkKKy14QkxSOWdOWUp5S3lqcW5nNXNL
aU1aTmRmL3U1cWZDNjhrSGo0MlVPUVhIb0tnekl3emRLNXZyM1VscVFSOUJlCistazlzaXRsYXZH
WjVXVnMyWTlmSFhIN2NoQ3ZsWnhQYytQL1dINmxXUUpYakpvNXQrcmpTcE9ObmtqUFRnOXdycAor
LU8vaHllY2tWRmNKeW5Pd0RYRzl0SVpEaDB6em1YUVBuc24rTGZXK2RBNWdFVlN1Rzl3RUlBTVdB
MXM4MGUweGsKKy12dzEyNjMyRW9uck9nemRaMlk1dldXT1l0YTJ0cldXekI5aGxtTjFBZTVBRmdY
STdMVEJYcXBDZlNaVmN2UDZQCistVzlCdlVqSHJadUw1WDhsUXRhS01JTXB2dGIyaVdWVzdIUXRE
UFJIOWNvTW9pbXB2dVk1Wlh2MnZtcXVyVG5UVworLTlJL0FrbHlWNmV2dDZTcnV1ZzU4MUxJVi9X
RmdtYXpuUEQzZEFIbWdQUGNKaXVYWW5FUVFabG04aU82cmx4QVEKKy1wQnhDd2x5LzVwV1o1Nk0w
YktDeU0zcVZnRVlpL3BqSmpyZzluZG1EZFVWMkFEdnpNV1E1RVVBeFlhVEdWSThKCistMkFFVVI5
bkVQN1dYQU1KdDlocE0rK29IMTJPWDNaTHpGUG5PdWoxRjUwUStWQVpNd3ExeVF5eDhDWTZvUXFT
YQorLURYenM5d3o2TTljQUVRRUFBUUFIL2pCa2d6MitCRUFScDJackx3UlFUV2Q5MWxUbnBSRHJZ
Nkd0dDBaWStkV2oKKy1hbGF4ZmlVb09aNXVXdXRjYUpRaHh0OHN5R0RhbWt4ZFlBZlFYdmx3VG9O
cXl2ZU8yUko4OTBQaTMwc1p6bjNkCistSFI2M1dPMWhobjl3blltNjJtSndyMy9GV1VhYThOeGNG
d3hxQ1BLNm9OaDRNTnVlSnVTSjNhdk5DNHFpbXNUcworLWJKMjV2M29ybTkxZ2dWZ2dkSWtQSVhq
Yy9nb3pHQVNSMjl0NzNWbkphei9ZODhiRGMwVlF6d1VrYVRFWktPaHAKKy1LKytQR2tJYytmM2lL
czg2VHdtZUFPQ29ZRmV4TVVnV2ROUkhEbDRLSyt5QTFKNm81TXYxS0t6eThKdU1LZkdrCistN3Fm
b2krN1dwbG5MUWFnZnN2MUJpYkg3bi9MTzhGUTFiMkRNUkI1M3lrRUVBTVpqR0Z2QUdWVVRqR2hW
UUR2QgorLUNDaHR2WDJZV05aekZkRHpFcEdLRWxOUG1lQkFhZ2NqQnN6Ym9hTk1YMC9HdVRZZUpi
U2Erc0V6K2RLd3JNYVcKKy1jakVTTDVIS01JamJ2dDJrN3RrRGVKRUJvOWRJVFU1YkdKNk5rM3Vp
azF2SHVlYkFpNUFMR2pxS1FESXNrRlFYCisteTRDNWJ3Ri8vUWJJNm81MncwWlN2MXBIQkFEKzNB
bW5iNnBVTHkwd2ROTzhPQnZ3SDd5OS81eUhpNkw1K1lhRgorLU9nRFBHYTEwUnBYUmlQU1IvQWhE
amo2WTVCUEl1ay9mQlpuQ2g3WEFCOXlPZy9yT3VuaEhTcks3TWhuMC9kMm0KKy1uZ3I5VWJPeHNn
ZFpBcnlJYjI2UUFUaDBiL1RJb0dPb1Z5M2JGRlBZcDE1emFuQ0tkOUFCZTNIQ2pUQ2FVRHhzCist
ZTZ5UjhRUUF3NUdPNjF3S0dhWFJJYXpmSjJLMFZZVjM5QVBmQ1RuY2pTL1RKdkMwbnd5OFJ6Vkw1
c0g0Zi91WAorLVZkSmt2Z01FeGM2K3UzMFhJYUllUFZhRlFlNExCQ1pyZHhmU0xWWUVoeFpkMHBC
RWw0NTRKWHkzNUNadTkyS1IKKy1OcTA0RnBYNW1DM1ZKUWdSRWFCbzNKdlJDZE5FQ2thMGR0dW04
WkQxdWlyc01aQmcyRzFDZTRrQkh3UVlBUUlBCistQ1FVQ1ZTdUc5d0liREFBS0NSQ1VYOXowdmR1
SGY0Y1dCLzlGRlVIYUppUllUd25YblBBeC83cy9manJGRStjdQorLVFqQ25NaEdsSklhQXdSSlJP
eElpc2ZuVDBKMk15cnlvK3dyMWNCeFpRT3ZISHErbGxQRDR0cW1VZlFRTXN5eXkKKy1GcDRwSS9v
MGJSVG16c2lmQ2ZSTmJWVTN6YmcvV2lENlJWOTBTd1ZEalZudSt6UURONjhYUHVXZVdHcFM1SlpT
CistaTAvNDhxYnlDdFRvTVNMbHNSQ09iWktDSUFSenczdWxxU2ljOGFGNlEzeGZmM3BhU2ozVFpB
dXdiRG10WU5JegorLWVjVDhuZk1seWRROVdpZ210a09QWENVMTlKMlJsUFNLdDM3WkMzVkI1MW9x
dTFCU2krcTVPYm1hWFNWVWZYMHkKKy1Lak45SGlIVk5CV0pha0ZUQWNUc0RyQ1ZtM1dwVEtaa0RM
UzBJUVRwcy9lQjQ2dkY3Vjk3QUlRNgorLT1VdEZWCistLS0tLS1FTkQgUEdQIFBSSVZBVEUgS0VZ
IEJMT0NLLS0tLS0iIiIKKy0KKy0gICAgRUREQTJFODJFREM3MDMwQ19TSUdOQVRVUkVfREVTQ1JJ
UFRJT04gPSAiUEdQIFJTQSBlbmNyeXB0ZWQgc2Vzc2lvbiBrZXkgLSBrZXlpZDogRUREQTJFODIg
RURDNzAzMEMgUlNBIi5sb3dlcigpCistCistICAgIEYxOEI0N0RGM0Y4ODFDNzVfU0lHTkFUVVJF
X0RFU0NSSVBUSU9OID0gIlBHUCBSU0EgZW5jcnlwdGVkIHNlc3Npb24ga2V5IC0ga2V5aWQ6IEYx
OEI0N0RGIDNGODgxQzc1IFJTQSIubG93ZXIoKQorLQorLSAgICBkZWYgaW5pdChzZWxmKToKKy0g
ICAgICAgIGlmIEdQRyBpcyBOb25lOgorLSAgICAgICAgICAgIHNlbGYuZW5hYmxlZCA9IEZhbHNl
CistICAgICAgICBlbHNlOgorLSAgICAgICAgICAgIHNlbGYuZW5hYmxlZCA9IFRydWUKKy0KKy0g
ICAgICAgIGlmIHNlbGYuZW5hYmxlZCBpcyBUcnVlIGFuZCBzZWxmLm1vZHVsZS5leHRyYWN0b3Iu
ZW5hYmxlZCBpcyBUcnVlOgorLSAgICAgICAgICAgICMgQWRkIGV4dHJhY3Rpb24gcnVsZXMgZm9y
IGVuY3J5cHRlZCBQR1AgZmlybXdhcmUgc2lnbmF0dXJlCistICAgICAgICAgICAgIyByZXN1bHRz
CistICAgICAgICAgICAgc2VsZi5tb2R1bGUuZXh0cmFjdG9yLmFkZF9ydWxlKHR4dHJ1bGU9Tm9u
ZSwKKy0gICAgICAgICAgICAgICAgcmVnZXg9Il4lcyIgJSBzZWxmLkVEREEyRTgyRURDNzAzMENf
U0lHTkFUVVJFX0RFU0NSSVBUSU9OLAorLSAgICAgICAgICAgICAgICBleHRlbnNpb249ImdwZyIs
CistICAgICAgICAgICAgICAgIGNtZD1zZWxmLl9kZWNyeXB0X2FuZF9leHRyYWN0X0VEREEyRTgy
RURDNzAzMEMpCistICAgICAgICAgICAgc2VsZi5tb2R1bGUuZXh0cmFjdG9yLmFkZF9ydWxlKHR4
dHJ1bGU9Tm9uZSwKKy0gICAgICAgICAgICAgICAgcmVnZXg9Il4lcyIgJSBzZWxmLkYxOEI0N0RG
M0Y4ODFDNzVfU0lHTkFUVVJFX0RFU0NSSVBUSU9OLAorLSAgICAgICAgICAgICAgICBleHRlbnNp
b249ImdwZyIsCistICAgICAgICAgICAgICAgIGNtZD1zZWxmLl9kZWNyeXB0X2FuZF9leHRyYWN0
X0YxOEI0N0RGM0Y4ODFDNzUpCistCistICAgIGRlZiBfZGVjcnlwdF9hbmRfZXh0cmFjdF9FRERB
MkU4MkVEQzcwMzBDKHNlbGYsIGZuYW1lKToKKy0gICAgICAgIHJldHVybiBzZWxmLl9kZWNyeXB0
X2FuZF9leHRyYWN0KGZuYW1lLCBzZWxmLkVEREEyRTgyRURDNzAzMENfS0VZKQorLQorLSAgICBk
ZWYgX2RlY3J5cHRfYW5kX2V4dHJhY3RfRjE4QjQ3REYzRjg4MUM3NShzZWxmLCBmbmFtZSk6Cist
ICAgICAgICByZXR1cm4gc2VsZi5fZGVjcnlwdF9hbmRfZXh0cmFjdChmbmFtZSwgc2VsZi5GMThC
NDdERjNGODgxQzc1X0tFWSkKKy0KKy0gICAgZGVmIF9kZWNyeXB0X2FuZF9leHRyYWN0KHNlbGYs
IGZuYW1lLCBrZXkpOgorLSAgICAgICAgJycnCistICAgICAgICBUaGlzIGRvZXMgdGhlIGV4dHJh
Y3Rpb24gKGUuZy4sIGl0IGRlY3J5cHRzIHRoZSBpbWFnZSBhbmQgd3JpdGVzIGl0IHRvIGEgbmV3
IGZpbGUgb24gZGlzaykuCistICAgICAgICAnJycKKy0gICAgICAgIHdpdGggb3BlbihmbmFtZSwg
InJiIikgYXMgZnBfaW46CistICAgICAgICAgICAgZW5jcnlwdGVkX2RhdGEgPSBmcF9pbi5yZWFk
KCkKKy0KKy0gICAgICAgICAgICBkZWNyeXB0ZWRfZGF0YSA9IHNlbGYuX3BncF9kZWNyeXB0KGVu
Y3J5cHRlZF9kYXRhLCBrZXkpCistCistICAgICAgICAgICAgd2l0aCBvcGVuKGJpbndhbGsuY29y
ZS5jb21tb24udW5pcXVlX2ZpbGVfbmFtZShmbmFtZVs6LTRdLCAiZGVjIiksICJ3YiIpIGFzIGZw
X291dDoKKy0gICAgICAgICAgICAgICAgZnBfb3V0LndyaXRlKGRlY3J5cHRlZF9kYXRhKQorLSAg
ICAgICAgcmV0dXJuIFRydWUKKy0KKy0gICAgZGVmIF9wZ3BfZGVjcnlwdChzZWxmLCBlbmNyeXB0
ZWRfZmlybXdhcmUsIGtleSk6CistICAgICAgICAnJycKKy0gICAgICAgIFRoaXMgZG9lcyB0aGUg
YWN0dWFsIGRlY3J5cHRpb24uCistICAgICAgICAnJycKKy0gICAgICAgIHRyeToKKy0gICAgICAg
ICAgICB0bXBfZGlyID0gdGVtcGZpbGUubWtkdGVtcCgpCistICAgICAgICAgICAgZ3BnID0gR1BH
KGdudXBnaG9tZT10bXBfZGlyKQorLSAgICAgICAgICAgIGdwZy5pbXBvcnRfa2V5cyhrZXkpCist
ICAgICAgICAgICAgZGVjcnlwdGVkX2RhdGEgPSBncGcuZGVjcnlwdChlbmNyeXB0ZWRfZmlybXdh
cmUpCistICAgICAgICBmaW5hbGx5OgorLSAgICAgICAgICAgIHRyeToKKy0gICAgICAgICAgICAg
ICAgc2h1dGlsLnJtdHJlZSh0bXBfZGlyKQorLSAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yIGFz
IGV4YzoKKy0gICAgICAgICAgICAgICAgaWYgZXhjLmVycm5vICE9IGVycm5vLkVOT0VOVDoKKy0g
ICAgICAgICAgICAgICAgICAgIHJhaXNlCistCistICAgICAgICByZXR1cm4gYnl0ZXMoZGVjcnlw
dGVkX2RhdGEuZGF0YSkKKy0KKy0gICAgZGVmIHNjYW4oc2VsZiwgcmVzdWx0KToKKy0gICAgICAg
ICcnJworLSAgICAgICAgVmFsaWRhdGUgc2lnbmF0dXJlIHJlc3VsdHMuCistICAgICAgICAnJycK
Ky0gICAgICAgIGlmIHJlc3VsdC52YWxpZCBpcyBUcnVlOgorLSAgICAgICAgICAgIGlmIHJlc3Vs
dC5kZXNjcmlwdGlvbi5sb3dlcigpLnN0YXJ0c3dpdGgoc2VsZi5FRERBMkU4MkVEQzcwMzBDX1NJ
R05BVFVSRV9ERVNDUklQVElPTikgaXMgVHJ1ZToKKy0gICAgICAgICAgICAgICAgcmVzdWx0LmRl
c2NyaXB0aW9uICs9ICIsIFZlcml6b24gQkhSNCA8ZXVAZ3JlZW53YXZlcmVhbGl0eS5jb20+Igor
LSAgICAgICAgICAgIGVsaWYgcmVzdWx0LmRlc2NyaXB0aW9uLmxvd2VyKCkuc3RhcnRzd2l0aChz
ZWxmLkYxOEI0N0RGM0Y4ODFDNzVfU0lHTkFUVVJFX0RFU0NSSVBUSU9OKSBpcyBUcnVlOgorLSAg
ICAgICAgICAgICAgICByZXN1bHQuZGVzY3JpcHRpb24gKz0gIiwgVmVyaXpvbiBCSFI0IDxldUBn
cmVlbndhdmVzeXN0ZW1zLmNvbT4iCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyNC1SZW1vdmVkLWhpbGluay1kZWNyeXB0
aW9uLXBsdWdpbi1jb250YWlucy1wcmlwcmlldGFyLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjQtUmVtb3ZlZC1oaWxpbmstZGVj
cnlwdGlvbi1wbHVnaW4tY29udGFpbnMtcHJpcHJpZXRhci5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAuLjI2M2MwNWIyYwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDI0LVJlbW92
ZWQtaGlsaW5rLWRlY3J5cHRpb24tcGx1Z2luLWNvbnRhaW5zLXByaXByaWV0YXIucGF0Y2gKQEAg
LTAsMCArMSwxMjQgQEAKK0Zyb20gYzRmNTk1YjYxZjA1MTU0M2U4ODAwMTdiNzE1OWI1ZTUwYTk3
ODMxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRldnR0eXMwIDxjaGVmZm5lckBy
ZWZpcm1sYWJzLmNvbT4KK0RhdGU6IE1vbiwgOSBBdWcgMjAyMSAwNTo1MjowNCAtMDcwMAorU3Vi
amVjdDogW1BBVENIXSBSZW1vdmVkIGhpbGluayBkZWNyeXB0aW9uIHBsdWdpbjsgY29udGFpbnMg
cHJpcHJpZXRhcnkgY3J5cHRvCisga2V5KHMpLgorCistLS0KKyBzcmMvYmlud2Fsay9jb25maWcv
ZXh0cmFjdC5jb25mIHwgIDEgLQorIHNyYy9iaW53YWxrL3BsdWdpbnMvaGlsaW5rLnB5ICAgfCA5
NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDk1
IGRlbGV0aW9ucygtKQorIGRlbGV0ZSBtb2RlIDEwMDY0NCBzcmMvYmlud2Fsay9wbHVnaW5zL2hp
bGluay5weQorCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvY29uZmlnL2V4dHJhY3QuY29uZiBi
L3NyYy9iaW53YWxrL2NvbmZpZy9leHRyYWN0LmNvbmYKK2luZGV4IDViNTRmNzIuLmY2NGJhMzQg
MTAwNjQ0CistLS0gYS9zcmMvYmlud2Fsay9jb25maWcvZXh0cmFjdC5jb25mCisrKysgYi9zcmMv
Ymlud2Fsay9jb25maWcvZXh0cmFjdC5jb25mCitAQCAtMTQsNyArMTQsNiBAQAorICMgICBvIHps
aWIKKyAjICAgbyBjcGlvCisgIyAgIG8gUmF3IExaTUEvZGVmbGF0ZSBzdHJlYW1zCistIyAgIG8g
SGlsaW5rIGVuY3J5cHRlZCB1SW1hZ2UgZmlybXdhcmUKKyAjICAgbyBELUxpbmsgIlJPTUZTdjku
MCIgZmlsZSBzeXN0ZW1zCisgIworICMgVGhlcmUgYXJlIGFsc28gYWx0ZXJuYXRpdmUgZXh0cmFj
dG9ycyBmb3IgdGhlIGZvbGxvd2luZyBmaWxlIGZvcm1hdHMsIGltcGxlbWVudGVkIGFzIHBsdWdp
bnM6CitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvcGx1Z2lucy9oaWxpbmsucHkgYi9zcmMvYmlu
d2Fsay9wbHVnaW5zL2hpbGluay5weQorZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCA1
ODFhNTMwLi4wMDAwMDAwCistLS0gYS9zcmMvYmlud2Fsay9wbHVnaW5zL2hpbGluay5weQorKysr
IC9kZXYvbnVsbAorQEAgLTEsOTQgKzAsMCBAQAorLSMhL3Vzci9iaW4vZW52IHB5dGhvbgorLQor
LWltcG9ydCBzdHJ1Y3QKKy1pbXBvcnQgc3RyaW5nCistaW1wb3J0IGJpbndhbGsuY29yZS5wbHVn
aW4KKy1pbXBvcnQgYmlud2Fsay5jb3JlLmNvbXBhdAorLWltcG9ydCBiaW53YWxrLmNvcmUuY29t
bW9uCistdHJ5OgorLSAgICAjIFJlcXVpcmVzIHRoZSBweWNyeXB0byBsaWJyYXJ5CistICAgIGZy
b20gQ3J5cHRvLkNpcGhlciBpbXBvcnQgREVTCistZXhjZXB0IEltcG9ydEVycm9yIGFzIGU6Cist
ICAgIERFUyA9IE5vbmUKKy0KKy0KKy1jbGFzcyBIaWxpbmtEZWNyeXB0b3IoYmlud2Fsay5jb3Jl
LnBsdWdpbi5QbHVnaW4pOgorLQorLSAgICAnJycKKy0gICAgUGx1Z2luIHRvIGRlY3J5cHQsIHZh
bGlkYXRlLCBhbmQgZXh0cmFjdCBIaWxpbmsgZW5jcnlwdGVkIGZpcm13YXJlLgorLSAgICAnJycK
Ky0gICAgTU9EVUxFUyA9IFsiU2lnbmF0dXJlIl0KKy0KKy0gICAgREVTX0tFWSA9ICJIQEw5Syoo
MyIKKy0gICAgU0lHTkFUVVJFX0RFU0NSSVBUSU9OID0gIkVuY3J5cHRlZCBIaWxpbmsgdUltYWdl
IGZpcm13YXJlIi5sb3dlcigpCistCistICAgIGRlZiBpbml0KHNlbGYpOgorLSAgICAgICAgaWYg
REVTIGlzIE5vbmU6CistICAgICAgICAgICAgc2VsZi5lbmFibGVkID0gRmFsc2UKKy0gICAgICAg
IGVsc2U6CistICAgICAgICAgICAgc2VsZi5lbmFibGVkID0gVHJ1ZQorLQorLSAgICAgICAgaWYg
c2VsZi5lbmFibGVkIGlzIFRydWUgYW5kIHNlbGYubW9kdWxlLmV4dHJhY3Rvci5lbmFibGVkIGlz
IFRydWU6CistICAgICAgICAgICAgIyBBZGQgYW4gZXh0cmFjdGlvbiBydWxlIGZvciBlbmNyeXB0
ZWQgSGlsaW5rIGZpcm13YXJlIHNpZ25hdHVyZQorLSAgICAgICAgICAgICMgcmVzdWx0cworLSAg
ICAgICAgICAgIHNlbGYubW9kdWxlLmV4dHJhY3Rvci5hZGRfcnVsZShyZWdleD0iXiVzIiAlIHNl
bGYuU0lHTkFUVVJFX0RFU0NSSVBUSU9OLAorLSAgICAgICAgICAgICAgICBleHRlbnNpb249ImVu
YyIsCistICAgICAgICAgICAgICAgIGNtZD1zZWxmLl9kZWNyeXB0X2FuZF9leHRyYWN0KQorLQor
LSAgICBkZWYgX2RlY3J5cHRfYW5kX2V4dHJhY3Qoc2VsZiwgZm5hbWUpOgorLSAgICAgICAgJycn
CistICAgICAgICBUaGlzIGRvZXMgdGhlIGV4dHJhY3Rpb24gKGUuZy4sIGl0IGRlY3J5cHRzIHRo
ZSBpbWFnZSBhbmQgd3JpdGVzIGl0IHRvIGEgbmV3IGZpbGUgb24gZGlzaykuCistICAgICAgICAn
JycKKy0gICAgICAgIHdpdGggb3BlbihmbmFtZSwgInIiKSBhcyBmcF9pbjoKKy0gICAgICAgICAg
ICBlbmNyeXB0ZWRfZGF0YSA9IGZwX2luLnJlYWQoKQorLQorLSAgICAgICAgICAgIGRlY3J5cHRl
ZF9kYXRhID0gc2VsZi5faGlsaW5rX2RlY3J5cHQoZW5jcnlwdGVkX2RhdGEpCistCistICAgICAg
ICAgICAgd2l0aCBvcGVuKGJpbndhbGsuY29yZS5jb21tb24udW5pcXVlX2ZpbGVfbmFtZShmbmFt
ZVs6LTRdLCAiZGVjIiksICJ3IikgYXMgZnBfb3V0OgorLSAgICAgICAgICAgICAgICBmcF9vdXQu
d3JpdGUoZGVjcnlwdGVkX2RhdGEpCistCistICAgIGRlZiBfaGlsaW5rX2RlY3J5cHQoc2VsZiwg
ZW5jcnlwdGVkX2Zpcm13YXJlKToKKy0gICAgICAgICcnJworLSAgICAgICAgVGhpcyBkb2VzIHRo
ZSBhY3R1YWwgZGVjcnlwdGlvbi4KKy0gICAgICAgICcnJworLSAgICAgICAgY2lwaGVyID0gREVT
Lm5ldyhzZWxmLkRFU19LRVksIERFUy5NT0RFX0VDQikKKy0KKy0gICAgICAgIHAxID0gZW5jcnlw
dGVkX2Zpcm13YXJlWzA6M10KKy0gICAgICAgIHAyID0gZW5jcnlwdGVkX2Zpcm13YXJlWzM6XQor
LSAgICAgICAgcDIgKz0gYiJceDAwIiAqICg4IC0gKGxlbihwMikgJSA4KSkKKy0KKy0gICAgICAg
IGQxID0gcDEgKyBjaXBoZXIuZGVjcnlwdChwMikKKy0gICAgICAgIGQxICs9IGIiXHgwMCIgKiAo
OCAtIChsZW4oZDEpICUgOCkpCistCistICAgICAgICByZXR1cm4gY2lwaGVyLmRlY3J5cHQoZDEp
CistCistICAgIGRlZiBzY2FuKHNlbGYsIHJlc3VsdCk6CistICAgICAgICAnJycKKy0gICAgICAg
IFZhbGlkYXRlIHNpZ25hdHVyZSByZXN1bHRzLgorLSAgICAgICAgJycnCistICAgICAgICBpZiBz
ZWxmLmVuYWJsZWQgaXMgVHJ1ZToKKy0gICAgICAgICAgICBpZiByZXN1bHQudmFsaWQgaXMgVHJ1
ZToKKy0gICAgICAgICAgICAgICAgaWYgcmVzdWx0LmRlc2NyaXB0aW9uLmxvd2VyKCkuc3RhcnRz
d2l0aChzZWxmLlNJR05BVFVSRV9ERVNDUklQVElPTikgaXMgVHJ1ZToKKy0gICAgICAgICAgICAg
ICAgICAgICMgUmVhZCBpbiB0aGUgZmlyc3QgNjQgYnl0ZXMgb2YgdGhlIHN1c3BlY3RlZCBlbmNy
eXB0ZWQKKy0gICAgICAgICAgICAgICAgICAgICMgdUltYWdlIGhlYWRlcgorLSAgICAgICAgICAg
ICAgICAgICAgZmQgPSBzZWxmLm1vZHVsZS5jb25maWcub3Blbl9maWxlKHJlc3VsdC5maWxlLnBh
dGgsIG9mZnNldD1yZXN1bHQub2Zmc2V0KQorLSAgICAgICAgICAgICAgICAgICAgZW5jcnlwdGVk
X2hlYWRlcl9kYXRhID0gYmlud2Fsay5jb3JlLmNvbXBhdC5zdHIyYnl0ZXMoZmQucmVhZCg2NCkp
CistICAgICAgICAgICAgICAgICAgICBmZC5jbG9zZSgpCistCistICAgICAgICAgICAgICAgICAg
ICAjIERlY3J5cHQgdGhlIGhlYWRlcgorLSAgICAgICAgICAgICAgICAgICAgZGVjcnlwdGVkX2hl
YWRlcl9kYXRhID0gc2VsZi5faGlsaW5rX2RlY3J5cHQoZW5jcnlwdGVkX2hlYWRlcl9kYXRhKQor
LQorLSAgICAgICAgICAgICAgICAgICAgIyBQdWxsIG91dCB0aGUgaW1hZ2Ugc2l6ZSBhbmQgaW1h
Z2UgbmFtZSBmaWVsZHMgZnJvbSB0aGUgZGVjcnlwdGVkIHVJbWFnZSBoZWFkZXIKKy0gICAgICAg
ICAgICAgICAgICAgICMgYW5kIGFkZCB0aGVtIHRvIHRoZSBwcmludGVkIGRlc2NyaXB0aW9uLgor
LSAgICAgICAgICAgICAgICAgICAgcmVzdWx0LnNpemUgPSBzdHJ1Y3QudW5wYWNrKGIiPkwiLCBk
ZWNyeXB0ZWRfaGVhZGVyX2RhdGFbMTI6MTZdKVswXQorLSAgICAgICAgICAgICAgICAgICAgcmVz
dWx0LmRlc2NyaXB0aW9uICs9ICIsIHNpemU6ICVkIiAlIChyZXN1bHQuc2l6ZSkKKy0gICAgICAg
ICAgICAgICAgICAgICMgTk9URTogVGhlIGRlc2NyaXB0aW9uIGZpZWxkIHNob3VsZCBiZSAzMiBi
eXRlcz8gSGlsaW5rIHNlZW1zIHRvIHVzZSBvbmx5IDI0IGJ5dGVzIGZvciB0aGlzIGZpZWxkLAor
LSAgICAgICAgICAgICAgICAgICAgIyAgICAgICBldmVuIHRob3VnaCB0aGUgaGVhZGVyIHNpemUg
aXMgc3RpbGwgNjQgYnl0ZXM/CistICAgICAgICAgICAgICAgICAgICByZXN1bHQuZGVzY3JpcHRp
b24gKz0gJywgaW1hZ2UgbmFtZTogIiVzIicgJSBiaW53YWxrLmNvcmUuY29tcGF0LmJ5dGVzMnN0
cihkZWNyeXB0ZWRfaGVhZGVyX2RhdGFbMzI6NTZdKS5zdHJpcCgiXHgwMCIpCistCistICAgICAg
ICAgICAgICAgICAgICAjIERvIHNvbWUgYmFzaWMgdmFsaWRhdGlvbiBvbiB0aGUgZGVjcnlwdGVk
IHNpemUgYW5kIGltYWdlCistICAgICAgICAgICAgICAgICAgICAjIG5hbWUgZmllbGRzCistICAg
ICAgICAgICAgICAgICAgICBpZiByZXN1bHQuc2l6ZSA+IChyZXN1bHQuZmlsZS5zaXplIC0gcmVz
dWx0Lm9mZnNldCk6CistICAgICAgICAgICAgICAgICAgICAgICAgcmVzdWx0LnZhbGlkID0gRmFs
c2UKKy0gICAgICAgICAgICAgICAgICAgIGlmIG5vdCBhbGwoYyBpbiBzdHJpbmcucHJpbnRhYmxl
IGZvciBjIGluIHJlc3VsdC5kZXNjcmlwdGlvbik6CistICAgICAgICAgICAgICAgICAgICAgICAg
cmVzdWx0LnZhbGlkID0gRmFsc2UKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDI1LVVwZGF0ZWQtdmVyc2lvbi1udW1iZXIt
Zm9yLXJlbGVhc2UucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJpbndhbGsvMDAyNS1VcGRhdGVkLXZlcnNpb24tbnVtYmVyLWZvci1yZWxlYXNlLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uMmU4Mzk5MTIzCi0tLSAv
ZGV2L251bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iaW53YWxrLzAwMjUtVXBkYXRlZC12ZXJzaW9uLW51bWJlci1mb3ItcmVsZWFzZS5wYXRjaApA
QCAtMCwwICsxLDIyIEBACitGcm9tIGE5ZmRiNWZiNjIzNzJjNTgxNGQ4ZmU2NDMyNmJhNzk5OTY5
OTc0YTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBkZXZ0dHlzMCA8Y2hlZmZuZXJA
cmVmaXJtbGFicy5jb20+CitEYXRlOiBNb24sIDE2IEF1ZyAyMDIxIDA2OjU2OjA3IC0wNzAwCitT
dWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZWQgdmVyc2lvbiBudW1iZXIgZm9yIHJlbGVhc2UKKworLS0t
Cisgc2V0dXAucHkgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zZXR1cC5weSBiL3NldHVwLnB5CitpbmRleCBiNzQ3
YjRkLi45YjlmNmNkIDEwMDc1NQorLS0tIGEvc2V0dXAucHkKKysrKyBiL3NldHVwLnB5CitAQCAt
MTIsNyArMTIsNyBAQCBleGNlcHQgSW1wb3J0RXJyb3I6CisgZnJvbSBkaXN0dXRpbHMuZGlyX3V0
aWwgaW1wb3J0IHJlbW92ZV90cmVlCisgCisgTU9EVUxFX05BTUUgPSAiYmlud2FsayIKKy1NT0RV
TEVfVkVSU0lPTiA9ICIyLjIuMSIKKytNT0RVTEVfVkVSU0lPTiA9ICIyLjMuMiIKKyBTQ1JJUFRf
TkFNRSA9IE1PRFVMRV9OQU1FCisgTU9EVUxFX0RJUkVDVE9SWSA9IG9zLnBhdGguZGlybmFtZShv
cy5wYXRoLnJlYWxwYXRoKF9fZmlsZV9fKSkKKyAKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDI2LUluaXRpYWwtbG93LXBy
aXYtZXhlY3V0aW9uLWltcGxlbWVudGF0aW9uLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjYtSW5pdGlhbC1sb3ctcHJpdi1leGVj
dXRpb24taW1wbGVtZW50YXRpb24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwLi5lNDNlOTA1MzEKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyNi1Jbml0aWFsLWxvdy1wcml2LWV4
ZWN1dGlvbi1pbXBsZW1lbnRhdGlvbi5wYXRjaApAQCAtMCwwICsxLDk3IEBACitGcm9tIGQyNDg0
YjMwYTFiZmE2YWY2MDI2MmY5YmE2ODc3NTdlNzQ5ZjMwZWMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBkZXZ0dHlzMCA8Y2hlZmZuZXJAcmVmaXJtbGFicy5jb20+CitEYXRlOiBXZWQs
IDEgU2VwIDIwMjEgMDc6MTA6MzcgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gSW5pdGlhbCBsb3ct
cHJpdiBleGVjdXRpb24gaW1wbGVtZW50YXRpb24KKworLS0tCisgc3JjL2JpbndhbGsvbW9kdWxl
cy9leHRyYWN0b3IucHkgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQorIDEg
ZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkgYi9zcmMvYmlud2Fsay9tb2R1
bGVzL2V4dHJhY3Rvci5weQoraW5kZXggNjE5NGY1Yy4uMzQ2ZjBmYiAxMDA2NDQKKy0tLSBhL3Ny
Yy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5CisrKysgYi9zcmMvYmlud2Fsay9tb2R1bGVz
L2V4dHJhY3Rvci5weQorQEAgLTQsNiArNCw3IEBACisgCisgaW1wb3J0IG9zCisgaW1wb3J0IHJl
CisraW1wb3J0IHB3ZAorIGltcG9ydCBzdGF0CisgaW1wb3J0IHNobGV4CisgaW1wb3J0IHRlbXBm
aWxlCitAQCAtNDcsNiArNDgsOSBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgIyBz
cXVhc2hmcy1yb290LTApLgorICAgICBVTklRVUVfUEFUSF9ERUxJTUlURVIgPSAnJSUnCisgCisr
ICAgICMgVW5wcml2aWxlZ2VkIHVzZXIgYWNjb3VudCB0byBleGVjdXRlIGV4dGVybmFsIGV4dHJh
Y3Rpb24gdXRpbGl0aWVzCisrICAgIFVOUFJJVklMRUdFRF9VU0VSX05BTUUgPSAnYmlud2Fsa3Nh
ZmUnCisrCisgICAgIFRJVExFID0gJ0V4dHJhY3Rpb24nCisgICAgIE9SREVSID0gOQorICAgICBQ
UklNQVJZID0gRmFsc2UKK0BAIC0xMjEsNiArMTI1LDEwIEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1
bGUpOgorICAgICBdCisgCisgICAgIGRlZiBsb2FkKHNlbGYpOgorKyAgICAgICAgdXNlcl9pbmZv
ID0gcHdkLmdldHB3bmFtKHNlbGYuVU5QUklWSUxFR0VEX1VTRVJfTkFNRSkKKysgICAgICAgIHNl
bGYudW5wcml2X3VpZCA9IHVzZXJfaW5mby5wd191aWQKKysgICAgICAgIHNlbGYudW5wcml2X2dp
ZCA9IHVzZXJfaW5mby5wd19naWQKKysKKyAgICAgICAgICMgSG9sZHMgYSBsaXN0IG9mIGV4dHJh
Y3Rpb24gcnVsZXMgbG9hZGVkIGVpdGhlciBmcm9tIGEgZmlsZSBvciB3aGVuCisgICAgICAgICAj
IG1hbnVhbGx5IHNwZWNpZmllZC4KKyAgICAgICAgIHNlbGYuZXh0cmFjdF9ydWxlcyA9IFtdCitA
QCAtNTM0LDYgKzU0Miw5IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAgZWxz
ZToKKyAgICAgICAgICAgICBvdXRwdXRfZGlyZWN0b3J5ID0gc2VsZi5leHRyYWN0aW9uX2RpcmVj
dG9yaWVzW3BhdGhdCisgCisrICAgICAgICAjIE1ha2Ugc3VyZSB1bnByaXYgdXNlciBjYW4gYWNj
ZXNzIHRoaXMgZGlyZWN0b3J5CisrICAgICAgICBvcy5jaG93bihvdXRwdXRfZGlyZWN0b3J5LCBz
ZWxmLnVucHJpdl91aWQsIHNlbGYudW5wcml2X2dpZCkKKysKKyAgICAgICAgIHJldHVybiBvdXRw
dXRfZGlyZWN0b3J5CisgCisgICAgIGRlZiBjbGVhbnVwX2V4dHJhY3RlZF9maWxlcyhzZWxmLCB0
Zj1Ob25lKToKK0BAIC04MjYsNiArODM3LDkgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6Cisg
ICAgICAgICAgICAgIyBDbGVhbnVwCisgICAgICAgICAgICAgZmRvdXQuY2xvc2UoKQorICAgICAg
ICAgICAgIGZkaW4uY2xvc2UoKQorKworKyAgICAgICAgICAgICMgTWFrZSBzdXJlIHVucHJpdmls
ZWdlZCB1c2VyIGNhbiBhY2Nlc3MgdGhpcyBmaWxlCisrICAgICAgICAgICAgb3MuY2hvd24oZm5h
bWUsIHNlbGYudW5wcml2X3VpZCwgc2VsZi51bnByaXZfZ2lkKQorICAgICAgICAgZXhjZXB0IEtl
eWJvYXJkSW50ZXJydXB0IGFzIGU6CisgICAgICAgICAgICAgcmFpc2UgZQorICAgICAgICAgZXhj
ZXB0IEV4Y2VwdGlvbiBhcyBlOgorQEAgLTg3Myw4ICs4ODcsNyBAQCBjbGFzcyBFeHRyYWN0b3Io
TW9kdWxlKToKKyAgICAgICAgICAgICAgICAgIyBHZW5lcmF0ZSB1bmlxdWUgZmlsZSBwYXRocyBm
b3IgYWxsIHBhdGhzIGluIHRoZSBjdXJyZW50CisgICAgICAgICAgICAgICAgICMgY29tbWFuZCB0
aGF0IGFyZSBzdXJyb3VuZGVkIGJ5IFVOSVFVRV9QQVRIX0RFTElNSVRFUgorICAgICAgICAgICAg
ICAgICB3aGlsZSBzZWxmLlVOSVFVRV9QQVRIX0RFTElNSVRFUiBpbiBjbWQ6CistICAgICAgICAg
ICAgICAgICAgICBuZWVkX3VuaXF1ZV9wYXRoID0gY21kLnNwbGl0KHNlbGYuVU5JUVVFX1BBVEhf
REVMSU1JVEVSKVsKKy0gICAgICAgICAgICAgICAgICAgICAgICAxXS5zcGxpdChzZWxmLlVOSVFV
RV9QQVRIX0RFTElNSVRFUilbMF0KKysgICAgICAgICAgICAgICAgICAgIG5lZWRfdW5pcXVlX3Bh
dGggPSBjbWQuc3BsaXQoc2VsZi5VTklRVUVfUEFUSF9ERUxJTUlURVIpWzFdLnNwbGl0KHNlbGYu
VU5JUVVFX1BBVEhfREVMSU1JVEVSKVswXQorICAgICAgICAgICAgICAgICAgICAgdW5pcXVlX3Bh
dGggPSBiaW53YWxrLmNvcmUuY29tbW9uLnVuaXF1ZV9maWxlX25hbWUobmVlZF91bmlxdWVfcGF0
aCkKKyAgICAgICAgICAgICAgICAgICAgIGNtZCA9IGNtZC5yZXBsYWNlKHNlbGYuVU5JUVVFX1BB
VEhfREVMSU1JVEVSICsgbmVlZF91bmlxdWVfcGF0aCArIHNlbGYuVU5JUVVFX1BBVEhfREVMSU1J
VEVSLCB1bmlxdWVfcGF0aCkKKyAKK0BAIC04ODUsOSArODk4LDIyIEBAIGNsYXNzIEV4dHJhY3Rv
cihNb2R1bGUpOgorICAgICAgICAgICAgICAgICAgICAgIyBjb21tYW5kIHdpdGggZm5hbWUKKyAg
ICAgICAgICAgICAgICAgICAgIGNvbW1hbmQgPSBjb21tYW5kLnN0cmlwKCkucmVwbGFjZShzZWxm
LkZJTEVfTkFNRV9QTEFDRUhPTERFUiwgZm5hbWUpCisgCistICAgICAgICAgICAgICAgICAgICBi
aW53YWxrLmNvcmUuY29tbW9uLmRlYnVnKCJzdWJwcm9jZXNzLmNhbGwoJXMsIHN0ZG91dD0lcywg
c3RkZXJyPSVzKSIgJSAoY29tbWFuZCwgc3RyKHRtcCksIHN0cih0bXApKSkKKy0gICAgICAgICAg
ICAgICAgICAgIHJ2YWwgPSBzdWJwcm9jZXNzLmNhbGwoc2hsZXguc3BsaXQoY29tbWFuZCksIHN0
ZG91dD10bXAsIHN0ZGVycj10bXApCisrICAgICAgICAgICAgICAgICAgICAjIEZvcmsgYSBjaGls
ZCB0byBkcm9wIHByaXZzCisrICAgICAgICAgICAgICAgICAgICBjaGlsZF9waWQgPSBvcy5mb3Jr
KCkKKysgICAgICAgICAgICAgICAgICAgIGlmIGNoaWxkX3BpZCBpcyAwOgorKyAgICAgICAgICAg
ICAgICAgICAgICAgICMgU3dpdGNoIHRvIHVucHJpdmlsZWdlZCB1c2VyCisrICAgICAgICAgICAg
ICAgICAgICAgICAgYmlud2Fsay5jb3JlLmNvbW1vbi5kZWJ1ZygiRHJvcHBpbmcgcHJpdmlsZWdl
cyB0byB1c2VyICclcyciICUgc2VsZi5VTlBSSVZJTEVHRURfVVNFUl9OQU1FKQorKyAgICAgICAg
ICAgICAgICAgICAgICAgIG9zLnNldGdpZChzZWxmLnVucHJpdl91aWQpCisrICAgICAgICAgICAg
ICAgICAgICAgICAgb3Muc2V0dWlkKHNlbGYudW5wcml2X2dpZCkKKysKKysgICAgICAgICAgICAg
ICAgICAgICAgICAjIEV4ZWN1dGUgZXh0ZXJuYWwgZXh0cmFjdG9yCisrICAgICAgICAgICAgICAg
ICAgICAgICAgYmlud2Fsay5jb3JlLmNvbW1vbi5kZWJ1Zygic3VicHJvY2Vzcy5jYWxsKCVzLCBz
dGRvdXQ9JXMsIHN0ZGVycj0lcykiICUgKGNvbW1hbmQsIHN0cih0bXApLCBzdHIodG1wKSkpCisr
ICAgICAgICAgICAgICAgICAgICAgICAgcnZhbCA9IHN1YnByb2Nlc3MuY2FsbChzaGxleC5zcGxp
dChjb21tYW5kKSwgc3Rkb3V0PXRtcCwgc3RkZXJyPXRtcCkKKysgICAgICAgICAgICAgICAgICAg
ICAgICBzeXMuZXhpdChydmFsKQorKyAgICAgICAgICAgICAgICAgICAgZWxzZToKKysgICAgICAg
ICAgICAgICAgICAgICAgICBydmFsID0gb3Mud2FpdCgpCisgCisrICAgICAgICAgICAgICAgICAg
ICAjIENoZWNrIHRoZSByZXR1cm4gdmFsdWUgdG8gc2VlIGlmIGV4dHJhY3Rpb24gd2FzIHN1Y2Nl
c3NmdWwgb3Igbm90CisgICAgICAgICAgICAgICAgICAgICBpZiBydmFsIGluIGNvZGVzOgorICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHZhbCA9IFRydWUKKyAgICAgICAgICAgICAgICAgICAg
IGVsc2U6CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJpbndhbGsvMDAyNy1BZGRlZC1vcHRpb24tdG8tdHVybi1vZmYtcHJpdmlsZWdlLWRy
b3BwaW5nLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iaW53YWxrLzAwMjctQWRkZWQtb3B0aW9uLXRvLXR1cm4tb2ZmLXByaXZpbGVnZS1kcm9wcGlu
Zy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmNkZTcwNDM3Zgot
LS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtYmlud2Fsay8wMDI3LUFkZGVkLW9wdGlvbi10by10dXJuLW9mZi1wcml2aWxlZ2UtZHJv
cHBpbmcucGF0Y2gKQEAgLTAsMCArMSwxNTIgQEAKK0Zyb20gNjQ1MTY1OTE3NjNmMjU3MGZjNTM1
NjQ0OTIxOGE5OTkwM2I1M2E0OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRldnR0
eXMwIDxjaGVmZm5lckByZWZpcm1sYWJzLmNvbT4KK0RhdGU6IFdlZCwgMSBTZXAgMjAyMSAwODo1
MTowOSAtMDcwMAorU3ViamVjdDogW1BBVENIXSBBZGRlZCBvcHRpb24gdG8gdHVybiBvZmYgcHJp
dmlsZWdlIGRyb3BwaW5nCisKKy0tLQorIHNyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5
IHwgODIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwg
NTQgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvYmlu
d2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weSBiL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9y
LnB5CitpbmRleCAzNDZmMGZiLi4zNjFiMDQxIDEwMDY0NAorLS0tIGEvc3JjL2JpbndhbGsvbW9k
dWxlcy9leHRyYWN0b3IucHkKKysrKyBiL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5
CitAQCAtMTEsNiArMTEsNyBAQCBpbXBvcnQgdGVtcGZpbGUKKyBpbXBvcnQgc3VicHJvY2Vzcwor
IGltcG9ydCBiaW53YWxrLmNvcmUuY29tbW9uCisgZnJvbSBiaW53YWxrLmNvcmUuY29tcGF0IGlt
cG9ydCAqCisrZnJvbSBiaW53YWxrLmNvcmUuZXhjZXB0aW9ucyBpbXBvcnQgTW9kdWxlRXhjZXB0
aW9uCisgZnJvbSBiaW53YWxrLmNvcmUubW9kdWxlIGltcG9ydCBNb2R1bGUsIE9wdGlvbiwgS3dh
cmcKKyBmcm9tIGJpbndhbGsuY29yZS5jb21tb24gaW1wb3J0IGZpbGVfc2l6ZSwgZmlsZV9tZDUs
IHVuaXF1ZV9maWxlX25hbWUsIEJsb2NrRmlsZQorIAorQEAgLTQ5LDcgKzUwLDcgQEAgY2xhc3Mg
RXh0cmFjdG9yKE1vZHVsZSk6CisgICAgIFVOSVFVRV9QQVRIX0RFTElNSVRFUiA9ICclJScKKyAK
KyAgICAgIyBVbnByaXZpbGVnZWQgdXNlciBhY2NvdW50IHRvIGV4ZWN1dGUgZXh0ZXJuYWwgZXh0
cmFjdGlvbiB1dGlsaXRpZXMKKy0gICAgVU5QUklWSUxFR0VEX1VTRVJfTkFNRSA9ICdiaW53YWxr
c2FmZScKKysgICAgVU5QUklWSUxFR0VEX1VTRVJfTkFNRSA9ICdiaW53YWxrX3NhZmVfdXNlcl82
OScKKyAKKyAgICAgVElUTEUgPSAnRXh0cmFjdGlvbicKKyAgICAgT1JERVIgPSA5CitAQCAtMTA4
LDYgKzEwOSwxMCBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgICAgICAgICBs
b25nPSdzdWJkaXJzJywKKyAgICAgICAgICAgICAgICBrd2FyZ3M9eydleHRyYWN0X2ludG9fc3Vi
ZGlycyc6IFRydWV9LAorICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uPSJFeHRyYWN0IGludG8g
c3ViLWRpcmVjdG9yaWVzIG5hbWVkIGJ5IHRoZSBvZmZzZXQiKSwKKysgICAgICAgIE9wdGlvbihz
aG9ydD0nMCcsCisrICAgICAgICAgICAgICAgbG9uZz0ndW5zYWZlJywKKysgICAgICAgICAgICAg
ICBrd2FyZ3M9eyd1bnNhZmVfZXh0cmFjdGlvbic6IFRydWV9LAorKyAgICAgICAgICAgICAgIGRl
c2NyaXB0aW9uPSJFeGVjdXRlIGV4dGVybmFsIGV4dHJhY3Rpb25zIHdpdGhvdXQgZHJvcHBpbmcg
cHJpdmlsZWdlcyIpLAorICAgICBdCisgCisgICAgIEtXQVJHUyA9IFsKK0BAIC0xMjIsMTIgKzEy
NywyNSBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgIEt3YXJnKG5hbWU9J21h
bnVhbF9ydWxlcycsIGRlZmF1bHQ9W10pLAorICAgICAgICAgS3dhcmcobmFtZT0nbWF0cnlvc2hr
YScsIGRlZmF1bHQ9MCksCisgICAgICAgICBLd2FyZyhuYW1lPSdlbmFibGVkJywgZGVmYXVsdD1G
YWxzZSksCisrICAgICAgICBLd2FyZyhuYW1lPSd1bnNhZmVfZXh0cmFjdGlvbicsIGRlZmF1bHQ9
RmFsc2UpLAorICAgICBdCisgCisgICAgIGRlZiBsb2FkKHNlbGYpOgorLSAgICAgICAgdXNlcl9p
bmZvID0gcHdkLmdldHB3bmFtKHNlbGYuVU5QUklWSUxFR0VEX1VTRVJfTkFNRSkKKy0gICAgICAg
IHNlbGYudW5wcml2X3VpZCA9IHVzZXJfaW5mby5wd191aWQKKy0gICAgICAgIHNlbGYudW5wcml2
X2dpZCA9IHVzZXJfaW5mby5wd19naWQKKysgICAgICAgIHNlbGYudW5wcml2X3VpZCA9IE5vbmUK
KysgICAgICAgIHNlbGYudW5wcml2X2dpZCA9IE5vbmUKKysKKysgICAgICAgIGlmIHNlbGYuZW5h
YmxlZCBpcyBUcnVlIGFuZCBzZWxmLnVuc2FmZV9leHRyYWN0aW9uIGlzIEZhbHNlOgorKyAgICAg
ICAgICAgIGlmIG9zLmdldHVpZCgpICE9IDA6CisrICAgICAgICAgICAgICAgIHJhaXNlIE1vZHVs
ZUV4Y2VwdGlvbigiQmlud2FsayByZXF1aXJlcyByb290IHByaXZpbGVnZXMgdG8gc2FmZWx5IGV4
ZWN1dGUgZXh0ZXJuYWwgZXh0cmFjdGlvbiB1dGlsaXRpZXMgYXMgYW4gdW5wcml2aWxlZ2VkIHVz
ZXIuIikKKysKKysgICAgICAgICAgICBzZWxmLnNoZWxsX2NhbGwoJ3VzZXJhZGQgJXMnICUgc2Vs
Zi5VTlBSSVZJTEVHRURfVVNFUl9OQU1FKQorKworKyAgICAgICAgICAgIHVzZXJfaW5mbyA9IHB3
ZC5nZXRwd25hbShzZWxmLlVOUFJJVklMRUdFRF9VU0VSX05BTUUpCisrICAgICAgICAgICAgc2Vs
Zi51bnByaXZfdWlkID0gdXNlcl9pbmZvLnB3X3VpZAorKyAgICAgICAgICAgIHNlbGYudW5wcml2
X2dpZCA9IHVzZXJfaW5mby5wd19naWQKKysgICAgICAgIGVsc2U6CisrICAgICAgICAgICAgc2Vs
Zi51bnByaXZfdWlkID0gb3MuZ2V0dWlkKCkKKysgICAgICAgICAgICBzZWxmLnVucHJpdl9naWQg
PSBvcy5nZXRnaWQoKQorIAorICAgICAgICAgIyBIb2xkcyBhIGxpc3Qgb2YgZXh0cmFjdGlvbiBy
dWxlcyBsb2FkZWQgZWl0aGVyIGZyb20gYSBmaWxlIG9yIHdoZW4KKyAgICAgICAgICMgbWFudWFs
bHkgc3BlY2lmaWVkLgorQEAgLTg2MCw3ICs4NzgsNiBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxl
KToKKyAKKyAgICAgICAgIFJldHVybnMgVHJ1ZSBvbiBzdWNjZXNzLCBGYWxzZSBvbiBmYWlsdXJl
LCBvciBOb25lIGlmIHRoZSBleHRlcm5hbCBleHRyYWN0aW9uIHV0aWxpdHkgY291bGQgbm90IGJl
IGZvdW5kLgorICAgICAgICAgJycnCistICAgICAgICB0bXAgPSBOb25lCisgICAgICAgICBydmFs
ID0gMAorICAgICAgICAgcmV0dmFsID0gVHJ1ZQorICAgICAgICAgY29tbWFuZF9saXN0ID0gW10K
K0BAIC04NzksMTEgKzg5Niw2IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAg
ICAgICAgICAgICAgcmV0dmFsID0gRmFsc2UKKyAgICAgICAgICAgICAgICAgICAgIGJpbndhbGsu
Y29yZS5jb21tb24ud2FybmluZygiSW50ZXJuYWwgZXh0cmFjdG9yICclcycgZmFpbGVkIHdpdGgg
ZXhjZXB0aW9uOiAnJXMnIiAlIChzdHIoY21kKSwgc3RyKGUpKSkKKyAgICAgICAgICAgICBlbGlm
IGNtZDoKKy0gICAgICAgICAgICAgICAgIyBJZiBub3QgaW4gZGVidWcgbW9kZSwgY3JlYXRlIGEg
dGVtcG9yYXJ5IGZpbGUgdG8gcmVkaXJlY3QKKy0gICAgICAgICAgICAgICAgIyBzdGRvdXQgYW5k
IHN0ZGVyciB0bworLSAgICAgICAgICAgICAgICBpZiBub3QgYmlud2Fsay5jb3JlLmNvbW1vbi5E
RUJVRzoKKy0gICAgICAgICAgICAgICAgICAgIHRtcCA9IHRlbXBmaWxlLlRlbXBvcmFyeUZpbGUo
KQorLQorICAgICAgICAgICAgICAgICAjIEdlbmVyYXRlIHVuaXF1ZSBmaWxlIHBhdGhzIGZvciBh
bGwgcGF0aHMgaW4gdGhlIGN1cnJlbnQKKyAgICAgICAgICAgICAgICAgIyBjb21tYW5kIHRoYXQg
YXJlIHN1cnJvdW5kZWQgYnkgVU5JUVVFX1BBVEhfREVMSU1JVEVSCisgICAgICAgICAgICAgICAg
IHdoaWxlIHNlbGYuVU5JUVVFX1BBVEhfREVMSU1JVEVSIGluIGNtZDoKK0BAIC04OTgsMjEgKzkx
MCw5IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAgICAgICAgICAgICAgIyBj
b21tYW5kIHdpdGggZm5hbWUKKyAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmQgPSBjb21tYW5k
LnN0cmlwKCkucmVwbGFjZShzZWxmLkZJTEVfTkFNRV9QTEFDRUhPTERFUiwgZm5hbWUpCisgCist
ICAgICAgICAgICAgICAgICAgICAjIEZvcmsgYSBjaGlsZCB0byBkcm9wIHByaXZzCistICAgICAg
ICAgICAgICAgICAgICBjaGlsZF9waWQgPSBvcy5mb3JrKCkKKy0gICAgICAgICAgICAgICAgICAg
IGlmIGNoaWxkX3BpZCBpcyAwOgorLSAgICAgICAgICAgICAgICAgICAgICAgICMgU3dpdGNoIHRv
IHVucHJpdmlsZWdlZCB1c2VyCistICAgICAgICAgICAgICAgICAgICAgICAgYmlud2Fsay5jb3Jl
LmNvbW1vbi5kZWJ1ZygiRHJvcHBpbmcgcHJpdmlsZWdlcyB0byB1c2VyICclcyciICUgc2VsZi5V
TlBSSVZJTEVHRURfVVNFUl9OQU1FKQorLSAgICAgICAgICAgICAgICAgICAgICAgIG9zLnNldGdp
ZChzZWxmLnVucHJpdl91aWQpCistICAgICAgICAgICAgICAgICAgICAgICAgb3Muc2V0dWlkKHNl
bGYudW5wcml2X2dpZCkKKy0KKy0gICAgICAgICAgICAgICAgICAgICAgICAjIEV4ZWN1dGUgZXh0
ZXJuYWwgZXh0cmFjdG9yCistICAgICAgICAgICAgICAgICAgICAgICAgYmlud2Fsay5jb3JlLmNv
bW1vbi5kZWJ1Zygic3VicHJvY2Vzcy5jYWxsKCVzLCBzdGRvdXQ9JXMsIHN0ZGVycj0lcykiICUg
KGNvbW1hbmQsIHN0cih0bXApLCBzdHIodG1wKSkpCistICAgICAgICAgICAgICAgICAgICAgICAg
cnZhbCA9IHN1YnByb2Nlc3MuY2FsbChzaGxleC5zcGxpdChjb21tYW5kKSwgc3Rkb3V0PXRtcCwg
c3RkZXJyPXRtcCkKKy0gICAgICAgICAgICAgICAgICAgICAgICBzeXMuZXhpdChydmFsKQorLSAg
ICAgICAgICAgICAgICAgICAgZWxzZToKKy0gICAgICAgICAgICAgICAgICAgICAgICBydmFsID0g
b3Mud2FpdCgpCistCisrICAgICAgICAgICAgICAgICAgICAjIEV4ZWN1dGUgZXh0ZXJuYWwgZXh0
cmFjdG9yCisrICAgICAgICAgICAgICAgICAgICBydmFsID0gc2VsZi5zaGVsbF9jYWxsKGNvbW1h
bmQpCisrICAgICAgICAgICAgICAgICAgICAKKyAgICAgICAgICAgICAgICAgICAgICMgQ2hlY2sg
dGhlIHJldHVybiB2YWx1ZSB0byBzZWUgaWYgZXh0cmFjdGlvbiB3YXMgc3VjY2Vzc2Z1bCBvciBu
b3QKKyAgICAgICAgICAgICAgICAgICAgIGlmIHJ2YWwgaW4gY29kZXM6CisgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dmFsID0gVHJ1ZQorQEAgLTkzNSw3ICs5MzUsMzMgQEAgY2xhc3MgRXh0
cmFjdG9yKE1vZHVsZSk6CisgICAgICAgICAgICAgYmlud2Fsay5jb3JlLmNvbW1vbi53YXJuaW5n
KCJFeHRyYWN0b3IuZXhlY3V0ZSBmYWlsZWQgdG8gcnVuIGV4dGVybmFsIGV4dHJhY3RvciAnJXMn
OiAlcywgJyVzJyBtaWdodCBub3QgYmUgaW5zdGFsbGVkIGNvcnJlY3RseSIgJSAoc3RyKGNtZCks
IHN0cihlKSwgc3RyKGNtZCkpKQorICAgICAgICAgICAgIHJldHZhbCA9IE5vbmUKKyAKKy0gICAg
ICAgIGlmIHRtcCBpcyBub3QgTm9uZToKKy0gICAgICAgICAgICB0bXAuY2xvc2UoKQorLQorICAg
ICAgICAgcmV0dXJuIChyZXR2YWwsICcmJicuam9pbihjb21tYW5kX2xpc3QpKQorKworKyAgICBk
ZWYgc2hlbGxfY2FsbChzZWxmLCBjb21tYW5kKToKKysgICAgICAgICMgRm9yayBhIGNoaWxkIHRv
IGRyb3AgcHJpdnMKKysgICAgICAgIGNoaWxkX3BpZCA9IG9zLmZvcmsoKQorKyAgICAgICAgaWYg
Y2hpbGRfcGlkIGlzIDA6CisrICAgICAgICAgICAgIyBTd2l0Y2ggdG8gdW5wcml2aWxlZ2VkIHVz
ZXIsIGlmIG9uZSBoYXMgYmVlbiBzZXQKKysgICAgICAgICAgICBpZiBzZWxmLnVucHJpdl91aWQg
aXMgbm90IE5vbmUgYW5kIHNlbGYudW5wcml2X2dpZCBpcyBub3QgTm9uZToKKysgICAgICAgICAg
ICAgICAgYmlud2Fsay5jb3JlLmNvbW1vbi5kZWJ1ZygiRHJvcHBpbmcgcHJpdmlsZWdlcyB0byAl
ZDolZCIgJSAoc2VsZi51bnByaXZfdWlkLCBzZWxmLnVucHJpdl9naWQpKQorKyAgICAgICAgICAg
ICAgICBvcy5zZXRnaWQoc2VsZi51bnByaXZfdWlkKQorKyAgICAgICAgICAgICAgICBvcy5zZXR1
aWQoc2VsZi51bnByaXZfZ2lkKQorKworKyAgICAgICAgICAgICMgSWYgbm90IGluIGRlYnVnIG1v
ZGUsIGNyZWF0ZSBhIHRlbXBvcmFyeSBmaWxlIHRvIHJlZGlyZWN0CisrICAgICAgICAgICAgIyBz
dGRvdXQgYW5kIHN0ZGVyciB0bworKyAgICAgICAgICAgIGlmIG5vdCBiaW53YWxrLmNvcmUuY29t
bW9uLkRFQlVHOgorKyAgICAgICAgICAgICAgICB0bXAgPSB0ZW1wZmlsZS5UZW1wb3JhcnlGaWxl
KCkKKysgICAgICAgICAgICBlbHNlOgorKyAgICAgICAgICAgICAgICB0bXAgPSBOb25lCisrCisr
ICAgICAgICAgICAgIyBFeGVjdXRlIGNvbW1hbmQKKysgICAgICAgICAgICBiaW53YWxrLmNvcmUu
Y29tbW9uLmRlYnVnKCJzdWJwcm9jZXNzLmNhbGwoJXMsIHN0ZG91dD0lcywgc3RkZXJyPSVzKSIg
JSAoY29tbWFuZCwgc3RyKHRtcCksIHN0cih0bXApKSkKKysgICAgICAgICAgICBydmFsID0gc3Vi
cHJvY2Vzcy5jYWxsKHNobGV4LnNwbGl0KGNvbW1hbmQpLCBzdGRvdXQ9dG1wLCBzdGRlcnI9dG1w
KQorKworKyAgICAgICAgICAgICMgQ2xlYW4gdXAgdGVtcCBmaWxlCisrICAgICAgICAgICAgaWYg
dG1wIGlzIG5vdCBOb25lOgorKyAgICAgICAgICAgICAgICB0bXAuY2xvc2UoKQorKworKyAgICAg
ICAgICAgIHN5cy5leGl0KHJ2YWwpCisrICAgICAgICBlbHNlOgorKyAgICAgICAgICAgIHJldHVy
biBvcy53YWl0KClbMV0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDI4LUFkZGVkLW9wdGlvbi1mb3Itc3BlY2lmeWluZy1h
LXVzZXItdG8tcnVuLWV4dGVybmFsLWUucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyOC1BZGRlZC1vcHRpb24tZm9yLXNwZWNpZnlp
bmctYS11c2VyLXRvLXJ1bi1leHRlcm5hbC1lLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMC4uMWZkOGNlNzIzCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMjgtQWRkZWQtb3B0aW9u
LWZvci1zcGVjaWZ5aW5nLWEtdXNlci10by1ydW4tZXh0ZXJuYWwtZS5wYXRjaApAQCAtMCwwICsx
LDEzOSBAQAorRnJvbSAxOGMwMmQ3YWNhMzBjOGY3N2NiMzcxYzYyZDEwODk5MTEwMDcwODRiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZmbmVyQHJlZmlybWxh
YnMuY29tPgorRGF0ZTogRnJpLCAzIFNlcCAyMDIxIDA5OjAzOjM0IC0wNzAwCitTdWJqZWN0OiBb
UEFUQ0hdIEFkZGVkIG9wdGlvbiBmb3Igc3BlY2lmeWluZyBhIHVzZXIgdG8gcnVuIGV4dGVybmFs
IGV4dHJhY3Rpb24KKyB1dGlsdGllcyBhcworCistLS0KKyBzcmMvYmlud2Fsay9tb2R1bGVzL2V4
dHJhY3Rvci5weSB8IDcwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCisgMSBmaWxl
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0
IGEvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkgYi9zcmMvYmlud2Fsay9tb2R1bGVz
L2V4dHJhY3Rvci5weQoraW5kZXggMzYxYjA0MS4uZGE5NmI3OCAxMDA2NDQKKy0tLSBhL3NyYy9i
aW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5CisrKysgYi9zcmMvYmlud2Fsay9tb2R1bGVzL2V4
dHJhY3Rvci5weQorQEAgLTkyLDYgKzkyLDExIEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgor
ICAgICAgICAgICAgICAgIHR5cGU9aW50LAorICAgICAgICAgICAgICAgIGt3YXJncz17J21heF9j
b3VudCc6IDB9LAorICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uPSdMaW1pdCB0aGUgbnVtYmVy
IG9mIGV4dHJhY3RlZCBmaWxlcycpLAorKyAgICAgICAgT3B0aW9uKHNob3J0PScwJywKKysgICAg
ICAgICAgICAgICBsb25nPSdydW4tYXMnLAorKyAgICAgICAgICAgICAgIHR5cGU9c3RyLAorKyAg
ICAgICAgICAgICAgIGt3YXJncz17J3J1bmFzX3VzZXInOiAwfSwKKysgICAgICAgICAgICAgICBk
ZXNjcmlwdGlvbj0iRXhlY3V0ZSBleHRlcm5hbCBleHRyYWN0aW9uIHV0aWxpdGllcyB3aXRoIHRo
ZSBzcGVjaWZpZWQgdXNlcidzIHByaXZpbGVnZXMiKSwKKyAgICAgICAgICNPcHRpb24oc2hvcnQ9
J3UnLAorICAgICAgICAgIyAgICAgICBsb25nPSdsaW1pdCcsCisgICAgICAgICAjICAgICAgIHR5
cGU9aW50LAorQEAgLTEwOSwxMCArMTE0LDYgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6Cisg
ICAgICAgICAgICAgICAgbG9uZz0nc3ViZGlycycsCisgICAgICAgICAgICAgICAga3dhcmdzPXsn
ZXh0cmFjdF9pbnRvX3N1YmRpcnMnOiBUcnVlfSwKKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlv
bj0iRXh0cmFjdCBpbnRvIHN1Yi1kaXJlY3RvcmllcyBuYW1lZCBieSB0aGUgb2Zmc2V0IiksCist
ICAgICAgICBPcHRpb24oc2hvcnQ9JzAnLAorLSAgICAgICAgICAgICAgIGxvbmc9J3Vuc2FmZScs
CistICAgICAgICAgICAgICAga3dhcmdzPXsndW5zYWZlX2V4dHJhY3Rpb24nOiBUcnVlfSwKKy0g
ICAgICAgICAgICAgICBkZXNjcmlwdGlvbj0iRXhlY3V0ZSBleHRlcm5hbCBleHRyYWN0aW9ucyB3
aXRob3V0IGRyb3BwaW5nIHByaXZpbGVnZXMiKSwKKyAgICAgXQorIAorICAgICBLV0FSR1MgPSBb
CitAQCAtMTI3LDI1ICsxMjgsMjQgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAgICAg
ICBLd2FyZyhuYW1lPSdtYW51YWxfcnVsZXMnLCBkZWZhdWx0PVtdKSwKKyAgICAgICAgIEt3YXJn
KG5hbWU9J21hdHJ5b3Noa2EnLCBkZWZhdWx0PTApLAorICAgICAgICAgS3dhcmcobmFtZT0nZW5h
YmxlZCcsIGRlZmF1bHQ9RmFsc2UpLAorLSAgICAgICAgS3dhcmcobmFtZT0ndW5zYWZlX2V4dHJh
Y3Rpb24nLCBkZWZhdWx0PUZhbHNlKSwKKysgICAgICAgIEt3YXJnKG5hbWU9J3J1bmFzX3VzZXIn
LCBkZWZhdWx0PU5vbmUpLAorICAgICBdCisgCisgICAgIGRlZiBsb2FkKHNlbGYpOgorLSAgICAg
ICAgc2VsZi51bnByaXZfdWlkID0gTm9uZQorLSAgICAgICAgc2VsZi51bnByaXZfZ2lkID0gTm9u
ZQorLQorLSAgICAgICAgaWYgc2VsZi5lbmFibGVkIGlzIFRydWUgYW5kIHNlbGYudW5zYWZlX2V4
dHJhY3Rpb24gaXMgRmFsc2U6CistICAgICAgICAgICAgaWYgb3MuZ2V0dWlkKCkgIT0gMDoKKy0g
ICAgICAgICAgICAgICAgcmFpc2UgTW9kdWxlRXhjZXB0aW9uKCJCaW53YWxrIHJlcXVpcmVzIHJv
b3QgcHJpdmlsZWdlcyB0byBzYWZlbHkgZXhlY3V0ZSBleHRlcm5hbCBleHRyYWN0aW9uIHV0aWxp
dGllcyBhcyBhbiB1bnByaXZpbGVnZWQgdXNlci4iKQorLQorLSAgICAgICAgICAgIHNlbGYuc2hl
bGxfY2FsbCgndXNlcmFkZCAlcycgJSBzZWxmLlVOUFJJVklMRUdFRF9VU0VSX05BTUUpCistCist
ICAgICAgICAgICAgdXNlcl9pbmZvID0gcHdkLmdldHB3bmFtKHNlbGYuVU5QUklWSUxFR0VEX1VT
RVJfTkFNRSkKKy0gICAgICAgICAgICBzZWxmLnVucHJpdl91aWQgPSB1c2VyX2luZm8ucHdfdWlk
CistICAgICAgICAgICAgc2VsZi51bnByaXZfZ2lkID0gdXNlcl9pbmZvLnB3X2dpZAorLSAgICAg
ICAgZWxzZToKKy0gICAgICAgICAgICBzZWxmLnVucHJpdl91aWQgPSBvcy5nZXR1aWQoKQorLSAg
ICAgICAgICAgIHNlbGYudW5wcml2X2dpZCA9IG9zLmdldGdpZCgpCisrICAgICAgICBzZWxmLnJ1
bmFzX3VpZCA9IE5vbmUKKysgICAgICAgIHNlbGYucnVuYXNfZ2lkID0gTm9uZQorKworKyAgICAg
ICAgaWYgc2VsZi5lbmFibGVkIGlzIFRydWU6CisrICAgICAgICAgICAgaWYgc2VsZi5ydW5hc191
c2VyIGlzIE5vbmU6CisrICAgICAgICAgICAgICAgIGlmIG9zLmdldHVpZCgpID09IDA6CisrICAg
ICAgICAgICAgICAgICAgICByYWlzZSBNb2R1bGVFeGNlcHRpb24oIkJpbndhbGsgZXh0cmFjdGlv
biB1c2VzIG1hbnkgdGhpcmQgcGFydHkgdXRpbGl0aWVzLCB3aGljaCBtYXkgbm90IGJlIHNlY3Vy
ZS5cbklmIHlvdSB3aXNoIHRvIGhhdmUgZXh0cmFjdGlvbiB1dGlsaXRpZXMgZXhlY3V0ZWQgYXMg
dGhlIGN1cnJlbnQgdXNlciwgdXNlIC0tcnVuLWFzPTx1c2VyIG5hbWU+LiIpCisrICAgICAgICAg
ICAgCisrICAgICAgICAgICAgICAgIHNlbGYucnVuYXNfdWlkID0gb3MuZ2V0dWlkKCkKKysgICAg
ICAgICAgICAgICAgc2VsZi5ydW5hc19naWQgPSBvcy5nZXRnaWQoKQorKyAgICAgICAgICAgIGVs
c2U6CisrICAgICAgICAgICAgICAgIHVzZXJfaW5mbyA9IHB3ZC5nZXRwd25hbShzZWxmLnJ1bmFz
X3VzZXIpCisrICAgICAgICAgICAgICAgIHNlbGYucnVuYXNfdWlkID0gdXNlcl9pbmZvLnB3X3Vp
ZAorKyAgICAgICAgICAgICAgICBzZWxmLnJ1bmFzX2dpZCA9IHVzZXJfaW5mby5wd19naWQKKyAK
KyAgICAgICAgICMgSG9sZHMgYSBsaXN0IG9mIGV4dHJhY3Rpb24gcnVsZXMgbG9hZGVkIGVpdGhl
ciBmcm9tIGEgZmlsZSBvciB3aGVuCisgICAgICAgICAjIG1hbnVhbGx5IHNwZWNpZmllZC4KK0BA
IC01NjAsOCArNTYwLDggQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAgICAgICBlbHNl
OgorICAgICAgICAgICAgIG91dHB1dF9kaXJlY3RvcnkgPSBzZWxmLmV4dHJhY3Rpb25fZGlyZWN0
b3JpZXNbcGF0aF0KKyAKKy0gICAgICAgICMgTWFrZSBzdXJlIHVucHJpdiB1c2VyIGNhbiBhY2Nl
c3MgdGhpcyBkaXJlY3RvcnkKKy0gICAgICAgIG9zLmNob3duKG91dHB1dF9kaXJlY3RvcnksIHNl
bGYudW5wcml2X3VpZCwgc2VsZi51bnByaXZfZ2lkKQorKyAgICAgICAgIyBNYWtlIHN1cmUgcnVu
YXMgdXNlciBjYW4gYWNjZXNzIHRoaXMgZGlyZWN0b3J5CisrICAgICAgICBvcy5jaG93bihvdXRw
dXRfZGlyZWN0b3J5LCBzZWxmLnJ1bmFzX3VpZCwgc2VsZi5ydW5hc19naWQpCisgCisgICAgICAg
ICByZXR1cm4gb3V0cHV0X2RpcmVjdG9yeQorIAorQEAgLTg1Niw4ICs4NTYsOCBAQCBjbGFzcyBF
eHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgICAgICBmZG91dC5jbG9zZSgpCisgICAgICAgICAg
ICAgZmRpbi5jbG9zZSgpCisgCistICAgICAgICAgICAgIyBNYWtlIHN1cmUgdW5wcml2aWxlZ2Vk
IHVzZXIgY2FuIGFjY2VzcyB0aGlzIGZpbGUKKy0gICAgICAgICAgICBvcy5jaG93bihmbmFtZSwg
c2VsZi51bnByaXZfdWlkLCBzZWxmLnVucHJpdl9naWQpCisrICAgICAgICAgICAgIyBNYWtlIHN1
cmUgcnVuYXNpbGVnZWQgdXNlciBjYW4gYWNjZXNzIHRoaXMgZmlsZQorKyAgICAgICAgICAgIG9z
LmNob3duKGZuYW1lLCBzZWxmLnJ1bmFzX3VpZCwgc2VsZi5ydW5hc19naWQpCisgICAgICAgICBl
eGNlcHQgS2V5Ym9hcmRJbnRlcnJ1cHQgYXMgZToKKyAgICAgICAgICAgICByYWlzZSBlCisgICAg
ICAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CitAQCAtOTM4LDE5ICs5MzgsMTcgQEAgY2xhc3Mg
RXh0cmFjdG9yKE1vZHVsZSk6CisgICAgICAgICByZXR1cm4gKHJldHZhbCwgJyYmJy5qb2luKGNv
bW1hbmRfbGlzdCkpCisgCisgICAgIGRlZiBzaGVsbF9jYWxsKHNlbGYsIGNvbW1hbmQpOgorLSAg
ICAgICAgIyBGb3JrIGEgY2hpbGQgdG8gZHJvcCBwcml2cworICAgICAgICAgY2hpbGRfcGlkID0g
b3MuZm9yaygpCisgICAgICAgICBpZiBjaGlsZF9waWQgaXMgMDoKKy0gICAgICAgICAgICAjIFN3
aXRjaCB0byB1bnByaXZpbGVnZWQgdXNlciwgaWYgb25lIGhhcyBiZWVuIHNldAorLSAgICAgICAg
ICAgIGlmIHNlbGYudW5wcml2X3VpZCBpcyBub3QgTm9uZSBhbmQgc2VsZi51bnByaXZfZ2lkIGlz
IG5vdCBOb25lOgorLSAgICAgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLmRlYnVnKCJE
cm9wcGluZyBwcml2aWxlZ2VzIHRvICVkOiVkIiAlIChzZWxmLnVucHJpdl91aWQsIHNlbGYudW5w
cml2X2dpZCkpCistICAgICAgICAgICAgICAgIG9zLnNldGdpZChzZWxmLnVucHJpdl91aWQpCist
ICAgICAgICAgICAgICAgIG9zLnNldHVpZChzZWxmLnVucHJpdl9naWQpCistCistICAgICAgICAg
ICAgIyBJZiBub3QgaW4gZGVidWcgbW9kZSwgY3JlYXRlIGEgdGVtcG9yYXJ5IGZpbGUgdG8gcmVk
aXJlY3QKKy0gICAgICAgICAgICAjIHN0ZG91dCBhbmQgc3RkZXJyIHRvCisrICAgICAgICAgICAg
IyBTd2l0Y2ggdG8gdGhlIHJ1bi1hcyB1c2VyIHByaXZpbGVnZXMsIGlmIG9uZSBoYXMgYmVlbiBz
ZXQKKysgICAgICAgICAgICBpZiBzZWxmLnJ1bmFzX3VpZCBpcyBub3QgTm9uZSBhbmQgc2VsZi5y
dW5hc19naWQgaXMgbm90IE5vbmU6CisrICAgICAgICAgICAgICAgIGJpbndhbGsuY29yZS5jb21t
b24uZGVidWcoIlN3aXRjaGluZyBwcml2aWxlZ2VzIHRvICVzICglZDolZCkiICUgKHNlbGYucnVu
YXNfdXNlciwgc2VsZi5ydW5hc191aWQsIHNlbGYucnVuYXNfZ2lkKSkKKysgICAgICAgICAgICAg
ICAgb3Muc2V0Z2lkKHNlbGYucnVuYXNfdWlkKQorKyAgICAgICAgICAgICAgICBvcy5zZXR1aWQo
c2VsZi5ydW5hc19naWQpCisrCisrICAgICAgICAgICAgIyBJZiBub3QgaW4gZGVidWcgbW9kZSwg
cmVkaXJlY3Qgb3V0cHV0IHRvIC9kZXYvbnVsbAorICAgICAgICAgICAgIGlmIG5vdCBiaW53YWxr
LmNvcmUuY29tbW9uLkRFQlVHOgorLSAgICAgICAgICAgICAgICB0bXAgPSB0ZW1wZmlsZS5UZW1w
b3JhcnlGaWxlKCkKKysgICAgICAgICAgICAgICAgdG1wID0gc3VicHJvY2Vzcy5ERVZOVUxMCisg
ICAgICAgICAgICAgZWxzZToKKyAgICAgICAgICAgICAgICAgdG1wID0gTm9uZQorIAorQEAgLTk1
OCwxMCArOTU2LDYgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAgICAgICAgICAgYmlu
d2Fsay5jb3JlLmNvbW1vbi5kZWJ1Zygic3VicHJvY2Vzcy5jYWxsKCVzLCBzdGRvdXQ9JXMsIHN0
ZGVycj0lcykiICUgKGNvbW1hbmQsIHN0cih0bXApLCBzdHIodG1wKSkpCisgICAgICAgICAgICAg
cnZhbCA9IHN1YnByb2Nlc3MuY2FsbChzaGxleC5zcGxpdChjb21tYW5kKSwgc3Rkb3V0PXRtcCwg
c3RkZXJyPXRtcCkKKyAKKy0gICAgICAgICAgICAjIENsZWFuIHVwIHRlbXAgZmlsZQorLSAgICAg
ICAgICAgIGlmIHRtcCBpcyBub3QgTm9uZToKKy0gICAgICAgICAgICAgICAgdG1wLmNsb3NlKCkK
Ky0KKyAgICAgICAgICAgICBzeXMuZXhpdChydmFsKQorICAgICAgICAgZWxzZToKKyAgICAgICAg
ICAgICByZXR1cm4gb3Mud2FpdCgpWzFdCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAyOS1Jbml0aWFsLXN5bWxpbmstcmVw
YWlyLXNvbHV0aW9uLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iaW53YWxrLzAwMjktSW5pdGlhbC1zeW1saW5rLXJlcGFpci1zb2x1dGlvbi5wYXRj
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjBmMGNhMzQwNAotLS0gL2Rl
di9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Ymlud2Fsay8wMDI5LUluaXRpYWwtc3ltbGluay1yZXBhaXItc29sdXRpb24ucGF0Y2gKQEAgLTAs
MCArMSw4MiBAQAorRnJvbSA3YjVhZTQ5NDIwN2NjNmI1YWVkMzY3ZGI5OGVmNjg3MGE4ZGEyYTNm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZmbmVyQHJlZmly
bWxhYnMuY29tPgorRGF0ZTogRnJpLCAzIFNlcCAyMDIxIDA5OjUyOjMwIC0wNzAwCitTdWJqZWN0
OiBbUEFUQ0hdIEluaXRpYWwgc3ltbGluayAncmVwYWlyJyBzb2x1dGlvbgorCistLS0KKyBzcmMv
Ymlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weSB8IDUxICsrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9u
cygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkgYi9z
cmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQoraW5kZXggZGE5NmI3OC4uOTE3NTU5YiAx
MDA2NDQKKy0tLSBhL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5CisrKysgYi9zcmMv
Ymlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQorQEAgLTE3NCw4ICsxNzQsOCBAQCBjbGFzcyBF
eHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgICAgICBzZWxmLmNvbmZpZy52ZXJib3NlID0gVHJ1
ZQorIAorICAgICBkZWYgYWRkX3BlbmRpbmcoc2VsZiwgZik6CistICAgICAgICAjIElnbm9yZSBz
eW1saW5rcworLSAgICAgICAgaWYgb3MucGF0aC5pc2xpbmsoZik6CisrICAgICAgICAjIElnbm9y
ZSBzeW1saW5rcywgZG9uJ3QgYWRkIG5ldyBmaWxlcyB1bmxlc3MgcmVjdXJzaW9uIHdhcyByZXF1
ZXN0ZWQKKysgICAgICAgIGlmIG9zLnBhdGguaXNsaW5rKGYpIG9yIG5vdCBzZWxmLm1hdHJ5b3No
a2E6CisgICAgICAgICAgICAgcmV0dXJuCisgCisgICAgICAgICAjIEdldCB0aGUgZmlsZSBtb2Rl
IHRvIGNoZWNrIGFuZCBzZWUgaWYgaXQncyBhIGJsb2NrL2NoYXIgZGV2aWNlCitAQCAtMjg2LDI1
ICsyODYsMjcgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgCisgICAgICAgICAgICAgICAg
ICAgICAjIElmIHJlY3Vyc2lvbiB3YXMgc3BlY2lmaWVkLCBhbmQgdGhlIGZpbGUgaXMgbm90IHRo
ZSBzYW1lCisgICAgICAgICAgICAgICAgICAgICAjIG9uZSB3ZSBqdXN0IGRkJ2QKKy0gICAgICAg
ICAgICAgICAgICAgIGlmIChzZWxmLm1hdHJ5b3Noa2EgYW5kCistICAgICAgICAgICAgICAgICAg
ICAgICAgZmlsZV9wYXRoICE9IGRkX2ZpbGVfcGF0aCBhbmQKKy0gICAgICAgICAgICAgICAgICAg
ICAgICBzY2FuX2V4dHJhY3RlZF9maWxlcyBhbmQKKy0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2VsZi5kaXJlY3RvcnkgaW4gcmVhbF9maWxlX3BhdGgpOgorLSAgICAgICAgICAgICAgICAg
ICAgICAgICMgSWYgdGhlIHJlY3Vyc2lvbiBsZXZlbCBvZiB0aGlzIGZpbGUgaXMgbGVzcyB0aGFu
IG9yCistICAgICAgICAgICAgICAgICAgICAgICAgIyBlcXVhbCB0byBvdXIgZGVzaXJlZCByZWN1
cnNpb24gbGV2ZWwKKy0gICAgICAgICAgICAgICAgICAgICAgICBpZiBsZW4ocmVhbF9maWxlX3Bh
dGguc3BsaXQoc2VsZi5kaXJlY3RvcnkpWzFdLnNwbGl0KG9zLnBhdGguc2VwKSkgPD0gc2VsZi5t
YXRyeW9zaGthOgorLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIElmIHRoaXMgaXMgYSBk
aXJlY3RvcnkgYW5kIHdlIGFyZSBzdXBwb3NlZCB0byBwcm9jZXNzIGRpcmVjdG9yaWVzIGZvciB0
aGlzIGV4dHJhY3RvciwKKy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIyB0aGVuIGFkZCBh
bGwgZmlsZXMgdW5kZXIgdGhhdCBkaXJlY3RvcnkgdG8gdGhlCistICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICMgbGlzdCBvZiBwZW5kaW5nIGZpbGVzLgorLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiBvcy5wYXRoLmlzZGlyKGZpbGVfcGF0aCk6CistICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmb3Igcm9vdCwgZGlycywgZmlsZXMgaW4gb3Mud2FsayhmaWxlX3BhdGgp
OgorLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciBmIGluIGZpbGVzOgor
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdWxsX3BhdGggPSBvcy5w
YXRoLmpvaW4ocm9vdCwgZikKKy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2VsZi5hZGRfcGVuZGluZyhmdWxsX3BhdGgpCistICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICMgSWYgaXQncyBqdXN0IGEgZmlsZSwgaXQgdG8gdGhlIGxpc3Qgb2YgcGVuZGluZworLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjIGZpbGVzCistICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVsc2U6CistICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZWxmLmFkZF9w
ZW5kaW5nKGZpbGVfcGF0aCkKKysgICAgICAgICAgICAgICAgICAgIGlmIGZpbGVfcGF0aCAhPSBk
ZF9maWxlX3BhdGg6CisrICAgICAgICAgICAgICAgICAgICAgICAgIyBJZiB0aGlzIGlzIGEgZGly
ZWN0b3J5IGFuZCB3ZSBhcmUgc3VwcG9zZWQgdG8gcHJvY2VzcyBkaXJlY3RvcmllcyBmb3IgdGhp
cyBleHRyYWN0b3IsCisrICAgICAgICAgICAgICAgICAgICAgICAgIyB0aGVuIGFkZCBhbGwgZmls
ZXMgdW5kZXIgdGhhdCBkaXJlY3RvcnkgdG8gdGhlCisrICAgICAgICAgICAgICAgICAgICAgICAg
IyBsaXN0IG9mIHBlbmRpbmcgZmlsZXMuCisrICAgICAgICAgICAgICAgICAgICAgICAgaWYgb3Mu
cGF0aC5pc2RpcihmaWxlX3BhdGgpOgorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb3Ig
cm9vdCwgZGlycywgZmlsZXMgaW4gb3Mud2FsayhmaWxlX3BhdGgpOgorKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZm9yIGYgaW4gZmlsZXM6CisrICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZnVsbF9wYXRoID0gb3MucGF0aC5qb2luKHJvb3QsIGYpCisrICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCisrICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgb3MucGF0aC5pc2xpbmsoZnVsbF9wYXRoKToKKysgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5zeW1saW5rX3JlcGFpcihmdWxsX3BhdGgp
CisrCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBJZiB0aGUgcmVjdXJz
aW9uIGxldmVsIG9mIHRoaXMgZmlsZSBpcyBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gb3VyIGRlc2ly
ZWQgcmVjdXJzaW9uIGxldmVsCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgbGVuKHJlYWxfZmlsZV9wYXRoLnNwbGl0KHNlbGYuZGlyZWN0b3J5KVsxXS5zcGxpdChvcy5w
YXRoLnNlcCkpIDw9IHNlbGYubWF0cnlvc2hrYToKKysgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgc2Nhbl9leHRyYWN0ZWRfZmlsZXMgYW5kIHNlbGYuZGlyZWN0b3J5
IGluIHJlYWxfZmlsZV9wYXRoOgorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNlbGYuYWRkX3BlbmRpbmcoZnVsbF9wYXRoKQorKworKyAgICAgICAgICAg
ICAgICAgICAgICAgICMgSWYgaXQncyBqdXN0IGEgZmlsZSwgaXQgdG8gdGhlIGxpc3Qgb2YgcGVu
ZGluZworKyAgICAgICAgICAgICAgICAgICAgICAgICMgZmlsZXMKKysgICAgICAgICAgICAgICAg
ICAgICAgICBlbGlmIHNjYW5fZXh0cmFjdGVkX2ZpbGVzIGFuZCBzZWxmLmRpcmVjdG9yeSBpbiBy
ZWFsX2ZpbGVfcGF0aDoKKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5hZGRfcGVu
ZGluZyhmaWxlX3BhdGgpCisgCisgICAgICAgICAgICAgICAgICMgVXBkYXRlIHRoZSBsYXN0IGRp
cmVjdG9yeSBsaXN0aW5nIGZvciB0aGUgbmV4dCB0aW1lIHdlCisgICAgICAgICAgICAgICAgICMg
ZXh0cmFjdCBhIGZpbGUgdG8gdGhpcyBzYW1lIG91dHB1dCBkaXJlY3RvcnkKK0BAIC05NTksMyAr
OTYxLDEwIEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAgICAgIHN5cy5leGl0
KHJ2YWwpCisgICAgICAgICBlbHNlOgorICAgICAgICAgICAgIHJldHVybiBvcy53YWl0KClbMV0K
KysKKysgICAgZGVmIHN5bWxpbmtfcmVwYWlyKHNlbGYsIHN5bWxpbmspOgorKyAgICAgICAgbGlu
a3RhcmdldCA9IG9zLnBhdGgucmVhbHBhdGgoc3ltbGluaykKKysgICAgICAgIGlmIG5vdCBsaW5r
dGFyZ2V0LnN0YXJ0c3dpdGgoc2VsZi5kaXJlY3RvcnkpOgorKyAgICAgICAgICAgIG9zLnJlbW92
ZShzeW1saW5rKQorKyAgICAgICAgICAgIG9zLnN5bWxpbmsob3MuZGV2bnVsbCwgc3ltbGluaykK
KysgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLndhcm5pbmcoIlN5bWxpbmsgcG9pbnRz
IG91dHNpZGUgb2YgdGhlIGV4dHJhY3Rpb24gZGlyZWN0b3J5OiAlcyAtPiAlcyIgJSAoc3ltbGlu
aywgbGlua3RhcmdldCkpCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzMC1BZGRlZC1jb2RlLWNvbW1lbnRzLWFuZC1iZXR0
ZXItZXJyb3Itb3V0cHV0LWZvci1lbmQtLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzAtQWRkZWQtY29kZS1jb21tZW50cy1hbmQt
YmV0dGVyLWVycm9yLW91dHB1dC1mb3ItZW5kLS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAuLjJlNjAzMDg2ZAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDMwLUFkZGVkLWNvZGUt
Y29tbWVudHMtYW5kLWJldHRlci1lcnJvci1vdXRwdXQtZm9yLWVuZC0ucGF0Y2gKQEAgLTAsMCAr
MSw2MSBAQAorRnJvbSBiYWUwOTY4ZDcxY2VjYzlmMGI5YmNiM2Q5ZDVjNjhkNDZmODE2Y2E1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZmbmVyQHJlZmlybWxh
YnMuY29tPgorRGF0ZTogU3VuLCA1IFNlcCAyMDIxIDA2OjU0OjMzIC0wNzAwCitTdWJqZWN0OiBb
UEFUQ0hdIEFkZGVkIGNvZGUgY29tbWVudHMgYW5kIGJldHRlciBlcnJvciBvdXRwdXQgZm9yIGVu
ZCB1c2VyCisKKy0tLQorIHNyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5IHwgMjIgKysr
KysrKysrKysrKysrKy0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0
b3IucHkgYi9zcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQoraW5kZXggOTE3NTU5Yi4u
OTYyYWQzMiAxMDA2NDQKKy0tLSBhL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5Cisr
KysgYi9zcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQorQEAgLTEzNywxNiArMTM3LDI2
IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorIAorICAgICAgICAgaWYgc2VsZi5lbmFibGVk
IGlzIFRydWU6CisgICAgICAgICAgICAgaWYgc2VsZi5ydW5hc191c2VyIGlzIE5vbmU6CistICAg
ICAgICAgICAgICAgIGlmIG9zLmdldHVpZCgpID09IDA6CistICAgICAgICAgICAgICAgICAgICBy
YWlzZSBNb2R1bGVFeGNlcHRpb24oIkJpbndhbGsgZXh0cmFjdGlvbiB1c2VzIG1hbnkgdGhpcmQg
cGFydHkgdXRpbGl0aWVzLCB3aGljaCBtYXkgbm90IGJlIHNlY3VyZS5cbklmIHlvdSB3aXNoIHRv
IGhhdmUgZXh0cmFjdGlvbiB1dGlsaXRpZXMgZXhlY3V0ZWQgYXMgdGhlIGN1cnJlbnQgdXNlciwg
dXNlIC0tcnVuLWFzPTx1c2VyIG5hbWU+LiIpCisrICAgICAgICAgICAgICAgICMgR2V0IHNvbWUg
aW5mbyBhYm91dCB0aGUgY3VycmVudCB1c2VyIHdlJ3JlIHJ1bm5pbmcgdW5kZXIKKysgICAgICAg
ICAgICAgICAgdXNlcl9pbmZvID0gcHdkLmdldHB3dWlkKG9zLmdldHVpZCgpKQorKworKyAgICAg
ICAgICAgICAgICAjIERvbid0IHJ1biBhcyByb290LCB1bmxlc3MgZXhwbGljaXRseSBpbnN0cnVj
dGVkIHRvCisrICAgICAgICAgICAgICAgIGlmIHVzZXJfaW5mby5wd191aWQgPT0gMDoKKysgICAg
ICAgICAgICAgICAgICAgIHJhaXNlIE1vZHVsZUV4Y2VwdGlvbigiQmlud2FsayBleHRyYWN0aW9u
IHVzZXMgbWFueSB0aGlyZCBwYXJ0eSB1dGlsaXRpZXMsIHdoaWNoIG1heSBub3QgYmUgc2VjdXJl
LlxuSWYgeW91IHdpc2ggdG8gaGF2ZSBleHRyYWN0aW9uIHV0aWxpdGllcyBleGVjdXRlZCBhcyB0
aGUgY3VycmVudCB1c2VyLCB1c2UgLS1ydW4tYXM9JXMgKGJpbndhbGsgaXRzZWxmIG11c3QgYmUg
cnVuIGFzIHJvb3QpLiIgJSB1c2VyX2luZm8ucHdfbmFtZSkKKyAgICAgICAgICAgICAKKy0gICAg
ICAgICAgICAgICAgc2VsZi5ydW5hc191aWQgPSBvcy5nZXR1aWQoKQorLSAgICAgICAgICAgICAg
ICBzZWxmLnJ1bmFzX2dpZCA9IG9zLmdldGdpZCgpCisrICAgICAgICAgICAgICAgICMgUnVuIGV4
dGVybmFsIGFwcGxpY2F0aW9ucyBhcyB0aGUgY3VycmVudCB1c2VyIAorKyAgICAgICAgICAgICAg
ICBzZWxmLnJ1bmFzX3VpZCA9IHVzZXJfaW5mby5wd191aWQKKysgICAgICAgICAgICAgICAgc2Vs
Zi5ydW5hc19naWQgPSB1c2VyX2luZm8ucHdfZ2lkCisgICAgICAgICAgICAgZWxzZToKKysgICAg
ICAgICAgICAgICAgIyBSdW4gZXh0ZXJuYWwgYXBwbGljYXRpb25zIGFzIHRoZSBzcGVjaWZpZWQg
dXNlcgorICAgICAgICAgICAgICAgICB1c2VyX2luZm8gPSBwd2QuZ2V0cHduYW0oc2VsZi5ydW5h
c191c2VyKQorICAgICAgICAgICAgICAgICBzZWxmLnJ1bmFzX3VpZCA9IHVzZXJfaW5mby5wd191
aWQKKyAgICAgICAgICAgICAgICAgc2VsZi5ydW5hc19naWQgPSB1c2VyX2luZm8ucHdfZ2lkCisg
CisrICAgICAgICAgICAgICAgICMgTWFrZSBzdXJlIHdlJ2xsIGhhdmUgcGVybWlzc2lvbnMgdG8g
c3dpdGNoIHRvIHRoZSBkaWZmZXJlbnQgdXNlcgorKyAgICAgICAgICAgICAgICBpZiBzZWxmLnJ1
bmFzX3VpZCAhPSBvcy5nZXR1aWQoKSBhbmQgb3MuZ2V0dWlkKCkgIT0gMDoKKysgICAgICAgICAg
ICAgICAgICAgIHJhaXNlIE1vZHVsZUV4Y2VwdGlvbigiSW4gb3JkZXIgdG8gZXhlY3V0ZSB0aGly
ZCBwYXJ0eSBhcHBsaWNhdGlvbnMgYXMgJXMsIGJpbndhbGsgbXVzdCBiZSBydW4gd2l0aCByb290
IHByaXZpbGVnZXMuIiAlIHNlbGYucnVuYXNfdXNlcikKKysKKyAgICAgICAgICMgSG9sZHMgYSBs
aXN0IG9mIGV4dHJhY3Rpb24gcnVsZXMgbG9hZGVkIGVpdGhlciBmcm9tIGEgZmlsZSBvciB3aGVu
CisgICAgICAgICAjIG1hbnVhbGx5IHNwZWNpZmllZC4KKyAgICAgICAgIHNlbGYuZXh0cmFjdF9y
dWxlcyA9IFtdCitAQCAtODU4LDcgKzg2OCw3IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgor
ICAgICAgICAgICAgIGZkb3V0LmNsb3NlKCkKKyAgICAgICAgICAgICBmZGluLmNsb3NlKCkKKyAK
Ky0gICAgICAgICAgICAjIE1ha2Ugc3VyZSBydW5hc2lsZWdlZCB1c2VyIGNhbiBhY2Nlc3MgdGhp
cyBmaWxlCisrICAgICAgICAgICAgIyBNYWtlIHN1cmUgcnVuLWFzIHVzZXIgY2FuIGFjY2VzcyB0
aGlzIGZpbGUKKyAgICAgICAgICAgICBvcy5jaG93bihmbmFtZSwgc2VsZi5ydW5hc191aWQsIHNl
bGYucnVuYXNfZ2lkKQorICAgICAgICAgZXhjZXB0IEtleWJvYXJkSW50ZXJydXB0IGFzIGU6Cisg
ICAgICAgICAgICAgcmFpc2UgZQorQEAgLTk2NSw2ICs5NzUsNiBAQCBjbGFzcyBFeHRyYWN0b3Io
TW9kdWxlKToKKyAgICAgZGVmIHN5bWxpbmtfcmVwYWlyKHNlbGYsIHN5bWxpbmspOgorICAgICAg
ICAgbGlua3RhcmdldCA9IG9zLnBhdGgucmVhbHBhdGgoc3ltbGluaykKKyAgICAgICAgIGlmIG5v
dCBsaW5rdGFyZ2V0LnN0YXJ0c3dpdGgoc2VsZi5kaXJlY3RvcnkpOgorKyAgICAgICAgICAgIGJp
bndhbGsuY29yZS5jb21tb24ud2FybmluZygiU3ltbGluayBwb2ludHMgb3V0c2lkZSBvZiB0aGUg
ZXh0cmFjdGlvbiBkaXJlY3Rvcnk6ICVzIC0+ICVzOyBmb3Igc2VjdXJpdHksIGNoYW5naW5nIGxp
bmsgdGFyZ2V0IHRvICVzLiIgJSAoc3ltbGluaywgbGlua3RhcmdldCwgb3MuZGV2bnVsbCkpCisg
ICAgICAgICAgICAgb3MucmVtb3ZlKHN5bWxpbmspCisgICAgICAgICAgICAgb3Muc3ltbGluayhv
cy5kZXZudWxsLCBzeW1saW5rKQorLSAgICAgICAgICAgIGJpbndhbGsuY29yZS5jb21tb24ud2Fy
bmluZygiU3ltbGluayBwb2ludHMgb3V0c2lkZSBvZiB0aGUgZXh0cmFjdGlvbiBkaXJlY3Rvcnk6
ICVzIC0+ICVzIiAlIChzeW1saW5rLCBsaW5rdGFyZ2V0KSkKZGlmZiAtLWdpdCBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDMxLUJ1Zy1maXhl
cy1jb2RlLXRlc3RpbmcucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJpbndhbGsvMDAzMS1CdWctZml4ZXMtY29kZS10ZXN0aW5nLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYjIzODIwZDg2Ci0tLSAvZGV2L251bGwK
KysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxr
LzAwMzEtQnVnLWZpeGVzLWNvZGUtdGVzdGluZy5wYXRjaApAQCAtMCwwICsxLDcwIEBACitGcm9t
IGZlZWU2YmQ2ZmI2NzZhNDNiNGE5NzE0MjE0MTBlMjZmYWVkZTFiNTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBkZXZ0dHlzMCA8Y2hlZmZuZXJAcmVmaXJtbGFicy5jb20+CitEYXRl
OiBTdW4sIDUgU2VwIDIwMjEgMDc6NDQ6MTYgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gQnVnIGZp
eGVzLCBjb2RlIHRlc3RpbmcKKworLS0tCisgc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3Iu
cHkgfCAzMiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy9i
aW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5IGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0
b3IucHkKK2luZGV4IDk2MmFkMzIuLjhiM2U2MjIgMTAwNjQ0CistLS0gYS9zcmMvYmlud2Fsay9t
b2R1bGVzL2V4dHJhY3Rvci5weQorKysrIGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3Iu
cHkKK0BAIC0xNDIsNyArMTQyLDcgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgCisgICAg
ICAgICAgICAgICAgICMgRG9uJ3QgcnVuIGFzIHJvb3QsIHVubGVzcyBleHBsaWNpdGx5IGluc3Ry
dWN0ZWQgdG8KKyAgICAgICAgICAgICAgICAgaWYgdXNlcl9pbmZvLnB3X3VpZCA9PSAwOgorLSAg
ICAgICAgICAgICAgICAgICAgcmFpc2UgTW9kdWxlRXhjZXB0aW9uKCJCaW53YWxrIGV4dHJhY3Rp
b24gdXNlcyBtYW55IHRoaXJkIHBhcnR5IHV0aWxpdGllcywgd2hpY2ggbWF5IG5vdCBiZSBzZWN1
cmUuXG5JZiB5b3Ugd2lzaCB0byBoYXZlIGV4dHJhY3Rpb24gdXRpbGl0aWVzIGV4ZWN1dGVkIGFz
IHRoZSBjdXJyZW50IHVzZXIsIHVzZSAtLXJ1bi1hcz0lcyAoYmlud2FsayBpdHNlbGYgbXVzdCBi
ZSBydW4gYXMgcm9vdCkuIiAlIHVzZXJfaW5mby5wd19uYW1lKQorKyAgICAgICAgICAgICAgICAg
ICAgcmFpc2UgTW9kdWxlRXhjZXB0aW9uKCJCaW53YWxrIGV4dHJhY3Rpb24gdXNlcyBtYW55IHRo
aXJkIHBhcnR5IHV0aWxpdGllcywgd2hpY2ggbWF5IG5vdCBiZSBzZWN1cmUuIElmIHlvdSB3aXNo
IHRvIGhhdmUgZXh0cmFjdGlvbiB1dGlsaXRpZXMgZXhlY3V0ZWQgYXMgdGhlIGN1cnJlbnQgdXNl
ciwgdXNlICctLXJ1bi1hcz0lcycgKGJpbndhbGsgaXRzZWxmIG11c3QgYmUgcnVuIGFzIHJvb3Qp
LiIgJSB1c2VyX2luZm8ucHdfbmFtZSkKKyAgICAgICAgICAgICAKKyAgICAgICAgICAgICAgICAg
IyBSdW4gZXh0ZXJuYWwgYXBwbGljYXRpb25zIGFzIHRoZSBjdXJyZW50IHVzZXIgCisgICAgICAg
ICAgICAgICAgIHNlbGYucnVuYXNfdWlkID0gdXNlcl9pbmZvLnB3X3VpZAorQEAgLTI5NywxNiAr
Mjk3LDE5IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAgICAgICAgICAgICAg
IyBJZiByZWN1cnNpb24gd2FzIHNwZWNpZmllZCwgYW5kIHRoZSBmaWxlIGlzIG5vdCB0aGUgc2Ft
ZQorICAgICAgICAgICAgICAgICAgICAgIyBvbmUgd2UganVzdCBkZCdkCisgICAgICAgICAgICAg
ICAgICAgICBpZiBmaWxlX3BhdGggIT0gZGRfZmlsZV9wYXRoOgorKyAgICAgICAgICAgICAgICAg
ICAgICAgICMgU3ltbGlua3MgY2FuIGNhdXNlIHNlY3VyaXR5IGlzc3VlcyBpZiB0aGV5IHBvaW50
IG91dHNpZGUgdGhlIGV4dHJhY3Rpb24gZGlyZWN0b3J5LgorKyAgICAgICAgICAgICAgICAgICAg
ICAgIHNlbGYuc3ltbGlua19zYW5pdGl6ZXIoZmlsZV9wYXRoKQorKworICAgICAgICAgICAgICAg
ICAgICAgICAgICMgSWYgdGhpcyBpcyBhIGRpcmVjdG9yeSBhbmQgd2UgYXJlIHN1cHBvc2VkIHRv
IHByb2Nlc3MgZGlyZWN0b3JpZXMgZm9yIHRoaXMgZXh0cmFjdG9yLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICMgdGhlbiBhZGQgYWxsIGZpbGVzIHVuZGVyIHRoYXQgZGlyZWN0b3J5IHRvIHRo
ZQorICAgICAgICAgICAgICAgICAgICAgICAgICMgbGlzdCBvZiBwZW5kaW5nIGZpbGVzLgorICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNkaXIoZmlsZV9wYXRoKToKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZm9yIHJvb3QsIGRpcnMsIGZpbGVzIGluIG9zLndhbGso
ZmlsZV9wYXRoKToKKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgU3ltbGlua3Mg
Y2FuIGNhdXNlIHNlY3VyaXR5IGlzc3VlcyBpZiB0aGV5IHBvaW50IG91dHNpZGUgdGhlIGV4dHJh
Y3Rpb24gZGlyZWN0b3J5LgorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5z
eW1saW5rX3Nhbml0aXplcihbb3MucGF0aC5qb2luKHJvb3QsIHgpIGZvciB4IGluIGRpcnMrZmls
ZXNdKQorKworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9yIGYgaW4gZmlsZXM6
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVsbF9wYXRoID0gb3MucGF0
aC5qb2luKHJvb3QsIGYpCistICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCist
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgb3MucGF0aC5pc2xpbmsoZnVs
bF9wYXRoKToKKy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5z
eW1saW5rX3JlcGFpcihmdWxsX3BhdGgpCisgCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIyBJZiB0aGUgcmVjdXJzaW9uIGxldmVsIG9mIHRoaXMgZmlsZSBpcyBsZXNzIHRo
YW4gb3IgZXF1YWwgdG8gb3VyIGRlc2lyZWQgcmVjdXJzaW9uIGxldmVsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgbGVuKHJlYWxfZmlsZV9wYXRoLnNwbGl0KHNlbGYu
ZGlyZWN0b3J5KVsxXS5zcGxpdChvcy5wYXRoLnNlcCkpIDw9IHNlbGYubWF0cnlvc2hrYToKK0BA
IC05NzIsOSArOTc1LDE4IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAgICAgZWxz
ZToKKyAgICAgICAgICAgICByZXR1cm4gb3Mud2FpdCgpWzFdCisgCistICAgIGRlZiBzeW1saW5r
X3JlcGFpcihzZWxmLCBzeW1saW5rKToKKy0gICAgICAgIGxpbmt0YXJnZXQgPSBvcy5wYXRoLnJl
YWxwYXRoKHN5bWxpbmspCistICAgICAgICBpZiBub3QgbGlua3RhcmdldC5zdGFydHN3aXRoKHNl
bGYuZGlyZWN0b3J5KToKKy0gICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLndhcm5pbmco
IlN5bWxpbmsgcG9pbnRzIG91dHNpZGUgb2YgdGhlIGV4dHJhY3Rpb24gZGlyZWN0b3J5OiAlcyAt
PiAlczsgZm9yIHNlY3VyaXR5LCBjaGFuZ2luZyBsaW5rIHRhcmdldCB0byAlcy4iICUgKHN5bWxp
bmssIGxpbmt0YXJnZXQsIG9zLmRldm51bGwpKQorLSAgICAgICAgICAgIG9zLnJlbW92ZShzeW1s
aW5rKQorLSAgICAgICAgICAgIG9zLnN5bWxpbmsob3MuZGV2bnVsbCwgc3ltbGluaykKKysgICAg
ZGVmIHN5bWxpbmtfc2FuaXRpemVyKHNlbGYsIGZpbGVfbGlzdCk6CisrICAgICAgICAjIEFsbG93
cyBlaXRoZXIgYSBzaW5nbGUgZmlsZSBwYXRoLCBvciBhIGxpc3Qgb2YgZmlsZSBwYXRocyB0byBi
ZSBwYXNzZWQgaW4gZm9yIHNhbml0aXphdGlvbi4KKysgICAgICAgIGlmIHR5cGUoZmlsZV9saXN0
KSBpcyBub3QgbGlzdDoKKysgICAgICAgICAgICBmaWxlX2xpc3QgPSBbZmlsZV9saXN0XQorKyAg
ICAgICAgCisrICAgICAgICAjIFNhbml0aXplIGFueSBmaWxlcyBpbiB0aGUgbGlzdCB0aGF0IGFy
ZSBzeW1saW5rcyBvdXRzaWRlIG9mIHRoZSBzZWxmLmRpcmVjdG9yeSBleHRyYWN0aW9uIGRpcmVj
dG9yeS4KKysgICAgICAgIGZvciBmaWxlX25hbWUgaW4gZmlsZV9saXN0OgorKyAgICAgICAgICAg
IGlmIG9zLnBhdGguaXNsaW5rKGZpbGVfbmFtZSk6CisrICAgICAgICAgICAgICAgIGxpbmt0YXJn
ZXQgPSBvcy5wYXRoLnJlYWxwYXRoKGZpbGVfbmFtZSkKKysgICAgICAgICAgICAgICAgYmlud2Fs
ay5jb3JlLmNvbW1vbi5kZWJ1ZygiQW5hbHlzaW5nIHN5bWxpbms6ICVzIC0+ICVzIiAlIChmaWxl
X25hbWUsIGxpbmt0YXJnZXQpKQorKworKyAgICAgICAgICAgICAgICBpZiBub3QgbGlua3Rhcmdl
dC5zdGFydHN3aXRoKHNlbGYuZGlyZWN0b3J5KSBhbmQgbGlua3RhcmdldCAhPSBvcy5kZXZudWxs
OgorKyAgICAgICAgICAgICAgICAgICAgYmlud2Fsay5jb3JlLmNvbW1vbi53YXJuaW5nKCJTeW1s
aW5rIHBvaW50cyBvdXRzaWRlIG9mIHRoZSBleHRyYWN0aW9uIGRpcmVjdG9yeTogJXMgLT4gJXM7
IGNoYW5naW5nIGxpbmsgdGFyZ2V0IHRvICVzIGZvciBzZWN1cml0eSBwdXJwb3Nlcy4iICUgKGZp
bGVfbmFtZSwgbGlua3RhcmdldCwgb3MuZGV2bnVsbCkpCisrICAgICAgICAgICAgICAgICAgICBv
cy5yZW1vdmUoZmlsZV9uYW1lKQorKyAgICAgICAgICAgICAgICAgICAgb3Muc3ltbGluayhvcy5k
ZXZudWxsLCBmaWxlX25hbWUpCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzMi1Db2RlLWNsZWFudXAucGF0Y2ggYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzMi1Db2Rl
LWNsZWFudXAucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi43OWNh
ZDFjMDUKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJpbndhbGsvMDAzMi1Db2RlLWNsZWFudXAucGF0Y2gKQEAgLTAsMCArMSw3
MSBAQAorRnJvbSA2YzA0NTk5N2ViNDc1YzVjY2NlOWY4NDQ1YTA5YjkxMjE3MTIyODM2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZmbmVyQHJlZmlybWxhYnMu
Y29tPgorRGF0ZTogU3VuLCA1IFNlcCAyMDIxIDA4OjIwOjU1IC0wNzAwCitTdWJqZWN0OiBbUEFU
Q0hdIENvZGUgY2xlYW51cAorCistLS0KKyBzcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5w
eSB8IDE2ICsrKysrKy0tLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0
cmFjdG9yLnB5IGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkKK2luZGV4IDhiM2U2
MjIuLjk3MTc0ZWIgMTAwNjQ0CistLS0gYS9zcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5w
eQorKysrIGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkKK0BAIC00OSw5ICs0OSw2
IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAgICAjIHNxdWFzaGZzLXJvb3QtMCkuCisg
ICAgIFVOSVFVRV9QQVRIX0RFTElNSVRFUiA9ICclJScKKyAKKy0gICAgIyBVbnByaXZpbGVnZWQg
dXNlciBhY2NvdW50IHRvIGV4ZWN1dGUgZXh0ZXJuYWwgZXh0cmFjdGlvbiB1dGlsaXRpZXMKKy0g
ICAgVU5QUklWSUxFR0VEX1VTRVJfTkFNRSA9ICdiaW53YWxrX3NhZmVfdXNlcl82OScKKy0KKyAg
ICAgVElUTEUgPSAnRXh0cmFjdGlvbicKKyAgICAgT1JERVIgPSA5CisgICAgIFBSSU1BUlkgPSBG
YWxzZQorQEAgLTE0Myw4ICsxNDAsOCBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAg
ICAgICAgICAgICAgIyBEb24ndCBydW4gYXMgcm9vdCwgdW5sZXNzIGV4cGxpY2l0bHkgaW5zdHJ1
Y3RlZCB0bworICAgICAgICAgICAgICAgICBpZiB1c2VyX2luZm8ucHdfdWlkID09IDA6CisgICAg
ICAgICAgICAgICAgICAgICByYWlzZSBNb2R1bGVFeGNlcHRpb24oIkJpbndhbGsgZXh0cmFjdGlv
biB1c2VzIG1hbnkgdGhpcmQgcGFydHkgdXRpbGl0aWVzLCB3aGljaCBtYXkgbm90IGJlIHNlY3Vy
ZS4gSWYgeW91IHdpc2ggdG8gaGF2ZSBleHRyYWN0aW9uIHV0aWxpdGllcyBleGVjdXRlZCBhcyB0
aGUgY3VycmVudCB1c2VyLCB1c2UgJy0tcnVuLWFzPSVzJyAoYmlud2FsayBpdHNlbGYgbXVzdCBi
ZSBydW4gYXMgcm9vdCkuIiAlIHVzZXJfaW5mby5wd19uYW1lKQorLSAgICAgICAgICAgIAorLSAg
ICAgICAgICAgICAgICAjIFJ1biBleHRlcm5hbCBhcHBsaWNhdGlvbnMgYXMgdGhlIGN1cnJlbnQg
dXNlciAKKysKKysgICAgICAgICAgICAgICAgIyBSdW4gZXh0ZXJuYWwgYXBwbGljYXRpb25zIGFz
IHRoZSBjdXJyZW50IHVzZXIKKyAgICAgICAgICAgICAgICAgc2VsZi5ydW5hc191aWQgPSB1c2Vy
X2luZm8ucHdfdWlkCisgICAgICAgICAgICAgICAgIHNlbGYucnVuYXNfZ2lkID0gdXNlcl9pbmZv
LnB3X2dpZAorICAgICAgICAgICAgIGVsc2U6CitAQCAtMzIzLDggKzMyMCw3IEBAIGNsYXNzIEV4
dHJhY3RvcihNb2R1bGUpOgorIAorICAgICAgICAgICAgICAgICAjIFVwZGF0ZSB0aGUgbGFzdCBk
aXJlY3RvcnkgbGlzdGluZyBmb3IgdGhlIG5leHQgdGltZSB3ZQorICAgICAgICAgICAgICAgICAj
IGV4dHJhY3QgYSBmaWxlIHRvIHRoaXMgc2FtZSBvdXRwdXQgZGlyZWN0b3J5CistICAgICAgICAg
ICAgICAgIHNlbGYubGFzdF9kaXJlY3RvcnlfbGlzdGluZ1sKKy0gICAgICAgICAgICAgICAgICAg
IGV4dHJhY3Rpb25fZGlyZWN0b3J5XSA9IGRpcmVjdG9yeV9saXN0aW5nCisrICAgICAgICAgICAg
ICAgIHNlbGYubGFzdF9kaXJlY3RvcnlfbGlzdGluZ1tleHRyYWN0aW9uX2RpcmVjdG9yeV0gPSBk
aXJlY3RvcnlfbGlzdGluZworIAorICAgICBkZWYgYXBwZW5kX3J1bGUoc2VsZiwgcik6CisgICAg
ICAgICBzZWxmLmV4dHJhY3RfcnVsZXMuYXBwZW5kKHIuY29weSgpKQorQEAgLTU3NSw3ICs1NzEs
NyBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgIGVsc2U6CisgICAgICAgICAg
ICAgb3V0cHV0X2RpcmVjdG9yeSA9IHNlbGYuZXh0cmFjdGlvbl9kaXJlY3Rvcmllc1twYXRoXQor
IAorLSAgICAgICAgIyBNYWtlIHN1cmUgcnVuYXMgdXNlciBjYW4gYWNjZXNzIHRoaXMgZGlyZWN0
b3J5CisrICAgICAgICAjIE1ha2Ugc3VyZSBydW4tYXMgdXNlciBjYW4gYWNjZXNzIHRoaXMgZGly
ZWN0b3J5CisgICAgICAgICBvcy5jaG93bihvdXRwdXRfZGlyZWN0b3J5LCBzZWxmLnJ1bmFzX3Vp
ZCwgc2VsZi5ydW5hc19naWQpCisgCisgICAgICAgICByZXR1cm4gb3V0cHV0X2RpcmVjdG9yeQor
QEAgLTkyNyw3ICs5MjMsNyBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAKKyAgICAgICAg
ICAgICAgICAgICAgICMgRXhlY3V0ZSBleHRlcm5hbCBleHRyYWN0b3IKKyAgICAgICAgICAgICAg
ICAgICAgIHJ2YWwgPSBzZWxmLnNoZWxsX2NhbGwoY29tbWFuZCkKKy0gICAgICAgICAgICAgICAg
ICAgIAorKworICAgICAgICAgICAgICAgICAgICAgIyBDaGVjayB0aGUgcmV0dXJuIHZhbHVlIHRv
IHNlZSBpZiBleHRyYWN0aW9uIHdhcyBzdWNjZXNzZnVsIG9yIG5vdAorICAgICAgICAgICAgICAg
ICAgICAgaWYgcnZhbCBpbiBjb2RlczoKKyAgICAgICAgICAgICAgICAgICAgICAgICByZXR2YWwg
PSBUcnVlCitAQCAtOTc5LDcgKzk3NSw3IEBAIGNsYXNzIEV4dHJhY3RvcihNb2R1bGUpOgorICAg
ICAgICAgIyBBbGxvd3MgZWl0aGVyIGEgc2luZ2xlIGZpbGUgcGF0aCwgb3IgYSBsaXN0IG9mIGZp
bGUgcGF0aHMgdG8gYmUgcGFzc2VkIGluIGZvciBzYW5pdGl6YXRpb24uCisgICAgICAgICBpZiB0
eXBlKGZpbGVfbGlzdCkgaXMgbm90IGxpc3Q6CisgICAgICAgICAgICAgZmlsZV9saXN0ID0gW2Zp
bGVfbGlzdF0KKy0gICAgICAgIAorKworICAgICAgICAgIyBTYW5pdGl6ZSBhbnkgZmlsZXMgaW4g
dGhlIGxpc3QgdGhhdCBhcmUgc3ltbGlua3Mgb3V0c2lkZSBvZiB0aGUgc2VsZi5kaXJlY3Rvcnkg
ZXh0cmFjdGlvbiBkaXJlY3RvcnkuCisgICAgICAgICBmb3IgZmlsZV9uYW1lIGluIGZpbGVfbGlz
dDoKKyAgICAgICAgICAgICBpZiBvcy5wYXRoLmlzbGluayhmaWxlX25hbWUpOgpkaWZmIC0tZ2l0
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAw
MzMtQWRkZWQtZGlyZWN0b3J5LXRyYXZlcnNhbC10ZXN0LWZpeGVkLXppcC10ZXN0LnBhdGNoIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzMt
QWRkZWQtZGlyZWN0b3J5LXRyYXZlcnNhbC10ZXN0LWZpeGVkLXppcC10ZXN0LnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uODA1Y2E5MTI1Ci0tLSAvZGV2L251bGwK
KysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxr
LzAwMzMtQWRkZWQtZGlyZWN0b3J5LXRyYXZlcnNhbC10ZXN0LWZpeGVkLXppcC10ZXN0LnBhdGNo
CkBAIC0wLDAgKzEsMjU3OSBAQAorRnJvbSA2ODVlMGM2ZDk5ZWY3ZjM3MDczNWEyNDkyM2Q4MDAw
ODhiNjZmYWRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZm
bmVyQHJlZmlybWxhYnMuY29tPgorRGF0ZTogU3VuLCA1IFNlcCAyMDIxIDA4OjQzOjE5IC0wNzAw
CitTdWJqZWN0OiBbUEFUQ0hdIEFkZGVkIGRpcmVjdG9yeSB0cmF2ZXJzYWwgdGVzdDsgZml4ZWQg
emlwIHRlc3QuCisKKy0tLQorIHRlc3RpbmcvdGVzdHMvaW5wdXQtdmVjdG9ycy9kaXJ0cmF2ZXJz
YWwudGFyIHwgQmluIDAgLT4gMjc2NDgwIGJ5dGVzCisgdGVzdGluZy90ZXN0cy90ZXN0X2RpcnRy
YXZlcnNhbC5weSAgICAgICAgICAgfCAgMzEgKysrKysrKysrKysrKysrKysrKworIHRlc3Rpbmcv
dGVzdHMvdGVzdF9maXJtd2FyZV96aXAucHkgICAgICAgICAgIHwgICAyIC0tCisgMyBmaWxlcyBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0ZXN0aW5nL3Rlc3RzL2lucHV0LXZlY3RvcnMvZGlydHJhdmVyc2FsLnRhcgorIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0aW5nL3Rlc3RzL3Rlc3RfZGlydHJhdmVyc2FsLnB5CisKK2RpZmYg
LS1naXQgYS90ZXN0aW5nL3Rlc3RzL2lucHV0LXZlY3RvcnMvZGlydHJhdmVyc2FsLnRhciBiL3Rl
c3RpbmcvdGVzdHMvaW5wdXQtdmVjdG9ycy9kaXJ0cmF2ZXJzYWwudGFyCituZXcgZmlsZSBtb2Rl
IDEwMDY0NAoraW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4u
NmIyYzMwNmRmZjdiZWVkZTNkZDNjMGZiMTA1ZWI0OGY3ZDIyNWE2NgorR0lUIGJpbmFyeSBwYXRj
aAorbGl0ZXJhbCAyNzY0ODAKK3pjbWQ/UzMzd0QkX0JMSn1RV307fVFIY3szRy0lTUVBXyk+bmd3
e2xZUjxPfTFwZVNtOWtOXnJ2T3U3TFRySj1odQorelchVn1STXMhQF9qPnstKzJzbEUqbDdNVCg0
YUZzSFNZLXNGSTFvX0R8OXgqJkNxPDNAbzhOcmpHdGN2WHAwOCZ9Cit6LVNnaDwrO2gpOF91UXEq
WDtaN0V8TW84bnpZIXh3Tk8pd0Ekak5kKDhPNUtKSnY9KSoybWl+PzhZWDNCWE85PioKK3pMUHtT
dHc5SD5Sdn0kVGkmQWpSVkg2ODtzeztBZEo9fkNJO3ZqNEc7ZTs1QmhYOCErZ1dPLSVmZjFOcFlA
Yyp2PQoremhtU2EmYGpNUz1gc3VeYXxFSFpjNiN4SjReN3NGRXxJZT1aP34wZURpfmk1YWFnT18j
OW12V1dvfFE5ZmM9ITB2Cit6JTAzPEdNJno4MUB0XmhJWEhBbStBTWdLI1Z8P2MoY3N5Tl8/amZC
ZWt0JntLTEhUd31lVUFoP0J1VipGdUdBQk0KK3pgJUF9MmhYOXJGRlctKUpLUmZLQVc2dlp6VEBP
NEhAaHtnZCo4U3tucjs5eWY5UC1LZjt7QTs2Uj82NUBsRn4mfAorenFVNSFHbWxmWj5Zb05lbSYt
c1Q3UW1QdGNKIUFSRTlgb2h5eEFOdWd4QU1pRmxGZmhZOEVZVGcjKHh2K2M9eGpxCit6YXMwKWVP
dl8qS194fFkmKlN+MWg9WUVGbTNTIVMjektmOExlRXg1TERSI24oP2ZULSRDQjtxe2RzPHZjKCRM
d24KK3pya3ljLT08TWwzWDN3ZSElcFdwOF9sek5EM19xPT1eMFo7MS1PUj9jPVVwJlMpV3JVZGlI
YmI7ISNgcS1Vb3ZDZworenFxbXA7YHBIa3t6bVdhaitMPGl7TzBWc1FBI05XMkYpZj9pdWd+Rz4o
JT9TbCV4blJYQXZGWH5FKmhBZTl2K1l8Cit6SE9aNkZGRn5aZTRwRzxSLXZhendoPF8zTXRIci10
QCRXWUw8TGBGLXRIWnhMTiNKKnZeXm9xeV5CPWA/QUtGfVMKK3pPSV9Pc3laUjI+dT1ucykoVnpT
TndPK2UtPiRRe21wUGhMQSVfbzFqQGBMQmp8RiZWJXhOfVple3EwPX4mSz5nSQorem0remZnVEFp
cSRgMWtgb2hrYm5hKG91aDN2RVMybjtxOEFjSlpIPkRLanI8Ul94R0xrTURPcFg3NXA+ZHRjODxi
Cit6ZXN1NVEzJE1PRWFNLVFtUEtZK1FQUlNmX1RtSnomTj44Pn5ffHdOfDIqNmcmZ1dfTEBGI2lu
eUpgTyQjbyQrVnMKK3omcXBXeDhVOXE5YXdjSCN7YU5+JklPUUpgcjxeVGwmN1lPU2Vvc0hCcjU1
cE9vYnM9V2dSPypYdG8rP14rUGdKUQoreklxVHgybSplIXlvSCpAR2lHIWFXcnsycnMpY2J1TCsj
OUYtX3Y3JCtZbj00JiNsZF5XO3EjcTE8P285bHxIZTR3Cit6JkBCSTFlX2EqX1NMNUpVJEMxeVFh
cmlrOUM7Zm1wPCE4anZ7fj5Za3VqQUJ2TUk4TThJUVdmbWBzTEwpezY3X2sKK3p8SipveUV7e2Bo
JnA3cCMjO04hQ0lRVWE+YTZMfT4zKiskTEZBbn1rOTZkWldQV2dwI0BYTy1KJEIwdkpSVUVuZgor
ejZweD1jPHRUQ0x7VkdvU3g4dW4zazJ2WHZmWHtVTmJOQG5kPFM7IUJla0JVe3Z2Sy1yb2IoSWhA
VlBzVmU0ZERkCit6dVomYWcoUShTWkZBaEtTMU9BTnZePk5iZ2k2aFVzYXE4X0tyeXUqcVg7KUk1
YXoybGZ7K2MtYV5vV0M+OTtjaiEKK3pJQzZMXzRxaEtlSmBjc0tIJXxIJGFyaWtnUEJ9U28oeD05
ZV5UO14kLVdkbEUjVk9+XklROU5MNG44eEUrLXtFMworenpue2p6dWE2XiM9aXtYSiNjOV9sQFJO
Pno/dzwrWiYtRE5BYW10dyVobzQlPTtkcG85cGY4VjgmWlRrV19EUClkCit6X3JeJi02YTk2VmJk
KGZLdXhodUxMKCZIVlBtQHxiN0xNJVYkRjshV2t8TkQ2TU1FNkYmayR4Z2IjXihpXnBebFgKK3pU
PFJATjhzU0tjO0xYVEI1YjJrPj5iKTJCclUwTDU8RlE7UFY9O0NaVmo3O2U+VyVHVXQrRHd1WSg4
V0JaeGVXbQorejZ0d3dfQCQta2tRPkU1QDE0WXNIdlJyITF1NkloUikhdGFXRFdjdnFzbHozUThk
MSlfXjFuPnJYO18/RDw+Y0IwCit6SFE5SyhpX2cxKzlgPT4kRjB0QWJUZkFIWWg3WGd7cSR3YD50
TzAodylLXitRIUFlajZwMShUNWY3LXZ1P0ZmfDUKK3plcmElKGIzVzN1b09IWTF0RjI8QlJGdXp0
YXFHaVIzMENebmlCYFJfYzZzZGI+c3txJStVO3R3YEFvSVR8NTM7eAorek1WailnUlpnYWo9aF5B
bz9ldUxuSntSP3B8NXtpMTE0Tz9aZ0B2cG89VUJmPlNWen5DaThWQUEmKUhIKihTJmcmCit6KTYx
Jk1YM1ZQYm1zTCp+SCtwdHVNY0lVQChgSmBSQl8lV0ZSOTJMNSRKJD5+VmtRMGFndElEVWBLOXQx
VyZaTTYKK3p2JiV7PUUyUSUzR1Z6QDR6KUglSWowfXtyPk5CTUJeNFdvIW5OcDN2eTBxIyNYfnJE
P3RUfDtSKXVeP3FkUkIkTQorenlyZ3ZJSEJ4IVNvVD5pT25Ob0d4KWFsYl9SWkJIeHtASW5LUV5E
TXZZMVJKOWQ4TiE9UTk3cWVzO3UoUXMrZGwpCit6eF4hbD5VM2Z7TDA/RHJfbj1WWisxdDxRcGBG
XkNSc3ReXkhgSyNzeVc9KXEkWElJdmd2MmRpQVE5VDFsUyNAPEsKK3o+WTZwOVYoTSZFUkt0cERO
TE4pP21kPUA0YX1BaDtSNyRUUWswcz8oWFV6c01kcDtuKUdePUt3O0dabmRNJjs3ZgorelhfZUp9
c2liVF5MPEhfP3N3eU5ER295T3lvUlYxO2JJfTw4RUN7KGA+WU9yMG1zMUtUNFd8JWdraCY7YXc3
NSQ7Cit6clQqKXglMVhkJSQoKDU9ckdlXl9JYUJBTyl+UzkhZ3ZkNmJDPCE4Qi02KEsmUyVubStL
bUAyK0dzQDt2YExCWnoKK3pyOCNBRF96Kj8ycns8emdHYHBnKmdiLU9gNSgqWk5EI3xOUmZlZDkj
aTA5UmFDQENwLV5iYHQ1N3FMdHNNbHUxUgoreiY2X3BkJm59KWA4OS0kPFdvNmZoVm9fWVY1SVpe
YVJ8WCh1aSgkNU0jdkd9Nz5afUBlYWc5KGN8TWVga3EkRSYyCit6eUs8Z1hGfXF+OylRVENpRCN8
Ty0+MTdxe3hzbm5+RCR+ZTQ4NCFGe3FVWUYycVVmcHF2Z3N2NE97UH1RQW4jUEUKK3pTcnMkTDky
eVIwRW5hNjttaXAxMXZBb2tURmUqd2dQR1Vlcyp9VCUzZmVON2w2XnswXklFKlcoWSkkRlppZ0dk
bQoremw+fFNpMDx+R24hUW9MKyQrKCU3SEdhfE9UP0lxVm1EU2drMWZZdmRQPk1zU0BfRSY+e0FI
dmxtJik/I1E/Rnd1Cit6UEF3SnZRJlBlbnM9N2BMNnVgNDtLdTteSHJiNDZEYn1tKmZxJEhYdSNz
Klpodjt2d1QmQUNRcytuPWFvJX1nayoKK3pySWg4PERQP3gxelk7eXRDMk1xQlJhSUhGa2EkZX57
en4rYWpsfjJlcSVSYTE5V1psaCNxYC09NWdGIUJyOXFmRgoremQpRD5UX1pvKk5PRyskaHAjfTR5
KjQwIypJaDhtdD55bmt8Nj1AbTxKY3NvMyR+allLIVI4MlFicXslezdXTFE5Cit6a3pYflZuaEh6
Zlc3eyo0MS1lclhGO2chcXNmd2tRdnU4XitjREV1dUR5PGV1JE1HJXs2PU4xPWw2SWtzOFFNQ2oK
K3p5ZWk8WT44X2hidFA8dSFqT0FGY3EmJEcpdClAZEFYJUlAdnJjZD14MXZhZ3cjJHBUKiUtRlNv
TmBGfWl8M1hEZQorelh4bDApWU5TaWJzJXRuaHB+MW98bVEwXmpoRVl7QXIqYi1rUSo8RnBmSiQy
YDZ3NiFWeml4SX0kPXM8cGN7dnpECit6QXZGQDI1UGNKPEY2JU4mZl5EPiViKEtJOU9HKyFOdUIp
Q2tXMlJwXiZzVEtMPSNwV2xXZUBLUGM4OVZAYmIrVXoKK3opKHNDa0V2Rm1EeXBAMlJTcEZ+M2Vs
cEQ2KisyV0F7SE4kNEU7TF41Z0c9bUEjaE5BUVExU1FSSDFRfVd1Zyl9PgoremUhRjt+NTdpeClm
T2F5TTJtais9REA0bHItQCRZJk1HV1BXS016Zz03VVAqQkNgcjJLJmM5LTJLVUIpY1V0O31jCit6
JX1WQnAhVEMwUXVaV2tXaThrIyZZRjFDfllFUUIwenxvfDhOVjlHRjIkNFRRbmglPTQqIWVgdlVu
c3VKIWFNQnEKK3ppeHszXzw1SyVUa3N5WD1tMDlWTlR6SilOM3J9KDNgRjhwPTdvSWk4Tn11ayt0
RU8wWnJWRFNlJWc9SipLfDZofQorejMkTEB3JnYpVk51VWg0K0YxJnR+ZyVgVzxwcStrXzN2WFgo
ckp2JSR0ODlGeDNvbC02ckxTX34/WE93KmQ+MVpwCit6Qk04NXMzdlpaaTtrN1FqJlVScXlUekk+
a2V5SXgmVVNwTTBANTArbEVQUjtAbStiVipVM2tfTUVCIzZyLWZwTEYKK3phTiQjSWVjMHJ9PitO
ZDtFaVN5K1BRVFRLPWZ8IVl7Q3UhfTJBNW0+QilSYWFtbn1UU2cpZWA+IXFaJU1ARCZTQgoremNq
M35EN018KENRKjhOWHgkdk4hS0clZzsrNU1qSCFxYVZqUjJTWkVeSXo9M3YrVlh4YV5YezZ2aU98
aCFjJU5+Cit6clZGMzQhYilHfCFXKFM8PWV6TFdRWShHWGd9Mi1NKlNjYFk5IUdVOXl2azAkKVA9
WChlQWNgMGU0QyRURjErMzUKK3pmNEt7OXU7c0pUZy1iVTc0S0RuckNvUXxZJCVTOVI0UF5YVVQ9
KjBsLXxFODRaTUBabSYkZTtIZzsmfm15OUBXKgoremMhdnZMVkJedisya1paSkhsRlVuZ0VwUyYh
dXZtRndKWGJvLSl5SlBiPlgrI2Mpa20tdisqZXxKbDN3NkY4cSVoCit6dCRNM21fJTBpdEA1MWwz
JU1aSG5WLXtIRClWdUlVP0RXZkFffHJETis9Vn1IPDExYkd0MlctPyFXKFJTbE04UlEKK3pAZkhg
fVYma25Ze09Ye156cUVVeCg2ODckeVZjZ2liUWtgbVR+NTlXSCo5PjAzKlR3dUteTlgoPE1sMikj
cGI4TQoremcmJHwqdHVBfn1qUT9LYD02fFMtckBRZDhaOUx6RnQyUkV4Zy1eRWVwYkwtYk54Y2kt
VihVK1gzb29fSFg/NVdoCit6SFpKfTFWRSU4a0BwS257dnlKRHdASCFpeDs9PUU/QHRfTnp8RVNn
UF4pQ0U1SkFIIS1mNj5OVVVISEo4dGE3QTEKK3oybEt6dVBNX3w9SGBzVy0zeENfanI/fkxiP2Vj
Pnp7MVpFVXkkZXNZKD5KKkF1a0d9JEVfeyNPVSgoKSNgVHh+VQorenBZRm5BYnxjP357fnFKdGco
dGBPY2oyaXZVaGwjV1UxWjYjIUcjfWc8RTx8SVhkOVAwNCg1TkxqaTxadG43eHxmCit6IXRiKT5G
dz0hYz5+Z0FIYyYmfWtjajEkNElSc3NKWX5IREw7a3NRO29lUkkrIytTUEFKOGl0KWgyTFoyJVVw
UH4KK3pqVzJpTV91QllNN2s8QnVIQE5UelpHNGpwS2kwLXVUekl7V1oqfTMxKj82bDlmNn5TYzd5
aCkzeDRaQ1VUaDFMVworens1ZDxsV2JkIVg/RC0yZXA1KCRgdmhmcmJ7O0d8cXgkdT1YcDZ8a0Fe
UWBLXlUkQGcyeVlRR0RvOC1ie2J9IzZ7Cit6SENzUHhVM2pCaWV3XzwldmhrJVp5eHVObnhlSmZZ
SjFicHklJnhZJkBSJUpsVD0tZ2gtZlZaXzgqUk05Zz5TS08KK3okLWFqZD4jd2hESmpzUmtkQkwm
fERLMzFzb2olUWxjZ15FMkpTSy1zN3lldFVVaSZtRyMhciQ+PWV6SXxaOEB0aAorekpqPSNzeTZ7
bXBLSHI2M1cldFdjN3J5ZmJ0RyUwQ199TytqVFY0MVY4I2kzfDFSTCpnO3BmfFVsSXZYUEF7JFNP
Cit6Z1IzdDVRYWstNTdhbDhyclZHRSlQQ3dzO20pZHgoMyFpMTxPST4pU2pXMldJMFVLWkchZiZ3
Z3R1QjAjalQ8aCEKK3otdTRzUj1Wcl4tMzNwTS1jYnk5cit3PiRDb15HRUxPPnlEJTxMJjxLd0J8
MnY2Q0crNUUmakdSQFpKdTVze193PAorejtIP2g0KDE5QmNgfm5Cdz8hWVM/YyF2WThjSHBzZElU
O3g1Ykg7d0xeRCpMZyQzUSR8PWRyfGptb3hUQG8hMWUrCit6Qkw/Q2JKQzd3RWNIai1SKz0lTkF5
IWR4WlpqX2xOTmhALWExTHEhTT5eSEBNYkJ7OWlvOVZ6NFY8NFZZNHhEd3oKK3plKUFvO3l8cEt6
Zih8QHBJflk7eHpfQ0h0XnthRT55fUQzSVRJI18ySVBpSzBqKlpFIy0hY2NAdytvZXw8cWxrTgor
ejs0Mis/aVVWKE87RDxUek8lRDhVMmoxZXFrOHQyeTlYUmc+JDl9QzJKYSM2X0lLelAtOEIyXzN5
OTU3PTFNaEkpCit6WCUxWmFxZ3grdklAfFMyYV5PZElxMWZZZjtLdy1kR3paP19mdX1xMDBTLUxW
ZmdrSUB2bUUkdzRte1VeciN0WGAKK3oyWDN7KmljfXI9QHM5TXg0KlVjTUtGTlYrSVBmVkJlMkBk
NT5BKzhQOzhoTyVCbkxqPGZvRDRLcGFVUTV6LXR9JgoreiRxdX5FZnVHe1FtcGJyTTllQk0xQUw3
ODVJcT1nUV87THE2KVBiKmI7OF9tNSFHVUt4QEokWVVtOy1OZDtITndBCit6dHF5IysxODtUVUlT
JC0jO0FjNFNiX1lKZmZwPDlZSk8/ZnY9K14lOzllOSFoQUwrblQ5NjBZNyNlUWlIKyMzViYKK3pP
bjJhQ0lxKnllZXpwVjhhXlUkNkpsQkMySVBpUTJldlNpSTlyJFBtVWhLZmZJUGdnaHs5RmU8I2V0
dmF6LUt5ZQoreilxeih6QEZFOTMtK187SDs2VnB8ejV9bXk7NjRYbD1mS0F+QFRDcz9MSSs7Jno+
NkxERzYjTjwxN0dnSUZMdk43Cit6OXIkPCQtciZGfElQZ3NsZTQrenlhcDBGWUBVMEh+UVV+N1p6
JFpDeSEtMjwrejhLeF56JU9eQz97TUlnOWtedXMKK3pFJVhQamFOdFB9b09mUGh6WjNfNFJTZCo0
JjRKclRHOW90SmZscU95JnZmOFo5ZTk9bHBYUmBHOWVBayYmdilSeworejlrfVlpJU4lJkkxMjE+
cmxOfFVBMlJfQXQmdmY4MzlyIUU8VWdmfjtCTmg9bS0rXkRfTkZRfElfS341OHQjI25gCit6KFYp
UVY5QylScG9UVSFEJTdORUFATXw2VEc2IURjej9WQzR6WE08Q3p5bDd2IUdYX3A7QS1mbkJ2cUdo
KyUhOzkKK3pCTXR0OSZLNVBhQSEpdFRuZSptYGZsfXc3eEE5andFKn5NJUxiN0lTQ3dfejBrQGxi
e3ZxakxXTnopfVk4d0M5bAorelh9WTUzYXpRXnNubDdrV0ZYJUB9KUFjbSMxYnNoZ3h9MFdFKDA3
cmh4fD55a3pMaihtPV8hSTxPcXdwSVN1RSk1Cit6Tno+SWReOTVaXng7Tj04TDA/VXBFfmw5Oz14
TDxzWU1McDZ6TU0yJk9qOG97I2laJDRuKFlTdzM+cihDRX5WS2oKK3o9eU9RWmx7OHhmZUl7d1Rr
WTxDUmhtb2YxWGY3QUAkKXhFcm4pUU17by18IVd2cmY9UWxjdE1rMV9nYU1YfVg0SAorem03c2Yo
cmJ9b301cCk3K3hgSmwwcCFjcl9PJjhHMjd4WFdyPkgzKmpnOHE+LVR8UDVpKEJGYHp0N29QTmBa
TG1XCit6QGt+azNUUyhLakd1IWBRYGA7djtQUCRkbD5xdjdfSGRfUn1ubHhRRnZxOGA9ayo0Y3JF
KkpET3IwS0dtXkA0dHMKK3pHK2l+YlBTRSQwcmkqMzwxJGBJa2xTbyR5YGN+NEpxXkFnYUczbWpp
aXZAaT5YfVZ4JHpNIWl+KUFjZzUxYnNEVworeng/RTx1cHI/X2h0N1dETGBmfTJBdX1uJE83bjch
SVd3IXE9YGt5cGlEempEND1hOGw9V3dyP1ZPd3gzciVtelVaCit6QlRkKUlUclRMN056LUxBPmpp
eTBYfVVeZ291SDI8TyY3QHczaUAhO2JkQWdeTEg4b2ZDOXllMCY8VWpKQkFMYTQKK3otb0Zrc1Rf
WkRKKDcld1RPSnJzVmBiV31xaDBKdDhlP3l1c2tlTVJyJnEma3RGKHBCN0F4KVJaWjJ3TDRLazBu
WgorenQlNj1obmw2c25CSXdubT5EcmhMZl97bEtUXmUoX3ByMFhLTlY7Q29rQ0xXcVc3WX0hZSRz
U2wlJUdzfUI3R2p8Cit6RG5aeyRTfHZTMigyR2VJa3VEYldeYHlzPSZLR253WH1UKEFtWX1hRE8m
NyZYN3hYbUpiV098QEwwP1kjMEA5TTgKK3pGRDZZRiNjYmElYGt5cGk2U0d5Jj1hOG1MVnp2blNP
d3gyayVtelVaQlRXfj9UclRMN056P1QoPmppeTBYfVRPeworem91SDI8TzteSlYzaUAhO2JUUH4t
TEg4bX0qVFM0ND1tZ1NxRGE+TCk/ezVUNlNIakV9XmU/MzhMWVBeQ3sqZzNZCit6MlF5dkotO2sh
dVY1U0tBR3R6VndPaTlwTk5ZaDB5K3hMbjdDcTBGOXREeDdCcmJ9Uzkyem9WWHgmbWZ7cGtFP1EK
K3o3cjxPRD14MGNDPk5vMkp7VX5XcGBEVUc8PzxkV3YtVjYlKkY0Q09oJV8+M1BOfTNhcElZclFt
TnpXbyhFYT5ZPQorelVyam4rKEFBYGBBKU9gWXQ0Vlh9SHEhKz9qV25saEdleXZzbGRkMnczSG9C
dDwjbkJkbjIlNEVTNit2QkBoaUJyCit6O0Y1eGcxcnNLWSpaeHFvLUl6dXZzcnAmZFJYdVNLWkly
NE5XfmtXPk0oV29ITXt7YnU5JShKLUhzZT49NzY5d2MKK3pAJk5aZmZgP0g2YVU7Qmg7ZVZvUGdy
QVF9UW5VTyFkWUJXY2FkcmskdU4zdi09MSNOeCtaTmhnTm90WkdfK1gmcQorelE4anRvaFhXO0Rl
aG5HYVg0d2FWS0xxbS1NQ1d4aiQjKV44NnpXSiYhYl83Rz07N31oR0NXRm5lLWJMVnNpVSlWCit6
NGQ+ZUkmU3JUZFF7cmRqP2ppSHVPZmMzZ0tXbjRTQGBIQSROblhOR2xZRT0/Mj1tYl9Qd1I+dloy
PnVXY3UtIUcKK3pkQDZ3XkltNXpKYE0/aXNDVWdnUGIrdjV7TEYySyNrVnZHVk5aYTUpTHllfFJ6
Pjd0WS0jZT1ZTn5gRWhzOUxqOAorenpabWFPSHo+OEFWUmxFN1kkalFuLUtoXj5ZeXwhKG5vdEF6
cW5jOGIlQEolfCZ8UFRIVjZMUEBuQUkxWm97XlFeCit6dTt2STEoelJzUnIrczUycUh7dFdvJkxq
PSo5dFIrbUJVM2s2eWlQPjF3az95REFxYGJtOS1IeTlFSiE4UlB2dVYKK3pDYzdiZk9aRmIwX0JD
MElDVjl3V0JtKWtFc3V5TnRwJUMtXmZ2OXVIWUlKVD5WTVlyN0J1UWhrX1l7Y0FtRShkYQorejJl
bC1Ce1VSJCVKIWd0WDhtRzBZK0x6antXfFk4Z0hPa08mVXs0OShnV2kpdiRseUghdFNoJmEhTHVr
VEVzUkokCit6a0l+cyRTbkQtVlRlR04+I2tNYGdEbWB1V2g8T2soWlRCfElae1dFY2FuMTVtYl9m
bHNOMDcyV0Z1S01IbmxuKnoKK3p2LX1XWl8tbTRiaD4qO1NmcmgqflFScDJXUk5aRXw1K1NteGdw
V2txbzgrc1FwaEA7eGp+d3dwISMoRVZOQ2ErQAoremZTODlNKyRgcko9c19Yb1VOfEpTZEshPUky
Q3lBS3Y7MUw7UmYraXROTXZRMT0zNjNhQUVLQypHV0QzUjNHOTFkCit6PGl4QHIwfHJJOVd1IS0x
TylvVU4pN1oySmtubzRTTG1KcE9hIVp+Xng7aTB5T09lKjdoQmtMKj89aXhPJj9IU0IKK3pnMGQh
RVplQXF7elJsKnREdElnfkZqRH1+SlBUcElOeUV+QWB+ezI7MGckfjEpYVJzKjZXTFJkbDQqbj1y
c31DTAorenR7b18/TyN6XjQ2RWYwXyNVOWtDQmN5NjZofjQlY3ZfVUlRMHV3Qz1uJWlKZG4mdE5x
Pzc9ZUwySDdPPF95PmU2Cit6e0lGKHVPRHlVfE0xaXE0bmQ9RldpKUZFdyUpZiNaUlR9KzdaSyht
b0tzeDFUIWZzaXQka1BhRVB+NzRxVjwmX1EKK3pVTXtwIW9zQ3A+NDdmVElwZzlId2hQLURXaHsy
VUJEbXhLYD0qX18qaj5Tbnp4Vzk8SUkyTS0tUWtRcVZmdldXNgoremMwUXN4QSNfNWghe2JrZF4j
YStSaWB0XntrOTtWRj9SSk12aFl0RnAkd3p7ZnRKIWt7JFd0X1I2IU85aGV8YlEzCit6ITdaP15L
MFQpeFkwYnlyPG9OWERkcWg8XlVPLTVgO19yTVVLWVN1SGRzJVY4Tj9JQT9rMDZJKT5kbERJNkJs
ZHAKK3pCayFVSmBlNypJQkNDa35nNEApV3RzKWohTWRXb0N2RHp4NDZjSXZFTF4lXiNQOCFOLW1k
YEA0NHN8dWxuUlc8YworelpYa2piOGlJWGF4OC1OVEohejhIeSN4N35VbXkkPy1iSF9fZGRAdC1M
VUw5KSotdzQ/NiprN1o4LWxXMUZ+VlhZCit6MUBWQDd5cmRtdistSD8+dDV3RzdSeHtweW5WRk9T
SWZ6QWhBTTdxO19kKzN3JmstUzdGYntsfm0hSnNMem40V3MKK3pfOSk/OSY/Pk1zZl47LWhkUU95
ZWx2VVE0P3l7YjslOTI9Q3pyfl5ibjJ6ezxaZ3hYeGV9V1F1MGx+Rnd5bTg/Iworem90PzByT0Ik
M0Y0ZHpuOSlKYkN8ZEtGckBoXyM1WkAhSCFBJDstdX5JTFRaSzt8K359MStAN3ghbXhoYF41PWA8
Cit6JVJMXitkPU14WXkmYlh6fDJEcl8mazI0JTwqWGFeaExPJmUtYDwtPCtaenhlK1dzJkx6RlpW
TTgkbUU4bmRifCMKK3owMztSMTkwZHwzZjU4ZVVuS2Z0LURqWXlNbiE1Y05RQiZzJHFOV3FOWWw+
UG1aQVMhWmc3eiFuRm1qNmRkbG12cworel42emg8Q0ZVM083aipBVVImamZRVlQ1JHhWWUl5PENk
SjVZNVMxPX00QGk/Z1Y3eEIzQFMofCNFNVpFKEQ0PHo+Cit6NkEwUDBFTGJmdGkweEg/PF5uN0g5
Sy1hKGZFT2A1VUY0Z0tBaD9tdGlHdEtZXjRCRUtNJWp7aXdtPF93ZylIY1kKK3pIT3U4N2d7Y3x7
NjE9Wmw0UX03UyFaP2lpRzE8Yk5DdWFVaVkzRFRPYlhqT3NUV181M0dqY14hSHZtPCYjdipOTgor
el9NV3ZBSlZ0clB1UHB6LW5eeVQmVG1GRnd2UlUyPE8hVXMqTDgxd3RnRWsqUSp3VXxFeU0lczRt
aTZOQitsV1pmCit6QzwheVdtRWNffkt7I1VCX0MtajY1dClHcGY5OW5xWChoQU4lNE5XVWdSV3Vg
VzxGcHc8ZWtEfk47bm4lQUI2d3kKK3pXX1RgYWZBJHUyQDZUI3ZpP1U+MGNCaXNwaXxUMVhyfVJV
I0AkZ1VSdih5NlFFNl9IRV85clN+ejgpPmMkSEBxdworeiVtPEs2M0xLSyU1Wk13KUU3WGlvPm1U
Jnk/ckE2cHtjKHRMJiReeTE3JUpKRndlb0RpNTRyTGZOaGxXYWJZTn5vCit6ZWtKQCFQd0t8MjJ0
Jmk+ailZaX5BbDh0UHBzWDM1O0VTR2Bre3ttViZycHNsQjxKMkRxJD4oLV5zSHR9amdjJSYKK3pT
cmQ/dUNoIz84dn1mOFJOa3B5VEF7MCYhc19CYT8jJGlZcV5qP2doPG5JXnEmU0YzYktafU1tJClp
WjxHOSZmVworelYqRXVient8WWUhM0EpSmx5RUxNTD0jN2s8SmMoeTBmJVdyeDxfajNaVG0rPnB7
N0d0KTNmJHpKQUsrLTxISD9SCit6UzFSenJna0JpR3o/VGo7MVU/UldIKUU0YUB8NnpCaGpKPkJZ
bWg3Q3tUbmIwdUpnYzYoMGR5Yl8lRm90O2w7KWUKK3olLTxnRDJTRi1kO1E9KX1taEc8akUxKmFO
OGtZQHJtR0lOPnJoVTRjQGhYUV92WF9zal9xMypnPXdHLUN8TGg0aAoremplNCZpP3ZhZDdlfVgh
fDdrc2V+RmlxYWxqNWY7P1AkZE04e19gaD95eU03IzU7KzY8KEloe08xZkp9TVREY3k5Cit6O0dw
fFIyRUR6a0IrQ1dFZHc/UFJOZ3hXZW9vbXl2ZTElP3lrel9ofTlXIXtSRlk0YCtqaz4tMk05ZWcx
I3QrcUIKK3pnUD9JVXl1PmpPP2RgezZiY2xXKXRCLTE8KlNiJTFDQS1fMGljJDtuYn1hbDNkWTU2
PGVsMDV1P2V3Vm5mTiNPVgorekxhKF9IKCZScCZ2U0t7RWwkcz50U3U4YkdlV2RYK1lgM2M0a1lx
Zj1mY0JOfkQ0dEY3d34hRkNLYVQ4YldTYkpjCit6bFdnZ3UofnQrO01HNVFqeUNTeTF8Rmp6RTNf
SzI3emhlViU/UzF1PjxaVFJ2XzlARUU4KyMqWGJab20lK2IqOyYKK3pjQHZ9YnZGKW1VYWZobjs9
eGs1TyRUZzA3NWF9P0Rna05SYGJWUW45WktSUEJXQVJYJSNaSzU1dmpuYlUoN09iRAorek84KEBh
X2ZgZyEyeV9wTTYwd04pKE5BYllycXVAalFFYzdeY1VaTVZXe1g8QkdWWT9uPT44MEt4X2JJPnV7
aE1fCit6dm89eCNYRTgtKyE9JVlxN0Y8enFXeC1WaUNGe0V1VmZtPG03Unp8cWZQdDl7IyhkZmoj
PmN5bUJicms9LVhtY18KK3psLSgmalMwZT9BQ0RzfTE9dnUtTSh3Pj59Wm4mQmE9M1krQ1h6WE5Z
RyVmNnJmTFdBbzYqYz9kcUJnZDxpaDcoeQoremVTXytRLVpAfHozWkRvR0smNipXXmtCP2NZTztw
KiUqZ1lCKTIocGVwZU43MDFvaWBtcVlJeCFzQy1mR0ZfVj5XCit6NmwpYVp5YzNBZ2V+PF8tVkt7
fGgtVFROWjI9ezlUKlBYQH0kSE9jUEkwaFhWKzIlaTdJWmolODFnbUg9O2EwWUoKK3owemQyQzkq
bzFQcTdvK0FjcGtWfWhFVUt1TFUwKioxM3AjSWAhZjxqKDh+cSFKYyVabWA/YHtfKT1II2FNNyhJ
RgorengqSjV1YD1td08zX0A4VVVrQSMoVVpsRUpNMS1wJFBqZlZkOHVkT3QwYUZ2aTBwbm43ISNy
eiNDUT1xTTx4MkttCit6QVQ4dmIyJiN1KTMzO20hQEVwfDtZQ1JCWU5ZckhSfEMrVHtMN3x9QCR5
akJ1JntYYWxxbU5JPXFlJER4dTFqQWcKK3pOI2kwcmx5Rn1kSEM7WG1GYDlmUmxqKDlJQURhQm48
dUROb3UhekwrVWQqIVgqZDYyIz1ITHFrRjx7TWBJSnJocworekA1SV9CeVArKmRqUTNEUyFIdjA1
d0kjSCM9aUlFUWBheCkpWEtyU3c8MGsoSnBeZyZlcDJrcHZDI2pialRJY2F7Cit6UFZecmk+YlUl
LXgxI0Y5cD95Y3FZZUQySHBwcWorOzdnO2kxSiFieko7dmRvJCh2RVhjX2tYXik0aE1aMDVASUYK
K3pJVEd3YmUkOT1Sbkg7QmVfX1V2bU87OWJNN1hoXnBWTTFSNVk5NUJ7aEgqSEAtZ2F6cXBxVik9
Sm1rSGJqZXswMgorenpHSmsyaVkrSn5lRjNkSDl+ITNXPVZodlM9VmQ4MzQtX2dgajRoSyhHbip0
ZE95OyV8NGJkXj1sQVIwTDQrUkVCCit6LVo+NHVheXF1KTBzUjkpMUdJcnFJdzlTZzJTJHV2emhp
VyZfaTZNPTFKYUdVMnJETWFNQWlHUCElKnlwdjF4NzwKK3ojZD0zRl45UzJlMT9QeyNqNy0wXmBM
R3xWZzBmRiFeZWF9aDlrWX1MTVpKZUg9S2spQ04mWHdTaUk5WT8zOyhybgoreldmdmFKdkRqTHFl
T3t6QmA/VEZ7e2p5UVBTNnM2R14xUH5UUXVucn5wN3BBPilpPTBaXzQ9VHheTS1AaHdMQCZyCit6
aWd4UjdDX2Q1PFhyaWV+UWxtRz4qO3xaSHBwbjJ7QEBlMFcofCZKRHd3X0lMNWJ7QSFUKnJxSmV2
Tig8VzxrayMKK3ozalB6TytCNFEtekxicG4xY2pEKC0ofHdVYWNsYiFVTXlmRzk3TUt8Y2R7cldR
VWp0JUpfM1p0b1BuQFUraHYkUAorenZoZ3srRX5LJkI3JkNTIXtKPmFLKW5kamowVmQwUVdoYlNJ
WD1FKEA/YSZRcjgxK3Y7LUo5Zz0oUSNQZ0FZMmVVCit6Pmw3dTclYEI5ZmRnQFdzd1ZYanUrNTFU
SjlWUyZGM1d7NjFNQ2Nac1poaSh2eHFVQT9OY2kzanBiX2QzSUxDND4KK3ptUEZXTXw4VGhZX2hh
Rj1udTh3Wj5uOFM8b153WXhnbUd7a0N9VFFmRyYjVnEzUTNxe1R+NmsjPzsoJjVUOE1ATworek8m
JCV0JjNEaSYlY258NSFMJFYlekNqKXA4eF9MbGE9WSRHQnhKUlFoTnZkXzhTRVotJXJRX3F4UiY3
IU5aQm02Cit6MFIhV2IqfTtxdTBDX3dicXNkJiZLQHlkWE9wTExNTUErTj02ZSF6fT98XmdIdHgx
ViEkT0kpamBlZFk4Mk9BNVEKK3olZC1ab0wqQDF3aUkhSFBnT3U9WWw8YlNuazQxSkdLY0didlh5
aFhadzRpQVd2KmM3aTJOUiVxWXckNGxwKlhZKAorelVkbj5VRi0+NHdZc31lYSEqTUBQR0c1MDlp
OGRSbXNMMng4PVhrKzllbmtlbjN5ZDZQTU1gbDAkeDY1dVJSO0g7Cit6c2V+XkA0UGk5K05fSmg4
MUFLeD1SWFpWTE9tTXlqWVdsM2BffkhhUnJyM2sxYkNJLSUwRHwpcXloYEwya3RTIzAKK3pVQEZI
SThEcHx7YUE/JHZwYG5CP2dQMnUjTGBDfVdVMEJRb3pEMS0/N0ltOz9vUWE3VjhkVWBgTDJSKS1C
fGlpUworeit0I2hGPEFzJmFuTFZ5K1JidnoqUDQqcnA7cDlEeDMzUEFvSFBEY2BuQVo/SzZ5ZGYk
SzdDJWdGJnpseFBKZGB1Cit6bGVgeTtieX5ye0tSWng1MVArQnxAfEotRENrTjA5O1RqdWp6cDxS
K0JFJmJ6YDYkZ31kWUx4bEpweVN4TmAoN30KK3ptYChiRTNnKnNIQWA/TklHWVBXJEY2TntqbUIm
Jm5uIU1eNmM4Qn43OXd4VlQjJVgpYTQwUG4kT3l+cn5tVEExWgorejZUNlFaWT5EZ3hoZUNzZTVX
YS14cEB6X1o5dzxVS3FLZFMwKTVVJSQwIWhYdj5fcFZ9NSg/QFB0b2JnPXJvTlczCit6Ym5pVi1S
ZngpYD9OT3NjbVZxIUQ9Tzk4S2E2YzNadHpITnlDajdsPEh9KkBSVlFPXjFuVTZ1QlBmKUw7JHM8
bGUKK3pBLVo9NHZ4TD9zKE9VaX0jKVQxdmN+U009WUdpWlpPQjZjQkRzPDBTP3dEQkspfXZqODhr
ZUZwJU1SUSlvamptbgorelVBaDt7Zys3Z2Q0ezA/b2RPLT5uZD5SRlNybHVNRT9oQmlHOFUhY35w
ZHNKK1BsS0ooY2hzbUs8dXJic243eEpLCit6QC0mSlBSSU1QJVNZaFl0SzxBa15pQyohSk1PJXk7
VFR2MGE+STt8P15CNFI8Y2B2YipuJXRBY1lWIVZOPXI3Q1AKK3prZXsrKmVnSzRZUUglUFQzMShv
YjVgKXtnOVBLbz5RM1d1fml8TlctZ2xmQ3tDNS14TTB0JnVvJEstckBCNVBZOAoremxsPWB9QmQ3
TU1RMmZ7ZXtaaU5pdGQmfXpJaGJYIyY9SzxBPW1FZzQtNmw1YmxnQXk3TFpVZitHeCtlblIpb0d4
Cit6ZmFObFZRMFVSKjdBdHl9d08/YClfK0ZpaGdAQDdDaWhqfEdabjJfMldwMksmWnRNYXQjPnhC
PmZub34zQ3dvVmMKK3pfV282Pl9LaDApdUR5NXltVjlzYVZ4N3QzI2x6YmxXNDwlPkRvaFcqaXVC
Oy1Zc2hnVCNQdW9WblRNNmRfd2V8MgoremNeSnxfXiMwXjRKNnA/N1E7ckttY19yen1eO2B7Zyk1
IWtfXkY/Iys3c1UpZGZjJEZYMGElfVF3YjN8Ul4pI3ZQCit6QU1qKU9CWVcldWA+Pz14PHBzU2px
OHVxTzZsM180Q2xRKVJlKT5TRUtMY2ZxZ1FOYD1PPXl4ZXIxT3hTQW88JDgKK3o5el87ZiQqKGxh
azswLT97Wk1YNXp6VmVwJk1fcVBCaHxkV196JjRGWGpNTnEyYCpGO3dpcERoJVpzcyFoSTRSOwor
ej1BRG1fbTghZUY9SWE8NmI9fGEyS2c2ZGl6VVk3dGRTV342KGxPYXYzTjheJkkxa1ladj0xayRa
OyhBbng9OStaCit6WUh0LU5FMFRpeXkjQkdWX0E5cTxMMWJ7Pjc1KiFPYD5xUClCWjJBfTdwP0xY
TXJTbj8xcGhjb3hySG1wQkZ2cWsKK3p1YTdJSj9hMn5+O0l8ZnE4YSpmfXV4M3A3SkFZNURXdGBV
M2M1UWhiUVhubTJ0clRzeSt3dXxSdlh0UHlgU1ZzNQorekRsNXpqT0hYfXZvYWMqeiZoT2N5VzBW
entBdjBAQ0d8KkJJSmFGaXxCYGw+Tj5VKmIhRik/X3FYPGk0PlYlLXdsCit6Y2VlbFo+O3w4dl9f
UTs4KzdYVm1wNkd9MFc7alV1JmN0PkUodHxmNGxlVSgrZitvK3g3PDEjYWNDIXNla29CKVIKK3oy
Q1gjdmNsOF54ej9aTUQhP30/dGs2YVcpJEYmNmFvaVQ0VHl1cVJtZWtqPTZPdEM3RnRyU3BYbWxG
OF8waWN+UQorenhCZz5BMH4pc3tvKWA3IWgoXzRpPVFmSj0pQEh9cEZsUHVKRWQ1QFVQQ283ZFYo
SEgrSU0kTEc/eHdNfWx9dnYoCit6ampka244Z3xvSSUxR3ZmWmtvUUtTPWRkfSE3enQrKHt3UCFH
LUtDP3kmJWMjKkEtdVk3Tyo5MyNiJEhRcFc7dU8KK3pVdn1YYiQzNVk0WHF7QH40fmVSJG5mbUAw
PzhmO3xSSSQmZD5ocUdZViNoWUw9I1JpKjdgYCkoXkdLXjtmMkd8fAorelZrYkhfailHQHBmbSZh
T1Z+OHt1ayV5NnBzfUAhSmBrPUY1T2Zra35LWFhVYz99ZC0mUGlLNy1HTG88LSZgPDBNCit6MWFo
JHhrakJBaiRydE9rU0Z4OWJlenRaTitnZjdkRyUqOWx7NldON3M8UDYhPXlReFRvPTQ7OFBARzdz
aSstOH0KK3p2IV9ORVdNbnpHMnhxODNJb0R5S2kxd1MwIVhEe35TQDVPOFRsX35ePHA9aTw7Pmh3
VitNQmZkO1ZwcTMmQFpKZgorenhOaV9WZVk4SGZaeUZ0KyMxVSQhRE08fC1OQ357NmhFUzFJQFA+
P05DSHlWXnM/b3hYZTlqcUlOcE1vc3olLW5zCit6cT1KOStnfEN7dSF4dyFTLXlWU19tSX0yV2R+
b3dKamdlbnM7dSp4ZVArQ2p+JnUpWG9oa2RDfl4qKFVLSHNkXlgKK3pieD1mTzQoJjhmZUhiWjI5
U2k0T3p9WFMyeU4jLUhqLWlJeWYoNC1zOSQoKD56IU9EekpMYitQKHNzMGtRSUUwJAorem8qeD15
byhQSGheeCt4c1ZxcVZeek9QOXhlKnp7bENTT1pUPSRKJiZGLWx8eVloQVF+QjZXO2pIa3YyTGhv
UVZTCit6YUVDNngwJXZxbGBMMExrLXdzRUU7VG4jY14+RzhUVSFiM3dNTHR0NSZfYGp+bGwhOD12
QztsMVNYR1ZGNCoydjEKK3o4RU5BTnxJfTlBWjcrKSF7VEBVezxxcTB+cVVnQ2B7LS0xOyptd09z
KGlvZzZII1kqZSkmfDhCKkR6QFRXYE03dAoreldfTkFubClXSnghY2xHK2Y8JFUpTjA1VD88Xjc/
QUpwaXpvOGg5OU1wdk9tWio9VU5+Ul5DZktMdH5uWiZRRUQ8Cit6RmlVanZMKE1BRWV3XyY4e0t3
aktSO1BWTG1XKiR8VzAkU1paV3RIJiZZIzRjQkBmSnRzKlI+czcxYG0zMUhhNEkKK3p4dCZsQ09t
NDU+VCZifTNuaU4kVkBIQiEqbSZPWittU0VSKypONkU9I2VBYktKYUl1a1JYOz0zJm8rO09NcyRy
MgorenE1T3tZRD03e0t0P0hLfHwwT0Q+Kk0lbzZJODQ8P3NDdXNYRzFfUEteU3txOD5VO3RqZ2R7
amtUVj5xRUdVXzBRCit6LUB1Z2Q7VEk0dnc+UklpMHg4Qmk1cU56JFdRM2tCZTtBRi1ZeFhPWCV9
KzUteVpFMGhXPkg2YkwqN2w7c2dUQ3wKK3prSSZ1KWVUQXI9N0NSVEN3ISVhODdgTCRfXjlEUXRZ
fkhzcDRvaklCemI1JXNoTU1IRl8tS34xWWBqQE16QU16UAorekUwb1hgYHQ/T0NmM3YqM0RgYSRx
LXQ3dUNiY0o1QkxsKTskZ3heJXtHZ31lWSZAYyljc0xLUDlraGJSI2h3WHRTCit6Zk5JfFJBdkFp
JGdwNU9Ta01KS1dkTysyRSFVKj1VajlgQm4hTzImeUZSeFIlXzRTbzhAZT8tTmZRZkRVKDNsQSMK
K3pXKl9hX0h3RF9TV1cqVDRiV3pvXzU+dUxfPylfUWBLOE9HWUM3MUlMNVdfQmE8WmNGe3FsJlBh
eV5SYS1sZkwwSAorejFyPT5uUmBrRiFLOWl5ekg4ZGNAUnxyZzBSJHopQmJ0Rj0+X3x0MzBmYiQr
KXtiN1MrdEZARmhWJjtKU013MmgqCit6bVYmbFJaQyohUnczZ1dvJGtEQGk3QEZKbWZZMmw0Z3Yr
K2soLXN2OCUqalk8PzFJZzdqa29id2U1flh5bllMQVoKK3otJXZlVSlzYj0/WHlxMkhpX3d+R3st
SjhMJik9WFhrMX5+PmRJS05QSnt0YVFxVykrSnM9U0Z3TCtqd1VIM29LdQorenlnJDV2Mn1LRzJU
fVorRTNeZGItS3lIeCtKXjM5KGBPZ3BTPiFFfkFNKGE1dk1YfXh0SnxjVmskREBpfGduaU0oCit6
eXtndU17ei12M087USlGVjxvPTRoUUpQTUtJI3s8cWRFSWZDajhORkBDZlpvVCNhT3NRa1hofT11
JFhWQCZKVDkKK3paPnJJTCNVUmNuOThEfVBpdVRMTHV0fm0rZEhifigtI3I0V09abj5GYDtmJCNq
P3VSfDRNaztkaE80VVh7a0NjeworemBxPEpYTWN1QDgrZVBUJiQoWXVBODBXUkpERmRvbHdrQlVA
UldUWENhfWdBYExlT25qQUwycEhJZSteTEFLbk0/Cit6U3A3WnJ1Wi0wbmIjfGB1cHIqRW1qMD5Q
QjJtQUJYfDleNF8mPDAtazBkYHJDbEc1RylnU1FpXkpOWmc7c1k3NDgKK3o/QWVpbSpCY0x8IXdk
XisqfHhVanw3eVJeZ1orWEgpUDdsYmZ8YUVZZTIlWDVnKWx+RW5nT1ZmRENifUUzO1EpTworejdU
O35aJkg9Pm42fC1tNERxIWEhVW5ATmJRNkJ3P0JKQlhwS0tnMVduIytxWmt4dWBTU2E2KjJKZDZo
eDhgPVQqCit6SS1OITxIckY4TG88TSFrajR3SiswcD1Uejh2M28lcEIxfnVxfDJYVCRjQCFjUDFo
c0tBU3ZFSnlFQGQtKF9oQjQKK3pNSnlmWjFEYDw4OGp6NSMqeSZLaSN+RkB9YFdYQ1haeE1EZURZ
VDBEZCNZTldrQ2kzM20oITQ+dGt8cVZsayVEYQorenQqVnh+aCpgU2s2bWhJbFVXWWwpcns1Xn5G
UXhPYWJfVj5JK3wmSGkzVzhAM14ld2ZzNHo2Vkh5QG5rVU5QXzxYCit6RlFpY1coVTgkSj1HY0wq
NDgwLWhSVStySmZ0Yn1nNU5WenpCckxLYTFKa3xfMGtuYkZBaD83eGh+MX50YTNaVSQKK3pDYF5J
dlB7UFRgRmx3azBtaG0paTVWQCViZDMlKSpkPld+MW4qRlY8MFBRN1h0dkQjUT9qVUlmZjw8fGFi
STE3ZAorem5yZCFQcXZ2OH1lcUx0TkEmfHlhPnA8Q3FDSEd0RTsxN0l4LV9+SHhPQWNYNjJaTl4m
M3ZEJWVqUnlrKyZUWGJvCit6S1FBbHI3ejtWSnlPNEJNWWVUbGAmOXJPd0kmbj1wY3JxXjdmK2xe
PDVmSmx4KlU8a3EmSCM9Jmp6YjtoXj1MfUIKK3plKTQ3e2JSTyYzdDEjRFpSMG5eZEh0eSZGaFg4
d2EkZkBSU1JsPkoycGtJPXU+S0NOKl5te012UyM0NFd3Z0FIKgorekl5YkZvYUVtJikxLTUxMGxg
SU9uKXJMS3YpUDVkfT01dGVeOUZfT09CNVZOPClaWmlNKzNzQSs1ejlSdDxOZ29QCit6YiRRPGd6
RE1pTk1NN34xRiFIPnRuJllmSjhnVCQxVEI+Um5xX3NVNXlyNE0yb1AkT1g2SSZxV3JTRWZlMXlR
MWUKK3pkIThUSUxxR31SaD52ck5fSntHJntjSitjX1dLNChnVihRUUxQZ3o1LTU1cDVVQHxDZUd3
eTZiKDZjZFM3cm0+SAorejgxNn0/SWBZeWliV3dDSGB0Wldjcmk2NWkwfWdARFZibz1AUzVQUDtP
NVRUazhCM29YPEtPQys2KTN0NTx+fD0xCit6YDU4diswNSg4YDFSeDk0ZEB0LSQrbHlqNmtCM3Ar
aiN5IV89PG9OPVpVfW19YTFYKE0xV0hmUWUhPWIoWS02KVkKK3prRzQrcFhZP2BkTU1KU3MpMkhw
ckkkZ2RDWWBgQl5iVUJPPVR4bV9kMFJoe05wfSUxZVZIN3tzZXB7T2VJVCk5PgoremFCfCZYNDB7
KXdNcEBrMjZsYXRfOFcofTlASFQmSHZ3Uy04KHtYVTxuPVQpMyl6ZGIpU3Z+P21fOXhYKnc0eihU
Cit6XmprTz5efXE1ak9iSmhfSShsTXJxR3d9aEtQY1FGMDx8dF9UXzc+TUlkQmdDXiRsK2tYNEVm
fVZ8Mml8UnEhdlgKK3pFZFRQe2BLTyNXS2R7fDRnM0JSUWs9N3ded3wpSk8+TDIhfV47YGF9SDZK
WWEoWFJWKCpjQTVYfDViZnwtZD9NfAorelpodzA3ZGslbH1LV1Q0fio4WG9ySmBfI3Y5VFIhTj8p
NGFiWUVmUmt5M2xVIzRvcU4wQFdAfCp2SFctS3tvbUFnCit6Y0QodlRkcXF7QkxKXzxDQEJnSHx8
RipIbXw1Xld2YFNoY2BhcHZkJE5QcHMmRlFaTD1JeyFQJXxLR14oeFBPdEsKK3prWGg+Z2hYNFBJ
XjJmWHJoeVZPPXJ+ZEA0ZVVRfFNFNnF8NkpEcWNJRXpwflVnKUBCQUNvJEArOVlAfDNsPkpsMQor
enB2VGErT2g5PF4lQXJVUl8/JWZqIVp3ZWB8Ml8lfm9EPHJBJGpXQGdEQiVWOGk7YlJAZEBBOWEx
JDhMdyNAPy09Cit6UnhrV2J1YXU5N2RtN3RidyhORm4tZG5WdDlFbX59OWd5bF9KLXY5UTBBZmww
VG80Visqd0ZUPj0kRnVUWSU8X1gKK3paKk5QZV48Oy1WaUlvQGNJWCspbShQP2xXRThMKjFfbiZ9
Q1l8LTYrSGlefEB7VmFja3RzR0J5ODx0NyVsfHtZRQoremlydlEySCN1dXRedU4mdSUxeXtIVy17
YUdMKFgoR2ooK1FaVnhSdHtAYzg9dFFSKTlkYDNLcWlyMGB9WGF5JEEwCit6M1ZuRlkwUUlEQDFP
ZFhtbm1GRjRwOXMlPSYxb1JIVSRKTzJvdFI/O1o3KH0zMnd8QC01NCQ5OV94OFhXLUp2UmwKK3pL
ZEx5PSFyV2Q1eG5kXmxYQzNFb0AtbEEoQjsrRWRHUmBsXjV0WndaSD9YPHc8TUtNVXl0Pn5YIUVQ
TlZGfj8jIworem9VcyVAYl59Iyo5IXs+TjxNSXxTTlchfXcpUWBKTShROGdeSkl2fT1VdFhMNGM+
TlQzSmMreWpfayhmdytob3JGCit6TC1yblV4KERxKjNMYSV5Zyp2dml1PSZHbkUhSXRAP0YmZTte
KSghPTlVVnZ6XiombVVZbHgheUJKRGV6KVpQVyEKK3pfPHt2VDFFPDFjPFc7PFVzbkZ0cVNJNTM3
TTl0NE5MNHUpQzg2SlB7TE5lQkFUbil5IUZaV1RvUVludlBwPTtRdAorej01UihXOXs4bztaZUk+
PyliUzhiO2dyTCRYfjRBRXoofU4jNztZMXBCdTNhb0V7UVgzTE03cH5pQWZ+I1pESjtnCit6KEth
IV50JmhjYjBNNkNNIzZrXzY/PW1MN0M4VT4qelV1fGtSfWViVDU3KXtId1leMmttfVZafUMxeDEh
WiQjN2IKK3p6NmZrRXBUekpxd3hGZihLU1NRdUQ0blVrNVpRWU93UndkO2ZPLVUhU1NEdG9rKVJ0
djh+dl5ENSlyb3tzWjl+NworenlaeEo+X2I0I1J2eWs2N187MGA9XlhjTG9idSM/emQzVjZ5ejhZ
UTdvbkNsLVA0YWhHKU8oREZIP2JBaF4pYDZFCit6KDxiKXVNWjlxe2pfaXohMnRNYms1OG5Fc3BR
dl5SPV49WkRadVIkVmxlKlMlLWhIPSZ8SmhKQElHbUEoYURFM3oKK3pfZVoxbTJEb194PTc4NGFR
djhKdW1mfHchPiU2ejYkcmt+XmNGck00TEBEbUhQRTl7cSYpZmNhQjZYbWJFfXZyTQorejh5V1FX
TT57MHtVNjU4T2JeP3JANUghTHc4MiQjfj9zWUhKezN9Q2dNdkxrI2N8KzAzYihmK0NkT153QUZs
O0xzCit6QyEqYERhVER+dWo+O3RlVSlWRjIhKWlrNXUoXns9VXdlSmJFfkQxM2IrKl55QWU5e097
YWZJbDAldXpCeztqb00KK3p7PHYkSzZsPHsxUGN3YmBRMH0mOHNvRXojPzFyYTl4WWtZPXVPJnso
LXQ1QzgqSTM+X0EydmJ4WXMyeUtQWSh7MQorelk2fi1sRHZgQFF4U05eMTg5T35TSH5fTnUqKVkx
K05hP2cmeTkkdnYkdFl9dVBJKV96IShWTkVBJFFaMVRXWVpoCit6aEk2Ymp5dnt3O1E7P2dPNWpZ
eUEhT0dBQlRfRG5fZEZ6IVdOSDhYeyo/Kmo+ZVBMb31TJVByRmtkLWl1PEZ4T00KK3prSStMWG40
OF97bT94aHtqUFc4ZDlBWVQ5YlJ4Jk49PTFeN3hWLU9gNWRSYTYjXlg+dSs/dnBfNktyc047YyE4
RAorenQ9fm9FaUB1VGElWHpYQWBVMDc4QFJxa0JAR2JVei1iUTx8Xkw3fTU+a3RnSmR3UEs8Smgo
SE1UWjskOE1wS01+Cit6KG83T3JLMEw4MGhVMGB1PTtaJFBDakNjUE4xIXVpOSVSWmVQWCljUlBe
XlVnWnNnNXYhZnd1THAoblUyNm5QU1AKK3pYZm9UZVZIY0MoTWxLR09UTHlgIT9LQkFxJj4wRitE
dkRrKTFvdHRTN19IfWFmMEE8WkQtYzBaLVdOKSFrUFA2aworeiFeaFhpaWhXdyFJQmdmTmtIQnRH
NChOfFZOMWQoUWZyRCpuKUYzNH45TTVRUllZPlotbj09dHNhcmRRfGc2fHE8Cit6STJ9QFhGbzBE
UEhZan0yOGpvLUFlazFYN3d2JXNzXjx1NzIje25nciN0P1MjN0coSFhVeTJmYmkyYnd+SjxVVT0K
K3o2eGAjOV9XOF5GMT15OHheelZWayl4MzkkdzdyMn1SbkdfTlFtanhaaV5wTmpBbmwtVUJyYWVw
aV5zckxwbGVRaQorejBBX2hgOEBEZmJnbEFyV0toYCtuWHZUcmVFfjdWQV5KPU1xI1FVKC16PzVl
KVdke0RSe1leZDI9QyZzO3J4amBNCit6d0pvVkxQNjJtaD5fWDR7Wnl9dCYwSW9kKChkTTxOdmI9
Nm9mcFZMSHlyVzhQPkp1JH5JSmtkK2E/NGlHd0xPWUwKK3omQ3NIYV9feTk7Y0l8SHc/WEpXMGw1
aEdjRiR9XjxZV3UkMVVpd0RQJlBifXNGbiZldmBtYFZHbG9pOUV3MGpEIworel8yZFY3RyRueDli
c2x2amBYS048K3Qxdy0mMXllUHNDZmJZU25iRWk9S1l+MFc3fUozS2FjZFZwPT5zRyNxJk5DCit6
WFROX1Ngay1OcUp7MmNqODt3UDg7Qz9rbnU2WjhyUzdkTD8tZUc+cnp6KnxzSmRFbEYldEstJCgp
eyV8d2trKzkKK3pwfW9PQXRZdlRCZy1AZnNIQVpYM0FzTmlMbmhzWDlRNW5BSVkra1poa2RmKCZg
WjctUD41cGR3NSM9eUt3YEpyNAoreiRsaTxfKW07QktTeDBldlVtQk41UGVMSVp7WE5Ib0o4PlRm
K0tud1Z8MWlyYHVLOStoUWkoaC1sLXw0Y1c/MDNzCit6VnlrU2dhU29vYWo7fDl0MTdWeUNEZDkw
bGg8KEpJRllYJkNqUnw4Ynt5Rkd1a0BoMUQ5Nlp+bmZZTmlvT0shQT8KK3pEYU50NTFHTlN6STZR
ZTYqY1dzI2NXNG5UUThmODE4NGcpZzktaEVRJkpsUXchXzd1Knw1X15waDkhS3BPKm4yPworemls
SXVgWEY9NmBKYnZfSHR+aTBDQkNeY35mdjVRUlRBZFEreW8mbzJPOXheOyRXWm4xKnQ4bSpqLTRs
cnUweGZaCit6ZT8lO0hXTlBsRTNnOCVTYmViNUtGaDxGe1pvI243d3BnNWMtWk1WSXAmWEtgT3pK
VSQtbTYkN2M1cEBqQERFVisKK3peSEs3NmwjSFgqe1YySkNDMkxTKjZ2QC1HXkhKbWpDPSR9VSRi
KVVATG0mV0F3czh7KmhTPmFyWH5qXnBILUthfgorek55JFdZeFl+K2NFaFkyfU9UIVRlSDxOMHlK
QkRzb01+PSR5X3d3Y0teMl4zNHUtZSN6JXMyXzBzcm16PTt+bjtNCit6OEZNZSVLLUY9VyhDK2NW
JktycDR1PUIjQkYlWDQ8Qz1wSD9Ge1dENDwtWHt8MUYtcXNZej8jN3ZRKmUmJlArbDkKK3pfVzA0
Z1BhfDcqYHJULUJfWGJAJDdCP01CO00waVBQVmxTNk5pZEZld24ySDYkaGohVFlOPygpamtQO0VW
PVRzdgorej5LWERuYSs/b3oqTjVBKlZRQSg5eFlQKGFyIXJpSnUkaEEpaX1LZWJ2M342PERxeytq
RzBDYGdFMU5oempvSmQwCit6O1h3VlZZa2JHajh8UkJ1Pnx0NERsXyNKfGx4T0tVaiklPkQlK3N9
aHVkTWpSPT1jWmY5ZEQoeF9WY3pBPV96ZFAKK3pGWFNNfV96O0xDSSMhPSN6RHR1KDAjSTFEPygp
UVhMZmRRRWc5OClDN2lrfEFYPlk+Xk55R2EmdXdkX2tDOyNRKQorejIzNDwyUVgrSEZERnltcEg/
WGFHUDhIKGwxe0grJWRJfnp7OyNBdGlISWluWXU8U0RLaEIxSCNVfkt6bVhYbThMCit6Rn56MX5f
STBSO1pJNCo7UTIoPCo/Pjh0NnMoSjQhbCZ3VkdLfUJRcWJGKk9LWihqKzdpISZ9ZjNpUjhUdkdT
PEEKK3o5JlpRZmlNMVNSK3syVFZAUWFBWS1QSzN7e3Nodjg9aXJJPUZJZXVYN0d3JD5aUVZBYGB4
NFdHTT9HcUA4djQzaworelVEVWBwdGRAbz89SUh4VzRQQlFjMV5RWGBzeE9qcU49a3hnWD5vRkh5
YSgkS1RMNnhocXJyQ0xqbGI9OytXanFGCit6RGw/QTc5fUxjdWtuNUB2WUB5Pz5FNHI8Rlp5dSZ8
WV8jeCVQUUtCVipRQTYkTE0qaUZGQ2wyeEZ5dThpMDEhUEUKK3pUdVpeZy1ydz5abzA0aFdpTFVz
OXtIK0ZlbkFsczhjMnhzbiZDXktSX1RDbT9fNztsZDRKMFlsOG9HQiFseURtfAorelNlcTglREc7
RVNkbFB0X1FVdEwqdV99bW9DSHkldWRidlpmcyFxXnYzd2pGWmRPYG1+KENOME10d1VfM0BHYkxr
Cit6O0RVZU51e3tPRTgyeDU4eipoNW80NEdaVnZRP0RRZlhsY35mZnVJWHh0YGhPWih4NjMmM25I
KFVEZSo+PnB9RT8KK3psaG5iVnNHZVFNSyYqeyVBKVcoXl91blNOLVA7eTtaJmZqaUtRJmdiOGEr
Uzclb0oxKjV4Qm44QVlyS2JrRiNDeworejlyOEhePXMjP2dnYShePyM4fmMxbWsyPSpVNWkocEJ0
c1ZJdFRXSnA7Rjw8dGtqbGdPeVEtS3V7fj5iMVomLVU2Cit6RnlySEdxUypEVFFXKktMaHp2Nmk/
eVdRb08yRE0lPHNaQWVKcS0hfHpnUkQtSlNafSolMGYwSkc2VlN2N1BXRyMKK3pkKHstPVJsKmEy
dFVWay0hO2dlUWlHeUZ+THg8QkAmamBlPkpRVDYhS1FZPVpKNlJCRkUlRzAyVTk4V3l4YXphMgor
em0xJWsrYiRNTTs9JSE0TWEmcklAVDYtaTVLMUwpYCFsZ2h+UTZ0MT5ZcjZWbEUhVz0wcDNtNjZS
ciFMPTIyXkhfCit6ZlhiPGp0JT5NQl45MkMwXiNJbX4pX0VzKEU2fFJFUio4SGc3dGAoMnp3bml0
MyteMDxaWWM9OSZmJCpubXxWM1YKK3piVFhFKD12UjBXcj1ZSXZFZ3xuVHEpWVQ0cU5nckswUTJ9
PEJvaXxATzhOPlRBP09gME8zTGpuPXxtKjRFKGYhSworemZ3Mk8tUnNsSlYwdi18dG9HSj05Z143
UXlMdjU8QUY5JVBvKU1NckdJUHpTTEpnUjB8eDN8N0JwNTBHIXFifm15Cit6Uz5Ye01xcFQyMygo
azY+KHJkRGUlVyVnWVomfGB8PTZwJmFial8hI1cmfGQzYXxJeVFvdE92bylNK1JPUWtiLWcKK3pk
VnBLN1ZAWWU8amJUPz8wPVk9QXM1TDUpIVJRMD9XSEkoZGl1VVV1TmM2YD5iZnI8Y2Z9SkEjS05A
QFglT0NMaAorekdPXkErczhpQWE7RH4zZj1tc1ZINDtXRWpedHBeek01aW8tcFM5Q2lkSTFmcWpD
dnV+OVoxaj0mUkJ6WnRsJTU1Cit6IUB3bjh4RE4pOHZpTXk1PHE5PSYzNkF8I2VhdVclcEUha1U0
Sl5lYldUWGVabGFMLShlK2c/LSFhYX5ZeWFsaTAKK3pgI1k/QHp0UVNAZWdlZjhlTFNOREByQWx2
aSVkfEUxeFUxZFdNQTlZO1Z9YGVnbmV0VUtYbHg8U2YzY0o+cFhEYQorenp9fVhEPmxTP3ojTHNW
TkVzYUxYLWdVdHNZQWI5fXFvV2h4QEA+XnhCKXMtMmN1KyZ6ZElZX3tWNWRVei0jfUtwCit6PTNi
PFkxVGRAJF5fKlUpbkdSPkMoUWhHYSQ+MWl1MVgteEhFNFRBTSpOYV5YKyooJG56OC1qUGpqaE05
V15LeXYKK3pPanErWjEkTHtZaEBRe2ByYEY5TCV4dmV1KT9iZFotUCtPNj8rPyY2b2FOYmtndHVV
ZHN9Tk5gaVVgaUtnP2pRVworejswcTB9MGJWPX5YUyNTKj1iJWQ/TWc9Vj9vWWhOUyFQQiFvPTxV
YXI2aWgwKE9ve0xmO0dubjk0RkNkMTEtJUkoCit6a1BgR0IkfFVnMyY7c1pPPUQzUylxKGsoQlp9
N0xxXlJLZDswV1Y8cEJJdGVwZE0xcCNEYXUpSTVweDh3MGxRSSUKK3okcnI+PDY2Z3BlbDB5MG9U
YW1eP2QtWDl7Z1pRWnN1YXdSenI9VXR6emZweCEmcH5sJl5wJVdPPXoqU0VpWHoweQoreiNUYlZa
Y2YxZiNzMUs8R00kenZ6P3pAcXEtIzh8KzExflYmYmklPTY9TmBlcV4xZyFkWmxiKTsjbiQ2Qmth
dDF0Cit6N3psaWVocFc3RnpGeSs3eHI3KDZBTlJAZUF9eUZMKWE0SlpnWDdBWktyNl47R2BaSXZh
YFVORT12Y3pTQGElYncKK3pEfjRVaG1vTT9zLTQheSQqbFIoVDctejZNcU55cF5ffkcje1BURkB0
cytXTkA3UWx6cG0oVm9lJW9FMjljb1BZSAorej5HQzlxOU0oZm9SdE4jPWZoPVBuN0JrJEI8cH1O
Q3JjeHJqNURBbVBmcWFtQTYtSnBUTnR9MTBeM1pxZXskZG97Cit6SEolR3JwTTVyM3lDTn42SGYj
Oz5tMW87T1JTUmRsaXRPY013MjNgMnl3fGNVQzQyLWR5Ql8lbSFlV3FqTFFHPEsKK3pfYUg4Qksh
YT5rYTA9cml6eF9zPTZKJWJ6Mjh2azdXZUdgRGtKUiEoQk09KlR2PGdiKDRgaGlBYnRzV3BEZHYp
VgorejxRT3ZfIy1wbStjJGpPRHY8X0ZZJmlmVVUpTXVFQHhMPCRgNmY7PiZfZzRHVygyYVpfb1BI
RD52QUlJY3l2KHMwCit6JTR4NVhDWlQpQU10dnZYI1I7KSZWKXVtUFJUQG1jQGoxTE9KQHc2NyhI
cm4hWmJVS3F0OGAkcHd9P3J7eE5TUloKK3pabj55MTJwQyMmMT1ofkdfZitLSTNtTklTPnQ/KzZK
fGR0OztwZnF9VkItQDshWXprWWN3ZjB+cDgjYE0yVWlLMQoreiR7byRIc2ZCcyg3SEk4LStJdmR2
UndoX3ZLRFZ4Jm8ydHhtNmE7VjA/P0xhXjlFbGkwdEhHfWx7djkjNjhVO19iCit6TUo9NnglZTJ2
Y2koeUpXViM2RTFJYUt3bWdaYH5DWTFOXnhTTWVRVkdNMCllaWFaPDVHKDNnQjF9PS1Ce2N1SzsK
K3pjU0JleClmVXolRkdHP2NgRVJ2MmY7WFEtN2cmNT85T0U0cFlYQlNiWVMxR3A8OFdXLUdjeV5Y
bV9NTkVaKlZUdgorelEocHRTYz5WU0JGQ284QU0xbW1qKmolOUJJOSQpRU1IMXROdWFNeCR1NnBj
fHM7NT5XNjVOZiZ3S2hHRj5wditRCit6R3loMG5RbExMeGJIWCkqQnEmIytAbXYpcDRocklpYkpB
PkYhd1FTSyVDb2drKVIpZnNkYjdVJVVHVzckU1F7bCQKK3o0KnslNzJZKkc7RD9RfX0rQm5IUDNZ
dUE3WFkyY0U7XlNZaXBGIV9WTkNxOXoxNFdxNiF4XnlVNk8reTRZN1heQQorel5IZ2tjKEI0TTlu
fn1sRDcpTCZuLSQyO1gzX1dLUiFhXmFgPSZBYGAxIW83SkRBN2lBNUw5MyM5PVBPdGZGMikwCit6
bDUqUV8xZmVhXjhMZ3ZtYTZfWVVvY1B8Tm9fWkZGKGRGU1IqeWFKJmJSZnVSVkx9NHpDYE1MM3R9
Tm5aNT9zdGAKK3omZD0pWGBIOFhPU35BKHBDfXdJdjRWZUFmeHlKeXMoTVZTdGNPX34yS2BpPkZR
PDA9YUtTKzUwOFgwZHlNaX1NLQoreiE0ektDUD5NRGRfSztza01yPURwbFEqPUIjQG5NVEhoYU48
ejYhJnNtZGR2eDtaLUhyZjlsfmVPRFF8dCYkKTNECit6bHpTcXB3JU56YGdGcCMpJFFVd0pGbHRU
Xyo4dko0bmBtbTBwRUImWCZPOTY8QG5JWFEzZ2h0c1pXZHJYcmc2aEcKK3pqVXZPJms4JGp+JE5A
N3VCSXZ6Ozk9WilSKXJlaCUpSTx+I3NQZnJXVilwPj10bFB0OHVXezFkQjNzfVolbj5pdAorelNh
WEUtSVhiamllZ0d0WSppa2R6MVktQXs9cjRCUVpSYk82SUV3Y3h4QTlHNTQwQTtyZnE7MTtqRUd1
I1BldV5BCit6Rj05XnVLbFg/ZnJ4eDVXI1hqMyE8MTtefEtkbktOYjVLPVYqeDNJSnl0fk1BQE8t
VlE3TCE9Y0VeNlJOUiomdFIKK3peakhAZlhJRytWWk4xNGFzTXZOe188e0J8LWNJO34rfUVRR0xu
aHF6PWwmbUZ6SmJJSkApMHdVaHtycDhlUX42QworekByYGM9PGJDRHVySFZiSHl+fE5QX0tYeUAy
ZVBYQVo1aG1nSWpmSSNVNik1SXRjWFZ8WiN7ZF5gI3YkaEd8cGxuCit6PXNodDQwVmBxSlY3d3lf
QjJuUiZjQ2QjJHBiOFhzY1oxJCtFNzczPm1uUjR1RlFkXlR4PT0oIy1iUXxYJHAtd3oKK3pSUShp
b2JEKEpVZDY4IzU/aT5QdlVTTSp2cmU4NWJhfXNfNDxeZWtiOyomeXJIeVVsVEokUzJhXiF5Xjl2
Ukg9fgorejU1M0laN1dEb05nQFgwQEBYJGx2YCN+ZnNrdDsjaTlWZyFXU0hoUDd2OS1SMGR9LVZE
KVQ8RCU2bkBsSUM+bXpXCit6azZ4IypXMWZXTXVwPVJGNWV4S1JoKjVMfXZtcC1yblEwPEFBOW0+
eXBpLWIhZD9UJVV8M31wcXJnSnMxVlVBVTkKK3pmMGk0YTxUMXh0PD1YYnpOVk14fmQmVzJsS15W
MCM4cCNvcCUhKjtVPyF4e18qWGA9eGl9RSZPaDRFSUFhXyo8PAoreiROYHI/Umg2NU1WdDMlQ3A2
OyNTVUpJQCM8MHh0SSlpQUJyJjBNJWZ4WGd6Oyp0WX1YdntaWUMydz5heVcoSzBlCit6aWAyJkxK
Jll1SENNcytnMyZIbWdffFdDdSl1ZVcqZ1BYMFUhI20hRzV1QERJel9waDAhbi1VbWF1JityTlch
Yl8KK3pkJTVFaDgzSkg2SFV6K3FOI0QkM3B1ZWFXNEQ9Tk5GZCNEITlyWF58WUBDR0U1Ym0xPlMh
TGN3YjgleFFgR0d8VQorek1+N2RHYFN2NEdULTVoLTNWPENYWHk+dENpenp2VE9WeSNxRyZTJHp6
eiZHNkZFKUJxWk84fX5nbCFMTzxhKT1XCit6QWRJLWxKK2srIyN3XmBedTJjOSkyVmIzT0QqU30m
ajB2QiM8SG1NWW8hVHJ1aWk5Pk5Ad1JxNVlVb2p2KkFqU2QKK3o5Q3c+PWMhME5OPW9kamtjTTNz
YEdLezQjSCkxRHI5cVFBOEQmWndhaTA+PWgjOCY5Wj8qKWFnOWk0PWFgQlprYworelQ+PHtqan4y
PzFUK3Y9IXJ7ITFlR0B9U05OKWdhNk4tNF93Kns4TU9xPGo2Pz08cWtpYCt3X2RqYDhWNU5reE8t
Cit6X3UrKmdJdnAyYkA4JUYrLW5CYH1VRCZ5OU8hTVdmX2kwVzM8QVFsOz96dFgrOH1IOEZoaksr
RmMqKE51YWx0b0YKK3paMTRpZzsqbEh7cTJEfW52bXlEQHojd2pZPEY8QmRrS2xwP0xrYiomR3Fp
LTNIaGhgRU5ESXpTbFc9QCVUX3lHZQoremVzWEwpdTN3IStrO0x3UjdlRmNJNTg+citJNGBINzRG
M1FhLVIrNlM2RUM1TUhNd2FhYzRXRElCVzVnZkNQSyNiCit6PXpOUSQmbmNFRVo3YUxSZ1Y7fkMq
NE5sVyNwKFhaNUdlJXdKRXw/djQmY3IzPn1eSE8mQilvPWJfKD9aTSsoe3cKK3pCX2JANXhRUmd2
V15DTXYqNShiXmlGUlZZQTk7Q0MwTC11LUh2e3pQOEMoNGo7MTktSW0/bHcoNjVoZzhkZ3wqKQor
elJUUTByRlcmWFo8WDU3P1hiSDZSJkFFN3lhS0FjdW9pRmM0Q0IkPCtvSHdvTmgzOUppO25BeWlR
WUN2b2J9c05KCit6XldqQkZSaHlTdFNXQk5hKkFaVmN4QkpZJTk0JX1gNUUoPyhjeX4ocE5+X1pX
dl57RDJsaXF6NS1ObzA7PS0jVkcKK3pQeDBqcSQ1aiY4JU9kUl5wMTVMYC1hKV9nWXZFeDcqV05Z
dUolUVBobzFONFRkYGZCJF81fU9qclRwSDtTQlQregorekJFOHs4X2M2elVFOE1UeGtSfnFXYzJ7
N29XSFFAK2d9akdCVjJSMnRKY1NtQVc2QEx9Kzt3fThCPWwzUkYxT3pWCit6IyFDfHlWKnEheWND
RzhaI2VtVlgzQ01gYz83UF95Y25RSUplTGMhR2JhWClyaiFmakVQPVRzcmB9LV43U1dkfVUKK3o9
cCteQz1jVWx4ZUM1O0FqamgtYUxqT3VnaHBvOEpVfT5OeHVmdGQoOCNYdUZyY2g2R0AyV1o3QD40
PilnK1ZJegoremg7SSM4QTBeU3s9Zk0mYFhhKCh7OGN7IVBLO2U4bzFgaTNBX3lNKkItIzxoQk5N
JElZWWZ1Zz87P15SKCMyWjIyCit6Qm1kcHdKVUArJWp2OTtgRUlpQTw1NFZ9eTk8fCVPX0VmU0or
S31zelhBLW5JQ2VRM2BYdnJDdFdNLWxYWShGVHAKK3pSVWZ0MCp4M2RxYm5tWCYmWCM9MldhODVj
X1AxNW1XNWZeRzRHR1JgSmgmI2wma14hJiNsamtMelpLY207LTYmOQorejdrKERyfERaWE41OWhr
dTdYOS1tMWRXUypGSEwrYzRZc0ktM3JgJjJITTE9K0FAbTZ8NXIkLU5ZZTQ5JFBzaHVKCit6VzNz
PT8tZjtucElPRSFtditPOUc5KHErdHM7M1JSJl5YMSQ5Uzk/VXRHfXJHR31KZCU/fmkqTVVtMyUy
NTImbEoKK3p0Iz49ZD5WNDlTYVB4el4qZVMtPktjWilQJSpOU2U1M0NiP0Jaby1IVUh1VGBeV0hV
MWBUUmBBb2JteSk7KGtNPgorem5ne252aTQrVWQ9PEpnMl9kIUt9SlZ9V0tHVEpfYXtHMGBlV3Va
Nl9ocmt5aihjRzJCRjwqJDVPYX4+cD5AQk95Cit6TW1ib2pVVHdZVVUtYyp5VzBrZU9TKF4/biYy
T096NzlHMD5XMkhQN0RhRHBRe0NWJXNTOWlDcnJvaDNGKmhJR1YKK3olKnhsN2BGZip5VUdgUHIo
ME9DYEJaJVQySGRSRVI0dnFYNmtycDVTPUtrVkFSeyNAbl8zdXlhMTVkJkk8MC1pQgorei01PDdi
WDJCYD5HWG9nYTsrRUBMdXhJbHQ5REx+S04tKm51cFlUN2V8SDZOe1BrVCFja31iKiReMDY+JCFM
aDEtCit6T0QlIzBydiYtbnQkKUdHPjRGI1E8ekJ+cVE4eiMweVZJZWNHOUNVcmJjbEVRNGA4YDNg
UkEkSHdeKm98LT1HR34KK3pTZT1TMCleTHpQcXA/aXUzKEU7cHB+SCEzTlF+WW93cFpVRF8tNURr
PmlkbW0qWUBpQm0+PzNna0Zta3BtQGo+LQoremhQTCg/eWo5aCkwPmU2QnhVfipBNFNrbnM/UTxL
WUM4JmhvSCleJiNXYjYkcnBNfXs4YjtBPV4pT0JzXmpFNWhsCit6eWZGKU9gPipfYkwyUzsmUmdt
IW8rOCh9UHk2QzYqRncxYWRvPHBsdD9Uel94Y15wazFnSlhWbVdiKGE/KVYpamIKK3oyd2JxYjQo
O3JBMFRwYTQzbS1IXjFtRlQ1JTBNJmBaXntpMTNNVjE+NDFvNnNUX2ozTEsxYkJWdU5TSGVpRyt6
aworekhRSng9aCh+Ynxqfmo8ejNWRTdDKyhQM3w0Z0p1ZTQmSndAYVJaMSh2JlV9clMrI2p8SS0/
NDttelV3dTlBWHI7Cit6RChMLVdLRjJYV0QpJFpwTjxfaH5gazMkeno3I2hJaCFYeDFQNE1ZWXUo
akNsPzNXU1Rqfjlsbj9UeC12Und6Nn0KK3pPLWY9OElLdUJATV5qSiE3Pmk2X15vQklQel8pbEhu
OE9RcSVGUHshMys8Q3BKYGl7Zm08S0ZGZHErSl8rPDVIKQorem1HP207P201YSRBdWpmQDw/bXNV
cXBgel9NWlEtRyhuangwPGleMig3ZntVQGBZMyZvQytLfmZPS20wTTBud2VsCit6cDZRI3dvXyFj
dWluY1h9Qzs9Mko+RTNJfHMkTXo/dWFlPSpQe2t8KS0+fWw8a3FHSWpVZEJmTSZpYFZBYnh5KncK
K3pmU3BGKWk+eGtmSGx8fUVkODlsUiQhPERDbGgwd01vSFlGOT56JXBxZlV4T2JEIUEkKWkwPj8t
MCEjJEctX0kyPgorejElZ25KTiNjMjxJT0heYmRaNHAmcjJIZE5EMGVLIUElVUt9NHFeSjw9WVZm
PyVzaH0zY25eP1JPdEVXPnpmZl5QCit6R0srJEgpZFIxTlpSIzJuY3hfOUdNQTJueHZ+MjYtbXta
akM5UytmWGR4YVBxMUE/dVNKKSQzUXlGRE1RcWVmWk8KK3o3fDAyRkE3VG9CZX0xWClvPHtXNUE9
O2FNekVnNXEmPkxiQHBiWCFDX3w3YllhPmVGdmsjLSVeYGpkRU8lWEtvbworejZOSjxfVmRwTXoo
M158JChTN3RRZ1dqYlU2SGtDKEQ8MmYjaUs1PWVrdzA9OTBNdFE2UTZqJj9YJHlINUFodzVwCit6
WnFSIXpsTkh1UnN2cnwzezFxYXRiSVBTX3hXPE43aTxwNFZJO3ZmS0ZuV2V7KG1NTktHfkdJYHoy
cVFOMzVPMkUKK3o8XiR8SnZrUCQ1Z2t2TX1KdlBzRWA4e20qaCspdnRxWihnfVBNbio5M2tDSyMh
azZ4bS1YX1pIb1dudS04Xyk4JgoremVmbGVzOzRIR3dtdmpaSyY7N2k3S21EJDZGITFvNXwwYml+
VFI4ajl7dGx4UkJNMDF3fDJUXjk+KlMqOEZjKjJGCit6O2cxQk1WTGJWSGN7IXY4ciVlZ0pnUHR+
d214VCRlQzFMOXdEdHFTKFkpUFdXcTVUKHZ8Sl9kKENgKzI/QElMfWcKK3pFN1g0R2NqUzVaciFU
X1Zufm1RYipTUDw8KDdKQEE8Wih6SFkwJlBiNE5AWEdsdDk8MHR0V0luVDJyV30/aGB2KAorej0p
KXxieC19fUAkbDFxKDJsMFV+ek4pVztaLWRVYDE4RmNiTTxjYChwQThXeWx5RlowVUB1bTVxcHxL
akl1PVhWCit6KzFPaTNOSEQmQm9YcnNjXzhKUjwzO0p+cV4oWFFJOVNqYzcqamdXOzI7bjYrOCla
dipBcS1tTEwhcEpiUE1lNGUKK3pzN20tSiY+YDwmdTxEcnl5VS1IPiR6UUJTbWpxRHs/I2Z3KT50
cG0zWnI8bFl7N3M9JSRtYEp+T09lMnpVWn41NQoremlGUCpsYClOMlFyMTRzYFUmPT0qejNBXzBx
MzRqQysjTFQ5X1dsbk5SNSUwWCZHY2NUd3xoUnFFKU4jLUZsOTFlCit6cF5VWW5nfnN+ViNtM1BK
S2BHKHdTU31iQi1iPkFATiVNYCZAbEFzVHVfQnUjT29mdkZQPC1tQDQ0X1MrMjlUMloKK3ozVVk4
aV5kUzhtbG1PLXxnRCttQ1g5cEF3NSo+ajRObF93Y1ZwKT1OYEw9RyZKUE5YO1QwJVJpbmImV0VI
dlRNagorejFQakc8cUo7a2ZHd00pdUV5XythP3UxNmBCOGNoMktZO3IpN2VGKWdAbVdyPlZmUEQo
Qk1vP3w3MXVea3RUX1VTCit6eThKaEJvKiNYY2hUMTVlM2BXdHAlT0hsNEA9TW8zMD1JdChlbF9f
P2d3MXltTTA7PCooKT9CYXIqQDJWSk48bC0KK3p7KDdYTEV3OUU/XmF9PSFTNHlWPmtBUEhnN2Ni
d1E1aWs+PW4qVjlyeTZKTEBsVmU1NmVlOUFHQGY1e3FKS1k9UAorek9ZOTZnez50Tl9QcFNxPWNg
WXwzWTRTUz1ZM3J+PyRDTFooQmp3aStRZn1XKEwyVUo0RnBtVkE1Uz9+OU1TOCYhCit6YGNzV01Q
U0h5OG0zeHsoOWJVWUI3JjRDUmBBZXUzeDl8OEo8PSRXY2klMHFSRGZCQWphYVVxSyE3P3BHOD0t
X30KK3pxcDctbDBWPCYjSXNrPzJifXIwXkkld0V+TkdLY3RUVHlycz1zbjJPb3tlQ0RFNUorYjUr
MWVIVDN2bDRuZ3lOYgorelluWihlRVElSDtyWWtFJTlCejFCPlZjKipIQkJgMHMtZjApYj9ecG04
N3VIOytKcE59RTdFPykqRVB7I2pLUXxsCit6Pyh0RW15Xm1hJVZBe2pDKXl+Nyhxc2NRU3lyb3Z7
NDE4YWR4Mz94YWNvVTRrcC11U01MRy0pP3lseSZCKXVYfi0KK3okRyZmYSZvWGc/dWVLT0F7NGpp
R1dAaSh8I15BbChfVDhGZD98RmtwejZDRXEtQSFBZWdnQE5GazZKQ2s3S1g+PAoremYzVSVwaXpj
NTIkUSZhaTFedEo8QGpVdkEkclFGd1EkNilWWStTNURRelQ9Sjh1S1VtVlRfS0hLU1BYaWA7b30z
Cit6JD9xYTtfS3VZa154Z3kteTB7KSVaMjIpVHczMnhgSUhnQE4jQHtXdjkqZjM7dDc3KGw3YjxD
SE1VKXpidlRCZEsKK3p5QFJQVWtjNX5pWl9tVSRrbGkzUzUoamY7Q2hELTsxN1lITnVNJSRMOTIz
TUpOQmAzU0pRUj92Mmo9ZyVuZ0AmTQorektMKCQ7I0A+UHlJTlZ8c3Z5ZiFvRHI5ODRWNW0/cz1M
NHpoKS1JVGpaMGw+MSMjN2luI0otMklAR2d2b0VGOGZzCit6eykwe1VTJHZvOWV2QiNleytOQnla
eTBYTy1fN3k8NDYwT2FlLT8jbUA8UnhsXig7VD1vbDh+PF5fcENgMWRzKDUKK3pCVWdNM3lRSDt1
RkdqM0dfZUQjb3F7amNAVngofWVrdGQlXzktPkRKOSohanMzVzgjVkt8V2g+Rj0/ZFNpKW41Kgor
ekF1Q05qZlE8fERPOVo+QDhQLWp9KDlkbF4lfDZJKHR2aDJmejYwbVM+fkVnanF9TmtTJkYxTXM3
LTdoaS1BIVlrCit6NFJpVWs+NFdrWkJrelFkbCNCbnwmUngoSE8hRiYwIVhnTTNselU3aWtnc0w2
dCFadVRJXms1OXVjTDBlcE9ORVUKK3o8Y043OEx5KkhePnUqTn1PZ09rVDQ3Wm0kNUM1O3o8Z1Fm
QXt8a0R6VldwNHBALW9VNGNoWVBKJX05OUY+Nk85JQorekx0Q3g4WGE+JkR5WnRwS3ZYbjlYel9S
aEtFOU5HfG4zdGpDRjhTZFZESTtrLXk0aGEoQCQ0UTt6Z0o9RXlPKTBFCit6I1h2MiZWdGdoVXVk
TmJ1WH1BWWsoN2lxfmV9JSsmVnxFISNRbWo0dFZLQG5tantQejheKTckVShFYnU3YXU+PUgKK3pt
JGtMaj1GOEVZaSROUDNAOEZqPipjSUdGaXBvRCtpWk4tflNuPU9fRmYhMEJWaipuKUBINWZ9dSFB
Yn1nbGtYeAoremRseCpxK1JiYjk3JWtYZTU/aGp2SERAPkBTQnpXWkdTbWZpWGh2biFoWWlOMEkm
ZWh1SnJ3PG40SzlUfWZiQ2cwCit6Z2Q2fnZBP0tuU0EpcUtPNjM/SGJIQ2VxczYmM2BJIX1ZfXFe
IW00M3lZKnhRM1JHNHMkbXJ3S2UmR348RlJuRTYKK3p4Yz56LWY7VUxXaH5veXlIPj8oU3hQZi0+
cTFmKyghdkNecnlCalFzKzUmZytmSTNZJDxAXkZ3aW1MVT9GIzchcworelckNjdmdSQ7YiNgI1Vf
Vm9SMmp4SzlaQVMlc1UmQVl+WVFvRFF9fTZ0TSo7U2B9ZEhtVStmUms4cUBBWFRyXzdpCit6K0pR
NjVuOTkkRnV3dEtzNnoxZjd3Mz09QzdIdz5uMmhYJj0xWWkhcjhWMHNoe3tQcn03eDFYNj4pfF5T
NShvO08KK3pzR3cwbnFZYXVVTksmT1QwK045Vm9STnYzZzVuKG8wV1lsLVc9TjxnZ09neFIkNyN7
Myl3Y2c/QEFtZSQ3bUVtcgorenhqK0ljOG8menw2fStHMHMyflVnNWMyLWstc2o5clBeKjM0fE16
fitfZEZsWkwqfEApX0dSdDApP1J6PHdieCNJCit6MjVsJCRjMl9AUVQybGEpSFJDdk0pRFVIQiMw
JTM7JX4/P2g7X2RhYTIqYnlSMVorX0JxVkgtUkhQb2Z7Wjxva3wKK3pgPTM8TCohfjBnVjxUcWpt
IUkpc3cmailaTDtSQ35geT9SNjFpaXc/UTBgb3pUeXBaVWlUcy0+cmVYbTlpbTV0dworeiRGWE17
YnV+UEpqKFhZTkJEblFYYS1pSHNpPH49MigwcEU8U2ltU247VDhMQUNeMXNHdDYqJWpad0RjJHZS
bUVwCit6WnI/OEkrZ3k2RCVXP2oxNS1fdSRrcj5lK09xe21vaT0kcWF2NW9jVFl4SX1SKGo2ZCtL
dX5XQFJESGN1bkRwYj0KK3poeippVG9LWSFOemxCWkdBQ1ExK1VnfTJuN21WUFclSkYtdDQ8dDtn
U2hJfXdBPTZnLXpjYG1Jd0F+SDJWMTROPgorejVGfCVAWE08fStRcXpAZkwlSih5fDhtO1R6MURl
TDR7anxGMU1tPGJUK1c2UTQ5eEpKOUo/ezhJcj5QS3FnT0cjCit6MlJKND1qXiFEfTFeZXJOQiM2
UCE0VFJhZDc1UDQrMHMwYDBsWnBIQGZ1QWoxdFM4NSt1R0p3WHEzVFlaTkEzNn0KK3pocGNNUGpH
fEJQa3Y8Rj1iczJySVQ0V2VMTEtEKTx6M1IofFF1KlNgelpaO1QmQDVNKFgzJClXRjdZcmVCPk1p
RworenpwQGVrRDZMe3hFbTM5KWtaPWo1ZWZFdSZrfi12N1h5PitkakB3cDN4QW5BcUAjUFFiKCQ8
aygrRn5DaUtUbTJ5Cit6Z2dse29SYzlheD9HeENjY2stMT90VztYIVlMcWBMZXN9YUN6RCMzbWV0
c1hze1MmMEFjYDdtREA2O2plKmdKSjUKK3pAb3pMQU1vITcqTEZxcHtfPk1ZVXE0fHp1Z1UzfHQh
NTQzTUAwI0FzKj4kV2cqPzNLeXlITEV7aURTSWd6VzVgcworej1nVFhKa05CbFBpTjdGaSN6JERa
O0VzMD1GUj5BfHlnOyRqKXlvazVhc25AUTNBMndxOSVuMjJoPHszVk5LXjZgCit6SzZ3ISo0diRZ
cEIpVXF6fDY8a1Vea2daZlQ/ZW15bEdqZnUzKCVWMURGMVg7YEdZXn5USyphLXxLQWpWbmYoazkK
K3puRTQ9a3o+MUk2YllQeihiYypMRUZje0BKJWdFYGohfWkpdSRJSC1COy1MTzEoVU94eEhjLXxC
Xn1mVEorUX1ldAorej92O0dwJVhGen4+YnxaYHtmJDlEUV5sJk8kPmR5NzNeVW1kNio+MXklVkdf
JUhfTk5eUU5LUGZ1Wmo8QD1nRUhoCit6cnl7ajdgblpgYDZyK15zemd2RV5lUil2Pms3cD8+R2wk
aTZmVHRrJTd5ZUtxVUsjZl97Kzd6ZiYkMmYmNVQrMSsKK3pZS24/S0hKPj1RVmByVzxXQGZaNlIl
JGJHekg8PFRLKyg7dT1MYDA3M0pfbX43JUxMTE58bW9ZWWZOcHJ7NC14KQorenAwQHBDI2E8OFNW
YGlRO2M0bjBROFdtSXtNJllsQVVtP1F1WXFTOHhwIXB9NjM1QVRhNmstVktzcnludmImSjJnCit6
S0tnUTR5Y2lGajlkUHAzbTtibDs5MDUoZzJBXk51ZWghN2R6V3VNcFhRVEJeJUt1dz4tYSE+IzFP
R1J0MlglYnwKK3pkVkRpfWY0QVlBQCUjVV57aGdNLTNxVzdIendAOE1eQj9WWmpaYHAqcHp6QE0h
dVpXQHw3K3ZsZTBqV35GTl95MgorenpFYjFnVHo8PXZIOzJvZ3xFVD4tdSFWbWl6U0Y8d2tJayt1
SVR1KmNeNihxTl5HKUwyZDxpe2Z2SHZMWHJleSFJCit6bWlAPXReIzBASGp8JmswUHQpVEleMzxi
OEluNjhpQG8pTz8jYG5TO0JvMX5lUipHJWJWTnlaYGF3RGctKnlvWGUKK3opIT04Q2ElOTNaZzNZ
M0c4b3x2aEJTZHAoYCl7Umg5RDVadkQ2cW5+TGpycF97fiZTdFZwKmBYV1gpJSl5QFEwMQorejgl
Zmt6LVExQDVWYT1eM2YjJU5vc14ldV49SzZHTFpad0lFenIpLTZ6cn1BOExEN0g4Wn52Uik/PD91
dTQmSl93Cit6LXI0eTBBTHNZKzBQcj5aNCpsVVo9enE0JFVFQSRWMyl3cUpsJSZ+Qll+LXMqZ1Zp
RXB0b3FoVVZZQEJEWWxgS3oKK3orOF5BZGAwZWJnKm9hXj9CaSF+Zk5ySGRMbjlTZU5mYFJAbW1w
aCtReGcrWnBZcEN7I0V0P3BlWnZUb2VYfT5DfgorentvaGJvKlk7PDh2SGdpJStNa3UoekNYTURa
MlcmTXtlU1I5YFI5IXZZbk8oZm83ZihYZmgld0Rpb0sjaTV8VnZXCit6JkZTSUZEZkYtcmw8ZnBU
WnFjNj1gcTAwS2smX3JFY3lhUGI2WnxQOCR2bWRAIz5NfDVAYjFSKWEpMlNQJEdmeE8KK3pGbkJq
Z0xiQzYkdVl6fnhwU31xMU1BSDZgO1FkRE5xfFUlJXE8fEsqUlZjVy0jRklLJWwzLUpiQ3BFdUco
NDhHbQorenN1RFZ8NDlrdXVISGFqb1BrRElPQHVWcyNgeFd0fENRYkA0VVgtfjdaO1Rre2FNdylj
OGJDQWFMaEBSIWl8bXhSCit6ITkhan1XTVlTVz9HQ340aCQmLWJ3VGVJMENiYm04S2pjbldrO3ZA
IVcmRCE7QzYlMyFQI3ZeeXw0Sz8oQkdaKmMKK3ppUl49QTZlUmpAOHpaWm9BIzJGKG5TRyl2RlJv
UT5fTCZNVHtnPi1aPVZDVlZHRUs7MiVHYTQ1KVMwZiElNSt2SAoreikzIVRSYktscFFFP2t8ZHNl
Mn5WYS1BdXhHa3kyRE9zMlF5MztZVkUyWCZAMWJmJUBhKj9LVE5veXFpbG9oZXNtCit6OFlYS3cl
d0t9UHBKcDxKYio0OX02YmRmTyR9fkhaPT90QXxzbUBmIWRleTZgSStIMF5YWm5mRylhUnY0cnFX
RU4KK3pIPjlKOXtAPkc/ZXd0PE49JDZUfVJBJm41T2g7Z2JAdFMre19CMEI5cUJFN35PYl82Rj5T
Y049bGooYXBRKWZ7MQorelpYOyRPRlZwPipPZCp8VnYoRUkrJWI4NUtXaXBsTU8jamxFUjxJLUIp
cFRKZFE+WE1IKFNOYmRicDMwWU9hbjVSCit6SHRTNWM9dUFPO159VSpNR01XQ1JHbVgpaSZmQWo3
d0Ita0I2ZkQtNlBTdSV5b3QwQHhDZXRsQyk5MGZWM1U8R3EKK3pGI3owfiR1dmYxZFFFNGwjRXJt
JT5ERWw5USsxfCk9dUczWEdMNmstYGRzPnU9JTNWP3VGY0FIU3wtekxJQDMmQAorelg7VzZGZ1ko
azhgLWpkblQ0I0VCWVg8TypuTV9HQ0NHdS1Wc1orbzFQMX1QT0olZ2w1PUV2bTYyLS1aKFF6XmF3
Cit6dTZ+QzZQOXp5Rm1zMSFHPlMzbU8hMH05Nlc2OW51YFM2aXNjSjYoKmRQZVF6VE9yPnJhS0Jh
WkV2bGFKVW43MEUKK3puPzZBQDdMemM8e2E3anFMKjxWdGU8cjYyKWpTPz1WSHRqb2dlZDNPKHt9
cWF1IUFoY3YrdD9gKkZ1OXhJJDchdgoreiQwZEdxPn18Q21DKXhYWVA9UCE/TERpcEBXbUJPSmNm
SEM4eDVvO2w1Wm5FekI4UDBza3padWxfaUNnU3FuLW8yCit6UjU5ZjRFVHFPJjwkZCN7YT1FNTFV
R1dpOG5nMHpNdUV3VEBGckJsVUEweX5jIVN0Kk9NbzkmI0J0cTdjdXhwYEAKK3piTXQtLUtpfF44
e315NWN7TUF4YnJqNmZ8JT4ofDJMVShgJXNZNkRTRWUtdE51YCt8QVZXaHY5Vkh2XzMqPT0tLQor
ek49Pk9kOCtMJHc3K34kTzAhNE1Geigqd0pBKEdGdGc1NHVVRXMyb21mcWJINTdIMSRla0lEWVpR
ZVBlJCp5PHZRCit6Z0tWLVN1bDBwaVA/YEsyOEc0cVNAXjY2e3F8SnFnQihHX1ZQTV5QS2A3bGU5
MUd7YD1uNFc7ZFVWSTxqcGBSITsKK3p3VS1kQHgjbVY7Z0Fyc1Uqa0RibT18ZHNoWTdhPmxqam0j
UFdKQU4ybktodHFUfTYpeGB3IUYlR25aPV5JdjFwVgorej9BaGgjTH1lZkV3OChGJTdJKVFtPX5l
MlA+NUU2VDFfJDZ2ezc9dlJYcGJYYiNtOCtxeTxteWRGQlU1LUlNWHtrCit6ZCVvVVphXnRoQ2xg
U1RASl9EVz40YGxJVHdyezIlKW1XdDFoITd9YllwKUs2QT16MFh7TWhsRkpXNUBoWlNSeGUKK3pC
Nn41djc5TTAzTWllVyZsUzlWaTJmNUQxeylPZ0g0c1JXPUhrZ2c3Q2M/QFE/R0E1cC1eYk83YkdK
JTNyK18kZQorejUqRiFnKzE3a0dxV0khPGQ0N1o1ZyNGdGhsTz17QFhZXmp2PmNAM0IqPTNfRTY8
ckFmYlViNmZRSyR6cT1QfHpkCit6cFd3ZjgyfkRGfHk1TEwyR1dKPzNPdWQlWHBaTmFIeihnZjJR
VCRRN3QlRHErTmUpQDVjKzRJSUpqJFQxMUFOPG0KK3p0KEE+dzZ4Q0hLMDF0RVZeQVNPbnRAeHJ6
WHNocVNiPjNtVEt3cWo3QXhnJSM9X1hZUD45WUohdi1iWmdJKXl5RAorekRLVSlfQT9zeFltMTRf
OHw4cDxra21uPCszUzMwcnY/blU2VTcpc2o3REVZakZlSyYyellHJl5pO3A3fF9ObDslCit6bWJI
SWAlcDgzT1AkenFudUJIfEN5PU5iZDdfTHFYZjBIYCFjO2ZnRj1SeFFoS3tMMTh1aDRKQz5maGIh
Qj5WYXIKK3pSbyRPO2IjSzByVTdmdigtbnctfnBIVDlWeFVySmMtOUc5UHs5RmI/bXIpUjtGNDdN
NyFrJDJQdisoMHkxR0NuJgorekhpV0d2OFQyd0Apeng7QFIkSH5UKTsxMlJBejZ6UE50WUgtR0w9
aSVVUiQ8QDxzNkg7RCMyZEJUY0duNSpobn0oCit6d0ZiKCNDKHd4MWBXPDFeM1c2RGgyejBAeU5u
VHIhRHFJeytvQzdqSXZGdzNJaj4leGBIPTJ2THZnWF8yaiZPOzsKK3pBQEk5ckteQV53TCNRbXh4
VVBofk83YHZ2WXJRUWBWamBYdGY0PmAzT3V5dXFQN1dhRilwTmNxJSFFTXY2MUlyKAoreiYqWWhL
ZSl2aCZNUn1COXs/OHotPzF2VWdvPF9CQV8hcG5ock9tIzdIbURkT1hLVjJvRmMkcmJkP0RaVkZ2
fWNICit6Vl4pVCN6RjRNRSp+d0g+WHUwPUxzdmR4JWZQTWUmKHBDWGdycEZKcmwmSDlaWmIqZGch
dnt3YGxUMGdmQ0M9UCMKK3ozMnF2Yjh0eyZjXnA8UDlzYnZ4bE42fUJKe2tzVlYhbCFFTXF3MkVI
TGg7WT5gQ1V1aEptcDNVaE9ANkpgPGEyKgorejB6N3lNMDxBcDtPUEdzcyQtRlotPTJ1ZjttWmRe
djlHQlEwTihURyslIU1yeXtGdkt7PGl8OXNIX0QoR2Uxfio/Cit6NzNVVTF6Qlg3XzM3OT9oKG05
Q0lgNllSfDxDRFlCcGtnK057dnt5SkZGN2c0c0FDJjkyVFYtbmhzTFFQYS1fO14KK3opTCN6THM7
eTY0Sms8THspRmk3MkE9eChmTkNqcTt0R35BVUxpaXlgdCQtT2gjKUdsT1hhOCF4aEs0UVZRb0JU
RQorejN4Y1E+JUc3di1QLXkzZ3ZYZGVRSyFwcF5oZytFO25CVGltYm0yPGptbzVYUEdLVlUjPDRx
TGR0d29aRTt3UTt4Cit6ZjE2KE5APDV9SXFoMzxWWl5Mazl3SSZLRmx0OzRfRHlUeEM+YyleK09H
SmB3WDleZjx3fCQ+K3ooeVkxb1YtVHkKK3piSElOam13ZVVNWERaQVl4JF5BbWxgUHpEVW0/R3Nz
OERpcWRSQjFoe0V8TzE/amQ4bnBKQzsrQENXezw+Qis3fgorel9vSlk7KiE5bC1vbi1rRGY5d01R
c2xheEVHfDJmSnNUaXNWQUZGO2NReHBwamg0IXJPJTFPOXhEUSMmSSltPFoxCit6bkJVYFc3VTVm
X3RQSHNTUHtNTSV7VT8zfVAqc1FPTmJMISNxaj4/VlBZS1p1PVRTJFJ6dXtwPXR7d0h9KkZmd30K
K3p1RjxIVUV8TFk+IXchKCZTaFZlUEBvRk9naStgMDc0YHtZTU00VWhsQUZQczN1IVh3ej5LViFA
Ul5jMlNrMTAlXworekxjMl8jZFZ6RiNXeTVOX0okXjUoRENiekM/blpZWUtUcWVObFhRKGlTIV4l
b1U2NTFgciNGWF47WGFJX0pAbm81Cit6cXdtaGEtQSZAfVN1ZWBtaj96aytlWm1oa0R3UGgpNElJ
LVhsSFl1Z3N5dDtzM0h2XmZRKEU1PWZkTyNFY3g7RkAKK3pBd0VrV3poSDNLbmtNUlM3MHJBbUQ1
bSMhX1hJWVh0O2ZUMT5oNXRhMi17VW1FNkx0fTtmRiZJJC1kfENATjVyQworeippWkg0aS07ISk1
bjZ3U1A7Qm4pTn45cTdwT3hgekEyKkxJNEJYXkhAK3o/X0AhKWVWSl4pRDhfN3k3MnI4KX0oCit6
K3MpO0NUUnR6YEN0c0ohQUtoaFJHKmJncEJvU05mWEtQOE5QckIhaDN9RX1EVGVaRyk5SDJST0xN
eXVgRFQ8eGMKK3pTUHx+O1d6Xl5LMUAzcUwwQGFBe0JCV0lUXjZWfFE9PD83ISRHSVRHMjZLOHE9
Ujw+fE1AbWpuS2ZfIXVvfiVXaQorejtyNnFhY3o0LUFCOGpCbHZHMXB2VyNaIW1WSTZUTG1TUjU/
TVNETnNXYSVmP2g+SjBrRnFQRGlJVlkjR1ZUMz5YCit6OWhFXzUhTmlDeUxyQFNfezgkYEFCRkVX
N3M2SUMwQ358XzltUG8oJihCa092PG9afjBKKjA5KSRMTHYtKDNWNWAKK3p2TDV5ez5ob3p8Pkp6
Z0FCdGJiU3dPez0lQmp5fmF5NlNJSVZHfDBFYTs3PU47N3lFWktiSn4oLU9RdDhYfmkjcworekVi
OUI0ZHs0Y1o+Q049VGxQO0N1d0NlZ0k/IWR1a2IoUUBgeCtQdnlXdCZYREd4ekxSWjZ+SXBpI3NG
N3Epd1pACit6STV6KVNjXiVhbU1kQ0djU35+aSVmTmZnc2ByTUN4Y2BwNGZEJTMkaWlIISR8Mz97
bWRteDckKFBSe1M8dndzVSkKK3p0SkoyKmlBclleKkl4VTw/QEI1ZmRzRjE3KjFRdnhIb19ycW5y
T3tBVGItbSMqQHlgRW01OHpVTT40eGJrNT0jRQorek9SNWg4RmJ9U2VvRyg0IWxSN3lxUHM5VF5w
UTshV2MlQ1lrKEAwK197PVdPSjZmKSs9bCloSTBAREpGcGZsR3BiCit6YHNOLVBvOEx7a0tjTz5u
bCluRUFCKUlNRl9lRzlMVjwmPklYUz57MnJSP2h9N3tCSGg/eXQhYnpaSFU+VEBidCsKK3pEQG54
fmp5NVY0PlkpOFFrdCY+SkV7YzNkKSE/JG1edS1sJj9KRTdZLTxjYHZrckQ5TENZfTtRP2JES2k0
SzZOXworekpCUlJ+X1MmaCRSQ3BweXlvYT8kSEd5Q288NXF1a15qOTJhUXAlYUBBNyY/MVpTbD8j
KFo2IXg8MiVBe3gyTS0/Cit6c0M+XkJEZlpCcHsoWFk3amN8Z2RfT1lVbCVHc0FIbV9aQHwlWHRG
Y05FfV5nUzBVbypQdnFNJkRXOWE3Z3NaVisKK3pTPlN+RlckN34tNylqVXQrfF49bG4lbXwzN3Rn
djBqS29HQ01aO29PentIUVhXRn5Uemd0TT1kVl9zQFRsaGUweQorelRGczRHa3h5SHRFJXUyd1dz
aCVifEkkSHBGem8+IVcwSmZ8QTBTdmRqU3JFRmMkdEVQeUZwJDh5Y0Z7P1JiSX5KCit6PHh5VTRt
NnRQazVrV1hoVVFYbnRrKFc4VkVFfnhtcVlBRXhAc1FLZC1SYztTZ1p6ZlF4YmMxNEBfNkl5aEF9
PTgKK3o8K0djKEI7SHVsRmVjYVBoO09TQE5qTXU4UD5ZSzE5TilHci1aLWFXT2dIJmwrQCtkNE4j
ZzhfcyMjWihGRyZTbgorekMzI1pHTFRTalkxWmRFR3lId0ljbDUpRkxRWG9rX2x8LVolQnlYZnRS
Uzs8eSh7cEp0KWxJaj85SEhxSy19Ykx+Cit6VzM2KXlnSjFFamUqZW1SU1p6ZDAkdztXZ2YrQS1v
QkhFTDtOfFlRPTZUKGVHIUdhY2hET343JSpYeHRsR3s+cz0KK3pyPUwteiRiT20wMl5VTyszbiRS
U1d4TVRmQT4kPXZwT1EkQ1VaUVN3NG1LV1dGX3ZzVyFPU1plS0EzZn41eEdzfgorei1xKG5xa0dN
SnVGTHhIU3RnMWdqb0t1bnRCZzU2fiMpViZkPj93IXw3SGBWZ2VSeHJYaT5PZCg0STtucUwqa2li
Cit6Tk5HYntEcH5zMkwmJURHOVFjWEFtdS1VSklJKWwwMjFeRDw3b35RQTM0QndHQ0NBQ2hFamdk
WF8tIU4tTytibWoKK3omQHp6S1A1ITYyX2BzY3lqMXx3dG9qYG5fem92SiF3SkVnV3QlXjAoXzNO
VE5FN3J2Si0kX1VaTXRkdlcoM1BzZworelZ7MnBrJnlKTUdfRnVWUmJabWQlajsrRHVoMV8/enVq
a3hYek5BRi1NRz1lMEE5fUNzMzlSKjdRLTk5VGlfKHUhCit6YGg9UzEpQn5iX0R0VlBmJiNkKkFj
Vz5VJXRSK35tcT9DUHheSmEoKzhuOUx4YnRRMEB4fEdxVnk4PE8jRko2cWcKK3pBdGE7Wm9QfHxm
LU5sUC1odiphQiRYajt+eGx8SkdDQFlkd3BmZXhEJmkpaSVrd3srVj92aCFPR01UcTk3Rz4/VAor
emZrSSUkc0Mka0NJU0VtdUZMdmRVK0cxTSpnaF5VNDlBSUM7T1NOMlJSIUVUJDdvNW93O0NOfl4l
V1BCX3dhJHtUCit6XmNXKTYyaD9IOSg2YilwTGpHNTNkV1FVYWo3N3N9Q2Q2RHw0Si0ralo2R3tI
fEQyMUdWWnY5NEZ3NVlWMCZ8YXEKK3pLYVkqdTwtPmN7b0pkKGhDZ2RHJEVOWjVMcXspVFBKJmk/
NnElIXwyTXFONFdOXmI4JWtgSjhNWGJkRkhYTjVgZAorenprSlF5QEllXiZLcUlpUVEzVFFPSjJ9
aytOfmskPHY8IXUjLU5KV3cyblExM3NFcUBTV0U2Yz54WEVHMCRRcXhtCit6SzRWMzJOWTMhYCRT
JCsmUmskQHxlSHU8KUp0UVlwMjB0ZmZ3TzdVdF4pJjlETik1IX5pfW5aX0UxQ2pqQE1TYTgKK3ph
aiM+Z0heKE9Ed0coPmUyc1hyZSZSd2Z8JTkyP1pGelF4PT89LSh4ITZiP3dpUjtaRlgham1+cGQ3
bVZ2NFhNZAorekc1Vz1VciVCQzh3Ul9fd2wqfkllQiV5bDYjRnBMTE1aY0RXckY0ekhSZjVFaDxh
bVdMOyU+WlJaZz8rVGY2JURrCit6MFZvVUdHfWQoMVYyODZNOCRPOVVQfjxYMmVHMjZARU5oS1cq
KGM3JnlpQ1ZtenRJczdiYEtzd2Z0ZVVzNjVDZzkKK3opR3QqWlZnUkMkRSNGOXc+fmJFX08pdzVD
SXlIPWV2SlJ0dUpJVCZZYEllM145Wj4zbkJZfXVEby1qczkpT15MLQorejB8M0ZEaFhQTWFQbn5+
fUZGWHVlcGkkU0skSSswIyU7T3o3PHx5RVAlNU5JfitTKHxsKWY9WCRnPTJrUilrKW9KCit6PU9g
LUcwNGtxPGA+KXEkVmM9fjxGIX5TaT8rPFd5TmNeTVhFYG9xVj9EbVZRJmRBQjgjWFVCNUBlUGMr
Z3FSaykKK3puS3Y7aVkjQyFwJWZKU2pfSjVDZE4yKFRJKW5XJXxpfW1ZQTFyKThITXAzSS0+ciho
NXBNdkEoNCl5fEY7cW1JTworei0mWXp4Q0FkJSV4OXRwbEcxXm0yRVhyPHs5UHltd1cyc0E5PFlQ
aGFlc3Q7NWRCb0JxXyF4VFgmd3RZWXhQWkZECit6aksyaCRJZ3QyMDdyIVd9JW1ibWxaPW59VHFA
LWtDQntLcTl4VXE1ZFR0NlhlQkwyV3FHPT5+P3FvTldAc1VzengKK3pGTSlzbm0+WTRNYXdWPXUy
aGxJV3pFO3hAK1MrR3RMKWJgWW9WSHdQUDIlbHpBZkwxM0VlVnVyVEhWYmc5RWpFNAorekJLSiQp
LTxYTGZBXk5SSmZXNT89IXA9Kn1Ja3M5angyS0J4K3BRWll7TkE7aWA/TDU3PnNpUXApcE5fUmJf
Y05ZCit6SnFlWFZSKEYlTExTbjVKR2x9VShrI0VzZ0JxRHxib3ZpdldndyRoJFZOT0ZjNmUwUG5k
WkU/YihjKUJ2SkMzaEgKK3piI3VRejsoaDt3eTl2e2tNRFNpMCl2e2Q5SXVUOE8wKCMlMjFxNG8j
ZTw3QmFyZkUmIWBoe1NMY0BAYCVkZDVGaworelJfM2s1SVp9KnV6aUp+Z2MkYVktdythejU8ViVX
RStCNWZuKXRLYVBrTmxeOD1lfTMkPkN5KUZxdktoMUFHWmM9Cit6UFhyQnRkTHF+Rkc3M2koNy0j
NEFBJDlJV3khQWVjQyokblphfDY2dyp2bU0od0AqSHUhYGwoT2JnYShGblNKXiQKK3pWey00ZWNf
UShXSm1jKGpiTmxlcmU7WDtyKl8mdGdGd1NuTz40Q2s8R0FpXlhebVBKV3d0Vy1NPVozNUJ1O35S
eAorenswKUp7SXY1Z3F5KClaLWFreFlvdEhvTHJsMW1YLVokPG0zdUpybnVGb298LVlhR359JT5O
Q01WZDJDdXNLOE0rCit6eU9sOSsjKXBFPE9BRGVlaHBuTXp5c0MmaE1ifj1+NWZXN3AwU3NIJEBW
ZzxwTn1BKkZhdE9tLWZxKXFlUHp7eVkKK3peU3pvXzcyezw/RzQjNENIQmwjLVFvcXk9SipCI2tk
cElLJHw4NWFNVXtAQWFgKX1sKW57d0RzIy16ZnlOM2coaworemtnU3I0VUJpfWcqRWptP2BQbXsj
NyYodGZ2NUxtNUc4bzdVdjtFSV9GRk5lS3hhJks5JjxtKTgwWGZHSEo+blBTCit6THs2OFJPU084
JCZ9Q3MtMzhwVFFOTVY4XztzKk95QlAxQzh0JVZldXtyb1BqOEF7e2I7Ny07OGk5UXxuSF9pRXUK
K3o4VFlmOEZjU2V2cXF4YkdEK1l6TXs1MkRtZHtMPj84KmVKNClhPlUzb1NMR0QrXyZoenlqVFhq
SEB8NGJuRVRyJAoremtjPTJBMERwV2p3KmU0Nz1yKkR0RUZrUklwKmFfMT5VYUF5cmEpO2Yoeng1
Nz5+e1NkPStFWUtmM1EwSWUzZzRkCit6MXBPSTdKX0pFZD5WSl82WX1fPzNnRntzN2V0YlpBcyt9
PzIqeHJiOSVnJkgtPUJrfj43NVBWXjlAcVlXKUhPUnoKK3o8SUpAP2pjWWxfKWkrNTZUdmJtPVJm
RDNxejQxQ3RlO2lsJXBvdkxkKCp1RHk+dEFHMTt+I0NDRE44bEImV153QgorekdrZG02dDJFS0wp
MG9XdkVBc0U5K2BMOERlV2hfXmJeSllZKl4qXjdTPVEpX1kwfiZ+e25NPTdfVFJBPFglUHFtCit6
dSg4eGIpQlBNb0E9Z1cjI2E5JTJGKjEoUF9EKSlPV2FLZ08+OGZqeEpLanlGV18mPyRQR3Eybm1C
ZV54XlcyO1AKK3p2YSpHRFBqY3Q7V19ha2lJamslc0hMYHRJM28xOHNocSg2UmxpZ2x0PGhRb1Jw
bDhiVyZWNHxQNiRmSnZyRy1RTgorejh6YVoqZFdDVF9zblBBaXhNdmN2dz9OO1FXK3NGWXFlbHdN
KFM4azRsVnZQbnE0REdfR20/NTJFTShkYkN5Y092Cit6ZThKbytMQGBZQ1JQJGNnLSNxdCUzJDAk
UUFxZz47dGZifk9reiUoVmV7PHhsRnBYaT87cChpYDR3RjAqO08rZzgKK3opZmlJektFOXlsVXQh
QyZpPlU1cmA7VFYhZHozc3BGWUs9PW1eKXJ3aX02ez1WeWlaa3hJaGREI29SZlIlMHFxKworejw5
SzxYXkpSfFZmcFEyWDBxWTxaX2N5ajhaKXlyXlVYK2U/LThpb0pJMGFBMXs2YnQ3eHRid1Q7KkRw
ZmQkdnVPCit6UXVEYjxoTjstTW5rLURseGEjMl8oYXlsNlIwY24kN31OT3w4YChPeDVSdSkoVClP
cyFAV3teJkp+NUlUbyhvIUoKK3p7ZSZ+YmZEWkkzd1MpZSQtMHtJNCtgKHJqUD5nJD0pVWQ4IVV5
YmpjNSFePUpwNXo1JXl4STFVWXZoPmAka2hDMgorekAtcWRQJD1YdVIzLVE4UHhsJnVBakxNRWhv
Q0hqeVYqM31wVXUxUDU9NVFUYihPVHQoKzxWVzZeJHw1MlFgSUQpCit6M2ozQ3I2S15TdWo4JXY3
cXx9OTF4SmBEJGBxVDdZOWBTSSpndjNsYng+KV9uZztQX0AhYDNheGBDQWI4YjFMfnsKK3olQlIk
ayV4X3lPdyVCdjhyVmZTbXUyK3NBU0NqZEZZIWRLQm0pYkVwVEd6LWQqP1I+XmsoSXp3ZCFZPlZV
NXdwVAorenlPMURFIWhoaD9vSW1wTFlhVjcjKmt4UnV8QnpKUjt5b3V1PTdGfFp1fVliajdnTldz
ZktmUVVWQlFpZjVnT0FICit6TDI5TTckJklQc1g2VUMlSjE/UmxFQld1cEVwXiVGYjZrSlNhTj47
Y3VvKHEmWlY5b2smVj8qYDJBMSU9P0U3KzgKK3p4P25XWTZLM3BlWEh1K2BkQypLJG84SSo1UDBW
X0ItNXtCfWl3QWFSZHdQb1dXP0dwaCElVU1rNTE0SUxGNTteYworejt6ZHhsYyMyJG4wbDRJcklf
OTNwTU94XkxXaXdeWT9IKFdGRmU8fWpmWlgpaEpKVmw0Nnh8TDh3TV5Se1Z1d2l2Cit6NE59M2JT
cmNMQEJoe1NpJHg5cWg4TlF0bkhaNWE5VmwjMUZmJko0ZmcrO2JOWXZjPz9MO2hQITNUaj5zdWA3
WjsKK3omPjEtP3lGSyNIJGpVRj53bDU9cmpvdUlGayNpeD5uZiN2cll5NmByO2x6eHRWWGBKO054
PyE+bT1uRU5ed3glMgorenBCTmY3eVI8Xn1Zdn5EJDU9QmlsO14qKkBtc3tvS3VEUUdqPVVtSE1T
SSpnQ1I8dFUpJnZ3a1ZVRnFAQzspU1IqCit6Vmg+WG1mfmwjP0d8Ymc+b1FxO1dNZkAkISg3aGx5
QG42SDtaS3NqWDlZa0Mwe0w5PXlsdmlUWkp0bGMxU2crYWkKK3pQTSspcztvVTt5K055RmM9OURG
Wi0yYlZyckF4O343OSZEQUlmaEN+Rn51bl9QRV44TEpVfjZzKkhEPTRyKzNSMworekxPaUg9Syhh
JD5zKT04RlBNY1BoWCtOeTg3PEhTZU1oKmpGWnsyUiF4cnhsMyY9aXVpRiEhWG9Fa0AxMj5OK2BY
Cit6YihMX3NfZXF9ayR8O0hnSndDOEBjJDR6YE90KEFJZ1VndkNCUGhMfG1HUU1CPm1EYik4U3J6
MnVoeElYdkRxRj0KK3oraCF0PGcoQnU+I2c3KE5YJndxbURVPTZ7SWFPI29eaUkwdWtpWE1EYGNp
TXVzJEk8NDd0Nj5NQTxMWUozOS14SworelIxYGowPklpTkc+dVo9JGw8JmEtSlZ4eC1jRG1HUmp0
czc3TTdAZFJneyg8e0xpRVFwQ1hEKTFGd1RHbkgmJiplCit6MzBSa2lKNU96bVFhJSF3bUlAK1Bs
VWhpcyhRcjRZXkg+endiQV94Y1J2VUxlTkhYQ2NPTyFPPitffHQ9VmwtbjEKK3pMNExrXlFIdnh+
UiEyLS1yUVFOYnRJUytIUl90P0Y+ZHt9KzBjamNZdURSfCp2bkxUe007OGhSZ25fLVpsPV9mJgor
ellZWW9kNiU+YWlPKSpDQF9pVTB9TyhHNSoqNGstJWhNQnkqKWMhIzVBemtxNUQ3PlY9WGxUbXIz
IWp4NlF2PCVZCit6KCEoe1gtJHY8WEk9UnN9YCp+d2dLV2RIcnBwYkVRI2koQTxKYnMhUGp+a2FH
JmNEbVUxfEUjflVueHo9ZmpoKF4KK3prJU43S1g/KGx7YHhad1VOZ012REFgUEFudSRCRnpAJF5+
RXojOzV6ZFBvV348U0k2dzZERXNaRkMzYnJPVnV3WQorelgoQG5vSSlpeDxJc0tKYklGbnEwUHIo
dnVXRVBnejJvanhRXjxBViQ1dWtyamlhMzVVKnorZXlFZ0FsMnkpTD5OCit6alFzWkQzfjVoYkVm
dyRSakdUcEhtUy1tTClhdEA7MXAzM2JvYXVuPXNQdVRrbnsxUFBKZEw+SDVOPWwhbSREMGQKK3pN
TFFrYTYqa3o3akclVGglO0w4USU3KjRoYmVDKXZTSDJVRTNJOW99R1RrZ3pibW13d3RpK3NNV0hj
TiZqMC0jXworek4lTSMxMWp4PE9jPWc8MER1I00rTTtDQE44VjFtYWFIRFdkVzE1JD9YWSYkeiE3
PGQqJlFqVn5HIWZpLSUhSkZ0Cit6NTtEUj1LWW1KaCRqYXVTcj9vbSV8MUFuZ0VFJD1PYGFwTGts
TEM3eTU8YHdrU1JYS054akt1cDU1fnlnX3A5bWUKK3pAclI1emwhXzE0Q35CNHRHXjxmMHcjRGct
ZytEc2JPfT5PYlB+fCVManRwPXJkRE1MVCkkS3tKSGpmYF5GTitgYgorenNCUHVELVRSXyE7T1NA
ZmRWdiFlX0M0UFJtVUY2RHBoRDlFYk1HISR0K1ojYVV1NXk+OGs7RE9vTWJKYER6cVN5Cit6JDEh
OCplLVdDJl9gPks7cktoVGN5IUlJdkQ7Nm8+YCF+dmVKaWB7eiMtPDd8QVVDdTBYVGBVYDhOMzh+
U3pFN2kKK3poVmhVZyRLcC0tZjVKT3czO00rdFhVXjw1SGZAPzt2ZDRIYlNoNlNmTGEqdH1mUyt3
QCs7blRuWEl0bCYqISZYWgorekhkdGNJJSh4QVAtRmo9dXd0M3cqPTEtI3I0Q1Z0anQ9YTFRcG5L
JT5II1ZqVS1xYDVrcExJJWh7QFJPRC05O2FHCit6VzBUJWJQUGd+XlRidElIJVYwSjY3ZlpNUGd8
O2kmbyV2QUxvOExDKHpZbnUhQEdhe0J0NmdUUGZjNHM+T1c2U28KK3ojNlJkM3V3RTlzcDEjUmh5
aVNWZkxPQkFYbWtRS3JUS0F+U2t0XjEpaGJObit0Z0syM1cmNj8yJiZlYSZOd0ROeAoremA/UFVs
c3pzK2pKPlA0OyV2JmY/VTA5dj9FKSZRcSFnQmt4S19LMkNVZmpSTmozaiUkIyVQPlJ4dikyRWpO
Vn5DCit6TipUN3prTExUMmUqfWZhWC1FVl81bnBYM0lQJms3RGJXOXRVPF5hZlNWcGxaRmU7azY9
KHhEPVQmMFk+Nms+UysKK3owZzhrR0A2ZWglb3klME5ENUV8KyRBPm93Nk13YSZadD0xfEwyNipu
JUVDN1psKG12M3ckUXpiRXQ/dXMtS1FeeAorejFEQE58aCo1bXdiRE4mdWxBM01BNC1gWntkfUgk
KW5eT2dmWmFle1V4aHctSzhzR2VzNzxLbkkySThHUXtQeXd7Cit6ckhTKTVCY0RuS3toZW1FST56
MVdmT3UybTdJdWV9cGljSV9oITR0SzthKVZ2KW1DZiphSTU2ckVodEpxZ3FhMXkKK3p2bzlveSM8
a2AhZGM+e345OW5HTHtkKzB+YTspKndNMmFUek49Qyl6bXZeIT9hNWU5bl4zUnVeMG5GPH1nMVU+
bQoremopZUFlKllEQzxoUDEreWpMMSh9IUx3JU92UXxtOEhtYlBuRUNld3stelB8YSlBVGhHNCZM
O3c1OHpQWlojTmItCit6UCNLMiNgdF9CQDE4cVVCQTcoSFZFUWM5ODw4UHMkSHFwLUBOI308QUpG
M3diQDE3PDN4MV8hJGMmcVB9TFkybW4KK3pQSDxhSVpGZnVYUUlNPFM4RGluNlNaXkpveT4qOHxS
PGk7amtqeDdOX1U9bWR4ZU5mcCl+bWtQMHsjcyhPOUs3Xworem1CeEwjczx6ekotfUU/PlVQcTRG
R0g1c3BTMyFFNih4c1JlbGY1XndtN34jKFMrZypXYjhzIUxFP2V5cmthN0h+Cit6akBYfUBvdEBX
UzJmfFoqNzJYKWp5JWdRdUBoa3luUCN0QjY/NXItXjghQShHKmU/bnJfXmxuKXo3RDl2dHE9SX0K
K3ozWX10K24pbUA/eXZYSnNUVHA2Vy0paWMpREthR3hmNDk9OHwwelRoWkdSQkUzNTMzbjl3cGNQ
bWFEampMNTNaJAorelVqeXZzUkNIIXFNWnp1VmIlTDNeK31CYG1DazdiPStobTdedktlTTNOQkxU
Rk4yIyRSUjBkMnZ0a1d0Y0NOI1hCCit6UGBEdXM/dSFvcnJNOFgqdTJ0c0lBaiNJNzVaYHpsZz12
U25Mam5DZmlRWkpmUj9pd29xS2ojS2kjYjdUemk3PFcKK3pXcnhoUlJsKX1MaW17LVFlYjVPe2x+
RmUrUWRWN0FQKmBsMytLLTNpX31FKHYkNnxjOXhYTVg1aDtWSDQ1ZkpRKQorelJSKmpWUTxialY8
T307YEFCRD1XJiozaWlBXlUmRF9LJkU1MzBCeSk/ZyU8akVua3JeXz9OV1YteyZKPSp0RWsxCit6
SGAwNmYwJU02Q0dEZCRTWm1NRGJkdnBLN08+VzgmOERsP1RpbExxWXVvSkUqV15kVzlwdTk3Tjl0
eW4/alYwWGUKK3ooZn1LXkUpPU8kdFglUylZVlNMYFB8KWdSVG57ZntYcVZnbkxAfTZycjNfUSZY
ej1DOVhCcVAzbFl4Q05JcG5HfgorelhCdjgwYGdgKjcrfTUkYW8xNj0lSTI3TntQVXlYfkNoV3xP
ciN3ez1CPFRMO2RaSyhpKGlsOW9TJDYmeGt7c2tsCit6VSQqcytGek9EZD5gbW4mNFpfS28rQHVq
flhwa1Q3YTQ1Nm0yUWx8YzJQKmZoZi1+PWU2fG9LJlZDbEhXYXN2JWAKK3p7OD1PXkA9Q3ZUIT9L
Pkc7cG5NQi0lSXRLY2IrSj1XXjhjQkskTFMke3w9bGUkKUxzdTJzTkt0YC0xKyolblJGeQoremJF
VjB+Uj9+O3dNM3h7JSUoQiphWWRMfT0mflA0YFgzQD5nRCspIXpaKlk4fThRKGA+e05HUn4+eWRO
UzYzJCU/Cit6S2FOWFRsZDxTb3ZMaVB7N04/d2xAQikrNiFDe21hb2l5M3x6fmVtWHlZZHVDbHQ1
TDNVaFdPdHQwK2B+S28hQXkKK3pMWTQ0ST4qT25DVzN4eUopPHU4Vi1gVGstVXV0PU00SEpnMF5p
Zl9fTWNFZ141cTktc1M1anwtVldoJjxjKlh7PAorenF7X2ZtJmc9TTwycCVgKHxGXjFhJWItODt5
WTw3bGY3flJLUD0qYGc3fCVGbXZJI2ElQntLPyU0NztoRnFXayRlCit6XmVyPzJBRUFBVCo4Smxk
SUs7V2Y8LWFUdT16SmdHSiR4dmNUKFFNRCpXKiohJTBhaElVZGxELXc7MSh1Nl8rPy0KK3o3QzQp
RG4hWj5gO1BjMX5kaUJoclQpPVVSM348ZH1nKWA5WWtFKypzNlY5Yl94ZD5kT1BDYyh1REIzXnBS
NWA/TworellEdXR+RntBdFRpO3dhbiV9JHNVUmFWNXVCZk53WC1LI0JiNzdefURPemhxZnZMQHpx
Z3B3MDVecjYxSk98PE94Cit6UCs2MURqJkpMVGNXfjRFNFYyLVRlUWolaHlzY24tcVRrV313dWBL
TyRJU2wzODYpKjJYUzNFZ2JWT3Rsaz93OW8KK3oyKGljeig5NnhlP0lCK3k+fkdtfk0jdFpTX3h9
IXZmTChWb3hpYjc7WFE8YUZDdzQhPyNhfFAxNG1wUHU/bGdidAoremUhbF9CMGVDM01DUnFGfVZE
MTlGS3doPndSTXdoLVRHb1hFXj9Le29jciYqXzRGOFRGdi08RmcrMXM1KmA0bVZUCit6N3FBS2de
IzV+ZEBeZmNDNGNMIzQ2MWNKZW5OSTIjdlFEOHExZUtMTEB4Q0Z3V0FJMFc3JXIrK3hXdlloR3dK
YzYKK3pqbCNSZEQ2Q1kjRkV2fitNVHlteHV3Y1dea2lHNX0tIXBrS3d2djVjQXYhTDtmQDUtdGtn
MVpHRkdKNEAwSlM2ZAorenloSmBmQnNOQmg9TnZpa0UtWXgpY2gjV0lIZiY3aEUyPz9NdXUmPF9J
eHtGTmlVelRPKiMjJGwpTVl9UkM7Pj4lCit6Tm5YfC0rdXc2OGB3S3s2fE1Tc2ZvUl9JeiR6fWla
PyE2OGBYKUdDKnlqKmhEeilPOGZyMExXI2RqMyVGWkI+K18KK3pYfUw5OG9LbzIyZTtYXmVKITIl
I3FVeFQmUm1xNChHaGhDT3RofHo/KG4pN0hjfEFLK2EpZlVZTWI0RVh2UFEpYworel9BKFRwcy0j
cmFGRHFSeE5oVz1QcjA0MU1OSnRyQXNVNkk/OzVjdVAmbHw2P2Q3WXlvJDVoN0YjXlAmPm8kdGBG
Cit6aEpXR083KVhvRko5THYjRlA0R1NIZFBWZVdtUi1QNzE9a2wqdnJUZFd0fmQmZjgje0ZnRTFa
VkEydXZubjdUUmgKK3otOUlkSHdQJX4lV2dRR0IyanM7OGNhO1dMSWRldmk8PGIoP3U9V2x+T3g3
WmBLSXBLSTlTNUcwd1NgdXh2aGNPbworenxHMHAhK0B+ZmpTXmFOU0tjZnBgdy0qdncqLVZhaCpa
MjYwPyNaQFMwSDJRRShFb2ZGIzFZMWwhNzI2LT5vbCNqCit6LThnYmE8PE1JU3FvMTw2TT0hPWRF
KzlNP2ctP3toS2VPSzlFVWFeYT8oNGFYPjQ3RHdxcU0mMylea2VOZE9pa08KK3pRcU5UdGpiZVV+
Yzs2cWAxeXJzfnFeczxNKGtaWFkjVFYpPnlCJSZDIThkR297U3NBJDtARnlCRC1CIXl6cHM4cQor
ejdkWTJKQ3o3d3ckKE9qdj5eM3FfYz5MdGpYT01qU1g3cmkxUTBPQ1kpaS12ZiZ4Q0FYPVkkVFUm
b0tnU0JFT3xiCit6MHJ8QjBgQV9LY0xuIzQ+LS10ZEJ6JCN4d0FIUTRDSD0kM3BUVGQ3SUpWdjVS
cEtHTDM5KGBoTDNKRldQXmZ7R2IKK3orbDQtPms1XnI5UWE+NWB7ODE8VytELTBDQU04MTFAfWZT
aVdCVEMxR2hAMmBYUmgheG9XTjM8PVcyKGk8KlNKVQorelBUV0Q/ZEIyT2soLXY8TmVXJFgpWig2
VEtpSFdlPCtYdDBjY156aSpgPDxiXm9DNUFKbj50M0NQNVgxWHhrOzJJCit6KTt5SkU5aDlWNEwh
ZEx0V30lYllJO0x9dylTJT5fM3RSPnlFaWU4OUlNVEwwclNELWNhTzBjZTNeTTdgQWF9WjEKK3pG
UUJLZWA5P0ktQVBSbXpgLTVTZm9xSmt4blAycTZ5bHkoT0RVMlYjPndoNzsyK0VCa2didkMran1i
cUwzfWx6UAoreiNQVWtlOHZEdC1kbEhFaUEwdjA9TmNKblQqfW0+JClBISs/bWJ7Q1NDRmUpLXRG
Nnp1bGx2V313TD41fDxvaWdrCit6PjdeKGxuNShDKiZXQVhvSXojPzk9OX5fV0JCelEhKUc3e2xS
ZHA3SntWOCRUVnZyYVFHPmJXK3ZoRyFwN258aCoKK3pWMVY1ZEYyZ0J6ZClVN31XUT17eVVNWFk4
JnRpOHs9aUQ7a25pM2F9Vnl+JVJqeztINWYpJSVfN1VRUSlYOGMyeworemRvbFZwM247YWp1P0xQ
K1ljbCZJZDVXKGIlQyF6ek9SMD4hT2B9R2dMXjVUdkRaX3ctR0pyMj04YTRJcjlpa2ZSCit6bTVU
TXdDcD9Mcj58Pj5kRVZpI1lVbUQ9SC05LXQkOzBNQWAqa2t8QnVUbmRzZ1pENUUqM1hqU1VtIS0/
JTEte04KK3pkJEtiOG53KktMQjJWbiUkU3lfQ1Z0Y1QzTE1BdWFPPERrenE/ND88cUBgaWZsOH5V
Z057N0JePzhSLXRnM3FPagorejFaPXxNI0hpY0gzdWskWW5XU1UjTEFhO1h6VmlZUjMhPHgoTXZy
WEVKPW0hO3B8Q2FRQ0MrRG91fkUxNWlUJVYtCit6NDZ2OTtTbmIrSS0zcUNKTVllUjtlcHRyNVll
cCo7dFFWXyM2fk9TRnEwWEN5ZnRiX0ZDNHQwOTBZfXNZSHNLQlUKK3pxYi1qI2FFcWIjUkNfSSlq
N2kqXys4KnJ7WHpMKldYfHQ4QCE7dF5nSXFPOC1YV2gmKERgfW5fKGloUzNgdjhPLQorejBYcCVa
JFJhcjM8Iz5IWGt3VnVlX1YpOUQ2IV84cSg8OSprMUB2bSU+dy1nOSlBUFJ+cEV7RH1RdEtEd0Nv
I0pYCit6cXlEIWpnM2RgMFMtSl5wdT5CeDxGNntDUHpJMiZpKXAlQ0UwOTsyUSo0b18rWDUhP1lF
bE5NOElBUjZeQWFaanUKK3paTGxyKXJYMnomQWR+ZT1CcD9RZVVTZHxqc0UxYiNzK0ApSlZ5V00w
dVNlO0o1aiR9e0B3YyNpcFptMF5iZXlLbQorej02Zn10WmJUNUwtcXp5QCshMzxiVUx7RXsoWFFB
aE1KRWo+MmM5Ujskd3tMeElENytZRlole1RyZWdlWkJ7dngwCit6TSpLcXxNeypqYztKRTl4VSNq
Mlk7UkVqSTV4MHduY2RJI0ZeajQmUyVHWFJqK3tBfkV5enxaQmYlISljendYWXIKK3o7YGE1IWBf
SjklWkhUN15DX1VqUkZ1OT0yVlVjO3koS0k4ejJPb3JlMmthKzYzS1FCdEZmUzxlXmk4dkR2KyUo
JAorekBUdzNqenpkdjFrOVFvMyt5T2BTMUFqez9vKWIyTDlyakZ5T251fEwtfGgqUF52YUQ2az87
MShBKiNNI0VyaChDCit6M3lpd29re011QWl7MEBlZDBGdm0pKEdiMEpWUTQ0Q1plMn0mc0ExaCVa
fWJJcU5XU0pSa2BSbz45Pl9+YXd3JG4KK3omTFkqSG56TzxsTkl6aWJVU15eSShmYyt8SUhFUmxB
Xm5xaXRsVFEyMS1TQTI8Z3dpN2tzN2ViSj1CREpqbFB6Oworek9Xe1owU200YXp1a0F4UzwkUmR1
cmU5I1UoPGNCYjVETl40Y2k8QzhvUDt5TkZOQHdCKGlVPCp1ViQ5YHA8STE1Cit6aFomfTNQP1cx
QVhFNWpudDlnOFQ9ZXFqRkl9NTY8ODx7fGBFcUNvT2B2cTd6eiRoRERPXlB4MXZ2dEE2b2lDWVgK
K3pGTldrO3JDNWdMMjZqMnJ5OHk2NUBrMHA2UmlMfD9hOD1iN3slc3M4a1NkQjhBbjk+ekNRN3k1
RDcpbyo8PHYjegorejJIOz1eUmc2YWpCRFFYUXVPa3V8bSQ+enkkT0ZtMTR4OzIpQFZYZ2l5IWdn
amtAeFVNbEEpdW5aTDM0OGdvMVEyCit6b0goflJeP1BASWtxcU9LXldWZD1GYno8KGAyKFZjJTJy
LTtWWTFKQTBMdEp6eDU8bDs7UVMxPFhIWklBXm5hVDQKK3pmMEhzfWdfPUllV2prfHhhe2xnfGEy
WkVLYVZITzN5SmZgNl4jRikpPHB4SjJod2IpbEJxJUgoNUlxNnJAfUlocAorekspT3wrYGFNOW9J
cEtDdVIxR0ZPQjRldSleRk1ZdyZQeDR8Pk5wO1EoKCE3ViV5aGdzKHlLWlZTKFRJZXRFLTEmCit6
OzRuRVBmazB0OyhEKUpnRCNFOVgxRn5mMDhzdSpGS1pUaDw0JWpNcENKUChzXjJ0MUltfDRkeDxO
VGVXZ2E2SFgKK3pSQX02ckV7elEwXnFIQnd2ZU8+UXNQV2JodE8wdUFQKjw0Zl5UVVJUb1Itaitn
bXktZWJtfnxRTikpM2pnVT5JaworenVlOVFTemRuJn54UkhzN1cxSGkjREItaE5kaFpOYjhgeW8+
bT96V1A3M0lPaV91PT1hT0E3T09oaHhEZ2RuNz4pCit6Nz55SWdtNXJJPD8jOWcxQzk1ZVVSKEFw
PlI8JkA/NjFvIXhScFVwO0FhNFRrUGtQYmdaYlg7QjxUPVNxSzJnSG4KK3pHNXFzJSR1czswcC1p
fTE3WEVCNnMzOT9ZSzsjWk5iemVxc2hXKTt8ZXUqdjdCaGIpOCpqIVlwWVVAcXY4ez99YworejJ1
b2RLdzd1R1RUZTlAMk0leXl2NVBobnJyaSl4bE5lPWAjJSp6XkRuT1cqejtWPjRxVyQ5fFJwemBQ
PSpHNy1TCit6KlUkNGlxMGREaldEPl9iJlo+K1pFVm1xTWQhJjNwNXpwVT5vKSVDLUhUIzRyPkRO
WlRqaXlvTE9TS19pY3BucmsKK3psfHdrR3I4NGh3enR6JVMoc2QpYSFAWDVCIztmR0pGMHdJTSl4
TWxqaTMtND43KlNiYmA+RzxHdHIjQ1UxPj91UQorekFKbWolPj1eSjFuTEM9ZTVwPEYxK2FXaUMy
RW53azsmdzM5OzxOVXBVWHxTcWNmQUApakBGKUNTZjAmZldoWEFaCit6djBDNE49bmstflQqJUMr
NCVue1cwJW5hK2l9P19HQWxLQCQ8RnoqSWY2aUYrZ2JZYkFKV2FmIXtOX3xiWE17XjgKK3ptfU1W
dzs8Pm43P0NacyRXV1ZFJHgqTHViTU1RXiQ0cSt7czNYe3QxQGV7O0NSZ0NJWDFTPklEQV4ka01M
ezZoIworekkmTlJ9WkpuPShARGtPJndNcyZSdytjP1J0Kz5VdkBCbyhFVVpMYjFwWEdwQDFwYFB1
SGdhTmVffEd8ZWwpVS19Cit6P088eHxFN28+cjE4QHB7V0Jib3pEKCZjNWJEV2dWNj5LZzVFeEQ/
QVlUYVR2M0JPQ0ZEbnIqfGB7eVZxMCV3dFAKK3pKOSFzI0V+O0oqPjxBd2VSbj1qd3VXQSQ/UCpR
bldAY19pTV8yeld6ZSNPVnxOeVcjUy14Pjs5RH02OV9UfWRPbworejYweGImdzg5bSNLWnpuTWdK
LWdnajB5SDhkYU58b1p6Q3x3cX1mQCZNTnRDdWl7QSRuO04rYzlWMnZ5WmdiMEpsCit6Mm9hM0JF
a0lUO193Nyt4RyheVFpMNjs7YFdTbVltJWJydG9rPUNIZ0s8TSYyQmJ6U1U/ZEoheCN+fkZJT1J1
TDAKK3pxPzc1VlFOTjZIcjsxRU1CTHJjaldDOWxeJFlFNCZQe3pJdiQ8KnYrLSppQUVxMG9eKCNV
YkJJTE4rbDQzalg1PAoreiN+WEViMTI0RSlBP1R8QWMpRiFXeS18TntBQjhASk9Yb1RJNTxnZ0Yp
UXRyfk5oKC0mTmAzMCRmUW9JTm5BT01ICit6dkcrcigtUCp+dVZORChSV2pyTyNWe2Q3a1JAUThf
YX1mal5ufnlZfitQPzc2e1QqVkp7NiRrNDJkN2N4LTEkUF8KK3pzREdUMVJ3Y0wyJGIrP1NzbFdx
VikyJXUhaEQ0bEtIdkMxJkJGR3cpKmhZPXJvTnxSX3FyUTxvQXRXRFdBNCpZOQoremBsdDg7IUJR
bG12OGAxR1luYzZfJHh5Y0ZAX15PWThJaXJCYUVYYVg2ZGNJfUpIPWp2MXl1WTZTOXllWCQ2MElP
Cit6aW9saH5Gbz9hb3k2blNofDR3N2tEOXtWQiEmcG93VjsxWlUlNnorbCZnc1NuZ3xKZUFpK1Qk
WnYtPD1TN3hvSiMKK3pXKjA1e05sRUJGWWUkdX14fmIhb3M8SXMlaj1LezlKWVg/QGcyez45ZS1Y
NEFfa0s3a25VQD4xbmlXY08laTVFRAorelI+Nzx9ZzMrTSRUKEdRfUUyRndgSDUqKU5HK2JKVVJO
MiRxWlJ2TlpCNj93OXNaYn0jLXUrJml6cUNUTyRwTjFCCit6PWEpNHZ7VGBXYVN3QWh7VW1yYXMo
QTNkYD1GWn4jT15wSVR6fjlVK0d7Xll6ckxJNihsWSRtbDF5SHBNOyh8LTUKK3pzPE5pOWhPO1Vl
Smh+ZWppdGBGJjRLTSs2JE0laUlXZWlZYmAoX1l2Z0A+bUVQSFJVMXsmNiVqV3BmYj4jTm9Ydgor
ei13d2Z0IXlvQyR4fjZea1dsZ3VOO25WNyUpaW0kS3JOVUdvRCY5MExTaGkjRFcpOXFpcEhwJkhQ
VTYhbjQ5S1JoCit6XkJ8MXcyfnlQJEJ9JW0lV25GMWg/V3E1bDxBZ14yLSgoeUtiKkpzcUBebD5n
c2R0V0tAWEZqKnc0eip1MkNIfmkKK3pzKjE1M3NUIz4mUU9wTk1vPURXQTJhMlRQbE0rYDxnR1VB
JDQ0RGBpZjVJUXtzRFpGI0d5IUVVXiRrRFlzQyRabQorenI0TWlwfEFBNHpsYV4oZ215d24qaXkx
ISs2SlJiZ1ZVYEEtZi1HRGJTPSVSb00ta0xVOWNLPVk0SUxFVjt6biFyCit6dlFfezVefVE+c2hL
MkApcSVmRnBOUlJgTWZ1PSk4MkZoQmspcTZoKUNpOGdoJFBZc0gzNCt7REc7JjhKJiZfUSoKK3ps
d2ExJD5uKGVSU0taUCR5bGg5MSFeTzwrN1V2a0IxMmV7NSo4P2drZ3BGQVdPZ3djbj5JMCshVyZR
Ni1WUyEpJgorekNeQDtORDQrdHVYfHszdER6VUAtcnZgPlc3cXVqaihVNiRjQDJwdXhAengkOU5z
XygzLUVgO18lQDBsY2E/M3QtCit6elV8NE1QMmVwbyF8NXEwNi1iT0tPM3Z5b0pyb1d+PTYlfjBM
MCFqN0FhT34qdktgNHRxMTVpQTk8QVQ8ajleYWIKK3oxNGJ4aVBXPjM4amZvMzhoTDxvRjZedUBj
WDBvTHdiTGp9N2VZcTBjWVJ9Q2p5UGlqOShhWT80XmQkVlFnejgwVAorekgkOWFhTD5NJXZ5P2Mr
X1MwdFMjYS10Rl5oYSFZVHZRRz5hV2thaUNQcU5ucGN2flZ6Yz1xZTBKNDJ5QHkjfk1tCit6LTFU
MzAhNCtAZHYycVdtYzlPUmRGVHpaWUo9OGszbFpYX0FNcCRMN1VVdys0Y049QEFTT0k7RldsYVF+
WUFXeTkKK3otWX52WHdCUE5+KV97TD0mPEpsKEBeJnRFMzY0KTBiJGBVNUJzQEpSQFlHcWYjeFo1
aTl0dyNqUjMmSDImPUV+OQorelgmIUh1SWYxZWw8P18hVHowKj97eHNJOEUkSXcpXlNsZjtHU0Bo
U1BEQWg+STklUUVmUlU+YGA4QTM/UGBwKVg5Cit6dHpieTZWWElnX1VNSWAreG1VT2RwQX5FZm0o
MHU+WXs4TiNmX2dROTIzZ3VPP0ZDYEVZJDd+WnN3UGQhMmBPZlkKK3pOOzVeeG9JJl96TFJFdTdk
dWsqPy1ITmI4Myt2UUZueUdZKClIenUrcjN2OyQpRlh1X05afjBgY3loSWB0eSkmfgorelohPEIw
akVYSEJoXnA0cGY1XldNS2tuVmArYHBDbk5wQ0tZYjVeMj4zQllKI2RkNjNpdyZ0TFYhQ0UlKG82
Wm5VCit6UUpOVUBiPURObXlpT0lZZSNBJF9zQl5sYmpAYDNNWFYjT3ViMjRMdERYe0VUczN0dmRL
OT5ZfmZPZit8S290NUkKK3piWDhOSm5mIX1sRFJufXp0V0pJNDhMczRJRn1kV1dtOyskdGxKRj1B
Q0tLYEJfX2JUZFFpbmA8RVNZOERvWVlNRQorenRQK2RURT1wRCU4N1o8ZlpTKXJWXnkrTjtHKUdz
R2Vifj1tWjxmSzViZ3MkakN+Sj41VzlpO3duMyQ/Um1Ya1VTCit6bFg5WEApbzs7YkNUTlczR3k9
WiNEQDlFYyU1PnBMI2t2dXJpVVh2WUpBYj92SjJIalVKUHklPXV3bkpvTXJXKWkKK3pPeiF5JWRx
JFdnRmJiQklIdH4qZnsxSzIkQHMyP1JGeWxlaTdUM2BpPVckNkQ3M2VaYkRYaSl1M0EyeipRYy1G
YworenhvVzt+MXxtRFlpSHltRWVvOXEqTVlNJX5CV0YleUFaQnlQS2VAcm1sUVR5TUZGUVk+MkVz
UnBadWwzcDloOTQ9Cit6Vyhtey1NRGlyX0BCZ3ZLNkUrRXw4JFZYZTE5UTBEQ34oJW9GNnZYbmBA
fWctNzJaZWA/ZHYybG5JQX5rXmg+RSkKK3p4SnhNcm8+KGhObnB6Jk9Ndm10bCFEWF9kNUB5VGV2
VU1RSm5MPVlzaXttPTBTQGR8KnZOdDJnXzY7eH1HVjAmagorek5lZ1opMnotUT9xRXxtN2xWOFlN
O35XViUzUnNERHJAe0U1TSFKTFA1MCVHU0NuNkEpcD1gQylXTFdQKHAxbTdVCit6N1p4Nysyflpk
cHQjO092cS12V2RPLWlSYztgVlp1YztCd156OXIwRmpAKmwrTntzYlZePDAtUWB5SXs+e2dEYlAK
K3pZcmpsWkx+Vns+X1hAQV85S0ghSj5VTiFnbXVgenNje1ZfSyZIKFMqM3clPlBWUSlmbWFsWktS
THZURWZUQjdpPgorel8qVFBAXl9qSnJCfCsxXlFfdSQ0OVlQMmw+Uz9XdUlzdDM1dms0LXFkQytP
M0x2anpDRVRxKGs1amluSUVycEQjCit6aj4tblVoIzBBflBlMUsye1RTK2JEemZPdDVIVCM7KTlM
dDh5U2d6X2BkdHx7eyNBTjhIME9LfmlTRHtvMyZKYXkKK3pnKitCZHdfR2YkUjRlVXlpeSRDVUpi
bytVRlNBVVFpSjJ1KHJJTClKTF45NikjMnB8a1JHcGg+VEgqZn0lQ2xQJAorelNKKV9GN0NEPGQr
SSZ3WUtVb2plV0hQfjdXYV9oVXBTTnNUKm1Oc2t4PVI9QTE5Q2crPCo/QStQMGpAMnFeeHpRCit6
NDRHQEd6fWhEKFFzKld9UmZVUURPekBxU2tNM2tVaC1STFdLU3VxSnNLdHw1VDVBJWFnPDY4I3M7
K09XTW9DM00KK3ozRjlAanNFc2EpZl52PF9HWiUrcykqS2d9YG4tcTM1RjNldCQ1fUZnaE9Pc2hQ
Vjs2clcpXiRhc2UmUCVqM3IlVworek5fVT1uJHlIYT9UKlI3Mk9JbjFlJFV9alp2emVqQElReW1G
cDFlUDdAaWBGNnNXemsqRjAyQ3crNzJoe1JmSW1VCit6PmgtSWQrMkIkOD04dUhpJCpoVndWTzRe
N1IzNU9wcTlHKUVDWFRMTF5kSzFiRnJlblNGIVE8TXE4TkAzWVN0MyUKK3p2Nnk9ZVdzRkZjVmc8
I2tGYmFYVS0xVlI9U1Z+bn1kUHo3M3UmeFZDbWgjMlVpSHVaZkwqfX4+aFMxWmdTQFdscQorekFR
UmV4YX5XS2UkK1hxPnNwajI8YH4+Rz1oJHJsRDk2ZUVqVDh2T1JqX0A5O1V9KS0jcmw9RnwoeVdr
fUZoR0pVCit6Y1lTZW4keFA5VEclLWFmRDdKcmRpYmgqOGFQVVJvb1QmKU9nNVRPMEB+d3FAdGM/
UXhIXnJpdFZ9diZ7TlJ7JUoKK3olUm10RUc5ZiZiZUhjWXVuZUE5d0x0WFkzbzE3RG5IWGNoVk4j
UmJUdSVpbjM8OE5vUCRBfU1nVlZ5MVBJOTsqaAorejZqekM+Nj53Knpse2YpO0NaU1B8JiM8SWNZ
M3Ulb15QdHlIYD15Z3pINFk2OUNzNjVBdHNvZSFQQj5aQUY/MmItCit6cSFSVzdkT0dGWSVtQitx
ZDtgXl9kMm9YQkNxNjZmKV9IKXsyeFhpclFlPkZncURQeE0jQE4weTs/d3ljKnVQcU8KK3pHKHEq
fkxZJWYjP1p4MG9qVmBVOXZMMSllcmJ2Zy1paTlGWikydStORFdXd3xmZj9HNjJlUD1aRThISkd6
N0NfbgorelBteGlzUCt5TF4kVENzPkl3IStCTzE3KkxLJj5+Y3QmTTdTYmF3REFxNk1ZPWFmR18z
bHQxXygqXzV7Sl9eMl4oCit6USl9VEZVUyshWHg5cGtiK3B6Kz5QbVp0Mm5Fe0lpU21pRUxXJm1z
cChGLXNvRDZAfilkVjx6XiYpQm19KiVNZisKK3pgPHRVRGlxVD1JKmJ5RU0/Q3ByfV9ub2tRQEFg
JCFrfFc/LSpUc3x8PTlxeENlNlphN2RRKmIpJXkjQX41eWhqRAorel9rMmVMYVg/KmszMWo8UE1n
UCp1KlcofDxIJiZ5b2wqbHxRQ1c+Q1V0YW5kZ0cwQUZIKVFgOFFEeyN3Oygqbnp3Cit6RV4+N0Rl
Vj91bmlTSy11OHRoczlnPlJUeW9UdD02bUZZIzlMP0ooa2JgJHBgPmQkZ3BhVlItMVMxVWx1e3dB
XmkKK3owJkVzRiVnVmxmQWNII2ZmeWF8K2Z3Y1czc1g7YWBYbDFmPEdZWHVUMzgxMyRGLSQ3SlJx
V0EjMXlwY29YdElHcAorej0yYXc5PERYUj4wJVFWYSRvX0l+YGlzblAtV1AzWnF+TDVtWFUoYjNB
SGJAWU5oLWNYejV8P0VgeWtSfSNBUE41Cit6PWdCTSlYckhje1Z1LTNTc3EoNkVzdFBjODhNbj9R
M150ZEFvcTdhez9LQEVtenliNnFKcy07RUdUUmstP3NmJGUKK3pid3drQnV9NG5lO3NFeGUjJjl4
UmE9aVVNN2R1e2dnfGV4IVRoSz5raiFMdylxODlzNEN1SHckO2VUXiE8b2hjSQorekxzVH0wP1Nw
KG9vczVoKGxNfm8qVFBIeSU8TkxafSotNmdZa0ZWVy1FbiomcXQjV3EjSzYpMUs1NkMrcmlOZGNF
Cit6WGUxclJNfXFocSQpMHh9eyN2MjhpfX5FWW5UVitUT3kldD1QUnNWNUV5PjlkJDVPK3heUWJ8
c2c2O1k2bHdFVlkKK3olemBsel80eX10PGN8SCU7bUdBQmg0SHR5I2BhSCZMfVVCTU12NzZsT1Et
P2dOWVVUcDJZUjliPEJwUCFkfCloQAorejs4TylnTVBIODk9Mms+c2pNYTc8OGVKVyQlYDE7SyQ3
PUo+aTlRe3g/T3E7VDYwN1p6NmE1PGprRWMtUW50RH1kCit6dE5kaEZOYyhQbTZRZ3hKPWM+Qkw4
MSlmR0RtNCE+PlRnejBjfChvKkRlNVU3byNpcmwobHlWfUhCYWtXYkRGLWcKK3pwSCplR1gqV3to
PVBDYzctS01vUnshVDdDVEIzRXpqbCg8UzdrT0czTTRsRHxrKkJwWEtAYGlrNClyYUZPQE5taQor
em5ZPWA9JHpxemlsRT10R1JGSz1pR1k7clNOUVRNQS1IKV43ZnA1MVQoMU9HU3BQRnxzKEdvaGgh
Q3B1Q18lazB7Cit6dilhSSZLeHVKNEYoa0QmTWU+ViZMYGxAMUIzZEp0dE96Q09uYCtzdDt0YUI3
UzdBNEAtVXdOKVVzbE1VM0skUXAKK3o0NTZEeGR5OWxHajE0YmsqWE16aVJkdyRnYig2WClxZSVm
I0cxeishQ3dtYlp1PDxsbjNsUShLP2hqSG1XI3M2UQorelFDRWdVbDZwLTFtMiNxSUU4fEcxM31i
ZnFDWUc/TDZKfjRye15RKXlKZGBtPER1QnE4Un5xKGprekEkNS1UJW0hCit6TispVlAqJGk3Umk0
PzA7XisqLXZfQnlhdC16Y1Rac2V8ZmUrKlRVKF5DKmEtWkxrTU0mODBeRDlSX15yPlUrcW0KK3o2
SmlKTUgxMGwkUTM3JWM+ViRfa3E+K247MU1FSX1yJTw1YG00KW5SPCZlU3pSZ2xZSjFQS1FiMkEh
YjRxUnx9fQorekd9eFBjYl8wWlNNNGBUaWtRdFMrbjhrbWprRn5rKyErY31PYGIzYHhqbylsRz96
KWgjVHg1PzRsODUqWCs8e2o0Cit6Zn5PSn5KNXBUaktSN3BrYlpnIVBYTV9tYjlyQ1o1K2tKRnZA
Qi1mJVhicmlAbFdQQz1JZURXU2BkdUxGb30peVMKK3pQenhVK1FjJGdVaiZkcm42e1B1Pnt5Pi1s
YndUcXw1RUpqbkh8bE92NTRwPW5MTzElT2ByK1ZiZyhuVTlidk5zQgoreiRyTm11UnglJGFxe2lo
O3lFelVCX3ZDPEAmekRDP2IrSURjVT5ObiVITml6cl5oUnJncyN1WjJzMjlJM3ItIXRtCit6Xmwy
NDBXQkNufm0pTFdhWllfMGRwXjdTUSlFeHRjYj1rVGVKVzVSSUI4S2h+YXhBfV5hPUlSeEBXYFN2
VGtTXnUKK3oxWGgkeHJ5I2J0SnUpfk9xbkNyeFM2cXlpZ2dBUFZlJDVwR2I1ME5oeTlCc2VrU21t
TjhVV3FuOX1RZ25ZUHdtbQoremVvd0haN04/YkM+Nk9hKHFfUCZyME01Zm9HdjFZTnEwcHIxdX1w
O1peNlVBZFYkZCEyZlhBOV4pYz17QiFwVE4pCit6SX15ZnRWVDVgXipFenJ0PGgrOCpnWS1NfkdW
NWdaelB5PEZBWWBnfUBpSHVuSW0+NUR7WmojWkBpTiZBVU9ydmsKK3paJmRGYCVLS2ItcFFQUn4p
OHM3d3AxaHdVQDZjYmJjY14kVzRFPFpzRWR4Kk8mWD1wOVg+V3VOQFRYemU9bjx3eQorelUlOENG
cTNVYE1kfX1WQUp8TCUzcXpDJmxBfH1NaGF+fj84MmZwKXlMUkJSYU12Y2RzeUJVa01jWGJfJCFX
WTJmCit6cUlgIy1hcSUpQ3lgc1BLMDEzSyhXWVMle09ZJiZgbDczMEw+ZX1SVng8PFhrPis8LT08
QGZ1V0hNNzs8NH5GMkwKK3p1KGVNISg0YUkmRmVKeXJLeDtEJEcjJjw4T1RhQmkhIzgwY2BKNWtV
JXslSTkpenhydjl0QEpoY2FzcTFWZ0pUQworelRwNWdUaDAzS3FMfUlCTSU8KmkrdmZHeCswdTlu
U2U/MV45N2p6TDtXeGNHMURGYWJpJXs7cDZMflJDZjwocjNLCit6eC1SdnwpeWBlJkBtUGlMJmJA
cTh7MzNXI0VLPzN1RytzMXx7NClLbiM9R1FgQUAzQlYpNzIxbT1CRDRKLWlPJFkKK3olbztCU3F4
TUU8dWNSRFdiSCUld2UhYzBWJWc7LSRGMk0tODVfWUZjKTwle3Y+PGdYUlVjQjA8emFCemI4LSl+
MQorekcmZlRYV1NYQzIpTG8rPWtEfkozSlc5WShJc2M0S2hwMjlyMG59ZUNrUX1SPFU/JShieEVx
YlJ3Zmg7flhiTERzCit6TzszP0JjYGBYKFUxQ0MkYE9hbyNBYylhWlJ8M2BsNCpJQj1ya150JklK
QllMc3NCV2M0dz98KlFQSFR4QnxANnUKK3o3cH1rcjZCP2YpRClOWDJrZ1UhUGAhfihPXyM7Izd7
OEhhWXF3YV51MVBAPHxZeyoqPyZDVmF0KD0rcG47SVRoJgoremZJdSg5bFZzNUtuQE1mKlJ1Z1pW
ZWlyeWVsXy1yNFFxIzd+b2xLeGE5QEc8UEF0ISYtKnNXQ0tjJkl4RVZ8QX05Cit6ITNUdXN4KCEj
QyskcDgqejtpOFo+Qz09X3FuZ1BWZ3NyRGJWJm9IX3RJRHUtRDtwUH1rYmApMTRnVztFa0M/dUIK
K3pXbT1jXmhoQ0glU1JPOXBPeW5vX3EqNmM9cFVYQ2h1RzdLcEsjYDBRezBXVl5wVUxjYCNoZzIt
JFQ/Qj0jMDRoJQorekVUcFp9UipKX1Y/QGFRK1pRYClsamRUPnt5TWtFdXRnV2hCY2ZAekhzKnhe
O0JDejFKaTZ5PG1SMT4zPV9fPGFKCit6YjB9ck1vTTRlUzckMlp2Zj5LdU9BJUQyVUZueHxmbzE+
eTNiUkEhcXQhM0xFTygkcnojYHBMdGkrNk9MWD0pR0AKK3p5RUI1SzIwYEp6ZSVWYXBQVzhSNWpn
NUJxY3dfbksyQnYlejA3fFd6VFBVZ0I7QGYoLUE5Q2FHXnBMUzZKUXJeJQorekg8M1ZidUA3Nlhp
bGxPdGdNUjlFNjQ1YShXT2lhUlpISChXQz5AY2IoKClgbCE+S0NucXpjaCZJXmdNYW1NXztyCit6
NUd7P1ZgOz1TPnNlX3U9Rj9BP2hVNnx9T14xfGZBXkwhVTJeRDBzWEBlTm99JUhpcHs7YmJ3RTkx
KFl9aXRSaEsKK3ojI1hCZmJIbj40PUspczgpKlZ3azlQdyU3I1NDZG89dV9eRVNUemVvM05pRzhe
Yyo5SVFVZkY2QTQkK1lhbj0wPAorek9WfntRKlcjVWNHYmUtWkRTMyF8dTJsPis0OC0zJFhyQzw+
LVN8cVpZaSh4WTdmUzdCSj1SYUgkSkVKU0M4LXkjCit6NndiPT4tYV82WW53KXVIQH5iZCZ3TSM4
eShNTkMqVWJDWEw8KHtHQmsyLTN8YFJCQkImdGI4d3pkTiNWIXg4QkUKK3pHa3tGQWNiYGFeYG8r
U0QkXjQ2JTVKZzZMM1Z1ZkkqOCs9QU8yZH5TWD07KD9xMDJkcjNWfmJkLVlwY1IrUFZRQworejg3
WClnckh9RjxNKTtrZFhAQ1pBcz9gZSNTeHhsenJOeUh3RXV8R18xKUNWOzlJMTA9QWoqYlFGR01v
c1MlRH1KCit6MXZxK148SUpOSDElIWVDTlY9M3AhZjlNNjBMWlVrSDA4az1ObDZoN00/P3R3SGVg
N1hRbVJ2Izh0bGBLMDVFWmkKK3ptNmNYOXw0fX40KzFhez49c2o4VTdpT35WP1V+THhneyZYTyte
bGkzKHpZQilaJGprWVFHLXIxTVElUGExVilTdQorelo+VztZNlZnbWtyVkg4ZF94M3B0VntGS0x7
SHAleEM3Tl9naXRHTWVfaXN6ODEpZml0YkpMODd4REZeZShMSy1fCit6SlN3KndNbm1oc0NHdVV4
Wl9XKjFFYVVHZl4zWl5waz9nJmwkQyRRN0gxO081bGdvNTB2LWd3eVdfS3NVRGI4alQKK3oyMnR9
XiF7S1BsX1VPajZzOHc8eyUmMlJpSjdHVD9tbStlJUN+b0pSOWBvbUxCPH5iPVVMJkA8RjkmQTtJ
VUpDagorem1ge31MNEsqblZibTQoQEp5VTRjUj1RUlY9b3lLamZLeEBDR0FZT1dHdCpkLURgTCUh
UGI2cVZNQ00lfStXamNQCit6SWlIVzQ9WkRWR05HR2VeblN8bFZTa2tXYGNIamN6PyhkQG89ckEq
UHtVJkZZWTVab1I1eDw1c1M1Skh3NG9NU1gKK3pCKlB5JD1kSVJHXkpLU0x5eWVQa3hBZk87QldY
TCZvIz9TN0lFQCY+Z3kkTmw1cTctbFBCalNzLU8kcFVMdn4/VAorekhNQVZyeTMlcT10c3RCaXIy
b25NcFE1alFINzlDKlFwMm9FV3QlV0h2ZkItKjNHbE5lR0xWJk5EVFkxPlBBSkVkCit6eHU3Z3Up
Kih4JHlnKTsqPDN6O2NiekRkVSQ1aENBNFYpTkBlbzU9SGlwX0VFPVNrMXpGNldgOURkc3ppNTZy
P3kKK3pAMGFZflc0PUBhUzZraU8pV3ZTPDZsYUVGUkwhfG95REkoPmY+VlRsS3Z1Tn4rKVl7WFVw
N1UmOE5rJit4V1VMUworeiQye3l4ZjlEe0AxeVM9STM9d0pqaTFRJUhjMlJkTmkqdWFZZktlcEJC
cjdiK2Jwc2g7PEB7UDFEbkhheGVpdHV4Cit6SUZIZW02YHhBJU44emIlWXwyO1YyKjZzUEUpfW49
MCgmci1pNkBoZ1NPWG03b2JfVXtncWs0OylDe04qXnBDaWwKK3pnYXRQUTdJd20mM3lpeGpCZWcw
eWdNcEdpaTclbjRwUDViWD1nQVNSeTFzbDhgTHdvQmVwXmZ7fDZBbFJyO2d+dQorejQ9UGNgcDBm
UkIoKzdGeFIzZEl9I287ezlLODs9bXRwVTUlN1V2fFlAPFFAYUI3KnUzZ3Arc1J7I0ojSyNLREJB
Cit6Xy0yMF5VK25gZj9tSH5VRFhsWUY4bmBANmNvWVUjc2hrIU9vekgkNXFwMDlrTWotSkRUV1Yl
dHAlaDRPLXdMR3UKK3ptOE54JCsodzVSSTxEQ0U1KXE+aUFFI2AqK2E9YCoxSGpjPkszWCtTVFFv
JTVmeT9EZ2o9RUpzOGtBQlBpJm9sRworei0zQyFNaXZra1lGMjBpTipAd2BTZSF9QEZhWntVYSs/
SWJUSj1NN0IhSU49eGpgS1Fyd1NTaCZwTCRHZkQhKTNQCit6aXNBS3NRaUYrTkpkXjBkbGt8YWN1
d3RsKVk5bEM4JitiTnZBY3IoV09+e0hMTXM3PnhtUmxiPzU8Un0pWl9neH4KK3pgRUglfUNFcjgo
SkJrckNwdC0kdU5+NFlTc0ZBPVRjTlpraXZ2ekUtRTFIUnJ6eVpQeVomJlFKal8ocUduZlJ1ZQor
emBWKFhHdGVVKlR6Ql9NOVp4bm8zcmBtZVJOKk1gXmhkWiY/eGYjXkR5aitMTmpybE1+IW9UJENV
ekVge1A+ISpMCit6dChLNnJob0tJXmlyOVlBRDhWRHl6THBYbSlgKWZ1SiVmcEhkN1gzY2AwdiZe
Mm0wKCspX0VTN0tlcFNDdSlRTlYKK3pnbXpzfF48P0hOeEJWZ01fS0VNeFZ1VH1gSTwpSWhKWl98
WXR7e0NZTT5mOSpqPjNTZDxsPzN5Wl47V01pNCZAegorej0qRF47OV98QXlMX0duUHokSSl8U2RK
VmdvUVFgJkEzI3dZT0Qwbm8rMnpiNGAkUX0lQkFXYE9COHAydDtLWlI2Cit6cmRMITtlTjAkXk9O
MkZ0K1JyPFB3UDQ5V3NSTCspSDZ1TWBSRnFhKntXdl9SRChjYypxO3tzaSohWT0pOEpoMDgKK3pF
fEd1OWJEKH09STVGVTI5KkFodztrKXkheFNoKnNQKXdzdSt3d3htVGt9ZDsxWSpiKF85UH1iU08z
fSpzbHhROQorenFRb0NYVFZlJmdZWVNCT1o7YyNwYHtoJHh7IXZ0P3Q8bjdyOT82byFQc3NtejFw
Vkx4YCZofGtePyFYMCtYSFIrCit6WXh0MkZMWVRjUHl2ZzFWemZOZiNkJkg0N3tvJnV8QCFrMGhO
aDxhbiVzZStxZXhqWjBCMUVtJnNKXi1JQ3dxc34KK3pjV2A9JFolXnxyVGJARCRiZ3k9LT1Yd2BL
alA2NlJTclB6YXJYe3g+ejIoKmBvP2Q4R3ZSRntGclAjc0xnWHxUbQoremhrbzhlaVQ1eTI5dz5D
S3tNckdVbWM9V19eU21wUHhMSUpPKjwjTmlMV2FFKXNWd1VvMXJLe0BmWWkmfjEpPmIwCit6IX5w
NGY3b2A3VlNwRnJtb3A0PWRgXmJmNSVSeWs3RjBkJjFXbS1FRy1YdW5ZIW5iJSY+WkZUZERoMDIj
RV5HNkYKK3oja3xDciVrS3QlZ3NnMnk4PENaKEhWY2kydTdvfGNFVSFjaHB6MzVlUnY9JVc8Zn5C
ekMoRncrX29YPEhJTkVDOAorelZERHs1SGZgOSg2e3I+TUd6fVI4bUpjeiFRYDlMTEI2USowJW5s
Z25kPD1BWXs5OT9QYy04ZkxjUDBTdnZoeUtACit6bW9TbjkpeXZGeVFRd2BAYFFZfmR8QWFzQ2dr
ISFqZjFJajFea3dgcG1lXyohZEkrUVcxSyUoOSpNN2FKU1dRRFcKK3peTHNlezE7QHhAKkByTFo3
XyYlWkxHNV81cnR5NDxgJStCVVhrO31mO3YtQ2x1enh2QnVZNXZadzEzMUpVWVQwSgorekBvPGV9
bXJiNUgwN3hTTj1gajMtXnhkK35NMXxUKWhgIUVFKHpJZztgWmFSKF96ZDlec2FRJTYmO0ZgZHcp
fHB6Cit6dVZURkMwZntAX3VpIW1oKisocFd5TnFZe3g4JURrS2kyYTNhUVNoOUR4VzFVOSNmZz5X
UlJ4TSgtS3JlQ1doVlkKK3paN3V3MEQ1NUcwI2RSZzZCKFQ0PmJ1czlYNkZSSHhtdzk5ZyFWa25R
eUhfNmZoNnRmYEdMUElLOEw1IWFWTnhoUAorel5kKE8zUFRKI1dtKC1xUjlNRjZ4STxjUEEmSWll
eW9QOT13PXRaWWNMUndqQWs1LVF5THdzTUc5KVkxNHo5Ozg9Cit6R2tMJUFVJlQ+WWVZMVAkNTVw
dV9hR2tQYSRkU3J8REE3Zj1yPnA3REQ+M2ZKJD82MDk3R156fnUmNDZ0NVpURWMKK3oybGZXeVpn
VCVmdmhTPFkxT2BYZDM9VUcldHF4O3F7TW1vQF44R2pZSU9eLT1ZYXlSPTFOR1RHVlYoNStCSjs1
KgorejBAYzxGZzcxVXEwKkY4JjtvXitGODJwNjlOdyk3Tng1XldqYjc5YG1gXlo1ZzZzdkhYNThp
X1BgfS14U0BCWjVhCit6ek5XeV53PWpjaHZrKjZtSGA+U081fklKSERLU3o/TlppXnNgIWomelZx
VV85b3ZHSU1lZGtja2c7Vm8+WlRpfGYKK3p3YEpzbSVkZzQ0R2lYYFdQU3NDSi1AWWZmU3t6UHs4
PiZMX0NXbk9CRGhQODhpWlVtbDdiST9CUGglPiYzSzY9KAoremlRNz9hRzIyPWt6ZU8kPG4yRDNA
emt4YlkzUzxrQ0ZDNGxodGlnNy01JSZLajImSmgxZTVOSkB0JGhJdkdsaTclCit6emNoPTU7UGBP
aihuPHdPYT4lRmpTVV5ne2w3Xz9zMD56d2gmcDlgVjlwKnVWaCY9Xj5MXm1sNFQ7an5vQk5JNDUK
K3pkLU43SV48fHd6cnVgaVgyMUV3e1pfaHZoXmUqVm1QbkRkQWtzcjlHcUNFQD1RVU8oWWJ1NGt+
c0o2RTBZUGBhaworej5lI0I3S3NDVGxNXnFpaGNkY1Z+eCgrQTFub0pFSUcoRColJjQwaytnT1hf
KSVfJk5eMDdYdCNiK1JiRDQxbFZ3Cit6T3ZON01wRnVLRHpWWnZgdWNWKjE3Z1A3RDQ1RWJHKj55
TVhKJWwhI2BtSDxPVkhEdkckfjs5R2szU1MjUWM4fHoKK3pMOFV6NlN5RTI4MWFMZmwyKG1BSDdg
dCUpbyszLX1WWChteTtPYGEmQHtvQ3w5VCpaJi1GNWBSKEZMTnpzYEclbAoreiE0bXx+RVohXjRq
PDRxTm5YMTYhR0FlJlVScWtAVSVWJUgwV09UfjszMDVGYCtIUlJqRHpRSlQyfXp7bVZfYlU8Cit6
UzVXeEkjZlB1WGlTQm1WI2dZe05YbEF2PTdXMH1jZnNBKjlZPzVxKT8qaj8wUVhFX31EcXl1I2Nl
fUVYK25vWWQKK3paWWFAPiY0Rj1OLXMlWGg7IVJrKF9aPDteI2cwalJqSEFnJjwtQ2pyRnwpOzx6
VUw0SnlSWVEzM0AqajdNaXIhPAorekAkYHZGbWo7IzwhXmgoRXB4cmdQeilfMmNPNGdPTTMjVzVm
OzhBfGY8UytEbDU7RG9BJDczWC03WmVvQk4ze14zCit6TTJyX1lDR1FPVlJjWmJWI1A8KWJ4bEJD
RG1OUUxvSylKY1ZeeDAtWWJ+X0kxKDkyYklUY1JjUXBPbCkoX0U0cioKK3pNPTtBUXI4S3ZQKmE7
OVZvX1luVFNII3tIWnopTHFKPEdtdURZVi0+QlJ3R09lcT18ZXpEXlB2dXFWdWFGWEpMUAorekx7
aTw2V0FGTSpsNnB0M2t7PFVSPTxrdyR1SDtZaktWd0JQQUJTd2JESTxjUG1TUWFhdCt1UDJTenco
eDtERWhkCit6MVIqbjdLOHhnTj9vfT1KY1E3PlRhVXlZZmh6KjI2WiplMXcmZXxobkF4cVpXNmZ0
dUBEekpNPSZhRDJWeyMmPnoKK3pCZnB0Z1hrd1JDLU8wN0Jnek5hM2ozPStMcXQjV2lMQTNSJHpg
KUgjRXc7b24kdG97bEpsUFJ5UnFnTXxZWDVodAorentkKipMUntKeSlMY2Q4STYmYj1kLV9uVmJe
dUd8e1YqUlY8VnVvMClaWXY4SDtFaT11JGFvd01jK3Q2QiR5Izl2Cit6JGg/TlRTRlAzRFktVEtP
MjJSe1FZNXsoSTxSI1QhS2laUVhSOyp0dGBETD9FQkdFUS01VXckbD8zSSZaZERYVDUKK3o1VGJq
ZSlMZUZ7M2tzKXxZUjs2WWhJc1V4cnYjNGZiazlBWUVOciQrRHJRWUF0PFFUKXdmY0tmRyg4bCg8
VE1GXgorek99Tyh7JGFuJUlQNGxtY3Fye2ZWLXVFXjV3YTMhfHo+Z2FDeStWNG4qdS16R3B2QXNL
PkxlWnBOYFA3YD5ubjZWCit6TE85NUc2KnVKKjM1d0M/WV4weiE5IyM4NDx4VzBxRDYtelpEKW1m
O1NqWXB8dCFPNlQheTZ1X2hSQl41YVU/c30KK3pGbHhjb2UzVXprblp9RlpLWUkmdCE4MHsxbUkq
Z3h5YCpndyp4Umd+Njw4YGh1VTJMXk0oU0l2IzN5dFMwWFhkMAorenVkP3xsTSp4MiRtYGU7UzNI
eGA/JmdXK0F4ZkFVS15fdlMxQH1VeENRRFE+QjdIPUZFdSkyJSNidUF7cEs7az1gCit6ZVY1QFhA
Q0Nta2xFakgwSSp0U1FvRkB8QEFtKWlpT2gmVjBZKk09ezxSbTx4d31RMiFLflV5SzJVTVlHR2FX
KXIKK3o+PEkrJWdGY0IqYjlEUyp4OUZsYVgpOHljQ3ZWRmNDKHBOdXFCZXpfMnRpejc7OT9HVnI0
e3VSdllOMnA2X1YzUAorem1aP2d1MVRGPVdvJVI/WjIhPFJrOVhrcHNsWFg5e28hQ3o2THdpTVNg
K0JOYUVaU2VfOERDK2crfiRqMiFvNGBGCit6QE5rcSRHXlckWSFEU0coTmZwUlFjWVY0UTcxKS1X
N1JgakwqOXBQWSFlKCojQXY2OTdrKnZEc3Z7Z3xJaH1YazQKK3o0RCsrTzxVSj80YGYhfFdqMFdo
QTNiR2Q8ajN9Yzw+JDU/RW9EZHxVV2JTYj03JnFtRm1IM1MycSppR0R1UXE8Tworem9CSypZU0wj
aUJhMk1XREBPazx6ZTJyUyRyQl84MmpxJntAI0AqS3tnX0c1PFNmRklsYzJMQUshQj9zWTRLREYt
Cit6Q2diYSpYQHVmJEVWKEFme3lsdldxUlZ3eW1ZcTV9THRva1dGcVJZPE9QPTJveXZTRF4tNXh0
SUN+fUU9OFFnK2gKK3pEN2d0a2pGeF5VR0JBK0hEYEVVaWkrN3greXIhZFB2YTEqQSQkclNHXzx1
IWo0X1BPdGBubUhrVXR+Mnw1UzZSVAoremtkTSNnZm0yeDs3UXVMV1goLVZ1bDg5Z01uNX5USmB+
Ozhzd01aZj16WSQteGNPeHJeY1I8TUU/SEpsaGdgVnx8Cit6WUp3OTNOa1FhUz9ubCs2VTcpfEtQ
ZXhyVTRGe01AbWslRlliRnNPcyR8fXpaRX5IaUNIX2RZYj5PPXl5PlZod1UKK3pJQUtGbz1Ldmcl
ZVp6eTFVYyt6VmJfJk1QQEtNcERwOVM4VzY+YHlLJTI1NE1HbkAqNzVRdSo/RGlIZzhOWD14MQor
elZnRzUhUiU2TSM9QG8mQG95Zkc8JDVlI1NSbk9+cjJEaWJVdEZxYFp3YlFhcS1AZj4yIW8zO25S
ZUBCYSU2Nkp5Cit6ZWplaiViRGJxVHN2cldgcTBHSlM3X2tRaHdaMUs+bVN3Vnc/V00qZndkdExu
c2xObzRfVFUrOUxGQWkpZ0kwfiQKK3prNysmLXd8JnU2dTs8IztxUUtHdUZCa082JGA/eEtPVDhM
VXlXZExqa3A4SDhLQnQoakMkJUl+WX5pPXphbTZOUAorentQfDkmTGBfa1pvWDNAQUstVVdQcllt
cX1sUCQwbVg/UiFgRTBia0JTKGZGJVBQKEpCZW9pTmthOHpoQDdzc25xCit6YWZSY0JLTEo/KkI/
Wm0rPlExTVFTNEZwcSZlKiklUUhwVGJZVEpfWU5CVyVlYERwK0FCWH1VJGBgb0VDa1F+emcKK3oy
S2dDckl6UColUF5+QHVXMFlIVW9McUhGcU1CeUNHVDc2dChkcEI4bTFaPm5EdGRRVD1FbyMrcllo
RSEqez9UYgorelJSIVJLSl5ZRGNaUzk8Tlh8PVR5M0JoUlU+aVpxPD8zTmdHLTRuJCpIQ016dGJM
V2hVWilYIV4kUGEtKGRPbjlUCit6SU1gNW9rLUdkVys1YktnIS07YERaPVNuOGclVF5GVXxHND90
UGQqb3NDRHI5ajMjQHhCVWwrU29nJTVGQHk8TSsKK3pQdlNaOW0oO3IkWmNRRT1DWUUkKGk+ZTNW
IUVQPC1aa0R5QXt2aE1gZT9wISQoMEVzUV85YCZfQy1Pe2dvS2U/WAorekNoMjJGcU1oa1Z2PlZi
QXQrYjBvbjxvPE9NOHotdjFNPSoqVW5TMmJmQjVnXiotLXVjS2JMMm5MYmQtOWRHLUx6Cit6fE5x
T2d8MVprMz1SWipMPkBVfFRjfipVbWw0cUNrcXZoR0hfVyElYE9wY3EzPEgmKjQ1eT9hQ1RXbHRk
TCo4Q3wKK3pDU1kyLW8pWG5qLVNSQVZHcm5kSVg3c3ZPPyU4dCkrMVp2ZWYoJU8kamgqUnIqaXxa
Pi1nQGFXPk40fUlFYXZQRgorej1ybF8/UyR4Yz1aMSh5fmVMcFlye3B2Nkt6VzRvZmBRaD9DOW5u
P2FQb0BJN3ZNIWE3LShNbzRTdjhnOT0/JjEwCit6dlhkSzwrVHRDb1ZwaCRTRXhYN2BYdjhucWk4
b3hkNWRZKz05NXN6di1KfmFuPiFHJD5gUlZFSUUlcURxSl9DK2sKK3omelEyciZSV21SQmFmTEZr
XjZZREVFdH1AVHV8S1A4TDBYcFlaNDwpe19vLShgJXxSSDt5cShJX21kYnFHfEQxeAorelp8NjRY
diV0KUBaQFMrcnp2Pz9uSCtNQHJHQSozRTBrcHFAJmJvOVBkKlg3LUIrSkFkdkokaC12RmAodVk3
SD5ECit6QVRrQ1l6VCFmMj87R1ordWI3RXI8cHhYczdud2Ngb0lHN3hZXz9VM3d4WiphI0hMUXpD
dVRkQDg0TnM0JXtrQT0KK3o7dm5eNFhXd1czJF9fXk17JF5+KDFTVyM8YyVZODBiZ3JYR0NFWVY5
aTtiNmFQV3BTOzhnRHdvJGRrMWBtLVI9NQorej9vIzVxQkotXjQzYzBIbjZBS29KT34hckFYMUFK
aDxHeDAtJD8wYkwmbSZVaVFQYTRDaGY3WjE9YX4yVkFqN0RDCit6MWtraCohbD9mViZuIW0+JlM7
Q0dMaWdvaFh4KTYwPC1VIU9UJDUrYmwqTWV3aVdad3pjfVEqKk9oZ04tbGhlOWAKK3pwWjN0SEk0
eXIqP300TyZKeWpFT3FrU2NaY3J3WFheVklmYHpwNX5EVmp5PG9nbzl6PEo0QUo0KW9ATEVzVkRi
Oworek5mUUxmVjNTfT5manROKVF0TFlWKjhmSERDVkMoalB5JHdEa2dNMDV7P0B0cXJvVmo3YXE2
YUg3RHlqK3ppa0c4Cit6TzRVLT1DKWQjbDZoakZYeFNOfSNZaVE7R3E+cjRiPi1CIyFodmk2ajA+
e2taS0gyR2YtRD1DeCVoPFJIeGVObFoKK3o2NVlhfmd5Xj52VyZhbUBVanJYa1JweHpANmJNTmZC
MzhGVChGLShmVDlSfjxyZnVqNEJ5R3xwWlE2ITVnI2c4NQorekdCZTJ4b3ktakxrJmp2PU9HKykh
Vm5rTX0lbGJ5X1ZzJWxZaWBhRXAyfndlfXV0c0lFPngmWHMjMCsjYnVnZ01wCit6cTRXTyM9VlJ2
MT9GPmElZSFxUis8K2VBXmRIJn58PVh7XkBvUjUzUHZPYSluQWdhU1U8Vk9AZ2FFbyVFelVKcCoK
K3oyfD5qN1RKYytlS2E1P2g7JE90dUdWYTF9PkU8MmRJPk44ej8+XnpUdWNTU2BSPXRTMyEzV20j
bTchQ0Z1NF5QLQoremdFKmJ1MThhQ3pJTj9EZjczfmwxRldaKCpafVZMcm5EKClZPEBIejMkN2dn
dXF+JnVWSygwfTZ3ZHE/XnJ8e2laCit6QXNYRHtKZj84cW1VSDl6WHpUOzFXNjB5bjh0JUdgX3hm
UXM8dThDVis7SkoySGFfTU83Ym4pPUN7fHtzUzc5YnkKK3pGRkombUB4JFIqWiVIek1TU0o9NHJY
Tk1UbnttUExxeTAhbF5ULT9oc0MjZVY9V2dGNlpqaz4rX0FfI2xKenhGMgoremRoPnd+b2h3U0wy
ZnlZbXpTVnFqYGlzOWZnfGtNTnBObUt5U0ZIOzlgc2dyM1BWWV5OXyZKdVJwMlIkZXl+cHQkCit6
e05USEFFN21gUk0zciEpeTd7Z2taWWFVPVB3dm0pJENuWFBecEZHUkhYcGRBdyl1KkdqX2smbGFR
SiotJE5ZMCsKK3p1MkhlUV44RUM3eyp7eU9TalhAeEJZd2RxKyU8YnslTjBNMWNrfH4jMy1SLTt0
U21vN1VnOHQ0ZjtfcjgpYEdieQorej4qPUctMlJkKyExY0JobCYtMnJfMnMhYTF5cD9gZk1FMWJO
QUhSJnQweWpGPHRibV5lPmRRWFM5KzNIaUxVSjJjCit6SmdfKWAmJVM1U0tRX1BpMUFKY3xhYmtO
MWVSWTM3ZW47Z3UpMz50Q0AtV0oqYEl5cS1weFJmVFNjayRMZEhtZCQKK3pLY204JXtAJXx4UFIm
TnhJSjVqUW94Vm9JWXdaJmF0TVV4X15WTypsTTZ7UFR1JlRQfFhRZUV8NkQ4QUVLIVBseworel5Z
e0QoPGdmejhkenJjPFMyNVVVOUV+KyNMSVhTbyZIUj5ncngoRDJwVGd+aF5YVjQmJDV2SXxVMnxq
YUx1Ykp5Cit6PEhHNDB1PmI7LWlzdjJUSGRkQD9zNTRCY1l7VCUzNSNrblA9TShqaHV3aEpCcUpw
OHhrOHRUakpDeUIrZmxFakQKK3pXQ0U0Zj5Wb1pOZElWbHl7dFdqMkBqRnB4Q0JCWFdiKXI3Jl9R
Nnx7KGF8SmhMNDNUeEhDLSR7PShNJXFiVHpZaworej81ODNsQGNZeTl3PEFaOTJBbTk+JEhje1A4
U3YzVSs8Kyt5NlM4SWhMJVNJOFVyazM0QjtEd3JteG1NZjdlRjh6Cit6TmB+fjl4Y3FyKzhvfktH
SUw4M3xnX3BtVkZARElfJShjZU1SbEhfYTBETU5rJHVMJUFyZlg4cypUMntOe0lyd0oKK3o2Q1dG
aDYyTlZ0VCptJipebWs9ST1XXzRBNUlIQnhEdShSKyklMnMtYU55YXxaJWA7VTk/K0M8XkJ4dlo8
VXg8fgorelp+cjFLTXZrX0x3a09rcndvPH5NZkdWODY4T09gbUIpKVEyIUNsKkNFeWFTLSgpUmd0
eEVYbHZCITBnYiV2PjV+Cit6ISFWQnFUQU1WP2ZuaCFrQ1Z5KHwtWTBNV05CbilGdUoqT3E/QXcx
aFNjcDV6PyZ2QH5TOzE7UzZDM2VJPVFwJjMKK3o+MEBYPTM3Kzt+fEReVyEqTWduQzNJJislSXpA
YShsSkFYfkFBYTlSYXpQQSNJJTlMPjBGdnRPTjBLRys2QnVFJQoremVBUGF0a0soR3h5S1kyUWlf
UHUjVm9fbl83YmFIIXt8cEgoIXVUUFMhcV5vbVc5cVFGOGxOfFA2K0ZwX3F8X091Cit6Jk09SGpH
O1I8RzBhPjQ/LXduNFR3ZFljUnsyaWR6ancyRm1rJWlPVzIjZE9AU0U3Jk0kZCEmP15aRE84QTdA
bXsKK3phMHthPmtIO3FQZ0QmYHg1MktIOyFnIWhmSVl6Ri1WO1JGVGVzYUcycn4/c0Y0ZGMmRzkw
cF5WPDsocWV0UXBecgorelg1RCglbmpkfGA8ZjEjZUFzbXhDQF95NkBFY2ZDQXJ1WVhFPn5IYWZg
dClIVzEqZiNtZm54S1U+QXdXaWRTTGZpCit6eGJnTWpDM1NvTEV3KUhaanEmfEQzSX5+WTkmVHp+
OTZ5R2k4cVlLMGtJfW5kYzs5Z2pKNmVSJXdAcnFAQk1KdmEKK3orKkVaJFV3UXVSZ0JUTDlkJkVl
fjI0ITFNTSN0Nikwbj9zOzV0UzIxQSE0bj0qdVFKU082K3Y8Q2tpfURIUiQkPgorekFXUClNdzFZ
aHw2WnhJPFpALV9aSTxWJkhpPCE3SiZwZDF6STdHKCs3PXtJR0R0P0hhZmshY0JxZCZUa2Y0fXVV
Cit6e0dJK0QrTy1yQkwjcEBANU9kPW4mXz5WP0ZFZl8jPU1JanplWGRCPDg+ez5selh1ViZNLSF6
NHdvRiZSQDUxakIKK3o7aEojeEwtc0Y0X0c4PVJqLXh+UCl2cTtJQXZUbkVCU0p9ZDV1SjFwKkNV
OVJLWl55RVJWS2I5ZGxDbnhydzMkNQoremhEN1FnNExFPCN2Kj0oc0d3MmUlMTVHQVBCYHRUWUZL
aykwelUySW9qbHU8b3JFQm8qVzlAO2EqS2lpRXxNYCltCit6OFQtamReME0+eTQ4WntvZmxNRG5o
JiZQdSlzKSteMmJSNWJIQWYkdUZ+TjVzKTg5bFUhe2htUEpCMEk+PyFwUDMKK3paX2hlX0wleWRA
ejRuN2tqK0dBTWk2d0FGOCQ9WDdtTUhuY0BHJG9mOSYwfFpBcz8wTjJYe1BYSmt+dCZsWS17VQor
eit2bnBxbDtaZjxgYTgxQD49cGk+eTx8ckV7fXN+NEdYanRPVEtqKlo8dj17MjdyITw5K1E5OUlL
UF9tejlQKnBfCit6ZCtRcXgldnlaQD9KcHklbi00VlNIeTs9Klh1ZjBpe09QJElfXmB8fjdYdXVj
XiFhOyE0SHZ3RHp4bH4wKFk/WnMKK3plY2Q3KTFPMGExcmJXTUwlfWNpQ3tjOEZwUndDSCZtaGFX
NV91RngpQH5AXyEwaC1GbityQUYoJGQyaU1kWHs7UworeiNPfm5qVXNCTmI3ej9SUDs1V1lrOyR6
QmxqS2x8RTY4YXpSTDY4TD9iO1hnQk1YfTVBUm50TihKbn5adGohVkojCit6NjdjMXBIWCEmb3Mo
YSFZajhfT1BifStGSih3WWwrbG1qWFpReWk4bHo3a0RNciYjPm5Kc2hCUntUJWdwSXY8c1cKK3px
QUBpIzUqKyVWNDRzdSs2MzBiYGdPMD8lVT0qMnR7PlNpc1U9VE9GOUwtQTwhM3BOMExpX3lCPXta
UDA4X0BIRQorej9iQW51SWJLY2AwXjM+VzgpS2BkRkdHeVEoT0ZFIXpCQnpFTk5UK09nfTc2N3Bz
M3U+UGZzRWRSaiYjYThJQVJWCit6O3xMN05pNjRPLW9oN0N5MD5eMVpTTmdLclpAfmx+IStHcG8o
YCFZanZCSzkxYyM7Iyo9QzhwJTRVd3sreXlKTngKK3o3ezY3M3VQR1ZhNFQqOH41dUFUcShOcSNV
Sk1qWXV6PGowMjFZWmBQWCYkKz8qfSNvbD9jNEZ8c3REc2hzNU1sOworeml9KFdYKk45PTUqfSk4
LUojcmFGXyEwSnBhYGF+PkZaQmJsSn1LYEQkOFJ5Y3t7VzctSFhvPVUja0p3c3glPW5WCit6TVpY
bFAkenlMNk8hcXptZiFPamV0TnlxNEZNZ2xrUnM2eldlUjIqaXFKS1FFOEpHOUpNNkpUb3thTk9a
bT1+bVUKK3pKejFhNWRoOS12SiRQJm11MSY5Y0hFfCk1blJiSlotKE85ZjFCalZJNiR6M2JoZ207
KVQ9SVhEWEFyeTljZmIxbworej9tTGFSenVFZ3tYKXwkKDtMWXMrNm40WEpsRHsqYCZPa2h6bWJt
elUqSUQ+JUBvMk56Y1BUIXNYbztjPmU+Y1h6Cit6NldBYlZidGFSflIzPyo4IU1xSzlYRF94Rl5S
T3JUJmloVXR7SiZsWVItaXVyU0pINDF7Q15pQz0tPWMwM1NQP00KK3plRFlxcng4clM3ODFaXiNV
VFZRRWg1NWFCSVNOeTBgfnFHYnBUQUolSjFtJkMoe3ZaP3tDS0dpWmRVRmJwZUhmbgorenwwQ1dC
eW1iM19wa0ttITJeSSgqMDQpWjY5ck1OK3lmNUhBamB0fHVMJT5KelVXTTAqU0JJMDB7dz9lfHto
cDhhCit6SiRUUT9gIzNifUZYODx4LWhSQUFjJU92d0kpWmxxWiE9eTQ/PmB7bHpLUz4zNVFDdlNI
M0M2aDd0YnQzeHpvI3MKK3orcXJ6VzMoY254dWdCWnA9P3tpRiE9YlJpYXtifEhjdXQzT0lRU1VH
VV5yYW1oMGJrVWdxSz9XVClmb3Q/R04yRQorenlrZmtKMlhfPTBGVUV6NjJGPTh5cC04Tj0jfjwp
VWpjX1JIQUZNRj9UPmhYOG10cGdASnspIVJuK3duODR7Qj9ZCit6YDlyXzcqTGh9QEt7TVVaajww
cUxxaj4wI25EJVNzdUxgPzgtNCVpOGZKZUgkJXY9YD1fVnwwXzVtKEZ+M1l0dSEKK3oqJU9NRzkp
SDlnM1dPcmphP0BxVFdCITBZSGV8Kl5ycTNHKW4/cz92aUZ1RzJeTGRUUyUrX3Q0PiRiRlIqfUJk
MgorejJLKVZ5UF9XTSVqRzZ0ZWh+TCE+WTRORG5WfEVYak9gRXJ5ZnY3cClrTk4xKXRmJndIbjR2
STN1N3NkPHEzfT98Cit6LXxMSCtXJFBCMVJhYWNHeXJTQSF3WmRFPEBwe2N8cGBPQClFODtjUmh2
R3F4aDs2eXE1X0ReaXskUWBeM1ZJT24KK3pYZXtGSU13RjQ5UCFFRmdNQDYjQVd6YXwpcVkjUzYl
KVhHdi17V15uU3FQdWYhYD9gcktOZHJqITt3KEctdmF8OQorej5yTz4yNz5mRGJVSjtaS3QkRiY1
YyUkQSh6dF9WIXdacXA9QDZiUmY7KSQ5ZmY2QzEqWlM1XnZIZzd8Z0JCRzVnCit6UDBqNlZUaVZT
c1VubSVnJFZgJHM4ViRKSUo0SXNxeV4qTCZOVUI1QGlISnRMP29lO2d6bDs4bTdKc2poIUkwTl8K
K3oxRUIlb3JvRDBOQ0tMK3QhOzVrcEBjRz83KTluaEgtSDU7MDh3aG9xVkhlVUczQm5kLSt2a2U4
ZWF3ZW0pYXxHIQorelVRPno0UW0qamVAeHBWVEtqPTA2SipGUiNoJDVwPFk1Y29iQHxBfTArKDxY
bD1uNip0KHpJQihUUHp1T0QwcVhqCit6Oykpdj00QCMwa3F0KG1PPTF7PF5uNCNWUXZeXm8qIXt7
c04kYm1sUCMyMWZ2cT1URCF5MztPcGhKdytRbjRNYG4KK3o7MTkrSnJGJnRsYTcoNXlrYWlQfSQ2
YFlnanR1dDRSTWV3eClYa3R+ViR6PFR7NlNZTjZqNkwlZHs4OyprNXhJSAorejUqPyhvI1RuJSNZ
WkB9cF5hcWlodGpOSiQpTHNDej5VS3JfWnJNYSpMdCReVSh5VypIRXUyRz1eWipSYDlGMFg7Cit6
e1gtfW1jPCkwNmxkWFp4SkFld3BfN2FUdWNfUj8lNHRjIU1sQEwlTGxXbTY7VU9gVWhuam5RWnRK
WlhmMHZeKkAKK3p2aiopQyl6VkZvJlNoKTVrITNxZz1aWkJFRkthOFgrQkp4USt2Xkg9SiZAViU5
Z0x9SHJpM25hIVctKGl4d0ghMgorekptJThzSE5ESjhiTHJBR0x0YU1EVHZgSnNhaiZeXypfdTlB
RkRrTGlUKUtSWGRrRUVjPjU0VXwlUTV5bllheWdKCit6IVhDak1NMiF4ak1nfiElZ1EhVWJRS04j
V05lNUEqZn5aTGF2M2JrWlA0JXMmKGBqQzIyMUF4bU9qcGN3MXA+eHAKK3o+c3drSXJHM1FQOHhP
YzVxS0g8cTw0Z05jajwrXiRZaXVfdWkrdSV9U2pmQi00WSR0fnhLeFRaOGR8bUB1VTlSdAoremZn
M2I9dU4mMjkkWV5jWnlpdmYqMFlgYFdQIXVSUD02dDFEKjN4Nj9rPGtWcmJZYVhEPkdqNElxR20q
NlVZQ2J1Cit6Pz1xTUtTPiZ6JkklczRzK1AmIUFNNGdNOHU1QEorQlNBUmk1Myg8ZWcoPz5ybzNe
Kk13PX55cFpJRj9YaUFYMHsKK3pjQ1Z0TSNlNjZ3UnZKZG9TbF9hS2kmXjdid1I5PU01QnRNalc4
MFE+R0J3TVhudmk+XkgpYj8hKiYtODglbzlTfQorelM9K2klZFJ5aEowQGZYWEx2JVUpPzAhOEZL
UHNFQ3U2ZTd+M0RAVWJablBfI3ZuXlpPbihIP1Vtc0xfMnZRU2k4Cit6V0VFQG9BZXN2WUVoZjYw
P0ZDPihIMEZ2ZTZob05FaV58R01WXmhudlo3ckxkV044Q1ghdk5ZOFJSaVlia1NYI0UKK3pJY0Fg
d3gzQEgpd3l2c1N7RGx6WWpPWnAmX0huPCpFUT88clR8fGRYYm0mfUYhens4cD80YHFBSSRUJVpS
PT44VAorendXYSshO1cjQiNqSHp4eyp3cm5AWD03Vl4lZXN4JWIjN15JWnJzez0/YmVwfGBuOU57
bHdaeHZefEwhc0B4V2xWCit6YjRWbTNneEUoYTF8dDVMTk9SZmN2R1VPNjFCKHAxbCR6Nn0qdUIh
OWtjcSgmb2YzbWthVDIrcXMmLWx4a1dTMlEKK3pfSVlSJjJzLVVPUT98aUA2OysmTEkqTGhWeUdY
dXcoQ2QhSilCcW1rcHQ7ZyQ+fVhza1QxXz9sd1c1cD5zVWV4YQorej0jOyRaQ0RCdSZsSjR9SDNv
Q25mRW84fHJ0VkdqVUNeTHc5Jk9qKVJVUWY2UUw/SCQ+TXZaYWtrVTcjO25yIz89Cit6Kl5FKiRz
V1V+eEU7czVETXx3KldPTHl4V3Ntb31+RDdpeUBSR09scTlTXnVyNkFfSGQxSXIlUFd8ejZ9dlcx
Sl8KK3pMQTctREVEYys+cEB0NFkhSFVMdmRpO1lOO1RoalAqTn58dCNEaHcoaChmQzBNXjlocj9u
NzZPWmlXPj9XKnRqQworellMPDBONE5QPiQyKGw4RUl0d2N5RW9KVkdTPEkrUkxLdmRCMSVzRkRr
OH5faipAZU48QTRWY0VQNlgqbEcjM3dCCit6VjlmTm5gbj8xb0Fzcm8yQmhhQVo9eDJ2bUhJUWtR
UUopVTAodyNDUjZ8UldlaGZWPmJVV0VCY1dzSTdxUDdzRWYKK3pNRnpgT19eeUpuY2I3SzhZdWIy
fEhwV35qMkxZYztxayZ5RFhgX3FeZ2F2bD5yQ2hgVURTeHJTdn5nRVJgLWBuZQorenB9WUtIamkj
e2NIUjRHQD44SilHREtIJk9BVDJ1YDs0Vn5tNzdDTVVGP2E4KCleSy05UjRsYG9hdTc+N0BPWm5t
Cit6dVNpJUhKbWxWIyZQYH5tK0pRSDFqSFpvfHc5JUUwSW9nUSF3a3dwJUFhfmZHR048ekBvcFFH
OzZgS0tuRG1LeDkKK3psK2x3bWRaVihVU0R8TTRzWSRUb2ZUa05vXnV4VShATVNjNVF8M01rNHMr
VX43aj4zNzNpc1c4dmZOK3tjZ3RYRAorej5gZmIwRSYrfTglQmxoNVZBfTFWI1god2IlLUBwPUJN
YzJxMXNDbk44ZkI/S1R3bUhuKmdkRW5fbDVkWCMmaW4lCit6RUQ3bldQUF5FZEc3Zm10dT93WUIo
aWZIJHA1ZkpgOTBOXzZgIVNKRjV4clR+SWsqa1JRfXpSV0RXZlp6Tj9zKEQKK3pTQ1BLe2x6XlVx
WT5KVEo+aTI4MEpwcWRgQzlGNH4/TDheZXBnUkA3O0Q5VzdoI0U+cSMrXj0/d0A8c2glPUU9Iwor
ejtwb2FHTzl1UXF7Z3MzTXUmKil7PjBQcF5XbTk4a0o5WF8mYmsme2ZHMEp4fnJiWjU8R1NyKWpP
c0gyRTBKQF5NCit6Mk5nSX4mczs4fjNIcn0rcSQjZFZKPHh4KHh2dkhfTF58bGhWNHBUMyllN0Yz
YmBmNWhMYz1LJHA8ZEp3PXtBeWIKK3pJXmFVfDFvKzElRmVOTSRqekBKNihKJkcjTG1QflNrJkQ4
Tm5ONFpzOyVGKVU4S3RHQSZnd3hVOGdWWlBMQFY4TAorejBmbjtgXk83fUNgTExSenJuWkp6OGkq
VUVpdnd9ZnhYUVRiI0BiYkBJSTUjNEQ1b0Bmaj5PSX1OfjMxITs7M251Cit6Q1J9NSVsVDV7eHJz
MGk1KnlwPlR2fCU8TUBiQlc+MjV8dHdwfmRCUFY8QGx5NWh9elBOO0VDdyFHSD9gSV81ME8KK3pV
bnE9V0R5NCRjMnxaR0YySXZsOExDNmxxTE5RbXM9IVppaT0wISpCNUI3KVRMVzhqPjkqRnJYNVlL
PVdqcnZeRworeilpdSQwcEZ4dmFhbHkxKnUqO1MhaT4wO04kK0RfeVZueFc2UCFPdURTRkZzZUcq
XzJLdVBpZFMqMjRLMjdqQn00Cit6SGByPFAhfj1sfUtmWGNfeFEhKzhYay1iM2lGbFZscl5ZblJ4
Tyk0UmNJZFU4K3VFO2RaOFdmMnYzPTkjWjNmaUYKK3paN3RVfjhpK2h7bH1acVQ4U3J+ektCRnxj
a3tNRkRfYEBrJXNFdVk2PmsmcHAxPE15Qz1Fcj16cUMmTzw3PSQ3Sworej5PKGIlaF5hd0VnK0op
dzNRUTs+bF5OTEg5TEVZdnV2aFU3PW1rOUhDWU83b0hATTYxSE1VfDYheGFIaVg+TE9uCit6Mmxg
dz0wfURgVlRRUX5SNnRQe3I9RX1PPU1tdC1zT3BjQnxxWFRWfUR3Qio3UTstSVlZZVhWM1peOUli
eCl9MGoKK3pXZjdgZGc/V1FxXlNpTSRUNGE9N1M1ZXdtUVIqPkVuXiVAQFQzTmNTdlVJYXF5MzI7
QVM7a0gtazE9MWpZfmB8cgorelRtVjNndm49OTNVeDV9VWEjaGFWalB+bnw5P29veUJ9Kl9WWTsw
SnYxZzM0PCpKQEA2d0YzIXBkeU9EeC1iT0hsCit6fDNSPGVpZXZLT0AyVEs9MT1oQXUyR0FEYHc9
aSl8Nkd4NUVlVjc0ey02Mj45TGN2fngrTSs5Sl9fJUAtIWkrbSQKK3p4WklJWUcpaDt7Oz0hfH4y
ZlFyRmN3Ziord0Y2PUQkVncpeztoYTJOcTN1elJEfC1CcVh3Mn0lUUQ3QnBNXnJhYQoremNkKlEw
P0RUajB5TkEkRDNeaEJnen0lPDsoO2xSIUxQIz12U2N5WlpTanF8b0QjUzRpRylERnlOTiU3bjZw
ZEFJCit6RGxRa25EIVE+SzVEJW1NMlY5czReYjhzN1AlN0JAQXBUZmRNbyMwITNJIXgwITloPDJZ
cWtoT2lMZzJ7dT1NR1QKK3pBbm1NfS1pbnxMOEgjZD9WX35pejApMyRZVGcxPjFMXzEoY3M5RyVN
dGAhMWhCOVEkb0NGSFpnXjtEeUArYnMyKAorelg2YmR4QiZ3RWkoRzNQaSlmKH00eCVqKEd7OVAq
a1J2VGh3WF4zZn5GeE1ETUlYTSVFezk2U2Y4O3l3REBWYiErCit6Qz96OGhHe1N6UDg9YWlUPTx9
bEA3QG0rM2pUX05rQlEjKmQyR0lFI2VMaUhKZmtudXVQdCooMVpeLXB4KWl0SVUKK3p7P3ZTJjZC
JHZNVHhkWUVWKmtMdEgtSmVPSjRhVzVXaj0oQSN6ZFFvdzBkRGZpWiQ5SkwqXyNDVyN9QWBBcSZ8
KworejwoaWQwREJDSiNZTCFAPS15VmVxJDN8a19BUXd8XzxTaElLRjJUXm08JExqbiQpM2ZwPkZW
WitGSzEkT2krUFRpCit6bCpKPmMyZUVXP3hLOGN5X1BFZVJGUkNvc2hIZ3dScENTY2VBSTFtSzNA
e21pJUVyZFY8V3soUVYpNmNNK2RGX24KK3prT0tDOG9TO1UtVU5fZDR1XmUxdjZtM0Vkdjc1dE9K
SnJFcGo+bCVGUj1gRHZnWHg9ZyQxRmhZZi1KZDAmVUt4VAorelA5Yl9GUzJARHNEMDE0UHJjfDt1
cSFOSXBrNEI4KCNCe2xgMnFObUcyO0ZgeGZ8TGpyN3FzU1owSTR3TFk2bWh8Cit6eDxsWmkzUmBe
OUQ1T15lJUNRPWJ3SWgrXiR7bilHPiVzfiZUTyZqN1g2VzgxKS02IT9HYWwpNm90b2NEQ3Z3NyUK
K3pKbnhPVCFkU15SUTtSKzVsbnY+PHE5V2JVKV5JUzhGb05KVDhEbXFGMXVRSk95fnRsSyomfnc3
NmpYPTRSaT9NSAorengzWE5ORkMjYClXP0BEIW4tKXFUQ35weWZLV040PSVqZT9qbkZManBKOE5w
b20jdFdpU2ZUZUBnJjhqUElUJnFPCit6PWpIa1d2dVo3fkR6a1N9RzBJakBzTTF7Vk42OENxTVU9
PmdEYUxKME11dTZIVDVQNHolQDd+Q2E+M3JNKyFSOXgKK3pTYDVjZTZlOVlDKnFNQE0tQ0NnXm1O
fns9NG5GODdRY1pmJXN4dHt2NWt0SFg2JWBZOUhsbVRDRnhlZlNRSFdTVworejh0X05hYjcrNGVQ
MzMwTEozI2VKM3tMRGtrVikkQEdSRGU/KX1TKk5WYXJpNHMqPDRlbjtYXyMrdVhTTSMrMUwqCit6
PklYWDxeZy1CMVNZXkApNjt8JVZFT1o0MVR0bUA/V3xgYEYmWGd0U2RPfnVLWUVlMFNXMypvPSkr
YHFhSERLWVkKK3piak8qbEtwc30wUklpKGc5MUoyKytKPzE7RWd8WCtVP20wRmdEeENBNzdXRigx
KzU1P3Q3eT18SlhTJDhXMVN2RAorekMwNX5OTGVaQi1RRVNuNnVycTd5YkdlYUJoVU1Zam5eJn5r
aVhPWD02dEMod2k+d0AjU3U5SWR4VkQhPUx7dWBeCit6UGdMMj9jJiVyPV5xYC1UTFczJnxVN2pQ
OVFafiZwKXBzdm1MVHp5b20pbGdxcmI7dVZHKn41WjlncjBYQGZtYmAKK3oheCVjYEB8Nmw7O29e
bTl8Ni1ZOCY5eiYkSGwhcztlYWZzRE01X3xZbVJacVBabClEM1ZJdXx3YmZIUkErUEJTPQorenBe
VFhvUnBxQUE9MWxnI1Q0ekl6UFJFSX0wTVUqdXFRdSV9TUY0cjEpPnppKWBHT2l6ay1OUFhGUFRP
cXBqPlEzCit6VDA1bEIwSUd3S0FVI3dfWjd4KzJRK25aPnImT3Fic1g+fWBSUTI5MHFVYWYwemlN
WiRjclcjTylJSElzeFI3NGEKK3o4T1lJOU1qbVVpWnlwcz4/Q05tUDdvTyRUU1hzc1BNWT5LI08l
WW9SREp0QytPe3xxI2s8R3xCMz43WV4wazlGbQorejN1PDtLeEc8KU1QTUtfV2FIN0B1Qz9ge1lS
PzxgLSQraE1zKUlpWDE8cD9UVlcyWkBLK2o0KzlRfkp1cDctJnspCit6R14+fV5ZJTs1eDdOdSVX
KVNuVDMkKXNCWngxcVQqOVMjalpGPXd4anktdWctTCNtd0JIOTl8PG5UfWphXz95UjAKK3p1MyU/
US1NTX0qYlZfWFp2eGArS0o8dVN2M19pSm90NUV3dTZ8b1IyPHkjNn09ckduJEdVTX4rR0VCcX5p
eylhRQoremh6Y0RsZmJNJkIlfGp0JHZhX2JHejh6RD0lYHllfVlpKENyQmh6RCUqdG4rXzZOVUMx
RnFQTGMjaVQ1UkUrWFJoCit6YyhCWlkoWDdKN21HZ0BGTUp5Ozh0WXhaaDlvQUN3Y1I4JCE4ayY3
Zko3V35va1ZrZDsmQmlvUWNjfEZ3YyVeIUIKK3pzVXhhaF9PeHpadjx4fXI3eVlwNj1CMyZZVTNz
U0gyQFBLbCVOVDZNbCpsWnIycm9LZy08JSNqJUNHe1c9Ync7fgorejhsVEU0KjBYNjxffUwhaCsp
MVZgXio2MFNCZX51fD8lajVLQld6ZTFkVVQ1ckFrS2YtWVJ3OzJYRFc3NVVUUkxCCit6aVZZMDl3
MitOIyhHXnIlPC1WLWMmTV98VUw+R1c1bmwzUDtGVXRmKSR6KjRkKiNSb1dtKVgqND5uNzZpODFT
TE8KK3pRWE9RQ1hWekxaTn0qfEJfZjJoKXBRKGhvM1dhaXxaZlF8VmclRVpvTE9LbX1jUDNlPldy
ZTUtOVNFRExaMGs1dQoremc7dTNTO0UpVmREXjNoNWBxQnhxbkdrM3xGMDwqOE83dTNFOWZZeUgl
PmhqNFleKC1TKE1NKU9WMn5NUlRSQFNMCit6R3NiNyhTMjwmTWpvbjNQTXNsb2FYJUhqTFc9Y300
OStgMklISWwpcUNNMDZXbllDS0FXNkRDQWVrQCFATTY4dWwKK3oyNSVfPSRfWDxYX0olSCs7RzM2
KD5JSWZxKUlDJkstT1dPTWtvazJwI2g8PmVneV9tdFVJcVdEdmxIM3BvaWJAcQorejF5Rng3N2xC
fFNEcGdqMElBKHoqNn1iZVZuJCNLbDZSYntpNWdVaW5GI3FsMl4xe0xabHhkY28oek9BKE9yOXlp
Cit6KFc4THFTKn5VWikybWpOZzIzVnpSO3tzUFo3RTQ7QmM0IzRDLSNKd150NDc1WkFNUWsyNnw8
byk+SzZZJWdTeU0KK3pkZDQxQil2fEpeTDdiJHNEUGphdTFnamdJOEojaDJnZGVxJXB1TmdQMTEt
VUhMdHomeTRYUl44XkA9Y2VecUQwfgorei1rNENCI0w2T3VMI1Fie0hwalV1Q0x2Vm47QmwrO3M4
I14ySzFKSiMjPTkrYjRaQFZlMDAoJkxXfmVWJURYe3R6Cit6PTUlazVNSUNNeXBySCRnKjhhWDZs
flZQJUF8O1R4P0tEWG0mfnNoVWklfUdebmE2QHM2SkZfMXNqYF85NzFVb1kKK3pKd1khSnhWMCVq
QT80eTg3UWQrWUJFeS1RdldqaEk5dSZwUXFwVHRaUHQwSytZJUh0ajJiV3JwMkglbFpJTypPdAor
emZ3Qyt4aTNUUF87QEZac21UeiRgb3Z9X3FTdTFnQE9SUklDVXpHYnNzTD5wIyR8flkjVWFnUVRD
R2VxXkk/NXtDCit6aSZrT2pGZDdtdlFZKFRjISs3JnY0M2t6WURYfFEyaWo/fTFEa2MlVEdWOGhw
NipnVXh2e2VtTlk8PnRfJUA1YyMKK3pGd1c2UTZ3d2otcVN5QClGMztGaF5eQX5oNzI3a3xPRzBK
akFLaTQzPzkxMmx2fFJmY3IpMUlAZG9pOWJpKHYwVgorejRyQDR3Z1pqTT9FMlVublY8NkdlO2hB
eUBhLV9xbSl5Tm9YeyNRIUFUQVhoU1lGbi1ZVUAyMn5aOEZvY3tLYXNBCit6YGk7KVBqbE43TTBx
OSVOKDwtNlYrcFR0SU9mQ3s0TzlLJj1gI2dGVXg9YCpjVkY1PXRJOCNEbnVBTi1oPio+TDwKK3pL
PEBodXZHYjImeCojLSt3a19MUUkjaDlfYD8qK18xV0hKXkBZNVFCWkN3blZPZ3A8UndYdn1WYCZq
OHQyVXslSQorekZFaHBOVW5+P3hNcSRtSSVlPXlzclFmSiFscHJkZUdkYC1HVz96STx0JnozJmpR
T251c1lPR0pQZj8wRyo/O1dQCit6cCsoOzU4TVFyVT5YZzMyJntzKGZqc3FvRUdkU3w8NEd9ciRh
SFF6WkRHNWk1YWI3PGxkazJnVFd2Vms+cS1GXjYKK3prVWdZd3FlKWYtJGlxVHpNVE9ZQyVgOENs
XmYrXjtsbjd6WmBwd2QtRzt2YjMmeD0jclhieS1uNzlBT30hSkg4agorejxEWDZ5aDdQdHdDTkhI
JVdofE9qYm1TQnlpcGFMKDA+NHRUTkRVVEAlPUp1XytFZEZFQyZ5RXN1OFZSQT1KeU5RCit6b3Bu
VHxrZzgwZDdFV3J+ODB5M3JpZndDPUNTKil+ZStjezEzd0h6O04rckdHVy0pdjJQUElEPGZxdSEp
Q0hQPSEKK3o2Ynw1TXA3PkAhcHpLZ15AS2hGJWEwQjt4U2smZEFkNWRaKz5hZ30kKVEtdUMqZlAt
RE82KmlJPnRNZ3l0Q1Z9VworeiFpNVVNalJ+e05KTHRsVzRvMTJ2PVNJNCZheFVnPDRqVyRFI2x7
OHB6MEhsfm82NEtZK3NvVV44X1RhUnpzQFlQCit6RjZ6Szc2VDVNM2BLR255KzwoaWtidmh4NWI5
RnZOK3I+Qnw3UXREcV87bSZicDEyPDtfdkdZP2hpZSFNd1dmPSYKK3o4TChQVXkrY25ua3h4YWtM
OEZ7O1BJLS0zPTAqYColUCZkUF42d2ZoZ0pVUXs9WklSV0swYG94Vip5KEJsYmtkYgorelZOfU5N
OGNxK1NSYzJJKUFVYWRAJEIxMjhlfTtKR1ktO1p3UldKMWtMe2FMfjdPcEh9OCFDdUhXdGAhbTlX
aWtACit6bXYzJXwjeXwrfFQxMSpMNT9qcC1oVjlLQzZQWi1oaCNIYEAxJnFLPmxZYCF0alprP31D
dC12I2tEUHxxNTUycSgKK3pRd0YmPnIqPmdnTWBUZXJocDI7OTMhaitUYDlzKWshSCY2NT5hJSlQ
a3JNbWdzZnxlJUFDRSl2R31PUkFXcDZNcAoreiZPJH1pMlJLVm8yVFBWMSMjVjJiRG9RRUNLfGNg
Py1fbD9tNyspPFFwe3RiYGl5ZX0zNlleVX4jS0g4d0J7OzJ1Cit6WEZWM0NHNXY2aHFaZCskMyoh
Snp2eHhJNzF+UzNiQEFCaD40cz55JGFBNTR+X3EkZjJxVzlwcWRzISt7aXg4UjgKK3o9dDVOayNo
d3s4OWVvSHlvTyV+YURDcSlDZjIpKm40bn5+Q1ZDMytlQ1AjTFo9d21HdkJQfEVMQ3J7OSVDN2tB
OAorenBPISh5dldybE1aPEdqRXg3Klh4Pit8bW5eYVZyVm57a3ZQLWFvSyV1enV+amhWQE8mRWh9
MyRVJWhvKGBeeFBkCit6Kkg/LTdxVkxobG42NU9KaSZGKVEpQj1ncnZENk4kKz5jfEg+RkA0QFBR
UUFNOFJ8eHhhcXNMNWIrZ251ckstT2AKK3p5SGQ3YDQxR2tVTFZlLTFXQzxFKD1EZCstWEFIeEtH
WDxVYUZyaFFwc21GO2o5UHFfU2ljVTBAUFBCfGc9OSlGOAorelF6UWFeO3o2dT0kanUmRWEtM2po
WkkhOWE3aFpGJUZXVk07am9RbFVUMF9eM1IyUGNzJXkzR2hoTzRnfEFJR3NCCit6V3dGZTVWOTRO
akxaM0xHN0J6VTk5PHl3b1BjeCFKN3pYPClnfkhlQWF0SEE4VC14Y2w+aTcoTlo/TWh+SXZvIzEK
K3pPST1+NTk0UFA/cns7PSljZ09rbDFXc0clTjhvKn5MMWtrR3l1c2Q+NTdtaDcoO2hlPEBkI2hB
RncwNlN0OXdkSQoreiNuUHxOZEo3JUM+Z2xJaXVYXlE7aHByO3teaXhsKj5GTWJLd3FOanVBPy1t
c1ZhLT1QKlZVQylJJEx7aUR6Rk5GCit6I1RoTSpSV2VibipXcH4kKX4kYH0rNmB9R1pgMDA9ZVZm
ODx2RyQ/c2MzdGxAI3Z5X0NGJkc7K0hNT0BqVVZvakMKK3pYeDgpbE5JcUJBM0JWfXJUVDwjLVFh
WTQ2WilOQ1hTJSZjbnVIbCpHYFMxMWlgMlkwcmBTJi1HUyViQEZffTxAPgorek9zPlhudH1zOVQz
aTxMUW40aUJubmZ5PEApO3hNUVpkaEp8bSlNNkNaTmc4ezFtTmNleWVEcHdlbE9qYk92V0pkCit6
THM0QXhxfSpCTVhmd2s7M085Nm44XlpkRzNYa0N2ckBNIU1lRlU7WXA9OSF9QGxONjt6N0UqVzV6
Wn59K3JjPSUKK3p7NGctdWJ0OylQQGNScHg+Jj95RVRVKiZrYClfZEdoen1xeihaYkF4IUAzVXhW
NlRybDVrRC16JH1wUURIczFwUQorempCYHNXMU9EI2w1K2V8K0YjZEo7QWxeP0lwRlBLR2VEKjhH
ckFDKF9SK2kqbndVbmU3eHROcn1YYjB7SmUxZyU5Cit6MTl4Jj5FYkQybXpxfEchS1gpYVFod25y
X3o8ZytMR0hIQXluY1ItfCh8RGg7eXpAVnRPd1BWRmB8RSpTO0ZlXnYKK3o5UGNZSXprdjR7eWhy
aW9eN0R0ezQ/KSU7Xn5NeCFSckROJHRMO2RNfDVza0NFU2k3M1RjK2NgQkomVU4lUEBCJQorelA0
dUpGcXY7PGE9WnwlSjQke2w7TlNXNnM1dHFVbz89PGpRKUMme3VCK01uQ00/Zz0pVW9KbT9DX1Yq
USRKOUhuCit6PXNgc2JLYXtxazh7Kz8hU0JJbk5ha0xNe19yRF9aNUFpRn5wdSpHWChld3xJXlQp
YV5NMHl6PkRmMnA0LT1UNXEKK3pfeC0jVks7SyF3SX1DV1kwcS0kQE1wSVRBckVaSzklc2ROVVda
KVpuPDY3dF5fenNUS3Q8b3NFIXdnPGJHKjVAQQoreip2UWppIW1kYjcwaEc+OWVZTUJ7Z1VPbVll
X3AzJTVDI0pGO1MrODIlc2omPlBwVHRzZTJRQX1SYzg+QnJseiptCit6ey11fCU2dEBNeW9MVlBk
JHs4bzc3bnN1T1Mlc2RNOzdlRn5qVnxkODJQJUVCelFDMjBtPTxHN2lUXiNrSXpaMXsKK3pSKkRi
Z0lLMzR4Q01hdDEjO0dfQ0MxR3dWWlZ0ZEFCeFl4cnxHXzA+WX5Fc0NUZmNRe3twUi1UI0FvdUgq
TkhVPAorej9CakYwTWNmdkU5MU9TeUR2USotQk9AYmFqdj8ySTcqTVZwckZ9LXVHR0I3WXB9UCNY
WEs8SXtfQVNVJl41MFQ/Cit6YnpESUk7UH5yc3Y8Jjh0SUlQRlkkZnJwaEM9MUFJQyorem56aW1q
RHNJQ213bkpWVE5UdyZxVl4wa2pBbFZjeEMKK3pDYTNWNF9hdXtIeXZPaksjTT1lQ2lCYTZOMjBJ
YTBtT3RxJERjRVlUMHtyR3pRU15FN3tXSTM3MjdSdEwpQ2BYUworej9QQUZ3cyNQbyR6KCs4SztX
Uk8rbDYpc1Y9bDdabTdHJHVuI2ItaT5hcGhrQFpAVyp2N2IkYlExKjZATW1Ib19MCit6cnJuLVlu
RCtZKDgmQ1dteW4hc1pfQ3ZaST9fOFVrdy1VWnAyRj0jK3VMM1hnQjk1Y18+WUVaeSozKXc8OTA2
YTUKK3pabyY+PkVkbEZ+UTExOVNpNnx4UVU0SHdATiVaTnk9PHRjTFdiJT4hQ0V3Mn1eSyV4QWNB
YmhKUlBLbGsrdVU0YgorejxMVHg/VjZUQUVvYV9CNT84YT5OWnpYKVlKWnR6KkxZflM7JT0zKTta
Uj1XRTxUcEt7dyQoMjBUd2NRIW8lbW57Cit6eD00SEBVJXdTIW5BZitxKU5qTTVCU3pebUMjb3wz
Rm57dGNEcDw3I2dUKG41TD8mLVBtN0lpbWF6RX1KMC1YVkUKK3p8MS1sRmUqa3dPZnVII05zYm1R
VGxTJEN8cGZqTWdwZTJXS15CfH1SKzY2bFAjWiQ/e3B2Sz52TjxJUVE0MDtATgorejNVP14zTXpl
MUZAfkk/T0p4NCtKZmxoK24yUmEyaDRtdHlSNnR3T3V4WUxMe0NAPCY8a0RwNEdnU0xKM1I1QWNN
Cit6XlItalN7aDtSR289UUdNOVB9OUlEQ2wjYlcxdXNqPERqIX0hfTB7XlQrbTYtYT9tPGxeRWUx
dkAtWH5eUEp4flAKK3o5czM1eztiTmRFKEFCJms9bV9xQTB1NilpMUR5ZkE1NDd2PTVNUihLKDQo
TWotJFhoPUNxWWt1SXt6Tj0jXnBxIworenBtUldISys4YmU5KVZvYWV9RylqRzAqXzBAaCNsYDRj
WX5JRlIxZlQkUnF3M0AqNVcjd1NsZSVvZEUzczlzbDtKCit6PFFgRHRhb3FPPThoLUxyQClna0dA
OE9jZTYyJEJLQzxvQis0PEhBMDgyM2ZCOyVESllvPHE3cEN2YUVRQTwpU3cKK3o8VEwwbj90eUIp
ME84e24/XipBTGY2JSQwO2E/JVlLPGxPdkY2YWRBK31qNV97MDhwYzFEeW5ZOWtrPlc+SVdgbAor
elk2SW9aNnB3PHxmPSs/OWZ8Xk94NTZ+e3E4MFotMktIN3VjTXwlVk00cm16a0RDaCp9YW5Mc1dZ
V29TJE5sQGNHCit6O1BhRW9JaU9SWld1UlJKbkE/JkVaS002SFdPNShxMW4zMCR2b0lGfG9kbGdH
ZXw5cVlJKGc4Vl9rdXFNe1VOQVAKK3ptYHB3aEl1M2RRYm9rdDQodXcrU21PdV9AJC1BSWk8MDJe
JmJVdFheMXNHMzJDcVZCNW9xOUxxZzB7YFVuMWFpdQoreiN6Nk9oUEY7dn1mWDt4UDA1dldgSSZk
a35JSChofVdMYDRxMFMkd1dmPStAUzB5UXMmSzJJTEIxUSVJI3kmdkkkCit6UEpvVnJ3d1o4ODlQ
fGsyRno5ak9tbXB1fSFUK1ZtN2Z8Tnshfj04YGJSMlhCYmR2bCslbzlQIUt1Pn4+Z1UtZ0sKK3pT
eVB+OHlnWHxXe0RCVUctVW05ZDgwaUNAMVREYyQhYyhDMEwxI2N+TEYrRVpkPGs/NncyT0Ute0RI
UHJBcGVQagorelBKXjFiZ0sqdmw1SSgzQSlXQ2cmeUZ1JGZNP3QkbDR9cUZoJD5hPl5JT3NlUj95
SGZucHAhTXxwRno3O3B4Kl9aCit6MEclUl5VeEo9e2lENEtrbGdUPko2M30rZ0k/dz48Rno2bzhH
MC12NEBHOHU/aThtJmJKMXp5XmdnRkxpTmklYz0KK3ooaVc3e1dlNllDTnhDN0tebnRjKk1FSWEl
cGEoKDJUYWJeU0MyZXB3QU12O3Y9PmF2aVZxT25nKk4lS0dnK0VYZQoremJQVGk9Yk92K35iZ0I+
ZTBfd3lYTjY3O0MyWCVyQGdmUkM1SEV1KF8wVWFOfkk+PHUhMUtrNSF2SXBVVkl6Yi08Cit6NFRE
YUFqKUZifElzck5qVDZhNkBLXmZmYk1TTVcoS3B6Mn0wLVhsc2RjKjZXQzc+bVg7MHw7P1hkN3JQ
PW9EeD4KK3pYbX1zJEFMdWFYOT8oKEhnUF9oa2tkTDVzcHZPU0ZLJVdCKmdVKX4mY093MFprIzVq
MyZ+ZWIhcHAmMyZwZmpLegorelB+JEctMmREfFVBRzhqMTQ3M2FNMjxZVH4lIXd7WGU0dys8RH5K
MSFBKWkycEwwZHQpP3R5Pk1EYlJ6b2hrb31FCit6czF4KVVYZFVRdHB1P2E+MT55bFoyZWpeOXRl
YiQyZjtKRWI/RTsrdy0zP2xUVXQyZj8+STl0dDRUQnloe1JIeDwKK3o2NnBmMTFEeW96MHYtUChA
fHBaIXFGc1J3TCs+JHt6fSo8fjU0N2E3aCMjbUVeZFpuVCZgSG9SPW5TWkZLaG90eQorenlnKGEz
eUZmY1loZH4zTkM3KG1QMChGOXBnU0xTbDErNj1Ud1hyST0xRHkqeDFLSXtee3gjfD9YZENFbStK
aGJoCit6b2RTSVpIMmVVe3J5QkE4SmktQVRKJmdKVUl0RHJjK1YleStlPH1EYyFYOSlJR3p7QUlI
P1Jpe2dIQ350Z1BzSTYKK3ojP2VrfDVEd0B0PW1oOChzUUZjLTZMYmBHP2xROyZiJU9HbEJaLWw+
WXBhbnJTZHc/cT5+amk3XlVtUkxWeFZnPgorejNPe295aUswKEUrMShva247cVNzKz5OcEs5Mmd1
Vz5tNzQ5b0xAWHBJQlo7WDtpfDw7I21fIzlARVR3fUlmNXxgCit6UjZpdiE/Nyh7JTttdVljdWB1
MzR6JGx2IXV8MFVsZm43aVY1M3olSTl8M2syMFh6KWpMQSp6Ui1JKSk9N0R2ZlAKK3peQld5PT89
RU9ebTxNTDliKEhOdHRISSZpZC1nXzA/WmBSI0tQX0BOPm02bGw5cCtsYytfakY5d1R7QnxQK140
WgorelMzciU9bz1SPlojbHZfUD1IWjcyZiEjYD0hQ35nRkVwaWxZQ15vdmwmV0dJPz81PHxHa29E
MWckaF5BJXUyaWA3Cit6NDdaLSlIYVNNbUU3K0QtPGZzS14zJXxaTktqdGBpLW5FWGdeWGVVayZ1
ZW13cFNLeSM0V2tCUF9hVGg/SzhHOEwKK3pWUCtUeTd7LTJ2djNDfmFqR1ZRXzttbUp4bCtgPVRk
WXZIVigqKm9JMUFvaXU0LWNfdGZFa0F9djF3ckN6P2NWbworej08YW8zV3h5TilrPnk+Mkd8bVVN
bVJQLWBXRi1HKVdXP3M7ZFBrd2lDbnhPTlZiOEtLVDQ8a3RLZGNPUGYzMnthCit6aFRTMFQ7Q0Y5
NnFCPkc9NFB3NW8kVDFmUHFedjc4Uj5PSl9aZGQ+SHNwSnBuN1V7ajQ9ey08QF40aWJ6P3F5a3kK
K3pvU3B4bkI5WWAmOE4jPVc9TW5nUzQqdV85VDE3a3lXK1U0dlVldyo9dTsxfXs9IXVre2o+YHN6
eHkzUUpOeUozdAoremZsK3xIST1KS1R6PSEhVjJpUHokWW8zKz9ka35tNHw1Z0ojM3syLUF7azgh
K1dXemtiI3c+b0Q7ZzB3Qi12P3xiCit6PERhZm1qajF9LW41dDZeaj1LQ1dYUlQzNFklUlBXZ3sl
cTg4Sj5YSSp5dCRQcFdvbl55U0QmVVduQDxWaGhAJkEKK3p7eD1vM0lTTDx0OztDbGhka2dtR3Yp
Jm9BUEBaNEYtS2FEcDl7WDhsK1Y3IzEtK0s2RTBZWiF7PnN0NmIwZV5vXworemY5ZD5Qa0N1Wm5R
KVJ1ZSpmMyUzZiFrcnNXdilfZ05BZnAwJXh5Kk5RM19qLXEwRn5eYUMwQnJLPHlGXzw4fmpnCit6
IUB5aWIoczR0WjdAME1ZaWRzfGdNI28mRlQwfjlBZEl0V2M7SUNndWxKY2o0d1BPQXgrODF6OXww
eTRzKW07ZlgKK3pvSC05Pnh8PEl5NDl4MVQ3VDl5WnVDYXZDM2FrdXNHYmAyd0VNfilFeiRSP2lL
NDd5a1U7RGsxJDNFI2tVPytpWAorekFTVVlnQVptRDFHMj95JmNJQkFRUztLaz8qcXtaZ2dTI25V
TX1kakRrLXghS3oqfndRTV9FMEElektLeFU0MUgzCit6OCZxOH1TWGJ3dGplM25hPDNEQkFSa1lQ
Q3tvaG54e19kPW13V1c5dFdROEg/OE8lSERWSyZeM2t7em1GKiN+PyEKK3o9QW9qam83dH55TU92
PlpYOFN6XnlEciRoTF9nYGVoN0wzQHw2ZnYtdC1oRkokfFQmKiRHbyhTWlp8bmZ3eFd0VAorek81
Q2lyTWwwU0sqdGYmcGtGdzkmPyEqYChgdHRSVHZBbHZ2X1AkKDxDNnJmKHVgITFFWlFoeVh3Szww
QzNzJlc0Cit6JV5iODhxIUk1WjxrZXQpK2lfLWo4eXN5bklYYXBoVURyRTA+SyR6ajVSQXklMkEk
Xk97Qkg/STledUYrTTtOYWwKK3o0OTx4VXVzcVpHeHlkbmNSPjk+K3VXRyN3ajhobWRlaFNKTW9q
OD58dytLd1N1Z1heYjh5ciYkM0xlT0ZPZlQ1dAorem18NCZWeHxZWjx2KiUoPGFsd2FZIU9iU1Be
P315SUVyTVd+QTRIaHQtXkhFTEZrOWxkKWlHSUA/QHZYc1VldTRICit6ajMzOzdKfktUVmtlPlhi
RFl4czNJcXVCQj9WUDdoQ0NAPmhYfCFiLWNiWWl2cG1WZWhKb1Uob0VfaVhDWVp4IzUKK3o2Vj9N
NSl8PS09Z1FLbHJhclQ2LUZWMWd1KVVIM1J3OXV8MF9GamJIb0lJOE0zRjlkQTlIRFF0V05Cez1q
JlEtQgoremk3KzBBdXFVQUtKT3ojQ1g9bilsZ2h1XitOOHpVOGVEdClucil3a1lpVk5tdGtLQmdo
ezZSNUxKcEU3S1orMyk3Cit6JmU/blJ7PDk5dXkxVT9gYFQwR0ZiJmlsXnBXMjJ4KCpDMiZ6UzBB
MTBAeis4aFkhbmw1WkckYCUpP15AKHNnaD4KK3ojPTFMR01UUSM0YGcjYSVye01OTzlCNzV4Yj8y
U2t7THpCRFhCe3xlfEpoZk1vS3hfPHszN1ZOJV95VENhUGtiPworekpBWistRDcxQTs4S3VZOHc3
I34lRj8+JGBrKnBjaVI5dFh6ekdFTCV4XnY+N0VwUkgrU2M3bXpAdVE5RkEpWEtXCit6Vn18X3t1
O2xgZypiWlBQWkNEdUN7RmdHXz9FJSZYJXFzNjd1PkNmNzQrMS00IXpPXmVWOGZtUFJgUE9ZN31M
TzMKK3orcHlQeGBHOHImRXQhcXt3cWYmdU8jJDAkTm4wKGo5VmFyJnhmUiRrOGBjR149SER7PyMo
PDNqPiRrfDsyVztOMgoreikwaTBsZiRhbjRyOTBkQnBXbFI5Zn1VT0lIQmVibEVyYkY8ZjZ1XypM
QHN+cFF+c0t2KVRhRWczfS1fWktNOC08Cit6YmVoMG96ZSZmNz9yTU5kU3VscCM0NkpucT55OXZJ
alZwOWNNNmppSk0+PFVVOC1+QW98M0g4MiRCd3w/Yk1XX04KK3poNm1rUUR7ZXdMJUhMIWkqSVV4
Klk9SFdRZEhecGM4REhGa3xIdF5SZ2EyQnojWWY9KDM3Q3lQTGEjOTRaOHV+egorenxNcGIhRlY2
O0pPRnwwPFVteEh4eFZia0RKKEtId1p7Rlh3STdhZ2R7O3xNdUZzfWBzSjMjQSs+X2FhbnAmaThx
Cit6QTF9PD4qNldLfkElNkR4aFM3b0ZgfWhzYW1hdUh8T1E5Uj1LdEpXbUleYz4/UT8tQXtJfCtI
e2o+T1o5emhQam4KK3owREV1ZF8+dTBMKCl2ZX1xYnZWc0lpZjUyUTJxcSN2RVE5YU1rIyRnc3tw
M3hkcFR6dW5SVG58THthNTc3cWReQworemhURDArS2IxNmRnfVd7Xy0/Iz44YCUlXyMqQjNXcjg/
fjZPVztCZkZBaXN9c050YVckYmhTQ151Rm9vLVY9VXxECit6eT0tTHZpNjJRPHZRQz5EcVc+Tl9k
ellnT0ROVzRgPUB0Km1AZnI5cGYmYjtJVWE5JGRIaHJiWkZfdkg4JSZ3QykKK3pCMDhkUHBaX2l4
QH5+ekchaVVrVDFAXmo7Iz4jPGxQdjlpNUx2KWxMKC02eURzVWVNTjxtMUc8OH0wYG9fZUtJfgor
el9aYTcpTEM8WHZsaGcpZXh0XzA8IVB6K2M5RDwrZ0d5Un5CPUdVaEBBclF2I0lrLUl6dz05MT9e
Z2piXmV0dDY5Cit6TDt6dXE8ZkFNSzg7ZnJnYjd4RypofnJeNyUpXjNBR3UpMDdmVWN6R15JSUtl
aHQ/Ni1KXmxvemxMZFM4XlM3a1oKK3oqbn43UCVwTEg1MXBZcmx8TEZnK3QhV15vV2V0eUdRUjR+
ZEVLaX0yZTN+YDNBIzxUKUotViVAKlBfdFIrQjw4MQoreiEyd0x8I29FKihrVXRJaVZoKTZNbGkh
TCZzMDxlQWhrYVFBZWhaOXM5dUtoQFYyNVU8JVdXUG8/JEx8XjxEM2c/Cit6S1A4KmZWbmx0S3Vr
ND91e2hRYkFDUCFRVFV1TndXRWIpcCNvX1E5Mm4zTUFHR34/d3kmfnZ+X0dXR3MhYiM/PUUKK3p6
UnY3YmMzdHMmJGE7cUhKczExMjZmVmxSNmA4WFU2SzxAKHNDWTJsKy1vYHhjaH1KISh2M01hWUM/
eW8xSSgqPQoremJGZW02bHVVa3tfSVFYbmZnSil5R2F1M2hVfU0wYjkqS3dmKmE3VDVWMyFnUmFr
eFJgRChlT0p0ajF5WWUkXk1MCit6X0ttKEdXOXtkJnRRd1hVLWMqZEdDQHo0ZCtJKH5Jd29FNTdL
Rj5nWXhIeT57VkF5eVY8fXxTOWZZb0w4ZjckWXYKK3o+bio9VjhKQDE1SHh8MWN3ZGcycWIxZGRU
R3hvdEFuVm4zblJ9JEwrPzEmOHUxQUVBWj9FeTlwdE9iN2YoQzxORAorekN4Q1NiMXBOKUBnVFFM
ZkwpJXFwSUlUUykjYCNZcGtJKS1Id0x3aXFfdW8tMCkpJT43KlhxRjhRXzYjbFRJVWdDCit6I2dP
YmM7Q0tVajg8YlhLc3QlYSVNUn56ckpeayU9bHNHfVMqRWJGPExKWTF8emtzemgmTmIqQ157bEQ1
TmdKNlMKK3pBTjsleUtTR3hTJnBOKndTallMdjxWYFNKK0V1UEgqXnNNVVFUe1E9KzZgRyVsIWJA
YmJIRU0qR1lRfmZtQH5qMAorejBgXmQ1SnhJXjMoJk8ofClQdigkIV5Gcj8yM2YxSW1zJDJNPzZw
ejJFbD19cjdwWF57JTZgYGV4QktEdCo9JWwpCit6aXIhd2h0JTNjJGFMWVo+RTd7VDY8VGZ+bF45
bnUmbTQrcFpvUTVZKEp3KkxAM2pVaHNVezZXO1F9cUthTXkoO1UKK3pXfX5+JFNWWUUzaDYoP0xY
dGVqZVNNPiN1SkElYiM0bnIoVEU+MTlCPCMyTnhaVkVFdmcqQ3NDUyhyQkdxa3oofQorelN9Ty1T
X0QzSDA4PXNwQEVgJkw9ekhIVVFvRzdwVGFDWmRtcHFoI1lQMVlDI183SmQyQXxHXj1ZKGEoK0tM
WSRJCit6OzdiK1c0amhtJWk5ZkZaTXxEXkk0dD5iX1p+fUhHVmZRNU1AUTg2NWRnVmohTCpHUnU0
U0I2fTErKXc2b2BUVCUKK3orOHZYNTFzfjNIT3l2YX4kRHZ6LXQwTmF6VD5lWF9FVD5QaipCMkwq
KTdlKCNZJio9R1V8dmZCU0pQJWQrMXY+OAoreiVgaThAI3RuMDthI2YzezlZI0ZvVTZ4Rn5uNSpx
P0stb2dnJFM3T1hRfGN1eiEwK1Z6V2IkNV5FJWl5UjR9VjBxCit6U2t4bT9WbDN4NSpla0NxTyh1
VnI+MGF+fClKJFp4K2ZhPHYkaHFyODY8ayo9XmRJO3VUPTNTeiokd3hEYVF9eWQKK3ohP0omZkBt
cSshSkh9NXYjR2U5dzRFUzBOZzBqdU8wTmcwVS1YN09lKHEpYFlIfDV3YGlQbns2QzJlQ2RXalYx
eAorenoyfGJBe2ZHR3N2WnhET21zSiRqP0l+K0ZXRjNkQk0+RzRQYnBNeSQxOENDbUk9ejBhNktp
MHtBZ2RNVTB4bn5gCit6UChaM3JNIShrTG4yV2dxbmxXdlJGMSlZNkV6YzZIUlBGZFF7VyNxUkJI
VkQrVERgVmReb0B1UGJoWFd2Rj9veUIKK3pKdipSYWxyTzw9eGlVflpXcTFSPyU3RTFxWHZgZGdx
UGtpc3crRz8yXikwdiEhMk1DVTRhNG9QKmEyaUsteyNjWgoreld8TCNJREY1WkdEY1ZxNnV4Nkl5
VT1nTVNNU1ktYTtrNGtWPWZUdGY8YSZqJEtkWlNJPDQ5OWR1QTg3JFQrNGslCit6PVZzQ04rTGk4
ekM+Y0I4WmY8aWpgNi15R1V0ekItcUUqV31LKVlkbzVjYT5LZU1YckRRXlJPdUZ9cWJZclp5RGsK
K3p3YCgpSiNQQ2kpTW5lbkUtJDFYO24pWTtBWmdiNCE3NXNVejw3NklJeXw2e0o1OEoxc2BKRiZM
U3U+PWV4WnFQfgoreiFTeUVQOFZoMGhIXjg7d0xyfUZpZT1fQHFXYiR0Xj51JEMtI2QrK2Y5S0tG
UmMpZXFBRXlsMHcwTXQycjh5KD93Cit6aj1ARiVBOVFwPGI8Zmh+KjMwI09ndz9ocURjOUUwPER1
eGtmfGgjMkZARituSiNkUkBqKENXQDA0IXw3UDZGRXYKK3pZPztOfllAQ3JmM2B+cTIhMEZjbl83
RV45LVIqUmd3MUx6Qm4qXyVFeDghKj85YiVLQ3Q8JXdnOTlaeDBWWGR8IQoreitXO1oqYjAxe0I0
dz03ckQ+QjFnI34/fjJaQHB0NWhMS1VeVS0lbHc7NXMxZGZMc0cpdDBSMHYqMDdrU1J9anxsCit6
am1neHkxbHdremlUblUyYmJhaTw/OVhwYj8qcW90OCpLRG4xR2g3OWl8Sz1TaCY3dnRLZHsqbjVf
emArKmh5ZSkKK3ptVkQ/Z1krfUNrTDdXI01mUU5RX094T1h0bipkaExeUmFscmM/I3t1VjdDVyRj
V09LQUY0QiYmOSlhQ1MqamRBegorejFvakZyLVMxR3czJjNXODlmVm9QemRKMyV4Q0hIfUdqbCNP
MlVyLUd3R05kNStZTDt3PHh1V3dWMXZOMiNrJkpgCit6Q3QmdzY5cC1LNkZrX1Y4bF5PNFN6eWlS
YSFpazZKeU5+akxTQFVAdSpkQ2tUcXJpck49eyUrMTxHfVY/e0w9ME8KK3p1IUYhRGNtMUAmRnpa
c31Hd3xMI0Z6Tm0/SnIxUyZrWEZZYGUqT291YntDeFdxWn1jbDlyN2t6TloraDglRy1kaAorejsw
PWZHVDFSLVQ+PkpqcUQhdDlvI1NOe35oZGNDdlpBQWBXYjFAWHpUNDxmTnghNSh1ak5SN0xAVFRI
ITtCQllqCit6K2x6WX56T3wwPDR1YEtrU0NFYXhKYHJOWDtjSEFxNm4kM3EyLVgqNEsxR28jTU9U
YWNUQXBgJSNGTChqdW5jd3MKK3pJfGdpIThIZTU+emYwQjt3bnZfYUVCN1hvfDRoNXwqdzY7bUYj
bTUtMUFeVDFKUE5se2E2N0VyVnd+QmZoSWBTNQoremMmNHRkMmp7RilfTCEhajV3VmB8dXRXcHdJ
SWJDO2p1SypYejtwcWxkY2VvVFRMeD9ndTttMkFTakg4anJzOEg5Cit6V3ppbTY7YnpieGkqPkZH
KnVCN1JxZHlFYkJgdUNaOylCM3ZfYV4xdUhVPVZ3JVJDdGMtVCsqKjFFaE4tfDd3dkcKK3orQzIh
blg0cnxqME0/VVNEcn5eVUc1cHk5SkxhN3d6aWBrMWBqMHlBS15aZX09WWMhWHJpNlNQaVU3X3lA
b2I/RgoremM0QUR4aTJeYEVQbiE+WDZ1NlB1S0MrRTxvNiZweVJufmZvTmZnNW1Mc28rP25ZQEk7
RzEqMlZ5UGdyQ3pPV3k1Cit6OWs1JE1JfXh8LU5GZmQoO2MzQThBbWEhNzl9cXgwUnFIMExzZFc+
eW1YV2kkZ0AlPEpIVm9AcDJAaEp9VlM5ZkMKK3phdHVHdHs+PWktKjRgbVVvbzh4NWAlR2pfazhK
TVp0V0NvTGpFNGM3YiVRdntKNzdQJSlhMG1SeEI8Qjl6IX1YeQorelJrKThwVWZJcGJXSC1hYkx9
WX1qNT41YzJ7aD87Mj4mKipyN2x1MlF2Q1AtYXNYQXB+UVgwISokTVRwNXlUTDRXCit6NnRrTUl2
TDdMa0UhfmB4TEFUMTdsVWRkUWNmPGNOJGlJc0lRUXVoTU11RUtvNDlnVmFBJEFDdTVsTGdeVjI9
UXMKK3o0TlFjYyl9YGZ+NHFjc15xPjBASyVIYTljME5oKjB3QVg8UjBATH5xKF5QXjZ2PEtNQkZr
OSp2dnxQMHxDK2ItSworektnZCsyUl5yNm1rPlJ3I2VAenRVVUZqY0I0UEZuaEU/fDB7JEdZfXBv
bGpuIWlndnY/RHs+JEY5ZlpIZExYIU4kCit6RmRoT3Y0eElWR2h3YlZadSYxPEoleSZraHN1bmdx
RjRqZH1mWllgQVpsdlJNSVUlcHF4KEo0bUkxKz9KcmsyZ1AKK3pffExlVGkhZVVNbEY1KEt1Uldo
VFFXMEt7bHxoeHx2ZGAjJXphOCttSmhSVjg/PEhCPVNZMUJXSTx0Jioka2pGaworemRrQ2BIOz5x
T21qMDU2dCZBKkxVY0xgekxNWHVZNClnVE92WHx8fnRHbTxvJCtTNTEqbmFAR3lZfDZ5NTEyNH1P
Cit6OXwhaDEweSotRHk5XmxfKWwhVXVJJVZyRFMlK09CQWw1WlZndnpgT0t6PjwyPTZAPHJ0WV4o
SShhZ1dneF8lXjEKK3oqdk5rUTVkNzUqc0pAK1ghXjhnTTUjU3hiWnl7akk3ajtHaThQWnNjVVIw
RzB3dFFobV4jSTtmakZBRG9FUjY4Wgorel9DRVZedGl3WWQ+bDZDc2pDfXoxOXAlYmlqRGQ4Nmh3
KjN0SmBSN0lHeUJ0UVchOzJqbyYydzdFb15aRk5hV01LCit6bD1tVXIzQlVsLT1ATT1HbVEtM0Fp
bEh2MzFUPjFYUGZ4KyROJSpVeUtRVHQ1RHEjSEJoN19gYG9QaG5ALU8xIyYKK3p3OHo7aVlkellq
TWJRb3EjfllwdlotI3A+MG1NVkM2UXN2SUZ8VGdzeHp8bU94PTZNZkVYR3cyPGIpd2Q+a3x+bQor
emNEeCg3ND4rcGdKSV5+Z0BKPGZBbExQUE16JmtuY1A3YmAyMU9NWjVwelMpRDF0cDMpZyVTb21E
akBNWCNYSDQ7Cit6RTh0eGNwSCVrNGlYVDw+R2hkaFhWfUI+PHU7T1FxTkl0QSsrY3phWV45QFBH
MGROPjZKZHoqMU4hY3JZYyZGayEKK3pCe2RaOT57N1ZteUh0Rn5MSzFJTmU0WE56QDA/X0tUdn48
eVI/X2pXTklMd0deNzIobE9IfS1aNigzZ1ZGcVFpbQorejw9PzV+YiR3MHdRPyU9MCR4a1QleFhN
YUFHcz9mQUAtM3w4RFN2ZyF7Znpkbjxja200QW1QTFZvYitJeGIqclJaCit6aXVOY1BQJkF9eU93
cnduNGs7PnhXY2YzIT9Ceyg+JUhPTl9JfjUmMGdNU19GOEBFWFJ6ZnRzKSVIS3UxQzd2WnsKK3ow
ZXgxdmArfWxoUmBsek5QQUt9TXFMWWVoY3tkR2JtK3cqemo7czlCP2xsIV9LVldgbGxjKClmSDhy
TWwqbUl1NAorej1ociN4X2V5S3lXRGZnfURFcEVlQCVKaEY1OUZ9LUVCbiRNX053XzlPTEV1O21I
KEA5KmYlTnI8e2I3bkVCaE9BCit6KmhpR1R0YENZJGsqRzVMUH1MV0VER24lbWNNa2RXJTA4SUdl
eXlePEM1UWNiV3hxRnZ7VF5qTW4jMkJwdmoyRHYKK3pgKHxaN2MpdlltKG43NGkhVDZ4XlorRXAl
YFR1R1RgeGEkPyQlbXkreVo8fHR7Z0U4O1lnUDZ+YkolWklfRHwpbworenpncFFaJUBPYHglS3Bi
V3tCS3FFdnZUO3FVRF5MVWh5VlNgez8jMXlOOT9WXiVgM3trSiU4R2pmOEI0ez9MVnNRCit6VShl
eHhSTjBAVzsle0F9cHcoXjR7eWpQRD9AOyNWe0NXMkJgKlVTfmZ3RVVAaWQ/VHU3dmBgWlJgIT9W
dT5XdXAKK3pgeDFDXl8wUDhgZG5HMCh4a3UmeT9KQXNvaWd1YGMpOG9AITNjcCo/azEyWXVxRTlP
Tk5rdT1jPXdCKU5lbnJPPQorentoWG8/REViOU8mcnsoKHNROWxhYFpZenJ1SUxkKGIwJG4jPTwp
NkVtMyFTXjxteS1LXjZwVWleTypBZ2dyWnsjCit6eDRZTmxMOVR3cz9xMFh3TjdYcEA5WXVlcj08
fHhzeykoKDt8RV9wRkY2d3l2cl4yOy0tNSVeeipYIUJKVmFFei0KK3omfVopZ1p0M0hGJTZ7Zklt
azFNJTR2QnxycmhMU25CSXJxRiZ2akhqK1d0UklCfTMjN3MpbHRJODljLTlsSnNtegorempDfT50
UF45P1ZsdHI9UCNoTlY0ZGFwdmtoVm98QXpBb2RaK3BrWHY7PF8hTGIwamhUT3dwTmdZMCZ0WE5+
biVeCit6K3E8Unh4eXJvYEFJQzwtcXV1PXt1M0lJNSshRHwhI1hGVGVHKFQtR3tMTHNuVWtVdTM7
dlc7WGZCSFlRem5BJTkKK3ptJUxZJV9hX3Y2SyslVTRlTH5TXjZANXxCUn4wP0dSIVYlWXE2LXZW
dUlQRzJ1VGl1fChTQWt1RCo2ZFVBNWlwUgorek1XMGFnU3cmd3xeaUBVQXpDd2tzPW1KSFRFNHA2
TVlaVUVLdnxySl5paGVAVDJOWm8rKEkqc3JSPyF5fmVPMXgzCit6U0V9JDhVNytaNE1ifDVPamlO
bkBfQTl6cShOOEcpZlQ5bThgaD1wLUQqQj9MdVBTPT5EaXl3PjNsdj9oPXoyeDMKK3pRTTU8VmVu
c354YFV5b0pRMW9GJXBIVEUhTVBGMyhSWWxMe1crOSZVRCFNPz88JStJWF5jcUViNnp4fVp1Y0R0
Jgorel5aYFg1UmBkeClwSD1pbE1QRjYpPkBfTlVNSGVXI1QrI0s0VVpaR19xV3l+UVJyQ3t6S0Fg
QnNpYXcjfXZ4PmZgCit6PSZPcEplV2VPdChGS1l3UzlIQ2kqQ15WZnNQeSY2fDFIRkklNiFuQDgw
Y0cpcTxyJTcjNGZVQXZpeDEzI3cofHkKK3pifDw+dVQmP1cyK3o7aiQtP2FVJktjcjF8aUo4M2Ff
cGVnJkhRJVVzOWUlc2JleHJAUUl0UU5fK1VjQVE/Xj5JRworenlaanElX0hHO1J4QTdxeEFHaCV6
UW9LRHpkZmZWUld2X0VfT3dCWEt6YiQ9ZVQjcSspSWNNVXZ8RihRdFomTDErCit6ZyppdiFXN3tP
S2RfflV7dUlnSXZeNXMxPm8pdW5xT31ERk9YX2RSRHlKdlo9JDV+VjU+flhyaCVQVCF6KylQVloK
K3paR2slP01yRzg7dDJrWlZNeTMyMkR4KHJWYzxyc01VKXpHO0lfZ3kldWJKKFJgdmFafHpzQ14y
aFFTeyhGZSpKbQorekxIeD8zcSVqRGlKTjB1ZDhCOGJhQkhuPEQ5K1c4QGglcmIlez0hKDw4LWp0
cSluaW9sMEVNRnZlZ1ZzNlJDO30jCit6SkB+YWhaPlBAI0EpMXEzSjYofjhZZUBSZ1g4S31TNUZw
fl4+aHJyezVWRUBRUXYtfStyXm98YjUyPmY8c2pVNUQKK3o0QWdVMjA9Z2E0RHVicjtZKGpPcFlN
QU5AYnM2b3lUXlRlcndMP1dgKzR4SnFUbThxQmVAKkF4K31yKXYhMlZVfQorekdDRiolP2BlOE1g
UGMyeFVaMkBMRzdxJFd0cSpGLUAwSXliRW85b1l8RzVQNWEyPGVjTzhlTFByS1ZiK3ErMzRyCit6
e05wXkN4fDtUe14pcFF1RC1TeVVEUilBZVZjWTtwLUIwNk18STsrQSt9WSE9VjF2dCsldjBATz4h
WEAjZU49flUKK3pQayY3TFUja1Jhe1o+PTA1N1ltajtrRW4hRmZiLWpzb2pSMjRgQG4xKjJpQXtM
JEl7XjQ9WClVKTA2X1BncH1DbQorejk9bUB2VVdPSWI8KmRBPTs7Ky1lYnNUSD5xc3BKQXxINGJX
RVJQT2ZMbSE5MT5SLT0pR31aRn0/Y1NkTFBidlNwCit6e0QjJjFOejtxPExXfmslWUMoI0E3TD8m
QHw2XmEzQHpzPWYlVVUwTV8rTnBnKXFtTUhyR0hIKSlPPChGdSElR04KK3o0aSpsKWRSKUA7eV93
JWdJZD1EJipZckVeZCVuZkxvKTRhVWl+ZkhBellJeC1aX0hjKjRpQ09KOzNJellQTUc4JAoreihf
KklhWEx3bjZ3U1BWRHNyfGs1dVFPS0haeWolNDVCOTtZSEdEbXZ0bVAkWGMjZGhvZj1qbV9FJDNJ
anReTihBCit6cnxBOyk+NEhgTU8rX3tOSHk5e08yUSNlM1loUytmSUNYKGBEWEUjczhvdmR2UWty
My17ai0wektLQTtQOFRZaXkKK3pgJjlVT0hzTGxsP2NwOE0rbVp1WTh8eGMzSENBezJzcX5GKGsj
eW8mdjB7WSpRbmd+NChASlRAJEVkMlFzIztkSAoreitfYE18YT5IM3dRKGU4bkZzdFBjciE3JSZ0
YypiY2A7JE1vMkhxN2hPIz9xRXtIQyhjV2RFan58TkMwWHluVERKCit6UjtRVzt5bkswJHdjSz8q
cHEwfkV5KTskKylpdE9lUmRCeDROZEwlfjdXOCh8fEthN3w7RShXXjBYWitpP0B6fD8KK3opNjtz
VF56RiMoY1Z6eHwlS19FSnpPQig+NkpOMW5TPz4wND5IamVUdT5JRjhOQl9VPFpIPClAe3kpNl50
TWN5Jgoremd7dDRTKz9NNzRSPnVFalJaQ1lhTWZxMVJVMFJMdHpwYD5rPmlecG55TFpZVHp3N3ot
cyNxLWxIeXs2M3F7bn5pCit6aUI7OXIlaWJDUC0+dz47QSRNRTY4fDgwUDBufjNoV2pLNj9gVHNI
cEdOeEU+KD03MDxfeTViQ2F7UkJVVWc0RGUKK3p8SnkhNGQ4aHdwfEtJSjN7UCE2RFluK19fRlJm
bHRnWXNZRWprJVhaZUopUkU7QjlNc0AwMzV3S007TlVpbDJKRgoremJIJWI4YGhTZ2M4UnpfUnti
eU5LYnEma0VzO2F1YG8lI1JVUl84NShaKjZRe3BLbj0mRWlrU1c+JURDcShvdm1xCit6SjA+bj8o
XnhIanYkUEsxd3E3TEcjPH07Uy1QITMkd1Y8bzFVZjFTJkd9bnN0S0JTJU1lTXdGQXgtY29qJWtA
bVoKK3pDfHpvNTdeWk1hbHh5XlEteXl2WmFmekBXeWcoM2ZrQWdJcmZeZTBie2A3aShkaWBKZSk5
ZTQ1Pmh2KmZlRHl4NQorem9pQE9aa0VWM1hyfHArOXs7VU9sZHh0U1RvJENEPk98YCRQO1pOXkQy
IztzQHF4VURhc189NTxpP309aHZOVjtrCit6IWNUKFhyd29fWkVXeEhiUip2eVFoSiZAc0UwKSgo
TW5qZD1CSGZmdnhBLXdvNWZoZlQrO05ja0c2eV57K1ckckcKK3pAOXd8NT1hbkN5KiFZI0k/PzM5
QnRVdGYjTUlQZzByX2J+O1B2XnxPeiUmLWtVaEE2I0d2QW1QVWZnb1lkRkd5cgorel5JZTVgXlhL
Rlh4NztoLWc/QmdKVGsrbkdjT1R3NkAkU2RWaHYkQXJAcVVhOW9faSFReEtIOztUbU5WTnZIbH5Z
Cit6RmFQS19qX1JZWVVHUjRZeypVN21WfFJTPV97fDtqdTl+JVJAOFZ+VXtPR31yem5EMC1ZMypn
LXtLWS1IKkhec28KK3p2K3RMP0JlVSpXYU9sMnN0RHBWJiFQUUBTYDFnNClaQEslOFRofSlKXk5B
fmRkKUtfeUVDMElxbSktVU1rJD5mXworekh+ajdXdVUmQktPYG5keD4me0o9OWU4cjh0TCk8YV5E
aDIzX2hKPT10WWpUQkt2bTVRYEBjdEtYMlhBKDE3RDU4Cit6JG1WX3szTHpXKmA1YmNFKGZHMnRr
TEhrblE0VHBqTH42M2hWWSE8YkRWNUNFYkkyZGNmd01mYiReWjhwPXs9cjkKK3omYk0+OEtQeU1N
XnlOcXxmQnpfM2Uzc0AyX3hjPit7eFMhP0NXcmhWPGNLR0s+bmRBKHpNbGd4JkpvWTJiSUFXKQor
emp7Sld0aGE3SV9Xe2J+dElxPkVqXylSKFQ9ZXMlTGIxSH1YaSp2fjVafXchMVhHSVNEPVErYU5r
cHVzOTQqWnJKCit6PD97NiRAI2stcldRISslVW5tPHNvK0kzSWJBOz44NSQ+ZnFAWHpQS0A1Jipj
cEc5U2g9YlJrKTgjKEc+Y0BGc3YKK3pJcT5VcDxQVSU2RUwoaVNJcjhtOXVLNDdUYkFGQytwVT5n
YHNUfSRGTWheRUNoXkw5eXsqMl92MlR1PENNaE04MworejRgMHZXez87N3Z7UCFJQl5WZDE+QlJS
c29GbypuNDwla2RVZk5iJTlKY3MqTmJMM30jaiZTR1lDYFUoKmJRUnsxCit6XklRKTFKOUVVUkFQ
MnJRaG4kSFZgUzdfTV8qam5vYEFue0diR1V5dk18PjlLa2gzZ0BgfWdGPz1UJGt2e2E2bHMKK3pC
IWBAcElsfSE/NCYwWGAtfWRHeC0rIyUwQDUrJTZVKFZzNHptMXIhS0NlYzZPdVk2ZDBVKD9FRlhm
UWFvZytUeworelVBO0B+IW9ncGtMKGE4MV42a2V0KzwhOE1kbXFae1VCPiRpZVUzQGJ3fCpxPnh5
RHFVajF8MCNoalcxb2FEcSZxCit6d15PazM2QnNDR1JHbyo/P3luSzxpJk4obXdmbnV1aGZDbzh1
eVVgJXtVcExJMHEjP3tjRTE+dHYzSjJ7Oz4rLWUKK3pYTmpgLW1XdD1KaWw+KEl6WGVgbT15UUVL
SzVxIzhKO3YxVUUpZiNjd0F9Y2QzYipTJG5XYSE3IWt1Zkp3Qjx1bworeiRUPmEhaFhzeVBrU2hN
UUR4T2EkZTh2e2ZkcWgyUzdeQno3Ym1fXjxQREo9IXhHfUJFbU90TURlZ1JHWmo8LXdxCit6KWJJ
ST5pdWxoeEUjS1leYDdEPFNvMUJlc1BkVE92X2EtVUVjbns+V1Q8ckRYZ3M0e3pWYHtxJFNFbm1h
JHNlPUgKK3pGSGBCN1JQb2ZgZ1N7bTNwflVEQzdaVCYxRiV8OT0lS2VPVHxGWGpTNWlhQXUmbkV3
M1E3LVNwTHteclVFX1ZhLQorej0lYG9CcCplWjNHQ0V0QEh7bDMpI018cVMjPU1kQ1Azcj1vcHRz
JUM5cTx+Um94T2RiVT8pIzMjWDM4cyk5ZW4jCit6KzRZYFlaPit+M0BWWX1tcWJLNE9HK0BDeCNi
SV90enxFa1M4JENVTkkxYkxeJGh8dX1XYzJwTXs1YVZqTDgjI2YKK3pqXkZvbXhfdnYxbz94RlY9
SnB2OHVnaW1sTG5HPnExd3c4WUJHPWEpaUc+RS1eZDVCZ2deZkArPF9+KHZNJT0hTAorejY1YmdQ
IXVkfEckTUNvajZMRj9LOFZkKFNmWmtZbUFkV05xP20jSCZyRXN8RGpyMFFYTWp8MUU8P2p1OzB0
aEl8Cit6ZlRIQlhrJndJMzcyU3pRQjNJbHk4T1AyWm1wPWQ/RmJGN1NfQGVfTnspfTx9Zmc3JndQ
JFh0X2RJeGQ1QUYrI3UKK3pnOWdPKDt2OWRjS2lINE4jUWV6UUFkZENaeGAoKntYfDhEMGkoRDc3
TVQlM288QmtvNXlgNnxfWEoyPXhKMDl1bQoremF9NlI/UzFnODFXU1N0I0tvJjc8Mm49fEdNbXpg
JGFRPEZ6VXBPe3xPZj5xdWVJIUNPT1I2N1hCSDYpRUNtfXxPCit6UE1FUEVWZGhzbjJvR0w1MWlj
OXNvdC1fRmw3ZXMpNW9MO09XRihNajFBYjQ4TWVHVTE1bT9tZy02X09FVCN2fGgKK3ojeE5GJkJi
UX1fbmFiV2lCaldOJFM7U0ZNdjB9UkB3ekQoZDZUciVSRndoeHIxJCtJJG8pOE0lOClWNktjRko3
bworelg2elhPNXppMXhqKWYjZHlKQjhYcj5He2JOSDYyZ0QmLUlNR0lCXmJBfWl6UzU0bUZ+UFZL
aUY0SXxpemNBfGx4Cit6Y2ZqcTc8Nyl8MmZ1SlMqNmVtdEtfQygjVFU9SmdLRHY5X1kyIXRqcDJi
KUpRTF8xJDc4V1V4bjV7IUhmTVRSPSMKK3pzRWMmcTlgRzFGMH0rNEJPT0UqeD5oYShNNTlZSTVs
dXVfVE9ESEBmOFZYPjQ2bndXZyFVfk80RF87eTs8ZFI2TAorelhkOUBhP2pVTjAoWUk2N3drKnsj
Pk8tWkttOW9kZlR4TWEkTE1SYylsWDtDfDN4flpDaz5oQyRDOFJLJlZJdWNNCit6TU1lU21UdFFD
JlFHfHk8N2RyJTN6YHUrMkohOzl5JlE2KElOV21iZ2IlYSU+Rk42Yj1za3s9VVZzeFh5dnFeaEcK
K3plSigleDlGYmU7Q1hjR2NgV3NgKjVCRWtgVmNHZXB7IURtNS1SVkkjdnRFVys3MlRtZ3p8aDRD
X1hzcDFEam5PcQorenNIa1lPPXFBfU9xJDB6PCZnY29wVzZeWmo/OEhMb0sxNXNBIz9HRU4jTEp8
a0k8aUNQXm9wLT5JeT48PmoqSil9Cit6YlluTmlAIT9TP3xEdVhedlRxOW9xc0JFakhwaUJVOFo1
ZlNQTEpQPFJASz1UQCpzMHN3bTxAXnc1JnFmWiF8VSgKK3pAT0pqUTAjUEI5O3ZAdGlRRzx+WFdm
UEJoUXs5cT93KSU5YjZFKDVaOVNSUmN7SnAtSShiVT9xYzNvJDZXbVFlZQorem1eTXxkTlAkWiQo
e09kPXZOVm95RDwzUGR7NU1OY256PWZnP2NaNWgoWCh4NkY1ajZGKTI8all6WjEkR1psPSU3Cit6
eExXTm57SEVlVTlWJV4/azkwRGVKcEFLZFgoQXs4VyVBbUVNb0liUFZLP0E1Jj1TR240KGdBNjB3
ZW81TWppZVYKK3pvOCRONmk9d2xRamYoJUl1c19TI3VLM3Zke1BeVCFtZUhtN189ViZQakRYX2JF
JlMmamdXJm4tZUcwOEY9PSs9VworemNNdXhhX2NgaEI4I0ohKGNQZG9oSiFvOXRfZiVyVF81RHdD
Wk1lUDwlQ3pDKEUpaCttJSFjZHhxTVNCLVNoPXNZCit6O3JjJFFJdmNMPG11an0qYG81Xyk4P051
ND5hZ01aS0JfSm91SjVQdio+SFZkUm9JNT5gPk9fUnhXM1A3Km9OIS0KK3p0QGhiKWVjI29uNFdJ
R0l7NSl2R14/Z2BsSGhmMGlrOUY5Rj4tKTBDWk1ha0F7fUNITHZyfnBVVlotKFBURX1kLQorenpI
ZSpOaFVAI2NqQCQ2bWVPJitONSlxS0RoeC0xbExMMDh7PDBgUz9gaEtwdEhlQkQ9VyFpQSN0MT98
PkhlQkU1Cit6PCtTMVlleT5eXnVKOE0qdipHJnd1Vngjcj8qblZJO3JmMkM0alpvVDMrdUFzQzB+
PkFfdHxpTHBJRiQyPi0pdDkKK3paTWVRfll9a2hEYF5XYSNhRDUteXMxNFdtbE80My1HYil+QUhl
QkNkY0chbU5gXj81fF95aVpDQGZAKz9gbzZPWAorejg/TnNeSjcmWjZlUTErNVQ7R3AmKz1sRD4o
eHo7PHpNcDI9aFU8R0BXXkF+PVUrdHN+Kll+WCV6czs9d2B1O1czCit6aFU8SVIlNTFwNGhzfGxq
Xn1UR2hIZUJEK1IlZ1RZeT1gNEtUJksldCF9VUUjVkg+WFI/OzVuPmBoS0B6OD9Oc1kKK3o4bmZh
MHAwfnBgVDtLYVBab35DR2E3UyEtPlJ2Yi11SjRJRVgyVm5XI0BUUnZrS0J8RVB1KFo/QDBzUE9A
NT9jNQorenhWfUhHJlc3dUk8R082UHpBdFhyaFU8SWMjJSNGMDRgey1NPndEcCpZPFRJZylNSmNT
R1VLb0JmaXJFbXpXPVN4Cit6aFU8SVp4QEA/PD9gX3pJPnZ9Un4hfWF9YzZFPEFtPm8jUz5RfT88
M01gcng+ZU1fYmQqWWAyaSo+SFYtUWtNPGEKK3pfcTdlJWFEN2tQbTxgd1d2clg3PWVKfFVUNGNH
VXY4THd1PlUqRSVLK1ZHPlF5eXxTWXpJVXo1aFVAIypoSGJkTQorelhLbD1lPi0qSXZZYERIeFpP
VnIwYF96b3JHVUtvQlE4UjcwP2w8YWV4VnxeNyVaQlV3KHVRcmd6OSgoV2hVQCMkCit6Q1R6SUE3
ajRSaHJ8dl5MbkhoaDU1MU1KaWIkYGBtIX1ZeXBKe3p2QElTYm94ZWVjPHo0Y0dVZTRjbC0lPyhE
UFMKK3pga3U1PTg/TnQ3Sjd+bDhKISllJVQ7SHA5Km9OelMqMlpuUHpJV30yNGNHVXVQMXRhS0ZX
V0kydUozN153Qmg+UgorencmT05qLXtVckEhfVl5eCg+N2UrXkVQOXtefVROPVpNZVAlJlFSOz9T
fSljMiFXRyhaZU5TQTg0Y0dVXiY5JmtCCit6OT1TUmp1RSpKQzg/TnQ+WXFSMEhBTTNFO3k1QWVO
O3JkPj1lS3VVKkdkRjYoXn1UWmtaTWVTd1pRTz9JYXAjQikKK3oqWnUwMDRjR25Idjw9dHkoI19h
I2VOV3Y8OD9OdUlHdH5XS3kxZXV+YzctLXYtKW1RNSF9VUZQYjhVRVA5Sms+KgorekFJZmFGejg2
cDVwUVBpWGA4dV5ycmc0Mj1RbkwtJF9iMiZteFZ8QE8oMXo+I2xNZFEmZVEoays4P050MUkmUT1E
Cit6SnhTOXhUO0c+Oyh1VjdNalM2bDFMaSt4c3hqRkQ9OD9OdDU+YWdLanpSIW0xYDshSzN4Vn1l
ZXBBRmFkRElLKW8KK3pgZCsyT0hlQkRZYml7YDFkek95ZGFEQmhodjw9dHlFWk8oWF51MEBVd3RY
UmVlXlE0SCpZX3VOKj5IV0koeV5vKgorenpxbX1xYCpyailYfkI4I2plZD8+YUo/NXN5RDFDYXBk
RXV3VFg1P1lCUXE4fVhtTmtpZj00WDQtan5CUm5tRDdXCit6dEBRcEZhaH0hRmtLVF9aJmE8NVEo
ZmY3OEtkTTFjeSZwP19qfEhEbGA5fU9NMypNJmdiN1k/N1M/fkBFJk5XMisKK3piWGpuJlBVXj5K
IU1WPDtwUmZnSSohbWY/O0EmfTRTUGZmbi1BQi0zcDlReng1aUBHUmk/bmRpZ0JFPFkxc304RQor
elNlUSZiaGI9aG9YVks1TjE/Um1oYFo7MzNfMVkpeENNPncjK2EtUj9mP0xsVU9qX2BGKTFpOGZU
WDNFWSozWG0kCit6KkwkK0dvM2BOWilzOGBERVYlVjxwXzNMSXlXUSNNNGNVJVpBRncte2RJfk4w
Zygoemt5Y1laLTNxSUZeJiRIbUIKK3oxOzV5V21zIy1sVFgzZlp8OX1Pcndjd0AmdWUwRFhDRE85
bGczQkZlaU1MdHMlUGV2X0Vja3AyLWV0aXtFeDZCdQorekZSPFdZMyU8flQ0X2ZkdDNxRVlZN2df
THE3Rj9lKHAhS0spenVlO2ZwYXIqSE5pPTRgYz9NMkRoYj8lZTIwX095Cit6eElWSyU+bXdIMlg+
bVZjIUsqQ3pGJC1SOCE2ejtGUVZWfEVmP015QG5YPSY0QDhQRXtfO1FQITg0SXFpJGBaQ0cKK3pF
JSs0e19yfEdve2E8T3Azb1c/MW5wND04U2E2OygoJDhFQXVDQjVhUjtDNDRTNyE7bCV6fDVRbX4+
azNJeFFUdQoreilgSGh0QEh6ez0pYEItJUBPMml2JjRNPnRARDI7VS1oeXtvQEZvbEh2KjY3Wkpa
ITtSRWNsPVctKGJPcUUlLShZCit6elIhWlVUSlRXfHpSN3xnd0JURFRfP1FLNnYqM3A8X3wrREMr
PTZlbDs3MlVASFZaeXMhUF9uUEYkKnJnMEZqb0gKK3o3TXkzVF5tRSpUVSNtZ1RER1QwViFLVz93
YnJ5V2FmP3NkSlBnLSFec2g0X2Atb3BOV00rKEZAQ2w7SiVVaURMQQoreiE5Uz0kKDc2XnxaT0k1
Kih9SChkKz9RRSFtaiFvUEBOTnJVWXIpK1h5dn5BcUVPQGc4X2dlNWEzKktZRkoxbHN3Cit6MUBF
JXBKYDMpJTtDPjRwdyY0MVY3T2UqQF8pZCVhVkdBQ3g7UUs2aXA5TFNhOzJ7ZnMoMU0zOF8/UUwx
KkA3Um8KK3o7ODY9Y1pveSp+e0Q9alFUa3JgQi1mekwxTUB8JHItKndoNCQxWDlOWj1aPGVDbnVY
bmp1dCp7QiRzXmBLZFlUQQoremVGfWZpfDNEb348VkRVVnJnLXNnPjlAKH1LfiFRPUBaVGcpbHs3
SVNfXiordER3LUc8ezE/ZW4xeDxfensoa2FRCit6SnJrcFh8MV4yM29RWXc8LSRTMCZKck5mQ28j
WUcyY00xTUJAPkRxIVpHenVMb35tWXxQVmY9KCNwSW9XemxsNm0KK3omVih1V1p0XyQkNkQ1TWJv
OysyfGdkekI/PGYmUkZXXmwxKHZVQ0decys1VC0hTEtEeFJXZE90Xz82X1RMTUEyegorelVybkI+
VmA1ekppXilARU9wRlFzUXUwKDQ2UWhFXmtVVWt5I0lXRW1BV3pqVzVmKiRBZDgma29GMlUhTXJ6
KTZlCit6NmE0UVYyVHY2K1E3OER7bEJlcElhMD5uPEA+S1p9cnJgZ1RKWE82IWlRcz1pbytANiM1
ZDA2eFE/Kk9YeXV0SzsKK3ptJUtAU083UHolJnB8bWNEZm4tYXJ3VyZ0NWQ3RTNRKn0jPjM7djdi
c2o/LTsxYjt0eXMlblcqIUdEQE9Sa1h5ZworejtPYDs3a2JHRzFjYWtxNy16RTZsJFMpJF9DaXE/
Q3NlJmN5MVJvKCEpaHBvP3s3dk1rYXdTWmBjYXh7OGxfKE1YCit6XzJqOHlCQERyREJ+UjVWRzRy
fThmQVVuUjU+dFgtT1A7RCFWcDh4YyR5MD8mT2JFVzNKWE5RfXhab0Ypcl49S1YKK3o2YTF5KnNW
WEgjMSVEeFZzemB9cCFDeWUwcyE8ez1fIypQMDUrfUxAcEhINERRbGRAcHp5Q0lQc3ohLUEhVCoq
IworelJpY0RiQEdwXzREd0hxPHxGN2ghMHdxY1d7fWJ8NWVHLVA/ZUBMRHhQaHRqX3tHPEhJKk84
d1J7SXwoZCNZcyNHCit6eytyfmYrOVcwZnwyNlZkWCVnZHR8MDRNWUA/KE8ocEZDQlkjSGlwdU9g
YS1FVnAjQ15rWiZSJTdXfCMkbzVePHgKK3p7eDxTMDxsNitsaX5JKWliJUt3T3I+Y14wM2pRWVlS
OGJQOTtKZTlGSEEkMlJ7KEFEOCRzMjstTn1laThWJj9hdgorentLLT1fTmxYY1RFcVNVV2lBbGsp
QnVgWiZGKExTQkA+RD8qPEFQc0lvfmxQO096QFlJcl49QlM3NXMoZHNjSXlLCit6MSVDbH5zdStv
fDtFVHZwd01jWGNLQSR7UWliUns+ZkJ6VkdzdUdEaCFUKiojUmZ2UkJAR3BfND5YMHg2fEY3aCEK
K3pHOSpkX3t9Ynw1NiV2TnZlQExEeExTaEMjKHR6P08tJGl+KEBaVG0rbF5gKUdfLX5TQER2KzJF
e01YMSsxeFNudworenspXi19XmU0c3llP05IK2BINH0lZjB7Z3Bgb3lyez87KzEySmBvb0RvI1oo
SENBdEtFOCtrd1pIb0A7QWUtcnNTCit6IUFIcE5CPH5kYlAyQFJyfDZrdFQxVSN4RFl4d1VAYXhw
QzdNa05YZzhaPkEhaCE3PThneDBocWEycT57MCpjfWAKK3pxVWdBeWJPUzAmVnxQUVkqSCZCQG12
Sjk7K3tScjVSN2hBNyhHZXF4cG9vQWQtZlBSRUQ0Um41emYtcTYtUlNyXworel5NMnB8PDlXIWY8
PHpORHIlcyhaYiF1cytTajhgcXhKPW5qcF5CZDtAb09kU1FTcX5na0QxeGhMKDBpbEBRcztDCit6
eldWMXMkQTdrZWduIyZtVmRmc2cre1FGSSh5Jmd4KVVmaDtoPmtNTT5KcD44LVkhfkNJOGptT15M
aUdAKy1Db1gKK3paWHNkZSR6SVpaa01YaG51JCVCSzNJOWFaZ2tNTl9KV2JqIV5zcjIqXzk7QnhZ
c152Z2RPVlJQP2RScDljUmlqKQorej9aSjxfZCVUOUopcWRSRlZgKjx0ei1aRWZNQzJkQU5gaUQ9
T1FVdWRrZT13eTk2ZmVsZmRxMHg5aXo1YWtMfUs8Cit6Zis7JiZUSVMxS1RpKCo3RWZHbG0rNU5U
KUB4RD9CWXRvKWVyOGEyfnI5ekZgRUQxR2d4NEVCfmU0NGFOVEMpZWIKK3oyXkQ8MjtBXzs1ayVV
SUEjNyFAZjVDMCVEQ2xsUCMrT30mWChmPDFtSTE7WjluMlNSdjc+VDBjVHI3ZnJANllZLQorem5K
ZFBHVksmKjEtb2hRfmRjRSM1V19MaSExPzBaKzdPVT9xY0s5ZE5nbUxobllEUi13TXpEUSkyNUgr
IUthVT1sCit6cVFTKGFDNEl7ND1PNCUqVF82TXAlYGZkZEl3IWliQ0E3YyhNcz4rP1Y9JDVTZ1da
UkwyK292JSozTD1lVDAjeGAKK3psTDEzTHBgJldiPiZ1c3laeDVSNWd+VVhAUzRmUFBVQCNhfmJ4
OXdQSTNJU1cmUitCQSt7V3NYTGl2O0xzVlUjPworelNDIzlCTjVEZloxP3lqeSU4RXxDKnoyaF4q
QlJ5KT05VlRmTlZuUlQoUSVOYyRMXnVgdj92OTkyU1UwJjwxI0ZaCit6ITA3NkBDK018WCk+WVR9
WS0oIyNicWQ8I0tjcUA7QD08YWdBfTR1b2xsQ14+bSZqfDx7KmVtTnBocFBgRjk7XikKK3p5RnVw
KVlIcmRWQ1ApND9ZN3NJIyZSTHtKZVVfdm1jWUgqMm8zIWYpMzh7TVFBbGx4alRfXnlKbiRQYElz
MUZWSQorekl0S3MqSFRrNENaM3M3TXtSbnpOO19TZDZOcnxXWl9pWkY+QiV3K0J4WUAxNVN4Sjxs
ZzQyMFZXJGh3TWlWOUQ/Cit6JktvTjJZdG49Z0h8XzdGQXhKYSZkcCt+UzNOM0gzLXtBcHcqQjx1
dXMrWWRlbmsmN1lEfDU9MTJoMFd8eTBvUXkKK3p5Qio2emwxIX1eeEpJN21UJk5KPW1aSE4mSmNL
bGVAc3NHQk9qdkh4Mj07RyhmYmQ9PGx5NHtZeHhAfXYjZnlMeAorejctZmVVUj8qN354X2NIQmwz
PHZfT0ZHLVBjJlg3TVdTRThJdUtvYU5GbykodExeREJXSDQzRmtgO2NJKztQQEJPCit6TXMzcXVG
aj83UVAxXkV3KjJgbzsqdD01ZE5tV1g0TmlSOG5DOTB+bEpFX2A9IXNOaTZGKDt3N1R2RGA0Qip7
Y0AKK3podndVeFZKQF9zO1g8N1BSNE5DbVA5bzglMGIkZzQwem4yPktVTFhMTHt4ODxzWFJnRihQ
TGR6LWRYOXEwLX4wLQorejwhITM2M2J4ODhRNHlzUnFDMzV6QkQ1Rkx0XktHaXA/eGJLeT9TZV4h
IUFWemdOY0hKQW12S3d4byQjSnFHJGtSCit6UU52JkNSYjRPeD9IYVR5aDYzeVM5VX5gYjcyS24k
c18+Qm5gMFJobXJ7RUU4YDd5a3VWKmViYEdXTVFgNDhAfTkKK3pXTFNCKG5BJjVAS3B9UCpEOSZf
ST57aXFrejNRVHY8ZjVwfHBxU15QNyleIX02b3FHbTtPUHZXQ2hjVGBHcFZhZAorekRAfXpNYktN
Q0YoK0dCYUdzUW0jXlEySypfJilxfCkpMG4tVyVSZFVSWkxKTTYhYU0qPFFGfmpubCMzQDRNd0Z9
Cit6YWlVOD9BXkVPKUpiTm9SP3Nzd0E+ZiQpd1pOfFN8bUJJeC1eJD05UGhjWTt9Tzt3IXVvRDl7
MTNERHUzNEdRWXQKK3pBdD5WOF8xRzRxM2JJYT1jJXNQanl1I0pSI1p7QlJeJCE9OU17c3F6Q0F5
cEdOYmN2QipHRzVmPTx5Y2BFfEE5QworelhaK0M4Zzclek11Z3xWYDxRRWxPUy1wWkBNR0JgJEVv
eUFNQGg9SCFGUjlQYWR9amc1ODtPNjd4YnJHdV5kQ1hfCit6N2ZlKGZmMT1tcEpWWXZsLVZTZX1L
U2doIT1NfXkzV0lrPD0waGkrNmp3ITBgXjw9MkZLTyVfRlE7NHI3MndAKVEKK3pHIV52fDZ+Uz1e
NUMhdVpzWCNiMHA5V0UzSDtFXlRIYUBGcllCXkhYYlkhTmNnaj5AX0dOPWpaKkpDa0NzYD5qYgor
ejFSQXdwLWxIWVg4bkc4Ri14TD8hNCQ+R1FKTmVrajd1QlF+em00SCpYPHc2TVk5QzN5cjhVZFAp
RWVlTXtldktBCit6KCV2T1MkYU9WWDljaSViYnJQTFBadW9mI2l5Y09LSypFPSphXm5kP2ptSF9H
cTgzczQqUWl8JFpqVzx7TikzfiQKK3pjcC1MSmxReEVeUWRRbEZMaUBzYlEyUkN1O340V31mdCZW
JXEmWXRkdz0wP3xTfmF2YEYwem1Pbz5HYVQjaVNaJAorekwlPntCekl9bChvPjlLQE41UX1NVF5H
T0dtYmFLN28zemNPc293Yn5RSlV+TWFweTZAdTYlOVRxVTA8N2JVUFYtCit6T1VQNz5ALVZaejBM
eHJ9U2xyZF4ofH0rXm1oaDIoJk4qUDNCU3FAOCVTZW0jeEtMMHlSVXtpeC1eQnVeJEJNQjMKK3pW
RSVAc1NUNTUzXjV3Pms/flY5IWViJlBBN0pjP3whYG49IWJSeWUrPFU5SlQkV0otSHhnQCRmUG1q
czxYZjswbQorekw7IyEqMF9GKn5EWCkoJjR8bEZNP2RaQmFWJEkhQz9+bT9qcXU7WnpaOEpscXly
b1hOVEcxbV5kRl8xQWt9bjMjCit6V1hrS1kkSiZaKXlpT1BpOHtaJGM9RUsmZ291a2sxbi1mZU5R
JjwoLTl4QmxmdU5LT0UwcEo0QkNFal9gUW9GdygKK3opOH5naHo9WVFgcWRsQVNjdlJNV1MlaE5y
UCkkZFEqIXUkK0B0c0FgNlkzUTh7WTMoTD5eVTBKczExO2FyQWVrJAorekc/YyV6MCRMYHRrNCha
Qyhxc0xna1J9ZVNtOWNYWDVlJWxxI2E+VWNlYWIheEw+dEA4NlUjYmlaVnM5fD8yazlPCit6VTgh
UypEWT53Sno/UDJIaGQrdDxtZzN+ezFWe0koTE9BdktSZ3tZUXt6ZSp1WWNTTUFlNzZaZT1uU1Mw
QUM0Yz8KK3otKileI2FBaHFZI095Rj5fcWV+MzZ0QWFvPCZkayNwMjM8OVQzWDVMR1BEWU9APTVy
UFpSfTN9VmxNcEQ3Qk5sdQorelp0Q214KnE/cmZJQTlDRCs8YFB4VGkhJlF3YyU2PSF8QV9KTERX
fCgxbkJWLWtkSD5+ODM0VEhePnh+IzFSXzF8Cit6bXVTUy0mSU5mJTV4a3U9O0V5S2FII2FYUlg4
RFItI3NJayNUNUhOUzJOUyp5PDwjeGxyRSlIaiF1K0g5c3xlY0QKK3p1QFktdz9kXnYjSSNmUm91
PzhmP1lUYyF9UW83c3pHZ3p4REglPEt0eGhydk56Z3tZZ1p1U35odyspYW0pI3Bydworem84bCti
WEFpP2w4SkJOQSQ1UFg8YHJFSWZ5QUE4K2VFVjRtbX1+OUZgOEh9QjtFKXU1ZzVwTWV3SH5gdSRn
JjFACit6clZQfDJCLXpySXNvZVV8R2UqMjZgfjxwdyhfKyVpNH4/RCR0MGZmT3JSJnB8dzVNY1ok
a3cyX1FBdTZGSkNiRCQKK3oqPWtzND9LSTR3N344ezNgcV5DYDAqK31VX05vLTFCUlZWNmByQ3pS
NjhCNHkqbipDNkYyWW9kXyt+KztDc1l2ZQorei02e2Iral9lXlFhWDBjSXtYYG98LThPYH1OYl4z
ciE+dUtMd1c/KlVlVX1KfjYpR188SElEREE3S2ZJMEApRDgyCit6elgoS2hAeUptWl98TnhXO0o/
cysoVzJIeFNRUnloIzxFfHZRODQybkVORmdYZjNrJVZpSGhybmN8OXpNJTNHQT4KK3pZOE42e1lN
cnJBT2lMN0A9cmMjI2hOKVRhPzJ4SU0jKlJYd01aK0ZNdllAaERSOUVrZFlEd319c0dibTFVczhS
PAoremNNVWAlQE9mfG1rJCFyRm1vZXZ4JCRaZ2djNFpKc1M3RT4qQyhwa0VgUVpjVCFzaUgkbmJ6
O25RRjwpRjhpa1R+Cit6bDQ1dTVwfkFCeVRxdDQ3X3Q8Tk1KOGd5UDdKSlBSc0QqQmEodms3aXAj
JHs4SnFyJCREakZUayVBX35eejIoYzUKK3pKWFJJZ3BfMSh2Tk92d0g2IUQjP3NFb2dqTyU/SGQ0
LWt4Z05rdnxlTlRWaXhVNjBiJWRpK3Q5QHY7a2JIPDc2QworekRLfDJtaCgyNHBrKGhJbmcxU3tA
I0JQOX0mT2wqbSF1UH4qclk2e2RhPEVyMyZwTXdlJFpDT3tCZlNeeTlRQlBMCit6bUspTmV6T2Ur
blVGeElqX0QxWFRPaWxkMVBNd1A9K1N9YH49aH1qX05jX2gxQCRxfkQ8YFVfOzstQHtIK1cwMHQK
K3opKUEjPFg8ZilNd2Z6TGwoKD5lRVlDcFklaWtRU0FsSTZYY1d3K3VUbHoqcyRINDxkTkkjWG5G
TyUmYjkrTlFpZAorelMpczt6YmY8ckV6bDZ+by1QTHd7cE0+I0liZURJMFg+e2s1KDI+IWQ3d1B2
ak1DLWx6P1RxTGB1VFNSMCY9SnZ7Cit6PVNfSnBWTFRHdSluITY2blI3fD9XST0/I3VwNCQjdCZG
cTMla1ZJQHJQU3xTS3RxRjtaX2tVRT1+bCUta1BIOHMKK3o4ZUJENVl3aXIxLWBucFhUQk0jeXMr
KiF6PXFzYztgJX5QdTUwSjY5NWhuLUR0UHRjOy1gJnpVcShKZ180cGQxKQorei1Kfmt8MDt4STsy
e1d3MHJBRm84S0trX1ROKDZgRUdDOE5UKEw9KkRhWFgxM0kjajVYJlZ+MkFOclJDMGtFS19SCit6
I3wyTilUUUg1SiNnYkdrTnRVaz9MaEsqRWxJJFlpR3hTTTRhMEFYeyNVd20ydFdGQ1ZpayVwbiZN
SmwwKkl4Pk0KK3p3Mj4tZ3stYGJ+NFl8JlQtR35hZmtDTj15LTBXMSZlUyM/QStoMX1YJFB+O0Ut
N0hSb2R8VmZ5Pm9IfWc5d0s5TAorelVCTFcyVV5XSEtaT0ttTVJJcFotdFV0VjluQ309bm5ob3pG
ISgwX0MraUxpTk5hfT5YKDdLPmslQ1p1QF4qN01SCit6PiUpenJzYDhEKiYwNl8jZG5GUHsrQUJl
R0wjX0VzdmNVWnxZN3pLRFB1d1VVSkAkcyFRT3RyS2B5YmQoT3RtTDAKK3pWN35PJl9wMkIhQGh1
YTtAWmskT05iKVR6UyZ2MDE3V0l1JUlPNX1vRy0/TURAajkwaTR3X3FSPVVadWZNWX1VWgoreiop
MiZjeUNjN21UKm9sZSR9Ul8kPC1FMzh4WExzI01DfFM4JjdCJGJQYV5KKCtEJnZFWWFHSjwkakxx
Ujd8dHhQCit6NzlHPD9XVVpwZEtUPmBxdV5tUV5CQDRsPW8yNnQrakJhQGJNISRXQmJkYSpXPnht
UH00V0heNzdxakJoOyFzfnEKK3p7MENWMCY2N2NvYGtFcXJXbVZqZk5uI3dfTlgpKWVhIWY1T1ZG
T00kbSRlJDFmQjcxUT49WEBBcEpRcVJxMSQ8JQorelgxTysxRl5FTU1FZEcpKjI5NjQpYkghYkU1
UCh2eFpJYWNmSiZYNmk+KG41Mm4zbDF7S3NJU2YoamVVOT8zOThxCit6S3hqT0soZDVqTkw2WHF5
UXBWVnNEKHF8RDZKaEsxNzN0ITJZdC1XPWclR2tze3NoY0liU3gmOWNSciplYXkjcmkKK3pTMVJj
c0orPStaIU5rT0xXe2RwfEVmUip0U0hNdHpWfnJINHhaIXpKZmF4MkAkSnFyc1Q3e0p8PT9TSUAr
KiZvSworem9QeXkjKmtpd21nVCVaVlE4WUNWPGpaKHI5elZZWD53PU1eJm59R1l7KnhaN3FzcXdj
bGwwZyopRFdZPTdmOUQ3Cit6V1BsRz5QPDZ2Z1k5YlQ4aTBOfng8QT4mP2EpeEB6OFUkI3JOe0NG
JUAjKm15M1p8bGFuRno9RUJ7ayluV04xOTkKK3poSzMkSDdkOUpNTDs8VnM3OFl+aTRQO3RFcTZK
eUBObGVzOClMN1VBK3ROT3o1UjYyKFd5RSF1KCgpQm8qUzQtfAorej80aUp2Wng7fW15cEl6QSVo
IUhCNTtDNTdqcXJZaWxPMk5BZ2t0K3JRc0JHVEx0N2ZQOVcyJkczO3klRD93JlJuCit6NnQycDlu
aSFQcXI0YENGd2lrVHE4cFEkZjg/YEYxY14jaj9NdHVoWT4oJTRwTWBTa1hORyNJdDhhK09PeE8w
VWgKK3pPODE+NWxYXmxNQjVYMFd4ejk+Plh3VUwtI0k7anY/cj0peiRPV2F5Z3NgcERVYlkkVXFs
cXJqZj41WD1TVFclWAorekVEc3x9fDlLSUZhPFQmRXBrbjBAQzZJNWdsdW8zK1MzdU90U1o1aXlN
UDRyeD83bip0UmFnfT93O1BGR1BaT35sCit6dHw3emZfNWNEIXRFWkJiWDhzUF5qbFVFTEdaTmlT
YGEyQUxRc2c+T2FOXk0qdjMhP0hrPzVqKShVI3c7YWJkPyQKK3pGTlczTGglWEkpMG4hPjU+R21Q
d0Y+JFN9JDZKeHc9WVktQzFDdVdtOGZhTG4+X3okXlBiWHFTeTNJP1JVZFYjYQorejZiOGBMJmJH
WSFCMjdJTzJDNUJjXyZmMCMkUWt7PGtxQ2pPVlNRZnRhJCVSWkwxOGRWZjQpNkNSY2FAbD1TKSQo
Cit6O3V9SSs/OCluPk5WO2tiPmNzaGhLajM+c1Q0YCErMStBJj1ld3pNcj9HNWM4WnE3RigwaGUl
Tj5qbUkpclliZUsKK3o/ZWwxLXZzeSVlWDxraU4mTlFtY15oPUVUTUZzZjNtWDR8VDt3WShZUUpW
S1J1Y3hIPnNTXkQzMHt0QkgwYylqWgorekIhXmsxNDtgV1hPKUxRUCtISn5GVXI+N2hORD50dE9Y
VEJ3QlMycn5wdDxaYCF0X0t6dnp4dWVeX0x0Qy1TaGdmCit6QFVUMCYqKU99PCYySUxtUWQ7aC0r
Z3FUO3sqKE5QQmJkdFdEYz0rQEtmS1R8emNpdj5aNT13Q0NFdlU0cXxTbjIKK3o+ZmBJbW1+U2Il
a209el4xcklncjtvfUl7XntNYylsOWsyUlNwMWZEOTVBcHhSQiVEZHgtck08aHNPfEprTFE5Iwor
enZLcT83RGdUKDFPSEAzZCgzSV9eeXdSezE/WCVUcnV1bjAoam1DJDJMbzl6Wlp3Z0B0TEhLKzRC
RUZadzt8Y2Q+Cit6NDZsNU8mPExUWTE0OHs3Rn1vSHsrWGhXJilKKSpLTFFYe0orT2BPayloX3Iy
JktNeHZ4TUElbDRoZ2hTdiFhfEsKK3pWSTU+dDl2b2AzT35ubXNQKENKOUp9dzNveDNwVldNUG5T
YUY/fHlXeGxveipJJlUmSVdAaDMrdDQrfC1nTmJlKgorendaKXh3UEVHbDh8SmxrMm1yWFJrYFNB
JGpaNlZMJm5jXjh7bkQ2PVorNCslT3pSLXwjYH1OekdsTnM0e2Umflk4Cit6dF8jQ2UwMnRvZCM4
X3syO3hHMDckZXhxKzhNMTs1Rm4zMVJBTVVTZkQ7TlVVdCR9RVI3ZmoqI0hMPFRrWk8hSWQKK3p2
b1UlN24zK0hUT1JmdSV5Z2tKcWc7JWdkYzFAZnhyJl4hd29INj5DPVc0eGN7NEhOZ2tKamszT1FU
TW9ubmJ3UworekFLQU8jZ2pzXmNwOXNGK0VJSH1xQHM0dk50WXpJMio+eV9qYDExT29zUnp2eWc2
NHIpWWR6SHV2ODVQRHlIM0kjCit6MFgoIVJvK08pUmBXd0FkKTVPKTlUYigzSVEwa3cxRDZNcTV3
KVB1RXU7bXx9JC1hQG9Dc2c8b3dhdC1UQ3JsV0sKK3pINW1CbDh+PV9iVlhHY3JCQEJ2aChjfDlg
QWhpV2A4Iyt1aXBrWlUpOzYkaUdINm00ZmUxbUZsVTNyPWU9VzwxWgorekU4bGFBZ15xaGphcGgr
JmhQQjZ1VyNYKURKeChZUyRKTEExRmNXN2Y8OGcqKDskajsqKXRSXiQ3KjV8elRudFAjCit6Jjd8
dFg3dnltfHdkVlYyZndWK2d2RERmQVpffVN+ekd6S245SmpeZkZrNmc8Wn1KUnBsZ1J0UWM7aUF4
OFRpPUAKK3pZZUdJTmNIR2RhS2Y/UG5kQG4hVD56UnhHXj14fHpQanFANU1OYU5SWXwlYCVBdiZX
KDlzeCpKRXJ6KiVwU0B0RgorejgyakFzI1VtVD9WZEk2MHJNfUBNYFM9N25EVzU+TkFEKTJER0J7
b1N2VGwxRlVsUlQ3ZEtRei0+MmFEQGYtLS1JCit6SlhjaWEqa152dU5SJDAmd2hxO2Z2QHp8d2sq
R1oqRnt6fGE3OFM3KWdIKU84U1NacWQ9VytDcm1EZE1iRHotZS0KK3ojbDtgbC05dHVKTkheYVZ5
JnFkMS1oX1BWR2I2aXRWQ21FUCRnV0dvQFgwJlRoJkpYTShZPU0/Kk5pOT9kSGlveworeldiM2dG
ezUyQlFCfj56S3UjJThUKFMmRz5xPHNIZDlrRXIqSHc2PX5eN2FVdCppJnRPNlU1OWJ3ZmxkOyNN
NDh7Cit6QkQ3MmgmI2d3fHFoR0V5dFBVN3JPVzlBSTdnNT5GcClLfD9qe3E2bklkI0o2R0NRKW1U
Vm0qXitEMEBQQGtiWVgKK3pnTyVJRFBYO1BDamxWbyNaYzRfZU4xdSk1TX13VEI7QXFoNVRZP3Bm
ZXRgVTdxYy1NQVJBaWRKRX1RNj5Kaz5GSgoremUzUjVWWkx6UjRZeEdLXlcjQFEqQEZrJitFPGN8
PXhgY011VmBBVS1yTk5rbndTVzFmcDVtdWwkTWd8ODNzMUtPCit6RnpzbV9zYz1aNVlheSR1VDYx
c0VucEQhY3coUHMpbjJmIypPIzNCNUxIIVFWM3hVS1NpMnA3aDBzRT99Kkhnb3UKK3phI0k4OD8l
SDdKaTFgQlFYOWlle25CQkVYcnRIUFZGaGAlITNtX3g5REkkeXNSX0BWYlVKYEpvaDk2LUtedSQw
fQorekhhZT1iVGxWYkZYaVRIc0B+SjJyV3tDX3ZCM1N8UiN9TyMhSnF3RFpJJisxUFdOLUxOeEA9
Sy1lUW9AIVBgLUdVCit6eXI+dCQ5NEo7KmR7WVBtZXY3PyVxYUBgcnh4TDF8UWd6KWBnQClQZjhH
XnVkbUlIP19WOzUhV1c0PHclWjtZdSYKK3pQM21NPUNtN1ojUDhUR2liJGxxeyZ3YCZMPzh1NTYp
O1d8ditoQlR+ZGdQQDI0ZUxiMT5nUmt5YGBtdjE8TU9KYAorekNuPXlmQT05KnI8MVdFNTZGJlM1
UVRFNGNWNmVEMS0qVz9uX0NnaFNeQ2ZzaFBtZyhvTXBpYjNeaWpeSWpNRzs3Cit6TjJ5c2Z0RyFY
Kko5c0tRISRMPXR1U1E7QilpY1UtRjw9IUlzQEp8dkk8bTZjbGNZYDlmTzVEYGZjZSpgLTcyOSoK
K3o/UFUyaFg/O0BaUDErSHlwLSEhI29ZdjVmRlQzVE53MmlHSHlFVXx8SEJ7ZGtkTDxRZERIbFFi
KilUcyMzRjNURgoremo3a1N1VDZYfE5fcTU1PEohaz8lXldLazw9LUk8ZCtWbmR4YmVRU14hd009
VCp1aG5UVH0yNnd4P3NfbW5URUsmCit6KjRpVWhPMCNXTFoxUTlLM0w8SSFtXnl2cUgtOGpEPnxP
JHdGdVplXihtY2tGXj9Ld1gwdGB4NyZPYXo9Yyk4PHUKK3pPQ1R7SXotc24zUyU0cT9yN1RtWlhv
KV5NbXR9bVp1ekVvNnUhZ009OS0rQD5pWFUoZzVZM19EeCo5MFltREx7KAoremojY2hiKT1zTWZw
KkstKm1iZXRtRWtASHFrd3RmelR+Q1F6YHc9OEpgSmo+YE5AQjd0QGdAQHJ6IT9Sb3kjPH41Cit6
dE1OOUIjbTV9K2w5e1dGNHtnSnslSUw0bkIoQmUzVH0qM01oazZAezR1MztUOXYzTDk9d3xzT0kr
Ki1fTjk0IU0KK3pGfD5DQ0dgYk1PdHMlVFE+aWd6SkNLTnNQUHNJaF92cSt7TGhpfnpFdEtmYUlM
Wj9Nezw/MW08dmFPMiMzYXpoMQorektKbzNMQmREU3U7YjA8ZmhoZ3JkZStwNWpgTnAoYFFjMTl+
S0ReMURrMjxDR1h2SHBZVnZsfndDJVArZDkkKzU1Cit6eTZBRkF5JHsxbT5xZn0/dTk0XzhsKm5u
NG9YOHMqTk9ZPVYqYzk5KldqaSg3VXA8RF83NS1ZamB2SXtwVyVTTUsKK3o0NjU+X241eEUoNFAh
XnEkRjN+dCN5aGZaSkNpT1IjazhKbDRfK3J0PXs4bnlvNyVaPDZ7ODNhQkIpTTwmfX48PworekBs
dGNlLXd1fEs/OyQ/KHpRJXVMJnMpKmJHU15FQCQlcE9KNXRNIUhkNkVDMFdDKH4zSm1WdzBFSTxt
azdvK2V0Cit6QmY2dDVhUEdeSipIKFJZa2ZMPytlcXUxQVZPYHlwZUNmQ1BZY1RvPzljY2JBXis+
bCEyVypia15AVVBLQ3Bscm4KK3pOOCROeGQ4Tk5icjFMWlM+cnwzdGU1TGktQ0QpP287amFyJU1C
eCpBQjRGK253TkdEZHJueiFaSmwreUloeX0rOQorekZRN2JGWT95bm9iejFDb0lNLWx2VFQrOUdr
fktUMmZjZUkyTTFPN3heK30mJnZiMFliYXptX1JpbW13NWE3cz5+Cit6VF5aZmtIZ3VXNTFfVjNz
O2chZilKJUQxMDlnaTQzQT5xVjtQb1RHYXh6ZGFJKFlhRS10em1aZk00IWRFb2NlcnkKK3pfRUd+
JHMlIzNjR3Q4b0NRbHhjR1FRSW5HVy17am10O3dGeUlidTk0eEV3cEMtPzU9ZntFPF83aHBMMHA0
cTNfRworemR6RXhaSTNOMjFFMlBAfCo0QWo2bC1OWDlNJkROVD5oYVUwZnlgPDwkI2hPdTk5RzNC
QWd+fDhmRiFnPXBifSNjCit6QDYpbUQkbStBSjMoKn5WdGJoVW9kaDBRYnVYRDMxRXBrd35MeXV6
OWN2YDJ+cE9iI3REfT0zTXF1NCF6V1pERCsKK3psP34lLWZ8WlRxWlo7QndTZVh3bFpFT1FLUj1G
Rj5VWTZZTjhEJD5ARD5zWnwmTVMhRyhxWnNhdihQcFlTOXV2QQorejdgTFRDWWpCX04tdiFCRzg2
P0dxbldXZWFPR1U0eClgfDBycH4qZ2RJWmF3R0JPcTx9JktMWEpLN24tVklHajQxCit6bmBsWiNL
SUxSMkdTN1BVTGd4QTxNJWZ5cFZOKSYhMFh7b1E4a01XYCpzVCg8JmhCR2FyeChsYV9ZVGZreTw+
RTUKK3pDWEdRZnNCQHNLKihoczl3QGtQfFAkNjRNZF9Gfjt5b31+U2ckVCFXNTE8ajJMeGFmZ2Zu
d1FpVUxZZUBkXit8NgorekFKY1Z9OF5UfUhgYXVBeU9AUkpgYDswcj5fMGd5ZTBNJH4lSmlULUJw
fiZlJmJEVjJ2Z3JxNEtoO3o8fEdQKXZRCit6Xmw7QWVxdHA9NFZ7R3hzKyt5eXJTM0RxMXNNdlVh
Y1RkQChJUmRCfnQzKTtpMnhwaUtNa25uJW4rYlpDcjFoZTIKK3pGMkk7NHJBR2dBYHBgdipBQHQh
SHJId2hvaX58YDBwUUY/QDx0d1B4JGtLTTxtdlFBZVl5NytZRzhAIU0pT3s1aworemA1cTs8N1lC
JnEwS0F+KWQobGhEbShfUzRoRW0tfnVGX2F5QDMkfG5rTkIzMDQ8VTNRKmJCYGNASl51e247Znhk
Cit6WFBUanM0KShuPzZofT5tPFFGcTc/Sm1mYDlAaX1gTWhIe2QpTlVxXyhxcl5EM0s2Q0ZpVFUk
X0pvc1JyKkRSQ2sKK3pWKjl2ZElGMCY8WWc2cX1lcnVselJrNzhmcTkqTmwlOFRLVUMyeTg/Z2ot
Sz9SRmlmZkxGckVzTjdhZ3FkfDVNTworekZqe3w9em8tKH5zb0wyVj1TMTZ2PXgkPTFBUkBMZmVf
PVE7d2xzVnl8MnhLKEQ+V0xAZ2ttfmkmeyp1dHY5NWhOCit6WGt5Ujc2VD0lKk83SkRQcyRqR0R7
Y0hYRFUpNnV5enBkWjNaezdKfCh6bUkpcEZwUWJmQnFsVV93VT41KXxhdVQKK3ptd3UzQ2tOITk5
NFZZWDFrbWJFO2F7RHlQYkc5dkZeY2pLNURyMEpAeV89WjgwJEFqKXApQ0tYejVodmxyfkY9aAor
enM9Y2JKUFo3amNgfUBDWD87a2V5aD0xMz1ZQ2NgRDw5RnVnfDRNIy1BSFBQTXtfWHNxanNITDQt
e0hVRXBXPDIzCit6ZT90SE4wc2ZsemV+MTM2U1dEPGdiODhSSlIqcDEjQjZ2RWw7YUgkQXBNXjZ2
PlFqdCoqVylOPjErfnpoKXUzblMKK3p5REF7SWJXVSN8IWs8ZiM2fVdsNHAkfGJBSn5nXyMmNzNO
N153PWMrO14+KHBVcCtRbSNyOHZRPnt1MEQ9Zm1GZworemQ4KXtgcnk9Pk90R0NuaC1uNU5Fa3dQ
K1V1amYmO3I7bCRUTnJFWlZrNFVgfnRXVW5LYFgjeSVDail6V0pEUXtHCit6eyo8THAoKWZQd0pG
SDVkLUN+TyREXl9uVjNMVktMSHRwX3pIO0w3O2UlNG10JUpJZmx2ck5LUFJgdSQkeDdxaS0KK3pF
Mz52Nnt7d2p0ejl9QjJScCMlPUwmYz51UFZDbklNbkMtcWBSfml+aXFaY0l7UUt6cHtNYkBHZW1p
fUVLcCY3Kworekt5NWA+QXx6czdqVGpjUmo+Mi1FZT1KZSlTND4rZk0kRGxxbz8zUVpEQHBrM0Qp
RXkxdEd5UiViZCNaMWVgfk8lCit6I29Sczx6QV9WYmE8X0EyQF5VN1ZyMSt3eUdNUWZ9azxleVJI
b1A/WCQoV2hIPTJ6emEyO01yRyNJaEY0djZBfnAKK3pENmJjaG94c2wzcjV4VXAxQ20oUkp2eGJa
RFJJPj8kXkc0YTRPUypZTV80X3ZjPUZAYCsmQXshe31TUnQtO3s1TQoreigoU1laMi0oVlZrIUhF
SWFRPXV9T1g/UClRd05hSj51VV9ITyo7V2RfI1NfaFZ+REV5ZmNYX1d3UmFKPio5aFc3Cit6XyF1
bGtJZl9eMXNkajBRcWhudUlRfWdxVWE0PFRjIzJhY35FcmhrJFMzO1FoPHlNVCp1aFZKOz4zbkha
UT4+KHAKK3o1Qn59fCtnQ3c0YnYoPjJvVzRJITFBIzNrTyhMQm8obC0/O21CQCp5TkkhfDNsIV9Q
PEB1ZWFvQn5xMSZUcF5LeAorenNtUjErMmJiPEojP19MJVk3QCUwKmR5TGsrJCpOPCtNKVhWKFk+
OEdSI3Q4OTI8U0NVdlZvVVpWdD1AVnJkNiY5Cit6RkxzX3tjLXFUcERmVmE3dz1OO1pSN1k2JDBp
bVElJHBmKitoXmJ7X0RVQnJGSy19KT9oRyhnfiNyYThITDEqbG4KK3poXzRIVCUzakZOR1djKDFs
bGdlSGsyKHJfZCVfKnErZ0gqQjhGKiMmSEVMaDZzUTIyQnlkJGwrdkFyJChKNHhsbworelNOWm1J
dyhSVVBDR3EpUilyWWt7P0s9Xj5lZEpKak0kR0UzbE90USNhbFQhKkw7dXdYSk8qZHtWZk9EWmJp
Y0xSCit6RlVITDRiYDViJDhfaSMyYTVSVEctO3tHKHJna1BOeE8zVjdCd1hDPT93WVAjQiZZbz02
P0N8cnJTKXtuXl5mP3YKK3ooaGc3UEYxUiVzUGtfQXtNaWFoViFlMHszdGF9bWp3WUpfd2l5bjNQ
amkzd0Z0JTRxSWhtY0ZkYTRYcUkoUko+KQoremlUS3s2R0VlQVc9XjU4eGJyM3E3SXxYOEVGR31s
V1lGJSRoZHRDfk9nYVd5TE9adW16MyNfXy0+I21uU1g/MnNiCit6MjgoYG9NYlBSay11NkMqeGlX
fTF5Y3ApWG8tUjMtSUk/X2NrV1dBUnJGeVlwYk0oS35BRUFCc1A8S3lWYnhDaE0KK3pleDhASm5k
TTlJXm8oTnpEQ0s4a2JqfGteaXs5RSZQMSRfQXgmZks7d0goZjBiNVhUOylBU2oySUtrTSpzKiZU
fAorenl9a1peY19yYVBQemBRQFQpSUhQOElfQ2xTcGR8O214Y35FJXJ5PzRXZT8xVyE3SFUwWXQ2
Nmk3NCM1QCNvMWxWCit6Sm95NFNfUkVzU0NXYnp2ZyVZKWlPU15lJEU1RnZHQClNMnI2Tm56Q0NN
LU9gd3V+PH03eFh0ZW9qR1JPbSE3SUkKK3p2YT1GaEx0IUBGRGk/PTA7UD8zIz9aeHg5S2YjM3Jx
ZyVjMHBveCFvMksmfFZmby1DUyooZmNRTlNgMklvTUxQegorempISHZocmt3T0VTVnp6cVNMfno4
bjVRRFh6a3Q/KnpuaWxDOHU4fUxRKnkjdHE0LW1qNXRYP1doaDNWN09KczRWCit6JiotN0RIaX1C
ZkwxdSlKbzxRUktVWXk0aVV8S0treyhPRDxZcEBfdHhraXN4M2p1NikxbXptcCg0ZCpESE1odnwK
K3o1JWlZdWYmU1FVeiR5QTJZOzFjNV53MU4xYDZoPDBpP0NSa1VQez5EPzh7SkxlQ3MlNGNnVD45
MGFpXm9EMXdQYAorei1lQjJvSk1WTDhyYC01ekMjOWwwX3YqM0U2MmdsJnNVI0AlNzMjNXZySnQ3
NCkzVjdfJFReLXdobDN8aCFZaF40Cit6ems4b0JEd2hTITlwTjdoPz89WGN0V2JwKVBvVH08Ynxs
IUoxSzlkNEhSdVl1PUJOaXolVmtNJVUmdDFvYjJAK0EKK3phVWBSZTRWZik9ZHNnJHRYZEI+TnhF
Y2lWQiFNajlrRj51cl9ZYHFeYXlUdHVldnE2cyk5d2olTGY5R0ppNXA8ZgoreiE2ZXJtTlZhbzVS
Z1JmQ3pefnRDUStCe2JRI3ZHdUpgJm04T2BveGZjd0tIRitKcUQ+O3J9QTkpOVQtbilKej9ZCit6
UHZ7bXFDN2xMeUB7P2FAXmt1T0IpZ300a082KHUkLUp0cEhPbnZybzI8YFVqPiVDUnMre1BTO1VG
YkZYKCtBPE4KK3pyVHlZUEcyUWx+TFk+cTM8Rj1vWEUkNF53P2JZd21lJWFFKXEza3JZPUY1Mn5u
Zj19KGQhSiFVcFFAZCVDSEF6cAorekliU1UhKkJRK0RpdF5Sdm8xNl8yKnlNYzkkRylNU2N9T2BU
b2dhVWVSeipaaU1CbV90YkBrME1ZI1FedThuY05fCit6R1NzK0gzQFBTLWwzP08kSWI8PVpxJUBj
YW1LK19sbyt5Y3NtOEZEa0U5cGw8YEJGfCklbGcwMy1ITWFAKGl8b3wKK3o4WUR8WFpFSXBKb0Np
WD5haU44ZGI1LVUxRkdXQEFAZlZjUGB4WjxgRC1LYnZ2S3t1UmU5P3w/TzQ8cDgqJSM3ZAorekgy
fnNBdFhPa0BjVFlfV1NOIXdIWXsyeyQxJjN3KDRecVcpO0Y2blkjNnRUcCZPcHJ2TFdaWW8yNmlN
Sz5ETjFlCit6Q1Exflh0WU1IUHc3eG09c1defk5FaGloei0zIzBUM2A9YWFjaTMqWWtEKTVPP31N
bFhXJjFKNlR5ZG1+aXVtZHYKK3ozQDs0SXdLX2N9XkQ1Xmw/KDVFY1AtMGxhYTlSeTQjYERESitF
MVZVRXhDQVAjQCNDLXomNn4jJlQzcXVqMCgyUQorelV8NSpUVH1yKGwqZWx0VDFKbj51dU8wRFND
QEFzWm9KY35ibl8tOz49MyF1Rllqcm82PmprcmtBY0luTiZyU3A3Cit6Z1A/P2FYTEBsJXd9QWwp
dz48Xkt1cXsrM1Q4eEB+VlpoaSlEV3k3JncmSzsmcXQ2Tzl3bWAoMFJFS3dyWmE0WjUKK3pDPChP
LVImRUp0YzJCZjZLRkVAenEwRiF6UjJgcUNLY0FNOygtdz45V1UwezFjIytRUVBJSUw1VmduaDdO
PGozdQorek9kNHNUKjNzcGAjRThBPHswdiNnck8wd2MqZEAtJTJTSUI1U2lXWnttVndfIXFjYVk9
VmlxPyRYSk9OKihAeG1jCit6WUEyWCZveikxQjl2PWlBeDIwQ1dCfnA3PFhBRUs3N35Xb1FRcmRZ
cVF5LV5rVkBUJE05QlBFbU1HfkcjKnJ7TzEKK3pmYDVMIylOaWc4VkpzQTMlKHQmIUJ+MlhHUyk+
SiNrJTlWTT4tYks/K292Zmc+MCEtfkR2eld9QFZQUzFfT1IxUQoreiVDITNMXzFRbnpKS3YoLVZK
QDhPJilYO3xaSSNhYktgNisjS1BKVXhvbThMaUVFQVAqNXM2Qj5XJD54Pmd0XjFqCit6MllXe2gz
eiNiYz1EKUIoSSYoaDw0WW14TExnJlRtNGVQcG1Kd0JkSkBtcWdnRU4hKGEjKiF5eWtVelNePnUo
dikKK3p1QyY4M2t8eDw8KjwjO35HUWF8YFNPMyh+R1YobTgqdmB6cFN0NjNzTX1vT2A9KCZqUk9P
UFImX3Mje2s5KUYqVAorellPRnpoKEQxajxBdz9FdnZoZVUqdz84ZUZDJHZTfTR6bHY8V1Q9U2BQ
dCMqQmxoNGBKY289JkVffURka3hxbCZlCit6PVFkTCllMjlENnhiaDM4MmR+aihzUyNjT3M0PVpV
QD5uZSRjWi1hXlBtU259YEpRa21TNl83bVJIbWVTU1N1USoKK3pWKTh3I0tULV9IWUI+IX5IUXhU
KVpueGJWeEt3NXojdmNhZihVaUxJQjMkVTRiKjAtZnpJanlWa1ZOJjdFcG5yKQorenZRZHclQVEk
TzZJRXIpfk1fRmV2Mzk4MjszeHFNfmB4KHptUSVjPTQoYnVqS2BzUDYkNk1Ia1RiTCtgPGorSjt5
Cit6LT1gUUB6RmIpSEhYemt6ZWExVlkkQzRDcW9mZmYrVlczWlo2SWBjTUxFSUJfQmpvRmAmbmY1
PTU1P1M+RCppN08KK3p6bkopPUQqbCM9N3BGTXdaZXJgej8+U0c5dUlRSUR3bXBmfFNrdDhlREtX
Mk4kWldCbm8tMTdIY0NQcC14RztfNworemRReipzZnEma3B7UDJjaSF+OCg1Mlp7WmdaPE1WeHlq
JCQ8dGNeSmtGOVM9P3ptM0EmVE9JeWo/b2RJME91QWtwCit6YWF5NU1zJHZsYElLRVd4VldAQDxj
ZHZyPmBkazxvK0pDTngyMFBvO1NaOztPZ1ZEVmdhTWo2VVlZTldZMU5CR2QKK3oqT0xaVTledm9Z
cDtHY0tSVDhebCFUek0jcFI4N0I3dEpreyV0dXNhT3YtUj5yTV5jRmxiVFFkcjB7TDgman1zdQor
elVRfkhWNmBiM0xWdFZ7PyVLNHxRNkliYCNpeiV6ZU12JGBMMEReVzFLcWJWSF47TzdsdkQ5LVN4
cFZkLSpaR09qCit6PyY/V0BiWF8ySGg8bVdVJUI4QnErO3N4ZTdVKGZFMUpObV5VVlZCUDRsT3VI
NUZlXzVedz8tcD04OG45WEtQeWYKK3pWfVkhXz9kX2pRYHtxX0RHVjdfI0lUNFhGOHJKMn1mekZG
MHF9S3ppNThlR3Z5Y00pI3BILXNWJFlye0g8X0VjUQoremJOWmQjPUB4KEZPJlJXdCRBWW9EaTVJ
WWhyQytmbWRRdztVQH5IMDs7UE9Ja3RmRV44RnByTjFPd0hoNlRGWGQ/Cit6YDEmZUx7VzYlMjA+
bktXRUN7LSU1JV5wTDY8RykjUnRTeiEyem08ZWsyOSZ3dSZrRyROaDxaYVd4UUVzdUI0MSUKK3pJ
X35NTXdmMXduQ0EhNFl7el8zUzt6Ulk+cyE3KH1xUFZQYWVlODJOVzZ2IzEzfT1+N2ckYj9tc2JT
alQ1I240UworemsjIzVZZktfd31jO0xkd3hnck9nZiptNHBiRUFGU2xgY2NoUjN3QFdkYzJIMmFR
PnZtekpsMCNCYUVhIW1lN148Cit6PS1KWEslS2o1JkZhNUZ5bzNFNjBfQ0I0YG5GT3xZN05+Qn1W
e2Y1RWdOZiUkVVE/WWk2KzNJUWVjJFAjU1QqV30KK3p0KHlSN2pGcnFNcEF+IXE5dEsoQiNYMnh9
XmppaztTNX5PO3YpVDREdGVQdGZZc0FIfSk/Z18leXJla2Q4d29zRworemYwb3B5JDhySVdFJDJG
WlhzNnJ2bGlqfFRDczJaa0NyWDtodWVQKjAzTHprcTBHaWpvVzZJVyVaNmMwQFpMcDwzCit6RUtY
YzMlMWd7Xyp9SGV8al5eJFFyK3BkV1UmdUNfOHw9YXozbkxMfnQ4TytEMTlMRj5SKy1IbnVEdlE2
ak9nbXoKK3ppMD1uSDZgcyh8TFc8QVgwYzw/WHUmVEJ5K0VLRkBvR29eenNweWlqTWxMfkNuX0tu
VTw+enx3VDV4TEZOQ2IyRgorenUxY0BSU2hGQCh3RzxuYj99V0QqcXNibmclZFR+a216aXhheThi
LSZjSXlUci15aEw3X1ZRQTYjRmpJflU4fH5vCit6b0Q3Knx0RjN8PSZfJTw/a3ZfRFJKemNLcT5+
bTx1ekUoNlQjX0hMeEAlMWk+XyZQflR7M0hHNj5UJFVOOVB4RnkKK3puU15rY2glWk00M00wUCMx
TyhmUjc5YnpZYWM1MnpnWG8pSiojYFRDKjlBfHY3eDcrMWQ+YEg8ZmJuK35vPChsdAorejhXbVpM
SDtTQXA3MT1CaUl6bz5aTzhvN1ZBUHF4JHQocmJQPGYjeSFyJnl9SW0/e2x4dlZsLXYxM0R3fFRG
RS0oCit6eiR6TEkzYmtedll1Uno8TE9gfEU+cEllZV4qaWtRQ2t5TUIpV2tQJmZxQloyYD82aHAx
cEQmKWVCcFBhQE91IWgKK3okRSlEQ3pwZSZgRlphcVN1VU17XmN2RG5qMT89V0xJVHZYbXclWERA
eClILXdQNkV2cU4pclhgd2hKfCVXOzJ+NworekVRKTlROD9zezlWdD9fOTlKKUpTNkU/UCspWEsp
b3I4XlF1Zypiaj5gPEk+ZUVwWVcqcVZePGdOTmJqOzJLR0dKCit6WDVjMGdiWG5SK1NkUkE0XzFU
Sm5SPUFKZG95Q20hVmBZVDR4fmNUSTlFZTBeJFV4cjV5byFNbk9sclRBJUE7Uk4KK3pfWVZiYT52
O0NoSkxNRXdKM0I5QEY2SXZLSWo1eGw4RF5+SGImOEx2Ri1OcHpjck9yS2RoOT9ueUFeK251b35u
bworenV0XlE/VHVJaiEpMVpfcD1xZFR9cE1Nc2U2T3BvOTEwQCV9JSN4XksjcH5vRk4rM1AqTEBW
Zz1KcnFkfmIlZTtkCit6UFIlNyVsJkcxQUApKDtAOT9wQ35YTDJOS0BRK01WcER+Kz56V0Boe1E9
cTFNeEJXKFJ2Zkt3M0l8QFQ9eWI/Mj8KK3psJGVLYnJkQ05LPjdGNXA7RWBPTVB8R0lpb35TbjBN
RF5SQlZ9KTVvQDdfdnBWOEtpVmpyRj0xRnkraERxK3tRPAorejV1SDBtUlR2PXxETEozRHYqa082
NV5eRDxuNnF5Nzh5fUteOUt+THNaeXtyKVdNWT0xNitZQiYrb2NqS3F6K2puCit6bDxJZGhwO04w
WG0tKUBEKSNlOSEtNntjPzx+K1l9dDJrQXFORWFDSSZoSFc1ZEtybGZwP1QxJiQ5XkcpcWZ1RDAK
K3omQm9+QTlIdmNseCY+OVRMS0AhaTwkaXtEQUBWb2g1dmA4QVVNUDJyZ3xIJjMyelp3YG8ldCR6
NEpyZGpLZ01YbQorekhrYncwNnRqQjEzTVpyNS18RTxjY2I9eVVUc2ohWCsrbEdDdXN2Wk1Kel97
Nj1ZPjlWM0o5Z2AwbUZKKj0yRU5aCit6NGFudkM+KnJzPHptKkNnTFY5e0d1cU9BbEQoVjJTWihh
KylRPzIhK015Z2VHOWhwISFna3g9MXhMQGUjYSVUU2kKK3pxPE8rIXgjcSslZ25XYzYmd2hUYWFH
VihJI3lEeFJ1YVhKX3RAdSpYcnxLKH5gcjFvPFUwZGAwNXd3alNlLXNBSAorekVyen44O3NXbSZ6
Z2c+WHgqKFpqV35TdSpTb1FjOWBaTUMmM31AKHdUdT9ZS1U8ez1BbGpoQis4KVQ/QUlMRn1QCit6
NVBoNVFFdjB+NlFZJjs4eWlNNFo0NjktO1ZJPmVvVih4SUMmZmRYRko8JmkxQXAmI3dhTDlNQlNi
VCYkYGZifD8KK3pBfXo+X3h3RT5nelFJMFJ5fC11O29lVWFGPm5uJjtHQHducDZIUWQtPGUqMHhT
eWRjYTxUNDJkdnpuXjx3NnRBbQoreiYlUiFXWT8zU35SOEl9ZWVwfClJS3glX3NZJjJ9aUgrS2A2
X0dPRmlAbDU7MSF+SlV0UE5wRD0qe19KPXhgck5ECit6UWt8PjROa1FDQmlHc3lqUnBWMm1FSW9V
bkt3bjMzOGwkeWEwbGVAY3s3PD1GWFNERSteRXMxOEJIU2FTPko8NkIKK3pBNEUpPEx3MnR9RD8q
KSUpcDNBb2MjfGohZ29LQms3Q0h5T2t8MXVadjVkekQjYVkwMz4/e3RgJmNaVDBLbFdrRQorekQx
bitpRzIoayowXkxTVTxDSXNTQz1WcHp2QjZaOGNuYFI8bypGaGc/NCQyaSNsbHhITjR6LUJvZz5X
OD5DaChhCit6TDg5XnhrREJ1P0RYRzN3e1VzZkUraThmNmpOO3c7WkYxOT9WWG03ZTVeIzx9aTVS
MnJEVHo+OzVxbClgcSgtZFQKK3p3R2Y5WGV6cU88WENiQ1B2KTxHeXM0NXc9Y1IhMUQ3az9oaCpQ
VXZhIzQ1SWsxb29IZWFweDRMeVU7JTZJIzhSNworejlDPCt7ckkoYyptfiFLNyN2VDtFcDZEPE5h
b1MofWVfWHpTV0JiXk1yMnh0SGokQnt0dVAobUgmNDl8YXA+fkd5Cit6OFNRdXB7UD5KP0JiVEN2
Yno2eSlWOXg1YDlAbXd2NnskJEpSXkVHVnBaaCooeVl6UCEzbFpOQGFUdSh9TDxlKDYKK3pvPUJj
OUZZVnclP2x6V35jeX1ZZGF1O1lubTk3bX0+MEN3PWl8N29NNzVeOUl0eXpvdCVUKWFqeWczTTNZ
UU08NAoremglPCt6QVF3emQ/KTBsPlhxa2lgTF9PZFVQKWBjVS1EdWpEdmYkbWVpUkJtblJNMkt3
QHlLUVE+V0pAZUFjZ2RhCit6U207c1QxNFEhbF95dDUjOWo5Km8+Iz8mKk5sRT1oTFlLTUdEIVB6
PkVBUnNAMVR8X2JNNlpqajt+V2gqZEwtJSMKK3oyKlNgQWpIMl9VNzx0Zz1iWE02Xz0ldXFzXkBQ
YHtIX3xmeEFIJGtqRVVTc2QqU0w3UTNme3k+dVQkJmRQM2RicAorekZJOFhpUy1UNUNsdjwyTiU3
YGhEaWN3djY7WGkzVFVId2EtYXcjaX1fWDdIJFBtVFdGJlBHKUE+MFA4ZElIX20oCit6dGAlUGsk
Q0tHZ3k1JmsjdDl2cFIofT1ALW9XWmBHQiQ8fSM/b2F7VHpTQVg7PW8+SF5IczsjLVNTQUtLT3B4
IyUKK3pmX3lBKCtZSilpVnc1JHhPfipSayNmWmBHcytZQnZ7XkJ4MDcoVz8yR0xwRjN6QyUxTkBt
P2clIXl5MVVqQFZgeworejBiTnpTNVlTTnRBVjhCcVYhLT4tWDhVTVhMITM4X05SXmM8IyZjcSk7
SzZCeDZNZkhPekZuY3ZDNCUxPGxDVmk0Cit6cVVaNn5HOV5ialIyXjtUWSpjO3stVVJEOTteO0JW
VU1DNzcrI1diYGVaeFMraCNRcSN6SWA2RWJZQD90ZGdWXkoKK3pJQDRJYVFxfiM2UzhuQ1JjQXVG
PmxYP2AxSHN7TX0/WEE/MTg+bm0hZV40dmxDTj5ZYUg2d05yOUoqNjZZSmhGdQoremhxX1VvKDFw
fXprKmRkTDBtJUNiUT19REUhM1BtI1liUXFYbjlwQEIkQDhLQXZfIVFBPUs/IThQQWprNG5SYjhe
Cit6cjM5PXEzaj53azJoQz03eCklKmVebkYqfHw2NGZqKDRaQl81MHJmdjxVKWBiOWNTWFpYJW5v
eEszfjVKJnZpclIKK3pWQ0FCcSolJiVKUWJ9X01jfCVEI0pBWGZUUlY3QHFPZ15GTG1LX0B8cHhu
fTVoREcjZUBBel4hZT1HIVk+WUxOcgorej52QUtMYSVAbGRRMTtNcm52PVpEVjBWczg/Q2ZGdCk7
JnQ+NFMkI0Fjdzk4RWtGWD90MkhjTk9PemI2eHpjRjVwCit6MFl8N0NOX1MoUHtwMmgzdSZGZ3Aj
VW1eMzgjUUEmUn1pdnFxVndJVCpxbXlhbEFPfno5K1dAVFUwPnJ2V3ExRWkKK3p1b01SV0xiWk4j
RkVfKT5SfGxHIURBfChpRFJSTTxnMUplTERAfitNVnUlS19tdSNsQm1FQVZlUFc9NnBtMigwUgor
ekJtS0NQI0dxQk9EZyo8K3ZFTzV3MWNARzdFPktwe24/TUI7KllNKDloZjtZWkRuPzY/KHMjI21r
I00oQndsRy12Cit6dHNhJHFLSzdnRHcmT2Niez5hdj1aeyY1LWB7e2p3JEU2JD5CQEpeelg/MzAw
d0VlUjMkQm9iSTg4YCEjdTgyQFQKK3pSbjZUZ1doPjFxQ0wjRyQlQVdNP3g7Qkc7K35wWnhKdn05
dEg/b2VCcGYzYUZgP0JOOEVXSnRXKClHJjFDZiFfUworej98UEVpUWs8UDRBM1A8czlpTHphRjZG
bmsqT0RYbU1BfkNVY1d7UDQ3M1Y3IWNVRmdUR1ppPjwxVDNZJHFRM29NCit6U2VgeVpjQT9lZ1Nm
VkoxeHR7V29NOEU1Mlg8TWcyX35eVl83e0QjLVRHI2N5cChOOUBJVFlrRGAhP3daRStNJHIKK3oq
QXVkYVBFMlpNJVM3dSExJWAkRGQjIXojT3Z4O0NAJm5mM0xReXdzZ0kyTTwzV3BIPT5qNGZ8Ky1H
UFMjTjx0cworekNCPC1WQ05DQl92M3pyeyQ/IzgpWmNfP3JzOF91Ozs2NiVYWClpI01KWk9iPGgh
fX17K3pmTDB7djhWbVA1aHY9Cit6aDQ7Xj5BMUdVb1VJaVl9aF5xb3o7KkFxbjV4VHE5YGB3Vmxm
SEY/NyRYQD5hb011aXdvQCkxa1Z9entlOyhsNUQKK3oldHhCans0OEhoT0hPYihhfEtQMV83a0o2
KV9fJl48fElUfHpBYWEweDh6ZCtRJV42WC1kMCh9aTBgJXk0byt5Oworenc8ZnZJNSVzTk5WR1pB
SnJQdT1nZCtkcUkmZkAtdXMzWXdGUyRDJmN7e2wjOFQ+OEI8XjsjT2JzOTZAQ1l+VkZYCit6VFRt
Zmw2UDZOJkduXlZ3QCoxP2JUdiR7N1JyI2pWUVIwJTlKbHhmejcoSFREPHMwNTRVVEFpKUlSanli
SXI+WjgKK3okNVApQXQxSVU9KjRvRSQ0eWQpUy1NYndfdFBhSGlQSlcwTnlVPD8kRWpeUWFIRzd4
MnRQX0wlZHdEMiohXjgwQgoremdSOFJuXlN1ejMlXiEkVz1ObjNtTzNXKWdLMilqMz5ATGFOMlVZ
Iz9seUVGdWxLYyQqV2d9OXtMYlZ8ZCEqMm0tCit6ezJjcXhITDR8LTU+czlGcDQoKnV2UGltTm9f
b2BPP0JmVz1UejdyNXBjcEVoNE0+NjtQb0lOdkFxTjRlVD5qWWUKK3p6VkVOaHZ+SFh+aXktQWhQ
UldeRHVBYEp8UHhEJiF0NGNAYT9RTV5kQnxkQnM1dFcpSGspTSQxKCh3bzk3eHlePQorem44KHEt
ZXsmeEFWJEw2NSV6NXZ3PSpCRGpKKiV6PUdwZn1vKjlETjVxRXtMQyRtYmwwJkF3MGctYDBQfFpf
ZC1zCit6aGBgeEVXa2Z6eGAlRjVfdXg4V3xeIUpSJk1eNjFLVDg+dz14Ui1tZyZXcnc8OWApe1le
dDtrNWRtYjUqR3lRdjYKK3o/dDROTDQwOGh1SFJucmVGenRDb1I1NCEkODR9R2h0c3xOZlJiZ1Nv
KWFORGNSUE5PZXlUOUEmVWo0QWFYPzNyRAoreiRPTXNOZXU5SXdwfn59IzVuWXZBdyN1K3JmdzJ6
Zz4jaFRpclNEMnpLZXMqbEF9VyNoamhiOHc4UTtLNWVfP2lfCit6WlkqKSNTZVJVQktrfHQxbl5f
PVp6c21Daz17Yzk5QWpBQ1RjRFozWD9Zb0puV2xXanBYX2FCVkpyUj45dEkwS04KK3peQmVzTz92
K2YtY09SZWQ+R05qTiZXczdEPDUqVFVYclQmVjBgNGIpTD5AUWdgYkx6STVQNm5fNHx8LWN1b1Jy
QworellMZUZyNEdBZzB5b2l6TER0RSphOUs7akhBdypIOERKbXtCYERhQUcqPWR5Um4lMXpHTlEw
QlImM01qZThkeGtACit6KSNqXkReSiQ3b21QbDJed3tvSjRWOytAelVqbGt1JEUjaXcrYSNDYmRY
Uz5Xek11Jn4+cSUpWHs/MU0laz08TXYKK3p5MXFTcXNuNkRCND5kbnVOPy1edCE9cV54ZThNNiNu
N0Z5S1Q7Uks8SkgmQ31QTV5NJHl5enxze0c/enRGYn13agorel9LcnRvJDQhbnNQPGFQM0lwP1N+
TXJFOyYlaWsqfjJqYnluaz8tP0ZMYFFHVjZVUlpmN3BiTzNZP098YWlUTTV7Cit6T0ttO3dDNmEt
RVJOeHlTRlNRdnRuemw3WGcjKTFWU2lZLS1SQlFBfHU5RVJHKUtFZGU4JjtPcXBPOTdMbGliOFYK
K3o8cmY+PWVHPUlWKmxjJF4pOXVuR2AlKWFxe2swKjBPPSk5bHIlSXVVJmlzfEBvJkIoWWFRY3J7
Uk9QRDNTOG44NQoremg9fTtVOTxPcnpEeHk9IUJtMGVObGhnazAhSXFaKCtQNlVIY2Y3PFZmbU5g
T3UtTStHTE5eXlZmdjdNJW1uZSVWCit6PV5GY0I1dUIoZHM0JVpgeGpPYnY+ITlHO21MNTtnV2sl
dyVSaW5+SVFSX1Ajc2BHWHpIYTNKNlMlMzFYZSZCUl8KK3o2e0ooNnJmTGpWTTBeaG1NNXdGMClP
YiQ9ZWJ2VCVIemFwVGoqYS1Ea2A9eTtfYURBO0U8P0R8XlM2UnNENnBZPworeip8VXsoR1ZjVGQl
P2BWR2ZnYD90O0hVZTx1OGpFWmJCVEQ4aF92enttM1drQF9YKjAhWnpGKl5Me1JrakZCb2w2Cit6
LXowSyNMKnBhOT5qa1gzRTxQNVg9JmBrQXk4RCMoJjZoUGNRbXR+ckwzZ1k2bVZIeENhQ2NnLS1a
ITxfLUw1QCoKK3pwSHd7LS1KNn5kQEh8VHdhTVZQYE0qTTQ+PWElKlgmS0Ata2NJTXV8WXRlYioz
cHI0YjhiYGN6NH0yO3pXQGgkcQorekBjZDJvXjJMNG5CT3ZUV2NLQVh9TEhEX3pTMDUwJj5xYGI2
QEJCQn5vISg+Ynlaa0ZnRDxjUEwpUV9WbXlHeyNTCit6aW5eI0FoJj5XVSFlcjs/KXRCSEpNdz1k
Y3BQc2h1U0N0Ql5sU29TTHNPPGVVeEZxUnVyMmg9KS19YVBXcFZjU14KK3p8NkBwNndmVmlnQlFJ
eHZJdWJWRFpUUng9aFRWcnA3dnwmXylCK3VeSH00aTVxe2wwUzFGZlU+UUF4VXEpPks8WAorenlP
ZHsoS0oyNEpjYnArKzxrZCQmZ0w+ZGd1SWxUdCttTHg0TkpHc1dMUCNKIT4hbCN7U1gtNVZGSUlK
PHozX2Y5Cit6RU1gZSg8NkZ3ZnZEWkgjJX4xKlg4dlQoO29telRfXjVnJj0zUDwrWCk7JWFKIzdi
X21GU30wO2dkcnRDa1hCb2sKK3o9dEtebj5hcCpMTX0xfEc+WWFkSVhpTEJvOGZxa0ZNV34wZmE8
MWF+Z3I0SCRlTHZYVzdAYlI1dU5BKSFmS1lMQAorenJSfWZVU3MmX1R2UUg/PVl1YXY0NjxGR2R5
PU8rQjJWQUgqOyRlTE1gIUZoMmZfaWc7SUM/WWw1bmRoXl5RYmI3Cit6V0Y/R3NzKWhFVkg8amFQ
d3U8U29qVnVASkd3djExOHJNMTR6YW5ARThwTz9QQC1QKjhMaV9SNSlkezNGTShjQHMKK3pvWXlF
Sns/TDhvdz9fYGR4ZTh4aHJJIXV9XmlVbEB7fWslKyZUM2d3YW8qflRXT2pqPEI5PSZ9TmFqdU5B
ZFRORQorems2XlckUFcwSHBzTD9Eekh4dHJuX01KJHlyR2lXc3A+RT16SVVVS2NoVnt2Mjh7Ukt+
PE1tdT48PTY7bG9mODNTCit6d2NwZiFlJlRnZSliYEwoNUs4QWg0SUJEdnVVcm9ZWnZQWnxQMzxZ
ZCZONzB1X2h5I251Z2cjRSp1XlJNaTM8S0UKK3pVX19WU3oqcUdQZ1UwNzY3NkNwSHU1Y0V3RG01
Yzg2SHZ8bjxoRWArJiF5eHJnfUZsdGF+QHhYI0B6Z0MybD1kMgoremZsWXN2P1YqKXB5TCYyfHJ7
dFUzYC1JR2V0a0w8M2Y0I3I8MXxqfFNaTmk5RVVJdWYyJGJAeX5AeHMjNlhOZik0Cit6VjZsc0tR
SSZwQVZ8MXNGK2xOdjZwdGU2bSpLenR6LWNmRTMyYG5EOUJRNiVKTGFWKWlgR2pSIVJDSShNeVBC
cTIKK3orVVpteGRUMXtLbkszUyRoailyJWp7djkpZlJ2IWZMNyklZFhLRlM9MGJkSShiK2NydnQ8
TFQwZ0o+MnFGVmBeSgorejZBVUQoXk5SSl5EdnVMaD1YakErZmZmfWxXc1ReJXR3en5tYVQpN2FH
K1FJUGp0IVc8QFZYYHFXKCsyYUdVS0QjCit6e0UkKi1Hd3QhVitGO2Ztam96QnJAO2FqPntCQHZt
JEdDI1g2cUxZempYWlhjN0BXZygpOSF8cVB6cFEhejc1WVoKK3ppRyMwaENefiQ5b3wpTykkay1e
YGs8c3QmNm5vRnhxVTQqbzFhLUlRM08pQW1jNnJvbDdBXzMwQlJ8LVg7KXwmcgorek9PaktnSUVE
TnBaP1llfld8U35uaUskaWVGXi1HNUd7c31qSGA0WSpDJnAtaD9LNSlwK1loMyFzVnlWeXZgXiFT
Cit6X0ApcD83OGZES3R7c0QtXipGfnZzcHU3Wip4am5AU3YyfURPelp6R1JNSTNCM0QrM1BNciEy
a0M9OzIxNktiWnMKK3p5XzkqTnlrMWVISHMrakM+UFdRKldeJWsmazJTfn42WDghKnxCQ14qQTR3
QFdhREwldjl2VSVwQ3tKQURUa3dQcgoremEwejc9QDtKOUQ5O0hrJEQpY3hMTnR2MEVGNFJaNGA8
a1R2NThRfE5KP3lEPkYmZ0A/MSNgPERYfk9zRlVCVSsjCit6UV9jZnZ7YkpxUipQZ2dkI3swOFdz
byh3X05LTmZ3IXBAX0RLaklyTnEqUG51YGU3MmwzbDx+aWV9WX56d2BMWTIKK3o/eHk+K2AkUzBY
fEsoeiZ5M0RUQnt2PFJjNHBCNTVDTiReLSllMXhDWjAyQjZmMzJPcy0wcnxEUWA/SzwhdWYoPQor
enQzRzRoTD5tMl5CLVFDYWFkK0xCPUo2ZnVBNGBBQiZRMDs3IWxvd1ljKlRxdUplQlNpV25ZZkV7
TjQjN0phKyMoCit6djYxQG1iMzFuLUROT1RvUjxIO3tnTmwjb0JLWWZTWkZnRSp1dXZIbCZZUlNv
PlNzI2FPTnExPCh1KSNWeThkPHcKK3pGeVV9JjdfKFBvOXthRHc1d0JGKnspX2xsdihqaDB5YjRa
ckNNeyo0KipVTGdUVj5kUHdBRFJ9WDB2fnV2RGZ0WQoremVVajQmbEk+LWAlOSVvcmIxcy0kYE50
SjBKQVdBNm9MYyhILWFTamQqSFFKRXJKciphc1YtamBwWldHMWJKYmlMCit6JWNUWEdeXngtPDlG
cjVYUG90OTM/WG1WfUNwMG5TK3Z4ZiZwfDtXODd3UGY0ekAtanJuPys2TShWZSN0eDBsPUAKK3pG
TDZqJGghWktIZVJCP0QoJCVyKnc7dD5neDx4STdvb35KZUs4eSFkJCUoOHpRfTEySyozfnZTTSRj
JSR6b2NBfQorelMhPlElTmsyN2k/UV5MTWFjSDc0ayV6X2gkZUI8aT5icDFuakR0Jjs5PjZffEtf
fi0mOEZEPGAyIWokRkIlWE1VCit6KzM1RUVwVjEmUmpebTVoKCg0O21XI3JeVTViQ29obTI/UTJL
Z2JrK0ZHcmVYeVo9UVJBdHkrTGtnTzlWVXJNIXsKK3o7VStjWExyTDhTI3J8P0B5QmlXelpROzlR
Z1N4WGElSDsqQkxje0QtVnQ0dSpJSUs9M0VUXypEfEJtY2NQR3JyPworekJSUGZrZ2oyfHIyMlBm
bUR3bCo8d1FzUk15aG9ffEFAdn13ZWFXNVZCYE9CZTQpIVMxQjdaZl5OPFJtdylYOGJJCit6VEgz
T0tIYTJOeFNHWD8kSTZZWHlwaTh5T3NvTkBRcWR3d1ZRdntZUjxsd3dNZm1nUEN7fkZXWEdydGhW
K3NrRFUKK3ojdSo8SEBJbGR2cUlVP29SRn5STSUkNWNCdER0OVd7eyM0bD8rUTJhMDE9fXB1WT9j
cHBaSFREQXRAczQ2KjtFbworemBieTZ3TWptS3NTNWkjOTBzSShLYiE3NV4kTGdeT2drVlFwd3px
aVB4KnJmMng4Y3N0NmNTdUh1ZUdLIU4tPW9GCit6S08zLTRRTzh3cUhyaEFDNUtQJiVzcXQ+I0Vh
dXlJVEpNKFF7QCh+X1c8U0k3KXJrPGRgdCMrV1VZNF9zXzIpfDMKK3olVnowVG44aWEtPnhaa2hQ
N3h2OTYhQ298c2t9MlByUSltRUIpeTNRal4tc1ZWfUMpZnt6NHU2cDV1aUhCZyZWfgorenFrZygr
dF5FLTl2WlpmLUxSIz4/dj1Jc3R6N3N4NWQ2Q3B+VyFyUyF4enY5U18yKnBaeXl5O1lTMERQM0Ep
YXRLCit6N0Q+PT8hPjlHd1dlSGNKK292UlkzRGRpdVlvZSNJSmZwYTlmQkVnZzd8eXhERiM5TGZl
THFxR1pJRllMbWk4eTsKK3pYRzw2RiQkX2VBRzFNZnpgaHlGamNLaXwqT1BWdkk9PTxCRzRIYylK
TyZpUWJHN0tNfjNUZnBJbUUkWHc5SXRqSworejlMY2EqZSMkaCU9MztEI2A+RFl5YFd0XmBCbVBs
cCNqI3FWKyFRZTNFSn1PciVjPi1gO3VIRVZSb0MmVXgtN1NACit6dzxPMV9fMUxHYl9XUlZ1Szhs
dG4qaWEjX3NhQ353R0A7I3Y5ZVBKb0k8WlB3aVNKPGk7cWpaP2lUN3BkQmFeZ0YKK3pzUWNHUVF9
ZE1OZGw/KWVqcz9qLUAmMWh+aG9Rcj5XbC05VzN+b0BERF9wdGIrVGExQCtjfUZqcGtQNyliOVJp
PworekJeJDMrLSlWQiVvcCs0YStHbDxUX3E9JX1RUXlOdENGY2RIR3dMJm1hMilTPUFgI3oyQkp8
aSVEcEtKX3gpOEJUCit6bjBAUnNJQmFGTmRzVWk0biRvfD4kdWJVY3F+KmtDP1dfNDdWJTZvZVdo
diQhOWxZPWpxVGY+JXFGczVUezk5UyYKK3pfdVJUfmAzdDF7M2x1PEBEO1hkTl5CKHFxbF5tPC16
Jj0jXkRYTGpHakI9Y0xLJklBVkpNNHlvVyN9ayU1VDdlbgoremEtIWxSJUJEJVo+c005JXojd3cm
NmdZbURYXyVfJnU2P1V8aTl0WUIjajJ7MksrWjJsbX4wMGAmT0s3SWNtd1J1Cit6QnIwdW1xd2gm
biQtJG9xKj5Cd3xTfVM5Wjhga3MpckhzbE1AXlNzayk5VlFLUjk8RS10R2Y/OFJsfFJnND5qVkkK
K3piS205UDkyeG1weyQ+V2sja0BhdHYzaEBNNjdTcCZ6TXwpI0U1YiMxc1NXRVNYQWNIfT5iRGYw
LX11V1ohMjJxXgorenVfRXRSc3F6emg0d34zbntfUV81UHUtUCsjYXxFVWdSYlp+Xz0rKDVIUkA0
fjIhO1FjZSNIbyoocSMpJl5xTz8yCit6VkpUK3hSRSooS1BxIWBRcHF1JX1fLU08by1pdH1vdmxV
N0g8TVJJX0tZakcrQU1vP3s+LVNMamtMJiteZSU3MSsKK3pOJXtZPUtQUTlZNTl0NVRgdllBNkw0
VypiXjhRdWJlPHR0JCYtUWx+eSh8UiU7cmBCbE9WNTlgLSp0K2pLQD4lcgorempeQiptP0UzJWt7
aE5SUC1xM0h4T1p0N0tgaj1Bam1aZmlndCQrVGpgcD8xX3src3VteyU4NjRFVHYyT0xRQVZZCit6
ezE1NSpQdXshdkh+bGV8e1lRQ2tPNzxUb3ZpfkAtYl5yMGo3bG54Ynp4KDRpYFpWMWllVytnUGtO
PV9sc3JTOGIKK3oyZ3cwRF47VXspI0JlRUwwO09JflMhQUNgMCR6ZyRhT0tFXnNhRyEpbFQpdyRq
QWV2YTRveHA4ZCppQFN7REp+MgorempMR3RfbS03bVZWYGo+TldsYDNBcnN+X242TFAyVT5hMUpj
cl9vPGtfWU1oRSpZbyRQOHxoWnBYYGt1X2xGMGJgCit6YiQkUEA8WlU9Q2BmdWchZT53aHN4NClh
PSthTDlKSGI0SGElbGpEK0BDV2l2fDA4U2t8RkozUStHMms/amxCYl8KK3pxKmRJK040fHRLTEBn
eEZzdntTUipzVF4+UXpFejR7Xmt9WFpedz5lQlpBZThOWlpGRzNJN0UhcD4xNytnTU5LVgoreklf
RTByJn5oYWpzKCMqPHdSKlNLZjl9N2p6YjMyeHprX1Z3YFktPSZ7bG9YRWV7NlJCbUQlLVleWnlV
fnxFQXlTCit6eng0UHF4NEhFNU9La1Q/OzhsOT9pb2M+eDUpd3RwZ3t7TXRUailXKFREQjh9eHQq
VT0/OEUtempVMjFMQFdzZ14KK3pQNTdzbkI9ZVlTSF9yVU9MaG55X1VWZGlDeVdgIU5gWVU9QE5r
WEVpfExAVXojazBTcWNRfFNQTkEmKGo/QDFrdgoreiQ0QyheWSU1b0VAQUlEMlZVbVFIJTZuM2k4
aWR7MT9AM2tCND1sczctOz9TXmxDcjFMZTBKWkhzLW89Z3llQm4kCit6Z3JEKUUrJTI1T2g7Uj5n
PX0zTUMoOCY1aEBgP09oV1EpOFRUPTVBaTZGPW4yJC0tZ1ojZS0kRiU2WTAhKWwhSl8KK3pBeVdg
VlVTX3c/PF9xYC0zWTtnUWMyZDlubjNPVV9yej8qVjtKc3hPU2wha1FsR1JTZFFsUWdycFJqYEVY
alBOXworekMmaVgtWkBOSHphaHMpcWhHdXs/N3dFNHAmXyE4NUp1XlYtcmx7KCFjWSVoeWxmbCNg
MU41Y342bSleRWN7YztKCit6ZXY7NnlYIUAlUWJoSGFKaGh3JkJuJT5GKVVHRDxyeElxMTdFcjxJ
e187K3N4RENoI01zWmxJQUl9N05CNEE5WG8KK3omPlI9MmpQK183USo4eikjfDY2RTE/dSFjMkI8
VXh2Xz18Z2ItVUlEeDtNKylrKCZYVTt7cFgtcG13LW4oJCMlJgoremIxTXQoYzdhTTxwam4oZ08j
e3UlMEExPz53TiRJdHQtPWtJMkQmRSQ2bVdxKWJBZEt8b0JfSG4xNjFNeXozdXxkCit6WEdiODdY
LUVkQk1jUUM+bzlQMW1kMVZIdU0rV0ZLN3c5UyVzRzc2LVgtdTlCKENhU0hBUSRNdylmdTRHSD9e
ezAKK3pyVkdeRjEkc09TWG0kcVpEaWBSTmZyPHFgZVYlYXUrP2ZGeTxOfmQ5ZnZQeDBrZiFQQzN7
WkMkPW9KXn12QEQ+KAorejhLN1VKNE9Yez0zdl4pPyY9REQrbGBoWn5GM19pMEt6blglWlFVeV8m
X0VhSDxGeSZXUzdtP18wOW8zRVFgTjJDCit6KUd1eEtuKktKTER4cFE+cWdVR21aJldELUZSTT8q
bGNMRXVhKE9ZTUs/U1oqMFM9elkoT0FHMjNMSXg3blZren0KK3pzNCErOWQ0PVNpb1hWPnJGUmEz
eFVuNn0kRHQpS2A3TCFucyR9RStIZSk3a1ZLTz5XY1k5NWErVml8dENKVzxaSQorenIhRHI2YTBn
dz0kLVl0ZkRHdj1RPWBnX3wyYmNKST5+I31pUE5Mdz91bVhNRE1kNUdOV3V4Z0dlKFAwNnhJSXtV
Cit6M2JveDg2ZHU2VEw0TUk/KkdgYUheZih1SUt+WFV5aT5YbkN5ZUxuUSVnQHhjQjVvKGhEJVZo
UEVqfjRyPjl7eGYKK3o9K3pEZyMkK0tsUlM+OT5EQX19emVWX2h1dUgyMnw9U1l8TUMrS1g1S1ZN
S34+VWF2VUgxVzRlemU3QXN0ciFTYworekVBY1BtV3JqdWxObmUlYDhKOyg/bmBqbkQ0WilwRkpI
Kn0odkchbzBxUDlpbzwwYStfZmxHVkFaaisqPnlwV2hDCit6YDQ5bj8hJDR7dGxsXyVCLWFJejIp
ZWxNUlZVczBzcCpKdWVXYipIbnp5Y3VVLSZBbyg4YEpnKnRmM0VWeT9AUX0KK3pWWFdJN19+az9X
LTNkdGkjZHB5aCtLRTlrQGhza1pvXlk5bmZlJW1+OD1PI1RjcmdncSs3KyF1ISVMVlIrMGR8TQor
elg3IyhqeHs0aFd0byhVR2Y4JE07aEwpK3hKSk5wbmFiZWxWSjBrUTFYZ1JMPjZ8RzlYSiFhO3Fq
bnpGa09aO2x1Cit6fDdmMkVUPX1MWlBYfE9JYFFTeyYxIXY2OHZfSWU3VXJOMnReMWZeXyQ8SnBY
KHtjaD9QQkdoOCh2RGdAUWZ4I0IKK3o2fCVKIzxHXyZZRWI7dTwhUTREYm98KjBNbGk/ekpGXmBL
M3ZJXnJCRF40Y3xeY1ZOPWIyaiNhdTdxLVY+dE1DUAorenRrKlF+dFFAYzFhaGx3X3NuK1ZkUi1T
WTYlUng/X01meV48SFNaNTh4JWdiZFlpTGNkYSRSVm95eTRncXpTQShmCit6QF5kKVpXeTZiQXp3
ISp3IUhvVFM9ezx4d2tNWWZhaX5zNktYZSoxUTNFcEhSPEY1cl9hJUVPfnFQdHVDITxEd2cKK3pA
Vz0ycl9pJjlTUUwkTGJuQjVDe2x0Yk5wO01ATV5NQT98ZVArZylQOzkpTClGQz90OG0wVURQLUAz
bnI+dWd9Vworeig3JkooQj97bnxHIXM8UGJ5Pz82di1iYldUY21xX3FRcz8/MiQmeCRzKzNxLS1U
SSEpQ0NeNmAzWFhfPVZHbWNtCit6Y0N5O3luTXFIbWl5X0hNJlg/aWhVRjc4b2gyMCVtdjlmbWlX
YWNSOTBaI1ROUTxoZkhgP2JBNFlQaS1LQEM3KEgKK3pAeD04Wj90ez1XOT9qZmh1Ynx6Ryl0Nkp+
MWJxMWZoMyt7US00fD1KKGItRkFaMzxXVEhLaVlVSCYhNTErZWlDNgoremVsNyFIcEhXWl5GNEJI
fDNWU0hjJkVpayRYSkZucCUjVlUqZ0E5NVp2RmZNb1lSI3J2Xkw8PDJxbFYtfTR3MzlyCit6MTRn
RGc2MUt5Wj9QMG1jcUpBcERvPVZLJHZIfiNAJHhrayZYSHF4TmMmcWdVNSE3LVhHWWFzfjEqMFok
VlNjaTMKK3pYMyNud1gyND9FMH1tYUw7bj8zQERQR0goWik8OVYlbGpLYmY5ZnZDd0NgKj5EJDZw
Q205U1VJLWFYRyt1Z2pBKworejVmNj1TJXc+d3tuaSRsPTE/MFJxX3NmRHoyKXRqeTdCU35EM0c8
dkU9T2tsY2c3VFJFK2h7Qk16Ryh0ZXVsNWF9Cit6X2UjR3MrNHRONER8flhkbUo8V3xedyl0NGMo
KCp1PTVRT2NEaFQ+d25MPWVKUSUjfEwodCVQSGZRbyRme282PWcKK3pgSmlrYUttMUNHZFJIKkBC
dG59M3krYzA9KEJkMzxYWU1DPyslekg+STJ7PShrZX40ZSVMb259ZypWcSR7PXs9MgoreldZd0RB
KXQzRGppMmxOdi19a3t5Qz99amhmUEdFYiYtNiM4YSlLd3stPygzSWRGSkFATUJkUnteUDVtXmxx
Q2FZCit6VCRrN3FOS3wrQThxKmZaPEghNzNrJGVvamM5amZALWprKkFPU3JjZkBIUWQzTzJLVG09
WnImQFBBYlhFSVVfT1AKK3pYYmBoT150ekJac3BMP1A5JUNFVjExQ29FcD5pO1UrQUNsXmVoeTVs
SDgtZEQ1Y2k2ek4hMEwhV1loVGVpcCglUworentrNnAjOzJlQCpoME0/YVgmTlZaP1orbSQpVWJ0
SVlNMDF0ITZSeWdHQnZpNzl7Uy1CKi00UUxwZHRtV21zXj0zCit6bkJRfExJJkhEWSVSVTM4JF4j
MWdjKjh8YHlEQ1hrQGYqT3wkSShoNnYrQVdnOyohJG1JdmlKS3FnNjx1SmdPfk0KK3prMTc8Wlc+
ayF3RXQrZiNRJFJudj4zWVRpOCttTVY1KUVfQ2YlNzlken0xPlJzJU9yQyVDckJoYm0xMkpUPX5N
SAorekxWQFA/dG5rdSNtX0lWXj5CZXteIV4mQzJBTE81Xk4yWDQ2S01IRyRRPlV8XjZwLThiV0Im
fTFpZnBIdjNifiZuCit6aTBLdVBXN1NTKGllZSQ2Jj5xYEg5VEpZc3ApUitKVml5UHM8NjNeM01k
WCQjRD97IXBOP0M1UHBYRG9yRGpjZEkKK3o2VDdIfT1LME18Q0FAWmNCUkU+Kzh5Ui13WEdoY1h0
M05WQHBWNWVxNXpSdjFCTXgtR0s3SExVYTtsOTdTU3B3MworelFOSnM7ZHdEMDIlTGh2JjMkYWk/
ZC1YUXVsJkVsemokamhrcn1TTj5PJndzbU1BQCp+VnhPXnRUR1ppS0okNn1ZCit6QWlxY0I9cUc2
IWdSPEN1bGVqUmM1MGJ0eGtPKzJTNm02Jk5Na1Yme0lGN3I/YCtNZHhuY0ZkMU53ZDQkPGcheFAK
K3p1PjFuWXJTZypCQiQlcEIlNUR5TnptWiM3TX5jRkx4TUVJaGgmTGZSUnd6SFljaEowNCU7NmZV
YEI3TCo+dTBvdQorekhrcXhASzsrYktrTWpkeitscnxyUVNkdztFPHElVWp3aTVTS1Q2bmhpXnZp
NkJ1fDlLa0NxLUFmM3MzND09fXZVCit6ZShpJjkxY1pUYHhLRTw7Ynxva0hvSEt1aEJ5LURyMXYx
UDlWUEwxQW9afT5XK0FoaFJCWSlmYD5qUmtAbT9DK3gKK3opbXxgPlJOQ2FXKz5ycm5BOX1UR0ZD
N0dGJkpfQn1aY0I8MUNwQV8/YGE5X0hKYVVrSj1YclhLN2hhQG0pZFA5PAorej5aeyFIXnRzMTVJ
VUAkK19NQE5vXzcxbGZOSElUeXtKM354Qkd3R1FlKWErSmxvLWZNQkZQUSpKKW9IPFhQb0YqCit6
TX4pSXB2MEtIXi1WSGZmX0tFMmA2RV9Ke05lcDAqcj5mM1puSHxTdWtYZ3wzdCoqZDhuMTY+SDM8
KGAlU0FhZ14KK3o+aiklbFNycUNUP049Tj03XnFER2IpU0w/NHt+UW9wMD16Z1ZtK0w7czg2RFAh
NiRBOXgmLTUoKWMpaWVNJEdaXworej5YTWZQVkZMel9JIXY+ZCFFNT1OYCt7YGFsPmBOKGsjaUEl
c1FmUjtQa3hiVSY2dEBaaFJOZiE+Z1M5MjRJSXZfCit6RjByNFhTI29Ocz57RnhDOEdtZUtWaGdV
S0doMEZqQiMjJn5HY3hId2lKc2FMTSZtOHl3c2QldGtacVhGPyE2eTMKK3pAQHtLZk9zR0E9NX1P
a3dHTUgjU3J4Zkg0Y1ZiZW0qTTApQVI7ZGw0THpLLVhNfDx0UlVMJmJrPjx5dWdqZEAqXgorekhO
cXV0cyVaMmF0OFAqelpCenZFJThSal9rN1JaV0AyfSE9bWVqb3J6JnlBLWJkdDF1ZC1BWVdlSWg0
dEhCZDFvCit6SUMtaiRvUThefF97TE9SOER6fGxOJXdhSkFwZDgzQ0F7UGpRMUFIbWt4OUFJe0ds
ek9qXyZXRCFHdSkzeVM8P1UKK3pURGNTQXRZQD9RVVh9OCV0SD0wVmRFeGhLdmVhKzZ1eEE/YC1V
bHk5YEJKVm5EaWRtdHtpSjlXP2xOfXtvdUR3Sgorekx9U2QlYXsxWCsrSEcmUkxlP1diV2IwRXhS
ekxmUWdtOGwmRXxBfEc7c2taTm8rQDAwaGZ1fVdjeHpNQEQ3SFo8Cit6XiF0WSY8MSYqbiZRajtZ
WSlmSF93KW4jVDxPZCUmaGBpbjB4Pm0jRlRoTGpGaHg/O3tuPSFVZ1BWfWpMcHFRZ18KK3pfb1c3
NWtlN2h2Sl4/V2oyTnYyanNDZTJGSSEtMyNMdFA9XnI/RiZOLX5fczYqKXVMTmxKMiYxK2Fta1pA
JSFaZQorel9PNkBJJGxLX3JRbkMwSWFQZWE7OENIKGNhUTFtfSV9ZFFfYXtFP3B0RUZEOCg1UzAp
ayR1UXR2ZDZjJWRybUpKCit6Km0/cCEhWCFEJHkrQVBNUVpob1A2UylgLWNabyMmTTJkLXdtUGxW
Qmp9cDBCQjFhUHVNTDFSPmhZK2JKR0xGYysKK3pRfjBDVEFUPCNKcDFMO1gmS0A1MEh7ISlGek9R
PlRUN05eYEFUTm9Nb2wyWT90KUVhZ0Q5Nzl4VTAwPSZJQmJ7PworejdXS1khYmx0ald7a1hiOHhz
cU1INTFLcWw7X2kjVz4+fC01REw7KVFQbW9OTGljKDBSMkhTVFpCPlBFSCZPUyk7Cit6Q0NSSWpj
cXM8VzghQS1ATFVuYE0mTTV9bjc7e2lOeEJzSCtVWFJ2S2JTX308RTRnKiF6WUItZ015ITtLaE8o
eDEKK3pjQ0o4MHJ9ZUU7Qj9uVzVOUiN3bnt2dngwUWtjJG4qQyM3b2lCPDJQe3ojRnxfUXk8NDlL
bDRuYTA1TTlfTEZAaQorekkkb2FhUXlNQU1MQ21kfC11a1JYYHN+I2huMFh9d2RiM1d9TClYZE55
T1Ffd1FDQkBWPDw1ZVpSck99bklWQ3xECit6OGxZeDNlKC1DJWVLQmYrI2hXX3BLQT59bUFFTHNm
KXBffVM3YUdxZkxyZCMmcT5gbk5UPiZXV2FwPm0tekhBbysKK3oqTk1JUytGKGlWQGJ1KDFJS2tO
emVmQnxlYjQlYExGQEVjTGlOPiF+VXw9NTElOVp+fmUpdTNZQUw7WW9qWE03NQorenVGNDRvd2RT
WFJrSmd0anQmTSplWmQ8LUl2VT5fb0l4eU5CWEAta2JUXkBUc3Zpc09qcFVDZD5yVmZua19EXjEw
Cit6b2Z5TEo5cXd2N2UjTzVqNW5kKjA1JmM4IWx8TztDZXEte3ZPbipgTzVsVk5OdXJON0c+YCRl
eXZpZFY/e2d3WFIKK3p5bmIwcnU8RFhoXzdQNkpUeD9Ma3htYl50QVlKTjU4VEh0Pzd+JF5YTVVQ
ZEdqRkhuNXVla2F4VVZKO2VLRVdeWQoreiMqUE97QkB4RzFrKShWVmNuXk58eCNYZ2UoIWd5NVNk
dWNwc35MOzNfVzZpSGE3S140T009e2w9PE5RbUQ/ZF9PCit6WXw4Xi1sMihpYSp5aj9kbF4tLUtx
KTMxdElGbHY3IUMqRFlZKWx4biZYUTs4YVlRV2x0SUwqdzE/aXAoUklack4KK3pIYytgO3BXZEhw
MD9ZO0dGKHJZcms5ZU09bzlGYUlrbW9Cem5QdkQoZiR7QjsmalhgJnA4OyhyOTcwKjFPdnV8YAor
enBTfTxUMzQ8U2VabVVuOUV5eVpZPSY/VDNFNzBrVDFSMzFkc1Bgdn4xdEtKenpnJWcyXmk3Y0Nm
eDNUTXkocHBxCit6UUBHNnBPVFpsM1V4dmN8c2xxZE1pVWpoKVE0PCMkMFRnPnhxeyg1JSRRcXhH
VVZWT2JnPWF2WSZeRHYmNlFuZ0AKK3plamlNblUqU29YQTx2MWklfmdAVFpTQChXIU42TzU7ciop
aGAzP1J1PFo+YT9hZmJ0P0gzdWVjWjA2fmFjNUh+WAorejlzajsrRE5BT3pmRjY0WGV6KGVkNE1M
KmlrJDFoaDFmQlhGZk5Ic1BkNTVCTC0pcjxVe2NuLSNOajlnKU9DWFZWCit6VV9oU2c2Jkc3fVlv
fFhoMzNGJX5aTDVOYkl9PkxwbWh0WSEzZ2VAJWdZaTlqZEBIMChZalV+ZmY+IVR6UiVnPkUKK3o/
KyRjTTJ9TH1LQGZ3dTFNeGJvN3Z4JiRVJmc8N1phKUxjZ2tGZGI3and5LWs+WjhaIXNFaTFOQ312
OUA+N2l9VAorekJXQExwIX0xb0ZNdHw4KEotJnJ4PUxnQWFlUDd6SSVtK3N2QjZqKE5HZkd+flNF
QWhtNT5vUyF8MUR7JF5FejxCCit6e2BkbSpTVH0rTD5IZX5gPzhyNG9BQF9UfXReOVlyanBBQ3A8
WUtqT2oyRWQheH4rQ1BnNDg4WW8leSVfYFI2UFMKK3plMkVJaXteOS1tcFpWPk89eSUyWUM7fjNB
K3NoUXImfCF3akA3VmwqPzdhKGtSTW9sZ0tOQXVOMjx+VzZxZTJ9dQorek5UT1U0MFZNKkdmcjsj
cTJ9Q1o2Un00dUFrJndqOU9jRUBXPXBAUU0oYGpqfHR2Jjc2X092fiU/UC10Z0lYI0d8Cit6bX5h
Vzs3NFRBIUR0TzxVczhBXm9ySTdGVXVEJG9uZ2xoamktI08zb2Y2bnQ5K2FZX2V5KU4mMSpMeiM8
VEkqZT0KK3pad1h1JTd1VnRkeSV3JThnfnliWWZlJHBmfDI7WW9zcGA5UnYrMVdUPUMyPVNRPyNS
c3FRKWxNbVNSOGhNUXI+JAoreiV2enUkSllHQlVeQWhkNTFRK1Yhd3c9aUBNaDdkIXFXb3J3WTBw
WU5ybjxDNkp8Xl9lTWB2OTZoTzhnTCRLVnRICit6QCs8cDRFfS10IVY9c1liNGtYcSlfe0ImPzQr
TXxEZzxVOS1rYGtGRVhhdXJ3Vzg/UGJWbld0TGl2OD1jNyhEN20KK3pNSjFHYSZYOVAlMU9mdEpa
cDdgJWtobVZiTTg2MW15WSp0d3d6S0h+IWJVPmxZfERfPUI7SE9oQDtPYzNsMGQxaAorej9FYGVl
ZmZ6ZUMlbChvTWIqQUQ7aDwmUlFVQHNvZD42PjUzdkRLWEIhN0E/V2ZCflNle3RsYl4pOTRCQlM8
cmFSCit6LUlpZS1fMmNKem9LWCVNMTlpPntpTUx3WkJ6aUgxe0FULSNNOHZTYWs2OW0la1BkdD49
cmstdDV0N2ZTN2d7fFUKK3pfNE8xdmUwKGRXb0Fkb2c/KVEobW49bn5QZ3glfDZTe0JNI0MhKjw+
V0IxTF5DVUJEYzdpNDs9PnFhQChGOWg9UgorelRlJlhPYl5ieEpxUE9BYHEhe3lsKWtiOWU1dl9x
K2ckTm4pSW1JZE14X2lLQ284KWtne1ArQmBeSW1rVVVtTigzCit6JlNUYm4/aGRSeTVpfHRxaUJ1
ZlhhJU47fTxGYmE2K0J9RTFWUTJFQmpvYVNyPWpIbUwrUEdtfWA4MHZJQS13YyUKK3pfanNCdkpF
QVFiX0JLeD4mZGIhcz9QP3kqKTVycylYeWFhUThsO1d1WThpeVQlRnY0Sk9YJUFMeW1iRjJsK08p
VQorenAoI3RWd2ImYTFpKlloMjxNbz0qSE99RVk8KlhLT1FCVz5MVjc/VXsqPmo4QSYkdXBocnlI
fXU/am45S04yWX0wCit6UXkyd352WUZsUnhFYEFmSHNAellVa01xTF47bF54Y1olK0lCTz02MDgz
WnRGK3xKKlpxZyRtcDRsZjZCPn0zbT4KK3pROXNwQ25ZcWZYaUNIbmJZJCUzWmNaKXIhM3c1YnFZ
Ryp2OXh9YkE3Qk4kdGVPQXkjQ0ljM0d3KztkWTFgM1gtZAorempKcEhvVShBcXxweEFCTGRZdCk8
ZWZFNXVORD9eYk1eZGIpR3AhNWBAfF5WalhUMGEwX1VgTmQmT1llWClCIV89Cit6aXk0cER3VnVk
amEmeEl8OT5LYXlPaVJHakpjJCUwSTNqTHZAcGdtKyt+MXU7djhMeWFhTHJIPj87M1pxVz1yKHgK
K3pQO3BvSURtXy1yV0l+Vm9EVUlQS0Rwd298TiVeYkNPWmNLdnNXO1lATCNkYGAxKVBATGh9XmVX
ZTNNVFktcWtPKgorelZhKXlRNT1jZkk2QFdrMiQ4NytGNHs5SV4hZkx7Zm9lRSFAc145NiliPWte
dGs7YXw9cV88b0FHV35meSombjxQCit6LXsweVM1eTVeJmtXV0k4bGxwJjExdmMpUTd2PlB0ZElU
UlpvPzJeYFlLSj02LTExM0t5THtePitSYSZLVT4+KkwKK3pMK1h4Q2JuV3NOS0dFKnI5TT9Hc0Qm
VlNtTn4jKnZoP3sjQit2Q3MxNitZTzVObllJcjBpRT85V0tzTiZ3VDtTQgorempxTmdIWityRUBK
RWN7Yz09Py1tI1A4OztaJkdnTTFOZVFWYWIkSnVKI3Z8bldqazRSKmNhMHpAIypZT0dtZV9TCit6
ISZfdkZLblE/XnI5dCslUGUyck15O00/c01lIUZTPEtWVjtsRU5iO2tDOUtlLWozWEhaI3ZhdXQ5
X294NyFmUCsKK3p4czEpVDtaWldQZz8yQT1eIVgtZT0tRHRjM3JVUn1JPGdzKW57ajd3JkJxb3d5
LXZ3KithSDZTRGN9MSgxIUJCNworeklEMDU5Nms1Q3xhO3t5azVOO3xwZFBvVE9hdzdJLSt4TW1F
YVVzTyQ4QTVXai0kSy02O1V6cFl1QURfOXNkdkZiCit6c3tLJTAzbC0xSlpvWEx6IX13c09fZD47
K255PGF5N31fMF81T2F3VllUZ20/SXJTODhpZCskKkc1azdRb3o+bHwKK3psU2N4KXkmcDY+Z05v
a2dYMUR4RCRaLTUzc3s4NXRNXm8hUE4qLVB2RHNJVmNvfnkzS187Yik7c1d1cURSdlpYRQorej9p
fWpMTTFEYDxjKTdwdDZeYE03YXQyQlEpLWhQei1gSWAzWH59TVJROTlPdDtrZjlkOSV4R1IzdnBU
R1lLQk9qCit6JWc/QkxtUTdIcFM9PU9wRCl3JEMzKEE8U2RoQ3piMzFkPCFnJiRwPD5IT0M9eT9h
JjtCNzJhJnspT2o1KUJrKygKK3pfdFV4SUllVzlycFYkbUJzdSNPVHQpUmFtY1lMcjBjay1FWGln
QXlWVihYNkdXJGZNNDB0ZClEbjdtKyZIYEFQUworenlGOX56c09Fbm1LUG9eXndCfmJPaCFAVnY8
KG0+XlI4fWx2QjtYPHktQG4tWEJDQig3aHVnNmdqamN8fHo0eEBYCit6O2JMYXZzIysrYyFuITV5
I058MVdTP1ctcGwpQzxBcl54fCRmNGJod0JwIX5xa2tGKHZlZEAxVkk4fDh+R0x8RmYKK3ptbX1g
T0M0QUU1UV9tVWJ4QlclPyU7d3Z1THQoeERsX1NYMk1BazM2MWlZRX5XKlolQz8/Zyl1K2VsSm0z
JFYwYQorekZSWHE5LXJhZngzNCMqLTEpc3ZkPGwhZWdHP2dGR1pwKFReRHNiQGJYKFJJKFEhbT04
K3s8Z0o8QWA2Jm5WWT9HCit6b2g9Yk1sTStFe3JMeyQhSndIcDBwREp5PWg+NUpeemFfV1NySnY3
bl9HNTxQcWVEfF92Y3Q9UnRnQ1kmaT4ta3IKK3pKVEwzTSs/NmdFalNQa3VgKnh4Zk9HRlJxQGlO
XzJ1ZFpVWXdkPjIwZDckalQ/JVNERWsqPWx7SDVvIXB3bWh0RgorekR8SFpHc3RfLU5hPGdtNSNh
NHEkWm1DMX1NQ1JCK1hCTFlvO2pnJUslIVd+NmxUbVdoPEZIaEowYTB1X0FoYyFMCit6cCYlPHYh
WmIoKXZ0PnQrc2Y8KUooVXE1TUpjV0p4QX1tX0EkcT8pRCNvNlh9WnhJc04kNTxuMEM+a3VUJWdi
KGcKK3pDQ0k3Pl9DUjBjIXUwbVlVejMoIXheM1BfMHQ+dyMmP0Q9NW8+VGVWe2phZVA/K25GamBp
SUZ7Z2VMX0xPXnpwZQoremdWP1FXVER7X0V3OF5FTFFOTSRwS3F5aG5SNHExdmtHI34kJWwqeH4y
PDY8dFRZdChxdFFVMUZ4ekJSVWZnPyROCit6KzNiZD4pWWBzQlNxNG4wRT92e04oe1YwfTBUcj5n
STc5Y207SDNDPT9yeXQ7ZD0zLXNIP3dZWm0/JCQoWWt5U28KK3pOVSZiTD56enpsNGBPITxrIXdv
fXh0TFI/MnkqfFl4fFN7KDgoRXdQaDIpcWxETCNyKlVOJXQpWTRPMTVpTUB1dworelkoOH5WY25J
O0o7c01ERHNqZHtpeT5uVk9OX0YjbER2UT9zSUBRUXdLPlYkVCV5dVVjLU5+M1RCJTlHYUpwPE5h
Cit6WDVlKlFsPVFrdklOZmhhcDRnVDw2Iz0/KlU+dFVwXjgyWFUhJTYweyFvb3F4YEs8OFE7azB8
ND84U2laQlliVzkKK3pTMml9QXZ1SW43WEVJVTV7akJLR3okP3V8NGs8YkVmSFM4UVlscSVSbW5g
ITRuUDwmK25PM2MwSHIqaGNEPyUyWAoremkzX3BjPFd2a2tuZCU1YDFuV0NjQ35FSikzM2lOX2ZC
M3sxdHhie2ZNVioqOGs8Nmc2NUt4SHpuOGJ3RWFTX2ZMCit6QFppTUN2XjQ/cTY0fW52K008aylg
MjJpOSNDQjQxTlkmT24yPGx1Q01mVGgqXk5RYC1nV247VUBRLTspbnNEeDEKK3pOR3ZgUi1hKExH
cWg4YmBOdGY5WHN3Pn19QWxXN303bXhZODdFP1g/aSNaQEk8S0VTRzluPVJDUUZkbUlmSXR9Nwor
emBUNWpgeXhYQX0+e1AqVT0oMCE1bEZXbTxCditTK0x5Tmd+KHgwSXh6TElaI0FvITNqeE9MPnIl
aHVMKHJUMng7Cit6WTglclVfVEVZbGNjXn1BYExFTi1KPShiRXY8RjV8WXVpMEpAWkhUYmhESX5f
dms4OU9eQ2FTWTFySU90cHY4VmUKK3pYLWJZY0VGSzlEe3NxK2RUblk5cTgpK25NPll2b211K3Nz
dUdRVTJUSn1WNnojUDRSYXEjIzRDVilJJWR2ZUAmNQorelF3IX08OVohPDk5emdvNkBqUXV+e3o1
RVZQQTxXeFU8b3JhNE5FJSZpSXpgJjdiJWhwPXpsRm10WVJ7bHRJRE84Cit6NiNYK183dXlYJmUq
MUtTR3xRUHcjZGBaOVM3NFpCPlR6fnpeJj5hfXtqcytrYi07MnxsQXFYM3clMHQ1TWpTcWIKK3or
TGh1YGV0fEQmcn12UDsyQ0k8fiV1ZClXd3A+cykqKDE/aShuKHpIb3BAQn1QZylncXZzUjVXJEJI
MihiYXQrYAorej1FUH1LOzFXcmFLNVI7MHhTMU1uWn5tYm9zUDchXk1eTV9EUThYZ2RDeyl2I3FA
X2RZdzFpITdIbnI/ekR5PT1SCit6ME5sRjcjRm1NNVdRMnlrQHIyTmpreG9OVCsyJkJrcjQqMUBH
Tk8pI0d3dnZwWTshKm5MeWslcUFFMzchbzVsSlIKK3ohYnN1d2ledCFrNTgqZUFpaTMpYUhjMUNJ
REp+TTw7P2xLM0FIQ1FucEY8eSphKCNTOTIzUkZMK0kwTkk/TWJqVQorem1tWDtealVIe1Q/ZEgy
VlkpKDR4XmZQX0Z6PTtnPVlqKj83Z2k8RGBqQV4haHtEe219Y0Jhbz9XYioxYm48JFQqCit6V0c+
N3NHJl8+WEY9TkptNHdreyhvYWlVWVBFYGthJkN4ZH42M09RSy08QUo3KmNRPm9xNiNufEhgREJB
TVlxNWkKK3puOCRiLWApez9UQFFAbWd3Ul5MRSNxT01hKmNiYihhTUslbV9wWnUycmFkMFdKSiRD
Nig0fWE9S2t4MF9UYks5ZQorentqMmche3UxUmprWXxjIUpPSUomdWdnMklhXlJrPERyJiVDSzQk
Tlp7bmtBTEJiVTlncnppVzNKcjRldnI9O2deCit6b3pwVz0/MTRBLStVdj41X1d0PFItV35ifE5L
TzgwT1NiLTNaNVFwZFJ4IUcrZSVxN3ZLRSNeQng2QjhPb3VafXUKK3ojdmN+V1g5ZHQ3YChTfElj
dCFrcl9EIztSPm0tKmg2ZTJLJnN6OUIoQGlsY2hhP3VYZkBNT2BIbk4/bm5FSSpvQQorem89bD5o
MW85QERtJl9KZEVqOShfYEVtMFYtaCVQNm9VLUB8NnYkUz5hKGl1dUsmKTRHYXNMRTJsQzFlXkd1
ZUV+Cit6Z31vdGQ9Myg+NGx3c05ZRVdVcl4+eHs1JDhXSTdLJVU0cWdqO3NlbzFzMTt+N3tpZT4z
b2FHfE1uIVdNODwqYG4KK3p3PDskdWdfdkcyMEokOyVANmVpfiZQQTIwa3g/ST48LT9uVmlOOCUh
X3FvfUJQcGJkZW1ZZz5VbChtSD5fUituZgoremVTMTU1MX08Ri0xdzZhQTZRfXJ8WFpKcTB1Y3R8
aW95ZCtKZUI8PnVVaG0wUDxIaSNwN3NAb1NzUG9NfjV1QCYqCit6UEpnVj0lZjd1VkhQWGNTdEk0
OSR2QT82NHtnKEZORStGMzl4c1ROJEM4IWdfPUl9d2VFMVpqbHhZfitFMEIpNSQKK3p6N0lwYEEw
VEdJYU1TZmYoWVFtT0xYVEtBZjxrQFRnRm1OWUFqY2JEQn5tbj1uS3o/dFJiZH1YMUduK01IfHJZ
ZAorejhObUZKTktwNWEqT0poRiZpcXxFM3JqMEoyfWt+azg5Wn1sRV5DIWtWfj5pPCZPe0piXnRT
fSpafGRHbyFvbG1fCit6LUZgTmQ2enxqP1NWTHR2PH53JG1YYioxLWFRIWdNa29fZFkqY1c+WDFH
UzVPMjF1RzFFSXdSQCNyUjtPPGxvbkcKK3pzbzxAblBZUlcyPi14Wkw4TVFxcSFBQyleOW5UT0NO
Nn5LTTZ6JU9nNipNKn01ZDRXdXp5Sjc9I1BBeWRBWXtEZQorentlIT53PCg3NSs7dTlzPng5cUM2
VyVUXms8fT5NYTxqajN6ciFzTEJxXy08dTNjWipad3dJK0c4e04xeWJDTmcqCit6KlJzYFJ6ajsw
fmo9IW9TPTNuJV96Qj85IUBTYnhOLXIoaC1ZVE8tdW1WaCZ1aj4wMEpsb2NFZzdOfFN5OXwkNCUK
K3pqbCpUJFVQZ3lvQUsxJCk8SjE7dWlKYyhFaSFBPUoxZnx5WGpqcTlhQlh7fl5AME1zQy0ofUZt
KzhAaG0wLV43dAorelhVY1dJZyh+aTAwSmExNitrc3VMI0FjPmRCOzJ+OD1qKH1eeWxYVj4jMnx4
VW85djlDRVFhWmM4USQpVThII3NnCit6bG1YTGI+IWdXXjN5b2IqN35CakQrWlBgSk80fmM7emVC
bDQxMCktN0dXZ25LNykqIU45U1lkejNHQWpLbVU/enIKK3o1PyMjM3g0MDk7X2x3MGBSJll3K3dw
R1okKyZCd1Z2SlA3UUw7LWIhQklWVlUzNUNJZXNyZ3Q/aipxPHNKTm5xVworeiNaXnYxTDQ7I2xn
QDltUHRpKjQ7KmkrKWpPfT87Ql9GPUY5e35YKUo0em04fEdydnYrQ3xEdWVfOTFrbE91aXl2Cit6
Kms3e0V5cWt9RlZiUDgpeFJHSH5TOE1DY3BmPllFKmBedlFleXtvMCt+bFM8QklFMlFPZmpSVTBQ
S1MqZTVAXi0KK3pNVT1PJHFsWXJ5aHtpbmJjM0FAJWI+QW1hJCl+cERUVj9LZFlAdllCMlZZT2tn
Uzg5SWY1JExiYmM/WDViciQkPworejwrSEZuYEdtMipOZTtRSCY4b3NLT01Ydz5sK2l1UVRXZWlR
I2xoSFR0Yn40KClgWG43QHN5YGhmJkBMWnNlPnFBCit6S2s1dXp5aCZGNj87fDxEamxMfUY1N0Y5
QnNPKCpaQWBMPWBIbn5ZN3V4NT8/O1NQcmFHajxZcHpqVURGKmo2YT4KK3plbj03VGZDaVMlZUtm
PHJoOD0kZk5vc2hkLSomPz9wUVlqRyNSMmIyOWV3ditBaWlkTmFBenxwNlpQVzVZQCNIQworejt0
dnEyS2s+cnpfSjMkeiRWTjYtPk1VJF45VUxJQzFUbXIpYmpQfDI1Z2goQ1NGPm1xZWNnSWhwLUFX
cmlxRnd3Cit6cEFzMVZyX3stT1dUS2tGSW4mfEMqaXpQfEpANT9La3NCaDVkI3IhczF0TXZPIVlE
NWBYPTIhayQ5U353JTJQdzQKK3oxZ2Nfc3hpfDIqOGxmVHRzdERIZU9OQ0NsN3VfTllvNEhEYEtK
YmdyYHVnQH1OaUJjZWZ4QHNXe1Z9aHFxVng7bAorejIpcGBgQmRISFNGakM9bWNFPFd8cC1UVSkp
KnNuZEI2IUBKXns9WTNlUGUmYy1+OSloZjROdGJQPkxGMklMfG1gCit6dktLUCVOdSYlQ1ZZfHZj
dkhpVGdfQU5BaUZRSSpqKjhHaFlEOCV9akx3eyleKDdHR29VM0A1K1Qoci1jPStkYnkKK3o8elFQ
VT01cjFEYTstekk7KnlQKysxNmczbWFiSjJfLVpuUFVSJCVNRSNQZDdebUVOI2t1fUVZa0UrKnQ2
VXdEPgorenhkPmRPUDZ3fTJDXzIqckw/TUc9d1VTX0whajEwek8hZ0BNWHA8RXBNVUBydEBnclY+
QHF1THFIO1Z7JCN1cDZpCit6NEhecVB5fT84fGp5fXd7d34zYSRHZyMyJkhEZD5RVzQrdW96bDFW
OHYjeEQ/N1RjQ1JIJExMNTslIyRgNW9iNGoKK3pZK1dieUM3UElQb0VqMllOVGo8NGdiPFNxMGxp
UV56QkIwVWchfk9OSlR2d2x3RXNJbTFubC1ObFBnOTQ/VjVVaAoremU4SXB8VD5RMWJiSUxsVWFB
KHQoLVMwT2JJUkZuUFNPa2xgMTxkYFI3c3Z+PzJNZkFXUHxMaGZweCRrfjdUZCZhCit6NUwyJXoj
O3JjSnNPZ2FQVj9PIWc9bFlFdEttR3JVSDJEezY2JUNqX28qezZoMGtWfFR6c2g8aTxyej8heGZB
YzMKK3pwfD4+dDVoMkRGKWwjO14jKml+Zns7LXxHTjV2X3VPdSl9fFQlZS1GWWZEKExEV2hlcmQk
YWZIT3lSQT5Jajw1Tworem0lVzE1V2VfMSNDN35+YSZqfHBuKUErbmpLMGhLcE12OG1SNztgQCFH
LUhLZz5VNzcoQkVEanByeUx0NHZSUzh3Cit6IWVWRjszeiRgSzt6ISptIXhKUns+NGUwTUpLSGBS
K3wycHtRbj5pSj0tSmpRKVVWYG5AcEkwLTRuVjFgbzA3T20KK3phPClLQSF9RngrcDBqUUpxMjlO
WlFpYFZLKUBhJDMhWHAzTWMpODcqPXskPzZkcD1oc0JPM0tBYDhRfX09Qjx9YgorelQyc21FYGtA
bGp5Ym4taHE3OyFpRHhSPWM3eSt0RU5MM0AhKCZkdDUocE83KnJreCVNRGhEakpnQmJATD5rYWFg
Cit6e014cCVaJHsrb2xDfkd4VmxWaXR0N3pEVXxHcFI2S3c4XyVRPyopJGNte2U3c0VQbkR0KWhw
aCRoP2NtVVBedV8KK3o/Xkp4YDh5QiFVN314UjBETn58M0okSSRQN2YqQFk9SzV4ajckLXhDUUpG
RW8tRC1vWUhnaVY0I0hBKDdWYT55bQorem19b182ZWI4JXVYKlBJRHdCe0szJUVQeld7SV9mUSU2
KTNta308TVF7aDY4Rl9MVXFXRTk7NHcmaXRNfHFzUCt5Cit6Nn5KZjVaeTAldjFMOERvLVN7NVg1
Wm1wc3ZpLSk5KEl1MFk9UzJVKz4+aihBe2MoUHd4aFFtXjlSOHtLNHJnSmwKK3peWDxNKWdyfj5r
Xl8qJGp5R31oOV57P2s2a1J8b3BUR1QxLTJae0luZnRnTF4lMDtAPkpTbS1XeVg/RSg/eX1TMgor
enU0I1AzY1EremxuajslcXZzJEhMVzh+ZkgmJitJVkcyPXc/JjM1dVVDejtob15uXj1LJmlJVSNr
QUw2elJOV2B6Cit6QlhEKGVfOCpffWJZUjI1KTVobSkwWExxdElhZE1zbD19MFo4Sn5aVTVgZyUz
am5CaTckYF80S3V+WDZDR2ReV2IKK3pKXmpZI1E0KmM7eG1gTnRqIXpxbExQQzx4XypATHpfOFh0
PT1jJXJEc1h3WGxgSzZ1dzZEUFU8X342Z2M2TFdAbAorelVwSmZgSlQqKTB8TVpRbmgydmlAZGFp
WTlRb2liSno9PkpkSk1aX2ljZWNnMGlNPjtAcmRUKXI1RzV3VWM2U3xBCit6ViYoUGZpTSN1UCQy
a1N1dDlTS0kqU2tLOztOflZWbVlET0Q2IWNQKFZyJT87UTVGbFdqUEMzRCMhM3hKe3lEJjwKK3pL
KGdoPGUqJXVBdVRSLX5felJyKXJmZGRUSTZ1SWhacFFRMkRKO0dialdtRlBLZj9UQU4/K2Z4JV5C
enlkdCU8YworejZ4a0dGQUhURXpMUkp5ZkhqV0BSREM8MDA+YFhGe1VHNVVnJSlARk5BJHM+aDV7
b2BVPyNod3VTN290JSpHSWJkCit6O0lZa19hfXMmaU02JHxeemk9bl9KRSpsJkFVV3YkKDROeXZR
QTk5VFB1LVRxO0xQWD83UVlkYDM+LXgrbWk8cyQKK3pJb3dzKz1MOzQwJGQpYWJNMDxGWHhGYnMx
VWxWIXB4P0JKWnUqWDZMWXwxP3BEKmh+fSZIOTc2TVI9IX0kP24zdworejxeckxiSk9fe0J1aiR5
MDBwVmw5JUNAU18rSVBHMypnPmokRzVSKFdEN0JiejQybzI5R1Y/PXVpZngoOXdHTEBoCit6c2cl
NDtxREd4VyhuWi02OzZUQ3tVQHZHQUg2OERycThqN1hxVFNaVkpjKnl8QlZ+ckhIRStFfThzTjZ3
MmpZQlQKK3o5fCl7KSU+M3RLbUQoMl9lKylJKShKMDBMWUIwOEs+RWwwalBnYVV2NlUlVF9XUXQh
TCpgPnpRWE81Um5oO296RgorenF9N2EpYmRvdWp2QH1JcGt8N3dWKGl2WVljSGchQF9GdHJtSUFw
QClMfkgrKTd0WnFmUHx8SmtMOHZGK3khVG9XCit6M3UzRn1ONiotbmFrOV9PZ3UlOGNHa3kmZGo2
SFRzQURoM1FpfnwtSTNBMF5PWXVfan1Gdip0Z24lQChpY2lkPGAKK3ohTWFiP3N7bkBYRzxEdUEx
akwrUCZoeThvM3BpcGZ1bjRhfkFLTmxYMUdoTThGRShGKmw1dlVhbHs9JER7bzRpIQoreksoXmI7
ZG9XbzFUNm1ZM2BePWo7VytseSZMOzR+JXsmMFloQlMwNk42aj1vMkl9fnFVUUtab0l2M2NsZkFP
KEt4Cit6fDBFfXpwbnlGYWNlYE5HKXVqR2MhPjVqPElpdkxoQHteZH1oU3U+ajNfPEhjMjNmaVpY
fFZodGJ9cj1kMUhTYXIKK3p1Wm99NVVJNEQ2NU8ze0tuMypgYTxIWUY0Ni1VZnEwN1B5c3E3OVk+
LSF5floxWXxPUWlUSzM8Rjt2X05JUTdfNworemdER2JxeXFOMHVuWSVJaUE7ZG01cEE+SXFgcmlE
TW1+QDxgT3thVU1QeGx+KmQpfkpCM0VVQn4rMXg1Z0ZWVXt9Cit6QyZlWldDQnxHVyg4KT1venVO
RShzNikqcWY9b3NEZy1VTH47OUJnVTNgZTRoUSpoayVJLStPOStOcTx5SXcpclAKK3pyVmVQaU96
YypxZnklZHVkfjZlK0l7bkBecn18ZiZGP0kzMVpeZ2B0c1V3P1RjTmZIYU1remJ0Mns1XzN6KyNn
NQorendYPGtPXzh4bz9AfTRrJTRebUtRfEF1PShuV3R+KzErTlBve0Q1NSpmKDItU2JMZz8mUTwx
TWlrdDR3MGRXdzVPCit6VEE8ZmwyRnJBR3VLZH10SztGPWQ9cF59V1prZVImYD18UkQtb0RqWmBf
SVM+dXN2JVhldiFQKV8tKWIlY3N4JiYKK3o0WjRZX1AwU09PbSkwPCZVbENFJDU4dFg+YmVIdG89
Jj9LJHZobUkmd1lWcHwoSHVpUkFtXmNhSlI4eWJIayl3NworelowMTd4JDF8Q15sfC19SSNgRW4q
R29va01mSk1HV09+fXtpQUEwVXJfel5mKFRWZWgreTshSDU0fEJLYVhQWjBlCit6Njk4cTQyWnFC
dCgxfDZSZ2oyI1ZaTS0/OEV5TWtzKGshdTQ4VFFjfUcpJjliQ3w2MD16O3hyNDl6V0UjdEUyUFkK
K3o+QHVTbzElaHc2ZX1gRXd6ez4kZlNAN3lvZyF2Z3U3aEslPWwzd3MpUD54bEtYSU80dm1xV2Qp
MFhyQndnQERgJgorenkyfVZ4UmM1ZmlqWTk9ZU1KXjFJPFlQVWFaYCtOc1Q3RnprVUclKlM5SVQq
PF5OMnZpTSV7Yjg1JiFJWC1BUiFMCit6bDdTVU8kK1A7OGRKS04/Jk5VK011XlVOUE1fdD8yaiNi
R0IoIzI0RzstO1JUSk5pWDMldWNMJjU2P21zcHhXKmEKK3oxfnBpKTxAVzBuIWB9bD9tfiYjNjh6
STVeTjY/LV5EUnQ1UkQoVX1UPDtEdGplVm9CXj1HP0BwcW49TyFNPz18OAorejl4eyMhJElBNXBo
O1gkSGp6fHVOJW14d143NyZRODBDVlYxVH1VOV4lMnhkenJNNVktP0lPMWZPIWhgKm1CbSttCit6
PGFDXndgWUZ8TWJfYDAjJVY7dnlhYklMO1N2PDFVKUFKazA0IyZadmI0VVYjZl9rdj1CbDE7KlBY
UHlIJDt2Z3oKK3oxSSZMSFZnZmx9dEklMmBXTXIzNVdPQnBJRjBfcEdKNk1QUEhAaCpSKzFAbGlH
TTNZNGRnN0tvYjI0MXgmTDVacQorejN9cilJUEpILTN0WGFUbTNIeUBKejleRFQ5am4ySmcxYmBx
e0ppP3xpfmlzMTZaeXRBRzcpaHNiMzdVKWReU18+Cit6UGxDcUZ0aUo1WTZ0I0E5VklZMXReIWAq
e1A4UlBfRUVye3RCKXxjcSorUklvRmYtTHpuMFlGMUpCN3NTUFFiKnsKK3omRF50dT9TdztCYH0q
MCk4LU1LTXE0YW5GKElzJHNGNFBtaCZ0dlR2YGd0bnZZNW9Rbm5OWFFiezg/VTVFSFFPZAorejxn
MFMoekpUQmlwTHZeJENBUCNNfEMmS1U9Myt7ZjhFO2JHYj4xPzl1KFdxWmNhfEElT1Axa2ZTWC1K
THFWRX1PCit6a0JlTU9OZT1gIyt7LXEhcUZGaiM8dURlJFckOXxWcG1ON1l1OHAzfVVPI3U9MzRQ
OERCOWwxZ2FZYWVuJHdJPzIKK3o0bishQT1razFNXmIpQGtzXzc/R054dmd7QzYtMzZ3YFV2amg0
LT0xZF52PkV2dElOcl9nayRXRHFZdENobi10UgoreitqeTBIaXo5bXlyOH1SNUQ9YDUkNmVBYH0r
b3o9dyZRe0VnVCFpIUUofGNNOWFkd1JRZiN7QWRaVWxXbV9hMnJUCit6Sz83aH4reFFoUXdBcEtY
K1ZoJk1aYURNUlV9QzFkdmtUOSZvKyM7S09LKTROY1UxSCtTWE51ZV5oeWhDY2tCYlIKK3pUNXot
ZTJ6RFVYPmF5YlhMYTZ2ej9TYkQ1T00+QWwqJWVpK1J9d2xTbHZsMTc5T1Q1YXVUY0UhekY9YStk
MFA5RAorenYmMGF3THFaNGZtUStIZGEoakhhYyZMMXNQUHZkMHgoZk5uO1UjaXY5bnh8MCkrX0NO
eHJDUH1eUys9WUc8WWxHCit6Uk5LYm8tdXE3QXhnOG96Z3VSOVphI29LYl4tR1pwNT52bT0qYHZn
NV92ezJ5Jjk1NFZ0ZTFnUEBaMHY7KXVfX20KK3ohN2ItWGAzJUE0WVM1Q1FpdWRlVkQ8fFFQczhy
P1hUNUVuRTE0WkQ+d1oxfiR3VmFGVWtPTW5IMmYzeH5jPFcwJAoremckOSZWLXJ5VUJtXlIqQVlD
TlJxNyY8QlgkZm1iNysxKHt4MilqTTZsVXw5flJBeVN2TXA+VzRrUUxAeEIlRCFoCit6P3hufWRW
IWFaOXAocGdkaih1dCpLKT53IVU8NWRNQ25LOyFyVVd0dzxIXlYlWHpseGV0VjhiR3FxMW1fak55
UFkKK3pCekZwKkY0N0MwUnBUUDlGKW17bW13KHBNJEt7YXUrPDRZRnF5bkd4YGM4cCM1JmhJVUhn
TjcjNFU+ISFmLXNVLQoreiZWPm5iNz9tNThAdmsjdk5fJn5MQ3F4cDtJUCNBIz16VTNzTzxhTTN8
SmNkN1RLansqM3ZNPEZ4O2oydVlTPihfCit6Yj0peXJwLTx0YGRYflAjUExedXp2dyU+TnZOdjRS
KFF8YGUjV3MmTzRtUz1US1dPWVVLSD1LMXVITEt5bylZPygKK3ptVW1WYVklK0ZvNWQ7Z0hLaVlL
aCZpaFYxKUdKPWVBOU5MUGEyaXcyKEg4PG8kNzY2PnNvWGp2NTV9a0sxcz5wOQorellQOCM4Tlde
KWBucU1uZiNJT2I9d28mSCp0NTlLQz4qJUNVMis4bFU0eThzO2Bsc2p1IUlDU1lhYSpAQVlsIXV0
Cit6TVR+NmpPQDU9WkZDdUcycCokVXRDXiEtWWQjQ3ZUOSNHall4WVpxS2h0SW5HSH5WaXZoQjRT
aiVMKSNiNkBRe1YKK3pGYXp7NSpkYVdvaSpPNEwxNytUJEt4WWwkZ0Y7eG96KHV7O0B1dU57YDFL
PEtAdXU3ai1fOHF1JVEjJFdaMTN2NQorenNJPWZQaHZWKT0wRlBTQktZXyU4Zmo8WnNveVFOKE5N
dlJOajc8dXE4M2o4TiE/IX1MOT5IazljczVZNWk3VFQ5Cit6YTVXb0xzOyF4eWdIJD1UWH42bXdS
MXYtMnpnfFdzen1vJEJsWWVRMlk+V0luZVU/P1FYPztESm1oWjBlN3c/VzwKK3o8blFWb0x+fmQw
eXx6O1RARTMxbDZgRXN3U3lHcTNwaTRtdXRPQlQ3MSMhVG9SQjF1aTdzRllhMiVJJjUxO3Yldwor
ekc2eUpVeFo2SVIjZztLWlpUcXhfaCR9b2lBI2ZVcHttX3FQNkhfYEJLfG1iZEVBPHswZHwzUD05
b2cwT1g7d2trCit6QCpSQkk5eCVGQVVhKCQ+M1BpPWFzc2FVdmtINX09eVU/PnImZE4hQW51UCNh
XnRIWU5wfVRAcV4rU25MVGFHZlgKK3opSmhMYGU4aDE9dD5kQENNPjR1cXBXNTx0SHRWVlBQS1M5
I192TE9aNnJzVF4talMtfUVKdnpGdk5ybm8wT3lIQgorekohXzBlRG4yUTNnJkk3PXplVz9xMj4l
SXZ5clVSbC1Bbj8/JT1iPmNNcihmcCM8Q0FeUFE2RiNfPUp7NCU/cWMrCit6YnN6aypyWDFxWjw5
ZmRUMzVKREJCVV58MiotXngzVn4oVDQrYXswb2I4KH13ZVokcyZ8SChIdThmKF85ZmhDMiYKK3pn
aEIhd2M9VUlqST5UU2taRVFkT2FVaFkmWWowTTdWSntjdGVyekxtTXEqK3sqUXU8NlplRXVrbl85
Wk9iODVsaQorejBFZGd3PypgYD5wOU00OHtTfDtwM1NuY2AwfjFkSnY8XlJNSy11d2dRa2RYKHtG
dDB2UXstMHg7Y1QrOCZRVzNxCit6e2loZzFxbD5tQTVwSVkjajx9KlJIYFlCIUJ1UWZFbTBoUFV2
Z3g3Zyh+Tj5ZU3kjSTlYREBnUTJ8R09AclRwPDMKK3p4cnhTcyhuRiEzTUNPJV8yPHAhLXtga0JS
MSYwJW45STQmdmBFa2QtcnYtRCQ5PypoNGRnVnRyWkZJSjw8OUc/LQorelFOaWkteiVySzlNMyt2
SnVgZzdEVGRsYnshKjEpKk10WWc5TT14YUdtNWgyVyozRHBMMWAhNjAoTFE/Mj1fYGBYCit6OV5g
bGxuO2RjeDV7Y24ka1NHZ1VNYUwzRCVieyhGOU8zJH02T00rJDFwNU8zYGBORGx7UFRgQDFDSiVn
SUpKeyMKK3pBWU8hP24wMmFxUnYhXjUyI3Y3Uyp1THdPfE0mc2NPentHR0l9NXI5SUBNSjtjO31r
QWVQYUN7aWd4PnBVa18tWgorem16QkoyI3hLRn5EWHNtTklGeThAJE5IYlJnNFFedSUtS1UzcVZt
IzJsZHo2aGRJfGtKeX08R3B5ZU9Be2UqSy1uCit6YzlGJHMxfEVaekVWMXM/VnBxXiNNXlAkSE9K
XzJAXyUkc3lnYllDPldrKzlHV2o3ZUk9ZGgqQjl+YTlzejQ+TWIKK3o7ZjtZY3B9YntqJW9mUElR
JjZ1SVhuPzZiWUEqb0VyNFBiKUB8RHUwb0Q0O3ltXjYxUCVeODRoJTFoVTF3NUs/YworeihKY3h8
dzZIIyNyQlM3S059WT91UVl0cytQPiZRWW0lP3tTO1lEVE1aRGxnNmU7ZFVGR0slKGJBZ2F0KHxI
MHkyCit6P0JoUF89PkdsbVBrTTgkb1U7OzNPYVI2YnZvKmRfK0JPQjwwTV5vaC0jYzA7TU9rOSM+
b2dVUVVaKUNYS2U5KGUKK3pZcXRoc2ooelFqbyFNNkkpfGNUOFJBNTBKcWI1RER7dnJ3VjBQQld7
ZkVlXmBqSF48Q2RnOWxMcXxeejtmX0MrUgorelhRK353d2Q5Zik5fHluK0NFPj47PXFUZGZeNElM
MU1JRUI+bUA+PTZJYmpwJkdmRkg8eUJKeVJXVGVSWXF8O21jCit6KTcjVmkoO1F0JTN9LSFtd19Y
NUEoeiEwOXdfczslNlExczRudlNkYkJSUSRGV316cWdNOGBneFg5Qyg+UDl3MEYKK3pldjZvQ0dC
VypXUWp1OyVFOUMmR09gWUYzanZ0eEFOez0oPjBtIWhkdmVUTzczWGB3PjhHbEJJREtHfD5FcDF9
RworemgzclFfR1Ixbnc2Mk9jSG5PaUtURlY8c3tEa2pqNGx1fXI9aV5UT0Q3RD5nWmZwZTk8dkJu
QGZ7dkh7ViRAblEjCit6QGx+LUZ7KVV7bjFWJjchbDdIdDBEXzcxODVuOHNzTyR+JV41Wm16QVNV
VlV1UGMjYkRxZVN1fnZMNTx8T0F7c3UKK3pzdkYtPiF+PTBTLU4/M0hmTHpxNGkySTNpbmt1fUo3
fXw+XkZfR21AKjdRVEVUQnU3STIoRFBtUDNYMmYtaXtwNAorejlLdk8/VmlLbXk8QVBsdiVEUily
UD5ad3MlOSEtSFlUNER1WkomPFBBSklEQWBoKnNvU1A8K0hMUGMrWFQ5allWCit6KmtQUmtJMHsm
YWM0dmR9KkIwcXYpRV8yfnV9ZWZDQ1BUcT9xZjBhMVZ8YjQ1IUNiaVMpVkZ+YG8zcXs4T19IaUAK
K3pyOEZzPmF0Qyopd2EpIV55WmJHITU0R2Y4QnZvUlRuYC1PMnhJV0BeYXV8dEpQKzNRJHZMYjNk
ZzU4X2wkfn1BJgorelREMDQ+e0JGN19kJjwpUiVDdHRnLT02MjIrN3RGQkxvUzt5elZRZVkmcWdn
VmMkc2BGX0c1bCNZLWRXKV8zMUBlCit6Z1JCbEFnaVp9TWMxMTB9QHcmQl9LfiNGcz5aQygqNTFk
Uy02dnYzMUN8NlM8dCtjbWY0UFFpemwkZSlZYSstYjIKK3o9KCM0Yyp2MVRFTlVXI0oqaGxUeSN6
XlVSZz0+bnArUzglJUg2anc3ZDhzVzNaJD1CYkIlVzs5QyNGPDQ/WVdhNgorekFXfTQ1aHhraVBR
JDtafDF1OVhKYWZWMzdyakgjNFZXTWkpKHpMPz01N2Y/WEhNbH1YYVhyYEM+eUF5bUNfa0FHCit6
d1dLbVpTITVjMS0+MkBoPC1WPnV6O3ZjQV95Xj42KVNEb288OW5AZ3BgXjVWc0liZihSQTc4Nkdn
N09UcChANDIKK3plbVZGfiUxMX1wai17Qz08UjdpJD4odF4oRVpiQGxwQG10MyskIXRuRVc9Mn1L
bmJ5SD5WYSleUTRFeVpNYkYkMgorejZzPFdzUlFhNVgheXBUWmcyelR0cGRzVH4oUF4lQkwkakVU
N1lsfVgoJEA5VWwjWlR6JHVVPXpFQERuJk9JbjFlCit6JFV9alp2emNORFNmNUcxVTNxYG48Wn0h
b3JgbktPeFVkYyEqblQqZnVPanE7KXQ8ajklPzZFe2NZUD8tUEcoaWkKK3ozYUp2cnFqR19ARTFF
Pkk+KkRCN01jKURBRShWbUkzISU+eTZ9N1NQTDFgX3E5KH4rdkNfRXhyZDx1JSFBUVM+YAorekly
Qmw4dTtpPEA+P3ZVd3VvbjlsTnFMYGowaH1zcmhgdE5yMikmRyZaVGdmRldXcmpvWmlJP2JuZjlB
cil4MHkyCit6RlNvd087MFphTE9IWSliN0FLVSk2NTdLUTN8NzlWaSNoUXcmQl9vSDIxc3pfJXI5
PXNUUDlZS0ooeXc/X3teVlAKK3pXVFZYbzlERVR0bSNLa2QhZikmZWRTNzdwbT5jPHYteFFDWU0r
QHpOTnROLUowVjlaYkRHeWIkNHg+Z192Pmo3eAorek13aGs0RjYoQHhqWjJiQlFhRVo5YSNTSUlp
ZyZXdXFzMW1XdXI+KWZFPit9c3IoP3ZtM2I+NilCVGhoR01yZjR0Cit6UVkyfWN3QyVyU15QdDtM
XlFBOTRXKmluQW4/UipjdCU2e3pJLXo3UyRGU3c+RFYyflgoOTxkRkUqTEJ3QG9UNmkKK3pOclVD
cXVsVEkyVGtCekZCYjJkaj9qYnx2V31Eal85JUsxVmkhSjRZVkU7RGhRTXV+VF49I1R3d2ZuJTQ7
eDV9aAoreldqK3BfLTY8V3lEdn1YN2kpSUJ7ZHFpd1lSQTZSbyRpdUtXdXEpaTMmUj9nRXo7fV5S
aiE9SVJiQ0dHSHtBK3l+Cit6K0VLRClze21AZVMhVjF9K1ItfTl5TkRLeV4yWlNCdTJLRy1nSmVf
SXcma1RwZXtGWnBYdHklRV9zZnF9Y0BKO0kKK3pAOGpgeVN2OFFUcElQbig8cCNqRjVXTjt4Zl56
JGF1UDAjYWNBWSZObHN8I0ZkaHc+ezE+JHNBRk1mcFlgSCVPOworektKJVd4YH1wcXJIYzFZQGNV
TTFHZzFCUyt3JiNRQz1LckBWIUZ1YC14PUtYeGpLdFRqNTwlPSY3aE9XdyNvYzBtCit6Kn5ac25B
My0tcHIoPXxlbylzNngmPHk2ZzdjclMrSFk/YEdUaCElV3skaURYMU0wJEtjaTtQYGpVd0BfNzFV
cmgKK3pqdWc1PHZzaDI0aTdNKHZ4a01SJDYzczV8TndoITlaTjxVRj48cnJnUXZOckl7cFYrflhw
X3dCSkkyNyZKcy1GPAorem5He0hlRXxlTiVAcSQoc1MkQVE7aUpPMj92XzY3SjEtUFBQSGVofWc5
R1dxQzg3NlpwNjRtJUdzdHk0JTRsJCZFCit6YERYSHFYZ0skYT9Qe2M4NlE5I2BzYFUlNz5TbUlQ
PWdEX35RKiQzZ25zOGk3UUNOP3NpOXF1KilmNm5NY3Y5dDYKK3plNXdrLXl6czN4NGB5Pm4qeT0h
X25CRUkpMFhUe3RDSDB7IUYwKSpiPWAyXkVzRWF4Z2pEdE0+OH5wZj5JengkMgorei1nKU54VDxt
enUmQn58N1lRYj1vSVYjY0dheU9nNUl6TjRWaX5UcUFCWEA1YyYhRG42WUBYeUo9NDUyOW8reEwq
Cit6Wkk9WTBqRDAhfiZyWUs4R3hwbTNwOWojeGtkXjFpJiFib0h7Ozwzd2t8X0tkZmt1KkhkP2Jq
XjhMVzl7dlJeQ3MKK3p3dlcjdkh4VXQpS2I1QFElNHlrUU9fSDNMXzliZkFhNVhpa1MrS2Jabmxm
OT82RGA8QXFKOTJKOWwyeHViMUhJcQorelR+NiVue2NXRXVqNn5aJG4tJWU0WnMkPTBkbjNodWtE
VkJkMTxaRG9XYUk7RlVBYjJrbT1TJVl0dT49NGBlSXdfCit6ZlhVSkFaTE9KdyhNQGZ3U3Jlajl3
WTNmYGpJTHtJOXBzN3JtVm4yMVFzPDVpUmNFKlNOdzFMaG8lJDk7K2otN1YKK3piemk0LU1CcjN2
OTs8Y1NySmdiO1lhTXMwcnp+dWk4fEJIYXh5Rykhcyg7UE5AczsoZ1FlJklGamc8SSNZSmJwQwor
ei1GUEFQUDZqSmxWcyotbSEtd1RCQC0hIWFKazFVdVBnX01uX35jdSFgV0M8Xno+N3plbSlKRkZN
QU0lNEN8UVVLCit6KGcyPj5mSWRWckVZY28pajNwMkRiezdMJGZTQk53bmNwTkBMZi0rJT5yNX5J
dGlzbzw3STRjY0V0Xmo/TmdZTyEKK3p0bFkwdDYwO3xsKjJwQ0BMSjloJlRHbVRCZ0tVX2tfPkdK
PWZgK3AlRF9HcCkqQjsmeSM1UnUoNkE3UXdIWmBBQgorenBORkBVdyFmPmpGQzNfeENmUCpBVkNe
fVM3KW9mcyZQITtgUHJUM2VVcjUhSWspdWFpZGpTJGo+ZTFQKzxjVz9gCit6JlhJZyFWXjtWVTxn
dW1gVnJseEphfipEOzQ5fTRZQWZvY31MJmZfZlNIQVkoemh6MEszdjRAQzQ7ZTNzNmYwNW4KK3pO
RUw8VkYwaj9uRFd3WGpnWClFRU9TRiFhNnZXV2hTT2NUeGU2OGNGOGclTnxkJnNOditmTGw4SiRO
QnAwJj10NAoremdAI3tGQXtQcT4qdUNebHArWSQtYjZDO3hrYjs4QiZmcVlEZ282bHlQUzlWfT5G
QDsmNHI4NU4xS31KfD1vbG8hCit6akxHT0BAKmYjKXl4d14qT0l4PSlLS3doe1BoWiNXem4tc0xX
UkRBeWh1QzRaMTh3eU5FKyNOYCM4Kn4pdk4+eUoKK3pjam1SRGdNe3I0N0hANEhJSX14JnQjPnE1
TGs5QXN0b1Rxa2JMTl42KlVHJS1PZmU8WSM3NzF4cGtfUjBUMUVIQAoremxKcll8Nz9eQnpMR3lZ
TDZZSV49Kzhma0UjKkA8LUh+T1JjVlhARE9vaXlhUHlWOyZXcm9mdTJ5ajUmTT5VPEtsCit6PiM7
eiVEK2lRNWU9PFU8Z0I3NiRQM3dAWjJgKVUqWVU1Pjl1Xkl9a0wtdXU5Z1FOeypQcGh+WVBjRVVu
I0dXZzAKK3pZSDVGZ1FCbFJVX09ycFRVQUJEP2p9bFdsN3VIPXpqd2YlVW9MdnUxeFdsM3s4I31k
KmElUG1NUXhOT2g4NXk2QgoreihWTXtOc300cjxmKmRfYnpHZXU1SVZUOCRvZExLX2tTaWwmdHBS
a0dlcihgNnckc2dgLU55b1h0ISFIUDYxYEZ4Cit6QTZNU3VIaF49bnZXZVo1WigtMFIkNzYjQz5u
QUp0TjUhQzk+aklCQVNMXnJ9YXRiQUR6TVZ1RT1MSFVSUz1UeE4KK3ozdnluO3ArV2xIXjl1ODFf
NVAlZmBXVlFiTz1+eWNTQGI7RkI9dUpVX1N5fXk4MnNjP2Q5UE9RWFVLY0F5ZjBNbQorenhNQDYz
KjMwX0BkMXc2WGAzQEI/Zn1ub314YHB4Nz5VXlBNTz4rLSl6PHdJbyNeeH1eZVRCayhsaHlTZT81
KCtCCit6PV9wVCRORHRPIUxgO2EyPVViUzdGOEoyLTNSTlhZN3shayo1NWtNQl94STtUcCRwKH5Q
PH5qQHhPUmdLeSY4WSgKK3pWR2B7QWs7KDRqe2dUSX5GWEAtMHRGQTNkcnJXNU9jd0h8MklRMEl8
Q1kjdGc5cyl5OVBzc1N4Q1pNck5paHcyTworekxPP0kxMnh1K0BeYTI2NTcjaDlfYE4tIWllfFA0
WXgyZGolNS1UQVA1OHJoe2whdUQ8Z3Q7O3A7bVJvSWRsOEJHCit6UEI2IURpZXdLd0RIQWs/Kjgw
cn1BLVJCcXV1fGd7I2lsVCNAfHdCaFpZU0RxNUokZWIyJlVeJms2aThDdU82M0YKK3pfLT1pWmtC
VkxkUGx7djs4NUo4WkhpYFQmYEw2Z35AKElnWip+eFVwIWQ3JGdVRnY7PSl5T257KGNzIUAjJEhK
fAorenRtZE0zP2VRQiVBMDJ2TGNVdkEjJkBHVFZUezhBQ2c8KU9qOys/K2pUMU4hflkzen1xSysp
VnFINE1gI2tKZiY+Cit6e2Rndm9BTFVVM2o+YEZHWSZ0fnNDU2puRjsoX0U/VUFka1pJcHskdz1J
KClgVTJnSSNMUVNlalFKeUhyK3d5ZUEKK3pXUj47MGF1QnI5USUzQEl7ND9YRFZ3KE8xZSZFb0Mt
QT4ySGlhVGdSZ2h4QFE1fDs+UmY/cWZTNkhNNm42ajZ+JAorekpiKi01TXlQbWk4MFV8dSpqNCU3
PjAwfGdBUU4xQ3NiTkZqaWZGY2VmdHtZeEZNYExCenlTaT80M0NxK3UzdH5zCit6RV5ub0h4N3A3
RXpuQnZGKFhtUXhpfCN+JDVfITs4cGdFbFVRTV9CQ187fDlUZ1lta3o9ZGxOYj0oPWxlJWV6LWYK
K3plVStWU0E7VWdSREsjb2h6QiooKW1EZmYtKj5oREFHVWB+azBFSGFIcWlnST5XY0x5M25eKUFq
dl9FLUhWb1lKRQoremZIUlJGbit4KitQNC0tRmxqdTZWdFBiUH5rRmNMbVl5VV5sUFBVa0hsIX19
YVdsZGFRR09zfHxOXlNZPElPSDhBCit6QTI9V3o3NipgeXA/clM7JnpgWWdiP2Q5S1BuZ3c2N3NM
PSllYVY4blZJaXQlcW09QShFZkx+UyMocDhlQkgzVmsKK3pmYCRvN1MjKnMycComNlpTXypCSmlp
WGdpemk/YTJ2T2t0aSEwMykwXk9wRHlfdCFLbjIjVFhBTEQ3UHNhOSUlOAoreig+U1ZybjZhblI5
Mm5+P29WZjstanshaWJ0PDU9LUl2e3Bua248clVfUmIqVEM4ND80PTBZNl82Y2hpakB0UX5+Cit6
JDJiX0ZaWUwyTjw5ZjZjaSlufCYhb2NXPW9TQnFvTmUhb314Uil4I3ZndzdVbFVZOUIzUEg0Vl9J
eWpwbTdxR1AKK3p4ZnM9PGFDTG9SPT1BRm8zJEZJZ05ue3JGWHY4O1FNayRBPCtvekk2VFE/K1Qt
UC1vKSNWd3xxVUZhe3J1WDckPworenFiJUtfOy1RRT9NUDV0fGpuNFFLeCpWJnRLcUxvOEZHJS1q
MGdNXzVrXlBZYj9VU3YjQUw5dkkjOz12I2lGYWBfCit6Xy1sRU9razlkb0w1Qlg9VFBNd047P2Ek
NSFNbkNpa04tZkstT1JeRXNRSCpXOExUQXJlT3JYRyhzcGtsWnhLel8KK3pOLSs2Rm43UGR2RSR4
OTFwKDF3OGlxKTFlVEZEPUUpUjZQZk4kS3VrdlRUMzFXWntNKiY+Zj9KT3NzZFdOU1RoYworekxX
em0yOCZIVE1xZyg/Jlclazx3aSUtaEo3bmFtKms+O1l5SStxSDhUazFZNEJUQlhIcWQrb0pARGZV
Jj18em4yCit6Y1U3dFo4bXcpI0NsV0g3ODBKbGlNQEwjcEU3bkY5Rn5+WEgmWTZOSjlacXs5a31B
JihNMWQmNChLQzs9bDFkYTEKK3ozSVpWTVJ+aVh0PDNhJkllZyZnMDU3dS1faWZ8WWJBPyh8dkN0
SHdHZWFoOGZVTlF2MFdLKm9udj1VaUE9OThTQQorelpHVktgbFFyd1VSTXo4emxVZVUxPiVsZkJZ
bUJWNEVsMU0zNUlPOXEhS1MlV1phJmZrTXd8PzlzRkxValgobCgtCit6Zz4/OWJkOUNsXlkpRjBs
cVc7LWFIMGhRVXhCSXZGWjxiVU9KZzspK0NKN083P05AU1FwdWFuQ1c9MGB8aFNrQkEKK3okYWZY
SlN4ZGxKWVFMdypMayhnXnZKYk4hTVF3e3s5N2JqPDE5ZEZnYCpIckpjUEIrRCo2U0R5ViYqWjJX
MX10MAorenFrRUV+Uj58MkFUKF5lcWdvO19YNnB7UGE7eD5GKVRke3tEY141Zilqbzl2OTUxUnF4
YTZuPX43RSFpZVp0ME9nCit6N2NOKjhzTD1rY15zZ0d3UXhaYn5yOzF0eVFWI3ZJT2swO0JWJEYk
OUJ4cGxLVz9uMVN7UzNsNlUmQSlmZ1Z0RnsKK3pDdTY2ejVYWTBZWmJXdzVpRUZoN0A1VHpTIV8z
X09RJXxGPXtkQThPeVBZKTBQSjk7JU5lO3F2KmRJQ1AmZWtxKgoreld3KUJWV3l0Ryo8a3RieVgq
PChWXm1yMWlQOD94RWI4RHkoYT1pNmsjZXsjMHdRUn5FeU82NzVFbFpaSlkmb1Q3Cit6NVozZTN8
M3VienZEZHpzNV5aYD9ZfVQpYHl8QH0jP1BqUDZAVXQmNmhNOCRUank/dlFQPnheYmcwZklTdVN9
Z1gKK3p7Y0REdkQ8WW08JDJtbEI+PEpvdzA0TGY1S2NzYjsjZEByVmMoUyMqTHdUNUtpdWtWSjE2
bW1Be2dVfX0rP1JAUgorelpMZ2I/eTRGZCgpMmROfllFIVBVUXgqUlohNzBNdUZTQSslPyVwKXtG
Ti0zczI1QFc7WlpJK25hU3VEdi0jU1RnCit6TERWVj5NP30mO1Z0dDJYR2syZ1ppIz04WUZwQWB0
V1E5ZSFaWGhNQnRlK0BIPHcwQUBBS31GZVd4e1B+QHV8ZHIKK3o2c21NJFFAJG9nMEEydjxlQSQo
aVpIXn4xQG5xcj5Zay01Q2pXN0JuKUNAdE9ZOFpfYEB3QSZyU2lRdTVVbXcpRAorelQ2XiREUWNE
dnhGaU9AIXo2Mn0odGFyVmlETXomMCYqNzhFcngkWU0/YEdZfHh8QUd4PCtTMWEhNllnPVJgOGtM
Cit6XitCZHlOeU4/bFkmZyN9RlFKektXN0xyc2U0Y258Vz43diNMe1JVRVB+eGo+ZT1FZ0M7JFQ4
MGQkYSEoK3dLSn0KK3o/bUh9R1EoOWolLSt4bnhARip9PnpNS3tqbzZtZCZyPk5qb0lGTlhTbl9G
dHxQenQxOSokPD99VFhiV0IrKHlTWAoremJoY3VmPnFMdylfLXg4JWNlfHdnVUlURVklVig7X1he
Vnp2K2tjYXMkeCpqVE5QfCllWFZEaDMockZONUd1SlAxCit6P1A2UVZvXyt7VCooYVF6bDVKe0J3
VDcmVj44WHZJS3xFPF5kOHxLelNNd2g7X0BASWBvNjRgd3J7WntoaH0xeWIKK3okSWN9QkBIbDtk
ND5uRX5RTFAwOz5YYCM1NSNXJTltPGVnfCFebXhAKztaejxaK3leUz9ZQnFDcm9KMGpmNm4peQor
entUOylJOG5FMm54flM4e2QoPXJfa3E1S21SfnZfNEhqNmU5QSVPI2dGVFkqJWlFJj1QX3srcE1Q
MVBUdG0xKHFPCit6cDd6fihRK2xKfCEjbE5Za2oje2shMGQxKl9CdUMlOGFFWiU7ZDB4JnhGZXhv
YHQlPV52MztOJVYrazNYZ1Rec2YKK3pvZExeYmBOPjhKSkNlO2lEQilzX1h4RUhxQVUtPkBGVSpl
cjBleFl7PVFISjw9Sz1rMyRvdnRASkF5O1R1SyVmPworemwpaUc+cE9rRSRfXndQd0lJP01uY0Fk
PFE4KT1eX05aPDB2O3VwYkRWNWt4PFphUU9tVysqfE5QekEqUj1KVXwtCit6YTl8PG8zOSRJKnV+
Y0RMYS00N2hJfFBPVWlsU0lEPXxhZDNXIyphfTs4NzlUbHBfXlVUPjFlZVBOcCF1cUZVLWgKK3pW
ZnA2P1gtK251dmsrXjZ5ZklQLSY8SlRwMWBBaUBtbC0yQ0pnNiRfKklsR2BzPXhVNyhaUjUkR3B+
emgmM2hLcQorekY5XmopLU18QTh0JE14cFVKKX1oSTFQJHh3Q2d9LUZqMUc4Jm08NT5yalJFdyQr
YE8xVHRGM2lhWmktXnFnWUdLCit6ZlJGNUIpUWs1PSZOR1lVKTMmVExzbX1JQmtKTloxaS0ka0s7
eSpeUDQ/Wnh6QilOPXtmODQ/SHpfelIlezFGV3kKK3ojTkhwPyNJVyFFazx4YlQ1bGlPdXIrOzZg
Y2s5bmNRdHt7RD1CYnRaTF80Pk81VmN+RGBzVG8mNyMzOUQhUmFaIQoreko7az9sZENETVFkK28k
flptKig8KHxzfk5POUVnbEd2djBUeDE0JXFyeCNZME9jcz4zNmhEfUhraE1iZkZ2NU12Cit6YjA1
YVkxQkU4YVUoLSsxR0lgfkFvX2o/U0h3JGRoSD04dj8kU14tYUQkRCN2IU5WRkZBUHNkXmZoYT5M
RitpJHQKK3pLPjlEa0Aqa3FAZ3o4ZXVNLUQ5ZVA2RXFQZmtud0wtU3xZfE89MmBDZTlQYGhKTHZ8
OU8yS1JGTj9Vd2pHQX1YYQorenZJYW1PTEVgfEBNcjdzSSpKWEB8dTdwM2VBVCFTdkt4SyhnVGVm
X0NvVWQ4fGxxQGVCb0VNKXpld01OR1clS3c+Cit6V1lmekJ4Qnw2a0NydllxZSM0Nnh7elN8dlZH
Kzc4RnxgNSlJdilqe0Y4IThoOCgod3d5PDZufnl4fCYjIWNDWT8KK3pnNmRfOFUofFEmR0NueHt8
RjYoVHJjbGheTyY9R2w0dCpZZCVwJGcreHRvRXA+NFV2cnRncm9LdVRRQz15WkMhTAorentzcVUj
VnApZVQ8UVRJXldJXnAqdkxeOTcmdzIzP0hYMiNZaVREV1c1YmBnQz0rJk9rN3RPQ1RoZ1lyXmE2
SHc8Cit6dXxwPW1LTEpTNzBxSGRTMT97X0t0cHk2VEJARnM1QyY/Wj1TZ19iZXVGYW84d25RcUR2
ZXxRX0R3Wno0O1AwKlEKK3pkblMtTHtDK2Q8JDt2KXQ+ZjRXPlM+S1pIantKQ20mIUB8ZV5IdXBZ
ZEdWO3EpR2tiI0pXb3FkNE4oazdTPStrcgoreiFedyFNRyEoYno8JihocitXeGhtTV41TiRIREJR
bzZ+c09ldio0VFpjc3hpNXR1T1ApNFUmLX0yXn1WZGxCX1JyCit6ZE94OChqJkAxeVkwZCRnPyEr
ZHhtRCk4Um5Va3xtaXg4YzI1aGJMUkUjXiUxJFQ3dENaUHowKF9ASH1vdUY/fF4KK3pzcns+TGx2
VXIlTEgzNiE1LWhrfmA3enszV3A8UzRxVmBUI3kqTSpaZHglWHxBREdNMGROZzVIXjRCNz1sZnd0
KgoreiVmI0t9eypsQnZ1VD0+UW1afSpYXmlhMXRqQWBTfnsxLVJoem1rdW16SFl3RjxnPURncEUo
JVBOJE1CVCQ2XlNTCit6OFA1eThQaHR4bzAqUXBuWDYmYCNDbiVkXyYtdTdjcDE3T35fbH5gZTk2
Ji1iM3BlQFRQVDI0TU9wP3l8dFU9KUcKK3pAfj9qakg+bTl2O3pzZEteSzg0cyVvVjg7KTFgI090
PShxKzhLQWhCbXZDWDF0Tkh5b1ZYQz5sR1Y+PzhjVzIqJAoremx6ZWRMSEV+VzJFdndxOGBmPSU3
ejJJdFhDX2EwIzNkTmg0NmxBRiYjNUV8Jm9xJH5zVShUOUZDQUpDP3g8Y2A8Cit6VkF8cmdIOF81
WVQrRyh2N247OFhieiY2QTUrcStaYlcyIStMcng+Q3w0UkBgRzVgNVlPJGJgXlN7Zz0kNiFPYlkK
K3pCT3hlMDZyVyRCVWBiNSs2Rm5BP2xDVUhwYWU9QHZod25NKENiN2RAaCFDK0MwZyVgeHgmQz1w
am0/P0IzRUhFfQorelM9NSgjNX03e2hSV0trcjBRZ1Z9M1pRcER4NHhfN0w+dXttc31rI0JRaCpB
bSVCXkZhUSU5TGB6Xj13RW9UYHFjCit6aWdLeX1ifj5XIUlJbipsUDAyY31ebEROeXhYPXV5bms0
LUppPGdtMWohYCVfKiNhWi1XbVBBVyFXI2pvJXQlJTIKK3pqe01VfD0wJiZzNzVZbyk9VTA1eHkp
fWc+OFNlRERIeXVCUEhRZSh2aHU8TC1wJF5KQ0teZDFtNmtKa0RqJVA3Uworem5aJmNDb0tPa2l4
YnpUVVVIQ0x8O3I9fX1FV1hvVmdDQFk9YXV8OGlPNFNZbzM4K3B4MF4hVlR2MD5HREspYj43Cit6
MTwqOXclVEpINT1GKnZ9ekA7KU98R2xjKnA/SFZSSzhNS1lsPVdAQUt4V2xaUTYoayNBOWUmSygo
JjFqS1poJFEKK3p5dDg5ZHd8aztUdCkxZFlpaGExTyV3VU9tTjE4eHBjWWBkRjlEd2ZxYWpzR3Yt
IWo4KlklVXZjT0FmYT9gSGhUVgoremQ7cDZCdnlJSHs1dz9uVjtwelQjTmMyXitQM25WPjc5b3sw
UXg/UnMmRjBjJHIjUlNzM3p1YlpEVUxCQ3lYUkB3Cit6bz4ofkZ6cmhDYCVjY2k9eUdCMWFTYGty
K19QbWAhPV5QZ0xGQE4+TTVBNjJAIXo3Q3lrQ0tSOGtuTkw/WTljXzEKK3pIZVRxSXl1PG9pbGwx
QTJlS3gtM00laHZKQngtXkslQTJ4dnVjXm1ud2Qxcjd5OzlufkZQZGxtTnx+N341MmJvRgorejFU
Q3xrKCVjP20jekN+filYVk85UnMzelMmRGxNX09ZPCt4WFk1fEROaXV7dmc2cyZAS2F6dzY+PGFV
cjN0dUVBCit6TnZndis9OC0+Myh5KypfKCZLWis2ISoqREVjeFJqTXtvNDthbmhkSmxuOCFHaVpT
XiZ3JXV3cWZefkdqM0c8SyQKK3pMTnIreGxqTFp8dCgob09hNVVSfEI1YD8kNFRNOClaNn1rPykq
JipIQzJLfHhGPl5vNkhpdF5pd0VwemB0NTgpKworemV4cTF1OylxbjskRjs0NT4tYjBFQyUzVikp
SyMocHRvMkdAO08zJnVybz1OekQ9JVJAU3JPYDE/SEB+UHxEUlIrCit6VXo2TnY/YkEjVWB6QyY3
V0Q/N0s+bFpBdnt8Z2M+d3M/Q3BaaXd5Ynd6NXoqeVJwcztZTDd0eUZJcVAjU3R9JkwKK3pGej97
KlJieDlobmB2dHwwVm1yJlNePDd7PFIjVksyLT1lIzdWVGF5YERMK0NCR0dubzVVdytyODB6VV5k
ZXkpRworejQ4KmBselBAMzswfTd7PVN9cXE9THAqeFVRdiUwOHk1fTVGN0Jicik2KkRLNik+cG96
VEt6ZEdfSVJsQWxHN3Z2Cit6SHNRYCs4T0hNJihqQCg9STclJDM5RG07aXp4NnlpMFFnYk97SDY+
Jk9LaEBsRXFrKiRQd0ZIZDIxYkNJRThBRC0KK3plMjgkNj88I0p9I31YN3tvMykzNkU8ZFhGenNz
RmBfKXVpTmVRVkZ0c2xoQFhLeUpDcTAzWF9MREskdiRfX1EtdgorenhyUmApWnt3cmZWVD5DMEw0
VzJ4OykxN1lTU3QhUVh1TT9tRCk2QCVwQV9NI18pRDJgeVRQZSVGJXZLRUNqIXs4Cit6WFRIWWJx
WnxTSng/bkNvQ05FVGN2PytfNXY2fmx8YXE4RmFKSVJMPGo3NW5Ge2ZBaVJZYC15M2pJVFJ6YFQ2
NWwKK3phclJ4PFJwMUw7QzZkSTdvalI4VF8/I3liQXQzSUZQRnpOZiFrZzRDNkZDVkY9KzBveFhh
Sk5zKEUoS2ArRWoteQorejY5KXI5PzQoIVgpMGBETUlVeEdMSGZoVWFwQ3trdW5KdiFeVnlOQjhP
QHRzVyRBMUZ7eXBvM2NNd3Z+UkA1KyRWCit6TlNkb2slPj9GeSR2KlFzODR3JmZUc24zcFFZUCh3
VzsxPz4pK1l+Km5xfiE2dFFHNG9fX1F+dEx+aXJORlgzRkEKK3ptMil+dUJedUt1PGxyKDBRPk99
S3ElJUw9anxwdGJPXmJTNT1JZXhEK1JTMmM7VkNgI0ZfRWtXZGJYOFA0Mlg5XworekhMJj9PRV93
R3Z4MVd4KUp5QWQxUTk8X25nYnteblk8bzY5a1EwSkw8VGFsUWZwSnEjTlF1dj1yKVEmMHw3RkB3
Cit6azgpb0w9PDBkWDlOJisyNm53NkkzdGVOQF9VbHp7UUReTTRKbmd8ZGwpPWdEUzNGUU1YKigo
Nm5jeXBCZ2EoKVIKK3pIO2RUb1dSRFNzenFhbW5rTkk9QEI3LWoxVkhzeDZTKmhgcmclNTNBdUQw
JkVWfVV0ZFUtVkdoaUxzRysmU2h8YAorems2YDQrSEV+KU5UYWh2VGN4RTJfUn43NU1NRDNjNlVl
Mm1zV0g5Uj83cWtCPmBqdyNaPCg/NmE5X0VZOENiT2UqCit6YnM2JlU9fWQ0Y1FeUTtjJno+NGV3
MkIxYzdkKW1McWpyOVJOQnUtMzV0VWM3U01BLSVNJmNiMXZpSn49d3ROfVMKK3pqIXZjRSM2Z2xC
YDZ1VjJZU1BUTXpwR0RMZHA4YUgoV09zTDlwNz87ek08NDheYVNwc1JxZHluIWhVcmtmbS1jPwor
ekZNJjhBTHNqUH1IWTl0ZTF8bWJKKV5hLXFkXkJ9Tl5zSHhxKlJ4U0J5Nm4rWnptJGVrS0BqfTA0
YD13Pnt4WWQkCit6NW98Y0ozZlpjeWRwOXtGNVojR1BZeHtfYjVXNERsSF96WlVGbkRYKWN2U1dv
cnRiWVR3dy1XcThmI1NgUlZ5e0UKK3pFe0xEVSpiNW9mSXYhT0owc0soPEBwclZnPys5d1dgKzdF
U2tYMzlxd018bUgtV2xCVVl5Ykt8Sll5fTBke2MxSAorenNAQz1tbilrO3taP3E+Y189VFBhe09o
eWJUI1EjKnpGO3o2JnVmMFFgbUdFUD41cj1DRkJHJXU9fjxVNWNIZm9JCit6eEZRb2hfRlNLcHIm
THI0PVclNWsoNyVHPyRxSzl7dmlhOHw0TnVFcnFfV0g8JUxXaFJXT3VhamAqZD1NcjkhSmEKK3pJ
TnF2P0Q7KGVWWklJPHhRYyNhPUAzWSFAUnBWQ0YqUzBjYWg4ajQwd2M4U19yaEJieF8tS0NyTHVl
b3xZK0B4MQorekJxb2hxQjdkZWAjLTl5JFFtcn1sQmFCO2hvTHFIRnFNRHw/IXRCWWA9PTNHTE8w
elpxRHRkUVg9MF8hU3N3KER8Cit6PjkwJURzc2l4d0Y4OylASGE9TjZ6cyVUemduKm0rQEJOUFQ0
VHo2antDbDZMPD5wdmxNdEZBWTVRYHZfe3NIKS0KK3oqS2pDPGdBSns3KWE3VDFrPjRVUTZkJlZ0
Xjt8XntNeSFOX1cjKGNzS1BXbjs9RTJ2JVAzQlFjdXJnXldNUzlsOQoremBaOVVHa210eStkKX4h
eXRNajtLTEViPT9zMEktcHRTKWIkVWEtMDY3czl7KTlyQTFxanJXJmx1TDBBNE14TSF5Cit6R3dP
UUYxYnN8Tnc5NmZkd2o/UmheN34xJmxfSnFEUTF0VE9Ba1RqR01lPU9YIU1gb2ZDZm5jdF5ZV311
TSh3e3YKK3pvOz9pbHxGMW16cEQ1M3NgI3tPRlVvVGVqdG43OXImdS0rOEV6aiFBfDl8Q345NTxR
R2twclZRbDhNPjNSKiM+SAorenl1SU9heiUtNkxBKlEzYzx5cjEje0RWMGo/c2N4KkdzQUBKK34l
MV5oVl9XWHpUYGFZUitVYX4tRWByKWx6eEBUCit6b2NSSHJXLTJGPms1IWFTcE1SPEVTRXMoO19J
Y2xyem4/NVdSbFgtOXk0dkBYc1goc0dPQ3t2QD1aSSkjTz9qRjIKK3owX1l4RCRxaDx2djBpMnxU
YnBJY0VeOzlqQGhrMUo4IW5vfHteVX1SUWxyS0k+QjtHS3MzfSl8eTAtZ2ZeOV8yUgorejA+X0B1
PXJZQWxvNm9FeWp+PF92QHQ5OTA0QTAjcERESDl7UjNuZnpAbzhXRlNEKGxINlZoWXR2MDBxXmlP
LXJHCit6V3MtTmk/KlFZb1QySj9ISV5ScGE9c1F6NFhHdUYhNi1xMXQ/WFAwOXUwT3o8eFpFPHlI
MVYqXiNFYzIleDRAKkQKK3oxSSl+aFQqbj9oVXlncUs0Z0tPKl80dD9NMjF8YXF4KSVwMFB4RjJI
d2kyO2M/MDYoP21GMXNgK2ZHJm57WkNQfAorej1WX1Q3Xm45bzlvVHE9bzNQJD8rVz9NfTtpZU40
flAtbTRgaSltNnhfWX0oNz1FXnhJYCtMWmt0Nk5qWmxRdXQ+Cit6YEEzbzZyVEY0cHtmZm1vK3xg
U1YxJl9wRD9PVTdsMFdGMnZ3PnRHTVlrKiNTSElYdlV0bHx6SEU7KVVsVzhVd0IKK3o0Nldsd2ZN
ej0odzJwN3sleWZqe2pIVmJXYllCakp3eXo+dD8lTjI7SEY/R3xuYWw9X3M4MlR2Z0wxMjJKZXBJ
TQorenMyVGA8Yl9PcUkpQTklQUZeMUhDdGg3OE1kWEQ2Zm9sTnBvemokWWB4SEtubmZ4b1N+e0E5
QGM0cEFNTUhRYihACit6PmRGMEkoZ1hvQVNSfVlFK1orb05KLWhuTz5HLXdhUDMlQX1wYWlWUVNq
Vm97aUBUZSVeeTAkc3gkMzU0Q1AqSn4KK3p6aWtTQyVHNlRWQyU0bEgzX31TUGMkQXhAVFdJRDRM
bSM9XnVEQUgoRnc+RU4xZGEpRnBYXmU7P2w8TT1XIXZvWAorejQ0NDN7TUU3d2hBJHFBQSopO3pF
V1Q0MWxDaW48KiE3YnglLXVSWXNBdC1vblFnO0ZGaipOOFJBMHA4KjtAcVh7Cit6LTdiRUZrTGBQ
KHhja2NmJlN9KlBXaT5jNFpBQ3NwNW5JPHw5ajd8Q3psbXdHU0o8azhOZnJOKnxJKyFYe182M0kK
K3oldy1+Q0NIJlI/PXdWazV4JUc9OSExaHN5d2B0Pm5RPUkkQ2hUJTVMSGlnN2oyUytudF83LVJp
OUE2clVVbis2XgorelNXUzdEbHo/JDV0aiVGQTYqJHA8eVlrR0tRPHpFbmx8Ym0+OyZBKmVlYlBX
PUYtYHthOFF8NmxGI0pxMnowaE1QCit6bzF3anZUejdreGlYZ3YzPGN2TVomVTNDOypBcmhFdFZW
MXB3fFQzeG4odiN4ZGdsfi1qams5QmtiNH1pMDxYYHMKK3pRS2s3bnMqMU84UGk8byFCK19IZ1Fa
OVR+ZDZvWXwpIyFBYlVoRENDQjl5VEdRYFRwPWQ+S2ZRa1MmQXQjRXB+bgorejsjWnFpYVQxUT4z
JUJKQmojUjh3JVBhZk10IzhaWkpGPSo0aVlJekA4TD8mdTJhRGZ+RXxLZCZ2JD52Q2gtRWpwCit6
PGNRWSp1akpWdFdOcz5TYGkhMWYjNU5LZFZhdn5jXlEpPyE9ejU3dC09PV5+alFzWWM7dWc1USgz
dXM7KExndVkKK3pDO1J+TlRVRXtGY3N5X3BhUDBkcUA9LXMmaX1VNDhnKUh3TnREQnAtTjlCO1lU
Nms3QXFoI2hXckRMUG9ANDlDKQorenhVdFFIZHclRyZYRm02KT0mN04hJjdTM055OFNCIXR7TDVk
RFBFNiNlUldjVUQxSkdLUzlSSyhxaHQmfSVyVDNwCit6ITUlbFF7YkF9NjAqY20xQEF8fXhBdT9s
MkIqMjcqXmF6JnVSfGxKeUBqO0hsSndTRmROT19qM3l6JCh+YDNNVmYKK3o4RTJhbGw+PncpMlRu
c3BXNXVLND58dWh+KzktXk1fJHVoXl9DRjx6VlVCfnFWRUxIMUtIUThwQTQlaE9DWFAlJQorenl5
LWNGWl9GNClkdyQ2SktsZW1zU152Uj9JemBWZWVASypNMVdqTTBwMkd7YCk1WjFSX0FTV25ZQy1w
cC0leUMpCit6eyVRTn0kaEd1PW9xOzJ5YjVWaTtaXjxTQ3JhaFJ7Wk9iM3w3OXNydXZ4ejFwazkp
bTVTd3ZvdExmc2V7YzB1Y2sKK3p7Vlc9aGVKMHNhemB5S3l1QWx5fXhta1JUe2s/ZCk1Q0YjcldI
TzlMIys7WjAtQFVKU3pnWn5rJHpjT0Uwej9aSAorekh9KWEoUy1ZWFp2aTZAMT1HMGg0SzxAfFVH
Yn1qQi1xRlhVUVdoUnlCX2krUEsoUk1eWGRTPGo1M3chZml1ZGdQCit6eiQtYSYxeXJfcUhgfmpF
Ql80fHBofGtaUWZXdjZRZzFxNmY3JnYkKl9aUmIkRC1UMD83JEZieCooVlJmZEJ+Rm8KK3pwSWtO
ZSg2KXtwe00laEpgRkxiIyRMYGlfVndNPztmS3YhO0dKbWJ2e052JnFFNVkwanw1Jm95TCokZFF6
Q1ZMaworemIyPFo8NX1nWChTbF91My1AV0lAYFl3eWAmKkkyJVRZKTZ5ZVhLN2hgWEwmfHQ+NTdm
YXxAdiY8Rnx1cXdZWXNRCit6UEtEU3pLRF9fdShjdk5KNGBtY2FpWEZ0MTs5WlQ1RnNEPDxvPURt
QHFpcipeZmtlLShEbiR9KGROI2pBLXFfXjkKK3pRaHxMQihENk0wQXNtQClLSGpLaylBZEFlWFVt
bGZwUlI0eCpyUz9INmg/Ykl4O25ZZ2dAYiUoQU4yYCtuWXhacQorentQNElqKCk2ZHltIUNOa2ZF
Pm9TQDU0dVZOdEAtez4rJCVFZSojO0Y7P3JKISskVDxWIzFQeCQpXyltI3p9P0ZNCit6cnN6ZU0k
WGlhUm5+JX5KYzQtYTV1c0xMWXBPO1cjUlRkRm4qTnJifXwwcShScnBCQ0tYSytCP0ZlMF5IOV5L
QVcKK3o8NmNqK09OIVUzOzxwVkZLfSNEZT1HJCReN0tLTD9ZentkaEU0N1lSUjA2OTwwPF9JZ3J9
PmkrWSN9Tnp0TSk0NQoreldHaDRAKVctVlZFSWhHaC18SjR8N0JQYzVFfkdBbjMtZTVvJGtOSEpU
RXxiTVNCWXNhakZpcXpkdTUlXiF6TVp6Cit6ZkhwcXhXJGJRTjJBKUFAQmFiZVNlPmF9Ynp2Z3JC
d092Sm9VZGJVSyFOJHxAMnklRm1YU2BmQHUpY0N4TU5feXMKK3pHSCM9czJUfUxZZ3J4QEklITww
JjNocE4mT2dRQzB7eyt5X3ZXYy19Q0FXU31uK2BObS18ZSh3UlJkMHtpQ2J1Kgorej1idnp4TyEw
QSZZI1NTPCVAJGpiKE1rOHgwSW1IczFneSpxP29gcjJvX3o5QDZPM1AlOWhgRHFqdXhBKGEpP15H
Cit6aytZQUo2U0khOTdxNUFMdGpgeURKPVMtcioxblBxWXl2U0twKyhzZWpBPCYldldaQ3RaeEhS
bjl1di1tbT5XUGMKK3oxK31sQXNqP3I4dnFOVzdXYGEkPXIlb047YkBCRjVaVHVJcDIrPjlyKjxE
dTdGV2NIPTRXVWE8VCVRNFA/Sn5NTgorelUzJT5HMHMwalNeMC00TyUzPHJSblRaRWZgUFZLIVk/
dUZselI0YmV1OC1hRi1OOGdPTGp1MUFLSzJrREByP25ZCit6RTJ2K1dgX2B7ZFdMfmF5Xm5od1Rw
PWFvYykmYVVQR3wkV3gjZk9fRzdYPTRQWXdhSkNMbjgzJitxTk5JYDZqWmkKK3pmTmh8Z3lrIU40
TGYqY1JfWEcydzVEe01fJUopPzBlaiExWEtRTGIqSEhwZ218QVhTNyEraH5JITleZGRnQmB6ZAor
emxBYVNOWS01NXV6ZShnVTxzZ3JCNWxfbmdCTXlRKzBKZzBkPm0zcmdmPlRZUy1POEtaa2N5KnIj
aGU3fWNfVHBjCit6UU9NblQxJHsrcGt3PmkyKVRSJVJ0c0l5eigmSStFJEpmR1laamFTe19oZiom
LWh6KEo0MlZYbVdAX3hRTUQ8fHwKK3pXJVo0WjYzRFJpT2x2UCUjTjdWfWlZSG8kQFVxMmc0SXZC
alFEdUZlRm8pQkJWVzlvMzMoV1FFSVhYczYyJHIqdQorempnaEo1cjlpQjwmTjNPPllNdygpcjUq
MV4zbXBMcGFxbDtHKHV0eUQlMHp9KSYpITMwYlNKdT1aPDVWQUFYVHVQCit6UipCTGNYVDYwOUtJ
JU1qbU5gU1U4cCVGQkt6NEVodyVpOCQwIyh7XyglNyNtPUJAJXhRJVpCVVRFNyg7QUBoJm8KK3pT
dmlxYCktRWJ3ekIwP2xkdyVxPTkkVCRAaHsmfklBLUFqMiMhO352IyFeSWAhMjF7bzh3RE1MQFMo
OXcoZU4+bQoremhxbT8/QSNkOVUlMEZxeDMrRkRURkRLYUlzd2MrRVUmNG03YWAkU2U7NX11VWJl
JFl2KjFTVDZFUDQyZl9QT1FOCit6e1JHRmpWYkk/PG9JdiFPeSprMUI0fmtXaENqUWRxa0lWfl93
d19ILVN6U055aTNFPWZDdjFBckczeEBsbmFhY0EKK3pfaFolfGtfMEpZQjJue1pwNTZidjtgMDkr
fEZ5RE97cTx4MmJBS2tWfEU9SE8+WUk7VTFiXiVNZjUqNEJ6ayVQdworeiZObU5tNnNFemxqUCNQ
VV9zQGYpe0l1X1BJYDU2bi15RyshdzcmfWRfYU9AZXB+QWt0U0h8YEFKPHMhZVdNPlZfCit6aShi
fWJ8TSZPNUlRWEFWMTZNPU98Q0smbU5jbV5jcGlsQzlqR3hwY15UfighYj9fXjkoaj92UUpXb2hW
eU0qVSsKK3pgSDI9NXF3JHlnVHpEUktve2g5TF9uWjZvOT1fR2A2S2ltZWxrWklhX00tODNAYXlD
IWQ3dDMjWn0/cXxnVyVgPAorekolaGkwVmN2THstQEUrd0BZfS1nWFFaIz9IPVNRMEtld0lGYH1e
O0ZtKzV5TnpqT0V2PGhMMSVgWnhVa2lDOzZuCit6QV5mJnN5dkYjb0BZREh1XyZwOFllI2heTlIx
QiYtc2V2JXApcWsxSlVzPnN1fDcxQj17KnpUYGA3ZkphUmR3Xj8KK3orV0xtWWpTWTx8P1RofUEt
UzlGVWFAKmxCajdRb0xGRTJLPz1SJHNCPD4mR2ZKT0F8bUIpX3pHMjB3dkFSdWx2LQoremZrZ31y
ZDZ4OFdMc01rJiglUVB9dSYxI2hULSFSPHYhYkg1LWZtYWdtUzZnUnFJS1FoN29+cSpJbjM1UiFI
PC1jCit6Pz1IXkw+eVQmM0JqNG9iPUgqZlNDKj5yfkV0fiM2eXxKPXQkPUpHWk9PPjdYUXMyeW1g
bFlvcyhXWig+Wjl+MEoKK3p5NjlXbChCIU1DWktgYWpZaUo2T0BtMlZ1az1uWjIkVnkrTiFNQ2lz
dUY8ISRBP2psdTxjbG47X0ZVPTwmMGpvbworelpmTmVqYE0mRDw9R3Z4KWBXNG1uNW5wcGZRKkZm
KFlLdy1ldDkobVZgZXd+cD0mSzkrVDUyUTlxQFp1P1NrLXs5Cit6cDsxfk1NQDJJbThkbztlKSt+
JG9AQEUkS2lpKFNgOGhkNDcoYmN9fG55UmFQXkJhfiVTfUt+VmViK1RhPiNHI0IKK3pWfD5CLU8x
RUhiZVR9Yzh6NiF2QGsqMy11Zkp9RTltZU4jaFNhb1pSLTg2akA1RWBOcC0tP0UrK05ISVhjM3Jl
RAorendLckJidCpESmUwSipXTHB9RHEtMkxaTSszMGkkYXFfKG5KSEtuUnstPSVDKmItMjJ6eHc9
WVZUMHA3ZyloaztYCit6bnlTSitnYFk5THgjYklqYkxZJGxyMnR3UW9UVj9BNW5TTlFVKUU2SCZ9
MVhZIyVRPiVxSD8rRlk7JCF9KnklYGUKK3pMPCR0M1AxVGhSSFRBWGtOSUNqYVRjaGZibVM8R2dI
TUZRYTNyZ3BlRih9fXBuc0lEZFIkSUJ1UzZOWi1UTFMjUAorem4hMUsxelF6anIrRW1ZMSMmJChU
cTtpP3lwJDZJeHRLcyFJUmVhOTRRbFA0dSFZZ1gpdDlgWGdlWUY0KTIybGBBCit6P0w5S2A8MjxU
eHNwUFJBRTklM3dfUzVBbS17dG04V2tkYX5nPTMzdnpyNUF7bFN+YT9JVnR0clAqPzR8dGdMQikK
K3pfZitMbzA9YG9fNytCJENTciU9b3ZOUFBaYlYofTVAYG4wd3ZZTz9vXnQjJm1Yc2V4SEomdnVr
VXNsd21ALSMqeAoremsoRzlHUSlfZD8wWDx2XlpQdlJsNSZPRm9zOyNleEcmREt5RTI2RFZtZ1kh
TlZXRk1jRCVtZFlIKG9aU2ZrMG52Cit6Sj9Jb2R1Q0laNU5zdiFWRCNFcHVIajc0OUhkY3FuYFRS
RCVSZCNCITN5PW4kITshRiVlKj1SPEBmOHI1JT8tbGQKK3picjZXfk9NUEBqYnJWJXFIZEl4SXVi
fjJlI081NiNjcWdmX2E5WGBvUWRsJT9Oa2QoZ3VXO2Z0X3okd0lscXc0Kworek88TXhXbWlyMj9w
NEw8PylKb2RxWCtUZ31UflN3RU1WJCsoVE8kc2IkeDBeX1FWYmdSTyg+I1JtMmJrOChgcDJmCit6
ejZsZWl0KmpSQ2Q9bjs7QzBneTlGbHBMfmlXLVF4IVorY25YX1lHPi13OVZ3Z08oI0FkdUM4Y09f
TkIzKTA+IysKK3pIWmpwfFZ4cnJgI0FGaV9vaEJ4eG53YVBgRilgVzFvVm9NTHsyXmFxcTM9Pihl
TTRGK3pLViNpcU9RKCE+MjwrUworenNyfGpGeCtZcHooV0hqeDhXRFZ7NT5Eb01yU25Te19AcGs4
NnxoKT8/LUNleU1NZDJ1Y0dhRmhhMn5qeEdHUVdsCit6VkVPN3ckWWBZfTZyM3wjQzB8OHljO3lP
KWZeaWVma01yZFJtIT9UJWMjdWoqTT1GfFhzdzFQSmpCdXA3cURzY1QKK3ohWHNVPGhyRlQ9MFMk
V0xkbk1meiY0cW14RFBtS2Fwc31JMFVTd2dVVk8pV3lZKy0wWVExe09aKnVkREdOT2ptMgorenVa
cXdqJU5Ramc4VWZJQVVHVGNPektNbFhDUVA5SCNAZmJlJi19U0Y/Y1BrMS1aV0ckdWEwO0ViTFpM
fW0kYSR8Cit6Y3hPZ3Z3cTB5V1ZHKElkPmQxKTVYJV9LWSlsPl95ZDFtVksoekEkdnVBJm1ZSXhY
QVdkRjhyKWo+PWhOUnxYMGQKK3oqQDd5ZT9wRH1FbCRMYVFqUE1KSVc1YmIoJFlgYSk2ZlZZJTh8
TnR0Jll2SGdHc18tcjUqIyVFUGw7KER4TG9OfAorekkwSXVJTXRXZnwwSlRuO0REYk9Gej5FQDtq
RDU3VyU5a0kjQjN2TERYR3pBd0RIOD1ucilSOEBqNVUmUnJvWUBqCit6Qk56JVV4TElYUil+YS1C
V2txQWY1flpnLV5BYGtYJmMxb14reSMyK3l1fi1vM29oYF9mSkNNS0QrUmY9QjJGQVEKK3pQLWU/
bHMlfHNAZWJkO01yckw8PWJOJl5QRiU0ST02bklYclcjVjdnYShZb0lyfEx2R0I5eD5GMlBUQ0xo
cVAwcworemZTdHYrTH1WVUpMRFErP3twPEZLVnVpIy1yISExOCtFdz9mVGRPT2g1bDRaQ01RTDgr
RFAyQExRKnE2ZWxuWEomCit6MEpZTV9GRzhzckRUJDxuTlM5YXBNdnRxeFhTOXNgPXk5O2xYZDZM
ZD1kPzZMayROZ21VNl5YMTcpUXE7a1ZWc3UKK3peT2Q4MmdeaU1SaXA+O210ZisqUk1BTjZTU1cy
dm1ycH1rSTAjYXFlM05mMChpalB8PXBoVExmc04mO05xMj56VAorej11MVp6UHs4NElrdH42Xl5Q
JGp7NytCJXgoeHRWbnFUdlBKNiV7TGVaVmwwVHIoeSp7UXRsKF4kNXBPQ2xwfChACit6QVoqbWhz
RTIqfE9LYn5GaURRfV4kNDN7MTxFU245eWQ7d0wzXkEkNzBDNnRMJWEldGo2aUlaVUVOZEktQnpt
Rz0KK3pHQVZZYzUpTz5gbVFeJVlPOUN+ZHopPShkTHIwT2JEfV4qYitQTHNDeDI8dU4kIUJefChO
d3QlcEA3ekY1YDJtPQorekNZR24kQT1GSFBONSlvX0Y1PER+OWB9KT1zbUh0QSQ0RXNvTCoyM3BI
P3s3YmlLI34kNmVfRWBYR0puY3ElSyk1Cit6KHdjZ19yQDx7M3hqTEQ4UGk+PXtub1BVSk97cSNJ
cjlpRH5OK3piN3NZfShKWVZhUCZUP1IkRW4pYlpwby01dHQKK3pDQ1JFSHtUYERVQkZQTEApbDF3
YE9eeD16UX0xMFZZK3xqdDhMQ3J7O25aVk8+YWlqUElYdlBQeVFkK0VwdnVQRAorejxafXZGc2go
Rj5CJXhga08rcGlITmpfR2s5Oz9HUHAlKzB9d1BIeiM7SzAlaTFBYiRUWUo4R0JSd3RpVnFeMHdt
Cit6YGNNUFMzUCNEbFdROUYkSlRAK3xvMFozISlUNHRYUVhANHNZNEYmWiVHO1dqQXlzZHJjNEBN
V01sM1heeG9+cygKK3pxZGg4QXc8NDlKdjlpXzh5clE4d2BJemVBaW5OWmJ4SDZTdmRHZktQSXQ1
KXJzd1hRTlpHeEJmQ01Ha0pudFgwJQorekJIO2pmd0Bxezh0JmIrWngyI0EkUiltdz9ZZjlwKFgr
PzlnZn45cGZEXmYjNmJGRXdMKHo+K0FXTXdzVj8pUiRYCit6USlefGlmen1wIzxmJj85M1lmfU4m
I0c2cmNgeC1YaSRvZzMqTmgrRVFvRm8lVHgpSVB2VCtTZkhSSD5JV3U9UTMKK3poXkBVQ1FOOCMm
d0VXYElxfmBGOVlwNipBKEBeNk0wSFA+YjFwejFOdGZHUUdWZ0ZvM3BRNyY1UXRWJiVkQnNGMQor
eiNMbG4rV3VKUGEqR31eQ1JGMXw4JDwpU1Y2JTkyfGhASDE3bllFPD9AS29hZWRrMiUxSDhlKVVa
V0d9fkklfkpxCit6OGcyeE8+WTE2JXNCeEV2TkFXKztzOE9RfHVXYT4lbjx+ZkdnfndJZTRpdVRT
XyU1RD8kJWkrXm5jOH1NcXcxb2IKK3pRSjI/NmVWKnhfM3ZadTFXcn1FWmhDPUVZNiZfQCM0ZjJj
JWAkazxKX0laM2hhLTswKm0kQkZTSms/RTJCSihSUworeitMK0RQKSFyaj44KDwoc1I3KnU9Qzh7
N1RwLUJ3bGVueng+ak1tcHhwd09BS0lPUTR8UUJ6NDFUKFU/KHNrPmlkCit6V2dRTm8oLVJ7Tmsl
fkdgR1p7VVJZNk5qQGVSRzVEWHotTHA+bXMjZGZ3THw+SE4zM2kkfTE7XnFib2V9PGFrX3wKK3p3
eVcxa1MyLVVoT20/JE9EIU5rQWhKY2xaZFE5MUI8KGF3MEgrNTlfKzk0a0N3YUVOVDk1LVE0Yl5U
KGAocjhgWAoreipqaTRaKkh3RFBONWY2eVh7TT1xSlReN2NHfHZxUz1QdG1tVHw5cm0mN28yYy1p
bjF+YkxNKzY4fE1kYURmSXc2Cit6U1FSNlBXP0V7aUJGajlaIXEqNXcjJEE0SUArKVNlRk57Q0pH
al48dUZNbEduJSpWJSR3ZlRTdFdlRChoOEQhOTsKK3pyVXFsaio0OV52MmQxSVBIZkgjR2NON214
ZVUwLVRLbmhnKCR8QD5uU0omVERUa1Y7TDUySz1xbHlTY0twdHg+RAorek1aRV9IKVFre1FpcDJg
ciVjb3NpdmRYaFNJTT9vdTMlLURaSDdYe1A0VStVQW1GVCVxYiZgMSNReldzKXp8Uz45Cit6QWgp
cjtUV3oxOz9XNGomSmZtKE5KOEgkKVFCfVRDYFpjNDx0e0Y5ZCteOUxlUVRMcGRvX1pETloxPFNw
Yj8hV0kKK3pUaTZaJkNAIyYzZ1N+PGtyPzZfei04PjYhQGhwe0B0IU1tckNXV1BlQCNBQCN6aUB7
OHZKJmNgQmJDKmpkWU81OQorej5LcGlmZVlLfHwlSCpTVj1+KGVzO00teWh1b3BkKj5QaEFfUTdG
UWRWSUIlRFkyYjVSTHckYCR0aV83fCt1ciN7Cit6TXxFQkl7eFpUcUgyNmtJWGhJWHhqI0dYSlRP
JFVXNUVWbCNmc2gwVTc9eXNGamVgVnxrbTNRMmtwI2xWanVIcVYKK3o0dEE4cCVPd3J6bE4wSlZq
YVE8eSNIRnA8RG01aiVTRFkjPiYhdW5DUig8dHpjcjh0fFRBbStHOVBhejxiTX4zSgorekd0NX1G
bFJ2dUY8MVVUOV93SUF7S0VMPGJYUCt+N2RjMDJZO0I+UiVQSTt9e2NYIypuTkd6OylvfjVVIStO
Q0E/Cit6Y0pBXnI8R3xkdCotbUVDa3VgWmI/IXhLRUBzNihESi11Rk05fU8wbGFVfHZAZUZyeSNj
WW9LbXU1SjRtQyFWZk8KK3o8RSlNMUVQRShWKyhffnxAeCtsVHVCYDQ8KyNKSlRGcDM3RHhUJjRw
Si11O1JpZCFkR2Q+Yy1JekJKPU0peWhKaworelcxbEFxQmAoVGB7TnF9dHJ1cEVaS3EzWCspZlNo
WVpQSEs/O1ljMj8mLVVHdlR7Pm9hZHstK0tPMXQmcG5BP05FCit6JmhFVz04RGspcmFVZDA7ejFY
Wj48QXk0UXAhJWhpc0FvXzdzb3REenV7cklyKnFwb2QmVTd2QmVmTjRZdDFkR0MKK3o3bn1iZEgy
LWZpfDhNb28lRjs4LU1zdlQmeUc8NW5oR1BGT005M08lX2phIytKQyM1eWQ4dTdxeTM1OyFsNTZ2
SgoremNGX15Nd3I7UGQmK0ZPWWI/XjBoX29Eb35vdDsjamhaQ309KUFTM1lIPnwle1JiJHJpcnxX
VDkkZTZ8eU0rM3UzCit6Xm4+VyQ2cEpvVmo7JCRhXkw8bl8zdkZASUk+Jnw7Pm94Nyg3bl9HSkxw
ZXwoXkpJV3BwSDxmYEo2MmgjUnBPbEEKK3opUG5ebGdDdXNaYipBMVl0TUdmcDF0V0xqekJpWHk/
MWd3XnQ9cSlvRD1SVUglUjB2XyVLQ1FHNHw9b041a0daWAoremRxKm9PZFZYYztNJTAqZHBIaE4h
Qy1afEQxfXNKfSo8YFJ1YXBUKU5kaShabCt8JiRaSHpnNDVDa3hiYGJvK012Cit6JWVhRn16MCRT
UmtmPUc8KzhHN0k4YyY5dWRjY2pzVmZwNmJOZnBxJGtZenBPO0A5YlJCfTZOPVIqO3M9QkcrOEgK
K3pxX1UkU1F2aWxPZ1A3I1phPUVlOzVqOXFYOCRUZ0lEbmduSXQydiNiNmZ4YFZwcHREbzU7dDhx
IzNpPnpkT1RIdQorekh5cSFRc2QwQCpSa2dSYGZ0SnhJc2MpMGkrazVhXihEIXBMJWVxMz53PkZB
aEBLZmhJY0RKVlNXWENlajkrYXxZCit6KzJpci1Ld0JvMGZoQ2lLRVImZz1kWmQ5KHpfeGJrUzZ1
ZEZRWXdZK3U9RG08ZCp6UEczTjJxd2o9flN+YSp8bSkKK3oma0NXdk8jKXJKVnR1VWcjclptc3Bv
SkJRTU83NmF7TG9AQGg0I0NoNil5VzZsNU59UHQkI3RQWVBuUVp1NkVOTAorejY+MkVEdzBRaCFk
MUl9WjdJe1IoWSE0U0I9VSFXX2Nac3BoJGRDMTBoPDItcG5XPSpqQmw5UFhoK2dRT3NBJUQ+Cit6
NzIlT0tYWVE1QjJSKUcpKChgWWhOUlZjWGUzMkUraTZ8UjAkWUBNYSN9ZilNS0JUPX1KIWxUY1hV
YkYmK3R0MlQKK3olcmk0TmlTblM1Ul4oSm5fYCE/QFNHbEJaWFRjc1ZnNCNGdEYxeEU/PCt9U2Fk
PlFZREM+KFNVYHZ8d2tCI0ljVQorenZKKjN9SE1PXk9VKGRXKXhvVno/c3N6PjNaVEcwPVNIUjZ8
S2hPOXE9TlU2Iy10QWUlbmU5TXIodCRFc0g8TE1UCit6T3JjemVeY29vbko/JHd4RE8zK0NvTSMr
e1g0PTlrQjZJT3RDIyk/ak5iZDJ8R2dhYit2anMoJF9Sd3E1OWlxJXUKK3o/cmh5b0Yoc2B3Kj9W
Z0A8MkslckZDX0Q8ZU9zRVdnM2ZIKmxKVjl9Nl5RN3U1OX12dXdNKU0wQnd1ZFEmcSRHKgoreikt
PC1mJXVzNDwjPiFROS1ASEpxI3JmaUgofXZCb1gyeGc7T0E8ZXpiUl9jQXpyOClwKU00Rk1uIXZv
OT1Wa2VnCit6bl88fnE+bz9TOUMwS2haN1ZsP044RGxGSi0mcW1NOGVBc0NPYlZ6XzZfd0BBeVVR
YGdWKTJDKUZ9M0RtcUpOI3UKK3pNdnU8c05tYz03OUVVXzEtKTF+VC1ETkc3V3AySG9HYioqYUJn
QiQ+c3skJl9NcjJxYWI/PkQrN3p2Z2tabXFkWQorek42Z3JUdVV9R1EwJWomQD43JU4+ckhPaGI5
UWBgWlRLamcwVH5GVUxJO0VCSjhmOVEtU0RTZiF2OUYoJW5BejJsCit6TiM4S3J0K0RkPnJ1blc8
X1FYdFhuTnFhZUBwfGMlJlhDUWlJSHJuTFlYUWgwZ29VMm55PXp7dFBNeDtjcVR0TV4KK3o+bDhW
O19PblY7OVZ4ISUxITkzUGFQMTZnVnpial50IStDJk87bztlR1k3Xk51OEd9eCtvSDl4VGtHZCVk
UVZTUgorelBXSjZYYzB8WkZ3ME5lfC1GcT8yTWVEUUluSl93SlZkQjxCdTA5JjE5TDA/QSpVejJ4
VkNPRX4jZVoqWE8xQXEmCit6I2l+Z1ViKGRIZmF1clc1dUtQZ28tZnJvWFp6eSRSIS1QfUcmQ2wh
MGg+PUh9PHp8bWEzXzNjMSk0aV9lKGEwPXoKK3ptTCtTTlNTcWZ3Q0UkTn1Uc2UhKCV8Jk04VWFY
aU50bWpsclN0clUjY3tlSXpjVU1+KlpWcU8lYyZtOE08MkNjOAorenA9YDNEckZ3VzslZEZxK3Z+
R0g2O1c9JT5FYTtSYz1KZX4kWHtQVXBWZWombChkNT1mUjRzZHJubH5mRUY4UGZmCit6UnlBK1Vo
TXB4OFd6U2duWmR6dXRIQXx2Y2N8MUxUTGZ4RjVKPDlRYnhiLUo4R1ZAYjt5aVNIenlpM018VHwz
IyoKK3pXJlVSXlhvfW4zRk1HRyErSVAjcSVDVnpZODNFP31NXyNYYU9NTkRPenNTcTEkdXFnKCM8
ZHBKQz9oJjlXfjwkbworendibldGXjhLZyltVDBjUUN8YGpFaXBtc2FrKmZnSkBSZSQ1JXVeSERl
QytMeyEtX2Q1SnpsQ2RZKjg5WmdXV2dYCit6QkE9KiojUzJCZGlmdEooT058Z3dDUHVwNE5XNig7
VyF3cnFGPkR8PFEpUjRrcT41NEhMfnV3MyhAR1d3QHR4VE0KK3o8PXY1SiVEVU95T2w3blV0QWpN
IytjSlJ9bkB6ZmJIVDA9JDFuIWF3JVg2U3Ukdk59MDtuaXJPdUd3QTBHT31+YworenMjLUpDdFBA
RzxefmxZZT9VOW5LNGs0MzZTeWAqc1BEPDlEJU0qSWEkdztfIStUPXFtQWFjQEBqckBVYmhUIVlC
Cit6Z2xkNVdBIzt4bz4obmdmZ1JRUnpNRXRkV0M5LVF2Yz9iTk52bEU1YW93akowMGAjOTtDbERj
flF4KVhubTwyOHMKK3o+dz9mQkhLOUppSjF0SVo0eUNkRi02YCZjY2AxeChYKjsjR0ErXlRqT2M2
KHFRYngxZkRKOUgkdHdJZmZeOSEjdgorekpKejk9IzJSVnE/dm9SSGg5JGVLKFdjR092fVU1JDBR
SVJGMXVMQ0JCeT5VenRHJW9PR2V7UWNHOENEPzYhMzF5Cit6JTRvdjZGK0EhP2FJRHM4OzNVTWhX
M1VAZmdETkp2KktWbURjVjtQNkghJXoqPDVeQG4jN3ZRNmJGeX0yNWg2dyUKK3pqMmtTWWRIfTxt
V15ERUpaNDMxXmdsV1ctT3o+aXgoTz5Xc2chIztVUkA+diRrPDlgSXhgYE9wX1o0KFgpd3JmNAor
ek5aZmRoQnU4Ki1VOEJXQjZ4QSVwZi0oelU4Jk9UISs9VUFMUzZvbG4xJUA2VDNLKm9+K3s1YExo
QSROXnI3NGVaCit6b09uXytFMDZNY0ZIQk95YTxIKkh6SzVyYkticSZ9dGlkVnFeQT1EYzJhXzNL
TWtMM1VAXmtxSCpVfndEM1ghI2gKK3pWX25BMmZuSyF4TSlZV3pzTEpEZzZNSE1IcnZ3Z2xiKEZg
cSYlWWhsVk5iVl9rP3t6fEIjcWJDVmt9eTVETT1lfQoremlkNV8pWjY9ZXVeMDQxUjNediEyNX4+
NSRZPD9LSnRgQjVyRndhU3A5PHBRWE1ZOWBYVm9vP3otSEs0Z0QlJiZjCit6Q0Q5cT5wQnVVcWA8
Nk82RSFRO1JsRlVYRUVoZ3Y3Y0MrX2tyIUB9Wig3KSY1RFEoQShMN3tFTGlFMFd0SHNacGkKK3pS
RSR7dUFHWGk4bik3WURUJlZafmFBaTh4Vy1HMTBmMklyaUhfQmw8eTM3fj49dkZrWDNLaEZPOTUh
S2JEVHIraQorekdIVW1FKyR3YVEtQzRxY1Y8SnBjKEI5Vmojam5AViFMZE51X3VEN1J6bFlfNXVg
clZCSD9DXmQ9RSYtfi1VMD0qCit6QnNhcFo4M2NLTEZfY1ZgczRkO3RTaklrOVJfVTxDIWhUdUk/
RWR3M3I+UTc+PUhsaXh1fGomSU8wdEJnek19Y2oKK3plcD1XR3NpUlNQP31ZV09nNEFnazt4dykz
aXYzbnloYXF7X1JAQTFWckJpIUhRb3IzPWE1N1BmSCQhRyN3O15JRAorejlob1dpNnFVciRWJFNR
UXRhZX5fQ3w2fVZVc25rQmtVZGdtcXNldno8bClHVCRJYjMtWlVkc31JZGk4KmdiQTFhCit6RXY7
Nz48RH19JmMxfj9HOUxPP0dONkE9IShUdGgtJnl8WClMcT8oJEZKbmdLSThFY3RNRnA4QSVHK14p
KklFe3QKK3okd0QlN2tDYU9IKU47a3lgQllCVl5+ZSt+LShQVT8hWldHfVMod1dpZGF7LV9RPU9T
Wip8cylpcUdEP0hiaDlyIworelpfQlFFKTx9OyhVez1yREdVSEIhVXwtN0RDRkVqaGx1bUlwJndP
WFZQKGA2fEBZRlZ0aTk+dWhFeFB0XyZtcSY7Cit6XmtLKFgrUWowLVkjRiQxQn5oeFpJeitHVFB+
K1p1eGFjc2xGJWNfbz97OCZDaG5hMytWdldSSm43Q1AxYjhMOFIKK3pHOC00e2Qma3lQdGdXYzhY
c1NxN3RnTmBGO19nXl4qcmBLWURlUmklNj5GRFEkb15ZU1hkOzBtUyp5IWN5MjtFbAoreiN0QU9u
TzFfPUojTTlUcyR2d05jbEVYRVUzLSMmcFozZXZjVnQyVTNDaVBUbTJRPS0+SXB0LT4lfW8+QkNF
cH1iCit6X3dPPXNnRUpNTzlPPFJ7SDNacmwyZWozYnZTPSkyUiVVbU4oKnMkUG5KJSNsV3J7dX5j
VWspeEBsdnl5eT9lU3wKK3o8fGAxVG5YazVwWE9WNUZUXnVUdDYmfllBM2RnenAqZHtDbkF1K0Je
clhAI2F0NjdxZkB6JkxBRHllaU9Kd1VBbQorelg1ZDZqQ2NYNypGblFeZCsreGdBKF4mbzM8dlVx
MlNtJkpYIW0xKCk4SnpwWDJEe2E4dmE7KnlYMTllTWI3UnlPCit6V1l0V1d7cU19aXElQHgjaG16
QSFkLXFvRSp3dHN3TGlPa3VhMjh8Xm1NcmtSNGVlPCRRUllaRz0hdW0xRSk5TlEKK3p6T19JPm0j
VWFoNylBTGdePSV8X0ZuIzkmUE9FVSQ7aDFMbXZFM1pLdXRIankyUk99USZhLSRfTGhHS15FPjdy
Ugoreml5TVEzeG89TmI+az5NODJnbHZaR250eENYNkUkRig7akh7JSo0YGhoZHw3IWNqSDNJSGZa
KntOOyY2WCV2bFZ7Cit6OU0/NSt0ZkVCNmhCYCk4NCUkO3ImfTFjQyF8elZaa2c+dWReemU7fVh4
K0JHdHokPUwqWnJ4VHlTbWQ0YUZuOE4KK3omKXl+ZEhPcDdqKjN+enhUR0ZgZyZKNyF6bVRZUmlY
UTliMnkybHd+dUc4Rk5QOEd+bzJaXjxAYmNmYU0kNFFtQgorekA3KT1qZShBRFVfY3E0Tl9XUVNY
WjxBS3JZRUF2UUV8IU1RX3VMVmN4UEhURiEyJCttP3omT1YmVWp1WVg5fjlSCit6I2V9Vzl3el8k
dW9DQ2dgcX1hKygqfi1ZNkE2dkY4bU4xM2pVKjlmIzkoSj9Hd3d4PzUzeSNXNjxyfiZ3e15kTX0K
K3p1VUEhaFluQTh2TW47OXdvaDYrKUp6bmUxWkcxVVMjIS1SNUxJO0xDbk5OaDExOE9+PG9UZ2Ak
RSQ3cGBvXyRQJQorekoxZFJCeDN6VjlpalNPMnlPeXFzJipTP0JEP0RTPCQpUlgjRD1lYFMxXitv
VVJ8PFZ3cEx+MFEoLSFWQl5xc0IhCit6OFdLeWpAN21HWk5qSC1DU3E1Mjt2PjdlfVYmIXV4Wnwj
XmYkR0NvNylyV0I0anUrMjEtZntWN0MrLW05aSlZVSsKK3o+KihsIWNFbWg7byglYEw1LWNDUj95
akN3blB9fGJSTnpBWG49QEs2U0peQH0tcCNxRjRJNVVqWCE2PXU/eD8/aQoreiZDYSN5V04qe0h5
QzF3SztTRDF9LXBBbXJTekYoZlR6U3ZrTXE7Yyt6OEAqcWhwUD8ybzNuR2xvVkVwWF9HUWpuCit6
ZEcxKTI9VXdKQ0pkQGwwYkEzOXhlKTBNRl90JWxSaD9tWEM9UE1tU3UkMTNpa14xO0RfNDMhO3xI
QWA4QEtaa0YKK3pJKGlweFNZRShLWGImbVleSFZlX2M8JHdNPjckblMxTlIzKEZFU3RNO1lDanhG
RCVGMU9XTFExQlhLYExURUNefgorek4lfSZVY3FnRUozZmJNPUxHYXNyTSk/U1IxKzslOG9ybUZW
bU9PQyg5NWV+cnN4bFlCYCVtMjAjTVcoVVk/TUt8Cit6PWliRDlkO3gtbTdBcTUoKTtwTzFjWFd6
UEJ3c0FSR2MzYzkmRyVHX2QyVF52cyV1LSUweCM3WV94fFU9UTlmVnYKK3pvfEBZM0pAcVpgMTcz
P35KV0tZIXh7fno0SStKbzlUIWlnJHpKanJoMTl4Xl5aMk1ga3t8X0ZmSnw3SCVYQzk+PAorenhJ
Y2E8MilzYFAhNnJWeCQ+Jl8/R3k5UHNuRXRXQ3BFa2wkNCtsWDdwVWQzOCU7eX1SUSskZj95amw3
UVdGNk59Cit6dVZTTyhSTUtAfWY8cGchSzREcE18Mk8rPkllczNRWi0hVVcrKXRUPSRDYno3bzAw
UVk8NCZjI2xBZlR7XiVlM20KK3p0O3B2aF5lWHlBakwjX2RXI0NFaDNWZytRLVlrNiNTIWVWIXRh
d3kkK0Mka2VpNml1JT1pfTBHYyVKYmdgVGNvaAoreno4UExxMjJJYkUkS2ppaV5IJD9kcXI4JXlw
d3g5Uy1Rbm9yQEF1MWwwbyokYTxRKWRgWlVjRmIwVHhhOW9GMWBfCit6SWwoTXY7WSZUZldBRUxD
ZVp1JFBXVnRuYDJYJmI5WSE7Zj1sRXR2R3JeOEhHc1YpSzM8YDtYbClaPkIwbnd+JGUKK3opKWo8
RCFrdjZZOF9nX2RJUEZQd0ArTWJsQmo0KVcjaUZTYCp8X0puVGI3dSYxI3FBNzZXPUIpUEw+eGVZ
MkIqQQorekVsbF8odGchWWgqcFdfRWNKfVR9ZVlsY2tGLXVEUkleQCo+WnNvR1hkX2hpQHd9IzlE
TUhnP2Y2ejVQOVlnNjspCit6MEd5RGwmUkc4dTZCK0IpJExefXh1JVR2TSk3fEU0XjBLWm9KX3o+
bFd4S19eRXIxJEt3ZUdEZilwYldzTWNOdnAKK3opPURMelZsXnReSVc7VHdRYmRsIyVaV1FkeXF2
Z2lLKDVNdkwtfT1pMHBFMX5Uez0jTilRPnI9QyFKQlFkVUsjRworelduVmpDZWIofmJoSFEodiZK
YlJ5dmMzPXhpITNldz8tem4jPXlPM1ojd1lncUFWfjgkIXstWDA3USNqYmREOXdVCit6Q2IwdGx2
YWg2JlFHKkJnXjxQRD92el9saDxFUUhIWjAqQyRYIUVjeDdXQzd0ZGI/QTYzQzhtaEYmMCghY2BJ
TSUKK3paOyNFTG9BWEYwVWxhMVk0fVRmRT9VPzwlUHckJlRHenQzfjRJbHFmSHRyUnJJb3t2VGRs
dmZWYEpAV2E5Z3BCOQorekp+USo7eXBpPDdHVVBzLXt2QUJxeTZFR216Sjh9ZjdWRnV5Ni1VNzVw
KGdUNF8hOTZ4ViUqOHNObFlzX2NLaDh8Cit6U3d2c1VCQHNeIzE7TytHI2VUbDNfWkxEbTNFUWdB
e1RmZWIxOUBAbyRhfEpKP31jXzVsPjFfenphd2xZRlpfKzkKK3pwRCE8KntgWmlsXn5nSFV0SiUw
PiloaGQpOUBFPlo3SD9nPU5JV2B5e2MlKHotO3VBYHomRmZtOGR1ZTk8Znxqegorem9EVX1HJUtW
ZjFuZUBKcitZZDVIeXEhczhecGpWRVFTTHtOQFpLU0M5Qmdgej1NNnYyeU80TXVgUCRXPmpMQnBh
Cit6b0RHaEhSYmJnT3ltPTZlZmkyK2g/XzNSQDBsalpyNFcwKUYhMUxmMz9AKE9JdXVndlNZOUw8
RUxHVW0qM0xYUTsKK3p6K3JHNEpPeCZOaSszOHlHYmtfVU5lXkVRRCF9Qm91TGRiX3tDQlNnTjVJ
KGNUQDZrTTlYdGFMZil+SWNhMnk7NAorekMtYThvNXBYNnIzUlp5Q3l5bWVWRVBEPXFhMTZXejQq
ZnB5Y3JubHp4S3YmY2JkdlchZm9icUNJMVV+SVRtRkZqCit6ZkA5eipGIV9nKzZDNEZFZnImcE4t
QEtlPzVTIyZ5Z1hMaUlkRV5USUY+PThuRmE+JmwhclE7VzdWcnIkQHUkY1cKK3pgZ2Zec1VUQm1B
bXgzYztHZFRRYlNBJkN+X1g2KkcwQEw1UzhlOWVreyhfZXJtWFdXJnEjZU5ZNTBDPjZAVj0tPAor
emVpcHYkMF82cnJjdnNiTmFDRDQlMV95VyNSS3EoLXBTTzVWZWkhYFVPZmRhSj5JPHlDTlY/eiVA
N3l+SzQqWk9GCit6P300TT5ZaGMrYGBVZnYkTmBtcTsjZS1sS0kwaU8/djRIKm93dCY2aDVPYFJe
IURBQmNWZWYheEBEdy0jbyhHZnMKK3pZV3BRezYhZDxIPVNVRkQwTFE+YHUlKDJ4dHZyS0MzNztH
VWhydG5XTTRvUzhFZC04Jjd2Kl9NNVdGVk87RyVjKQorekpRYU5pZGVlZzdTI1RKPDFQOzZ7Mm9t
KUZTUSZEX3ZVZ3h4XkNHRGpJMil7ZkMtVnQ3MHYtZCQtaTJIK0lmRlRjCit6bXJWX1VocnpNO1FW
d3QmeWFhbWhxYTNgSFk4WHNfV3dVfnk0TlFaQjszIys7akorUndVWUB9K1VTIXFzRTJJYUcKK3pm
UC1LJU1tKFd8QyYyO215d0dvPVVTYDRuMHFPLXolcTFWLUFVRig7Z1FOMDFrOTh0QTFZUUEkIVJm
cC1ZWVoleAorem11Sm1+NDslb0dmZz85bEs1IUgpPDR3WTI7QjBVbHRPQmNWVlo4KG5maHxJPmZE
Y1RAc2VocV43cl98c0Fle0I5Cit6cXpAKVFrTXxNbzJkbHdCdW13QzAjdWYmX0k1LVQ+aVZePS0+
Sj1QYWdua0JGSzdgJXtONUM8bV5HbmIoWn1MMkUKK3pOZjE8blduZEZuNFdfXldARXx3QDR1Uj8w
UyN0fTBXZXt4bjBNR1RURn5HNzBZeWBub3c5fkpWSzl+Pyg5UiFfVgoremF0LU4mTCpQKmB5YEZq
bSVhWCpLTytOMFZKZk9GTWJ2OzwhTTdfPnw0fiY2QlU/VnNWX0pkPFBzVFZNVGtFM2laCit6ezlw
bmM+MU9RKmRZXz0qZldyc3lnVW97dUpQNEtAQnotVWVKYDFNNzVwV1BaMmFiUmohUmstYTU2WCNt
aTJRKW4KK3o7UGM9WmNvN3RUISlzc31TVD4oeztBfTduUilKJCs2UFB8c3t7c2lXZ1d3PXw2aWpA
WWRJWVAlR2hocE4wWmZEQQorenAhWD17em5PQV88PWA7NTZkVlBVOzVnVUBkWV8+X3ohLVEwdE9r
ZGA3VnNvRWRXMUY2RSN3RUFaQl87R0tTdz0qCit6MTdJV0FAX0cyZEc0UUJfVzhhK3M2V3wlSjhv
VTR3ZkxAJEBmSFQxQUMtOXFxZ0o3LUQhNF99fit6KiFWWVlXSDAKK3oxVUxldyFTak1vUWNzblgz
IzxsNSE0YDElSD5oV017dTFLfjlLaTAwRWc7P3leI18oY01nRzc5Y21obTxxaEp+dworejJmZVJR
dF8xbDRZcnooPDg1e3NwVkEpcTBTNn43aDI5d3xedT0rVEB2NHo5flhNKkVrNXsmJmV7VDU3dWB6
MEphCit6M1hYeTIhMVU5ISYjbVA5WW9yNFhLMHwqM2hya2dxYEV+TXQ4XyZOKEk1LU5YIVE/angy
aC1wZkkxRjleeTx4YGIKK3pCR0xmfHohN2k9akQ0R09mYGoxOTQ8Wmp0Zk81XlM7N3hqUGdFeShh
WXx7SXRQbnxZNlh7dDtvOTsoVGtfRkdwMgorem5tJShDal8tTGc+P0huYHttaXtueCQoPkR7RiRy
WTleRUBfemBOdFV4OEhvNWBQb080VU08MCsyYmtrUGNhP0ZvCit6aDBpbWpIKGlOQk9ZPURuTz1R
YUB3MWEkeHB9a1dHVHRZal89WHEjMTIhVHR8YyRVdmVYcGNzP1M/YHk5SG5QJjYKK3pgRktnYUFB
NC1fYT0ta0A0WWh2YSgzQ1pQKXEkeXp6Ym98PEhHY1ZXS2VwVlR4IWY7WD9vWEAzZ2ZYJSZnV2dr
RAoremdZfC0zbEo5QWdffkFpbDl9X35ZQUIhdzZeezFfbGRNIU44Q1R4aFhKMClGWWVLdnkzJDRp
SyU+REVaUEhJaTw8Cit6S1hfeHcjITAxcTZ8fXRjWW9kYH18TEJjKGA5bjk+X3xNIX0/K0BSJmpf
OTdaMihnRHI8SmVidUJRZmBxIyQlR2sKK3o1bFEzRldhSiNVVlpFUC0pY2ZUJWV5cWs3TmF8Pz56
SHsmYDdDdFZhb3JDNWImIXRfMlJzbGB3S3JWXio4bmtqfgorenpNPEltRX5BWElwKUQ2JGpiQztr
QCZGYUZFP1ZQSEd4ZH1weW9xcFczdlpRI040YFJrQytlP311IzFIQ09CbFJ8Cit6QjRxVkkkITJv
Q3FTVClXMXR9fHstY299NWlNI1otdUxlSm14Um0jQ0RlcSQ/d0FUP1M/OyZaKzE1K1hvbTZ7QEYK
K3orN05EPSZ5KDw5ZmRCSlNSK0c8Pz1+VE9qSCt9YSE7YWszam9oYjZOZDBGa3AqODROLU8tQFc1
Y3FRIUI1bF5ORQorenh1amxaS3BUSi11RzRhOCZxNTI9LSVARExLeSZwY3loJilzXkpzMCpoQztq
eiNGT3s7QUFAJGs8VWlZfFIlWkl0Cit6JTFvY0Nee1hTX0VaQ3pjWSEmUk1rVHRAWjtXWVEmOG8l
c0ZxfUhFI3NEIVJeVX49UlVUbDRoKWBlQFJoX1FMNzIKK3o0TUlPdWF3SD1DJllNaG9ld314dCUw
Mmx3QjVtZSlrN3N5bTtGU2hNakJWPkdfJTZac041WXFfLSNTSlBaS2lGIworekNoRWxxWlhAbWhZ
bmVNVj90I2MhS2VuK3tHfElHOVJIKVMzVmQ1TWs0clo2UkJ5WSF7SnAtKihEQX5MKkNKcyNBCit6
bzVAO3piZDVpZ1FrJCQ5Uz9BeXpnS3YrS1dhVkZrKjJ3ekZqNCRZPnxCSE5SO2RvXnpvRWd2TiMr
d1otNEp7bjYKK3ozZmN1fG4/cT9kTE12eCY3TilnOD4mPkl9TEwxNFc5Zm1mWV8xYUhWcDZIfXco
NV5zUkVpfWB8YHwwOEpRT1d5QgoreiFZV3dMaDB7Njx0dl5Kb0NmKnBkUV94SmBoXik/UTtQc18x
JntuNlp5dEFWMVlCSDV0dDlgfGp6QitwZntoQnI3Cit6X2pDSXlXM188KDg9RGxfVSRDPlRpcTFl
KjhkPkw5Y2grJDRaVEhLenM5cmU/ZUxDdzwpN0F+NVMyakBBJX4yVkAKK3ojfGRqOD80Tn12K3Qq
Tl9sT2xoYz4xO0pvbk52b0lKRFlXQlFzUz1sJVFuISh7SWMhUlpNe1o1PEFnVTYtYkxGTgorejlD
djA4Rn1sM1lBRFVGTXlSYUBkYkJWflNXXlV8ZGVMSERsY31haHVyc1ZjVyFPQ0h6UCkwdDMkWG1x
dndzflRDCit6dE5yOWh7cEpTMDxzUUdlIyF1RUZuOVMhKkl0fGd0cE97RShDWCFiezhrYjIhKjJJ
clZkdUhvJXR2Xy1AJHR7I3UKK3pNe2xqPERiMHRVZzdPQU90X0UpXzxzcXg5M2JwQGdlezYyYSkw
NnkqYkp6UmhiOWFLdmg0UX0mKlcjKlokcz8xQQorenZ6RUE+VT00OWVMZlpUJlg7JUM8LVdrbihE
MzJUYihkdE43Q1d8JHVmMUh5MTUlKzdrPHlsUjZCQndITz4hTEY2Cit6ajF6YXAqe2lgK2JmJVhx
Rno/ak15bn1NZ258TnhkajIyaURafVlzRHptR3BhKHQ3PjZzUCZVMkh5MTg9VHtQMEAKK3pTSmhx
OVQ4d01OSzB6OVooV31BI2tVU2JZJEppVUkzWEhjfUtWOS0zbGcwfU9KQmA2fTdLYFVhRVFJZWZz
UT1RUgorendsKjM7KF5nJDtqalZ7NCVxcENAKXpMYDVuSjhaVHskRG91PT50O19PKndNSVcwTX4q
YERgVDhMOVVDV1dPWnRpCit6S0dPOHB4d142cSs2YzVtNmh8JjstK3BMSWBJKDNCM0wpREU+ekx+
diVgX1EzUTJPZ307KkpzYkEoPzFSKyFaJVkKK3pZNH5pKDxDN258O21ETGI0QEBvamklMlBVWlVi
JCFnKCZCVXBaRih5UUg9RmE4KWZJI3RpODZ7QUQ5fEJTK0lpWQorenFiMlc7Xz1tLSRvN3hBaUJD
MExwQkdNVjtNO3ElOUZQRz9KTiY3NmMjZkQ7T1RjQk9acW90d0V7XiM2eTJjYWRRCit6aDI8VEVi
fGYjfXYoUWZGKE1GKVhvSlR0Y3Q/WFpOKTNedzJYJiZ1MFhyMGkpPjZUNVd6Vm0zYXBeWlUxNmU/
UjQKK3p2QE1yJStxbl9pbkxKdHh2Xz0xIyVpOVpXN319bll5dTs5RHtVfVFfXkZPcjEoQXAobC11
eGVfcjxiN0ZqYWBHdQorekxib3NtZmJnQXpaPUBKc1U1MmojcWMrMVFaOCNsVXswZTtHYT5rKGJ7
eTNYMmlNSSZhU2NvUVJIYjgzfSRNNDh9Cit6IU10S35sRUdFY0UhaX1NWnZlaDAtWHgjc3Y2SnYh
ZmJXfTw5PTVZSCs+Q0opU3NSfCRTN3BtdGl9Xj1DZmFRd2gKK3ptLXBibTc1LX1Zc35DJlYhKylC
ND89OUZCRzEmR2FxdjdBSzI0OS1PTHRZVjlHNUt+djl3Tj5ZZWJ8fWU/fFhmSAorenlVSEomUlB0
WC17RyplU0ZnSnJXTE9HMDx2IXBIMmt9cGd2SU0hPlRqZmtLQWNGJHwoX2RiNWllSkhLR15gKV41
Cit6d3hGazQzckBJWiozfEtqeWVyNTw5aHN8dnw3bUVLcH1qa0l7PmJYNHRvPjIldz96S0ZOT3B9
NW03aWNlXkItNCgKK3o5KzYlclU0U0x9QXozcFhuRVd4VE1DbyR0cU17UW81X2leNXRfSERVPjh7
QUVII1NxWXpiPT89VTlgNSl0Uj59WQorelV8P0s4eyFZbkR3dyglPEU5cUM/USY3Q2p2Qz1vNmtV
e29TZWs1SUdVOSZic2U7PTZncGtHYyZHYj0taCVPJmwyCit6NCpvTHU3aSspTF4/RChEclFSUWts
cTNxPFdHbCZ6KGUxT30hT2JMbVdgSkNoeSgoejBkMEFRb0d9I2xsMGAwZyYKK3olRmIhel4xO2xN
Q1N7Wj4hRG0xNWA7bUt9NVZHLV49ZHF3Pyl8eTNYRW1pSzt0S34hK2hVWWp1X3ZHQD5NPFg+RQor
ekNLOGM2VUxmdnk7ITY5PUNIJippVz1EZGNVST9VbEFWT1BBVE4lQzJ0ZXNocTM3dCNZVkhPVVYy
STNBMjBiNURlCit6XkJlcUZ2JEdMYnlsYDVVbE89fkRrQGNBfSk+QjRGYXxgP0A7czJFSXF5R3h8
RyQ/NiM/RiU/SFBHaHMyTU11NlUKK3pKKz9PMihOVHhtZFR9fDhlIzQ+M01Aay1KWD5XV30mbTtk
TF4zNThFYVQ5NXo1TCZeZXtEaGE2QExPUWc9ZWRNNworejQoPDVsWWBle1pDVk1uUCZ9N1lwQDI2
fkNSKmRPU3ZvLXVoMzRpXipVR0ZDJlVuLX48TGl5QE5VaEQ+Ym17YTYmCit6SFNtI3JwYk9CLWFf
Izs/ZVJlZkEtYDJ1aWMxM2hIdmQmMzwtXlBCZDJzZHJxTmFkX3khSHhlI15DOUp5eXs3WlQKK3p5
SWJOPlpyMFRGZ2w1d1JxXkBTb3omQlBKMVllTUZFfTxvJDlmdjBPYXRZUSM4LWoqO1dHPD00V0B5
S3RlTHlIQworejVCSGl7bTN8PzZSPk9xLWlzflhBLXteYFEtX0tMaEg5e2wySzhoPCE5QUtGLS13
QHJIOF56fTU5UC1vQUFsTkh1Cit6YjRpKlBwPFJHaG92WiV9KXZ4JGxlbmNCeVlvNCErWnVoSERs
ekQzYHNlPWFnIUplTlVXYy15ditYQyVtOXhWOysKK3pMPn0hUnZ8KHRnO0VfdnNrM3pjeXQ9VWt9
SHtpMy1zJX5XTFk4a0U+UHZraUFCNldsfHpfZypLcVcrdHMjPWp7MAoremImV259UGVtUmY+Z08/
WSNYaFN6aGBkXn40WHcyQCgrNlZqcm9HXis1eClJP1NwdHh+ekZ9eSlnK15ARTM7NVAjCit6dHMo
c012LSlWZ3lPcntFIXQpd0QjK0t0KmB1dSlxJjJKQmFrOCZSeFNIOz83YitLX0peM05iXktlODV6
RUgwczQKK3pmYzZadW09TCVtJjJlWmFwcTxGPTJpZGglY0srUSFLUjkxN089Z0MyV0chVmN2LX08
R3dUYlkmSSpva05sJTZgWgoremRiZzlmTX5NNFVwfTQxdndse0dYNSZpXm1XbCF8T3FVaUdFKjde
Z0pOPE4yNEJQfm8jIXo0PSYoPzhDXypEIS1VCit6Q0ZScnAhSDd7R3ZoLX0hZVUxfHVQZXUmPlgk
O3o5P15hIWEreWdrOVdnMyNFNno3RUd0QWFTXmlCcG9CRk1OSW4KK3pDYk1qZyZfTE4tRXc+WSQ9
JVk2SGhHeiFCSm5uUColTFheaW5mNXdEeXB6UGtHJkw3UCkqRkkkMCRRYXxLSGBfSAorenIkVTgo
NjhjJV93PCl+fEl3V3REZjB2PXQtQnNAaGh3VHJTMilqYnFfYXV6ViUrdUpGQ3c+ey1CfU4pYHQr
b1E9Cit6QkR8K3lZYCFMY2JXK0o5bGwtd3N5WnJPbW1PTkY8UT1kTFh7K1o1bD9MeGFRVDJkaj1I
ZlhkPiteXisreGReeVoKK3pMaVRGTmVjVjY1e1lwWiViS2pgM3M+cz9pPGE1QHExO0ghRCN7TyNC
N0JlSEtaUnd8Q20lSSRgPTxGYlBnOE5XXgorenZpeyp1KiUzPVdHQSQ8VUpjR1VSPk4hRjFBR3pf
M3RgTihfY0R2UDR5cGMwa21AYz4/WVYwNVFycDxsaD5GZyhkCit6S2s/czhJQDB6aEIhQmJSeU9h
RnNDR0BrPCZwPT05aEBnITVtIVcmKj9DcHNeQ0VMYkBZKlUkQUQ7WnF7SlpXcDkKK3pBfWZKfGBy
c3tge3BXckhTei0mXlR+SEskZHkleXRTPzdgVXJANlcpdE4qZmwwUUR8aypZPlghI3NfdT1TJmZf
dgorel8lK0VGNFd2MzV5fCY3cSQ9Wk5uRUZvU0NwVWNGUnZqal9ZOUE5R31YTFRVeXJWSUEhPHgh
Jj4kcXUmS3kzbX13Cit6LXJBbmM3I0l9YF8kXm1TbCZoUmkzUipkfDhYPklBb3I4S0B4Ni0mcmlR
RClGOy0tanlpbndYd3sha1BecTRzVWEKK3p0Wm1sJWdRYnl3RE9qU18oVU43OHtpQ0hVMn0qWkAl
WlhhQGNRPGxaMyp7Y0FoKDI1TmUmJigtITFfJVg2P2UlIworelZgN35kZHJmTFBrfGwyb0BuJHZ6
ITU2c35gLTs3Py1PallFaFAwcFhxbEV1WiFnSmJlUzdzVnI4NU9tdmI4MmxnCit6KCZYLTg+RSR6
bWpNYFA0enJuNjhTb1VtTlp1R3x8bTMlenZVenZwMGkhR3dWWUBaSEJ3bkEreVNSdTkxa311dnMK
K3o/Nm4jak1fQS11VnRidD1SbUomfT5HdVl+SCopKUtwKW49dipmMDg+VG01dk0tQGx5cz51dzB1
ZSYtckx5fjZLYgorejNFP0F0MyNOTzRGO3syKHxEPWBONT9KM19jME0ldllnZWU+JGVjZSkrJjFF
fSVyVGVIVVdTJj1xZ3tjdkFLQ3spCit6QHVxVnw8ezQ7YT90bWA1Rj0he0NCXyFWY2Vwd1AmMVpA
PFcpUEpiWDMpdjhCe3A0MV5uSHMzYEpNcTt2N24mZVUKK3plSTc+VVlzbWJrSHpHNkw/KVRGd2xq
ezcjT2UySFRVd1g2T3pYSGslRDRVXmRAWURBZU9pUmppblkwRygzbz9FUQorejhKcDgkKUNWK1U+
JENySUIrYClHMmtneW11bkdTbjsqSnhTPCU3OXwpKHw4QSg1NzNHc2s8JUV1MFdHdkRWTX1jCit6
JDU/TkRnITNYbztGN1J8Rn5Yb2RFKEU7aDV1NnZZUExaJTchVlZKbHMwKDl2UU5sI2xeTXFYP0VT
JTtqdzlDKygKK3otVnFydUxtUCo3bHpTdXBAdklFKkNkU2QkLTFXPjFYbFpFU0syIzJFS1EhbWQ1
eEdtRF4rUExeP2BGYS01JXhLaworejx8bmRnX0tOKEwrPFlIfm1WJC19WEQldDxGXzh9flQraFNN
NCg5UW1mO0lybil2NTVGaGp0e3lEYEEoUTlmYy0mCit6Y1VMMWZsUnJRYEwqRnJwaHBoaDAmTz0h
cCgmJiN6QXxFTkpFQGFoREowaGJBY19YY3FafU5vbFItKzFqPTZCeFoKK3pyPFlzWnV3MStKTSEh
V2l3NjJ9KigxRlFQenEyOFZBek92am5ZUnwoOUZeUXt4UTFSSS0zQzIqNFNpRnohfHo8fgorenI/
PmM+SE59ISM4U09NRj8pRSFaVy1eTS1EeEFUWkRDO1Fec1VeRDg/QU9ZOXg5OGlrWVl9T0t7bXst
cD56OWZ7Cit6SjQ5TStBQ2Q3Vz1pd15hZ1ckaFFTYXhubVZqNCFpayhtKGVwNjRtemp1Q2YyPDEp
YFlzTUVhfUx2cDZCeGBUN3AKK3puUSllQTM/a18jYSMqNjRGcXpsOXQkdnglWDdKRGdQMFJ6aVZ0
bVM+WkdwQn0yeGN4NWs1UFRKIURpV3YkNDI3eAoremhoI35nWWt+Rnp2YCt7aGxURnp3ZjExJHlw
LTxsdCp1OEJnQjF1PjNXRHQ1U2JUYllwX2txWnJyWUk4akVNWDBWCit6blk5NF5xKmhIRXZVaTRt
VExfYzczKUwzfjRYfVVveW9ibWJDdGUleiUkUEZySVRRaDFAKzQ7cUl8KHkkMHcpUn0KK3o4OVF3
QF5nLXhlPylXRykqUjRaKWVZcyUyV2YzTG1yOyUwTDgzWj9wYTJER1B2VT87MFZsTnlhdGVMT3s1
QHp6WQoremk0dC1NaUt+eyt2eXdsO2U7QD9Mc3JwU0NHa3owQiVZaUFmZ0B6fGIyMWVMZEFfcHpG
V1Z+TlNqQFFONnpzWD5zCit6QHMxb2wmczU5IXtORHgzVn40dnJZZzBSeWA3cCY8SF5obSYkTVZs
RSklKD93Wmk7eCNvWURNNnJUYVljJHt6QFYKK3paSVVodmtwcDVYYVJQfChONiphbW8wb31+Q1o0
cGh0PUR5I0tJTzN9P0pXPXs/SjxrNntzTGhsV35xRU17RDJTJgorem0wUStpKmo3MWZ2WENFZUtt
MkVxZX4wa1gtPXhEMExjMHROSC0pKWBie3Z8d0o0PnRKQGclaEEmYGpEe1RpVU1hCit6UDw2VVVH
ckpLWUwoWj9KaCMjS1FVVzMqVCZEbEZyclpOVzVMMV9RTmVXO0lOPCpJTWFecyZlditmcnBiYWMx
bygKK3o9X0tKXylXZG1LO3BiWSFyd3YqUUgwUzNEYDx9dzwkdlpSSXR9JG10aj1eXm56TUc5Q2Al
bHQxMGV1KnspUHIweQorenVGZ09ePipCS0JJZUA3O3ReTmgkN2tRYm1GfmFWWCRrfSRIdUdCQldH
fTE/YkN9aFRNQ2VEQSFkdSVAUVZ7Wl9BCit6UihTTDR4akI+Skl5ezN+PHlMMWohP3kqIyNrbzJv
eU8kSW1XN1FGU29keERQWUJmbyskQn51bjN4YT07SmRwb3oKK3p7aklfOCh2OUU2YHQ2SzJoPjA9
I1NSWjlZbDZ9blZYPFJ8KDEhUFZhbk9zfT0kbDJvYSg3cX4hQkswSkAzXl42RworekQjfTVmQCll
PH5XMHdkQCphdTBmUWtOO0BtK3hXeXIqI3JPWXNOd3xAfG0jeiRlZ2dUZGlna2YpcTdSOU9Xd0Zk
Cit6cEY5dH04VCFMUSRnM0FVQlNNOSZqR3slZ1pQQGJWcDYmcz9LRlo5MW1nTj85OFNtMz8hNEhv
LT19K2s5b1A3WSUKK3o5VGdnRz0wSihWQ0hiZ0BKYENUd1R6eSlvdD9Pfj9NN35xN3ZDUj02USVf
SGJ5b1khdmZGekpEbWxAaitYVWI5PQoreiNheiQ9dFRibnomY2ImRXpHfnEhYjJNRm5gQ31zYGwo
Qk0mQFJ8RkE7NFRVMD57WWxRLVMwJDY3PztkOWF5R255Cit6YDBZWDxBTD1LXyZVPEVFLTV9Pikq
WlM0RjMtdz8jdWVLcDRqVH5vQmgmVU8/YD1OSjJyej44K3VHaGZ6OG58OHEKK3oqSzZRPDRQMzgq
Pm94SEllR01lPHdwQ0UzbUBxfmRjMnZzSnRNeGZ5NHFRUVJ2R2g/NUFKRkdQNElsckc0SWxhZwor
eml2IypSZSRxYXQ2X2JCeHBUfmRTcUIjSzA/TVJ6Xzl7aXw9PitgXzxgbj1WbXJfWUhOclIjSHg9
NjkmdSh2JGpKCit6dDxUQ2A2YjZRRVEyT15RNHU4d3l6ekpwZncjNzJkLSsoQCt3SHpeeEtkJEA8
bURscFMlQlJAIW9QOGNxZXFMb3wKK3p1NXNufXdCRktBcDdLPnx7QmcmeF4zNTA3a1p8Y35TQGZ7
WmBrMktRI1NYPWtWeioraTsobzxfaWJoQyplKitwbQorej4jSjcmQSRAKlNhY31+RG0rc0ZWdyl7
VTx7MC0lTS0rb0lra2hDRV5yU1pQNV8pVyN7RDJeejhQak9WeSRAfU8pCit6VmZuMlo7az8kTGl8
XjMqZXQ3dSVKYjVsJHlRejF2TlZ1JFg8b1ojT0BJeUEoeUhYX2xReU59WUI+JFpueztOZzgKK3p5
RUpAR2sjSFM4LWh2fEd5T2pUcUJIe0hLLWNUZ2AwUyYqbU5jZTZJY2x8KmhHdGlAVmYySTg7elpM
Z3RgMVRfNQorelljemFVaz9gZGp7JjExLUl0QFFtQj5iUjs0O0JmM092QXJXQiltYnhgQGZRM0c4
PHQwWmA/a3N7UTBwQ0VDMDhQCit6Z3M7LUBuO3g7OGBUVVArX3trI3FZdC07bE1aKHU8X31MPWlj
V1VAO01iaUlfaFd8fHd7dFgmRnhke0khSFQpbG8KK3pARV82ZVNCdng/diRzWl4lZ1VjJEtUWFEt
XmozY09YRXBxX0JLKDZJZXh2Mzs/NHl2TlBpWGlyNiQkXmVoRU0lPworejtyOUV1aFFDdzheKVVu
WT0tcXBaZ2IhJT1PK35eVjNEfXE1RHlFK3cpXkhWNTZoNSFAfDRCe2Z1d3R7O28xMzNMCit6cXg4
b1dLZDFQRjtgYkRQTC05OGl6cFZIeGliSU5EUmVXMFU+eHdzT3kzZ3dLdy1rUkBAakhxcTZeajsz
MUtqLWYKK3pNO2hQaGkoK351VSo0eStlIWk+eHJ4a35rbyomPU0yZ1VTR2V0Yjg2fDVXRj5LVWUl
SyNlWXpve3c+P2p7I35FbAorenl5KWByUT44b2taYW4wcD4ofHBZVilLWFdqWFFnbitITl8xUztO
UEZlM1FCMz0jYVVAWERYTjNRdnxQUXhjRWAhCit6YV5lNXlZUzFtdU18RUpgQVAteXZAMzEoPGZf
SiNZLWp3UnxDb358YyYmRFVxejF5byR2WnJpYilvVjY/WnYxd3QKK3pBbzFKRUhQd1JtOT53dHJk
KmtSc1QyUG5vPGh5TTYrY2RzUXBKT0JEYWBBcjM+c0V6OFo1aCY0ZU5MITZoTXg7SgoremVCPTVZ
UUd4JVYmKStxbnp4YVB1S2U2P2FGWnF6Ul9taGZHRD9YPXFUSmFedFJ9XjFXb0tqXmF6RlRwdzsk
cD0qCit6I20kTnhpaEMzZkRMJCRBd0JtRCRyeGptUGRgMG45I1ZObjg9X300dlQmITU5eExMNzdh
Z1g5NSNVflk/Uih3d0oKK3p3QmsjT3VQREIlSUF3e1p1USpxNnYwfE8jWDJsTjBKJksxRXBIekhX
QGoxb1FpWjNhP3FXRyVmbC1vNloja3E9JAorejczJmw/RHxSVUVROVB2aHF+Zzx4Jm5jYyhkYGE7
WSNhOSlsJFl2cWV5QXxndUU+XjVsK15wRTR4SlU3ajsqKkxgCit6RD9YPXFUSmFedFJ9XjFXb1Ul
O1FTRGRUM1NnfXJWdnRvemg5PnFoN1BieG1HXz8rVHQjZ2BPY1FHOFcjJTctPDUKK3oja3E9JDcz
Jmw/RHxSU2F1REFZdzhuMDg5M3dgNkVUTE1BM0NRVU5DJG84U1l8RzdGfUJeMnxjSUs4PTQhPTJv
WgorejZxKDsjXz5VZlBjbGk9P3BQaztuTCo9e1ltSE88YFpee2NfbGxPZFFrPn1qaHU2PVVwLUlk
M21GYU4mMEBhPWllCit6VTN0JmxkQ3pAJCZreU55ZXZhSXtePkdiJXdLJH5mak53MUM5RkZlaG58
d0pGSnY7dG4jUCp2XmQ8fUBydT1Kc2cKK3ptYXpDazlsemRzWWdQTj0jVHw+PEtHZVFfKFlEcigr
Wkp4YCp3KFNRc3g3Zi1WV0swXitQPTg1dChgYTFpbVlWbgoreik0UlJPbz0kbGNYWGBldigqNnZV
U0lHfXZ3XiFDSVUmVWA3P2EoS0EmRnI/bXUyZnNSdElhZE5oOU4mPDs4bkttCit6K3JfVTtUSUB4
YiNNN1ReJCQ4akgqeldkSnQxIyRZSUBLI2xjSlpJdiR7cFJAJFp6I3tsXnN4dClYZ3Rvd1IpQjkK
K3pvbSlIandaSGJRb294dGxQbkxDUz4rYXBIYHooak03Y05OKTBWWkZxSkctYFhWYE9kUHJ2QGFD
VFRMRENkUHVpSworeiZzNlBPeGUrQEBURUxCaUQhcCt5RF5JOXZTNFMzZU1Rajx6LT1zR1ZWPWtp
TjxoPHZiY248VVREITs/b2RHWWk0Cit6N1pMc3t3djA+UCo/U0h6RFpkK3NgVGJlY3F0dD1wY2xN
d3xgTSREVFZpcm8tOXNmKXJhKX0+NiMrMmlDX043Qi0KK3pQZkE/NV42Tzk1JHpyUUhlcktPS3lq
ZEFze3hrODZHfCMmaTZ4K3x5byZEITl0P31+bnVWaGMkbVF0c1YtYFMlTQorem9qdk4oJm82KGtA
LUo2YCZjMWMlPnx4PTU1MSlNZ04xI2EmKSRJMSVkY2RMWmdzPVNlLSQhN1dLZHBBNiE7QXMwCit6
TGR4PitVX1FVam11V0BVJmRRZF96Ymw5TWFsK3tqRHhickBtNnYjaEV8PE98ZVN3PVd6Z3p6fWJu
NV5ZS2ZuQjYKK3pSRFJjZjFHO3s0XzxyWXpRMntZME5ieEM5KHMlcXItP3NVNkREUmRIVS17e09p
QC0ye2A1IygtaGE8WSlhV2VBNgoremQ0RThGJiZTUDZab04xRFY9RV49ekklNH49a1VIZyNQOE9G
U0tjODE1OCMhUVQ+OVNsTyswYiZlRk00N2tLVU8oCit6YCE1IXttKXBQUkJZb0hMeUxDXzFQYnxO
eVNsN1FAekZqeyEzfnhBbngxT3ckbSF4cj5hZX5jTGNLa1J3S1pHOVUKK3pfdFp7dkUheWNDUnsz
TCE0KnIhSms+ISNaKER9TUVWajBLWT4wKC1wPHZ4MTwjPFB8KkMmY2xLZWh5I3h7VTxsPworbSpf
ZypQe1lpUGteQiVKZCpZQj5eITFXcnFVSVcpXztDYztRdVlxNCE0ZzViQ2pScHxfCisKK2xpdGVy
YWwgMAorSGNtVj9kMDAwMDEKKworZGlmZiAtLWdpdCBhL3Rlc3RpbmcvdGVzdHMvdGVzdF9kaXJ0
cmF2ZXJzYWwucHkgYi90ZXN0aW5nL3Rlc3RzL3Rlc3RfZGlydHJhdmVyc2FsLnB5CituZXcgZmls
ZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uZGMzNzFkNQorLS0tIC9kZXYvbnVsbAorKysr
IGIvdGVzdGluZy90ZXN0cy90ZXN0X2RpcnRyYXZlcnNhbC5weQorQEAgLTAsMCArMSwzMSBAQAor
K2ltcG9ydCBvcworK2ltcG9ydCBiaW53YWxrCisrZnJvbSBub3NlLnRvb2xzIGltcG9ydCBlcV8s
IG9rXworKworK2RlZiB0ZXN0X2RpcnRyYXZlcnNhbCgpOgorKyAgICAnJycKKysgICAgVGVzdDog
T3BlbiBkaXJ0cmF2ZXJzYWwudGFyLCBzY2FuIGZvciBzaWduYXR1cmVzLgorKyAgICBWZXJpZnkg
dGhhdCBkYW5nZXJvdXMgc3ltbGlua3MgaGF2ZSBiZWVuIHNhbml0aXplZC4KKysgICAgJycnCisr
ICAgIGJhZF9zeW1saW5rX2ZpbGVfbGlzdCA9IFsnZm9vJywgJ2JhcicsICdmb28yJywgJ2JhcjIn
XQorKyAgICBnb29kX3N5bWxpbmtfZmlsZV9saXN0ID0gWydSRUFETUVfbGluaycsICdSRUFETUUy
X2xpbmsnXQorKworKyAgICBpbnB1dF92ZWN0b3JfZmlsZSA9IG9zLnBhdGguam9pbihvcy5wYXRo
LmRpcm5hbWUoX19maWxlX18pLAorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiaW5wdXQtdmVjdG9ycyIsCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJkaXJ0cmF2ZXJzYWwudGFyIikKKysKKysgICAgc2Nhbl9yZXN1bHQgPSBiaW53YWxrLnNjYW4o
aW5wdXRfdmVjdG9yX2ZpbGUsCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpZ25h
dHVyZT1UcnVlLAorKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHRyYWN0PVRydWUs
CisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHF1aWV0PVRydWUpCisrCisrICAgICMg
VGVzdCBudW1iZXIgb2YgbW9kdWxlcyB1c2VkCisrICAgIGVxXyhsZW4oc2Nhbl9yZXN1bHQpLCAx
KQorKworKyAgICAjIE1ha2Ugc3VyZSB0aGUgYmFkIHN5bWxpbmtzIGhhdmUgYmVlbiBzYW5pdGl6
ZWQgYW5kIHRoZQorKyAgICAjIGdvb2Qgc3ltbGlua3MgaGF2ZSBub3QgYmVlbiBzYW5pdGl6ZWQu
CisrICAgIGZvciByZXN1bHQgaW4gc2Nhbl9yZXN1bHRbMF0ucmVzdWx0czoKKysgICAgICAgIGlm
IHJlc3VsdC5maWxlLm5hbWUgaW4gYmFkX3N5bWxpbmtfZmlsZV9saXN0OgorKyAgICAgICAgICAg
IGFzc2VydF9lcXVhbChvcy5wYXRoLnJlYWxwYXRoKHJlc3VsdC5maWxlLnBhdGgpLCBvcy5kZXZu
dWxsKQorKyAgICAgICAgZWxpZiByZXN1bHQuZmlsZS5uYW1lIGluIGdvb2Rfc3ltbGlua19maWxl
X2xpc3Q6CisrICAgICAgICAgICAgYXNzZXJ0X25vdF9lcXVhbChvcy5wYXRoLnJlYWxwYXRoKHJl
c3VsdC5maWxlLnBhdGgpLCBvcy5kZXZudWxsKQorZGlmZiAtLWdpdCBhL3Rlc3RpbmcvdGVzdHMv
dGVzdF9maXJtd2FyZV96aXAucHkgYi90ZXN0aW5nL3Rlc3RzL3Rlc3RfZmlybXdhcmVfemlwLnB5
CitpbmRleCA2OWQxMTMzLi41OGI0ODZjIDEwMDY0NAorLS0tIGEvdGVzdGluZy90ZXN0cy90ZXN0
X2Zpcm13YXJlX3ppcC5weQorKysrIGIvdGVzdGluZy90ZXN0cy90ZXN0X2Zpcm13YXJlX3ppcC5w
eQorQEAgLTEwLDggKzEwLDYgQEAgZGVmIHRlc3RfZmlybXdhcmVfemlwKCk6CisgICAgICcnJwor
ICAgICBleHBlY3RlZF9yZXN1bHRzID0gWworIAlbMCwgJ1ppcCBhcmNoaXZlIGRhdGEsIGF0IGxl
YXN0IHYxLjAgdG8gZXh0cmFjdCwgbmFtZTogZGlyNjU1X3JldkJfRldfMjAzTkEvJ10sCistCVs1
MSwgJ1ppcCBhcmNoaXZlIGRhdGEsIGF0IGxlYXN0IHYyLjAgdG8gZXh0cmFjdCwgY29tcHJlc3Nl
ZCBzaXplOiA2Mzk1ODY4LCB1bmNvbXByZXNzZWQgc2l6ZTogNjQyMjU1NCwgbmFtZTogZGlyNjU1
X3JldkJfRldfMjAzTkEvRElSNjU1QjFfRlcyMDNOQUIwMi5iaW4nXSwKKy0JWzYzOTU5OTMsICda
aXAgYXJjaGl2ZSBkYXRhLCBhdCBsZWFzdCB2Mi4wIHRvIGV4dHJhY3QsIGNvbXByZXNzZWQgc2l6
ZTogMTQyNDMsIHVuY29tcHJlc3NlZCBzaXplOiA2MTQ0MCwgbmFtZTogZGlyNjU1X3JldkJfRldf
MjAzTkEvZGlyNjU1X3JldkJfcmVsZWFzZV9ub3Rlc18yMDNOQS5kb2MnXSwKKyAJWzY0MTA1ODEs
ICdFbmQgb2YgWmlwIGFyY2hpdmUsIGZvb3RlciBsZW5ndGg6IDIyJ10sCisgCisgICAgIF0KZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlu
d2Fsay8wMDM0LVVwZGF0ZWQtUkVBRE1FLm1kLXRvLWluY2x1ZGUtZXh0cmFjdGlvbi1zZWN1cml0
eS1ub3QucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJpbndhbGsvMDAzNC1VcGRhdGVkLVJFQURNRS5tZC10by1pbmNsdWRlLWV4dHJhY3Rpb24tc2Vj
dXJpdHktbm90LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uMzM0
NGUzM2I0Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzQtVXBkYXRlZC1SRUFETUUubWQtdG8taW5jbHVkZS1l
eHRyYWN0aW9uLXNlY3VyaXR5LW5vdC5wYXRjaApAQCAtMCwwICsxLDQ1IEBACitGcm9tIDVmZWYy
ODc3Y2Q5N2NkNzQ5MDQ4NDFiMGExMzAwMjBlYmY3MzcyZGEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBkZXZ0dHlzMCA8Y2hlZmZuZXJAcmVmaXJtbGFicy5jb20+CitEYXRlOiBTdW4s
IDUgU2VwIDIwMjEgMDg6NTQ6NTEgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gVXBkYXRlZCBSRUFE
TUUubWQgdG8gaW5jbHVkZSBleHRyYWN0aW9uIHNlY3VyaXR5IG5vdGljZS4KKworLS0tCisgUkVB
RE1FLm1kIHwgNyArKysrKysrCisgc2V0dXAucHkgIHwgMiArLQorIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9SRUFETUUubWQg
Yi9SRUFETUUubWQKK2luZGV4IDU1MTkwYjcuLmNiYTVjNGMgMTAwNjQ0CistLS0gYS9SRUFETUUu
bWQKKysrKyBiL1JFQURNRS5tZAorQEAgLTcsMTAgKzcsMTcgQEAKKyAKKyBCaW53YWxrIGlzIGEg
ZmFzdCwgZWFzeSB0byB1c2UgdG9vbCBmb3IgYW5hbHl6aW5nLCByZXZlcnNlIGVuZ2luZWVyaW5n
LCBhbmQgZXh0cmFjdGluZyBmaXJtd2FyZSBpbWFnZXMuCisgCisrCisrIyMjICoqKiBFeHRyYWN0
aW9uIFNlY3VyaXR5IE5vdGljZSAqKioKKysKKytQcmlvciB0byBCaW53YWxrIHYyLjMuMywgZXh0
cmFjdGVkIGFyY2hpdmVzIGNvdWxkIGNyZWF0ZSBzeW1saW5rcyB3aGljaCBwb2ludCBhbnl3aGVy
ZSBvbiB0aGUgZmlsZSBzeXN0ZW0sIHBvdGVudGlhbGx5IHJlc3VsdGluZyBpbiBhIGRpcmVjdG9y
eSB0cmF2ZXJzYWwgYXR0YWNrIGlmIHN1YnNlcXVlbnQgZXh0cmFjdGlvbiB1dGlsdGllcyBibGlu
ZGx5IGZvbGxvdyB0aGVzZSBzeW1saW5rcy4gTW9yZSBnZW5lcmljYWxseSwgQmlud2FsayBtYWtl
cyB1c2Ugb2YgbWFueSB0aGlyZC1wYXJ0eSBleHRyYWN0aW9uIHV0aWx0aWVzIHdoaWNoIG1heSBo
YXZlIHVucGF0Y2hlZCBzZWN1cml0eSBpc3N1ZXM7IEJpbndhbGsgdjIuMy4zIGFuZCBsYXRlciBh
bGxvd3MgZXh0ZXJuYWwgZXh0cmFjdGlvbiB0b29scyB0byBiZSBydW4gYXMgYW4gdW5wcml2aWxl
Z2VkIHVzZXIgdXNpbmcgdGhlIGBydW4tYXNgIGNvbW1hbmQgbGluZSBvcHRpb24gKHRoaXMgcmVx
dWlyZXMgQmlud2FsayBpdHNlbGYgdG8gYmUgcnVuIHdpdGggcm9vdCBwcml2aWxlZ2VzKS4gQWRk
aXRpb25hbGx5LCBCaW53YWxrIHYyLjMuMyBhbmQgbGF0ZXIgd2lsbCByZWZ1c2UgdG8gcGVyZm9y
bSBleHRyYWN0aW9uIGFzIHJvb3QgdW5sZXNzIGAtLXJ1bi1hcz1yb290YCBpcyBzcGVjaWZpZWQu
CisrCisrCisgIyMjICoqKiBQeXRob24gMi43IERlcHJlY2F0aW9uIE5vdGljZSAqKioKKyAKKyBF
dmVuIHRob3VnaCBtYW55IG1ham9yIExpbnV4IGRpc3Ryb3MgYXJlIHN0aWxsIHNoaXBwaW5nIFB5
dGhvbiAyLjcgYXMgdGhlIGRlZmF1bHQgaW50ZXJwcmV0ZXIgaW4gdGhlaXIgY3VycmVudGx5IHN0
YWJsZSByZWxlYXNlLCB3ZSBhcmUgbWFraW5nIHRoZSBkaWZmaWN1bHQgZGVjaXNpb24gdG8gbW92
ZSBiaW53YWxrIHN1cHBvcnQgZXhjbHVzaXZlbHkgdG8gUHl0aG9uIDMuIFRoaXMgaXMgbGlrZWx5
IHRvIG1ha2UgbWFueSB1cHNldCBhbmQgb3RoZXJzIHJlam9pY2UuIElmIHlvdSBuZWVkIHRvIGlu
c3RhbGwgYmlud2FsayBpbnRvIGEgUHl0aG9uIDIuNyBlbnZpcm9ubWVudCB3ZSB3aWxsIGJlIGNy
ZWF0aW5nIGEgdGFnIGBweXRob24yN2AgdGhhdCB3aWxsIGJlIGEgc25hcHNob3Qgb2YgYG1hc3Rl
cmAgYmVmb3JlIGFsbCBvZiB0aGVzZSBtYWpvciBjaGFuZ2VzIGFyZSBtYWRlLiBUaGFuayB5b3Ug
Zm9yIGJlaW5nIHBhdGllbnQgd2l0aCB1cyB0aHJvdWdoIHRoaXMgdHJhbnNpdGlvbiBwcm9jZXNz
LgorIAorKworICMjIyBJbnN0YWxsYXRpb24gYW5kIFVzYWdlCisgCisgKiBbSW5zdGFsbGF0aW9u
XSguL0lOU1RBTEwubWQpCitkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQoraW5kZXgg
OWI5ZjZjZC4uMWM2YTU1NSAxMDA3NTUKKy0tLSBhL3NldHVwLnB5CisrKysgYi9zZXR1cC5weQor
QEAgLTEyLDcgKzEyLDcgQEAgZXhjZXB0IEltcG9ydEVycm9yOgorIGZyb20gZGlzdHV0aWxzLmRp
cl91dGlsIGltcG9ydCByZW1vdmVfdHJlZQorIAorIE1PRFVMRV9OQU1FID0gImJpbndhbGsiCist
TU9EVUxFX1ZFUlNJT04gPSAiMi4zLjIiCisrTU9EVUxFX1ZFUlNJT04gPSAiMi4zLjMiCisgU0NS
SVBUX05BTUUgPSBNT0RVTEVfTkFNRQorIE1PRFVMRV9ESVJFQ1RPUlkgPSBvcy5wYXRoLmRpcm5h
bWUob3MucGF0aC5yZWFscGF0aChfX2ZpbGVfXykpCisgCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzNS1GaXhlZC1kaXJ0
cmF2ZXJzYWwtdGVzdC11cGRhdGVkLWV4dHJhY3Rvci10by1ub3QtZm9yLnBhdGNoIGIvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzUtRml4ZWQt
ZGlydHJhdmVyc2FsLXRlc3QtdXBkYXRlZC1leHRyYWN0b3ItdG8tbm90LWZvci5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjg3ZjQyYzcyNQotLS0gL2Rldi9udWxs
CisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fs
ay8wMDM1LUZpeGVkLWRpcnRyYXZlcnNhbC10ZXN0LXVwZGF0ZWQtZXh0cmFjdG9yLXRvLW5vdC1m
b3IucGF0Y2gKQEAgLTAsMCArMSwxNTIgQEAKK0Zyb20gYjlhNDYyMDdkNzc1MGVmOTRmOGU2Yzhj
YzE5MGY0NmQxZjU0ZGZmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRldnR0eXMw
IDxjaGVmZm5lckByZWZpcm1sYWJzLmNvbT4KK0RhdGU6IE1vbiwgNiBTZXAgMjAyMSAwNzoyNzo0
MyAtMDcwMAorU3ViamVjdDogW1BBVENIXSBGaXhlZCBkaXJ0cmF2ZXJzYWwgdGVzdDsgdXBkYXRl
ZCBleHRyYWN0b3IgdG8gbm90IGZvcmsgdW5sZXNzCisgbmVjZXNzYXJ5IChub3NlIHRlc3RzIGRv
bid0IGxpa2Ugc3lzLmV4aXQpCisKKy0tLQorIHNyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9y
LnB5ICAgfCA1MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KKyB0ZXN0aW5nL3Rlc3Rz
L3Rlc3RfZGlydHJhdmVyc2FsLnB5IHwgMjYgKysrKysrKystLS0tLS0tCisgMiBmaWxlcyBjaGFu
Z2VkLCA0NyBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3Ny
Yy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5IGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRy
YWN0b3IucHkKK2luZGV4IDk3MTc0ZWIuLjExZWFiMGQgMTAwNjQ0CistLS0gYS9zcmMvYmlud2Fs
ay9tb2R1bGVzL2V4dHJhY3Rvci5weQorKysrIGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0
b3IucHkKK0BAIC0yOTUsNyArMjk1LDcgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAg
ICAgICAgICAgICAgICAgICAjIG9uZSB3ZSBqdXN0IGRkJ2QKKyAgICAgICAgICAgICAgICAgICAg
IGlmIGZpbGVfcGF0aCAhPSBkZF9maWxlX3BhdGg6CisgICAgICAgICAgICAgICAgICAgICAgICAg
IyBTeW1saW5rcyBjYW4gY2F1c2Ugc2VjdXJpdHkgaXNzdWVzIGlmIHRoZXkgcG9pbnQgb3V0c2lk
ZSB0aGUgZXh0cmFjdGlvbiBkaXJlY3RvcnkuCistICAgICAgICAgICAgICAgICAgICAgICAgc2Vs
Zi5zeW1saW5rX3Nhbml0aXplcihmaWxlX3BhdGgpCisrICAgICAgICAgICAgICAgICAgICAgICAg
c2VsZi5zeW1saW5rX3Nhbml0aXplcihmaWxlX3BhdGgsIGV4dHJhY3Rpb25fZGlyZWN0b3J5KQor
IAorICAgICAgICAgICAgICAgICAgICAgICAgICMgSWYgdGhpcyBpcyBhIGRpcmVjdG9yeSBhbmQg
d2UgYXJlIHN1cHBvc2VkIHRvIHByb2Nlc3MgZGlyZWN0b3JpZXMgZm9yIHRoaXMgZXh0cmFjdG9y
LAorICAgICAgICAgICAgICAgICAgICAgICAgICMgdGhlbiBhZGQgYWxsIGZpbGVzIHVuZGVyIHRo
YXQgZGlyZWN0b3J5IHRvIHRoZQorQEAgLTMwMyw3ICszMDMsNyBAQCBjbGFzcyBFeHRyYWN0b3Io
TW9kdWxlKToKKyAgICAgICAgICAgICAgICAgICAgICAgICBpZiBvcy5wYXRoLmlzZGlyKGZpbGVf
cGF0aCk6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciByb290LCBkaXJzLCBmaWxl
cyBpbiBvcy53YWxrKGZpbGVfcGF0aCk6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAjIFN5bWxpbmtzIGNhbiBjYXVzZSBzZWN1cml0eSBpc3N1ZXMgaWYgdGhleSBwb2ludCBvdXRz
aWRlIHRoZSBleHRyYWN0aW9uIGRpcmVjdG9yeS4KKy0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNlbGYuc3ltbGlua19zYW5pdGl6ZXIoW29zLnBhdGguam9pbihyb290LCB4KSBmb3Ig
eCBpbiBkaXJzK2ZpbGVzXSkKKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGYu
c3ltbGlua19zYW5pdGl6ZXIoW29zLnBhdGguam9pbihyb290LCB4KSBmb3IgeCBpbiBkaXJzK2Zp
bGVzXSwgZXh0cmFjdGlvbl9kaXJlY3RvcnkpCisgCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmb3IgZiBpbiBmaWxlczoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmdWxsX3BhdGggPSBvcy5wYXRoLmpvaW4ocm9vdCwgZikKK0BAIC05NDksMjkgKzk0OSw0
MyBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgIHJldHVybiAocmV0dmFsLCAn
JiYnLmpvaW4oY29tbWFuZF9saXN0KSkKKyAKKyAgICAgZGVmIHNoZWxsX2NhbGwoc2VsZiwgY29t
bWFuZCk6CistICAgICAgICBjaGlsZF9waWQgPSBvcy5mb3JrKCkKKy0gICAgICAgIGlmIGNoaWxk
X3BpZCBpcyAwOgorLSAgICAgICAgICAgICMgU3dpdGNoIHRvIHRoZSBydW4tYXMgdXNlciBwcml2
aWxlZ2VzLCBpZiBvbmUgaGFzIGJlZW4gc2V0CistICAgICAgICAgICAgaWYgc2VsZi5ydW5hc191
aWQgaXMgbm90IE5vbmUgYW5kIHNlbGYucnVuYXNfZ2lkIGlzIG5vdCBOb25lOgorLSAgICAgICAg
ICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLmRlYnVnKCJTd2l0Y2hpbmcgcHJpdmlsZWdlcyB0
byAlcyAoJWQ6JWQpIiAlIChzZWxmLnJ1bmFzX3VzZXIsIHNlbGYucnVuYXNfdWlkLCBzZWxmLnJ1
bmFzX2dpZCkpCistICAgICAgICAgICAgICAgIG9zLnNldGdpZChzZWxmLnJ1bmFzX3VpZCkKKy0g
ICAgICAgICAgICAgICAgb3Muc2V0dWlkKHNlbGYucnVuYXNfZ2lkKQorLQorLSAgICAgICAgICAg
ICMgSWYgbm90IGluIGRlYnVnIG1vZGUsIHJlZGlyZWN0IG91dHB1dCB0byAvZGV2L251bGwKKy0g
ICAgICAgICAgICBpZiBub3QgYmlud2Fsay5jb3JlLmNvbW1vbi5ERUJVRzoKKy0gICAgICAgICAg
ICAgICAgdG1wID0gc3VicHJvY2Vzcy5ERVZOVUxMCistICAgICAgICAgICAgZWxzZToKKy0gICAg
ICAgICAgICAgICAgdG1wID0gTm9uZQorLQorLSAgICAgICAgICAgICMgRXhlY3V0ZSBjb21tYW5k
CisrICAgICAgICAjIElmIG5vdCBpbiBkZWJ1ZyBtb2RlLCByZWRpcmVjdCBvdXRwdXQgdG8gL2Rl
di9udWxsCisrICAgICAgICBpZiBub3QgYmlud2Fsay5jb3JlLmNvbW1vbi5ERUJVRzoKKysgICAg
ICAgICAgICB0bXAgPSBzdWJwcm9jZXNzLkRFVk5VTEwKKysgICAgICAgIGVsc2U6CisrICAgICAg
ICAgICAgdG1wID0gTm9uZQorKworKyAgICAgICAgIyBJZiBhIHJ1bi1hcyB1c2VyIGlzIG5vdCB0
aGUgY3VycmVudCB1c2VyLCB3ZSdsbCBuZWVkIHRvIHN3aXRjaCBwcml2aWxlZ2VzIHRvIHRoYXQg
dXNlciBhY2NvdW50CisrICAgICAgICBpZiBzZWxmLnJ1bmFzX3VpZCAhPSBvcy5nZXR1aWQoKToK
KysgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLmRlYnVnKCJTd2l0Y2hpbmcgcHJpdmls
ZWdlcyB0byAlcyAoJWQ6JWQpIiAlIChzZWxmLnJ1bmFzX3VzZXIsIHNlbGYucnVuYXNfdWlkLCBz
ZWxmLnJ1bmFzX2dpZCkpCisrICAgICAgICAgICAgCisrICAgICAgICAgICAgIyBGb3JrIGEgY2hp
bGQgcHJvY2VzcworKyAgICAgICAgICAgIGNoaWxkX3BpZCA9IG9zLmZvcmsoKQorKyAgICAgICAg
ICAgIGlmIGNoaWxkX3BpZCBpcyAwOgorKyAgICAgICAgICAgICAgICAjIFN3aXRjaCB0byB0aGUg
cnVuLWFzIHVzZXIgcHJpdmlsZWdlcywgaWYgb25lIGhhcyBiZWVuIHNldAorKyAgICAgICAgICAg
ICAgICBpZiBzZWxmLnJ1bmFzX3VpZCBpcyBub3QgTm9uZSBhbmQgc2VsZi5ydW5hc19naWQgaXMg
bm90IE5vbmU6CisrICAgICAgICAgICAgICAgICAgICBvcy5zZXRnaWQoc2VsZi5ydW5hc191aWQp
CisrICAgICAgICAgICAgICAgICAgICBvcy5zZXR1aWQoc2VsZi5ydW5hc19naWQpCisrICAgICAg
ICBlbHNlOgorKyAgICAgICAgICAgICMgY2hpbGRfcGlkIG9mIE5vbmUgaW5kaWNhdGVzIHRoYXQg
bm8gb3MuZm9yaygpIG9jY3VyZWQKKysgICAgICAgICAgICBjaGlsZF9waWQgPSBOb25lCisrICAg
ICAgICAgICAgCisrICAgICAgICAjIElmIHdlJ3JlIHRoZSBjaGlsZCwgb3IgdGhlcmUgd2FzIG5v
IG9zLmZvcmsoKSwgZXhlY3V0ZSB0aGUgY29tbWFuZAorKyAgICAgICAgaWYgY2hpbGRfcGlkIGlu
IFswLCBOb25lXToKKyAgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLmRlYnVnKCJzdWJw
cm9jZXNzLmNhbGwoJXMsIHN0ZG91dD0lcywgc3RkZXJyPSVzKSIgJSAoY29tbWFuZCwgc3RyKHRt
cCksIHN0cih0bXApKSkKKyAgICAgICAgICAgICBydmFsID0gc3VicHJvY2Vzcy5jYWxsKHNobGV4
LnNwbGl0KGNvbW1hbmQpLCBzdGRvdXQ9dG1wLCBzdGRlcnI9dG1wKQorIAorKyAgICAgICAgIyBB
IHRydWUgY2hpbGQgcHJvY2VzcyBzaG91bGQgZXhpdCB3aXRoIHRoZSBzdWJwcm9jZXNzIGV4aXQg
dmFsdWUKKysgICAgICAgIGlmIGNoaWxkX3BpZCBpcyAwOgorICAgICAgICAgICAgIHN5cy5leGl0
KHJ2YWwpCisrICAgICAgICAjIElmIG5vIG9zLmZvcmsoKSBoYXBwZW5lZCwganVzdCByZXR1cm4g
dGhlIHN1YnByb2Nlc3MgZXhpdCB2YWx1ZQorKyAgICAgICAgZWxpZiBjaGlsZF9waWQgaXMgTm9u
ZToKKysgICAgICAgICAgICByZXR1cm4gcnZhbAorKyAgICAgICAgIyBFbHNlLCBvcy5mb3JrKCkg
aGFwcGVuZWQgYW5kIHdlJ3JlIHRoZSBwYXJlbnQuIFdhaXQgYW5kIHJldHVybiB0aGUgY2hpbGQn
cyBleGl0IHZhbHVlLgorICAgICAgICAgZWxzZToKKyAgICAgICAgICAgICByZXR1cm4gb3Mud2Fp
dCgpWzFdCisgCistICAgIGRlZiBzeW1saW5rX3Nhbml0aXplcihzZWxmLCBmaWxlX2xpc3QpOgor
KyAgICBkZWYgc3ltbGlua19zYW5pdGl6ZXIoc2VsZiwgZmlsZV9saXN0LCBleHRyYWN0aW9uX2Rp
cmVjdG9yeSk6CisgICAgICAgICAjIEFsbG93cyBlaXRoZXIgYSBzaW5nbGUgZmlsZSBwYXRoLCBv
ciBhIGxpc3Qgb2YgZmlsZSBwYXRocyB0byBiZSBwYXNzZWQgaW4gZm9yIHNhbml0aXphdGlvbi4K
KyAgICAgICAgIGlmIHR5cGUoZmlsZV9saXN0KSBpcyBub3QgbGlzdDoKKyAgICAgICAgICAgICBm
aWxlX2xpc3QgPSBbZmlsZV9saXN0XQorQEAgLTk4Miw3ICs5OTYsNyBAQCBjbGFzcyBFeHRyYWN0
b3IoTW9kdWxlKToKKyAgICAgICAgICAgICAgICAgbGlua3RhcmdldCA9IG9zLnBhdGgucmVhbHBh
dGgoZmlsZV9uYW1lKQorICAgICAgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLmRlYnVn
KCJBbmFseXNpbmcgc3ltbGluazogJXMgLT4gJXMiICUgKGZpbGVfbmFtZSwgbGlua3RhcmdldCkp
CisgCistICAgICAgICAgICAgICAgIGlmIG5vdCBsaW5rdGFyZ2V0LnN0YXJ0c3dpdGgoc2VsZi5k
aXJlY3RvcnkpIGFuZCBsaW5rdGFyZ2V0ICE9IG9zLmRldm51bGw6CisrICAgICAgICAgICAgICAg
IGlmIG5vdCBsaW5rdGFyZ2V0LnN0YXJ0c3dpdGgoZXh0cmFjdGlvbl9kaXJlY3RvcnkpIGFuZCBs
aW5rdGFyZ2V0ICE9IG9zLmRldm51bGw6CisgICAgICAgICAgICAgICAgICAgICBiaW53YWxrLmNv
cmUuY29tbW9uLndhcm5pbmcoIlN5bWxpbmsgcG9pbnRzIG91dHNpZGUgb2YgdGhlIGV4dHJhY3Rp
b24gZGlyZWN0b3J5OiAlcyAtPiAlczsgY2hhbmdpbmcgbGluayB0YXJnZXQgdG8gJXMgZm9yIHNl
Y3VyaXR5IHB1cnBvc2VzLiIgJSAoZmlsZV9uYW1lLCBsaW5rdGFyZ2V0LCBvcy5kZXZudWxsKSkK
KyAgICAgICAgICAgICAgICAgICAgIG9zLnJlbW92ZShmaWxlX25hbWUpCisgICAgICAgICAgICAg
ICAgICAgICBvcy5zeW1saW5rKG9zLmRldm51bGwsIGZpbGVfbmFtZSkKK2RpZmYgLS1naXQgYS90
ZXN0aW5nL3Rlc3RzL3Rlc3RfZGlydHJhdmVyc2FsLnB5IGIvdGVzdGluZy90ZXN0cy90ZXN0X2Rp
cnRyYXZlcnNhbC5weQoraW5kZXggZGMzNzFkNS4uNjZlZjAwMyAxMDA2NDQKKy0tLSBhL3Rlc3Rp
bmcvdGVzdHMvdGVzdF9kaXJ0cmF2ZXJzYWwucHkKKysrKyBiL3Rlc3RpbmcvdGVzdHMvdGVzdF9k
aXJ0cmF2ZXJzYWwucHkKK0BAIC0xLDMxICsxLDMzIEBACisgaW1wb3J0IG9zCisgaW1wb3J0IGJp
bndhbGsKKy1mcm9tIG5vc2UudG9vbHMgaW1wb3J0IGVxXywgb2tfCisrZnJvbSBub3NlLnRvb2xz
IGltcG9ydCBlcV8sIG9rXywgYXNzZXJ0X2VxdWFsLCBhc3NlcnRfbm90X2VxdWFsCisgCisgZGVm
IHRlc3RfZGlydHJhdmVyc2FsKCk6CisgICAgICcnJworICAgICBUZXN0OiBPcGVuIGRpcnRyYXZl
cnNhbC50YXIsIHNjYW4gZm9yIHNpZ25hdHVyZXMuCisgICAgIFZlcmlmeSB0aGF0IGRhbmdlcm91
cyBzeW1saW5rcyBoYXZlIGJlZW4gc2FuaXRpemVkLgorICAgICAnJycKKy0gICAgYmFkX3N5bWxp
bmtfZmlsZV9saXN0ID0gWydmb28nLCAnYmFyJywgJ2ZvbzInLCAnYmFyMiddCistICAgIGdvb2Rf
c3ltbGlua19maWxlX2xpc3QgPSBbJ1JFQURNRV9saW5rJywgJ1JFQURNRTJfbGluayddCisrICAg
IGJhZF9zeW1saW5rX2ZpbGVfbGlzdCA9IFsnZm9vJywgJ2JhcicsICdzdWJkaXIvZm9vMicsICdz
dWJkaXIvYmFyMiddCisrICAgIGdvb2Rfc3ltbGlua19maWxlX2xpc3QgPSBbJ3N1YmRpci9SRUFE
TUVfbGluaycsICdSRUFETUUyX2xpbmsnXQorIAorICAgICBpbnB1dF92ZWN0b3JfZmlsZSA9IG9z
LnBhdGguam9pbihvcy5wYXRoLmRpcm5hbWUoX19maWxlX18pLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiaW5wdXQtdmVjdG9ycyIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJkaXJ0cmF2ZXJzYWwudGFyIikKKyAKKysgICAgb3V0cHV0X2Rp
cmVjdG9yeSA9IG9zLnBhdGguam9pbihvcy5wYXRoLmRpcm5hbWUoX19maWxlX18pLAorKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpbnB1dC12ZWN0b3JzIiwKKysgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiX2RpcnRyYXZlcnNhbC50YXIuZXh0cmFjdGVk
IikKKysKKyAgICAgc2Nhbl9yZXN1bHQgPSBiaW53YWxrLnNjYW4oaW5wdXRfdmVjdG9yX2ZpbGUs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpZ25hdHVyZT1UcnVlLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBleHRyYWN0PVRydWUsCistICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHF1aWV0PVRydWUpCistCistICAgICMgVGVzdCBudW1iZXIgb2YgbW9k
dWxlcyB1c2VkCistICAgIGVxXyhsZW4oc2Nhbl9yZXN1bHQpLCAxKQorKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBxdWlldD1UcnVlKVswXQorIAorICAgICAjIE1ha2Ugc3VyZSB0aGUg
YmFkIHN5bWxpbmtzIGhhdmUgYmVlbiBzYW5pdGl6ZWQgYW5kIHRoZQorICAgICAjIGdvb2Qgc3lt
bGlua3MgaGF2ZSBub3QgYmVlbiBzYW5pdGl6ZWQuCistICAgIGZvciByZXN1bHQgaW4gc2Nhbl9y
ZXN1bHRbMF0ucmVzdWx0czoKKy0gICAgICAgIGlmIHJlc3VsdC5maWxlLm5hbWUgaW4gYmFkX3N5
bWxpbmtfZmlsZV9saXN0OgorLSAgICAgICAgICAgIGFzc2VydF9lcXVhbChvcy5wYXRoLnJlYWxw
YXRoKHJlc3VsdC5maWxlLnBhdGgpLCBvcy5kZXZudWxsKQorLSAgICAgICAgZWxpZiByZXN1bHQu
ZmlsZS5uYW1lIGluIGdvb2Rfc3ltbGlua19maWxlX2xpc3Q6CistICAgICAgICAgICAgYXNzZXJ0
X25vdF9lcXVhbChvcy5wYXRoLnJlYWxwYXRoKHJlc3VsdC5maWxlLnBhdGgpLCBvcy5kZXZudWxs
KQorKyAgICBmb3Igc3ltbGluayBpbiBiYWRfc3ltbGlua19maWxlX2xpc3Q6CisrICAgICAgICBs
aW5rdGFyZ2V0ID0gb3MucGF0aC5yZWFscGF0aChvcy5wYXRoLmpvaW4ob3V0cHV0X2RpcmVjdG9y
eSwgc3ltbGluaykpCisrICAgICAgICBhc3NlcnRfZXF1YWwobGlua3RhcmdldCwgb3MuZGV2bnVs
bCkKKysgICAgZm9yIHN5bWxpbmsgaW4gZ29vZF9zeW1saW5rX2ZpbGVfbGlzdDoKKysgICAgICAg
IGxpbmt0YXJnZXQgPSBvcy5wYXRoLnJlYWxwYXRoKG9zLnBhdGguam9pbihvdXRwdXRfZGlyZWN0
b3J5LCBzeW1saW5rKSkKKysgICAgICAgIGFzc2VydF9ub3RfZXF1YWwobGlua3RhcmdldCwgb3Mu
ZGV2bnVsbCkKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmlud2Fsay8wMDM2LUZpeGVkLWNvZGUtY29tbWVudC5wYXRjaCBiL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDM2LUZpeGVkLWNv
ZGUtY29tbWVudC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmIw
OTJiODE1MAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDM2LUZpeGVkLWNvZGUtY29tbWVudC5wYXRjaApAQCAt
MCwwICsxLDIyIEBACitGcm9tIDY0YTUyYzU5ZmE5MDc3YWI4NjM0YmQ5OWI5ZWU4MTQ2NjM1NzMz
MjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBkZXZ0dHlzMCA8Y2hlZmZuZXJAcmVm
aXJtbGFicy5jb20+CitEYXRlOiBNb24sIDYgU2VwIDIwMjEgMDk6MjM6MjMgLTA3MDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gRml4ZWQgY29kZSBjb21tZW50CisKKy0tLQorIHNyYy9iaW53YWxrL21vZHVs
ZXMvZXh0cmFjdG9yLnB5IHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0
b3IucHkgYi9zcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQoraW5kZXggMTFlYWIwZC4u
NGMyYWEwMiAxMDA2NDQKKy0tLSBhL3NyYy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5Cisr
KysgYi9zcmMvYmlud2Fsay9tb2R1bGVzL2V4dHJhY3Rvci5weQorQEAgLTk5MCw3ICs5OTAsNyBA
QCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAgICAgIGlmIHR5cGUoZmlsZV9saXN0KSBp
cyBub3QgbGlzdDoKKyAgICAgICAgICAgICBmaWxlX2xpc3QgPSBbZmlsZV9saXN0XQorIAorLSAg
ICAgICAgIyBTYW5pdGl6ZSBhbnkgZmlsZXMgaW4gdGhlIGxpc3QgdGhhdCBhcmUgc3ltbGlua3Mg
b3V0c2lkZSBvZiB0aGUgc2VsZi5kaXJlY3RvcnkgZXh0cmFjdGlvbiBkaXJlY3RvcnkuCisrICAg
ICAgICAjIFNhbml0aXplIGFueSBmaWxlcyBpbiB0aGUgbGlzdCB0aGF0IGFyZSBzeW1saW5rcyBv
dXRzaWRlIG9mIHRoZSBzcGVjaWZpZWQgZXh0cmFjdGlvbiBkaXJlY3RvcnkuCisgICAgICAgICBm
b3IgZmlsZV9uYW1lIGluIGZpbGVfbGlzdDoKKyAgICAgICAgICAgICBpZiBvcy5wYXRoLmlzbGlu
ayhmaWxlX25hbWUpOgorICAgICAgICAgICAgICAgICBsaW5rdGFyZ2V0ID0gb3MucGF0aC5yZWFs
cGF0aChmaWxlX25hbWUpCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzNy1BZGRlZC1vcHRpb24tdG8tZGlzYWJsZS1zeW1s
aW5rLXNhbml0aXphdGlvbi1pZi1kZXNpLnBhdGNoIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzctQWRkZWQtb3B0aW9uLXRvLWRpc2FibGUt
c3ltbGluay1zYW5pdGl6YXRpb24taWYtZGVzaS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAuLmRlMmY0NjUyMQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDM3LUFkZGVkLW9wdGlv
bi10by1kaXNhYmxlLXN5bWxpbmstc2FuaXRpemF0aW9uLWlmLWRlc2kucGF0Y2gKQEAgLTAsMCAr
MSw0MyBAQAorRnJvbSA1YTliZGYzMmUzZjg4MmM3YTJjYTkwZTUwM2U1NjhlNzM0ZjI2NTY1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogZGV2dHR5czAgPGNoZWZmbmVyQHJlZmlybWxh
YnMuY29tPgorRGF0ZTogVHVlLCA3IFNlcCAyMDIxIDA2OjU1OjE3IC0wNzAwCitTdWJqZWN0OiBb
UEFUQ0hdIEFkZGVkIG9wdGlvbiB0byBkaXNhYmxlIHN5bWxpbmsgc2FuaXRpemF0aW9uIGlmIGRl
c2lyZWQKKworLS0tCisgc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0b3IucHkgfCA5ICsrKysr
KysrKworIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3Ny
Yy9iaW53YWxrL21vZHVsZXMvZXh0cmFjdG9yLnB5IGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRy
YWN0b3IucHkKK2luZGV4IDRjMmFhMDIuLjRlNDY2MGEgMTAwNjQ0CistLS0gYS9zcmMvYmlud2Fs
ay9tb2R1bGVzL2V4dHJhY3Rvci5weQorKysrIGIvc3JjL2JpbndhbGsvbW9kdWxlcy9leHRyYWN0
b3IucHkKK0BAIC05OSw2ICs5OSwxMCBAQCBjbGFzcyBFeHRyYWN0b3IoTW9kdWxlKToKKyAgICAg
ICAgICMgICAgICAgdHlwZT1pbnQsCisgICAgICAgICAjICAgICAgIGt3YXJncz17J3JlY3Vyc2l2
ZV9tYXhfc2l6ZSc6IDB9LAorICAgICAgICAgIyAgICAgICBkZXNjcmlwdGlvbj0iTGltaXQgdGhl
IHRvdGFsIHNpemUgb2YgYWxsIGV4dHJhY3RlZCBmaWxlcyIpLAorKyAgICAgICAgT3B0aW9uKHNo
b3J0PScxJywKKysgICAgICAgICAgICAgICBsb25nPSdwcmVzZXJ2ZS1zeW1saW5rcycsCisrICAg
ICAgICAgICAgICAga3dhcmdzPXsnZG9fbm90X3Nhbml0aXplX3N5bWxpbmtzJzogVHJ1ZX0sCisr
ICAgICAgICAgICAgICAgZGVzY3JpcHRpb249IkRvIG5vdCBzYW5pdGl6ZSBleHRyYWN0ZWQgc3lt
bGlua3MgdGhhdCBwb2ludCBvdXRzaWRlIHRoZSBleHRyYWN0aW9uIGRpcmVjdG9yeSAoZGFuZ2Vy
b3VzKSIpLAorICAgICAgICAgT3B0aW9uKHNob3J0PSdyJywKKyAgICAgICAgICAgICAgICBsb25n
PSdybScsCisgICAgICAgICAgICAgICAga3dhcmdzPXsncmVtb3ZlX2FmdGVyX2V4ZWN1dGUnOiBU
cnVlfSwKK0BAIC0xMTgsNiArMTIyLDcgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAg
ICAgICBLd2FyZyhuYW1lPSdyZWN1cnNpdmVfbWF4X3NpemUnLCBkZWZhdWx0PU5vbmUpLAorICAg
ICAgICAgS3dhcmcobmFtZT0nbWF4X2NvdW50JywgZGVmYXVsdD1Ob25lKSwKKyAgICAgICAgIEt3
YXJnKG5hbWU9J2Jhc2VfZGlyZWN0b3J5JywgZGVmYXVsdD1Ob25lKSwKKysgICAgICAgIEt3YXJn
KG5hbWU9J2RvX25vdF9zYW5pdGl6ZV9zeW1saW5rcycsIGRlZmF1bHQ9RmFsc2UpLAorICAgICAg
ICAgS3dhcmcobmFtZT0ncmVtb3ZlX2FmdGVyX2V4ZWN1dGUnLCBkZWZhdWx0PUZhbHNlKSwKKyAg
ICAgICAgIEt3YXJnKG5hbWU9J2xvYWRfZGVmYXVsdF9ydWxlcycsIGRlZmF1bHQ9RmFsc2UpLAor
ICAgICAgICAgS3dhcmcobmFtZT0ncnVuX2V4dHJhY3RvcnMnLCBkZWZhdWx0PVRydWUpLAorQEAg
LTk4Niw2ICs5OTEsMTAgQEAgY2xhc3MgRXh0cmFjdG9yKE1vZHVsZSk6CisgICAgICAgICAgICAg
cmV0dXJuIG9zLndhaXQoKVsxXQorIAorICAgICBkZWYgc3ltbGlua19zYW5pdGl6ZXIoc2VsZiwg
ZmlsZV9saXN0LCBleHRyYWN0aW9uX2RpcmVjdG9yeSk6CisrICAgICAgICAjIFVzZXIgY2FuIGRp
c2FibGUgdGhpcyBpZiBkZXNpcmVkCisrICAgICAgICBpZiBzZWxmLmRvX25vdF9zYW5pdGl6ZV9z
eW1saW5rcyBpcyBUcnVlOgorKyAgICAgICAgICAgIHJldHVybiAKKysKKyAgICAgICAgICMgQWxs
b3dzIGVpdGhlciBhIHNpbmdsZSBmaWxlIHBhdGgsIG9yIGEgbGlzdCBvZiBmaWxlIHBhdGhzIHRv
IGJlIHBhc3NlZCBpbiBmb3Igc2FuaXRpemF0aW9uLgorICAgICAgICAgaWYgdHlwZShmaWxlX2xp
c3QpIGlzIG5vdCBsaXN0OgorICAgICAgICAgICAgIGZpbGVfbGlzdCA9IFtmaWxlX2xpc3RdCmRp
ZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJp
bndhbGsvMDAzOC1SZW1vdmUtdW5zdHVmZi1mcm9tLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmlud2Fsay8wMDM4LVJlbW92
ZS11bnN0dWZmLWZyb20tZGVwZW5kZW5jaWVzLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMC4uZGY2ZWNiZTMwCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iaW53YWxrLzAwMzgtUmVtb3ZlLXVuc3R1
ZmYtZnJvbS1kZXBlbmRlbmNpZXMucGF0Y2gKQEAgLTAsMCArMSw3MCBAQAorRnJvbSAzOWM1ZDli
MmNlNzg5ZjczMmYyNWQ5YzZlYTc3ZTk1MjUyNWU4NGNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogRXJpYyBPd2xlIDxlcmljb3dsZUBtaWNyb3NvZnQuY29tPgorRGF0ZTogVHVlLCAy
MCBTZXAgMjAyMiAxMTo0NDoyMCAtMDQwMAorU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdW5zdHVm
ZiBmcm9tIGRlcGVuZGVuY2llcworCistLS0KKyBJTlNUQUxMLm1kICAgICAgICAgICAgICAgICAg
ICAgIHwgIDYgLS0tLS0tCisgZGVwcy5zaCAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyIC0t
LS0tLS0tLS0tLQorIHNyYy9iaW53YWxrL2NvbmZpZy9leHRyYWN0LmNvbmYgfCAgMSAtCisgMyBm
aWxlcyBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL0lOU1RBTEwubWQg
Yi9JTlNUQUxMLm1kCitpbmRleCBhMTRlOGM0Li4wZjBjOTFjIDEwMDY0NAorLS0tIGEvSU5TVEFM
TC5tZAorKysrIGIvSU5TVEFMTC5tZAorQEAgLTc5LDEyICs3OSw2IEBAICQgZ2l0IGNsb25lIGh0
dHBzOi8vZ2l0aHViLmNvbS9kZXZ0dHlzMC95YWZmc2hpdgorICQgKGNkIHlhZmZzaGl2ICYmIHN1
ZG8gcHl0aG9uIHNldHVwLnB5IGluc3RhbGwpCisgYGBgCisgCistYGBgYmFzaAorLSMgSW5zdGFs
bCB1bnN0dWZmIChjbG9zZWQgc291cmNlKSB0byBleHRyYWN0IFN0dWZmSXQgYXJjaGl2ZSBmaWxl
cworLSQgd2dldCAtTyAtIGh0dHA6Ly9kb3dubG9hZHMudHV4ZmFtaWx5Lm9yZy9zZHRyYWNlcy9z
dHVmZml0NTIwLjYxMWxpbnV4LWkzODYudGFyLmd6IHwgdGFyIC16eHYKKy0kIHN1ZG8gY3AgYmlu
L3Vuc3R1ZmYgL3Vzci9sb2NhbC9iaW4vCistYGBgCistCisgTm90ZSB0aGF0IGZvciBEZWJpYW4v
VWJ1bnR1IHVzZXJzLCBhbGwgb2YgdGhlIGFib3ZlIGRlcGVuZGVuY2llcyBjYW4gYmUgaW5zdGFs
bGVkIGF1dG9tYXRpY2FsbHkgdXNpbmcgdGhlIGluY2x1ZGVkIGBkZXBzLnNoYCBzY3JpcHQ6Cisg
CisgYGBgYmFzaAorZGlmZiAtLWdpdCBhL2RlcHMuc2ggYi9kZXBzLnNoCitpbmRleCBjYmQ4MjFj
Li41YThhMDk4IDEwMDc1NQorLS0tIGEvZGVwcy5zaAorKysrIGIvZGVwcy5zaAorQEAgLTk1LDE3
ICs5NSw2IEBAIGZ1bmN0aW9uIGluc3RhbGxfamVmZmVyc29uCisgICAgICRTVURPIHJtIC1yZiBq
ZWZmZXJzb24KKyB9CisgCistZnVuY3Rpb24gaW5zdGFsbF91bnN0dWZmCisteworLSAgICBta2Rp
ciAtcCAvdG1wL3Vuc3R1ZmYKKy0gICAgY2QgL3RtcC91bnN0dWZmCistCistICAgIHdnZXQgLU8g
LSBodHRwOi8vZG93bmxvYWRzLnR1eGZhbWlseS5vcmcvc2R0cmFjZXMvc3R1ZmZpdDUyMC42MTFs
aW51eC1pMzg2LnRhci5neiB8IHRhciAtenh2CistICAgICRTVURPIGNwIGJpbi91bnN0dWZmIC91
c3IvbG9jYWwvYmluLworLSAgICBjZCAtCistICAgIHJtIC1yZiAvdG1wL3Vuc3R1ZmYKKy19Cist
CisgZnVuY3Rpb24gaW5zdGFsbF9jcmFtZnN0b29scworIHsKKyAgICMgRG93bmxvYWRzIGNyYW1m
cyB0b29scyBmcm9tIHNvdXJjZWZvcmdlIGFuZCBpbnN0YWxscyB0aGVtIHRvICRJTlNUQUxMX0xP
Q0FUSU9OCitAQCAtMjUxLDcgKzI0MCw2IEBAIGluc3RhbGxfcGlwX3BhY2thZ2UgInNldHVwdG9v
bHMgbWF0cGxvdGxpYiBjYXBzdG9uZSBweWNyeXB0b2RvbWUgZ251cGcgdGsiCisgaW5zdGFsbF9z
YXNxdWF0Y2gKKyBpbnN0YWxsX3lhZmZzaGl2CisgaW5zdGFsbF9qZWZmZXJzb24KKy1pbnN0YWxs
X3Vuc3R1ZmYKKyBpbnN0YWxsX3ViaXJlYWRlcgorIAorIGlmIFsgJGRpc3Ryb192ZXJzaW9uID0g
IjE4IiBdCitkaWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvY29uZmlnL2V4dHJhY3QuY29uZiBiL3Ny
Yy9iaW53YWxrL2NvbmZpZy9leHRyYWN0LmNvbmYKK2luZGV4IGY2NGJhMzQuLmMwYzYwYzkgMTAw
NjQ0CistLS0gYS9zcmMvYmlud2Fsay9jb25maWcvZXh0cmFjdC5jb25mCisrKysgYi9zcmMvYmlu
d2Fsay9jb25maWcvZXh0cmFjdC5jb25mCitAQCAtMzcsNyArMzcsNiBAQAorIF5saGE6bGhhOmxo
YSBlZmkgJyVlJworIF5pc28gOTY2MDppc286N3ogeCAnJWUnIC1vaXNvLXJvb3QKKyBebWljcm9z
b2Z0IGNhYmluZXQgYXJjaGl2ZTpjYWI6Y2FiZXh0cmFjdCAnJWUnCistXnN0dWZmaXQ6c2l0OnVu
c3R1ZmYgJyVlJworIF5vc3ggZG1nOmRtZzo3eiB4ICclZScKKyBebHpvIGNvbXByZXNzZWQgZGF0
YTpsem86bHpvcCAtZiAtZCAnJWUnCisgXmludGVsIGhleDpoZXg6c3JlY19jYXQgJyVlJyAtSW50
ZWwgLU91dHB1dCAnJWUuYmluJyAtQmluYXJ5CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzOS1maXgtcGF0aC10cmF2ZXJz
YWwtaW4tUEZTLWV4dHJhY3Rvci1zY3JpcHQucGF0Y2ggYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzOS1maXgtcGF0aC10cmF2ZXJzYWwtaW4t
UEZTLWV4dHJhY3Rvci1zY3JpcHQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwLi5jNzE5ZTM3N2MKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGsvMDAzOS1maXgtcGF0aC10cmF2ZXJzYWwt
aW4tUEZTLWV4dHJhY3Rvci1zY3JpcHQucGF0Y2gKQEAgLTAsMCArMSwyNCBAQAorRnJvbSBmMzM4
MTA0Yjk0ODBlN2ExNjE1NmQ1ZTlmYmI1ODZmYTFlYTQyZDMwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogUXVlbnRpbiBLYWlzZXIgPHF1ZW50aW4ua2Fpc2VyQG9uZWtleS5jb20+CitE
YXRlOiBXZWQsIDI2IE9jdCAyMDIyIDIxOjI1OjAxICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGZp
eCBwYXRoIHRyYXZlcnNhbCBpbiBQRlMgZXh0cmFjdG9yIHNjcmlwdC4KKworb3MucGF0aC5qb2lu
IGRvZXMgbm90IGZ1bGx5IHJlc29sdmUgYSBwYXRoIHNvIHRoZSBjb25kaXRpb24gdGhhdCBmb2xs
b3dzCit3aWxsIG5ldmVyIGJlIHRydWUuIEZpeGVkIGJ5IHJlc29sdmluZyB0aGUgcGF0aCB1c2lu
ZyBvcy5wYXRoLmFic3BhdGguCistLS0KKyBzcmMvYmlud2Fsay9wbHVnaW5zL3VucGZzLnB5IHwg
MiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitk
aWZmIC0tZ2l0IGEvc3JjL2JpbndhbGsvcGx1Z2lucy91bnBmcy5weSBiL3NyYy9iaW53YWxrL3Bs
dWdpbnMvdW5wZnMucHkKK2luZGV4IDk1MTNjOGIuLmI5M2UwZGEgMTAwNjQ0CistLS0gYS9zcmMv
Ymlud2Fsay9wbHVnaW5zL3VucGZzLnB5CisrKysgYi9zcmMvYmlud2Fsay9wbHVnaW5zL3VucGZz
LnB5CitAQCAtMTA0LDcgKzEwNCw3IEBAIGNsYXNzIFBGU0V4dHJhY3RvcihiaW53YWxrLmNvcmUu
cGx1Z2luLlBsdWdpbik6CisgICAgICAgICAgICAgICAgIGRhdGEgPSBiaW53YWxrLmNvcmUuY29t
bW9uLkJsb2NrRmlsZShmbmFtZSwgJ3JiJykKKyAgICAgICAgICAgICAgICAgZGF0YS5zZWVrKGZz
LmdldF9lbmRfb2ZfbWV0YV9kYXRhKCkpCisgICAgICAgICAgICAgICAgIGZvciBlbnRyeSBpbiBm
cy5lbnRyaWVzKCk6CistICAgICAgICAgICAgICAgICAgICBvdXRmaWxlX3BhdGggPSBvcy5wYXRo
LmpvaW4ob3V0X2RpciwgZW50cnkuZm5hbWUpCisrICAgICAgICAgICAgICAgICAgICBvdXRmaWxl
X3BhdGggPSBvcy5wYXRoLmFic3BhdGgob3MucGF0aC5qb2luKG91dF9kaXIsIGVudHJ5LmZuYW1l
KSkKKyAgICAgICAgICAgICAgICAgICAgIGlmIG5vdCBvdXRmaWxlX3BhdGguc3RhcnRzd2l0aChv
dXRfZGlyKToKKyAgICAgICAgICAgICAgICAgICAgICAgICBiaW53YWxrLmNvcmUuY29tbW9uLndh
cm5pbmcoIlVucGZzIGV4dHJhY3RvciBkZXRlY3RlZCBkaXJlY3RvcnkgdHJhdmVyc2FsIGF0dGVt
cHQgZm9yIGZpbGU6ICclcycuIFJlZnVzaW5nIHRvIGV4dHJhY3QuIiAlIG91dGZpbGVfcGF0aCkK
KyAgICAgICAgICAgICAgICAgICAgIGVsc2U6CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGtfMi4zLjQuYmIgYi9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGtfMjcuYmIKc2ltaWxhcml0
eSBpbmRleCAxNyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iaW53YWxrXzIuMy40LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJpbndhbGtfMjcuYmIKaW5kZXggMGI3ZDk3ZmNjLi5j
NmUyZjIzOTQgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmlud2Fsa18yLjMuNC5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJpbndhbGtfMjcuYmIKQEAgLTYsOSArNiw0OSBAQCBIT01FUEFH
RSA9ICJodHRwczovL2dpdGh1Yi5jb20vUmVGaXJtTGFicy9iaW53YWxrIgogTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02NWJiZWUwNTVkM2Vh
M2JmYzQ3NWYwN2FlY2Y0ZGU2NCIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL1JlRmly
bUxhYnMvYmlud2Fsaztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgorU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL1JlRmlybUxhYnMvYmlud2Fsaztwcm90b2NvbD1odHRwczticmFuY2g9
bWFzdGVyIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtZGVwcy1GaXgtaW5zdGFsbC1vbi1uZXdl
ci11YnVudHUtZGlzdHJvcy1hbmQtZHJvcC1weS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8w
MDAyLVJlbW92ZS1weXRob24tMi43LWZyb20tQ0ktdGVzdGluZy5wYXRjaCBcCisgICAgICAgICAg
IGZpbGU6Ly8wMDAzLXJlZHVjZS10ZXN0LW1hdHJpeC10by1kaXN0cm9zLXVuZGVyLUxUUy1hbmQt
cHl0aG9uLXYucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNC1UcmF2aXMtd2lsbC1ub3Qt
YXBwbHktdGVzdC1tYXRyaXgtdG8tZGlzdC1rZXl3b3JkLWV4LnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMDUtQWN0dWFsbHktaW1wbGVtZW50LWV4cG9uZW50LWFuZC1zaGlmdC1vcGVyYXRv
cnMucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNi1VcGRhdGUtSU5TVEFMTC5tZC1iYXNl
ZC1vbi1tb2Rlcm4tcmVhbGl0aWVzLXdpdGgtcHl0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTov
LzAwMDctaW5pdGlhbC1Eb2NrZXJmaWxlLWFsb25nLXdpdGgtY2hhbmdlcy1yZXF1aXJlZC1mb3It
cy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA4LWltcGxlbWVudC1tdWx0aS1zdGFnZS1i
dWlsZC1hbmQtdGVzdC1zdGFnZS1pbmNsdWRlLUQucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8v
MDAwOS1maXgtdHJhdmlzLXNjcmlwdC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDEwLXN0
aWxsLW5vLWxvdmUtZm9yLXRyYXZpcy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDExLXRy
YW5zaXRpb24tdG8tdXNlLW9mLWNyeXB0b2RvbWUtc2luY2UtcHljcnlwdG8taXMtRU8ucGF0Y2gg
XAorICAgICAgICAgICBmaWxlOi8vMDAxMi1DYWxsLXVuemlwLXdpdGgtZW1wdHktcGFzc3dvcmQt
dG8tYXZvaWQtdW56aXAtc3R1Y2stLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMTMtVWJ1
bnR1LUZvY2FsLWlzLVB5dGhvbi0zLWJ5LWRlZmF1bHQucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAxNC1mYWlsLWRlcHMuc2gtaWYtYW55LWluc3RhbGwtY29tbWFuZC1mYWlscy5wYXRjaCBc
CisgICAgICAgICAgIGZpbGU6Ly8wMDE1LXdlLW5vLWxvbmdlci1uZWVkLXRvLWJpZnVyY2F0ZS1w
eXRob24zLWFuZC1weXRob24yLWQucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAxNi11c2lu
Zy1waXAzLWlzLWNhdXNpbmctaXNzdWVzLXVzZS13aGF0ZXZlci1waXAtdGhlLXVzLnBhdGNoIFwK
KyAgICAgICAgICAgZmlsZTovLzAwMTctVHJhdmlzLUNJLWRvZXMtbm90LXByZXNlcnZlLXRoZS1z
cGVjaWZpZWQtcHl0aG9uLXdoZS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDE4LXRoZXJl
LWlzLW5vLXJoeW1lLW9yLXJlYXNvbi10by10cmF2aXMucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAxOS10cnktdG8tcHJlc2VydmUtdGhlLXB5dGhvbi1iZWluZy11c2VkLWFjcm9zcy1zdWRv
LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMjAtbm9wLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMjEtc2FzcXVhdGNoLXBhdGNoLXdhcy1tZXJnZWQucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vMDAyMi1hZGQtdGhpcmQtcGFydHktTk9USUNFLW1hcmtkb3duLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMjMtUmVtb3ZlZC1zZW5zaXRpdmUta2V5cy5wYXRjaCBcCisgICAg
ICAgICAgIGZpbGU6Ly8wMDI0LVJlbW92ZWQtaGlsaW5rLWRlY3J5cHRpb24tcGx1Z2luLWNvbnRh
aW5zLXByaXByaWV0YXIucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAyNS1VcGRhdGVkLXZl
cnNpb24tbnVtYmVyLWZvci1yZWxlYXNlLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMjYt
SW5pdGlhbC1sb3ctcHJpdi1leGVjdXRpb24taW1wbGVtZW50YXRpb24ucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vMDAyNy1BZGRlZC1vcHRpb24tdG8tdHVybi1vZmYtcHJpdmlsZWdlLWRyb3Bw
aW5nLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMjgtQWRkZWQtb3B0aW9uLWZvci1zcGVj
aWZ5aW5nLWEtdXNlci10by1ydW4tZXh0ZXJuYWwtZS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDI5LUluaXRpYWwtc3ltbGluay1yZXBhaXItc29sdXRpb24ucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vMDAzMC1BZGRlZC1jb2RlLWNvbW1lbnRzLWFuZC1iZXR0ZXItZXJyb3Itb3V0cHV0
LWZvci1lbmQtLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMzEtQnVnLWZpeGVzLWNvZGUt
dGVzdGluZy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDMyLUNvZGUtY2xlYW51cC5wYXRj
aCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDMzLUFkZGVkLWRpcmVjdG9yeS10cmF2ZXJzYWwtdGVz
dC1maXhlZC16aXAtdGVzdC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDM0LVVwZGF0ZWQt
UkVBRE1FLm1kLXRvLWluY2x1ZGUtZXh0cmFjdGlvbi1zZWN1cml0eS1ub3QucGF0Y2ggXAorICAg
ICAgICAgICBmaWxlOi8vMDAzNS1GaXhlZC1kaXJ0cmF2ZXJzYWwtdGVzdC11cGRhdGVkLWV4dHJh
Y3Rvci10by1ub3QtZm9yLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMzYtRml4ZWQtY29k
ZS1jb21tZW50LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMzctQWRkZWQtb3B0aW9uLXRv
LWRpc2FibGUtc3ltbGluay1zYW5pdGl6YXRpb24taWYtZGVzaS5wYXRjaCBcCisgICAgICAgICAg
IGZpbGU6Ly8wMDM4LVJlbW92ZS11bnN0dWZmLWZyb20tZGVwZW5kZW5jaWVzLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMzktZml4LXBhdGgtdHJhdmVyc2FsLWluLVBGUy1leHRyYWN0b3It
c2NyaXB0LnBhdGNoIFwKKyAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiY2RkZmVkZTc5NTk3MTA0
NWQ5OTQyMmJkN2E5Njc2Yzg4MDNlYzVlZSIKK1NSQ1JFViA9ICI3NTA2MzVkOTExNGY4ZTI4ODZk
OTllM2I3Mzc5NzEyZjcyMDcyZGQ5IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5
LjIKCg==

--===============8254768403365547186==--

