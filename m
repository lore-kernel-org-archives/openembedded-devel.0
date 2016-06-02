Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 553EF77453
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 18:28:00 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 29E352808CA; Thu,  2 Jun 2016 11:28:01 -0700 (PDT)
Date: Thu, 2 Jun 2016 11:28:01 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160602182801.GZ7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160602182426.GW7939@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCHv3 3/3] python-tornado: add missing python2 runtime deps
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
X-List-Received-Date: Thu, 02 Jun 2016 18:28:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tornado 4.3 needs backports_abc and singledispatch backport modules
at runtime to prevent tornado/gen.py from bombing on import errors
when running on python2 rather than python3.4

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-python/recipes-devtools/python/python-tornado_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-tornado_4.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
index 55a48b8..d30f88f 100644
--- a/meta-python/recipes-devtools/python/python-tornado_4.3.bb
+++ b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
@@ -1,3 +1,3 @@
 inherit pypi setuptools
 require python-tornado.inc
-RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl"
+RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl ${PYTHON_P}-backports-abc ${PYTHON_PN}-singledispatch"
-- 
1.9.1


