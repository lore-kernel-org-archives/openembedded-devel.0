Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQ2pe-0008MU-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 16:50:37 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1287814waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 07:50:16 -0800 (PST)
Received: by 10.114.195.19 with SMTP id s19mr3083991waf.57.1203090616501;
	Fri, 15 Feb 2008 07:50:16 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id i7sm347499nfh.14.2008.02.15.07.50.13
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 07:50:15 -0800 (PST)
Date: Fri, 15 Feb 2008 17:50:32 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080215175032.545c9b9a@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.146.183
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] PKGPV/PKGPR of the PKG fame
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 15:50:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

We now have ability to arbitrarily rename a package as built by
package manager using PKG_<name> construct. Natural and consistent
extension to that would be to allow to rename other parts of full
package name - version and release.

This is useful for building meta-recipes, which package something from
external source without need to know version beforehand.

============================================================
--- classes/package_ipk.bbclass	026a54435a436ef29405fa6b02afea519cc76ce7
+++ classes/package_ipk.bbclass	8e5149b5da37896aa010037382baaf42cefec0a6
@@ -166,10 +166,19 @@ python do_package_ipk () {
 
 		bb.data.setVar('ROOT', '', localdata)
 		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
+
 		pkgname = bb.data.getVar('PKG_%s' % pkg, localdata, 1)
 		if not pkgname:
 			pkgname = pkg
 		bb.data.setVar('PKG', pkgname, localdata)
+		pv = bb.data.getVar('PKGPV_%s' % pkg, localdata, 1)
+		if not pv:
+		    pv = bb.data.getVar('PV', localdata, 1)
+		bb.data.setVar('PKGPV', pv, localdata)
+		pv = bb.data.getVar('PKGPR_%s' % pkg, localdata, 1)
+		if not pv:
+		    pv = bb.data.getVar('PR', localdata, 1)
+		bb.data.setVar('PKGPR', pv, localdata)
 
 		overrides = bb.data.getVar('OVERRIDES', localdata)
 		if not overrides:
@@ -207,9 +216,9 @@ python do_package_ipk () {
 		fields = []
 		pe = bb.data.getVar('PE', d, 1)
 		if pe and int(pe) > 0:
-			fields.append(["Version: %s:%s-%s\n", ['PE', 'PV', 'PR']])
+			fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGPV', 'PKGPR']])
 		else:
-			fields.append(["Version: %s-%s\n", ['PV', 'PR']])
+			fields.append(["Version: %s-%s\n", ['PKGPV', 'PKGPR']])
 		fields.append(["Description: %s\n", ['DESCRIPTION']])
 		fields.append(["Section: %s\n", ['SECTION']])
 		fields.append(["Priority: %s\n", ['PRIORITY']])


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


