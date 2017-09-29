Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 29DE26612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:53:29 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id z14so321484qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=28sWRV0Umd5x0aL6zuQ+iR8mAvDr5QaV46s3nMCR9Y4=;
	b=gliFKkdp0VGfChin+frPyLs4QD1XJsvqCxAxxo77ETOeeVnz3GoIvOCtQt/UNpotqA
	4q13MvmVo5lK6yoBE8LLMOFIoPEe6UG29v8IWPQugL4PN45f2vokROQ0EufriEHBCVW8
	SIb1ynRwlyKXl0gfk6zgadE2Qpq0cGXFQC3NO6LA07P5XRr+EvS0K8DW/+vxkA/KBl46
	zcWnYCOogsanSW+Ir+d5PWbCLTXc0WXqBuQtFfBj3SX3TWgRNdOiahOBjZA/OTtWXawy
	OV1Bk3tUIBpp2+QUqs7hXlhE3oiBjWJAFj8e3ijLllajBHtWzvso41vEVX4kUxV6/Hsw
	7cuw==
X-Gm-Message-State: AMCzsaWaT9poJcmY84UjMcVJu6tNdoYkKFFHLIgHahmchnL5/ATjCW3Z
	+t3LVeUu2gVbCLPUARMWfRKzKYfw
X-Google-Smtp-Source: AOwi7QD4uZKHLjfueQoe3toWAl/AO9Mb95t+ny/vpGH1+k0e2Fg2dB7ZgLHKptnijg7qeKa52hzJYg==
X-Received: by 10.55.96.199 with SMTP id u190mr4681961qkb.197.1506711210736;
	Fri, 29 Sep 2017 11:53:30 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id t2sm3040176qkd.16.2017.09.29.11.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 11:53:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Sep 2017 14:53:20 -0400
Message-Id: <1506711200-22626-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] libauthen-radius-perl: move recipe to meta-networking
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
X-List-Received-Date: Fri, 29 Sep 2017 18:53:30 -0000

Recipe depends on radius which is located in meta-networking

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/perl}/libauthen/libauthen-radius-perl/run-ptest      | 0
 .../perl}/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch  | 0
 .../recipes-devtools/perl}/libauthen/libauthen-radius-perl_0.22.bb        | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-perl/recipes-perl => meta-networking/recipes-devtools/perl}/libauthen/libauthen-radius-perl/run-ptest (100%)
 rename {meta-perl/recipes-perl => meta-networking/recipes-devtools/perl}/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch (100%)
 rename {meta-perl/recipes-perl => meta-networking/recipes-devtools/perl}/libauthen/libauthen-radius-perl_0.22.bb (100%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest b/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest
similarity index 100%
rename from meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
rename to meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch b/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
similarity index 100%
rename from meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
rename to meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb
similarity index 100%
rename from meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
rename to meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb
-- 
2.7.4


