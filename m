Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NnZH2-0001qK-Ez
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 16:17:09 +0100
Received: from homiemail-a22.g.dreamhost.com (caiajhbdcaib.dreamhost.com
	[208.97.132.81])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 389FA178CCF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Mar 2010 07:14:15 -0800 (PST)
Received: from sspaeth.de (vpn-global-dhcp2-98.ethz.ch [129.132.209.98])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPA id 880FD1A805F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Mar 2010 07:14:11 -0800 (PST)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Fri, 05 Mar 2010 16:14:08 +0100
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 05 Mar 2010 16:14:08 +0100
Message-ID: <87hbou4x8f.fsf@SSpaeth.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Convert vala to new world staging
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
X-List-Received-Date: Fri, 05 Mar 2010 15:17:09 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=

All vala recipes currently complain about being lagacy stages. With a
lot of help from my friends I came up with this patch for
classes/vala.bbclass.


I am currently testing a few compiles and installs with this patch. But
I want to gather feedback and ACKs from Mickey (OE vala God) and others.

Does this make sense?
Sebastian

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=valastaging.patch
Content-Description: Convert vala to new world staging

diff --git a/classes/vala.bbclass b/classes/vala.bbclass
index 2633905..2c23efb 100644
--- a/classes/vala.bbclass
+++ b/classes/vala.bbclass
@@ -9,8 +9,8 @@ VALA_DONT_STAGE_VAPIS ?= "\(/config.vapi$\)\|\(/config.deps$\)"
 
 # .vapi and .deps files are arch independent and need to be present in the
 # staging datadir for the native vala compiler
-do_stage_append() {
-	install -d ${STAGING_DATADIR_NATIVE}/vala/vapi
-	for VALAFILE in `find . -name "*.vapi" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
-	for VALAFILE in `find . -name "*.deps" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
+do_install_append() {
+	install -d ${D}${datadir}/vala/vapi
+	for VALAFILE in `find . -name "*.vapi" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${D}${datadir}/vala/vapi/; done
+	for VALAFILE in `find . -name "*.deps" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${D}${datadir}/vala/vapi/; done
 }

--=-=-=--
