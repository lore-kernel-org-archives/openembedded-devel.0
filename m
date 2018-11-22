Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C1B616093A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:59:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 17:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,263,1539673200"; d="scan'208";a="106677386"
Received: from hchaw-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.171.138])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2018 17:59:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2018 14:59:08 +1300
Message-Id: <cover.1542851853.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH 0/2] mqtt recipe updates
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
X-List-Received-Date: Thu, 22 Nov 2018 01:59:26 -0000

The following changes since commit c26b10b155cf7873ffc8e966f95fd4abed8230c6:

  opensc: 0.18.0 version fix fetch error (2018-11-16 14:46:44 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mqtt-updates
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mqtt-updates

Paul Eggleton (2):
  mosquitto: update to 1.5.4
  python*-paho-mqtt: upgrade to 1.4.0

 .../0002-uthash-remove-in-tree-version.patch  | 975 ------------------
 ...{mosquitto_1.5.1.bb => mosquitto_1.5.4.bb} |   6 +-
 .../python/python-paho-mqtt.inc               |   5 +-
 ...qtt_1.3.1.bb => python-paho-mqtt_1.4.0.bb} |   0
 ...tt_1.3.1.bb => python3-paho-mqtt_1.4.0.bb} |   0
 5 files changed, 6 insertions(+), 980 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.1.bb => mosquitto_1.5.4.bb} (94%)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.3.1.bb => python-paho-mqtt_1.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.3.1.bb => python3-paho-mqtt_1.4.0.bb} (100%)

-- 
2.17.2


