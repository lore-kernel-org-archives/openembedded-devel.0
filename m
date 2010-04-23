Received: from server.road.de ([85.10.209.111] helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <j.erdmann@road.de>) id 1O5Fwt-0003QV-9p
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 12:17:40 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 3BC8139000B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 12:04:45 +0200 (CEST)
Received: from [192.168.116.53] (bienemaja.handy-pc.constin.de
	[192.168.116.53])
	by slimfast.dyndns.org (Postfix) with ESMTP id 0DCD6454315
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 12:04:45 +0200 (CEST)
Message-ID: <4BD170BC.8020103@road.de>
Date: Fri, 23 Apr 2010 12:04:44 +0200
From: Jens Erdmann <j.erdmann@road.de>
Organization: Road GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100411 Icedove/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 85.10.209.111
X-SA-Exim-Mail-From: j.erdmann@road.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Patch] locking in do_package_tar
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
X-List-Received-Date: Fri, 23 Apr 2010 10:17:46 -0000
X-Groupsio-MsgNum: 18744
Content-Type: multipart/mixed; boundary="------------000203040104030804080707"

--------------000203040104030804080707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey folks,

I would like to introduce locking in do_package_tar. I had a case here 
were do_package_tar and do_package_ipk where running parallel. Because 
of this "tar: .: file changed as we read it" occurs. I fixed it by 
introduce locking in do_package_tar. What do you think about it?



-- 
------- ROAD ...the handyPC Company - - -  ) ) )

Jens Erdmann
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing director: Hans-Peter Constien


--------------000203040104030804080707
Content-Type: text/x-diff;
 name="oe_tar_lock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="oe_tar_lock.patch"

diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
index b905e17..47bf2cc 100644
--- a/classes/package_tar.bbclass
+++ b/classes/package_tar.bbclass
@@ -58,6 +58,7 @@ python do_package_tar () {
 		localdata = bb.data.createCopy(d)
 		pkgdest = bb.data.getVar('PKGDEST', d, 1)
 		root = "%s/%s" % (pkgdest, pkg)
+		lf = bb.utils.lockfile(root + ".lock")
 
 		bb.data.setVar('ROOT', '', localdata)
 		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
@@ -65,6 +66,7 @@ python do_package_tar () {
 
 		overrides = bb.data.getVar('OVERRIDES', localdata)
 		if not overrides:
+			bb.utils.unlockfile(lf)
 			raise bb.build.FuncFailed('OVERRIDES not defined')
 		overrides = bb.data.expand(overrides, localdata)
 		bb.data.setVar('OVERRIDES', '%s:%s' % (overrides, pkg), localdata)
@@ -82,10 +84,12 @@ python do_package_tar () {
 		from glob import glob
 		if not glob('*') + glob('.[!.]*'):
 			bb.note("Not creating empty archive for %s-%s" % (pkg, bb.data.expand('${PV}-${PR}${DISTRO_PR}', d, True)))
+			bb.utils.unlockfile(lf)
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
 		if ret != 0:
 			bb.error("Creation of tar %s failed." % tarfn)
+		bb.utils.unlockfile(lf)
 }
 
 python () {

--------------000203040104030804080707--
