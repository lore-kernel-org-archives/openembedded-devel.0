Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id D79AC7C1E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 18:11:09 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id z9so290987pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 10:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+1rLQo3LX/W4EOLUeR6nhRso38p4N8lyMz2xbR4gYRE=;
	b=i4ap63SEGPQwO+yutgxQeFxW8meKKZRxfUmcRqXrguFdpb/sz0ap9YvE8U0irBqZqT
	C44XsTjs4+HiIbRRzMtH4PVBdTOP5b6HMJq5YYB4pTiC4DOC4xKcUvi99yemE5pCiibx
	Ed6GQKtPHMvyrvmkgQJQKslKkFxtYRA824vrvTYP1oNS4mEQ0bHTEr+/IRNUZEcqd+c3
	RHzR7ma3kPhD7kd/cl9HgS+F5kWOlMtgrXwwTK7y4+/aZ0hnwiYde1G/5K1Qyd3Ir6uM
	n/BvI5h/oaS+EA8OpkeoWtc9OwkjSgWvSavBbR700M1JpGfeq548Sd2CJx7E0RIihY/V
	e+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+1rLQo3LX/W4EOLUeR6nhRso38p4N8lyMz2xbR4gYRE=;
	b=kwKv8XBENsExk+ju55VNeL9MWqPCSm9WeBIxEeL0BGLqO/65Oyhj/hQzOe9l9n6IGW
	N5tAQZ9Oql6waV8ywOxwUlrM8/T6VxfKLwxsQ6yXwnmWU9Sdf5Q6/oXLxVUQPNc7FP+5
	VsmHWXX+cCv/uGWmGd4AIpSf6EOnh9Oq745sFV+azWF1HsZqnVHDRkHAtF+0FAJCZS11
	EUZB+GvakZ0Y61pf3+FNvNNAt1B8qD45rVZq8gE98tTzfF9y0cG85YaaZu0Ht0rLUi9h
	A4Ztm+J6CahiGsMlVwBumAQn64GbKGAlGsDSyDUk/hoQM9t6mhrPvniKoRhOB3sffpsA
	4jZA==
X-Gm-Message-State: AHQUAubIOkBJ54p8PotLDcGvEJqYJwh+x7d8XKh1RErUz33+9gGcSgmI
	uXk/Y2ZYPPR+OB2L0eq/aJupQYQl
X-Google-Smtp-Source: AHgI3Iav7nDCCO/7TvPHkZiuV0F3jOtPLhoP4IOM3sIUslBUGU9mKLoJ21jKXBf7uzV5eKPZMmeUoA==
X-Received: by 2002:a63:4d:: with SMTP id 74mr617056pga.248.1549303870496;
	Mon, 04 Feb 2019 10:11:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id b2sm991515pfm.3.2019.02.04.10.11.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 10:11:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:11:00 -0800
Message-Id: <20190204181101.22055-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204181101.22055-1-raj.khem@gmail.com>
References: <20190204181101.22055-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] breakpad: Drop SRCPV from PV
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
X-List-Received-Date: Mon, 04 Feb 2019 18:11:09 -0000
Content-Transfer-Encoding: 8bit

This causes errors like
OSError: [Errno 36] File name too long:

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 528c237564..5f9a72e0ac 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -13,9 +13,9 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-PE = "1"
+PE = "2"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-- 
2.20.1


