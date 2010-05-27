Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OHcSx-0004kl-7h
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 14:45:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4RCfLA9024386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 May 2010 14:41:21 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OHcOn-0000ou-AU; Thu, 27 May 2010 14:41:21 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:41:10 +0200
Message-Id: <5632cd85522c89e5cf788422f28191cbc04bfe96.1274963939.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH 2/3] base.bbclass: fixed 'apply=no' behavior
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
X-List-Received-Date: Thu, 27 May 2010 12:45:40 -0000

After the recent change to autodetect patchfiles in SRC_URI's, files
with 'apply=no' were not copied to workdir anymore.  This broke e.g.
dropbear which marks a patch as 'apply=no' and applies it manually.

This patch evaluates content of 'apply' parameter and copies files to
workdir when it is not a patch or the parameter is false.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/base.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 21b5646..f21d8ad 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -217,7 +217,8 @@ def oe_unpack_file(file, data, url = None):
 		cmd = 'cp -pPR %s %s/%s/' % (file, os.getcwd(), destdir)
 	else:
 		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
-		if not 'apply' in parm and not 'patch' in parm:
+		is_patch = path.endswith('.diff') or path.endswith('.patch')
+		if not oe_param_bool(parm, 'apply', is_patch) and not oe_param_bool(parm, 'patch', False):
 			# The "destdir" handling was specifically done for FILESPATH
 			# items.  So, only do so for file:// entries.
 			if type == "file":
-- 
1.7.0.1



