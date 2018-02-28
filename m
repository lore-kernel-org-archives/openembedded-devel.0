Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA96E78754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:26:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 07:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="31324248"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 28 Feb 2018 07:26:36 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BE02458038F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:26:35 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:29:27 +0200
Message-Id: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/5] remove unused patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 15:26:35 -0000

Some patches are unused and some were not removed during the cleanup process.
Detected using this silly python script:

import os
import subprocess

patches = subprocess.check_output(("git", "ls-files", "*.patch","*.diff")).decode("utf-8").split()
for patch in patches:
        patchname=os.path.basename(patch)
        result = subprocess.check_output(("git", "grep", patchname)).decode("utf-8").splitlines()
        print(result)

Maxin B. John (5):
  nautilus: remove unused patches
  breakpad: remove unused patch
  flite: remove leftover patch
  libeigen: remove unused patch
  gst-ffmpeg: remove leftover patch

 .../nautilus/nautilus/no-try-run-strftime.diff     |   28 -
 .../nautilus/nautilus3/no-try-run-strftime.diff    |   41 -
 .../gst-ffmpeg-0.10.13/lower-rank.diff             |   16 -
 ...-Import-necessary-definitions-from-stab.h.patch |  199 -
 .../flite-alsa-1.3/flite-1.3-alsa_support-1.2.diff | 6615 --------------------
 ...Lists.txt-install-FindEigen3.cmake-script.patch |   28 -
 6 files changed, 6927 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/no-try-run-strftime.diff
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus3/no-try-run-strftime.diff
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
 delete mode 100644 meta-oe/recipes-support/flite/flite-alsa-1.3/flite-1.3-alsa_support-1.2.diff
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch

-- 
2.4.0


