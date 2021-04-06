Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.8257.1617688200211509163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 22:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: kartikey.rameshbhai.parmar@intel.com)
IronPort-SDR: 5cOnH2rBUqVyIhMdzligWpT7wRuN+/lbkfF5rBPN9CgHeKivnNVDt2WYa11poEJ6nrFyLz4XfC
 0pcQOuH2E1ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="256977269"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="256977269"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 22:49:58 -0700
IronPort-SDR: oQD3bdDWaM1WaVj3RD3j6IohK4aWCLnE/jCC9v9iKXJTLXBBBcjiD4u+iNwAVbmObdNsHVkePf
 ryxj3MqPqnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="612400069"
Received: from ubuntu161tb.png.intel.com ([10.88.227.41])
  by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2021 22:49:58 -0700
From: "Kartikey Rameshbhai Parmar" <kartikey.rameshbhai.parmar@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
Date: Tue,  6 Apr 2021 05:49:53 +0000
Message-Id: <20210406054953.5183-1-kartikey.rameshbhai.parmar@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

Remove branch 2.1.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 74a2683ac..c2badc446 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
 SRCREV = "e2d67ea77237046b703d537aec90620c22f7f629"
 S = "${WORKDIR}/git"
 PV = "2.1.7"
-- 
2.31.1

