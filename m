Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2ot7-0007FN-8x
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 18:59:30 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 1C090EA621
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:56:01 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 12:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=jkJJDUcVRf2TmnWTVkQmnP8mXxw=;
	b=Tk6gvNyjgFK1qVFiDffEWbhwOM/ZViO6BeZHy5nGMZ5kM2UywKQyjZlstyUcfLir4/VpYnHSBndWPoCQ9QrQeS2VyTu3Uhd0DjywHjTjacGT21hAzEGSRvWh5eX7YRs7ZBRdMneOnbaznZMZlOrvyGAXo5qK/xYm9axSrSBWwbI=
X-Sasl-enc: Ac5X2u/C2wzn8BdHlc+O5myiERAWkpSyuqZs4tLVv2CU 1271436960
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8CEA14AD3F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:56:00 -0400 (EDT)
Date: Fri, 16 Apr 2010 18:55:59 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.DEB.1.10.1004161854340.13187@vitus.devnet.local>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
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
Subject: [PATCH 5/5] linux_2.6.33: add recipe
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
X-List-Received-Date: Fri, 16 Apr 2010 16:59:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Adds recipe for 2.6.33 which contains some CAN-related changes
which are usefull for tb5200l.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/linux/linux_2.6.33.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux_2.6.33.bb

diff --git a/recipes/linux/linux_2.6.33.bb b/recipes/linux/linux_2.6.33.bb
new file mode 100644
index 0000000..0e1d3c7
--- /dev/null
+++ b/recipes/linux/linux_2.6.33.bb
@@ -0,0 +1,15 @@
+require linux.inc
+
+PR = "r0"
+
+S = "${WORKDIR}/linux-${PV}"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_tb5200l = "1"
+
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+	file://defconfig"
+
+SRC_URI[kernel.md5sum] = "d6249654087f0bcafaa860ac573316a4"
+SRC_URI[kernel.sha256sum] = "91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9ac"
-- 
1.5.6.5



