Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E16546B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2so8753758pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gr3vLW4ckZO1ydUSrWO/k0OcIzllSwpXYn+lzI4fs9w=;
	b=n1eexalr8Vj/VMvyaaj2SYxER+9oGlj2By1hm/s8RaIpd25khiN9X2k6NEvF3+Yqg1
	8iGR6zJYIHmfSekZ8+wQcdItmTr2OSJLNvCTu7EKnYw0n2DKzDE/FUih0oijBs/hWAOu
	Ex+aIGSjugSblROqbvxYRNRQj5ZzHoFiEd5PDe6GJjBKEXiwywl78tfIPU4VCgRz0wNM
	TLQkO5nvyHvHtUbxK5MjYuQCPu2KHLmf+tVaVgIx+yafvH19348rpXACipgGaO5DE+b8
	ZTxNuCfSskHM3mLPToew/uBPYZtRRMO4vFgmL1qbAcbCdMk9RYCFzzrobS9Gr8UER75v
	yWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gr3vLW4ckZO1ydUSrWO/k0OcIzllSwpXYn+lzI4fs9w=;
	b=sivU0ONymVYNM4F+aJSI9LtWM7qvqZZ4guXQX1/6V8oLXumUr+wH2YQovdeS2VNPQO
	iVB2Poz11+3BmxtDvd0+Zrw/xpx2A8iVkVRL+yACpH8RBRFmkuK/ES8B5CJbEmfO0hPX
	6z8Nk1K9cpTq1SD66qj7h8YpeMpZEGxC+SFQRomK1UKnzt3vN1QMns0RvdAuGgV5GICo
	U+OUsAaK9DEQJLP+lQH31msL6BwBnxVXDbSraAd1Qm2368spG/uVWBgFshdNk1IplCPG
	5zcGypOTme7lnJUZRApDXF9TxOeG4SIABzAXAoIX+5ojGUt265PF0OmHUXdkb41ZOXoB
	twGA==
X-Gm-Message-State: AA+aEWbWX47zF+h+GLCicZvaCrnk/aF4JcDVfsAcA/B35MYNWV3ZBktG
	jBS5IKJSIB+fSsPsJ/wNIARK4U1PH6o=
X-Google-Smtp-Source: AFSGD/UneC5HifgN4hVNW9uLxNXB4Pl5rauFOIQKdWNNfqACcyE2n/B9PWeEyyJ3AWIXM38+clIFQA==
X-Received: by 2002:a62:da5a:: with SMTP id w26mr18914430pfl.106.1545187886530;
	Tue, 18 Dec 2018 18:51:26 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:05 -0800
Message-Id: <20181219025109.19159-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219025109.19159-1-raj.khem@gmail.com>
References: <20181219025109.19159-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Ivan Maidanski <ivmai@mail.ru>
Subject: [meta-oe][PATCH 2/6] bdwgc: upgrade 7.6.8 -> 7.6.10
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
X-List-Received-Date: Wed, 19 Dec 2018 02:51:26 -0000
Content-Transfer-Encoding: 8bit

From: Ivan Maidanski <ivmai@mail.ru>

Highlights of this upgrade:
* Fix races, deadlocks, bugs in disclaim finalization and find-leak mode

See the following for detailed changes:
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.10

Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/bdwgc/{bdwgc_7.6.8.bb => bdwgc_7.6.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_7.6.8.bb => bdwgc_7.6.10.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb
index bb78971381..fdf3d6c16d 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.10.bb
@@ -21,7 +21,7 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
 
-SRCREV = "8b2a98209a59c92e1be318e4acda507d83175f4d"
+SRCREV = "cef9cbed83f2b5101d4e65ca0f158600d26cbd34"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_6 \
           "
 
-- 
2.20.1


