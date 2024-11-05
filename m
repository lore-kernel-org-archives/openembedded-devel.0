Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE70AD3E770
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:20:08 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.web10.31604.1730841605524220840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=bDpuflxU;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=oExpyRlV;
 spf=pass (domain: cold-front.org, ip: 202.12.124.146, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id C4FAD1140151;
	Tue,  5 Nov 2024 16:20:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 05 Nov 2024 16:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1730841604; x=1730928004; bh=QF+5W0ZpKD
	qVcIfCSbsJh0mQpFQ6DWURrVmJycWGJqI=; b=bDpuflxUYq1e4HDixSp4FGEJMb
	2kFSQZeQbtk0O3vz36lQgqYNv3cugCuS7/oanPxF0jHaEpxkQb4c8h29Fzl9/R3J
	p21oDfpCc6BPzynRJeT5/lIxbwU6j4KyQUz/jsrnGMQw/fQzProQOKJ5nrUs4N5g
	LhdCM1ld5qvbshKtbMYqlRZ36/su+nbeoAoVZvw4YnT0Doh0cOpcXcWlw1f/pXEG
	2f/15Y4vOTHyj6eDT7qCqdyqzUWZm41jufz5T20psUDcJWEIEvq0gEd1WGNI109A
	8R3OkK5DYEDAAszS4eVcoPtxvty8U77uBHucf1fNoq0DhAvc/pAkjEjtKrvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730841604; x=1730928004; bh=QF+5W0ZpKDqVcIfCSbsJh0mQpFQ6DWURrVm
	JycWGJqI=; b=oExpyRlVYmcVbjcV2voSq6c6DsU7IqBSNkEoWzh1PUHbtOziswo
	LlhINz9MZfG2FKuCNg5/vt/KHrFpc4Iz6ZhIJ/iDPoYyIJfS4s4NP1l73uV7iYMz
	mNp30FTbp/CK6spUumBYk7fo5UBTBqVGz01N14GO28u5rnD3AK59ajHInmx8aqkB
	jszPP0GkKFTQ/UFxfozmiwn4UdXdo4jlvogDPRZQo410YSnrxy/jXeXwdrJ1GEp+
	Oq43IuQL/O9Zk5DYueThaJEA596v8S7agmJ+2+B5x0ReDyk7Ow3nchRayY1DxzNy
	1x0jVCZxRwnDEQlQDShMSJ8lwe13M0STqKA==
X-ME-Sender: <xms:BIwqZ-d6ws1KV3NTnWSkX7KEMM-jB5ZXZfxZfaUCVXhStu51gwygVg>
    <xme:BIwqZ4P6Iz2Me46RrdT637q7oRwVJPoEB5AjwbfDzlq6OOSnF0-_mSVD4BNZUalf-
    2a69S-Paw4XxZ0h9g>
X-ME-Received: <xmr:BIwqZ_izh93nTY1E6C-uqY1xd8b1aUTjp0jZ6Ejo5DB0gC78pS5lpFEN5lm-SdCtoNS4JbHCYId4S-s0BHISxmGBe-rvCsR0OKp5aXW7iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddtgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcu
    oehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvg
    hrnhepudfghfdvkeeuheduudduhfeuieeikeegfeelhffgfeejgeelheejhfeftdelheeg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssg
    hrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgpdhnsggprhgtphhtthhopedvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvh
    gvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhs
    sghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:BIwqZ7_c-3txeNXUXm6qSxU13CWlpXjRCs_P2Vc2Tk7u7q2iWMYgfA>
    <xmx:BIwqZ6tb6HCzlna6FYPDVl6TV899dFNqocqnGtb35551doLQPLjJYQ>
    <xmx:BIwqZyFG1SEuUUVSzr5gHI0TGZaO5dIXonj9lj4neG3tWRorYBNSPg>
    <xmx:BIwqZ5MT2rsc2EQBwTIHyxVg2H-1sUSBZbm5-fdVx-c_gdiTcyJq5w>
    <xmx:BIwqZz4TZRBFo3F7kN0wdI7fz3C-CT2UkkWFPxaMdcwzM5e9NeSLyP_r>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 16:20:04 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][scarthgap][PATCH] python3-xmodem: replace hardcoded /usr with ${prefix}
Date: Tue,  5 Nov 2024 16:19:51 -0500
Message-ID: <20241105211951.305771-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 21:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113617

Without this the native recipe cannot be built.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
(cherry picked from commit 4a86f8a54fe96f4aa05232180a2a744a15638f55)
---
 meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index 482f0c641..a5942e3d5 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 do_install:append() {
     install -d ${D}${docdir}/${PN}
-    mv ${D}/usr/doc/* ${D}${docdir}/${PN}/
-    rmdir ${D}/usr/doc
+    mv ${D}${prefix}/doc/* ${D}${docdir}/${PN}/
+    rmdir ${D}${prefix}/doc
 }
 
 RDEPENDS:${PN} += " \
-- 
2.46.1


