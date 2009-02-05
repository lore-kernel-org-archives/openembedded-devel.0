Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LV6Z9-0006SM-M7
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Feb 2009 16:55:03 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LV6Yh-0001MO-FA
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Feb 2009 23:54:42 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Feb 2009 08:54:27 -0700
Message-Id: <1233849267.23894.47.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: linux-openmoko-devel patch
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
X-List-Received-Date: Thu, 05 Feb 2009 15:55:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I'm the new distribution maintainer for Openmoko and I'd like to work
towards getting push access to the OE git repository. It would be great
if I could get a sandbox branch to commit changes for review.

Thanks
Angus

--- packages/linux/linux-openmoko-devel_git.bb.orig     2009-02-02 13:42:00.000000000 -0700
+++ packages/linux/linux-openmoko-devel_git.bb  2009-02-02 13:44:13.000000000 -0700
@@ -20,7 +20,7 @@
 S = "${WORKDIR}/git"

 do_configure_prepend() {
-       install -m 644 ./arch/arm/configs/gta02-packaging-defconfig ${WORKDIR}/defconfig-oe
+       install -m 644 ./arch/arm/configs/gta02_packaging_defconfig ${WORKDIR}/defconfig-oe
        cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
 }



