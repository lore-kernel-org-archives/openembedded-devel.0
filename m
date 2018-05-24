Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4DC71957
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:45:38 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n64-v6so3690263itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Lle0hZHyR3Vq2ZA63OK+GlMRxK0JXxb58FqrNoWmmFU=;
	b=sPaXvh8FyvrYqm7KZCazgZLbbbvOtHo4FT3XX0+549tgIs+kLN+tBHcYcE15a7TT0G
	l1RJcfb8y3k/S1HT9Bfm/NJ2xNbGwqd7wkLXQbXoox2Lqj7FfbexEnUS93y0uKnU8mwM
	onbjwJsd3yX6UZPbnkQqpjoj2+i8qyJCnqy5Jn0q6O8BdQN0n/ZmvQPB/azKOsaH3QCP
	CDHe8vAK+g6uUwM8yLRa0pOxpLw9OXfJYpOTEjM20EwOg2nKBLpF+qVh0eXULBvWHbjf
	2enDOYNwPWZ+2/Zik44qPO4br6cBigf4dviZSXcy7FRDYCjSorYBXPFWraMgBjyYnB1H
	3i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lle0hZHyR3Vq2ZA63OK+GlMRxK0JXxb58FqrNoWmmFU=;
	b=RBlEKhR29JdaAjUU0buW49Nz02F2MGhdRqUddu9/ccAxW3HVDKLMqZjvSl/m7QUVLe
	UgMhueza9xqxWziWVqmaeBq3R4PTIS90RQHPHwN+a+obMaZILUKDfF8XJ7meCiBnCu6g
	5dsQhOYc/tErrKmPNSe5oaANG4Xd+sXNTo0C/hqWS5pW0UZjyl6fZXYMjToUGrfBGkEj
	MkrIfHxRkB73T07JJhHlfqMuy5AMNr4v/v/BdtAb+N/Jd3hYwNoMQW5adbcDhes6aD14
	QJEWS+txXk9nu3bjHN6j0KKGFe0hdhyMKfTJE/hDqL8OinSrQvt7yTZ10v3Mwlk6GqVm
	fvUQ==
X-Gm-Message-State: ALKqPwfask5AzcYI+HxbamWK3Rrc4ORLm8+f+2lObvjn/Nf6tmGVQRpT
	LENVnmFY6uAffmwBt790Y+5cIWp1
X-Google-Smtp-Source: AB8JxZqnBFlYJb8X41Iin00LoNVlRggG4vOkgYT6dm840Dibl5aAWGTLI3reJuLWv8ruLYe00Rkn3A==
X-Received: by 2002:a24:b08:: with SMTP id 8-v6mr11069122itd.30.1527187539601; 
	Thu, 24 May 2018 11:45:39 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o184-v6sm2797190itb.24.2018.05.24.11.45.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:45:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:45:30 -0400
Message-Id: <20180524184531.12459-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-networking][master-next][PATCH 1/2] grpc: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:45:39 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
index e9491c45a9..4b6028dbfb 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -4,12 +4,11 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
 LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
 DEPENDS_append_class-target = " gtest grpc-native "
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
 SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
-- 
2.17.0.582.gccdcbd54c


