Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl7Zp-0005tZ-4V
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 22:18:25 +0100
Received: by fxm20 with SMTP id 20so524400fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 13:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8xxuRrduCvIVdbrxOXdOaV+3eoojjhzagyCtHOf0Gyc=;
	b=PJwVb28niVcYJq3EdgVW0T7e1Mj5UJHXya5zYVEI1SeqswQS3s522wQSEijzaxvIuN
	0+bOPpz66vZ4RonWeS11IJ49dKQGl29wWIofzVUykMd1vTjK7UJqoG7Ubkv+a/jeDJRw
	qNJgG++nM848tHZtu38fbkWZM6XPmTyG7KUVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qUzkbyDuS8M+TmcuqsgDVokfxLSvWknxsC9re7a3znOFEliEC4qF/Dq9gc8+NjdjmH
	Q+e0RyAIu2k3r5T9yAfM70aWnlQQ9GJrBqJN5dxeT7WKw/f4HC4Pi8X/ec191CQ2fTTs
	NHf2lUdwaoWu7oU5B9M6OS5fWXsb1QPOGfy6o=
Received: by 10.223.6.88 with SMTP id 24mr1239429fay.2.1267218937856;
	Fri, 26 Feb 2010 13:15:37 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm448887fxm.7.2010.02.26.13.15.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 13:15:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 22:15:39 +0100
Message-Id: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package_ipk.bbclass DON'T PUSH THIS, but PLEASE read it
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
X-List-Received-Date: Fri, 26 Feb 2010 21:18:25 -0000

There is quite common error about non-existent lockfile path

I've seen that everytime when recipe changes ARCH (ie when removed machine specific config)
and package is no longer in tmp/work/om-gta01.. but tmp/work/armv4t.., then whole build works
ok, but in the end it's looking for lockfile in right directory but in wrong arch dir.

Today I've seen similar error from mwester:
18:10:59 < mwester> ERROR: Error, lockfile path does not exist!: /u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/gpsd-2.39-r0/packages-split

So with a bit of debugging (in patch) it's clear that it's broken after executing read_subpackage_metadata function
NOTE: WORKDIR-before /OE/tmpdir-dev-shr/work/armv5te-oe-linux-gnueabi/gpsd-2.90-r4.0
NOTE: WORKDIR-after  /OE/tmpdir-dev-shr/work/armv5te-oe-linux-gnueabi/gpsd-2.90-r0

If I comment-out that last setVar as used in patch it works OK.

I'm not sure why we wan't all those subpkg data with same keys set directly in data. But just grep for values it wants to set I can see

where broken WORKDIR goes from:
bitbake@jama ~/build.dev.shr.spitz $ grep "PR\|PKGR" variables.set.log
NOTE: Setting pkg 'libgps' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'libgps' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'python-pygps' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'python-pygps' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-udev' subdata key 'PR', value 'r4.0'
NOTE: Setting pkg 'gpsd-udev' subdata key 'PKGR', value 'r4.0.4'
NOTE: Setting pkg 'gpsd-conf' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-conf' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-gpsctl' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-gpsctl' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gps-utils' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gps-utils' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-dbg' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-dbg' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-doc' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-doc' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-dev' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-dev' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-static' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-static' subdata key 'PKGR', value 'r0.4'
NOTE: Setting pkg 'gpsd-locale' subdata key 'PR', value 'r0'
NOTE: Setting pkg 'gpsd-locale' subdata key 'PKGR', value 'r0.4'

so the right value is only in gpsd-udev, but that's only because gpsd-udev is new subpackage and wasn't been built before
NOTE: pkg: gpsd-udev
NOTE: pkg: gpsd-udev - /OE/tmpdir-dev-shr/pkgdata/armv5te-oe-linux-gnueabi/runtime/gpsd-udev
while other recipes have both arch
NOTE: pkg: python-pygps
NOTE: pkg: python-pygps - /OE/tmpdir-dev-shr/pkgdata/spitz-oe-linux-gnueabi/runtime/python-pygps
NOTE: pkg: python-pygps - /OE/tmpdir-dev-shr/pkgdata/armv5te-oe-linux-gnueabi/runtime/python-pygps

In this case when I return last arch found, then it works again, but that's only because we're changing app from spitz to armv5te,
when someone adds some machine specific config then, right version will be in spitz and wrong in armv5te

Please someone fix this :).
---
 classes/package_ipk.bbclass |    4 ++++
 classes/packagedata.bbclass |    9 ++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 420c892..44241d6 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -320,7 +320,11 @@ python do_package_write_ipk () {
 		bb.debug(1, "No PACKAGES defined, nothing to package")
 		return
 
+	workdir = bb.data.getVar('WORKDIR', d, 1)
+	bb.note("WORKDIR-before %s" % workdir)
 	bb.build.exec_func("read_subpackage_metadata", d)
+	workdir = bb.data.getVar('WORKDIR', d, 1)
+	bb.note("WORKDIR-after %s" % workdir)
 	bb.build.exec_func("do_package_ipk", d)
 }
 do_package_write_ipk[dirs] = "${D}"
diff --git a/classes/packagedata.bbclass b/classes/packagedata.bbclass
index 86f18a9..581c020 100644
--- a/classes/packagedata.bbclass
+++ b/classes/packagedata.bbclass
@@ -27,10 +27,15 @@ def get_subpkgedata_fn(pkg, d):
 	archs.reverse()
 	pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
 	targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
+	bb.note("pkg: %s" % pkg)
+	rval = None
 	for arch in archs:
 		fn = pkgdata + arch + targetdir + pkg
 		if os.path.exists(fn):
-			return fn
+			bb.note("pkg: %s - %s" % (pkg, fn))
+			rval = fn
+	if rval != None:
+		return rval
 	return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
 
 def has_subpkgdata(pkg, d):
@@ -51,11 +56,13 @@ python read_subpackage_metadata () {
 	data = read_pkgdata(bb.data.getVar('PN', d, 1), d)
 
 	for key in data.keys():
+		bb.note("Setting key '%s', value '%s'" % (key, data[key]));
 		bb.data.setVar(key, data[key], d)
 
 	for pkg in bb.data.getVar('PACKAGES', d, 1).split():
 		sdata = read_subpkgdata(pkg, d)
 		for key in sdata.keys():
+			bb.note("Setting pkg '%s' subdata key '%s', value '%s'" % (pkg, key, sdata[key]));
 			bb.data.setVar(key, sdata[key], d)
 }
 
-- 
1.7.0



