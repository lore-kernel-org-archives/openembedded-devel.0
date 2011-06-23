Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1QZhzQ-0008Ju-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 13:22:28 +0200
Received: from [192.168.0.101] (91-64-95-94-dynip.superkabel.de [91.64.95.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 3FD1E1B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:26:01 +0000 (UTC)
Message-ID: <4E03211B.40205@freyther.de>
Date: Thu, 23 Jun 2011 13:18:51 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 11:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I have some messy source (as the cleanup is going on), I need to pull the new
code from one repo and some files from the old one. Now in the recipes I have:

SRC_URI = "git://git@....git;protocol=ssh;name=first \
           git://git@....git;protocol=ssh;name=second"
SRCREV_FORMAT = "first-rsecond"
SRCREV_first = "ABC"
SRCREV_second = "DEF"
PV = "0.0+git${SRCPV}"
(too bad that we have inconsistency between git, gitr again)

This is all fluffy, the right things seem to be cloned but there is only one
${WORKDIR}/git and one or the other will end up in there. Somehow I think we
had something like this before but here is the proposal:

Introduce a ;destsuffix=DEST so the code will be checked out to DEST/ instead
of git/.


comments?
	holger


commit e45b5b3b917eaba42052760c82c9b4ca57670136
Author: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Date:   Thu Jun 23 04:50:13 2011 +0800

    fetch2/git: Allow to specify the name of the checkout directory

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 6979bea..4d45b48 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -209,7 +209,9 @@ class Git(FetchMethod):
         else:
             readpathspec = ""

-        destdir = os.path.join(destdir, "git/")
+        destsuffix = ud.parm.get("destsuffix", "git/")
+        print destsuffix
+        destdir = os.path.join(destdir, destsuffix)
         if os.path.exists(destdir):
             bb.utils.prunedir(destdir)



