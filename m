Return-Path: <joe@deserted.net>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1F652772B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 00:56:32 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z135so197273565iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=b9xY3OPoOK4GXAR8L8nvjPQ3/ABn1mQ+VUwf85L5mYs=;
	b=d896Yc1/IkB2Wllt+GYaGYQa3ygrYVjvVle8jf8ud61ylHpbGiZ+daS5R9Di972qCO
	vVuZpAFVk4mpLZ2JEK/jmUTduSlmo/w/5aW64Eg7oLxqo11HZVwUx8RlKS+g+UeFbhz0
	0Vb+luWcI1Vvez+1Dn/P9mPNd+lK3YekPWIu6nDeojnKZ2F7pwT0m4u5p/att7XnTmqZ
	5jCJGL5DU6xAnB1QfqHPtxs7rkP/bVnz6zenZxbC1WSVKmR+urBafbDR1h91EDxP5zfm
	O8GgUwSOnoDXnA9y+K8ca2XyVYO405BuoyLVI8f9YNrItjgk3/tGxSoGJTgLUEpPbth9
	QjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=b9xY3OPoOK4GXAR8L8nvjPQ3/ABn1mQ+VUwf85L5mYs=;
	b=iQj+sBS1+QBT275jfRZD0oyHrmkF2XY9tUFYDyeQPGibs2XqpYv60lKc8ePolEbCmO
	DiVTsm8AFaHm11SRVLtnxwpZiL+kiZWG2t6IiLHrO/rSDLeMvSVX5epajUoVZ2ZUGsI/
	auCh6dlEMMKrtXNowtd5b8v5PaEP252D9/oS1KVtiwHgUFlQ3jX/C3+91h8fY2hHLEdN
	V4rRntedh5ILei4grsUAw+EYOFagEOrs0yaoHsHmTVORy4iHJWvmdH2Iww/yiZPYjslU
	KMrWTaUXrDQpso1N1Jg3m38xXAz+cog3HQC4ldILdpiN13Krom1PBLOfLdxH4HJEZRTE
	aDdw==
X-Gm-Message-State: AG10YOTQr5iohVJeG3uKaOXfzqIDGSx1acDD+zzFaI1cZCrQ3ti79bRr/bKEMcAx/2aBnQ==
X-Received: by 10.107.128.167 with SMTP id k39mr30078959ioi.26.1456188993592; 
	Mon, 22 Feb 2016 16:56:33 -0800 (PST)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	mu8sm10286308igb.16.2016.02.22.16.56.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 16:56:32 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:56:56 -0500
Message-Id: <1456189017-29180-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456189017-29180-1-git-send-email-joe_macdonald@mentor.com>
References: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
	<1456189017-29180-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 2/3] libldb: Fix build when static libs disabled
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
X-List-Received-Date: Tue, 23 Feb 2016 00:56:33 -0000

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/libldb/libldb_1.1.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.21.bb b/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
index e9659d5..bdad87d 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-privatelibdir=${libdir}/ldb \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
+DISABLE_STATIC = ""
 
 PACKAGES += "pyldb pyldb-dbg pyldb-dev"
 
-- 
1.9.1


