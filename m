Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	by mail.openembedded.org (Postfix) with ESMTP id CAEEA78E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 03:27:25 +0000 (UTC)
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 37882240005;
	Fri,  3 Aug 2018 03:27:24 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2018 20:26:59 -0700
Message-Id: <20180803032704.3521-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.4
Subject: [meta-python][PATCH v3 0/5] Add python3-behave Recipe
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
X-List-Received-Date: Fri, 03 Aug 2018 03:27:26 -0000

Add Python 3 version of python-behave and its dependencies. Fix missing
dependencies for the Python 2 recipe as well.

Changes in v2:
* Clarify license of python-parse-type from BSD to BSD-3-Clause
* Add HOMEPAGE to python-parse-type.inc

Changes in v3:
* The python-parse recipe was bumped to a newer version on master.
  Rebase on master, adding python3-parse only.
* Add HOMEPAGE to python-parse.inc

Robert Joslyn (5):
  python-linecache2: Add recipe
  python-traceback2: Add recipe
  python3-parse: Add recipe
  python-parse-type: Add Python 3 recipe
  python-behave: Add Python 3 recipe

 meta-python/recipes-devtools/python/python-behave.inc    | 15 +++++++++++++++
 .../recipes-devtools/python/python-behave_1.2.6.bb       | 16 +++++++---------
 .../recipes-devtools/python/python-linecache2_1.0.0.bb   | 13 +++++++++++++
 .../recipes-devtools/python/python-parse-type.inc        | 12 ++++++++++++
 .../recipes-devtools/python/python-parse-type_0.4.2.bb   | 13 ++-----------
 meta-python/recipes-devtools/python/python-parse.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-parse_1.8.4.bb        | 15 ++-------------
 .../recipes-devtools/python/python-traceback2_1.4.0.bb   | 15 +++++++++++++++
 .../recipes-devtools/python/python3-behave_1.2.6.bb      |  2 ++
 .../recipes-devtools/python/python3-parse-type_0.4.2.bb  |  2 ++
 .../recipes-devtools/python/python3-parse_1.8.4.bb       |  2 ++
 11 files changed, 86 insertions(+), 33 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-behave.inc
 create mode 100644 meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc
 create mode 100644 meta-python/recipes-devtools/python/python-parse.inc
 create mode 100644 meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-parse_1.8.4.bb

-- 
2.16.4


