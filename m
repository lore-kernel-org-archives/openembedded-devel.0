Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2pCN-0003YC-UZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 19:19:25 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 39D3DEB105
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:15:55 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 13:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=MbYiEsvNTFFFf8U/FJYbziXYMfE=;
	b=VuPrsa2JE5v7k74xgSdrS6t+fhvCpyEq0RPguDgy2rwl63TTgw6lYx8jrpK64Nc5Z/oVENYoBbQH+rG0KUCF+C5jvGjslNXxjQPlCwDngzTSuvDk6Fvbk8JLeYmdKSbGU4cW43BJqTlCocK1XaI0hXzzsSrsNad7FDnmOg5yrAg=
X-Sasl-enc: cdB3Qsynpg6hEk6G95mu5IOyHRX2eY6Y8PeSGFahXAj7 1271438154
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id A82B84B0FC3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:15:54 -0400 (EDT)
Date: Fri, 16 Apr 2010 19:15:53 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004161915140.13411@vitus.devnet.local>
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
Subject: [PATCH 1/2] libsocketcan: recipe to build pengutronix' libsocketcan (netlink interface)
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
X-List-Received-Date: Fri, 16 Apr 2010 17:19:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/socketcan/libsocketcan_0.0.7.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb

diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/libsocketcan_0.0.7.bb
new file mode 100644
index 0000000..f23cbdc
--- /dev/null
+++ b/recipes/socketcan/libsocketcan_0.0.7.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "control basic functions in socketcan from userspace"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "libs/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+
+TAG = "v${PV}"
+PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=${TAG} \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_stage () {
+	install -m 0644 include/libsocketcan.h ${STAGING_INCDIR}/
+	install -m 0644 include/can_netlink.h ${STAGING_INCDIR}/
+	oe_libinstall -a -so libsocketcan ${STAGING_LIBDIR}
+}
-- 
1.5.6.5




