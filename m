Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC2D731BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e127so334254pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=3Qnq31pKIq4wRHAFHr9REvGpPdwM0ltoDoq6AB9JloM=;
	b=wc8erZvVrL35+w+Bjhe9YEu7v4M/uMsswL7U930RDGKh6/9bTdAq7ncK27+r1pwTeq
	GfIy3QL8CT5q7zeyeuqPsl6Zi0+SWew4jb3oM07UMUyjjNYwCr3ae7vOkw9Q+qU7vOYn
	K8LWRWWDguXYOI/i4WPvFfOVKVdabwu2+7/mYUhqR70vX89TMWBmILjfUXg1k9ZNJ3Gr
	Nr1r9X5J5dRqCnDCyk6ZO1syotQRjExey1u0qOYmsiTESLKpWV22En5Io+DZlRMoEPjh
	izY8VZt8J0kNc5vmbYOChdUh1xdrHS487URyeYjFn3tbsl8yCcT4NZqw1h+fPkc6fNaV
	DeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3Qnq31pKIq4wRHAFHr9REvGpPdwM0ltoDoq6AB9JloM=;
	b=CfQzsTWBll91vmQXMMIxe15MX9PcejFIl3K6ZHEDhI0I4jNC/NpmrWs6zAUCHhamYK
	s18aqDwSHEQsNSf2lSsFlxMVo8f9cxIOm4ZYqraVhFlc+Q0pqTLpsVMQQQDAA+5nxvcC
	n0yf6oMxNOn/R9XcpzRTUyblFXId6zcNBXnKv8k5yAIicaKWnDEyGE38QiuJFSJyyK4+
	o73KnjvvllbT9f6D2isBHni9kY5EuogP4hL1pMss5cJ7siHVS+Z5+994SYZb3zpaNemi
	PVEqVrR5Qozf0evr9ivN6RNsCX8IQkVJ6XkXtUZInuRwIVrM6aVcl3h7wogmZboNtqGj
	Upjg==
X-Gm-Message-State: AG10YOQp8ExsTe3hCIGdjlwXOlBIuSEuw6u7pGlOXDfnZtsB+LTCSzv2TXvftD4JW1byew==
X-Received: by 10.98.19.215 with SMTP id 84mr37615885pft.22.1454879542251;
	Sun, 07 Feb 2016 13:12:22 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:59 -0800
Message-Id: <8239925181787e297b39460fc9d4dd953f9ce946.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 7/7] krb5: Fix warning.
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:21 -0000

From: Armin Kuster <akuster@mvista.com>

WARNING: /tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/src/ ('S') doesn't exist, please set 'S' to a proper value

remove extra "/"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
index c492496..c19fffb 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
 SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
 SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
 
-S = "${WORKDIR}/${BP}/src/"
+S = "${WORKDIR}/${BP}/src"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-- 
2.3.5


