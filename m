Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCe-0000ra-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541515"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:07 +0000
Message-Id: <cover.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/6] Python library additions/improvements
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
X-List-Received-Date: Fri, 08 Feb 2013 15:49:28 -0000

Some additional recipes and updates for some Python libraries, in
preparation for supporting an Ajenti recipe (which will be sent
separately.)

Kevin Strasser <kevin.strasser@linux.intel.com> helped to test and
improve these.


The following changes since commit 61911b23099c2658186179504ded318c987b5276:

  ttf: introduce update-fonts bbclass and change all ttf recipes to use it (2013-02-06 15:16:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/python-bits
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/python-bits

Paul Eggleton (6):
  python-feedparser: add new recipe for version 5.1.3
  python-greenlet: add new recipe for version 0.3.4
  python-gevent: add new recipe for version 0.13.8
  python-psutil: add new recipe for version 0.6.1
  python-pyopenssl: tweak recipe
  python-lxml: update to 3.0.2 and tweak

 .../python/python-feedparser_5.1.3.bb               |   14 ++++++++++++++
 .../recipes-devtools/python/python-gevent_0.13.8.bb |   19 +++++++++++++++++++
 .../python/python-greenlet_0.3.4.bb                 |   14 ++++++++++++++
 .../{python-lxml_2.2.8.bb => python-lxml_3.0.2.bb}  |   13 ++++++-------
 .../recipes-devtools/python/python-psutil_0.6.1.bb  |   14 ++++++++++++++
 .../python/python-pyopenssl_0.13.bb                 |    4 ++--
 6 files changed, 69 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb
 rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb => python-lxml_3.0.2.bb} (76%)
 create mode 100644 meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb

-- 
1.7.10.4



