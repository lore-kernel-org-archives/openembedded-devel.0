Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L8GGA-0002GH-Ec
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 16:36:58 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 3EC3C6280CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2008 16:33:24 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AC214253-0411-451F-9A25-04D0F6174B90@student.utwente.nl>
References: <1228384295.14968.63.camel@hammer.suse.cz>
	<gh8ge9$gff$1@ger.gmane.org>
	<1228396188.14968.188.camel@hammer.suse.cz>
	<AC214253-0411-451F-9A25-04D0F6174B90@student.utwente.nl>
Date: Thu, 04 Dec 2008 16:33:23 +0100
Message-Id: <1228404803.14968.296.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: broken shared-mime-info and MIME typing
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
X-List-Received-Date: Thu, 04 Dec 2008 15:36:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> > This would not work. Without freedesktop.org.xml the command
> > "update-mime-database /usr/share/mime" will ruin the database.
> 
> That does work, had you looked a bit better:
> 
> mime.bbclass does:
> 		rdepends.append("freedesktop-mime-info")

My mistake, NOTE says different. But problem 1 is still valid for manual
calling of "update-mime-database /usr/share/mime" on a system, that does
not have freedesktop-mime-info.

2., 3. and 4. were just a suggestions, 5. is a minor issue.

See attached patch (untested), which should do 2., 3. and 4.
Issue 5 fix is not done yet.

> I tested it on 2 devices and it does the right thing:  
> freedesktop.org.xml gets installed before the update-mime-database  
> command is run.

Yes, it works for packages. Actually users of locales will get
freedesktop-mime-info automatically due to 5.

diff --git a/classes/mime.bbclass b/classes/mime.bbclass
index a214c11..75c1db9 100644
--- a/classes/mime.bbclass
+++ b/classes/mime.bbclass
@@ -5,9 +5,6 @@ if [ "$1" = configure ]; then
 	if [ -x ${bindir}/update-mime-database ] ; then
 		echo "Updating MIME database... this may take a while."
 		update-mime-database $D${datadir}/mime
-	else
-		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
-		exit 1
 	fi
 fi
 }
@@ -17,9 +14,6 @@ if [ "$1" = remove ] || [ "$1" = upgrade ]; then
 	if [ -x ${bindir}/update-mime-database ] ; then
 		echo "Updating MIME database... this may take a while."
 		update-mime-database $D${datadir}/mime
-	else
-		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
-		exit 1
 	fi
 fi
 }
@@ -50,7 +44,9 @@ python populate_packages_append () {
 			postrm += bb.data.getVar('mime_postrm', d, 1)
 			bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 			bb.note("adding shared-mime-info dependency to %s" % pkg)
-			rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
-			rdepends.append("freedesktop-mime-info")
-			bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+			rrecommends = explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, 0) or bb.data.getVar('RRECOMMENDS', d, 0) or "")
+			rrecommends.append("freedesktop-mime-info")
+			bb.data.setVar('RRECOMMENDS_' + pkg, " " + " ".join(rrecommends), d)
 }
+
+FILES_${PN} += "${datadir}/mime/packages"
diff --git a/packages/shared-mime-info/shared-mime-info_0.51.bb b/packages/shared-mime-info/shared-mime-info_0.51.bb
index 31a7df1..cb1f329 100644
--- a/packages/shared-mime-info/shared-mime-info_0.51.bb
+++ b/packages/shared-mime-info/shared-mime-info_0.51.bb
@@ -10,6 +10,6 @@ do_install_append() {
 # freedesktop.org.xml is huge and only needed when updating the db
 # mime.bbclass will add the dependency on it automagically
 PACKAGES =+ "freedesktop-mime-info"
-FILES_freedesktop-mime-info = "${datadir}/mime/packages/freedesktop.org.xml"
+FILES_freedesktop-mime-info = "${datadir}/mime/packages/freedesktop.org.xml ${bindir}/update-mime-database"
 RDEPENDS_freedesktop-mime-info = "shared-mime-info"
 

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



