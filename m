Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1Ka71D-0007d6-Ag
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Sep 2008 12:52:23 +0200
Received: from [172.16.23.144] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1Ka6z8-0007Bf-Ao for openembedded-devel@lists.openembedded.org;
	Mon, 01 Sep 2008 18:50:24 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1Ka6z3-0007sF-E1
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Sep 2008 18:50:09 +0800
Date: Mon, 1 Sep 2008 18:50:09 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20080901105009.GC24372@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.144
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: bitbake 1.8 badness in using same git for different bb
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
X-List-Received-Date: Mon, 01 Sep 2008 10:52:24 -0000
X-Groupsio-MsgNum: 5815
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hi,

in bitbake 1.8 git.py, _revision_key returns ud.host + ud.path, that
means if two bb share the same git dir, the _revision_key will be the
same.  that will cause problem if you use AUTOREV.  the local count
will keep increasing everytime you call bitbake.

for example, mickeydbus and mickeyterm shared the same dir in the same
git repo, and they are both required for fso-image.  so everytime I
run bitbake fso-image the local counts of them will both increase and
I end up with some crazy package names like git24+xxx.  for some
reason linux-openmoko has the same symptom but I didn't take time to
find out.  maybe that's because linux-openmoko_2.6.24+git.bb and
linux-openmoko-devel_git.bb shared the same git dir as well.

this can be fixed by the attached patch (created by Holger in
bitbake-om), but that will reset the local count thus make anyone uses
the OM repo stop upgrading these packages.

I wonder if anyone has the same problem as well and how does he/she
fixes it.


Regards,
John

--pWyiEgJYm5f9v55/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="bitbake1.8-fetch-rev.patch"

Index: lib/bb/fetch/__init__.py
===================================================================
--- lib/bb/fetch/__init__.py	(revision 1079)
+++ lib/bb/fetch/__init__.py	(working copy)
@@ -515,6 +515,8 @@
 
         pd = persist_data.PersistData(d)
         key = self._revision_key(url, ud, d)
+        key = "%s-%s" % (key, bb.data.getVar("PN", d, True) or "")
+
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
         count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")

--pWyiEgJYm5f9v55/--
