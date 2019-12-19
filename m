Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 66A8A7FD8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c23so2707622plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n1/ZYhQY2UGWzRRD97l1dGthAdcVHaWk9Zn6nNyZP0E=;
	b=g+37gmXf4jeCx2QANa9vHu1X1sKKv/sOiElibsYaxQiqHVbk+EVcLKYq0baHtM0w7C
	gEPZy73DGraKhqmvjjxVBt0ipcdhX0a95G/L5a5JEmZZY1DYbcGBFg4p63Nr8PsALA+1
	v+GAb+Xf/kS7BlWx7rJOciPmcU5xA5YFWaMzSYtEwQBiuyO+aG0wNKc01j7QdLeWGJZW
	831bHyuL71nTdPknj9AcoMuqyKQn3xJXwPJj5u6yGb9yvgSWQmbTLHdVn5uSna/Bscrl
	HJFutJXPxUxOqWOLSCI6g48kf/0Vj5ncS2f40LjIWHGNHeLNCvkxqTtdRvNUMrNMDaPk
	kpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n1/ZYhQY2UGWzRRD97l1dGthAdcVHaWk9Zn6nNyZP0E=;
	b=ZL6MhJuNGnpRJBYUveNkMDqvla7mcsOUNPKn25OKyvK7hNhVBulxlE2/JKiP0cQvrH
	9+1R4Xt7j8tdY5WnuI5gr0qt7b4+SBekOG6wsNUu+yXqtjyw/C8G61weYU8iD5sIQYqI
	ouRtRPKKTgZMUUbXJvZcdvLQo6kWjIT80Dc42zhoJPXIiF0vB+fTnp12+PfyhDzcREe6
	OBaUzx1KjGcURaC5c2f0n+PvGN+ycNoOWOjqoETY7pNCBdfXnawYKWtnItWqsZsYJREN
	RoT+NeKi62tCxWsqnJp17ckdVB1Go+TU1ecDFu7Gr3eGNiC9DY+9oFoBls9A746Kyjp2
	xksA==
X-Gm-Message-State: APjAAAVHgscik1LFLqMbYLvpgrzQeeR+GEAkEuzrwOzZ+TaR27FdQPrL
	q7lFNdcc0aAcIdvF9JSlJF4Kmt+n94A=
X-Google-Smtp-Source: APXvYqwOmNQzMeiv5uW1bgjJVcAfLQZOYnBvkYiL9+8jf0b7kOUm0Jxr6vLFuB63H6Q6xoDb/kQOmg==
X-Received: by 2002:a17:902:541:: with SMTP id
	59mr9628842plf.190.1576769142799; 
	Thu, 19 Dec 2019 07:25:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:28 -0800
Message-Id: <20191219152529.725879-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/8] poco: Define LIB_SUFFIX per OE multilibs
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.9.4.bb b/meta-oe/recipes-support/poco/poco_1.9.4.bb
index c854481de3..f1dabcd012 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.4.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
                   -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
+                  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
 
 # For the native build we want to use the bundled version
-- 
2.24.1


