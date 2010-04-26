Received: from p3plsmtpa01-04.prod.phx3.secureserver.net ([72.167.82.84])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1O6RGZ-0001ji-Ve
	for openembedded-devel@openembedded.org; Mon, 26 Apr 2010 18:34:42 +0200
Received: (qmail 14397 invoked from network); 26 Apr 2010 16:24:20 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	26 Apr 2010 16:24:20 -0000
Message-ID: <4BD5BE2F.7030407@mwester.net>
Date: Mon, 26 Apr 2010 11:24:15 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.84
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fix: stage hidden files as well
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
X-List-Received-Date: Mon, 26 Apr 2010 16:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The following patch is a proposed patch to fix the problem where hidden
files are sometimes missed during staging.  A specific example is that
the symbolic link ".config" is not copied to the kernel staging area,
which causes madwifi-ng to fail to build.

diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index 32038a5..cb19cb9 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -35,6 +35,13 @@ sysroot_stage_dir() {
        if [ -d "$src" ]; then
                mkdir -p "$dest"
                cp -fpPR "$src"/* "$dest"
+               # Get hidden files as well, but carefully
+               for i in "$src"/.*
+               do
+                       if [ "$i" != "$src"/. -a "$i" != "$src"/.. ]; then
+                              cp -fpPR "$i" "$dest"
+                       fi
+               done
        fi
 }

If anyone has a better way to address the copy operations above, that
would be great.

-Mike (mwester)



