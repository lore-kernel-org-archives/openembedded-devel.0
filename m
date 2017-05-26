Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B5FC678246
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 14:45:40 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n23so13628348pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/HyZfR05RZyKWvPnSvqceFJTvkGd8Fhze8TRdKk1dR4=;
	b=YeA0ycbVbVFvcZ7ueuOPquA4xBwGPjfH56/Em8Nr5qUI6g1bbDSAqXqxf+4bk0mKmZ
	iHWi9egV/THM8cjs3Bag+sJy4WHa/6ViLbTpv6RzfqLK3cuFa7K0t7MsH2aiKEA7U0J9
	j0esr0lmYUU3NBJLJwi4eWmJRZ+KjdeAfFJ3sXYO0RJ01o/GgoEInzJzIEdGDVBN0vD4
	KQIW3N1BxVzazcmAB3Y57OmDbPxGqIysiuvNdDKPhrkIbZqzSGiPjQdbM740Hau9LrdD
	KmgFomiohHIXb1YeWpvIH9cyIExA7pY9eNvLxdBWFUGYOmZRVDXsntPxejwFIhHT3Mnb
	0YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/HyZfR05RZyKWvPnSvqceFJTvkGd8Fhze8TRdKk1dR4=;
	b=BrSgAU6RaDdR1jdjBfxBn2llaFUvFOsl00F8gfpdnvxL36+aQ9roePLj9NzK/aMDPg
	Y72aamF6JkxQWk8tu50fnDsghw5HFAkEjvFV46C/oSy94+i7b14vYH1ithUvAw7n/GOJ
	MOpswNubZuYRm3x2nlALUhp/+tu3cE6cNZMcACwqXf42pvytHl/QO6a9FUgfqpnxydT9
	v7asYvg+xt4Rm23E7DAM/cVqMYbpMIFyL9bd1Z9YFwlzOphrBn+RcSmxxvDaykL+Efa/
	FYexPGrscprRzD/5tPw6PV1JfHAjSM1DxsEaZY0vz0Oi7CAC2wSCFQaqNlSZ7WtCzGyq
	150w==
X-Gm-Message-State: AODbwcA2WesM5eo10G1WJ0y79GBAZY8xf3/YIEy+vYPU1wTiU4eNQZBT
	zaoRG6U3I6MWNZOL
X-Received: by 10.99.97.68 with SMTP id v65mr2928542pgb.76.1495809941516;
	Fri, 26 May 2017 07:45:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	y78sm2399183pfd.32.2017.05.26.07.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 07:45:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 May 2017 07:45:30 -0700
Message-Id: <20170526144530.7471-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170526144530.7471-1-raj.khem@gmail.com>
References: <20170526144530.7471-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] nopoll: Disable doc generation
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
X-List-Received-Date: Fri, 26 May 2017 14:45:40 -0000

This also fixes installed-vs-shipped build QA errors like
ERROR: nopoll-0.4.2.b297-r0 do_package: QA Issue: nopoll: Files/directories were installed but not shipped in any package:
  /usr/bin

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
index 611374cab..1d77891d4 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
@@ -18,4 +18,6 @@ SRC_URI[sha256sum] = "f5fbf8aaa16a77b0f265d8c847eb06cb3e68f2b1a50737466dae811816
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF += "--disable-nopoll-doc"
+
 LDFLAGS += "-lpthread"
-- 
2.13.0


