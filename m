Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ouiog-00087g-Kd
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 11:25:43 +0200
Received: from [192.168.42.31] (unknown [92.116.249.73])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 288311B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 09:26:48 +0000 (UTC)
Message-ID: <4C8C9C66.7030006@freyther.de>
Date: Sun, 12 Sep 2010 17:24:54 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sanity.bbclass: Check for the presennce of libc.a
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
X-List-Received-Date: Sun, 12 Sep 2010 09:25:43 -0000
X-Groupsio-MsgNum: 23469
Content-Type: multipart/mixed; boundary="------------030106080502040802050206"

--------------030106080502040802050206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


The insmod.static binary links statically and requires the libc.a
to be present. On Fedora glibc-static is not installed by default
when installing development headers. Warn the user that he needs
to have that installed.

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
---
 classes/sanity.bbclass |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)



--------------030106080502040802050206
Content-Type: text/x-patch;
 name="0001-sanity.bbclass-Check-for-the-presennce-of-libc.a.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-sanity.bbclass-Check-for-the-presennce-of-libc.a.patch"

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 575530a..7f99251 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -99,6 +99,18 @@ def check_sanity(e):
 		missing = missing.rstrip(',')
 		messages = messages + "Please install following missing utilities: %s\n" % missing
 
+	# Libs that need to be present. E.g. libc.a for insmod.static
+	required_libs = "libc.a"
+	missing = ""
+	for lib in required_libs.split():
+		if not os.path.exists("/lib/%s" % lib) and not os.path.exists("/usr/lib/%s" % lib):
+			missing = "%s, %s" % (missing, lib)
+
+	if missing != "":
+		missing = missing.rstrip(',')
+		messages = "%sPlease install the following libraries: %s\n" % (messages, missing)
+
+
 	try:
 	    if os.path.basename(os.readlink('/bin/sh')) == 'dash':
 		    messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead.\n"


--------------030106080502040802050206--
