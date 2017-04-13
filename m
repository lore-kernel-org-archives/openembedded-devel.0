Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B260C77E7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:29 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a188so12673345pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nHqvy+lDBqBX4LzgTzCHmZKGlaa+2a682k0XCO72hlg=;
	b=r9R17tcqAkkM9X2XfWXhgqeyzM0/Val0Yzdxktn4eoj/3qHFQYbF0tcDKp/Zma/JMA
	zEb5q45tmVzXHPKm+C7wBj6g9Lo8ClrR+voBrgdUo/E3bmDpmH3gcMw0POVtHr6kpvZK
	t5XcmKPKepzmEL388Z9o+GiiS2hz1wx9ZwxymGxcAt01EoGsARbGs9tnjB8rV325jUC1
	t00LxMKitmril/1BJ/UVpMYXZLbH0DWPqnVbsTJMy+AsCPWWNrHDO6tECSUAZ1bLanW8
	IOo89TNVGKrmGqlT0O+nwveebtqqQabfCsv1iWYqZ5v9NLXktr+JP9rmxFNTU4Q/H3L4
	N7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nHqvy+lDBqBX4LzgTzCHmZKGlaa+2a682k0XCO72hlg=;
	b=cFlPVUcgEAygmnHY8Q+Aih2qBGIEjb3K8M5JFvCkl7hLK8NtywfpoVewgeubsUruFT
	9z9c/narAff87fNSxi0UPjmccughjUVfE80TJUxjhHZd9iuK9TAtH4uL5xhdAvCwXwoQ
	0qYwQKs9fzypA1P7iiB85jEVHV2N16KK9mgGDNEURXUGJA+fLpb1+FkYQK1yvwQJmVzV
	LBqMPzbBp6p0p+t3TeqB6Km6w19S2c2BkUvoLP6c2Aan6h84iHvGnRpNWhKnjYOYkul9
	yNtxH7veq8ki0yRzWYiZ3E5ylxOKG/+G08Nk0wnPHYAWxZireSMYEEkzf0d+BY09R30A
	LR0w==
X-Gm-Message-State: AN3rC/6QkZpDPobkzkrMl9H8Rfh1cK/9SgWmgE29YLYzRS18c+KyHmgX
	MEVjHf2ZhN3STRhl
X-Received: by 10.99.173.6 with SMTP id g6mr4315836pgf.75.1492116090789;
	Thu, 13 Apr 2017 13:41:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:46 -0700
Message-Id: <20170413204106.30679-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-networking][ 09/29] nftables: Upgrade to 0.7
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/nftables/{nftables_0.6.bb => nftables_0.7.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.6.bb => nftables_0.7.bb} (72%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.6.bb b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
similarity index 72%
rename from meta-networking/recipes-filter/nftables/nftables_0.6.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.7.bb
index 5dd93627a..3a3a94665 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
@@ -10,7 +10,9 @@ RRECOMMENDS_${PN} += "kernel-module-nf-tables \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://fix-to-generate-ntf.8.patch \
           "
-SRC_URI[md5sum] = "fd320e35fdf14b7be795492189b13dae"
-SRC_URI[sha256sum] = "dede62655f1c56f2bc9f9be12d103d930dcef6d5f9e0855854ad9c6f93cd6c2d"
+SRC_URI[md5sum] = "4c005e76a15a029afaba71d7db21d065"
+SRC_URI[sha256sum] = "fe639239d801ce5890397f6f4391c58a934bfc27d8b7d5ef922692de5ec4ed43"
+
+ASNEEDED = ""
 
 inherit autotools pkgconfig
-- 
2.12.2


