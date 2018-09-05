Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6D39179034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:42 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id k19-v6so4105476pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KTeJ6TG92gkE6Js9/tpr/MzUxYeRkZGp8XzW51NCYM4=;
	b=AoILfCzUiOFuYr2YQs0jq52s01wQPfmWS3He3AM5rx4s4DDMrr0SUfHG8mwxqHS5a2
	K1+NV9vKGuQAMHngY8Jqeiv1L6nEs1nyWH+h/2UR0ap+QdyK8e0xVdmN+WU/A75U2o7g
	PnTBsG1Y/FxXAg4OxWDAFAtqd6GcN+WylGB14HpSw8csFnuzMTDaHWAW8wRZxtYIUydN
	vFOm1QkiCNcCuGv6aBxSKfiuqI3hgpKUTcDUOu2CEjJ0bwZPNbyI+IS+7kUTp9wlFQD4
	bOWH1TDtpfFwDy7KlTDIwCT/4l4ruC9JLBInwE7ETixvDLRQiricydGjSS/3K+XLvshc
	5mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KTeJ6TG92gkE6Js9/tpr/MzUxYeRkZGp8XzW51NCYM4=;
	b=dvD+S6INw1LaJ6zo6OqdzvZzwhm17UNPaphh18amm1Rae06NTqOeBGcvYsQkA/DEJb
	ttvDMbfnGXXvroVDi7iV6fgi7p2S0pNbdsZ0NhGKXu0WLVV802DQkyhY253ZZbaNjUuZ
	sDyo2UgYEipumJFMK7i0uzB7gFdeE8nP3iWT7wSjH92jfGC1ekd7Lsl5twEv1P88noUJ
	dEWkQn8nPZPB302nAP3CFUmUqu8m5caz/RrA7lH8Wy5Uu20/1xsZBFZDgeZhrYitROB6
	91O9/iFrGEFyM2G7TIyq713yC4wYn6iopbB51gswY35JlSzHGaqcVKlioKnRImOj/JI6
	B50Q==
X-Gm-Message-State: APzg51DsyslYyKb7pieyZvLf2llNi2RZ+MDiiHrUQ9OuuyrOY74RvvaT
	qcgxIJlceBW+TjJkRgj8rsZ8fFfy
X-Google-Smtp-Source: ANB0VdbZNx3+3epl3Xp706so2TirDSHOIMN8C48IF4WiIxRamA/jrcHQst7CNxuIxWLd2mC86yO4iA==
X-Received: by 2002:a63:d70e:: with SMTP id
	d14-v6mr38858585pgg.110.1536181362476; 
	Wed, 05 Sep 2018 14:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:23 -0700
Message-Id: <20180905210224.21225-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/12] nopoll: Upgrade to 0.4.6.b400
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nopoll/{nopoll_0.4.2.b297.bb => nopoll_0.4.6.b400.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.2.b297.bb => nopoll_0.4.6.b400.bb} (84%)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
similarity index 84%
rename from meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
rename to meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
index 1d77891d47..8c57d29492 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
 DEPENDS = "openssl"
 SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "8c411cd0f3c0479aed28c4cf7b114fbb"
-SRC_URI[sha256sum] = "f5fbf8aaa16a77b0f265d8c847eb06cb3e68f2b1a50737466dae81181618654c"
+SRC_URI[md5sum] = "8d333f158b5d5a8975a6149e6ef8db63"
+SRC_URI[sha256sum] = "7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9"
 
 inherit autotools pkgconfig
 
-- 
2.18.0


