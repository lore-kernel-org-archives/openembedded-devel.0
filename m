Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NrXjC-0007OM-Af
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 15:26:43 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5+UZtZ5D51BbezoE2mD59N2cZfB70NS@postini.com;
	Tue, 16 Mar 2010 07:23:37 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 16 Mar 2010 10:23:28 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 16 Mar 2010 10:23:27 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 14:26:40 +0000
Message-ID: <20100316142640.31697.40628.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udhcp: Update SRC_URI
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
X-List-Received-Date: Tue, 16 Mar 2010 14:26:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The udhcp SRC_URI is broken, change to download from mirror that is still
carrying this package.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/udhcp/udhcp_0.9.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/udhcp/udhcp_0.9.8.bb b/recipes/udhcp/udhcp_0.9.8.bb
index 40487ef..006306f 100644
--- a/recipes/udhcp/udhcp_0.9.8.bb
+++ b/recipes/udhcp/udhcp_0.9.8.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small dhcp client and dhcp server.  Designed for embedded use."
 HOMEPAGE = "http://udhcp.busybox.net/"
 LICENSE = "GPL"
 
-SRC_URI = "http://udhcp.busybox.net/source/udhcp-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.locustworld.com/udhcp-${PV}.tar.gz \
 	   file://install.patch;patch=1 \
 	   file://nostrip.patch;patch=1 \
 	   file://gcc3.patch;patch=1"


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


