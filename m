Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2p6b-0003CD-4O
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 19:13:28 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 08DB7EABD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:09:49 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 13:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=7bDf9+fHTTbkU+XdEmFD/QZ1Vec=;
	b=XqnmmKLZGgmikZjF9Ymaz4/DLQ3UrO9nitZqEJ39kuORN210B7zDKJkiPmMq7rK73Eqx4DP2mWKAUdrWK35K+gR9LJoTc3ADViULaiNSIVjkWrOjCX8Vn+OeTuskqbRP9JD04BVONGPOZ7S3eWHP7xCIjjuyNiVAxtnnlhKXojU=
X-Sasl-enc: M19R8sAM5ExC6xyR3K74fn/Drkg9ceqTp1USLCgml9ti 1271437782
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8E5543E5B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:09:42 -0400 (EDT)
Date: Fri, 16 Apr 2010 19:09:41 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004161904380.13411@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004161909160.13411@vitus.devnet.local>
References: <alpine.DEB.1.10.1004161904380.13411@vitus.devnet.local>
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
Subject: [PATCH 4/4] linux_2.6.33: add bluepro support
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
X-List-Received-Date: Fri, 16 Apr 2010 17:13:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

[PATCH 4/4] linux_2.6.33: add bluepro support

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/linux/linux_2.6.33.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux_2.6.33.bb b/recipes/linux/linux_2.6.33.bb
index 0e1d3c7..6dce363 100644
--- a/recipes/linux/linux_2.6.33.bb
+++ b/recipes/linux/linux_2.6.33.bb
@@ -7,6 +7,7 @@ S = "${WORKDIR}/linux-${PV}"
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_tb5200l = "1"
+DEFAULT_PREFERENCE_bluepro = "1"

 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
 	file://defconfig"
-- 
1.5.6.5



