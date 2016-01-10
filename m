Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id A75A2760AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:04 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id a20so18004026pag.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8RAGbpk/CycS4Uhz8XWqLFC839pmpcVaQ6fP/n7roDk=;
	b=00EsHVIF/TXdxxJD7DZvsXZo2MUu5DMxZG3y+CEPBckjsDjzsv/AH/eYMG5T/zR5qx
	/+z4SK7COd52sm/OC+X+7V6NjqxVwdH8VC+82R0xyMsn1te32cMrQUueLtpJuT7XCNB5
	R9xFcCuszmh8QzoqqalgFg5WBA97zZPapx2KM4LAu45V/xp8ArGARD9tIjp4pC2QJhDl
	+xe2NwHCOKPLtCjBIQBER5frLvEra+iVq/hf9hbBCtM6WPypa56SOg4avZiwwSAeCCKC
	yV73kUHFIpyIM+XcvR33WXKkrMaCiGWvJNPdnUBqX0h9MG+CLA4Rgu2Gzy3zhlir9P2w
	nIzQ==
X-Received: by 10.66.254.99 with SMTP id ah3mr33856915pad.71.1452387605135;
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ux2sm176246646pac.46.2016.01.09.16.59.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 00AC4FCC844; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:35 -0800
Message-Id: <0a78536c92a328f52a1baef6d15066e2395ca54c.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 12/22] iperf3: fix build-deps qa warning
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:04 -0000

From: Kai Kang <kai.kang@windriver.com>

Add PACKAGECONFIG lksctp to fix qa warning:

| WARNING: QA Issue: iperf3 rdepends on lksctp-tools, but it isn't a
| build dependency? [build-deps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index 58818bb..4a0f28e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -22,4 +22,7 @@ SRCREV = "e396134952a01199326665d1df7c51ae9e62e945"
 S = "${WORKDIR}/git"
 
 inherit autotools
+
+PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


