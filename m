Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NrAKq-0002Gb-6G
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:28:04 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS541JoBT7P+WBbe9fRVtd1RxNIgJyH5X@postini.com;
	Mon, 15 Mar 2010 06:24:56 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:24:49 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:24:48 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 13:28:00 +0000
Message-ID: <20100315132800.22150.14095.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.24
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] commit ddf8890a51d2fe5cee15cb2f18638036c0adb43b
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
X-List-Received-Date: Mon, 15 Mar 2010 13:28:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fix mktemp to use update-alternatives

    As suggested in the original version, this patch makes mktemp use
    update-alternatives.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/mktemp/mktemp_1.6.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes/mktemp/mktemp_1.6.bb b/recipes/mktemp/mktemp_1.6.bb
index bd9c4ca..33c1cf1 100644
--- a/recipes/mktemp/mktemp_1.6.bb
+++ b/recipes/mktemp/mktemp_1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.mktemp.org/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 BSD"
 
-inherit autotools
+inherit autotools update-alternatives
 
 EXTRA_OECONF = "--with-libc"
 
@@ -12,6 +12,13 @@ SRC_URI = "\
   file://add_destdir.patch;patch=1 \
   file://disable-strip.patch;patch=1 \
 "
-	 	 	
-# FIXME should rather use update-alternatives
-RCONFLICTS_${PN} = "coreutils"
+
+do_install_append () {
+	mkdir ${D}${base_bindir}
+	mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp.${PN}
+}
+
+ALTERNATIVE_NAME = "mktemp"
+ALTERNATIVE_LINK = "${base_bindir}/mktemp"
+ALTERNATIVE_PATH = "${base_bindir}/mktemp.${PN}"
+ALTERNATIVE_PRIORITY = "100"


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


