Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2DC78982
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:16:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d26so2018938pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mD1W1HIt7Q9/Pzh4BuPa6xf690RsET4bQM65MwEnHpE=;
	b=VbGubvdWZJF3gXLRac1UUGhjKmU0m+ZQJxZCin87d6ryfUXASySPQfEzv39Nt3i/1A
	Qubo8kbkZ96Pafk8u/GR3XKOJ3ophXjj7/HPJHyXhVKx93mecCtlVq0aiYx08AooUahI
	YCceLfvXlPkhkAUHLF9TQTFa4PENTdb2d5QLeMKIJzs4DmlrHU8D0KTKC0hH0zo01+re
	UzT7PlBBEkNF/W/d/WgWh+NNBnn2j9OFahvqChOZE0cKPf4PZPMV70qdSqyQUQCNYwxx
	p0deif8Wf1J0hnR727L/BUgFTx/NxZKAoawAyAftHBbYRQEBea10hj/Mp5tIQzpNaR1A
	OjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mD1W1HIt7Q9/Pzh4BuPa6xf690RsET4bQM65MwEnHpE=;
	b=nZwF/SPeoWTUlhEWVGhRlkAtqW2Dx85WIE1HfG2NqbPsMKYmv7vp1mFXZTmC6ZWP7x
	Re6C2Q72mVHQDAieNJFXlrCWl8CMVaopx78taQXPPtSrMxzQZbrwyGe074ep28gjxDKn
	OxRdPdkLxX5DII8nSdtFPGNE7XU0Jw73cR7YrU1xWAilu9YxyhtgvYWJyjdPvBOxzVrW
	fJRcP3XDHYgwa91Cat5SZALc/bqF5Zy6szKjlhZWdNIEgNjekC+1RSCd0aVUru2AZBja
	hhwaT90cHyx7OxiWCYWxKbPrsNgLzKhBjpf9X9yxNSakXmGwNYBcdvAyIVr3Z7Ov8NZz
	9Jwg==
X-Gm-Message-State: AElRT7F2tbwg+rNHcbLcFscXRsHviwjJfYjBze1WOBzH18mU48TVk7Rg
	sklGgUkp6wSWhE6vf5hBqLg=
X-Google-Smtp-Source: AG47ELt/Xbp+t3sqVSri2Yf6XfL06R+X6w9Sb6q4aE7wMDPa8yhvwgn1dVBoWO4+12KmLDJP8uhgVg==
X-Received: by 10.101.71.141 with SMTP id e13mr8700227pgs.317.1521641779601;
	Wed, 21 Mar 2018 07:16:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	v18sm8138907pgb.23.2018.03.21.07.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Mar 2018 07:16:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 07:16:14 -0700
Message-Id: <1521641775-2171-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
References: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/4] libxml++2: remove X11 distro check
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
X-List-Received-Date: Wed, 21 Mar 2018 14:16:18 -0000

looks like its not needed.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index c3d647c..a38315c 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -18,8 +18,6 @@ DEPENDS = "libxml2 glibmm"
 
 inherit distro_features_check autotools pkgconfig ptest
 
-REQUIRED_DISTRO_FEATURES = "x11"
-
 do_compile_ptest() {
   oe_runmake -C examples buildtest
 }
-- 
2.7.4


