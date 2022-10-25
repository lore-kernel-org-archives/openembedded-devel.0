Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E34C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 11:17:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.5936.1666696674318385017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 04:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=mWLdmlhF;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YP7dVjlGXwLCgUmTkhNhwaf/fp0lB/KtAcupz9bQ7wc=; b=mWLdmlhFClalWPMWB77zFRxoUB
	/X+jdBviQGVYegCemJ63PQvW1wjt0a9EmjZK8ThR/lasVVB11fNBVzjojLXddqaGc/54ZtF6eRluH
	yV5yW45mjbY1nW/VxgdfB1SN6hpVGUGyTOtUkdNU5UWItKdjvM1GqUe/Ty20zbKAoJc8twxSINASl
	DayRNjDEg+AIrSL2T9ukVUmJRy8l5KXlVShk0WqvEFoe+Ui9Vz1hsu8tUTiIuYv1/sUYDFf58hAOe
	NEIuSUAJTCyj5nGH/y0mnS+a2YcjrQaGUDRrjjjFcXQMUlNV214S6/RnTIDdF8O2v0geoSXV4QMmN
	ci8D0MQQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:48536 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onHxI-000A6N-GC;
	Tue, 25 Oct 2022 14:17:52 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
Date: Tue, 25 Oct 2022 14:17:43 +0300
Message-Id: <20221025111744.548689-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 11:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99303

Upgrade to release 3.2.6.post1:

- Improvement and refactoring in CI and tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
index 802eab2a0..448772960 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
+SRC_URI[sha256sum] = "58b5d84e5fbff6cf8e117414b3ea49ef51654c02ee887d155113c5b91d761967"
-- 
2.30.2


