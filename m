Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1NrVPo-000182-Us
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 12:58:29 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o2GBtNQT014336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Mar 2010 12:55:23 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.69) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1NrVMp-0002fr-NM; Tue, 16 Mar 2010 12:55:23 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 12:55:21 +0100
Message-Id: <1268740521-10248-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.6.6.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] kernel.bbclass: fixed dependency calculation with recent modutils
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
X-List-Received-Date: Tue, 16 Mar 2010 11:58:29 -0000

'depmod' from  recent module-init-tools (version 3.9 or later) returns
paths relative to /lib/modules/`uname -r`.  E.g. 'modules.dep' contain

| kernel/fs/nfs_common/nfs_acl.ko: kernel/net/sunrpc/sunrpc.ko

instead of absolute pathnames.

The dependency calculation of kernel modules depends on absolutes paths
which are readded by this patch.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/kernel.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 69ab422..29a7e64 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -381,6 +381,17 @@ python populate_packages_prepend () {
 					deps[m2.group(1)].extend(m4.group(1).split())
 			line = f.readline()
 		f.close()
+
+		# Modern modutils do not add the "/lib/modules/`uname -r`"
+		# path to the module dependencies anymore. To keep backward
+		# compatibility, re-add them here
+		add_moddir = (lambda x:
+			      ("/lib/modules/%s/%s" % (kernelver_stripped, x),
+			       x)[x[0] == '/'])
+		deps = dict(map(lambda (key,val):
+				(add_moddir(key),
+				 map(lambda x: add_moddir(x), val)),
+				deps.items()))
 		return deps
 	
 	def get_dependencies(file, pattern, format):
-- 
1.6.6.1



