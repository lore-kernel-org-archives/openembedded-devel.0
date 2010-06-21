Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OQp1g-00074I-EF
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 23:59:33 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OQoxF-0006MT-4G from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 14:54:57 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 21 Jun 2010 14:54:56 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Jun 2010 15:54:56 -0600
Message-ID: <4C1FDFAE.8040704@mentor.com>
Date: Mon, 21 Jun 2010 14:54:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 21 Jun 2010 21:54:56.0172 (UTC)
	FILETIME=[62D9B6C0:01CB118C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC, PATCH] Make packaged-staging use more correct PSTAGE_PKGARCH
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
X-List-Received-Date: Mon, 21 Jun 2010 21:59:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

packaged-staging.bbclass: Change PSTAGE_PKGARCH to something dynamic

Currently, we make all pstage packages be locked to BUILD_SYS which 
causes annoying warnings in some cases and doesn't allow for sharing 
between say 32 and 64bit (which is valid for target bits).

This changes to ${PACKAGE_ARCH}-${HOST_SYS} for everything and reworks 
the opkg.conf we generate to add entries as needed.

There is an alternative, suggested by Chris Larson, that we modify 
PSTAGE_PKGARCH in an anon python function so that we can avoid things 
like 'x86_64-x86_64-linux' in native packages and similar duplication in 
sdk packages, or otherwise be more dynamic (use HOST_OS instead of SYS 
and then catch the cross case, etc).

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/packaged-staging.bbclass 
b/classes/packaged-staging.bbclass
index 8a98940..d6ac67b 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
  -12,7 +12,7 @@
  # bitbake.conf set PSTAGING_ACTIVE = "0", this class sets to "1" if 
we're active
  #
  PSTAGE_PKGVERSION = "${PV}-${PR}"
-PSTAGE_PKGARCH    = "${BUILD_SYS}"
+PSTAGE_PKGARCH    = "${PACKAGE_ARCH}-${HOST_SYS}"
  PSTAGE_EXTRAPATH  ?= "/${OELAYOUT_ABI}/${DISTRO_PR}/"
  PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
  PSTAGE_PKGPN      = 
"${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}', 
d).replace('_', '-')}"
  -148,15 +148,15 @@ staging_helper () {
  	# Assemble appropriate opkg.conf
  	conffile=${PSTAGE_MACHCONFIG}
  	mkdir -p ${PSTAGE_WORKDIR}/pstaging_lists
+	arch="${PSTAGE_PKGARCH}"
  	if [ ! -e $conffile ]; then
-		ipkgarchs="${BUILD_SYS}"
-		priority=1
-		for arch in $ipkgarchs; do
-			echo "arch $arch $priority" >> $conffile
-			priority=$(expr $priority + 5)
-		done
+		echo "arch $arch 1" > $conffile
  		echo "dest root /" >> $conffile
  	fi
+	if [ -f $conffile -a `grep -q $arch $conffile;echo $?` -ne 0 ]; then
+		priority=$(expr `grep -cE "^arch" $conffile` + 1)
+		sed -i -e "/dest/iarch $arch $priority" $conffile
+	fi
  	if [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then
  		mkdir -p ${TMPDIR}${libdir_native}/opkg/info/
  	fi

-- 
Tom Rini
Mentor Graphics Corporation


