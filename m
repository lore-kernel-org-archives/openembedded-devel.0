Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 19FAF601A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 16:13:03 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so8751799wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/TlUnID8UgakrEyfWAnC7oHPA+JDpcnSyab4uhqG/co=;
	b=PLnCUe/VuTFanxObkLoX3v6nUdEsHEkoaiFyijwQwZnA+rdBHjCDWx6XOQqvn7+CZa
	Cn//QWV3eHxKMA5cCL9pa9/9og4TIaF5Sn4ZKWpgScjJH9XJAi3Pkol8g5AiArG54P+r
	zdT4GSllEfUAvZIq8BY2v1RE2hVN/5+92qbicmiHCUxdz1Zge0m5WySYbaUYH7yZhBzX
	ADFI5Ec3A6oWbsgqhd4Ca5Eq0cwA328A5wszQk60H2jIlMGNPy+eJQDEtVF5P+6BosDu
	Esp3L+x/7tipBn4O4+AcFEZeKFrIPz2fYK5NuG9MH3OgUjyQjmXPZSqGHtyB3YAVHQsy
	1xPw==
X-Received: by 10.180.73.115 with SMTP id k19mr27007998wiv.35.1407773584449;
	Mon, 11 Aug 2014 09:13:04 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 20sm2589822wjt.42.2014.08.11.09.13.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 09:13:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 09:12:22 -0700
Message-Id: <9a579f3a4be44b8287c1b1368e68f7504206ca78.1407773390.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407773390.git.chris_larson@mentor.com>
References: <cover.1407773390.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH v2 1/5] dnsmasq: add missing inherit pkgconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 16:13:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

dnsmasq runs pkg-config to get cflags/libs for its dependencies.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 1955d6f..71a491f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -14,7 +14,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://parallel-make.patch \
 "
 
-inherit update-rc.d systemd
+inherit pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
-- 
1.8.3.4


