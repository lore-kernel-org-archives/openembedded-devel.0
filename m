Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id ECBFB748EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 13:43:54 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d73-v6so2340363iog.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4WjThcm+1v/p1wT42oiBYBo9a4+FDoEdxE+p53MPyh4=;
	b=F6snXpXZGgWeAWG/gCIVwhZs8FL96dapwzNHjBaPZVTXdiSuAeqo0NkyrSXyafu+4d
	Hep1PvmxUi8WxqQCKjCIlRfkpO37/gy18NKiUXtRKGXL8GIOBB/YPNdIRevzwLC8UahT
	vdhwEh3ypcov1ZcyAddeGBCVNAO7A7xZLZUA2bMQsHRHN2TfrFUdK5+jRZxBoQcXw8o/
	3Klqs5jGJLjcyknusO6aE6S8SrdqI+mp7Br+mFnREAg2DjApSsyaIt8OZ6wpxvTYUbPo
	iAMNxzRFPzfT7u7EzTJROBd1NN9OIzyBVivnKLoTDomiqYoFOleUWQFTOOi0QsqziPdr
	h4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4WjThcm+1v/p1wT42oiBYBo9a4+FDoEdxE+p53MPyh4=;
	b=LW3+a42sL/Et2TAaxjvJMg+zBwaGj9UcTE1wJrAHtBJ3fB96S8xw5cnctBdWebFB2U
	fxhApYvwFO/uLb8VcHHV6J/KDyEjodm2E/Tkp2/CGGckeb5SaZVH4xIoRETJGeB3sFLb
	/RQTqROzlfl5hluY1pNhIdmps4OI1J37nN4HeyAyoOGbzMY1Sbs7NFdvT5UX1BSx9pum
	pKEvRhnFSZuI0cYjudfDTFstymPQhWgzXPTiV/SMpzk41HMFWiKOV8dBuGiUhn5Kr9SA
	Eg+c4aIkbR/YSoIx7fJmOBZHgpFVOyar/jmRnBxnbMDcBcjyP5zzQyBl7VkijjsBT4W+
	mljA==
X-Gm-Message-State: ALKqPwfp2fFy3cpaiRddyaZQnqZE1Tw4qF8yVhcg81udTIXAEVk926r0
	yfzO2i5jo5X/T4n8juTnPAilqevp
X-Google-Smtp-Source: AB8JxZph/331pTBbBthZ8I+kyejDdTcxkIa3ErpaAvZg9qRvXErdh5G+GEt5EaMwh+P8j8SED7Q8Og==
X-Received: by 2002:a6b:2f95:: with SMTP id
	v21-v6mr7101044iov.239.1527169435273; 
	Thu, 24 May 2018 06:43:55 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	r9-v6sm10999984ioa.49.2018.05.24.06.43.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 06:43:54 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 09:43:36 -0400
Message-Id: <20180524134337.31572-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524134337.31572-1-twoerner@gmail.com>
References: <20180524134337.31572-1-twoerner@gmail.com>
Subject: [meta-networking][master-next][PATCH v3 1/2] grpc: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 13:43:55 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
index 0883ec176b..e9491c45a9 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -31,6 +31,4 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     "
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


