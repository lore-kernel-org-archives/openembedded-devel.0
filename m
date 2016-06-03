Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE5477433
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 06:04:54 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 9501328049C; Thu,  2 Jun 2016 23:04:55 -0700 (PDT)
Date: Thu, 2 Jun 2016 23:04:55 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160603060455.GF7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCHv4 0/3] Tornado 4.3 is missing python2 RDEPENDS
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
X-List-Received-Date: Fri, 03 Jun 2016 06:04:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
from bombing on import errors when running on python2 rather than python3.4

  ImportError: No module named singledispatch

  ImportError: No module named backports_abc

S. Lockwood-Childs (3):
  python-backports-abc: initial recipe for version 0.4
  python-singledispatch: initial recipe for version 3.4.0.3
  python-tornado: add missing python2 runtime deps

 .../python/python-backports-abc_0.4.bb                 | 18 ++++++++++++++++++
 .../python/python-singledispatch_3.4.0.3.bb            | 13 +++++++++++++
 .../recipes-devtools/python/python-tornado_4.3.bb      |  2 +-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb

-- 
1.9.1

