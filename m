Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1K4bDW-0003TC-O8
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jun 2008 14:38:50 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 831B98400BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 14:34:02 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D9BC68400B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 14:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_50 autolearn=ham
	version=3.2.4
Received: from rhein.familie-heinold.de (e178090106.adsl.alicedsl.de
	[85.178.90.106]) by mail.familie-heinold.de (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 14:34:01 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6B1E73C1A7; Fri,  6 Jun 2008 14:34:01 +0200 (CEST)
Date: Fri, 6 Jun 2008 14:34:01 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080606123400.GA17210@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: changes to some bbclases to make FILES_ variables more reliable
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
X-List-Received-Date: Fri, 06 Jun 2008 12:38:50 -0000
X-Groupsio-MsgNum: 5313
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

after fighting with sdl-package yesterday I noticed some gliches in the
way FILES_ is used in the recipes, especially when inherit binconfig
and pkgconfig is used. My thoughts were when I use inherit binconfig
the binconfig.class should set all variables to let the package build, install and
stage. But unfornatly it does not work this way yet. After searching
through the code I can not find where original FILES_ is set, but
then I noticed the lib_package-class,
which sets usefull defines for the FILES_ variables(more
packages should use it), but in my opinion
to much for some cases like binconfig and pkgconfig. So I cut the defines
for this cases and put them in binconfig.bbclass and pkgconfig.bbclass.
This will make writing packages easier and nobody needs to set FILES_bla
and FILES_bla-dev manually.
If no one speaks against it or can not enlight me to a better way. I will
commit this changes in the next days. Attached is a patch. 
One problem should be noticed here. When lib_package is used in recipes
it has to be before binconfig and pkgconfig, because of the way is set's
the FILES_ variables.

Bye,

Henning

PS: staging needs some of this thoughts too, so we dont have to set
do_stage manually in the recipes, but this looks a little bit harder
than the FILES_ case

--UugvWAfsgieZRqgk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="classes.patch"

#
# old_revision [002eda28acb76c39ae5920ebf07cf3756277bd37]
#
# patch "classes/binconfig.bbclass"
#  from [58dc018aedba1b26f08340968881e9b10ad2c6a0]
#    to [26104c56da27bb664c667c3d2b56004aa51c299f]
# 
# patch "classes/lib_package.bbclass"
#  from [69153b7e7366390aa47b73f5d8f1a59906264515]
#    to [748e5478af415afef77b4abeb5ef1d9690eb27f4]
# 
# patch "classes/pkgconfig.bbclass"
#  from [825125168a0e350351266996b570279b35dc175f]
#    to [9ae65828283af9ea1842a89b64d0490cd8f50893]
#
============================================================
--- classes/binconfig.bbclass	58dc018aedba1b26f08340968881e9b10ad2c6a0
+++ classes/binconfig.bbclass	26104c56da27bb664c667c3d2b56004aa51c299f
@@ -1,5 +1,7 @@ inherit base
 inherit base
 
+FILES_${PN}-dev += "${bindir}/*-config"
+
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
 	import bb.data
============================================================
--- classes/lib_package.bbclass	69153b7e7366390aa47b73f5d8f1a59906264515
+++ classes/lib_package.bbclass	748e5478af415afef77b4abeb5ef1d9690eb27f4
@@ -1,9 +1,11 @@ PACKAGES += "${PN}-bin"
 PACKAGES += "${PN}-bin"
 
+FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
+
 FILES_${PN} = "${libexecdir} ${libdir}/lib*.so.* \
 	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
 	    /lib/*.so* ${datadir}/${PN} ${libdir}/${PN}"
+
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
-		${datadir}/aclocal ${bindir}/*-config"
-FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
+		${libdir}/*.a /lib/*.a /lib/*.o \
+		${datadir}/aclocal" 
============================================================
--- classes/pkgconfig.bbclass	825125168a0e350351266996b570279b35dc175f
+++ classes/pkgconfig.bbclass	9ae65828283af9ea1842a89b64d0490cd8f50893
@@ -2,6 +2,8 @@ DEPENDS_prepend = "pkgconfig-native "
 
 DEPENDS_prepend = "pkgconfig-native "
 
+FILES_${PN}-dev += "${libdir}/pkgconfig"
+
 do_stage_append () {
 	install -d ${PKG_CONFIG_DIR}
 	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do

--UugvWAfsgieZRqgk--
