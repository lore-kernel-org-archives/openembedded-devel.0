Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C78FB6BC9A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 10:59:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b203-v6so1535273wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 02:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g0yFV4P0GMuyMHUWmxb+g8HZFvMi/emAvvnMG87l+XM=;
	b=ovhnIyHuSn5008aagMaLbgBaAhF6gquS8bjBDLa/CXVhr2/964CqIwJ88D3lqPqe7o
	Wlnq/zQkwlk439u50t7gZ0x4ijytnkWCadxOPsMORZKLprqWwB8Z8OwxtDl8Q/c4gY7o
	Vs/pwCYbX+mK9evecIhxbRabtFSwnVDxG3paKgcetAlYBHDgtToFZAuUUYsnewI/eQ3/
	HOnEUfc4yI+7GI9sQZ9gMXNSEMRaMfF/6oj6QAVsPaxKiCMGXydJFE8xPmKqHt7euO4F
	RN4DlK8E9ZAuNHCdQzIjuEOb2xKBIN7scziSYHR1vc6vMiGJQqBnKs1xndphVICRBfCd
	lmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g0yFV4P0GMuyMHUWmxb+g8HZFvMi/emAvvnMG87l+XM=;
	b=LGhKCJynlaBkB1c14swBGCNuOVeDq3o4xwGTa2gxChBQyPIfQyhxFo6fR1PpooShio
	OVtD6Ej9F0eFMN2lIrCgEcdlIPuZX7HBFunYIijqHqjOh+M2J1GsWu1Dtk8clN9h/C58
	C2ZadwBxmogczxet8fdZmzGtLVgaYkRYw2IsicN8ALc1rVPByT2WMaMc1MTb8RlGxu0O
	2gwCOirTAGCJhG4nL6Mn74xL2w8fNTRne0ZpsVwOn+79XfU9NLHmyH2+aJEmIdC7vI4k
	uBkf2DEn4KYRWO5m1gMfWyao0LqHMgE0Ue/iJU6ug5EaPBXxtCQYgZleCqCeA8Aicl/e
	3cmg==
X-Gm-Message-State: AGRZ1gLjKHLtFBB4/vyhpMjJ8yf9PrjIkje5qpbJp82u33Dhi/61Lrjh
	CbuWtMPKxeTOotFvmougTRroDtMD/qM=
X-Google-Smtp-Source: AJdET5fcXXxobCHOW/XsUBy+BI2UgAL2dlgPvHmtvho0wnI/ZPwHpASHWLwgpjCqE4tVHshdt5mW0w==
X-Received: by 2002:a1c:e355:: with SMTP id
	a82-v6mr4408184wmh.74.1541761151130; 
	Fri, 09 Nov 2018 02:59:11 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	g1-v6sm1459682wmg.2.2018.11.09.02.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 02:59:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri,  9 Nov 2018 11:59:06 +0100
Message-Id: <20181109105906.20755-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libgpiod: bump version to v1.2
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
X-List-Received-Date: Fri, 09 Nov 2018 10:59:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../libgpiod/{libgpiod_1.1.1.bb => libgpiod_1.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.1.1.bb => libgpiod_1.2.bb} (78%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
similarity index 78%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
index 9d3d759fe..30289b983 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "e5e946cb01a35e5046a1a7a108d6a96d"
-SRC_URI[sha256sum] = "172fa1544ecb51f37533b3e67862298d50c0a5cc84975f3c0706dc15467f0dfd"
+SRC_URI[md5sum] = "34a9972f2f4e9c32fa940301301b007d"
+SRC_URI[sha256sum] = "b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba5844b5ba"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-- 
2.19.1


