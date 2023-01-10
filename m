Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D57C5479D
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 00:24:11 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web11.91418.1673310241310354030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 16:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vctlabs.com header.s=mail header.b=G/Djx7rA;
 spf=pass (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id DE48E2802AA; Mon,  9 Jan 2023 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vctlabs.com; s=mail;
	t=1673310215; bh=R4GLEwX0ZbIL3nvmaNe/ij1R3i+BnwlgL+keinh/mk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/Djx7rAuRszJcIoYyx4xPStEt0bme7X6EXb7kcXONuBRhQTDw0/oGDGvRzwSSi7J
	 GFhyGz0g1qzwsETQngaBmPnGCIqh48G/9ecnycT1nw1XPFuUV6JuL67tiVR+wGuBNr
	 P7rtshW92AVJ/xtMvrxSGx959T4LvpLQx70sbeWTw2E5GGvflVCjPiPcNsd55iSyiT
	 i6PVs9OVlroA1bJ7vuYgdG0JX4i+EM5sJjMowa351NQcqnmVLTzxb0hwB0fIIbok8Y
	 CU0gz129l26w/p8GEpMoDD6GkygP+3pkEmHXdTup2KCUOjxYQfWqlWRx9dXnO/ZQXv
	 gfFjNjJwBKuvQ==
Received: from codepurple (c-73-241-118-43.hsd1.ca.comcast.net [73.241.118.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 576E828028C;
	Mon,  9 Jan 2023 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vctlabs.com; s=mail;
	t=1673310215; bh=R4GLEwX0ZbIL3nvmaNe/ij1R3i+BnwlgL+keinh/mk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/Djx7rAuRszJcIoYyx4xPStEt0bme7X6EXb7kcXONuBRhQTDw0/oGDGvRzwSSi7J
	 GFhyGz0g1qzwsETQngaBmPnGCIqh48G/9ecnycT1nw1XPFuUV6JuL67tiVR+wGuBNr
	 P7rtshW92AVJ/xtMvrxSGx959T4LvpLQx70sbeWTw2E5GGvflVCjPiPcNsd55iSyiT
	 i6PVs9OVlroA1bJ7vuYgdG0JX4i+EM5sJjMowa351NQcqnmVLTzxb0hwB0fIIbok8Y
	 CU0gz129l26w/p8GEpMoDD6GkygP+3pkEmHXdTup2KCUOjxYQfWqlWRx9dXnO/ZQXv
	 gfFjNjJwBKuvQ==
Date: Mon, 9 Jan 2023 16:23:58 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, yogita.urade@windriver.com,
	akuster808 <akuster808@gmail.com>, Geoff Parker <geoffhp@gmail.com>
Subject: [meta-oe][PATCH] multipath-tools: fix QA "dev-so" regression
Message-ID: <20230110002358.GC1773006@codepurple>
References: <48dfc489-5c28-88bf-f714-a3c4b4cf840f@gmail.com>
 <CAMKF1sp3jzrMqz1n_nTZ=C8Py9sBwWV_e9btzp1FrStJBYNNrg@mail.gmail.com>
 <CAHNuFG+Drd_x2bwtnOMOqkXXnd7QdEA=RoCe6vyKPEvdtstXXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHNuFG+Drd_x2bwtnOMOqkXXnd7QdEA=RoCe6vyKPEvdtstXXw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 00:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100494

the commit addressing CVE-2022-41973 caused new QA errors due to
.so symlinks getting slurped into multipath-tools-libs:

 QA Issue: non -dev/-dbg/nativesdk- package multipath-tools-libs
  contains symlink .so '/usr/lib/libdmmp.so'
  ...

Fix this by making the new pattern for multipath-tools-libs package
more specific.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 2e929362d..43dced707 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -122,5 +122,5 @@ FILES:kpartx = "${base_sbindir}/kpartx \
 RDEPENDS:${PN} += "kpartx"
 PARALLEL_MAKE = ""
 
-FILES:${PN}-libs += "usr/lib"
+FILES:${PN}-libs += "usr/lib/*.so.*"
 FILES:${PN}-libs += "usr/lib/tmpfiles.d/*"
-- 
2.20.1


