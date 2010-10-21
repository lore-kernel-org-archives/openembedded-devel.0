Received: from smtplq-out5.aruba.it ([62.149.158.25] helo=smtplq04.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1P94GQ-0005kS-1Y for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 01:09:39 +0200
Received: (qmail 8529 invoked by uid 89); 21 Oct 2010 23:02:20 -0000
Received: from unknown (HELO smtp2.aruba.it) (62.149.128.201)
	by smtplq04.aruba.it with SMTP; 21 Oct 2010 23:02:20 -0000
Received: (qmail 3003 invoked by uid 89); 21 Oct 2010 23:02:19 -0000
Received: from unknown (HELO ?192.168.8.32?)
	(pierluigi.passaro@phoenixsoftware.it@78.12.139.28)
	by smtp2.ad.aruba.it with SMTP; 21 Oct 2010 23:02:19 -0000
Message-ID: <4CC0C67C.6060806@phoenixsoftware.it>
Date: Fri, 22 Oct 2010 01:02:20 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 62.149.158.25
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: external-toolchain-csl and libtool 2.4
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
X-List-Received-Date: Thu, 21 Oct 2010 23:09:39 -0000
Content-Type: multipart/mixed; boundary="------------030504010502080709090604"

--------------030504010502080709090604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
LIBTOOL_HAS_SYSROOT feature has been recently enabled on Angstom 2010.x 
distro.

However, using CodeSourcery toolchain, this feature lead to use CSL 
sysroot as search path, that is generally different from 
${STAGING_DIR_TARGET}${libdir} folder used for packages.

At present I worked around the problem with the attached patch, but I 
was wondering if this could be a misconfiguration or a bug.

Any suggestion will be appreciated.

Regards
Gigi

-- 
Ing. Pierluigi Passaro
Viale Don Luigi Sturzo 34
30174 Venezia Mestre
Cel: +39 348 355 4119
Tel: +39 041 862 3373
Fax: +39 041 862 3173
Web: www.phoenixsoftware.it
P.IVA 03884060272


--------------030504010502080709090604
Content-Type: text/x-patch;
 name="csl-do-not-use-sysroot.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="csl-do-not-use-sysroot.patch"

diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
index 59b6470..cf8b79a 100644
--- a/conf/distro/include/toolchain-external.inc
+++ b/conf/distro/include/toolchain-external.inc
@@ -8,3 +8,5 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN
 
 TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
 TARGET_VENDOR := "${TOOLCHAIN_VENDOR}"
+
+LIBTOOL_HAS_SYSROOT = "no"
diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
index 97fdb30..71bd243 100644
--- a/recipes/libtool/libtool.inc
+++ b/recipes/libtool/libtool.inc
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
           file://prefix-manpage-fix.patch \
           file://resolve-sysroot.patch \
-          file://use-sysroot-in-libpath.patch \
+          ${@['file://do-not-use-sysroot-in-libpath.patch','file://use-sysroot-in-libpath.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
           "
 do_configure_prepend () {
        if ${@['true', 'false'][bb.data.inherits_class('native', d) or bb.data.inherits_class('sdk', d) or (bb.data.getVar('PN', d, 1) == 'libtool-cross')]}
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/do-not-use-sysroot-in-libpath.patch
@@ -0,0 +1,18 @@
+When using sysroot we should append it to libdir which is helpful in cross builds
+as the system is staged in the sysroot. For normal build i.e. when lt_sysroot is not
+set it will still behave same and add -L/usr/lib to relink command
+
+-Khem
+
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4/libltdl/config/ltmain.m4sh
+@@ -6122,7 +6122,6 @@ func_mode_link ()
+ 	      fi
+ 	    else
+ 	      # We cannot seem to hardcode it, guess we'll fake it.
+-	      add_dir="-L$libdir"
+ 	      # Try looking first in the location we're being installed to.
+ 	      if test -n "$inst_prefix_dir"; then
+ 		case $libdir in


--------------030504010502080709090604--
