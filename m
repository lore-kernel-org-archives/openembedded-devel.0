Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KhsUi-0007Jp-UY
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Sep 2008 22:58:56 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9257B8400A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2008 22:55:27 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7233D8400A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2008 22:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e177084210.adsl.alicedsl.de
	[85.177.84.210]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2008 22:55:26 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id CDDE43C1D7; Mon, 22 Sep 2008 22:55:25 +0200 (CEST)
Date: Mon, 22 Sep 2008 22:55:25 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080922205525.GA23908@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Finer granularity for RSUGGEST
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
X-List-Received-Date: Mon, 22 Sep 2008 20:58:57 -0000
X-Groupsio-MsgNum: 5919
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

after fiddling with a filesystem kernel modul and his tools I noticed
in package_ipk.bbclass that if we set RSUGGESTS Variable the suggest field
in the ipk is set for all packages even -doc -dbg -dev and self defined
packages.  I personal
think is not a good choice and way. In my example the kernel module only needs
to suggest the tools package. And with the old method the tools package suggest
it self.

I have prepared a patch for ipk and deb that let us set:

${PN}_RSUGGESTS = mooo

I hope the patch do not break the old behavior.

If I get positiv feedback I will check it in.

Bye Henning

--Nq2Wo0NMKNjxTN9z
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="package.patch"

#
# old_revision [1cf701ebedabbcfca1fb1b88f2077258b1dfd000]
#
# patch "classes/package_deb.bbclass"
#  from [a780e6f7dff8c1d720645d2b4f66b6f8e05d576d]
#    to [962d33da2b1d4cb489270ad65397c5ce10adf8e7]
# 
# patch "classes/package_ipk.bbclass"
#  from [74c1d60c5b62a72c229c78bd65e5a0a0cf6486f1]
#    to [acf85c751b2bba622bd398108d70a8bc3854354f]
#
============================================================
--- classes/package_deb.bbclass	a780e6f7dff8c1d720645d2b4f66b6f8e05d576d
+++ classes/package_deb.bbclass	962d33da2b1d4cb489270ad65397c5ce10adf8e7
@@ -193,7 +193,7 @@ python do_package_deb () {
         rdepends = [dep for dep in rdepends if not '*' in dep]
         rrecommends = explode_deps(unicode(bb.data.getVar("RRECOMMENDS", localdata, 1) or ""))
         rrecommends = [rec for rec in rrecommends if not '*' in rec]
-        rsuggests = (unicode(bb.data.getVar("RSUGGESTS", localdata, 1) or "")).split()
+	rsuggests = (unicode(bb.data.getVar("RSUGGESTS", localdata, 1) or bb.data.getVar(pkgname + '_RSUGGESTS', localdata, 1) or "")).split()
         rprovides = (unicode(bb.data.getVar("RPROVIDES", localdata, 1) or "")).split()
         rreplaces = (unicode(bb.data.getVar("RREPLACES", localdata, 1) or "")).split()
         rconflicts = (unicode(bb.data.getVar("RCONFLICTS", localdata, 1) or "")).split()
============================================================
--- classes/package_ipk.bbclass	74c1d60c5b62a72c229c78bd65e5a0a0cf6486f1
+++ classes/package_ipk.bbclass	acf85c751b2bba622bd398108d70a8bc3854354f
@@ -229,7 +229,8 @@ python do_package_ipk () {
 
 		rdepends = explode_deps(bb.data.getVar("RDEPENDS", localdata, 1) or "")
 		rrecommends = explode_deps(bb.data.getVar("RRECOMMENDS", localdata, 1) or "")
-		rsuggests = (bb.data.getVar("RSUGGESTS", localdata, 1) or "").split()
+		rsuggests = (bb.data.getVar("RSUGGESTS", localdata, 1) or bb.data.getVar(pkgname + '_RSUGGESTS', localdata, 1) or "").split()
+
 		rprovides = (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
 		rreplaces = (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
 		rconflicts = (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()

--Nq2Wo0NMKNjxTN9z--
