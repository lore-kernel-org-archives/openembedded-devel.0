Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OHcSv-0004ki-O2
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 14:45:45 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4RCfDCt024361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 May 2010 14:41:14 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OHcOf-0000oo-Fk; Thu, 27 May 2010 14:41:13 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:41:09 +0200
Message-Id: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/3] base.bbclass: added oe_param_bool() method
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
X-List-Received-Date: Thu, 27 May 2010 12:45:49 -0000

This new function works like dict's get() method but converts the
returned value to a boolean.

It is to be used to interpret e.g. 'apply=yes' parameters in SRC_URI.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/base.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 8bac509..21b5646 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -161,6 +161,16 @@ python base_do_fetch() {
 			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
 }
 
+def oe_param_bool(cfg, field, dflt):
+	"""Lookup <field> in <cfg> map and convert it to a boolean; take 
+        <dflt> when this <field> does not exist"""
+	v = ("%s" % cfg.get(field, dflt)).lower()
+	if v in ['yes', 'y', 'true', 't', '1']:
+		return True
+	if v in ['no', 'n', 'false', 'f', '0']:
+		return False
+	raise bb.build.FuncFailed("Can not convert '%s' to boolean" % v)
+
 def oe_unpack_file(file, data, url = None):
 	import subprocess
 	if not url:
-- 
1.7.0.1



