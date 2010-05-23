Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGAjA-0004MQ-Pv
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 14:56:25 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NCqFJk006175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 14:52:15 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGAf8-0000EI-Rz; Sun, 23 May 2010 14:52:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 14:52:12 +0200
Message-Id: <1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH (updated)] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Sun, 23 May 2010 12:56:25 -0000

This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
this patch, it is possible to do

| EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"

where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.

Such flags can be also passed to oe_runconf() directly:

| oe_runconf --with-build-cflags="${BUILD_CFLAGS}"

This patch might create incompatibilities for recipes which workaround
the
current limitations.

As a sideeffect, 'set -x' debug output is now much nicer because
superflous whitespaces in the configure call are removed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/autotools.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 9bb4f6c..2e53cc6 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -64,12 +64,12 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		cfgcmd="${S}/configure \
+		set -- ${S}/configure \
 		        ${CONFIGUREOPTS} \
 			${EXTRA_OECONF} \
-		    $@"
-		oenote "Running $cfgcmd..."
-		$cfgcmd || oefatal "oe_runconf failed" 
+			"$@"
+		oenote "Running $*..."
+		"$@" || oefatal "oe_runconf failed" 
 	else
 		oefatal "no configure script found"
 	fi
-- 
1.7.0.1



