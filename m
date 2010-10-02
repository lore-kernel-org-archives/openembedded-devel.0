Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P20R7-0002fK-1I
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 13:39:30 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id AAD251B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Oct 2010 11:42:42 +0000 (UTC)
Message-ID: <4CA719E0.7050409@freyther.de>
Date: Sat, 02 Oct 2010 19:39:12 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RPATH in many modules
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
X-List-Received-Date: Sat, 02 Oct 2010 11:39:31 -0000
X-Groupsio-MsgNum: 24288
Content-Type: multipart/mixed; boundary="------------050305020605000102050502"

--------------050305020605000102050502
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

today I wanted to make the generated toolchain free of RPATH and I was a bit
surprised to see that even the target libraries contain the rpath and that it
is not caught by insane.bbclass.

I have added a more strict check to insane.bbclass to uncover the issue and I
am fighting neon and its manual libtool usage right now... it might be just
easier to use chrpath to fix the resulting libraries.

any opinion?

--------------050305020605000102050502
Content-Type: text/x-patch;
 name="0001-insane.bbclass-Check-for-RPATH-to-the-sysroot-and-co.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-insane.bbclass-Check-for-RPATH-to-the-sysroot-and-co.pa";
 filename*1="tch"

From 18a9dbf4d6925a789e5ecf2852e094c0b1d851fe Mon Sep 17 00:00:00 2001
From: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Sat, 2 Oct 2010 17:14:33 +0800
Subject: [PATCH] insane.bbclass: Check for RPATH to the sysroot and complain

For non-native packages having an rpath to the sysroot is
considered harmful and needs to be fixed. This uncovered
issues in neon and other packages.
---
 classes/insane.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 5afa63c..0515158 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -168,10 +168,13 @@ def package_qa_check_rpath(file,name,d, elf):
     if not bad_dir in bb.data.getVar('WORKDIR', d, True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
 
+    sysroot = bb.data.getVar('STAGING_DIR_HOST', d, True)
+    native = bb.data.inherits_class('native', d)
+
     output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
     txt    = output.readline().split()
     for line in txt:
-        if bad_dir in line:
+        if bad_dir in line or (not native and sysroot in line):
             error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
             sane = package_qa_handle_error(1, error_msg, name, file, d)
 
-- 
1.7.3.1


--------------050305020605000102050502--
