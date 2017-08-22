Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D5AB478315
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 23:26:13 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c15so132898pfm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bzlLVid5Yz+l/EB58Bs/myJsuey2d/Af8TOMFH8HTqo=;
	b=JyHeotmWucvbeWUolTKQ4nUt/7eSrL17nGm8TpMt2hTKT9va2vIZ7q1b7JfbUfrlC8
	kf6nd+WyZOrjkLgwKkEh/VkPFguiBvHpxof1wz7AAdp6NBSIRZIcyQ/ba+ysugJ/b6+X
	UwnXGsqIxZyTDpE/dBWxkDea9dLTUTmjsugIqn5zc4qmJwWJR4x7e2373/G1mfbC2V81
	R3DwyED2zvHBqxBZO24hg9M+XblkXDesetmrwWu223IrrNNIIBznuGaNnKTWp6AFx47L
	bUTxuZF3zzJUpk3e9xhXkmsHOIR9KDFR7Cd2TKzleEdoxR+mjZbFfNJkgw7cR+QLCr7z
	MnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bzlLVid5Yz+l/EB58Bs/myJsuey2d/Af8TOMFH8HTqo=;
	b=ceqVF3MHbfeTbj4ZO4N+NZeDqS19n/M9iCqJxhzFEJpXk5iGxZej10jAPv/TLeuZfr
	jChOkMWJaS+3OFTzIAAWsI1xJLz0hkqeVux9H9fNN3RNBn87hmXOxmb4IGf0hk+3BN24
	AxtOGR0c6q/c2XywHkagNtVMJzgXeeNd7Gxfd/4aZXdGRY0nJn1JL7vA9QTEmm4wZBXF
	VkPf/YDCYfHkqnzyC8k1zH0zCuIhqqDKX3EU8i/KjHoxyzH3+MdGK1ntrvw2lpU8pprg
	OBOXIV7jknh/4cm5khu3n8Ud4RuXW2LntQwntCYVVWV+C46AOH45Uhb28Xy+U5RrBCu6
	x1LA==
X-Gm-Message-State: AHYfb5gurzRAWWesb+gfwyOOwZav7T04/7YDuTIWIMPMPe+IEvAmg3sl
	DTaiTdg2pgmSXNUg
X-Received: by 10.99.117.65 with SMTP id f1mr782632pgn.312.1503444374910;
	Tue, 22 Aug 2017 16:26:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::175d])
	by smtp.gmail.com with ESMTPSA id u28sm137304pfg.95.2017.08.22.16.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 16:26:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Aug 2017 16:26:05 -0700
Message-Id: <20170822232605.34193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-python][PATCH] python-markupsafe: Extend to build native version too
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
X-List-Received-Date: Tue, 22 Aug 2017 23:26:14 -0000

chromium-60+ will need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-markupsafe_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb b/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
index 396eff102..5c9884b9f 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
+++ b/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-markupsafe.inc
+
+BBCLASSEXTEND = "native"
-- 
2.14.1


