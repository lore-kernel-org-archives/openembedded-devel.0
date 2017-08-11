Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9ED78224
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 02:22:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r77so4963370wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 19:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5S9yLU5X7ln8fNrHLkkkPlAUqhx1xdiWmDs9EPxfaKs=;
	b=DF0Ex40tqkz7tYI93AI1PwmXM7CRMv38qTxIJU+yKrAQtH8PYoOnFYrdznMWP2xd7G
	tHT0RoP0+Sm6psg7N31x0arBw2wXchiKTOFkrpJ9uqsomSDB6X76dNhCPaF4sDWUaalz
	xf4QjdcFDgNvyjbC+ofVE2uH4MBg3jdU+Fh5fc3rhgtZMszIvTn3rpVmY5c5axFT739K
	0ln8RQ2KnXns4StC2ud26DOATdjSAjZB0AA2dtdTrLqz03MEgguFQEA56WoQ73tXQFkw
	NI2I4+jLxcA5V04wCLGzh/unK707sr13vETZMKOyGcfwK9ZP7nciH4PnHYAcwEX/ZoDT
	wSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5S9yLU5X7ln8fNrHLkkkPlAUqhx1xdiWmDs9EPxfaKs=;
	b=WN8eydQMwd5pKZDR6sm0MLnZF8c9ZkXe9XVZkNwiJw92NKKTaFAoD0Y5qk6Ib9BDn4
	e3GFolsFQWwFgZz6wKMfbP3AYctwQnGi2UNwerbd4QLaGT1gCg2boBML3bd2egzJINS1
	joWlR8V8pZ/OtB1M69JgLHsuOdz0kRTOmHdWqMUrenYYTy/HbSz5URAjaFlRqt1utOaR
	zq8leU7Mle76VHO8/DJwSP7m7gYOt/1RIYsrSY5hwkrpate/bxDXsfpWvce3O9uU+DVi
	spiK2IAlZOLFWkx01We1PEMYvqLKZb9322tR9XNTVT9FcRQLoEC9JtZ4WqxSjEnqIyUI
	A0yQ==
X-Gm-Message-State: AHYfb5ibwMpOBaUWX5KBuBZj3TnwCtpoCQaxZ8NIly1qXcGIjEqCeqc9
	hHg9CK/ws9Ib7NST
X-Received: by 10.80.167.65 with SMTP id h59mr13445139edc.142.1502418167060;
	Thu, 10 Aug 2017 19:22:47 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240])
	by smtp.gmail.com with ESMTPSA id h28sm25140ede.56.2017.08.10.19.20.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 19:22:44 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Aug 2017 04:20:12 +0200
Message-Id: <1502418012-11976-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: Add -latomic to LDFLAGS
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
X-List-Received-Date: Fri, 11 Aug 2017 02:22:46 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes following errors when compiling with clang:
| src/librcf.so.2.2.0: error: undefined reference to '__atomic_load_4'
| src/librcf.so.2.2.0: error: undefined reference to '__atomic_compare_exchange_4'
| /usr/include/boost/smart_ptr/detail/sp_counted_base_clang.hpp:36: error: undefined reference to '__atomic_fetch_sub_4'
| /usr/include/boost/smart_ptr/detail/sp_counted_base_clang.hpp:31: error: undefined reference to '__atomic_fetch_add_4'

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 43eff72..46b75c5 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d43383
 
 S = "${WORKDIR}/RCF-${PV}"
 
+LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
+
 inherit cmake dos2unix
 
 PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
-- 
2.7.4


