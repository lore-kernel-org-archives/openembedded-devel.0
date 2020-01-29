Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 79B5B7FACA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2020 00:42:33 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k29so5031970pfp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 16:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xy7ZAOmVj8CPxmZL3jp9HgiDyL9+0wp1txiQsDxsJ8c=;
	b=D47Ge0tyzgB0z63Uu/eiHbvAHQczDAhC38c6zKgTPVIQ7AibVWOY7592qr1EfYxbTb
	5aMV2h6W66sRwuSvxD1fPgDk/BHIHvSilP7/bg+PlETAA8tx0SlcAVTVbUvcqTeqAJqf
	FtDCCvtBc3IMSxzP4QnwbIQwwo80SJ9m7WXZZvj+Xww6D7DGqwVOa/+jW/7aE1kxr5AE
	udPxLePLON/8qQGml+4bbpdRaHydL+YZbhvPBg6KSwmxM9gYUBDDgBow4BCjDqIJec1C
	05xqJ2CWDDHSsNU6LOtzp+QBvSvL7cCK6doEfoe9EQ1I69jWUOuhrZI0foWVUqqmxttt
	wmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xy7ZAOmVj8CPxmZL3jp9HgiDyL9+0wp1txiQsDxsJ8c=;
	b=EvxxKu8E/yc9htfQBrorFk5USbut3dZGcuaSxuh5eWaz4ZDGwZZss0KcGoyMTyD40o
	d5XekhQqWce7Co9t1TjwKNXTH3PPj4x34c4o2mGk7r6F1rzDyBW+mJr2F4t+/DWi1zzD
	pfHNg2UK36N5IflWQHzLy4xUgR/EIFK353oZNV8HVefJZ75Pt6s/y2BDlXDnBPjiGKO6
	ZjnXy2WB11rDk8IuORwUsotkIf6MdinG/14Avi+S+6fo4F2pRT2/oB9NTArR8NovatJf
	Wq9vQUaYaf/Xgg1kanNaXJl+eOhNFVVyqakcnL/vgnGnvYWn83aSKGOcvNehW+exIQcf
	fULw==
X-Gm-Message-State: APjAAAWMXvP5veHiq/MjBWGEkhStZAIs0IIPm9c/qH48Zabki26rJ/Kh
	euqO1WCr3MKn6jmF42xb0woZujnA2io=
X-Google-Smtp-Source: APXvYqxDEV1TfkkczOMLVESOKDZ1BqNmWN+x3PjzxV5rZteKAZQl1rCG9CK5bZMhK2CSBIdahBbPEA==
X-Received: by 2002:a63:2d44:: with SMTP id t65mr29473452pgt.112.1580258553872;
	Tue, 28 Jan 2020 16:42:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id b21sm238793pfp.0.2020.01.28.16.42.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 16:42:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 16:42:35 -0800
Message-Id: <20200129004235.3805982-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fluentbit: Link with libatomic on riscv
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
X-List-Received-Date: Wed, 29 Jan 2020 00:42:33 -0000
Content-Transfer-Encoding: 8bit

jemalloc uses libatomic functions

Fixes
../lib/libjemalloc_pic.a(extent_dss.pic.o): in function `extent_dss_extend
ing_start':
| /usr/src/debug/fluentbit/1.3.5-r0/fluent-bit-1.3.5/lib/jemalloc-5.2.1/src/extent_dss.c:75: undefined reference to `__atomic_compare
_exchange_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index d8cb8b5e85..06895a03aa 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -43,6 +43,8 @@ EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
 
 EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','',d)}"
 
+EXTRA_OECMAKE_append_riscv64 = " -DFLB_DEPS='atomic'"
+
 # Kafka Output plugin (disabled by default): note that when
 # enabling Kafka output plugin, the backend library librdkafka
 # requires 'openssl' as a dependency.
-- 
2.25.0


