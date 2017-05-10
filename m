Return-Path: <ilialin@codeaurora.org>
X-Greylist: delayed 516 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 May 2017 06:12:23 UTC
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by mail.openembedded.org (Postfix) with ESMTP id 8D23171A8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 06:12:23 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D1C6F6071C; Wed, 10 May 2017 06:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1494396228;
	bh=Hs8Kz/t0LItoXq+BUz/0ZsqWDDQ1wQZ2Wm2gB1nPXHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=SR7A8l63LrvxhwxRyn272MeVyxI9UGeoQEZR04oYakZ9Yn52YLK8MoGAMVpduqoD/
	dhnsR6YDWMxw72Aws1rAxKtFYw/Bv+GeX18uNoWoWVs7Vthhhr9LceFPrwXWfIGHlk
	3g5naAgyvEprlQ9PcJ8GJnEp2RK77CF42ETJt4c0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,
	T_DKIM_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from lx-ilial1.mea.qualcomm.com (unknown [185.23.60.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ilialin@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E8B6260719;
	Wed, 10 May 2017 06:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1494396225;
	bh=Hs8Kz/t0LItoXq+BUz/0ZsqWDDQ1wQZ2Wm2gB1nPXHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=iIHTts2zeW/4BtUoWbyDU6y29ke5f/PgLIIISF4mBqARp6z6GrIg4wdoPml3VpeCM
	gdrxzGZRBaNiU8OYkN9cxNZIui7yqlnb1WgOd+DnG7iClGYWuSCwiiFRVpC6PWmWB9
	V8lTRzZYApXulKEZTuQDNpiVzi8F6NTFZadp6Z3k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8B6260719
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=ilialin@codeaurora.org
From: Ilia Lin <ilialin@codeaurora.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 May 2017 09:03:14 +0300
Message-Id: <1494396194-23666-1-git-send-email-ilialin@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: celster@codeaurora.org
Subject: [meta-oe][PATCH] libndp: Add mirror sites
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
X-List-Received-Date: Wed, 10 May 2017 06:12:25 -0000

The main download location is inaccessible. Adding mirrors.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index a35dff8..f3011e6 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -4,6 +4,13 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
+
+MIRRORS += "\
+http://libndp.org/files/ http://www.go-parts.com/mirrors-usa/blfs/conglomeration/libndp/ \n \
+http://libndp.org/files/ http://ftp.osuosl.org/pub/blfs/conglomeration/libndp/ \n \
+http://libndp.org/files/ http://ftp.cc.uoc.gr/mirrors/linux/lfs/LFS/svn/l/ \n \
+http://libndp.org/files/ https://www.jabawok.net/gentoo/distfiles/ \n "
+
 SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
 SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
 
-- 
1.9.1


