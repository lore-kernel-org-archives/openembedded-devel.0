Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte2w-0006ZW-5v
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:35:46 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c5M2lpWzarosHImnoJPLE+DRFf2W73@postini.com;
	Mon, 22 Mar 2010 02:32:36 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip04.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:35 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:35 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:50 +0000
Message-ID: <20100322093550.27540.85561.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.22
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/12] Modify util-linux-ng
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
X-List-Received-Date: Mon, 22 Mar 2010 09:35:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add link to reset command and correct swapoff.
---

 recipes/util-linux-ng/util-linux-ng.inc |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index b2045d7..6ed2ac4 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -160,6 +160,7 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+	mv ${S}/misc-utils/reset ${D}${bindir}/reset.${PN}
 	
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall.${PN}
@@ -204,7 +205,8 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/login login login.${PN} 100
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 100
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
-	
+	update-alternatives --install ${bindir}/reset reset reset.${PN} 100
+
 	# There seems to be problem, atleast on nslu2, with these, until they are
 	# fixed the busybox ones have higher priority
 	update-alternatives --install ${base_sbindir}/hwclock hwclock hwclock.${PN} 10
@@ -217,7 +219,7 @@ pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --remove pivot_root pivot_root.${PN}
 
-	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hecdump last logger mesg renice wall vipw vigr chfn newgrp chsh login ; do
+	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hecdump last logger mesg renice wall vipw vigr chfn newgrp chsh login reset ; do
 		update-alternatives --remove $i $i.${PN}
 	done
 }
@@ -255,12 +257,12 @@ pkg_prerm_util-linux-ng-losetup () {
 }
 
 pkg_postinst_util-linux-ng-swaponoff () {
-	update-alternatives --install ${base_sbindir}/swapoff swapoff swapoff.${PN} 100
+	update-alternatives --install ${base_sbindir}/swapoff swapoff swapon.${PN} 100
 	update-alternatives --install ${base_sbindir}/swapon swapon swapon.${PN} 100
 }
 
 pkg_prerm_util-linux-ng-swaponoff () {
-	update-alternatives --remove swapoff swapoff.${PN}
+	update-alternatives --remove swapoff swapon.${PN}
 	update-alternatives --remove swapon swapon.${PN}
 }
 


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


