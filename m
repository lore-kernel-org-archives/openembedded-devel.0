Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 13A3878931
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:31 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 68so6652123pfx.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S6gCvMPejpWHuR6sb/Q3XW8XQx38xw6MEgTX6BXvC3Q=;
	b=KtbPN3k119zO7MLoYSl62xBoNvSBB8T9DPd/TIeFOSecSxFaciYSvWZ1A4O6EPjzGa
	/OyeWtXE4L16v/hACxZSnIt1yZMkZPhsL3xK4+zq8eC2NoXlu/TZdo+vc8W6zbqAHiMK
	NGfaa2Q9dpZuvkMLSipTZqlT61/k5LbZdACTa3/2zMBc/mIh64juQjrLhvnfDBZHLAyy
	+ystUy/Xm3zNbjuPLncPXIFkbCN1mvQCF4jwc5XhoJj3YtlrTY+0AXvhP5jd6pKiacr1
	YVYqkMrse8Ssmsq9L+pPMOfw4t+tauxiUa6WvOQrlRmXbRWDdeparDBJewiouAfKJY21
	HRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S6gCvMPejpWHuR6sb/Q3XW8XQx38xw6MEgTX6BXvC3Q=;
	b=j4+OTrcneQmL+hkXY8rWbs7I5g54UkzlGETjNfqArwrAQZUU4DnkQpiZxtNagqDGFD
	6LBLfsmQnGwdUWbiCBTusT2ufhhsZRtxqpG65tUOkoOSHYj0D547gHxUSwYiJQarvWsh
	SzBbfRldV9jUHpXWAFV08cr01/odCaC6AdMAc4G4eBC++Jrof4Nlm7njZBzTQo+Z1QnT
	Ws3TfXRrwtdmD3ZApombtbdDO3BfhuY0G7wSOil/yJfiGFQwo6Ml7qjhiKZziqSQ25O/
	UHI9hahh5zs+RJxS65QonBwx+WPidJtzbL/Oq3bWLuTEJgmPcFu2pMhTLW6I2GUSIcN0
	UAUw==
X-Gm-Message-State: AElRT7Fu5zKRMBILsJMLUB95FDj7hr3t6gv/dJ4d0NcaTDQGw/RwD4X5
	hlElwH0uM6ZWNFDrc7KN5vUJAg==
X-Google-Smtp-Source: AG47ELvyE23eKoNd8d9hJWnDPecvyPTEGD1GfUfJsCJK8EIPERE+tQoTRIYNE3wgxtAiuRJAbLUGQQ==
X-Received: by 10.98.246.16 with SMTP id x16mr9188008pfh.81.1521439411738;
	Sun, 18 Mar 2018 23:03:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:57 -0700
Message-Id: <20180319060300.5366-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/18] libmicrohttpd: Add -D_REENTRANT to CFLAGS
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:32 -0000

GCC fails to add it with -pthread on some arches e.g. risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
index ee399a764..0930a277b 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada8
 
 inherit autotools lib_package pkgconfig gettext
 
+CFLAGS += "-pthread -D_REENTRANT"
+
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
 
 PACKAGECONFIG ?= "curl"
-- 
2.16.2


