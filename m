Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id D63BF60CED
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:28 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id 12so3102753pjb.5
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2qbXqBZR09TCZyeFzEg2M7VbsA+U/gYS6m7WgYMsqZg=;
	b=RkAiADdjFYtOfUZGo0nxtHNQqbTHxYAdliT3lBXgviishpLdpOFTlE3GkC/TcBiomR
	EcbHH6O71nyaGJ1dY9LGgWmvrZ6SbO3IaRZGvCF43LY8mjFGJyG+tt3W1lktjYBKHIOG
	GN+Zzp+rYoSX/XhC/1Q2H+wpoPMb2M+EQ4D3SGNNz86JmUJ/Qw+xp6JWCYYRbNnegqPJ
	TzGucrJE7qs2Rsp4Czyz905XEYY8IYzbdMXBzkPduNy2x7k5OTCXjgv8H0UPTjjLijQj
	NjAh11MmBbiWC3/LlbupPo0UvjrkIcESRSk+NBTYA7dN8YtBP2P0StAoSrUPYRoQSAk1
	OiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2qbXqBZR09TCZyeFzEg2M7VbsA+U/gYS6m7WgYMsqZg=;
	b=ozetchosVVUjTILabOeeGqzqHXyIylkGDlY7YBIlgizLMRotgth6dWHiLkjkyFKy68
	XEWAPippDo1iDyUqEK5V76SsueUbpK9NLSXEJ3VEDR3w5ogpjm09X3h/loBR/oG7n81q
	rZsDPA2YShWkcqi0vd9Zjwlm6MThcffxVckyhqb0HhefQVTJyXhvLdvVf+EmwNWkewTI
	JS6cG5jUuGO2h4wKoNrWaMdcNx63niWt9yIo0DLRgx9MdQ1qAVdW0D/cNrzuHiHZQOPh
	kKhfYshX2M2pW4x9vGoO7Ft6H8x3AqjkthiiA7vijzNEuwtBZIW/+H/NsnEW/UJl1Qe2
	OQdw==
X-Gm-Message-State: APjAAAX5QnnnB4PI9HKCZsgg8fQf/pC1qmu5RAvPYC7i76c1DqKJRNI2
	UB5aNi6+9BZeBc8yFwQ33bqYRd/5
X-Google-Smtp-Source: APXvYqy5mbktLbPralHY78Ls4QJzmxdkhO8wZy+MU4cdqAmuC5poB8rgQgusD+FY8Pg9Qt72P/r5jg==
X-Received: by 2002:a17:902:aa96:: with SMTP id
	d22mr8622503plr.204.1581265049752; 
	Sun, 09 Feb 2020 08:17:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.28
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:14 -0800
Message-Id: <9abf13774ee370824445f122211aec2a56da5643.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 06/11] squid: Link with libatomic on riscv
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:28 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 626209aabb5684316eba0d4b762980924d783c93)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_4.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.6.bb b/meta-networking/recipes-daemons/squid/squid_4.6.bb
index ca4927dda1..dfd625b214 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.6.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.6.bb
@@ -40,6 +40,8 @@ inherit autotools pkgconfig useradd ptest perlnative
 
 LDFLAGS_append_mipsarch = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
+LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
-- 
2.17.1


