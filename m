Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7BF605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:57:00 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so547193pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 01:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FHoO86uiZ3AqSWdNpx2JxDoGZgqF9xxmbSL9JuLLc+c=;
	b=bj82ag03TgWUIJRvO37EduwSXLi+Ym0oKI0CJqNrT9ljOU1RbPLubQwxUupfXiW63K
	EoajkyBY8KtwpD8DwFebwmoWAgy9hxsCsWRkEuRZi5XToQLvYJs1vW+M1QPTddApEvH6
	eR4KpS+WNsewaY++TlVNzDk9Cv20DBb5HBtS35D7yX7ai0JbrPMSjFofOSmaVprZF0EQ
	/9aY2yZdmZyI3pOm2WD+J9mdurF3yGc99DVDb1Zz0zHqjQjWTLAxkxF11xAQ4sJCU5bN
	OxdevifCRqRUyDPP9jpLllnH0X8dqP8hTDbLQ4Lug/Z7D3pZ/FeRs4xEW2p1ZRs/bpau
	C3gA==
X-Received: by 10.66.122.105 with SMTP id lr9mr99029775pab.8.1448963821415;
	Tue, 01 Dec 2015 01:57:01 -0800 (PST)
Received: from haswell.localdomain ([2601:646:8802:5d5c:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	v2sm56689146pfi.44.2015.12.01.01.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 01:57:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 01:56:54 -0800
Message-Id: <1448963814-5499-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [meta-oe][PATCH] smem: Add appropriate python modules to rdeps
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
X-List-Received-Date: Tue, 01 Dec 2015 09:57:02 -0000

It wont work without these modules at runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/smem/smem_1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
index 8768c48..519020f 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -24,3 +24,4 @@ do_install() {
         install -m 0755 ${S}/smemcap ${D}${bindir}/
         install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
 }
+RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codecs"
-- 
2.6.2


