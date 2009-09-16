Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1Mny3E-0006wk-PN
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 19:12:19 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-6c-4ab11c4f4f0a
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: OE-Dev <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Sep 2009 13:11:14 -0400
Message-Id: <1253121074.1495.75.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] rootfs postprocess command
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
X-List-Received-Date: Wed, 16 Sep 2009 17:12:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I ran into a problem yesterday where the ROOTFS_POSTPROCESS_COMMAND
started failing after I turned off ONLINE_PACKAGE_MANAGEMENT. It seems
the problem is that if package management is turned off, then the opkg
directory gets deleted. Subsequent opkg commands in the
ROOTFS_POSTPROCESS_COMMAND fail to open the lock file because the
directory is gone.

This patch simply moves the postprocess command above the destruction of
the opkg directory to allow any such commands to complete successfully.

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 16dd511..9231787 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -81,6 +81,8 @@ fakeroot rootfs_ipk_do_rootfs () {
        install -d ${IMAGE_ROOTFS}/${sysconfdir}
        echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
+       ${ROOTFS_POSTPROCESS_COMMAND}
+       
        if [ "${ONLINE_PACKAGE_MANAGEMENT}" != "none" ]; then
                if [ "${ONLINE_PACKAGE_MANAGEMENT}" == "add" ]; then
                        rm -f ${IMAGE_ROOTFS}${libdir}/opkg/status
@@ -97,8 +99,6 @@ fakeroot rootfs_ipk_do_rootfs () {
                rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg
        fi
        
-       ${ROOTFS_POSTPROCESS_COMMAND}
-       
        log_check rootfs        
 }



