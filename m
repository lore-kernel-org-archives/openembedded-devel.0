Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD09A7F899
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:54:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z19so2090341wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JwPFh0R2sGLWB84ZzUB0e0gexbiHVduGEWhHoVFXZx0=;
	b=QVZ1h83ohLOekXWUksfhJ1nuEMK74OPFC0focSJSOPPGhAYBgDKJZj2MEMVsVDhZM5
	qAVcuB769Xwnde9yDtNYsMewlgatpIoZonAr8J8ke4x7LZPgMOXufFKDzXDhgU4ZCi5Y
	SWpUQMwenpcLV3Z1ClxrTIPEBhc8UrUUU9TXRR4qZQ0bhhBIs45ztbw2hLDSZn1PYDVb
	lM8JbvRNfEZUH+YKlywxxHTaWvzZp5qeRJqf0WJRFp5R5XRkBDEWBIip3u266JNV1X4y
	/OrgGmm37gvCkcqfyPZLtS8F6Xy47cVrxet8kH/IlyWOhHj4+5fp6TClx9AA64vX5kOz
	802g==
X-Gm-Message-State: APjAAAWkyoV0Wsdfm6Nl/sNON123uyR1nqwex1JVTzo/rRHVK39Zy6iJ
	09/THB0RB994GANNpFlSELzAj46a
X-Google-Smtp-Source: APXvYqzjlb5doYPFgWkAbVo3i4xSpXvQCnUDyvVHRvuprrv7vg0tG/SMEdpVZnsO2y1T3FZw+y4+hw==
X-Received: by 2002:a1c:106:: with SMTP id 6mr2418352wmb.33.1573127689302;
	Thu, 07 Nov 2019 03:54:49 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g133sm1742995wme.42.2019.11.07.03.54.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:54:48 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:54:47 +0000
Message-Id: <20191107115447.1750-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107114503.1145-1-git@andred.net>
References: <20191107114503.1145-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] nodejs: allow use of system nghttp2
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
X-List-Received-Date: Thu, 07 Nov 2019 11:54:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can't enable this by default, though, as nghttp2 is
in the meta-networking layer, which might not be enabled.

At least this gives people a simple way to do so if
they want.

Signed-off-by: André Draszik <git@andred.net>

---
Note that this commit depends on the nghttp2 updates
being merged to meta-networking first.

v2:
keep PACKAGECONFIG[] in alphabetical order...
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 4afe341f9..4013c6931 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG ??= "ares icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
+PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-- 
2.23.0.rc1


