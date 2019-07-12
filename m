Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4437E5F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 06:20:10 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id k21so8163415edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lN6YsJM9bhcSUkEn39qSojOcFCAFpII9EipkO27ii9o=;
	b=OkPnUdGKo2l1NhW4hGdGSxvKG6tSfJAsTkXGN1tRnPqbviFfhjiOgyKPCBqQtHEhq3
	Ry/erGXubdHMWociOzp3CLJaHFvYjHHl9hHWeoTzy29sfuEUXe3O1R2qPsdppbhU7vOF
	Fy6hJruG5HfZ3x+3IZiQmbQ+iEP6c0Rr02X3AF1DSoqc5W+288XfM6uLDBHR/zgESZ/C
	UYZy+y4Ef43sLpeC10Vnqaf747NfTBsPF8hypn3gutDL/VusAbjCIqs55mpQpuKJvPy4
	RkzeQwkZUodfgnQdJntTQYoC5P0hv09oNDuXISWUgbRos6ST27f5CufCJ8ta95ZNVl+t
	vZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lN6YsJM9bhcSUkEn39qSojOcFCAFpII9EipkO27ii9o=;
	b=kx0x0EuDx/q7jZcDgGsi0T35bJTxiAijYl7vPU+Pzm7binPc7D5XKHoH/Ph83/NFZx
	80K0Evnw15ryquYgXUGQdx2D+V2ODTi0GQZJ/Shlr545NgLHLK2//u4kCjCmLQurJGop
	hVrCR6DeNauTHu/F3CE9VFYylOxpQZJjUd0hU02fLbeoQQsveM4iu6z6nFLhgPaQlrPI
	WWVWMiqNz4+Vjne3lhZFmybhlGyx3TEv0R67uCT/T0jek/hrQiQjcUKdxx9YOhXVkP4Z
	BbZzSws4yPCUVOAOgXRKus5p2pUD7rdp1jPzzUknpSo2D+q4TvrOQWfW5pAJLFq1uXoX
	DpQA==
X-Gm-Message-State: APjAAAV8IpER6sBYqb/8VUgKzInWznQsm/gVc9Daki3Al0jbpEWeXb0s
	6BrHZTxpni4cB/EAACt9eu66RhBM
X-Google-Smtp-Source: APXvYqwmJWTZw5Jv6goBx+mnM3rhfzfQ4i/CydOMSY/aLl00rj6k6QMZgzBaesPvrA7MI71qiOcfvQ==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr7545879edn.216.1562912411025; 
	Thu, 11 Jul 2019 23:20:11 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id l35sm2210457edc.2.2019.07.11.23.20.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 23:20:10 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 08:19:54 +0200
Message-Id: <20190712061954.7749-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH v3] Fix python-humanfriendly recipe for python2.
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
X-List-Received-Date: Fri, 12 Jul 2019 06:20:10 -0000

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 .../recipes-devtools/python/python-humanfriendly_4.18.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
index 2ca5fe36f..4e03a654c 100644
--- a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -1,2 +1,2 @@
-inherit setuptools3
+inherit setuptools
 require python-humanfriendly.inc
-- 
2.17.1


