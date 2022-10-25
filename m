Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AD1C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 11:17:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.5730.1666696676255556567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 04:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=A+naGp80;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wphKSiYCrbRI/rzhE8EGHRcq12sZ6qCx2QXt0r17GZ0=; b=A+naGp80CZI/Jt7v8UETR44fet
	NCx/QqAZKziR9dzF1JW/n+a6KcEFLUBLDesVH5YmBKuDZ8cGCcCV3weHtRyoz9mYruRmxbvqsTDVl
	aR/YROoRFCOrlZsD8ExRE7i+8NBUD3c774zmNHHIobo3B7PKdcjdYnO5zJX/VubZwufFyJ81VwK20
	DY68coFRw+ptWmJnlZvIzc2Zg1epFFbjxo9B+PilU+Mw3eYZEmyiz+hzEenW3FiceV3KHgItypxZz
	CvLNkbi5Wo0D7RWmMQ68pWBqTeDldOm+Qe6ewc0iYTNNhY7NyPzj9HeIxkWs7FC5NJTZqvr7azvce
	YphZ1uPg==;
Received: from lan.nucleusys.com ([92.247.61.126]:48536 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onHxL-000A6N-2d;
	Tue, 25 Oct 2022 14:17:55 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-dill: Upgrade 0.3.5.1 -> 0.3.6
Date: Tue, 25 Oct 2022 14:17:44 +0300
Message-Id: <20221025111744.548689-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221025111744.548689-1-leon.anavi@konsulko.com>
References: <20221025111744.548689-1-leon.anavi@konsulko.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99304

Upgrade to release 0.3.6:

- Ensure tempfiles are deleted by default
- Fix pickling errors thrown when saving some Stdlib modules
- Move session-related code to new session module
- Fix load_session() and restrict loading a session in a different
  modude
- Rewrite _create_code() with Structural Pattern Matching (limited
  to tuples)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-dill_0.3.5.1.bb => python3-dill_0.3.6.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.5.1.bb => python3-dill_0.3.6.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.6.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.3.6.bb
index d9110e3fd..bec464306 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61f24e44fc855bde43ed5a1524a37bc4"
 
-SRC_URI[sha256sum] = "d75e41f3eff1eee599d738e76ba8f4ad98ea229db8b085318aa2b3333a208c86"
+SRC_URI[sha256sum] = "e5db55f3687856d8fbdab002ed78544e1c4559a130302693d839dfe8f93f2373"
 
 inherit pypi setuptools3
 
@@ -12,4 +12,6 @@ PYPI_PACKAGE_EXT = "tar.gz"
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-core \
 "
-- 
2.30.2


