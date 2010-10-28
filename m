Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PBGwC-0001OO-Nr
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 03:06:31 +0200
Received: by iwn42 with SMTP id 42so811409iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=cKrdwVZWf3f0t44iGAEdP/2yWoR93KEKbNCeaxJeVo4=;
	b=X4Ed8n2zkGIRFJqtNxcNx83UPJmFVBWjcphonRrBQQ1DX7FAZ060dlpqLvBH1H4Eze
	CXT0TCRsUyCz9YWMmw2o3KLn3X0v4AV7qzXsLzkSs7zDLEWCj0nqbPCB2uQJrSqFVN44
	3hwp184fW2y6aS12WZVnfA0FNY5G0L02oEPnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=tfPF/JlFOQb+OgkpQj1gR4AUbx6c2WsywXy3vPvRnGnOmcXCxmLfZHV7o0XylymabW
	R3+VLUDCUiZEDULLwYkfQmsUH0PnoazLLq4kYjRo6E/V3Ed1jus9hgA+0y+mVh2NBjFO
	E52JbPa7odP6skku9oLbeZhPGsXt9DRtb40O8=
Received: by 10.231.161.209 with SMTP id s17mr9501024ibx.118.1288227909613;
	Wed, 27 Oct 2010 18:05:09 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id u6sm971812ibd.0.2010.10.27.18.05.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 18:05:08 -0700 (PDT)
Message-ID: <4CC8CC3D.3010905@gmail.com>
Date: Thu, 28 Oct 2010 11:35:01 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gs: Clean up and break into two recipes.
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
X-List-Received-Date: Thu, 28 Oct 2010 01:06:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

* Break the native compilation steps into a separate native recipe.
* Fix license
* Convert to new style staging
* Fix build on mipsel due to missing -fPIC for objects linked into so files.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gs/gs-tools-native_8.64.bb |   30 ++++++++++++++++++++++
 recipes/gs/gs_8.64.bb              |   49 +++++++++++-------------------------
 2 files changed, 45 insertions(+), 34 deletions(-)
 create mode 100644 recipes/gs/gs-tools-native_8.64.bb

diff --git a/recipes/gs/gs-tools-native_8.64.bb b/recipes/gs/gs-tools-native_8.64.bb
new file mode 100644
index 0000000..ea5f5fa
--- /dev/null
+++ b/recipes/gs/gs-tools-native_8.64.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Tools needed for cross building Ghostscript"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://www.gnu.org/software/ghostscript/ghostscript.html"
+DEPENDS = "zlib-native fontconfig-native"
+
+S = "${WORKDIR}/ghostscript-${PV}~dfsg"
+SRC_URI = "${DEBIAN_MIRROR}/main/g/ghostscript/ghostscript_${PV}~dfsg.orig.tar.gz;name=tarball"
+
+inherit autotools native
+
+SRC_URI[tarball.md5sum] = "e42706c2409815df5c959484080fd4a3"
+SRC_URI[tarball.sha256sum] = "cc856d33cb781cdc3383b8eb4e0f390997f8359fe144a906b84297b5d377f03d"
+
+EXTRA_OECONF = "--without-x --without-jasper"
+
+do_compile() {
+        mkdir -p obj
+        for i in genarch genconf mkromfs echogs gendev genht; do
+                oe_runmake obj/$i
+        done
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
+do_install () {
+	install -d ${D}${bindir}/gs-tools-${PV}
+        for i in genarch genconf mkromfs echogs gendev genht; do
+		install -m 755 obj/$i ${D}${bindir}/gs-tools-${PV}/$i
+	done
+}
diff --git a/recipes/gs/gs_8.64.bb b/recipes/gs/gs_8.64.bb
index 74cdcbf..499758e 100644
--- a/recipes/gs/gs_8.64.bb
+++ b/recipes/gs/gs_8.64.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "An interpreter of the Postscript language"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.gnu.org/software/ghostscript/ghostscript.html"
-DEPENDS = "jpeg zlib fontconfig cups"
-PR = "r3"
+DEPENDS = "jpeg zlib fontconfig cups gs-tools-native"
+PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/g/ghostscript/ghostscript_${PV}~dfsg.orig.tar.gz;name=tarball \
            file://0001_svn_snapshot.patch \
@@ -22,7 +22,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/g/ghostscript/ghostscript_${PV}~dfsg.orig.tar.g
 SRC_URI[tarball.md5sum] = "e42706c2409815df5c959484080fd4a3"
 SRC_URI[tarball.sha256sum] = "cc856d33cb781cdc3383b8eb4e0f390997f8359fe144a906b84297b5d377f03d"
 
-
 S = "${WORKDIR}/ghostscript-${PV}~dfsg"
 
 inherit autotools
@@ -33,47 +32,26 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 PACKAGES += "cups-gs"
 
-do_configure_prepend() {
-        CC="${BUILD_CC}" LD="${BUILD_LD}" ./configure
-        mkdir obj
-        for i in genarch genconf mkromfs echogs gendev genht; do
-                make obj/$i
-        done
-        mv obj obj_host
-        make clean
-}
-
 do_configure() {
-	# hack script to allow for cross compiling
-	sed 's,&& ./configure$,& --host=\$host --build=\$build --target=\$target,g' -i configure
- 
-	gnu-configize
-	oe_runconf
+        # hack script to allow for cross compiling jasper
+        sed 's,&& ./configure$,& --host=\$host --build=\$build --target=\$target,g' -i configure
+        gnu-configize
+        CFLAGS="${CFLAGS} -fPIC" oe_runconf
 }
 
 do_configure_append() {
-        if [ ! -d obj ]; then
-                mkdir obj
-        fi
-        if [ ! -d soobj ]; then
-                mkdir soobj
-        fi
+        # copy tools from the native gs build
+        mkdir -p obj soobj
         for i in genarch genconf mkromfs echogs gendev genht; do
-                cp obj_host/$i obj/$i
-                cp obj_host/$i soobj/$i
+                cp ${STAGING_BINDIR_NATIVE}/gs-tools-${PV}/$i obj/$i
+                cp ${STAGING_BINDIR_NATIVE}/gs-tools-${PV}/$i soobj/$i
         done
         # Prevent mkromfs from being recompiled for the target
         cp ${WORKDIR}/unix-aux.mak base/
 }
 
-do_stage () {
-	install -d ${STAGING_INCDIR}/ghostscript
-	install -m 755 ${S}/psi/*.h ${STAGING_INCDIR}/ghostscript/
-	oe_libinstall -so -C sobin libgs ${STAGING_LIBDIR}
-}
-
 do_compile_append () {
-        oe_runmake so
+        oe_runmake CFLAGS="${CFLAGS} -fPIC" so
 }
 
 do_install_prepend () {
@@ -87,6 +65,9 @@ do_install_append () {
 	# so duplicate it for compatibility
 	mkdir -p ${D}/${datadir}/cups/mime/
         cp ${D}/etc/cups/pstoraster.convs ${D}/${datadir}/cups/mime/
+
+	install -d ${D}${incluedir}/ghostscript
+	install -m 644 ${S}/psi/*.h ${D}${includedir}/ghostscript/
 }
 
 FILES_${PN} += "${datadir}/ghostscript"
-- 
1.7.1



