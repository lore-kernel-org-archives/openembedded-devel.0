Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C069610E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:19:20 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o21so1216010pjs.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HpgJWVy/gnuL6HzsbdP4BYpjKpZTm3V4+9Askd10QZ8=;
	b=WZTzUnLKi1Ddeiu+BvUOansf7CxnFYD1RbLxtrrGTlp4wZHGSYiP8kkLsirqncgGdU
	IpjTbQqWhCtrAoeW9N/DSW2OJUGVHHntCE1bFIpDoMzu59Lyxn2RhVV/LUhUhjiIrK72
	+7aj2ss28lOxDIemzbf24jRQPZBtd1YiEyyA5IXILUitYdvarVOsU+R4rawNjaDc8sqj
	BziZ3TvtE4fUZhhoFlFBvWwlkLRpxU6rdTmMPVYC6SX1aPWDS/CF7bMSAYefAcW1GiEu
	m6FYn1tF2PkJB7BNbe05dtxvL/Kpq7B6/pqUlrfQx9vs9cyXkwengYmElW8KRBne85YR
	28cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HpgJWVy/gnuL6HzsbdP4BYpjKpZTm3V4+9Askd10QZ8=;
	b=CvPTDdTbo9CDZgSy6Pxe3muuCH57SfH7to/lrP6hiVjQDBKeXTJTrrsmy1489k85WL
	2XrPOlddHoEYPIWagqcd4750ybdqdXrTTGe3LRpanDI9FoBTV4LRztyQdxrKblRw1gGZ
	tOIuxNcTisCGgSbuW5tIlTGvgxPo4JyGMQnV6CmNGWdCUtxxMrujQfpMuRVF85ZPukKk
	YslQXFwaTvxYZKrDhTCtWv8vJsPYU3QRmEopAnAbalrV6fy+OZVPYnmvTYQf/PGsMIpI
	GwV8cnldwYDpMG8YA3g6Ub4JvVKA0CzB2bk1kSNDF0BrQx7EcABfyGPwHScbVckHjD2X
	lDwQ==
X-Gm-Message-State: ANhLgQ2GCTuvM+sV5LlkPWbkuE/yv1aVsZOWcwy1lF1jNmgMTWZ0Qolh
	b2dXXNHVdxwgrwdUqB4UYIF9qE9AwFU=
X-Google-Smtp-Source: ADFU+vvviD+FynuQnlCpB+ybxZ3fqEZajbflLCAxiw2DwZ78qy5/qXKM3PPJPFEKaJAlYgD8taHKqA==
X-Received: by 2002:a17:902:ed12:: with SMTP id
	b18mr3967854pld.45.1583342361236; 
	Wed, 04 Mar 2020 09:19:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8ce3])
	by smtp.gmail.com with ESMTPSA id
	g10sm29343645pfo.166.2020.03.04.09.19.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 09:19:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:19:27 -0800
Message-Id: <20200304171927.2068660-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304171927.2068660-1-raj.khem@gmail.com>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 5/5] x265: Disable assembly on x86
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
X-List-Received-Date: Wed, 04 Mar 2020 17:19:20 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: x265: ELF binary /usr/lib/libx265.so.179 has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index 21ae596e05..8c34526cc3 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b5
 
 inherit lib_package pkgconfig cmake
 
+EXTRA_OECMAKE_append_x86 = " -DENABLE_ASSEMBLY=OFF"
+
 AS[unexport] = "1"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.25.1


