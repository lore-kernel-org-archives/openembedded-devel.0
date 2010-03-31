Received: from exprod5og104.obsmtp.com ([64.18.0.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nwzmo-0006Ir-JU
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 17:24:56 +0200
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob104.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS7Nog2ifTN74YbEJH59Z+aqZDUxtG03M@postini.com;
	Wed, 31 Mar 2010 08:21:41 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip06.e2k.ad.ge.com with ESMTP; 31 Mar 2010 11:16:35 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 31 Mar 2010 11:16:35 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 16:20:05 +0100
Message-ID: <20100331152003.5828.26495.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.178
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] po4a: Add native recipe
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
X-List-Received-Date: Wed, 31 Mar 2010 15:24:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a recipe for building a native version of po4a version 0.36.3.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/po4a/po4a-native_0.36.3.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/recipes/po4a/po4a-native_0.36.3.bb b/recipes/po4a/po4a-native_0.36.3.bb
new file mode 100644
index 0000000..07c9e08
--- /dev/null
+++ b/recipes/po4a/po4a-native_0.36.3.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Tools for helping translation of documentation"
+SECTION = "utility"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "libmodule-build-perl-native"
+PR = "r0"
+inherit native
+
+SRC_URI = "${DEBIAN_MIRROR}/main/p/po4a/po4a_0.36.3.orig.tar.gz;name=po4a"
+
+SRC_URI[po4a.md5sum] = "47af91b7d2ad3a3a9e2aaa22473f42bf"
+SRC_URI[po4a.sha256sum] = "4563f4651448300f3d05f9dfa5212535ef0bd97c6b51704c4cb9829f282915e2"


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


