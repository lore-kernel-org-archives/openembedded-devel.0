Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UDwyd-0005os-Ll
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 14:04:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Mar 2013 04:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,807,1355126400"; d="scan'208";a="297697065"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2013 04:47:08 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2013 14:47:05 +0200
Message-Id: <1362746826-22762-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-browser][PATCH 0/1] chromium: add support for x86-64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 13:04:53 -0000

Hi,

I gave chromium a test on x86 architecture and, apparently, there was no
support for x86-64. So, I added it (didn't do much actually, just copied
the i586 gypi files and changed the target_arch to x64), built
core-image-sato for qemux86-64, and ran chrome. It worked just fine.

I also removed gtk+-native from the dependencies (there's no need for
the native gtk) and added gtk+ instead (this one is needed).

Please, review it and/or give it a test.

Thanks,
Laurentiu

Laurentiu Palcu (1):
  chromium: add support for x86-64

 .../chromium-24.0.1312.52/x86-64/include.gypi      |    5 +++++
 .../chromium-24.0.1312.52/x86-64/oe-defaults.gypi  |   15 +++++++++++++++
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 ++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi

-- 
1.7.9.5



