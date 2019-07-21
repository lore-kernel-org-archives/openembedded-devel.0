Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com
	(mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB4EB7D048
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=MiPhY+SBgutM8RPKtlNQ2mqCTxxhGZkii6d0yagfIW8=;
	b=XmtaymUJB1SHL1mdDTF2cZdQL9MVrxRj2O6O//fzc0Ci84AoLW+KxcqMxKPAYKNauQ64CTmJtj87e
	4koM9WcCA+x8fGDqBsZdIvd05MVgK9JjxDfIlUB5jFSja3ComkaCBkq3+23E8caPo8piiq7+CaLaYY
	twaWqXIhtQywBia4=
X-HalOne-Cookie: 3c5b37e6d58e4a34faa10556e5ea096bbe4f751c
X-HalOne-ID: 92131532-abe8-11e9-8280-d0431ea8bb10
Received: from xps.fritz.box (unknown [77.181.243.113])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 92131532-abe8-11e9-8280-d0431ea8bb10;
	Sun, 21 Jul 2019 18:51:38 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 20:51:36 +0200
Message-Id: <20190721185137.27323-1-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2 1/2] pegtl: Initial recipe
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
X-List-Received-Date: Sun, 21 Jul 2019 18:51:40 -0000

Introduce the Parsing Expression Grammar Template Library (PEGTL)
a zero-dependency C++ header-only parser combinator library for creating parsers
according to the Parsing Expression Grammar (PEG).
---
 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
new file mode 100644
index 000000000..ca175f868
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
@@ -0,0 +1,12 @@
+DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
+HOMEPAGE="https://github.com/taocpp/PEGTL"
+LICENSE="MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
+
+SRC_URI="https://github.com/taocpp/PEGTL/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "fe96a704913523763642a2c4c4618091"
+SRC_URI[sha256sum] = "5699558ce06e8fad0530143199eeaefd29128fb4584879975c87947c8ad0395f"
+
+inherit cmake
+
+S="${WORKDIR}/PEGTL-${PV}"
-- 
2.17.1


