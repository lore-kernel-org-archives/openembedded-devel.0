Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 21DA274DD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:40 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id c22-v6so5433747pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ArYWM6Zk7Lzg4L0OjWZ1Tq6wfCT9rE5M4QVfTW1zVQo=;
	b=lfgLncEzwjKPn0kGZMlZYjrtHzq8QfQsCWps2Q9ZtUStGClaWBL9MaHNKGCGcfeLTb
	hYtZ2hI6Q+4IX9Req8zN7LJSQzgRn+ueahLlgzGkwmvCW9dreype5Qk/4/hwR/nbVuVs
	NnQcOoLrsu4pNMYoP7z0xp0A0gwZMtiaW49mgcmy0Uv4ktUK0II6jRKSWmJTWWU2oklf
	8I5+DUUsesvlCpJYLtm9biI9BXHyxcWLLNFDHFUJkBS0l6Ok2Tv4MIoGVhBU0/Y76bXs
	dWbmsR3+tRa6R4u+OsqHo4gL7XgZC90oztNCuHEbYs208Em/IrszLqbvProcwhaLuDOt
	uGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ArYWM6Zk7Lzg4L0OjWZ1Tq6wfCT9rE5M4QVfTW1zVQo=;
	b=VL3grxSHXPV4u74UnsDvP26hQ4cwymdRLjRBEHDskdblFamAVex/qkS10m88Nru7yf
	QqKg9tK20+FiumpXy9Uaf4mr1DBlCtq50wJb1ZPXaAjf87kOc4zi0fLuWx8leW2MpZ17
	U3eZrYYoNL9niQTADrc1oiMl7igTIJcMZYIP3SL+K2D78N4ImlEtRugqhC9KqRotQRvW
	rLmBkQH9jP8zJImt0GMTXVOiNTNeJpsD1J3Q4rZnyHIPEeoUY4kgEqP+ScATeLfS3HI+
	NwajmPBNGlQrJGaIWY5zI5hf7Pg6KrydTX5wib7bcgO6eKv7rM6/mWxfbsGPN1/kUWE0
	38RQ==
X-Gm-Message-State: APt69E3eF5kU8hq+4dOvAlfF1lNd+/7ztGj99xWCyGZJCHPiPFxi7xWE
	RIFRnQUyilKzc2ZagjMx5KsoSA==
X-Google-Smtp-Source: ADUXVKK3YpKtfbi8n/iVF59nxKUEhjbjW4VM+0wm41pK7RIXkhsLHovR4trA2DboxaRXTHfW+D8UHQ==
X-Received: by 2002:a62:c918:: with SMTP id
	k24-v6mr10139001pfg.160.1529867981791; 
	Sun, 24 Jun 2018 12:19:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:37 -0700
Message-Id: <20180624191845.31082-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/20] geoip-perl: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:41 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index ed5c3a9799..bd37ce5005 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -9,6 +9,8 @@ SECTION = "libdevel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
 
+UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoip-api-perl/tags"
+
 S = "${WORKDIR}/git"
 SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
 SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \
-- 
2.18.0


