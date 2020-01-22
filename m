Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id C017D7FFED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:46 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k25so2479886pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FBSdfoZSPxhMj+nrq6b9h2M6WfhCvi+DBgCbHc1NHMM=;
	b=XtGU1tjXIaCO+mKaCRCk3bogQcl1lvGxD5/Bn7VYaoI6PAlgjKcYo0GgoewOxtb1Sd
	dRHMvkeHMdAEOY4vpQebqzBamKUDcC0UZfWOfYB3/iH3MiCneEm30XXQRq2dgHo0jahA
	ZLeKBsyKexvVOhlO9mUdBE90HQHIu/q3MZrXd/dIULhSRKI02tdL4Cq2mgv3OCc/ICqU
	BvXs1V/+YEhPF4I+Ny5kKgY3dvvRc15xIKtzdbueBmZt3ks6tR+DFyxgqUhFq5J2rgge
	B1hS5F70bn8V3dekCCN7WevknHKN6FkaqN2nwa+6yiP9+WUv50PB+DE2N02YtgPPE1G5
	fUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FBSdfoZSPxhMj+nrq6b9h2M6WfhCvi+DBgCbHc1NHMM=;
	b=QwWww/GP1IduNvAUzNnDpayZZzv2rehCQsXELAsbUsiTFPA9rRCy6VfXNYLpGZGo5B
	4MdGUSPjchvqkbGIEZkMgH+NGx+QFxBuu3mtNFiWbwqbOhgiOXRpIeakmTpaxZOE6lVB
	z3rphcLcP1KmocTVl4+VSQpNzCIvDpl8D+ns6B9y0VMFeI3cRTc3853DV3GbDkFc5pPX
	0mOmIQvvjdqxhJq+dvOX/On99NE/97vQ1fCIIwRS1PNVSfNV7R7T9JLplff6SdBspTqf
	D7BUDMRxic1UxpwYI8ZAQQjnVOzPLI7mJZQ7VFcKx0VDNI4vbjdTaOrssNkn6KlO+1Uh
	0U/Q==
X-Gm-Message-State: APjAAAWrqeaW+pl+zdF8Ah+fREkaN/Bh5Wy3xsVRNNPPf/PcFRYFdePY
	fVxHAqQGrFLV7Rn62q2sUWwzv+vbWt8=
X-Google-Smtp-Source: APXvYqyvoD+cZZpi6RQZCwulFzJtNtCV50czXoIAAPVhKS4sxmpRwURLyTtqmeEn+C/m22jPpb9yAQ==
X-Received: by 2002:a62:f207:: with SMTP id m7mr224368pfh.223.1579654787499;
	Tue, 21 Jan 2020 16:59:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:40 -0800
Message-Id: <20200122005941.3706171-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/7] python3-pygobject: Install pkgconfig files
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:46 -0000
Content-Transfer-Encoding: 8bit

py2 version is gone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
index b016df7198..f1c46c9319 100644
--- a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
@@ -31,8 +31,3 @@ EXTRA_OEMESON_append = " -Dpython=python3"
 BBCLASSEXTEND = "native"
 RDEPENDS_${PN} = "python-pkgutil"
 RDEPENDS_${PN}_class-native = ""
-
-do_install_append() {
-    # Remove files that clash with python3-pygobject; their content is same
-    rm -r ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig
-}
-- 
2.25.0


