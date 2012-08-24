Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4n5G-0003j4-Sp
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 08:09:31 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2828031pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cCd/cVECL0W7NDzn6qGGIB6mTfi72LdSBlXAwlbxx8s=;
	b=U7PcsNI99B0ws0/h7ZnVa9nX1hUxPHnbYDTdqe7tByF5o+kPewUtn49QuehpjUW4FJ
	38Tg1sINrlaWwmmHLdhHiDZ1cpkuM1lqem92Ga7Udb6ZvTjqlOvKTdW375IruBWLTuJt
	ReHFZjdDPzUUCwUgDnRnA7hDKYmXG5X8VXsukg0+53iMzVVKewOSmTqMF4mEJuKfw3xY
	21RQizZ1ah7sGjUFxs5AQd5CXxllD+uLUK6/O/pD1v5HIzhj5c9kcs5wjqaXz2IoiILr
	ddNnqx3sKt+ePNL6DalZnve/gSYPz3sbY6uMil6SwYFZUNWWYXNi7oPId0YwctxRF6zV
	JBWA==
Received: by 10.66.83.129 with SMTP id q1mr8501289pay.4.1345787845537;
	Thu, 23 Aug 2012 22:57:25 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm7594293pbc.36.2012.08.23.22.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:57:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:57:05 -0700
Message-Id: <1345787825-9950-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 5/5] binutils-2.20.1: Fix SRC_URI checksums
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
X-List-Received-Date: Fri, 24 Aug 2012 06:09:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils_2.20.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..f40b676 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
-- 
1.7.9.5



