Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrJgW-00088v-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 04:08:16 +0200
Received: by pbbrq2 with SMTP id rq2so1546607pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 18:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6wc/IVQF0Iqo5Sr7E3e+vbUUKcX9cTOh3MHoFR3u3nw=;
	b=lzE1tFz4ckj7/SmXRV70d1yY8kEmzsZG6irml2+xMW/hghB6DTk5rbQbSbIKqZ++nB
	s1h6qT2AbPBjySahAVKVqw0xsTFbUu/nGi6EwXsmAVZcM9fHQNoI2RMU182TQRM5jeGL
	St4YbVvMtC3c7p5VlCZkwZvI3FOvZMiFg4dY0/LGHHNq3b1dIy2cDdJxaxTJNkrbariJ
	EcGTcHgmK8pgMlZMqrLPFv4Yk+RZi4O1nj+NjPbHt0CcvQoD74AKb447u7XsqPgadP1N
	7hyyj6FkpkCqUDSvz6zL+BHgQio+jBsaJ3KOC4BpSdA4zk4j51Npx3g0FYxnhDK1VyTt
	1Efg==
Received: by 10.66.79.8 with SMTP id f8mr937438pax.81.1342576615395;
	Tue, 17 Jul 2012 18:56:55 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ti1sm10010816pbc.74.2012.07.17.18.56.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 18:56:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 18:56:07 -0700
Message-Id: <1342576568-31044-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
References: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 2/3] openjdk-6: Use virtual/libiconv instead of libiconv in DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 02:08:16 -0000

This lets it work with whatever is providing libiconv functionality

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/openjdk/openjdk-6-common.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 4aea61e..9d7e810 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -41,7 +41,7 @@ DEPENDS = "giflib libpng jpeg cups \
            zip-native \
           "
 
-DEPENDS_append_libc-uclibc = " libiconv "
+DEPENDS_append_libc-uclibc = " virtual/libiconv "
 
 # The OpenJDK build with interpreter optimizations for ARM depends on a binary
 # that generates constants for an assembler source file. There is no other
-- 
1.7.9.5



