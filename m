Return-Path: <clopez@igalia.com>
X-Greylist: delayed 614 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Sep 2015 13:00:18 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 4305D73D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:00:18 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AOAgDLEvhV/5tjdVteGQEBgwgBU2mtW49xAQ2BaguHQTgUAQEBAQEBAYEKjyYBpVakRoZziiiEFQWVXIUQh3OIfZIGHwEBQoFKAQuCLTwzAQGKKAEBAQ
X-IPAS-Result: A2AOAgDLEvhV/5tjdVteGQEBgwgBU2mtW49xAQ2BaguHQTgUAQEBAQEBAYEKjyYBpVakRoZziiiEFQWVXIUQh3OIfZIGHwEBQoFKAQuCLTwzAQGKKAEBAQ
X-IronPort-AV: E=Sophos;i="5.17,535,1437429600"; d="scan'208";a="22813605"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Sep 2015 14:50:04 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZbpgR-0000Fk-Gp; Tue, 15 Sep 2015 14:50:03 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:49:59 +0200
Message-Id: <1442321402-22469-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser][PATCH 0/3] chromium: make the build type configurable.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 13:00:19 -0000

 This serie of patches adds 2 new variables that allow a more fine
 control of the Chromium build without needing to modify the recipe.
 (This can be configured in conf/local.conf)

 CHROMIUM_BUILD_TYPE = ['Release', 'Debug']
 CHROMIUM_ENABLE_WAYLAND = ['0', '1']


Carlos Alberto Lopez Perez (3):
  chromium: Allow to build in Debug mode.
  chromium: Clean the definitions of some ozone-wayland variables.
  chromium: Rework the evaluation of the Wayland feature.

 recipes-browser/chromium/chromium.inc              |  4 +-
 .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 +++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  | 63 +++++++++++++---------
 3 files changed, 74 insertions(+), 25 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch

-- 
2.1.4

