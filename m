Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLYkg-000750-TZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:17:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1114; q=dns/txt; s=iport;
	t=1349784269; x=1350993869;
	h=from:to:cc:subject:date:message-id;
	bh=iIfW/DfCAS8XBQlsV89jhMJB0ymX8boQTddBj9SElnA=;
	b=U1LWwlH+LNPsQh/sXI8G5VXcSowjqNeidLXtVoAj1zYZX+1HFJOyQ+EY
	4ALYTsgWtQXJtPk8SuXE7o6hJzZyd00bbZFzL62ZxUK6DEKEPAdNN8M70
	dq75TvmYolzy+tLpxhca2f+kUuUiaGUJGfb/tSfuuxF+HvWbfPA3DsUs6 M=;
X-IronPort-AV: E=Sophos;i="4.80,560,1344211200"; 
   d="scan'208";a="8644968"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-4.cisco.com with ESMTP; 09 Oct 2012 12:04:26 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q99C4QKb024986;
	Tue, 9 Oct 2012 12:04:26 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 14:04:25 +0200
Message-Id: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] libftdi: Change to use GPLv2 intead of GPLv2-REL
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
X-List-Received-Date: Tue, 09 Oct 2012 12:17:35 -0000

According to http://www.intra2net.com/en/developer/libftdi/, libftdi itself is licensed under LGPLv2,
with some parts (eeprom programmer) is licensed under GPLv2. There doesn't seem to be any part licensed
under a GPLv2-REL variation of GPLv2, and so we should use GPLv2 instead of GPLv2-REL.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
index 2dba3f4..0842aaf 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
@@ -4,7 +4,7 @@ including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1 GPLv2-RLE"
+LICENSE = "LGPLv2.1 GPLv2"
 LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
                    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
                   "
-- 
1.7.8.6



