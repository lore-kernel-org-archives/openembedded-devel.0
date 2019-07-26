Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com
	(mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8837F119
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=7/PGhydZ4Gn4C4IeYo3+QHReC1dwJjPDl82yEN8xv2I=;
	b=xDf7x1RVXQRPzhAPGEuOMW9cszEgEk06/AMfrx6hDcUsEak34XJ3IWcSa6wmZRZX+SjEnmghJpKFi
	IRbAedtmt8elmEwfnYhb68VwISEsd/SKjqYCQrAsZBR8wZBcEOb/lEgMHCfwelzrv8IgBHrOn6vCQJ
	ozzRT/tc/7okRXgA=
X-HalOne-Cookie: 0cce20aa6ced820245d67f8d744432a89e8a8aff
X-HalOne-ID: 02d2d35a-af89-11e9-b9fe-d0431ea8a290
Received: from xps.cvs.cvsdiv.com (unknown [193.240.242.3])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 02d2d35a-af89-11e9-b9fe-d0431ea8a290;
	Fri, 26 Jul 2019 09:37:41 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2019 11:37:35 +0200
Message-Id: <20190726093736.24607-1-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3 1/2] pegtl: Initial recipe
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
X-List-Received-Date: Fri, 26 Jul 2019 09:37:42 -0000

Introduce the Parsing Expression Grammar Template Library (PEGTL)
a zero-dependency C++ header-only parser combinator library for creating parsers
according to the Parsing Expression Grammar (PEG).
---
 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
new file mode 100644
index 000000000..f41eef2a0
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
@@ -0,0 +1,11 @@
+DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
+HOMEPAGE="https://github.com/taocpp/PEGTL"
+LICENSE="MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
+
+SRCREV = "776fa4a1e8bda860008524f6dd9473967c8375b1"
+SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
-- 
2.17.1


