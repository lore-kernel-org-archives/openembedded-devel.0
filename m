Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C9F3F60D8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:37:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so5147310wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BmIgepbqA83UQccvRNKCJy1HtiEEYFgxkKjxf1XpR7I=;
	b=gUbiV0nthanQpyflDQRimCVCgsUzC/NGOY3gxqR6kMDHD2PH6c1fjWqlt/jJZvHqoC
	MITTCHT/er711skzJ8x9H7s/qDY8mmKaJFQqHAaQMbaBQFRrssgkz5GM4vQ1fqfzCReA
	NMdXxncm8gzhT55MABxdeDEPcJybJpAhcKdvawelZQpPfGkINyvtCprX+TDzUV2ZmODa
	Fa/bwuSodyATkMssqA588L+She11HQBf1u9q6cgO92q7HCfriCOD77oXpq4T/78CXraG
	JYd0jLmvkQU8cBATiTwlO8vsL/mOiIV6PtPCPetxqwXnqw3XYbmyklo+brjS5Mhc154I
	NZ1Q==
X-Gm-Message-State: ALoCoQkPQRFXIsC1blKvwk1MbhnoaAV2Rd3yEJHopuM3Au6631O2hhbAqFbeJ5hS8nEqQQlmZcyN
X-Received: by 10.180.188.100 with SMTP id fz4mr3759976wic.57.1389375431354;
	Fri, 10 Jan 2014 09:37:11 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uq2sm4689783wjc.5.2014.01.10.09.37.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:37:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:37:05 +0000
Message-Id: <1389375425-21914-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libsyncml: move build dependencies from RRECOMMENDS to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 17:37:12 -0000

Putting build dependencies into RRECOMMENDS isn't going to work, so move them to
DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
index 9cf9243..8053eda 100644
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -4,8 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 
-DEPENDS = "libxml2 glib-2.0"
-RRECOMMENDS_${PN} = "wbxml2 openobex libsoup-2.4"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 openobex wbxml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/libsyncml-${PV}.tar.gz"
 SRC_URI[md5sum] = "84879ed7cb94618530fbcb801a1a4f95"
-- 
1.7.10.4


