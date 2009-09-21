Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MppBL-0001cO-Iq
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 22:08:22 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-1e-4ab7dd0e49c0
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: OE-Dev <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Sep 2009 16:07:40 -0400
Message-Id: <1253563660.4551.12.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Bitbake filterProviders does not respect sorted priorities
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
X-List-Received-Date: Mon, 21 Sep 2009 20:08:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Cross-posting to the OE list since I haven't heard anything from the
bitbake list after posting this last week. The providers code ignores
package priorities and as a result unexpected packages can get chosen
when using overlays with different priority settings.

Original message posted to bitbake mailing list:

I am using bitbake 1.8.13 within OE, and I ran into a problem today
where the wrong package was being selected.

Digging into the problem, I found that the code that sorts packages does
not respect the priority order.

By iterating over sortpkg_pn.keys() instead of pkg_pn.keys(), it
produces the expected order based on the priorities I have set. Patch
below:

diff --git a/lib/bb/providers.py b/lib/bb/providers.py
index 8970fb3..6c1cf78 100644
--- a/lib/bb/providers.py
+++ b/lib/bb/providers.py
@@ -191,7 +191,7 @@ def _filterProviders(providers, item, cfgData,
dataCache):
             eligible.append(preferred_versions[pn][1])

     # Now add latest verisons
-    for pn in pkg_pn.keys():
+    for pn in sortpkg_pn.keys():
         if pn in preferred_versions and preferred_versions[pn][1]:
             continue
         preferred_versions[pn] = findLatestProvider(pn, cfgData,
dataCache, sortpkg_pn[pn][0])


