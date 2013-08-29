Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id AA2A76BE19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:44 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so341436ead.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=36eweaNxUtVemn/hfWV6tzSTKAGZAFrbLBuCQVSIfgA=;
	b=gvK2vQiHYGOEDpIjm2uY25T2I1q46PzbJZkHuLKTM9U2nKD6sLxYZIQV1gNsDRN+U6
	dLSWd8prP7RKwyG/OVuRAOu29pAzGS/DWws+43UgcioSew6PFB3tAdyOfHIp5FRCLHXq
	MpwbIFwDBgR7ml239GaR4yqdiv99BjzKpexcQ5Xvfdrrts3XpClCUIBQBY60mCCqSecN
	kVU9zyUEzNVRtlrJ6EeSwFJKfVJHAwPZzU3imSqxfo3UFAhgDhsmSvERq77PG73UF6Fn
	J/VM2J9jHB8AudGBwTAJaYV3o/cQuRRP1Q7Y5lbm3HeQA5DlzUyRvxb8yswqVrzwjxKT
	+uGg==
X-Received: by 10.14.127.4 with SMTP id c4mr5342093eei.61.1377791505152;
	Thu, 29 Aug 2013 08:51:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm47177838eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:35 +0200
Message-Id: <ed3957f893e5f9a5841f2323f2e9ff1eaac2db8b.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 42/66] libmemcached: Add PACKAGECONFIG for sasl
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/libmemcached/libmemcached.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
index 448a15d..50ef4d6 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached.inc
+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
@@ -7,4 +7,7 @@ SRC_URI = "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${
 
 TARGET_LDFLAGS += "-luuid"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[sasl] = "--enable-sasl,--disable-sasl,cyrus-sasl"
+
 inherit autotools gettext pkgconfig
-- 
1.8.3.2


