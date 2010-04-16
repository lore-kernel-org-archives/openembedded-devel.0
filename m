Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2pCo-0003Zz-I1
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 19:19:52 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 41EE4EA20D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:16:22 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Fri, 16 Apr 2010 13:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=Jaa0gqY+G9EtABYqS6kHrB9F7IQ=;
	b=i/6q5ibMPzI9fQACgdylNpopmhz5Hl37DXDyO3lLE7Uj9yGu2sKZTQPVickWZFGsejOIJDQTD3Kgh7r0fDqo85mEK1mRA/3fesZfw0t3Zm/PL+yd6cn2sIEesniSCg+rlsP3AmKvx+iHVJsB1E2SERM3u2kSfnZEOytC/fSCnDI=
X-Sasl-enc: iO4AEfiCSXuj7A1dsXEWPOnFHj1Q1Lt2IxbIfchMGFIf 1271438181
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id ACB693B0E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:16:21 -0400 (EDT)
Date: Fri, 16 Apr 2010 19:16:20 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004161915570.13411@vitus.devnet.local>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] canutils: add new recipe
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
X-List-Received-Date: Fri, 16 Apr 2010 17:19:52 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Adds canutils (PTX flavour) 4.0.4 as alternative to socketcan-utils-test.
canutils RCONFLICTS with socketcan-utils-test because of identical
file names.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
  recipes/socketcan/canutils_4.0.4.bb           |   19 +++++++++++++++++++
  recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
  2 files changed, 20 insertions(+), 0 deletions(-)
  create mode 100644 recipes/socketcan/canutils_4.0.4.bb

diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
new file mode 100644
index 0000000..e769c46
--- /dev/null
+++ b/recipes/socketcan/canutils_4.0.4.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "canutils (PTX flavour)"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "libsocketcan"
+RDEPENDS = "libsocketcan"
+RCONFLICTS = "socketcan-utils-test"
+
+TAG = "canutils-${PV}"
+PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/socketcan/socketcan-utils-test_svn.bb
index 4a3d52d..91cd6f1 100644
--- a/recipes/socketcan/socketcan-utils-test_svn.bb
+++ b/recipes/socketcan/socketcan-utils-test_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Socketcan user space utilities and test apps"
  HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
  SECTION = "console/utils"
  LICENSE = "GPL"
+RCONFLICTS = "canutils"

  PV = "0.0+svnr${SRCPV}"

-- 
1.5.6.5



