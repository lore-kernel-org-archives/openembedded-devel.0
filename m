Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P67CI-0001Vm-6V
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 21:41:11 +0200
Received: from source ([209.85.214.181]) by na3sys009aob113.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLYLOxjgLqvSieQ3oYmJrl5pyUrUchjv@postini.com;
	Wed, 13 Oct 2010 12:40:44 PDT
Received: by mail-iw0-f181.google.com with SMTP id 39so6900620iwn.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 12:40:42 -0700 (PDT)
Received: by 10.231.157.135 with SMTP id b7mr7238443ibx.164.1286988143324;
	Wed, 13 Oct 2010 09:42:23 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id 27sm7622296yhl.34.2010.10.13.09.42.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 09:42:22 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 12:42:20 -0400
Message-Id: <1286988140-20049-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.149.209
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] [RFC][PATCH] autotools: don't specify --target when configuring gmp
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
X-List-Received-Date: Wed, 13 Oct 2010 19:41:11 -0000

When trying to build angstrom-2008.1 from
f58a5d59b755bdb725497f574a8059529c134c27 of master or from
b78fc95424b5f0fb28246e8c61bb8b4d6a9d733a of stable/2009 the builds failed on
gmp-native (then later gmp). The error was that "--target is not appropriate
for GMP".

This patch adds an exception to the packages for which --target will be passed
to configure. The do_configure stage of the autotools class is modified to not
pass --target if the package is "gmp" or "gmp-native".

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---

A similar change was needed also for the stable/2009 branch -- but this patch
is not applicable to that branch as-is.

Checking the PN for a blacklist of names seems very ugly -- I am open to
suggestions on how this might be better accomplished. Also, I think that the
supressing --target may be applicable to anything that is not a cross-development
tool in general [1]; this is the minimum to get a build without errors so far.

[1] http://sourceware.org/autobook/autobook/autobook_259.html#SEC259
---
 classes/autotools.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index b2de2b1..d9c1d70 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -61,7 +61,6 @@ def autotools_set_crosscompiling(d):
 
 CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --host=${HOST_SYS} \
-		  --target=${TARGET_SYS} \
 		  --prefix=${prefix} \
 		  --exec_prefix=${exec_prefix} \
 		  --bindir=${bindir} \
@@ -79,7 +78,11 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
+		if [ "${PN}" != "gmp" ] && [ "${PN}" != "gmp-native" ]; then
+			CONFIGURETARGETOPTS="--target=${TARGET_SYS}"
+		fi
+
+		${S}/configure ${CONFIGURETARGETOPTS} ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
 	else
 		oefatal "no configure script found"
 	fi
-- 
1.7.0.4



