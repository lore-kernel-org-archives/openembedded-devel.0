Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id C7C807FC46
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:13:46 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id t101so2929759pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2020 22:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9WY2xNNmk8NYNJeCudiuRnkH6hUHaIxhWhHDKwFPoZE=;
	b=UoeiHW6yqKKsGcslsKxQm7uAllArUfcrx5p+fu7ftom+2rr+90tbiBPUSQMps1VT4A
	RdjnYCDOTMYKsannGz9tC/NDDuCDRaVqj6bO+lWIeDcUryJGXhXMtXNsWDEOT7NQ/8Qg
	tHLRfKJCVSabi3HskKjzSjMg/Km5of5q8AGN+LBEuS4x4RL6AIyp63cQyt/nZb/JNFkT
	ruQ5A7hwCBOe/B+clEb310X2cHyrqWsGwnq4vUhLyl5X0n9w0rwAEFw8FwAHZqlRoN+5
	fJgXuwPgWS6PPv0BtCOm/1D1JAXJiBCYex0dkKyobN1HyXqTU741KvIoHWFOfeLWE6Q7
	hYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9WY2xNNmk8NYNJeCudiuRnkH6hUHaIxhWhHDKwFPoZE=;
	b=Mu8T3TlH57Hbf8gpMVWQeKtf8DuOpXv7bHxDVBbKM6hVttXFTeKMdHBY8wMACWD/o8
	6CzSqxhvi2/WSqcHHok7Fy9xs+YdarlAbu50Qgw8+8M7HjZfLFepIg7sZTQNN2vZrudh
	XC/QLWNF6P7NSMkvsWMQtur8Glf1aVgl36pT6wakHIQnZlwHLBDuEKku1rL9EHA8HTLg
	DMD3WAgX5EH3LRiod5cqQhi7090ne2DXJCxG3Z57JA4G5w6kVQxgktITXNAVd6aC/Gjo
	24uKpRw+35Z/L0+TRWt8iIpVNkVayh5Mj191w4WxBwgThIS9Vj6g+IKngs0UsquCRFoM
	VmHg==
X-Gm-Message-State: APjAAAXPwhVPTGG7YSCwfgNJTygHS5PG0cZ2OjOe9KAQ7jwvpLcDJt+a
	fhcRdkRivYlWOF6x0RwpAiOnabaS+8w=
X-Google-Smtp-Source: APXvYqyTnPMXdDtDf5uKHPhgKvnaeZ+2Rp8TIqiAfBc9hOLf8ShxzctVJGLnmju8M2dkZ1Im1rO7DQ==
X-Received: by 2002:a17:90a:b102:: with SMTP id
	z2mr17942588pjq.120.1577945627385; 
	Wed, 01 Jan 2020 22:13:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	e19sm9369149pjr.10.2020.01.01.22.13.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 22:13:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2020 22:13:30 -0800
Message-Id: <20200102061330.480482-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102061330.480482-1-raj.khem@gmail.com>
References: <20200102061330.480482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] rwmem: Upgrade to latest
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
X-List-Received-Date: Thu, 02 Jan 2020 06:13:46 -0000
Content-Transfer-Encoding: 8bit

gets gcc10 fixes for missing #include <stdexcept>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
index 5d81fdb4dd..065243ccfe 100644
--- a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3 python3-pybind11"
 
 PV .= "+git${SRCPV}"
 
-SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
+SRCREV_rwmem = "3ec3e421211b58e766651c2e3a3a21acf14a1906"
 SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
 
 SRCREV_FORMAT = "rwmem_inih"
-- 
2.24.1


