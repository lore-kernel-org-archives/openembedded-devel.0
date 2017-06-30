Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C2029601F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f127so15345626pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HmUkMkQXtGUKNzU8+CdHtLVI8z4W8seZ+x1SjIevrJY=;
	b=ktjkDjviJ7Vrk+Dmk175TtQDTkxr3VAiylASx3LF/1fLNy2OifNMCq6/xvGM8uVmXa
	NEdmW8L2M/N8P5bMPE8fKM7qzRoliBTgWlLB58Nv8KS9R5rkQ6o2MqRtdIFX0T57oESP
	tutaRBA/UHV4ofoPkFWk4Z1LfXX0/88nkZ4BBIbUIYdnIpW5FRPaE179eJtqtCSPbXXH
	UA6Kj6EG4KRcNH2T2jLg124YJ0qxEA4BeaDCWAN1wizsr1Dnv8s430dXehp04/IWWP4L
	kJe300sXTcMkgtSpluNSxejSchyj1wWzgElBZDN2XujU/C1OWgnh6Zq0eh9sf3N0gtRb
	x/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HmUkMkQXtGUKNzU8+CdHtLVI8z4W8seZ+x1SjIevrJY=;
	b=fXoQIHj6rwZeq1Ek2pOkqX+uAwec3APca9Ao+DL4HfT7HR3Tdi6QKymjFSu5tHpLvK
	RI9rSBeD9rCZ1H+5HdDapCTiyuci2k+Myu6LQ4FsS4mGerO5aPD7k7zYYlzu18qa/ZSz
	bdDkJUumchXmnA7qP7NLRynhuuPUGW+APoWGVFbAytWsMp4Dci3zxvDtCE4g6eKUCWTl
	6g0f0hugF6fkBujhk4rxQupxMWafysoAiAeyKmhtoO9fVcSa/Ul4xqM91JFmWa2nGEGc
	KXw7Mgxnp6id9l1j5hvbr9Ycmha0eUifGP0seR2fdUNSS71jGg4ud27LAxn52/Pyldhi
	rieg==
X-Gm-Message-State: AKS2vOxroqis3mVxAqN6eN0DrL1cuVVHhQQnRdVI8ADPiSrE3Si84RQi
	eoc+6JaSvdPrTjzY
X-Received: by 10.98.55.199 with SMTP id e190mr22196937pfa.15.1498827611244;
	Fri, 30 Jun 2017 06:00:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:41 -0700
Message-Id: <20170630125957.3342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-networking][PATCH 01/17] autofs: Add build dependency on libnsl2
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:10 -0000

this is needed with glibc 2.26 where libnsl is deprecated
and is provided using separate recipe building it from
external sources now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
index eea7c4b83..ccd8a7f24 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
@@ -3,7 +3,7 @@ SECTION = "utils"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl"
+DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl libnsl2"
 
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 
-- 
2.13.2


