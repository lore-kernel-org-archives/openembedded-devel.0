Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEF479C00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 10:01:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y16so8652730wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hCUAqVBaqDEgYDpek5bU7GeUi2nKLhWjBHEZBTQT34U=;
	b=b46X5qBSWKvhsjTfHiayiInu6toQC2ibpa2t2iA8pj7CIp1ck3fnn7IiddUyenRN+E
	E9pOr2WrduZbufJ2OFDVNBm86dDE2MV1P3vXvZnsUHT6QGUIAWxbZJ2nY1hCKu5lq0gn
	1krWAQw3HuNLUaZi86MWmbpcCWPCevwM6gIDUgSMflGHDK3EkZEzXVSQFtHQmSdT1LWY
	qGMLCG7KedYnL75RxkJZd+sbvpdwJ6c7nO4YAo6F3+TGPHM/XXtkqsN2C5lqEU6q8A5v
	oNK7rZR/mB2FQ+SlQbv1DDss6CcVg6CwQzVYp5oHxwv8QD/GQVxiV8t713QoaQ8spfOI
	uZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hCUAqVBaqDEgYDpek5bU7GeUi2nKLhWjBHEZBTQT34U=;
	b=mOHZ7TsQ9AqyVnX8vt2Toaqi91n0UBEJB3Euq1lxIh6r2qguyuhdQLPDANg4UTnPs/
	S/CZZN/2AK5B+kpj+vYwS07RPf0v7baR7B2YZzLaAOm9S7k8f02rHtUT45Poir9J8Ipq
	rqmPykRRhZIThCxRdHY7iUniytTp7yaCNSuoGqzTYDzs4V1i/qM3ariSPB3y4QJffQbE
	0KjZQGZllxf7XuRI7LZNa/WL71ZWKkfwH5uSen2rhW2y5AozN3bLc0pX1aNa2iR5x6t7
	EauYtw5mGKNDvzHi2RAT/hemHlvSag+JIO88bUFbpwkpEJtxIg/MeaOeOo42u13Izpf/
	c+Zg==
X-Gm-Message-State: AGRZ1gLnUQ0gT4ix6bvuQsiEUvJQlPT/KTsLhzMoYjBNF3oT7apQ2K2O
	9N2OTLS9S5LjmekRw3RPckTJ88Df
X-Google-Smtp-Source: AJdET5eHDLKbz4LpNKKA52Qgph0Gh8fR3crtON5mQEfHANtt0l3d3/BTammagaDnPbnAg69twbZ9dg==
X-Received: by 2002:adf:8909:: with SMTP id
	s9-v6mr1158510wrs.309.1540461681791; 
	Thu, 25 Oct 2018 03:01:21 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (a-ii1-78.tin.it.
	[212.216.139.141])
	by smtp.gmail.com with ESMTPSA id j13sm719410wrx.5.2018.10.25.03.01.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Oct 2018 03:01:20 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2018 12:01:10 +0200
Message-Id: <1540461670-6802-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] redis: fix build for qemuarm disabling atomics
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
X-List-Received-Date: Thu, 25 Oct 2018 10:01:21 -0000

Apply the same patch used for mips.

Fix
  |ld: networking.o: in function `createClient':
  | /usr/src/debug/redis/4.0.8-r0/redis-4.0.8/src/networking.c:93:
     undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_4.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_4.0.8.bb b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
index b6f37e9..80d36d2 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 "
 
 SRC_URI_append_mips = " file://remove-atomics.patch"
+SRC_URI_append_arm = " file://remove-atomics.patch"
 
 SRC_URI[md5sum] = "c75b11e4177e153e4dc1d8dd3a6174e4"
 SRC_URI[sha256sum] = "ff0c38b8c156319249fec61e5018cf5b5fe63a65b61690bec798f4c998c232ad"
-- 
2.7.4


