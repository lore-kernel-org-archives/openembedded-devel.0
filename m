Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1NrVE4-0003Kq-55
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 12:46:21 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o2GBhGZw012002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Mar 2010 12:43:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.69) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1NrVB6-0002bu-2e; Tue, 16 Mar 2010 12:43:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 12:42:54 +0100
Message-Id: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
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
Subject: [PATCH] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Tue, 16 Mar 2010 11:46:21 -0000

This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
this patch, it is possible to do

| EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"

where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.

Such flags can be also passed to oe_runconf() directly:

| oe_runconf --with-build-cflags="${BUILD_CFLAGS}"

This patch might create incompatibilities for recipes which workaround the
current limitations.

As a sideeffect, 'set -x' debug output is now much nicer because
superflous whitespaces in the configure call are removed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/autotools.bbclass |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index c53583b..508bd58 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -40,7 +40,7 @@ def autotools_set_crosscompiling(d):
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		cfgcmd="${S}/configure \
+		set -- ${S}/configure \
 		    --build=${BUILD_SYS} \
 		    --host=${HOST_SYS} \
 		    --target=${TARGET_SYS} \
@@ -57,11 +57,10 @@ oe_runconf () {
 		    --includedir=${includedir} \
 		    --oldincludedir=${oldincludedir} \
 		    --infodir=${infodir} \
-		    --mandir=${mandir} \
-			${EXTRA_OECONF} \
-		    $@"
-		oenote "Running $cfgcmd..."
-		$cfgcmd || oefatal "oe_runconf failed" 
+		    --mandir=${mandir}	\
+		    ${EXTRA_OECONF} "$@"
+		oenote "Running $*..."
+		"$@" || oefatal "oe_runconf failed"
 	else
 		oefatal "no configure script found"
 	fi
-- 
1.6.6.1



