Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KPvIN-0006Vk-UJ
	for openembedded-devel@openembedded.org; Mon, 04 Aug 2008 10:20:00 +0200
Received: from 88-110-124-15.dynamic.dsl.as9105.com ([88.110.124.15]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KPvGO-0008DO-4T
	for openembedded-devel@openembedded.org; Mon, 04 Aug 2008 09:17:56 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@openembedded.org
Date: Mon, 04 Aug 2008 09:18:01 +0100
Message-Id: <1217837881.25732.138.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: per-package extra packaging hooks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 04 Aug 2008 08:20:00 -0000
X-Groupsio-MsgNum: 5686
Content-Type: multipart/mixed; boundary="=-byJ23P7+63CwEZoVHPau"

--=-byJ23P7+63CwEZoVHPau
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The attached patch implements a mechanism for packages to inject python
code into the packaging process of their dependents.  In particular this
will make it possible to implement a correct fix for the ongoing libgcc
dependency issue without having to pile a load of libc-specific code
into package.bbclass.  More generally, it allows the packaging code to
become more decentralised and removes the need to hack on
package.bbclass itself (with the attendant disruption and risk of merge
conflicts) whenever package-specific code needs to be added or modified.

Comments and suggestions welcome.

p.


--=-byJ23P7+63CwEZoVHPau
Content-Disposition: attachment; filename=package-hook.diff
Content-Type: text/x-patch; name=package-hook.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

#
# old_revision [6690ff49b103de5f60ddc09faaed43726adb4506]
#
# patch "classes/package.bbclass"
#  from [6f3deeb912b24b09204110bd00e94e30f64d3936]
#    to [e9b3bbe893ff2ba2c94a78a27dd09fd773cb35c2]
#
============================================================
--- classes/package.bbclass	6f3deeb912b24b09204110bd00e94e30f64d3936
+++ classes/package.bbclass	e9b3bbe893ff2ba2c94a78a27dd09fd773cb35c2
@@ -117,6 +117,20 @@ PACKAGE_DEPENDS += "file-native"
 
 PACKAGE_DEPENDS += "file-native"
 
+def package_stash_hook(func, name, d):
+	import bb, os.path
+	body = bb.data.getVar(func, d, True)
+	pn = bb.data.getVar('PN', d, True)
+	staging = bb.data.getVar('PKGDATA_DIR', d, True)
+	dirname = os.path.join(staging, 'hooks', name)
+	bb.mkdirhier(dirname)
+	fn = os.path.join(dirname, pn)
+	f = open(fn, 'w')
+	f.write("python () {\n");
+	f.write(body);
+	f.write("}\n");
+	f.close()
+
 python () {
     import bb
     if bb.data.getVar('PACKAGES', d, True) != '':
@@ -656,6 +670,7 @@ python package_do_shlibs() {
 		dep_pkg = dep_pkg[0]
 		shlib_provider[l] = (dep_pkg, lib_ver)
 
+	dep_packages = []
 	for pkg in packages.split():
 		bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
@@ -673,6 +688,9 @@ python package_do_shlibs() {
 					dep = dep_pkg
 				if not dep in deps:
 					deps.append(dep)
+				if not dep_pkg in dep_packages:
+					dep_packages.append(dep_pkg)
+					
 			else:
 				bb.note("Couldn't find shared library provider for %s" % n)
 
@@ -924,6 +942,38 @@ PACKAGEFUNCS ?= "package_do_split_locale
 		package_depchains \
 		emit_pkgdata"
 
+def package_run_hooks(f, d):
+	import bb, os
+	staging = bb.data.getVar('PKGDATA_DIR', d, True)
+	dn = os.path.join(staging, 'hooks', f)
+	if os.access(dn, os.R_OK):
+		for f in os.listdir(dn):
+			fn = os.path.join(dn, f)
+			fp = open(fn, 'r')
+			line = 0
+			for l in fp.readlines():
+				l = l.rstrip()
+				bb.parse.parse_py.BBHandler.feeder(line, l, fn, os.path.basename(fn), d)
+				line += 1
+			fp.close()
+	                anonqueue = bb.data.getVar("__anonqueue", d, 1) or []
+        	        body = [x['content'] for x in anonqueue]
+            	        flag = { 'python' : 1, 'func' : 1 }
+            	        bb.data.setVar("__anonfunc", "\n".join(body), d)
+         		bb.data.setVarFlags("__anonfunc", flag, d)
+		        try:
+                		t = bb.data.getVar('T', d)
+           			bb.data.setVar('T', '${TMPDIR}/', d)
+                		bb.build.exec_func("__anonfunc", d)
+                		bb.data.delVar('T', d)
+                		if t:
+                    			bb.data.setVar('T', t, d)
+		        except Exception, e:
+                		bb.msg.debug(1, bb.msg.domain.Parsing, "Exception when executing anonymous function: %s" % e)
+                		raise
+            		bb.data.delVar("__anonqueue", d)
+            		bb.data.delVar("__anonfunc", d)
+
 python package_do_package () {
 	packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
 	if len(packages) < 1:
@@ -932,6 +982,7 @@ python package_do_package () {
 
 	for f in (bb.data.getVar('PACKAGEFUNCS', d, 1) or '').split():
 		bb.build.exec_func(f, d)
+		package_run_hooks(f, d)
 }
 do_package[dirs] = "${D}"
 addtask package before do_build after do_install

--=-byJ23P7+63CwEZoVHPau--
