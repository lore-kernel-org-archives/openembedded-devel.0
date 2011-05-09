Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJMYR-0002wp-5i for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:15:03 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJMVn-0001nB-4R for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:12:19 +0200
Received: from 62.200.22.2 ([62.200.22.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 11:12:19 +0200
Received: from julian.pidancet by 62.200.22.2 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 11:12:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Julian Pidancet <julian.pidancet@citrix.com>
Date: Mon, 09 May 2011 10:15:29 +0100
Message-ID: <iq8b55$ucr$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 62.200.22.2
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
Subject: glibc-initial task do_rig_locales failed
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
X-List-Received-Date: Mon, 09 May 2011 09:15:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sorry for the bad formatting in my previous e-mail. This is a repost.

I had this issue on both debian and gentoo build machines (so it seems to be independent of the host):

ERROR: Function 'do_rig_locales' failed (see /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/temp/log.do_rig_locales.11104 for further information)
ERROR: Logfile of failure stored in: /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/temp/log.do_rig_locales.11104
Log data follows:
| + cd /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/build-i686-xci-linux
| + do_rig_locales
| + '[' 'xPOSIX en_US en_GB' '!=' x ']'
| + INFILE=/trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/glibc-2.10.1/localedata/SUPPORTED
| + OUTFILE=/trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/glibc-2.10.1/localedata/SUPPORTED.tmp
| + head -n 3 /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/glibc-2.10.1/localedata/SUPPORTED
| + for i in POSIX en_US en_GB
| + echo
| 
| + grep POSIX /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/glibc-2.10.1/localedata/SUPPORTED
| ERROR: Function 'do_rig_locales' failed (see /trees/xci/build/work/i686core2-xci-linux/glibc-initial-2.10.1-r6/temp/log.do_rig_locales.11104 for further information)
NOTE: package glibc-initial-2.10.1-r6: task do_rig_locales: Failed
ERROR: Task 1668 (/trees/xci/openembedded-core/meta/recipes-core/glibc/glibc-initial_2.10.1.bb, do_rig_locales) failed with exit code '1'

For a reason I can't explain, the following patch fixed the issue:

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 127ae23..c2a692b 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -49,7 +49,7 @@ do_rig_locales() {
                head -n 3 $INFILE > $OUTFILE
                for i in ${LIMIT_BUILT_LOCALES}; do
                        echo 
-                       grep $i $INFILE >> $OUTFILE
+                       grep $i $INFILE >> $OUTFILE || true
                done
                head --lines=-1 $OUTFILE > $INFILE
                tail --lines=1 $OUTFILE | sed 's#\\##' >> $INFILE


-- 
Julian Pidancet





