Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8C977CEF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 04:03:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 21:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,456,1498546800"; d="scan'208";a="124583301"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2017 21:03:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 16:02:31 +1200
Message-Id: <cover.1504238509.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-oe][PATCH 0/2] Add a couple of MQTT support recipes
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
X-List-Received-Date: Fri, 01 Sep 2017 04:03:14 -0000

Add a couple of recipes from meta-intel-iot-middleware to support MQTT.
Since the meta-intel-iot-middleware layer isn't being actively maintained
and these aren't in any way Intel-specific I figured they ought to be
brought up-to-date and moved somewhere that people can more easily reuse
them.

FWIW, at least mosquitto is something I plan on using personally, and
I'm more than happy sign up to maintaining these in future.


The following changes since commit e5681e1dca96d3f313b3b2b346789f22483d7881:

  layer.conf: remove FREESMARTPHONE_GIT variable (2017-08-31 14:22:12 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mqtt-recipes
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mqtt-recipes

Paul Eggleton (2):
  mosquitto: add from meta-intel-iot-middleware and update
  paho-mqtt-c: add recipe from meta-intel-iot-middleware and update

 .../mosquitto/files/build.patch                    | 94 ++++++++++++++++++++++
 .../mosquitto/files/mosquitto.init                 | 89 ++++++++++++++++++++
 .../mosquitto/files/mosquitto.service              | 15 ++++
 .../mosquitto/mosquitto_1.4.14.bb                  | 80 ++++++++++++++++++
 .../paho-mqtt-c/files/makefile.patch               | 25 ++++++
 .../paho-mqtt-c/paho-mqtt-c_1.2.0.bb               | 35 ++++++++
 6 files changed, 338 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/build.patch
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service
 create mode 100644 meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb

-- 
2.9.5


