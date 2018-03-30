Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9E28074741
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:36 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y55so8062719wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=V9f7ru4tJE+bDsXoYVXkYzeb71dZ+kz3bagORDU0SRc=;
	b=JJz9eLHGfniHxDlzDT936xxg4DPY3yztVCOee3F0TmEgsuxr4LklUR/xgsFPSzecmb
	KaVRLZNaiEfqEc/OkOwRBORSdsm4eLNIpY+1jraPKLphG+Y80yIQLWCuQLNzmQEwLspZ
	0kx7xhtRKNMly+x1M9fRS8H8kBbHCX/sgQg8uQettq2U0kLrLC9whlRXVwapFiVwhZ78
	odQsvbTyEnKAT8N4rVJclMyMjP2jEwiiE7PB3+QozlfWKNArZKHyJNyBnW3v3Bz5tcQd
	Oylr4brQzFd/lI+RTAcEu0pqbDtXtyt375eYQIUospQVYxsLCUVmCxTww6eBsb0ku65v
	Txag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V9f7ru4tJE+bDsXoYVXkYzeb71dZ+kz3bagORDU0SRc=;
	b=UPeQvyAornO0R9KNwMxlNLVRL5UAKI8sJw7qstOGl0eIbDshlVv49/Llse/nKrlp5J
	ujXTqTpj+OLV3l3wtdD2x2PiLapIFibx6lfddmvRkYQUxxHiPc9W/VhlxvHVm29XT/bB
	jkAsKZRHS3hw78titHmen+plOkRNGc3L+RvCuINO/ydg+PHW5GtIatkYTpAhKbnxkqeo
	VK9+ee896dxGBKcExj9srsN6blmkmV4CbO2qKLTRPss6chno2W6bFMbX0Vurads6WqE8
	1RT7sJW0wiTk5pS84BoyLHQBker5K+4+a3z5SV80ekvBY/ts2DgkSONBG22CQkaEaANG
	abuQ==
X-Gm-Message-State: AElRT7E9YH5MmL1Z+BXsWhtDkr4NX4UBUh4xeDqTD40iiG6Lv3BVPRtK
	hXRbcm6KGHxwqPJmOVyPcycRZA==
X-Google-Smtp-Source: AIpwx4/eLZNNjJtl/kHDxToYrjFF8XfJ7nqzeXpwV0NcAqeV6A91Uam1S7Ftkeub0yYqk7oSGgPXyg==
X-Received: by 10.223.150.111 with SMTP id c44mr10158467wra.90.1522416757165; 
	Fri, 30 Mar 2018 06:32:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:45 +0200
Message-Id: <20180330133151.25882-34-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 33/39] mm-common: update 0.9.10 -> 0.9.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2018 13:32:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove GNOME_COMPRESS_TYPE="xz - xz is default

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb | 12 ------------
 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb |  9 +++++++++
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
deleted file mode 100644
index 899eb8a9b..000000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit gnomebase
-
-GNOME_COMPRESS_TYPE="xz"
-
-SRC_URI[archive.md5sum] = "49dc47af8c89ce5b3c768306b9a0f922"
-SRC_URI[archive.sha256sum] = "16c0e2bc196b67fbc145edaecb5dbe5818386504fe5703de27002d77140fa217"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
new file mode 100644
index 000000000..591caa75d
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
@@ -0,0 +1,9 @@
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "d6f2a43589480d2315672da0b5839b56"
+SRC_URI[archive.sha256sum] = "20d1e7466ca4c83c92e29f9e8dfcc8e5721fdf1337f53157bed97be3b73b32a8"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+BBCLASSEXTEND = "native"
-- 
2.14.3


