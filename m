Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M8nZK-0003nj-BJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 05:43:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8FC2D4BEAED;
	Mon, 25 May 2009 23:35:10 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28250-03; Mon, 25 May 2009 23:35:10 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 702834BFEB6; Mon, 25 May 2009 23:35:10 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8C14C4BC41B;
	Mon, 25 May 2009 23:35:09 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 8ECEF40F9B; Mon, 25 May 2009 23:35:09 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 23:35:09 -0400
Message-Id: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] busybox: allow building when prefix is "", not "/usr".
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
X-List-Received-Date: Tue, 26 May 2009 03:43:14 -0000

There was code to handle this, but it needed a tweak to prevent copying
a directory on top of itself. Other prefixes (besides /usr) may also
work now, but this is untested.

busybox will also build when base_sbindir is "/bin" instead of "/sbin".

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

For insane backwards compatibility reasons (my own fault) I would like
to be able to create packages with no /usr and /sbin == /bin. Most
autoconf packages are happy about this; busybox just needs a little
help.

btw, I have not yet figured out where ${layout_blah} vs. ${blah}
should be used (e.g. ${layout_prefix} and ${prefix}). I've tried to be
consistent, so I figure there's a 50% chance I guessed right.

 recipes/busybox/busybox.inc |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index acf47f2..04f2cf4 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -62,12 +62,15 @@ do_compile() {
 
 do_install () {
 	oe_runmake busybox.links
-	if [ "x${layout_prefix}" = "x" ]; then
-		sed 's:^/usr/:/:' < busybox.links >busybox.links.new
+	if [ "${prefix}" != "/usr" ]; then
+		sed "s:^/usr/:${prefix}/:" busybox.links > busybox.links.new
 		mv busybox.links.new busybox.links
-        elif [ "${layout_prefix}" != "/usr" ]; then
-		echo "warning, busybox.links will lose with this prefix"
 	fi
+	if [ "${base_sbindir}" != "/sbin" ]; then
+		sed "s:^/sbin/:${base_sbindir}/:" busybox.links > busybox.links.new
+		mv busybox.links.new busybox.links
+	fi
+
 	unset CFLAGS CPPFLAGS CXXFLAGS
 	install -d ${D}${sysconfdir}/init.d
 	oe_runmake "PREFIX=${D}" install
@@ -77,9 +80,11 @@ do_install () {
 	install -d ${D}/busybox
 	ls ${D} -R
 
-	for i in ${D}${base_bindir} ${D}${base_sbindir} ${D}${prefix} ; do
+	# Copy /bin and /sbin -- and /usr, if prefix is not "".
+	for i in ${D}${base_bindir} ${D}${base_sbindir} ${prefix:+${D}${prefix}}
+	do
 		if [ -d $i ]; then
-			cp -dPr $i ${D}/busybox/
+			cp -pPR $i ${D}/busybox/
 		fi
 	done
 	# Move the busybox binary back to /bin
-- 
1.5.6.5



