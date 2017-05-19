Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 94D1F72FB0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 22:27:32 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 1B89A280347; Fri, 19 May 2017 15:27:57 -0700 (PDT)
Date: Fri, 19 May 2017 15:27:57 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170519222757.GA22446@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20170513063415.GQ9767@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20170513063415.GQ9767@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][master][pyro][PATCH] python-cython: mangle scripts to use /usr/bin/env python
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
X-List-Received-Date: Fri, 19 May 2017 22:27:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This prevents runtime failure "bad interpreter: No such file or directory"
from running native cython when the native python is installed
at a long path, exceeding the 128-character limit for shebang lines
on linux. Exceeding the limit was already possible when using a long
path for topdir, but it got easier to exceed after the switch to per-recipe
sysroots.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-python/recipes-devtools/python/python-cython.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 1ecdcc9..66383bf 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -17,3 +17,10 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-shell \
 "
+
+do_install_append() {
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl '^!#.*python' ${D}${bindir}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
+	done
+}
-- 
1.9.4


