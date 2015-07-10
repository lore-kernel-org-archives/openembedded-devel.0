Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 43FB275CE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:30:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 9DE44426BD8;
	Fri, 10 Jul 2015 16:18:02 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tim Orling <TicoTimo@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Brendan Le Foll <brendan.le.foll@intel.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2015 16:17:52 +0200
Message-Id: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-python][PATCH 0/3] new recipes
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
X-List-Received-Date: Fri, 10 Jul 2015 14:30:17 -0000

Adding a couple of new recipes for meta-python.

Sparts is a library for rapid prototyping, integrating thrift,
twisted, tornado and dbus. I specifically did not put any of these in
RDEPEDNDS nor RRECOMMENDS as the modules are not needed unless one
uses them in an application. And once they are used in application,
one would have them in application's RDEPENDS anyway.

Daemonize is a direct dependency for sparts that has not been packaged yet.

Paho MQTT is a Python client library for MQTT 3.1. That's why I've put
Brendan Le Foll, who is listed as maintainer of
meta-intel-iot-middleware, in CC in case he'd be willing to pick this
package for his layer.

Maciej Borzecki (3):
  python-daemonize: add recipe
  python-sparts: add recipe
  python-paho-mqtt: add recipe

 .../python/python-daemonize_2.3.1.bb               | 16 ++++++++++++++
 .../python/python-paho-mqtt_1.1.bb                 | 15 +++++++++++++
 .../recipes-devtools/python/python-sparts_0.7.2.bb | 25 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-sparts_0.7.2.bb

-- 
1.9.3


