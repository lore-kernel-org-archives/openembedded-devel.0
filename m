Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpkaA-0007nB-83
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 16:45:56 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5kPfz33pBd9jnyEDOOWMhEjKWuc6Rtw@postini.com;
	Thu, 11 Mar 2010 07:42:58 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 11 Mar 2010 10:37:51 -0500
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 11 Mar 2010 10:37:51 -0500
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Mar 2010 15:41:03 +0000
Message-ID: <20100311154103.23028.85507.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.186
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: k.kooi@student.utwente.nl
Subject: [PATCH] util-linux-ng: Correct vi error
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
X-List-Received-Date: Thu, 11 Mar 2010 15:45:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Commit bbd436a98df5d4a439e519651c38fb48d81e5a78 appears to have added a via
error to "pkg_prerm_${PN}":

  - update-alternatives --remove pivot_root pivot_root.${PN}
  + update-alternatives --remove pivot_root pivot_root.${PN}i

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/util-linux-ng/util-linux-ng.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 3073cfe..1c6e8a8 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -7,7 +7,7 @@ inherit autotools
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 # allows for a release candidate
 RC ?= ""
@@ -211,7 +211,7 @@ pkg_postinst_${PN} () {
 
 pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
-	update-alternatives --remove pivot_root pivot_root.${PN}i
+	update-alternatives --remove pivot_root pivot_root.${PN}
 
 	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hecdump last logger mesg renice wall vipw vigr chfn newgrp chsh login ; do
 		update-alternatives --remove $i $i.${PN}


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


