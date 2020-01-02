Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 71F217F9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 11:00:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so5255591wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f7YJCJm16xyYzs7CgHPOh3gVnMmGxV2mrW/Z7kNNiNM=;
	b=lzxJ/RX9GzQs+4E9w83bl7O3RajzlxP4mBouab/nsW7/lNbpSbjAmLdIno0LB2g+Oh
	6zgVyMNNfVRK6ZwUcgjANoZAI9g8wzT5ATys3kc4dcHafOA4kqGdomTeolk0iv6ksHJB
	7BK80Ihmt6dF8m/55ZHTUEB9W+bsFJ+t/cDU1zasH/YbL7WBRphDJQg+RzHW5m8dZ/Ws
	wbGwYQzWiYfGCIjNyGz6uRskv10fupNOghUNPDvSiR03YIJqaRvfXAQi6SO90FaJADD2
	lwc2p4e18XibVyK0z58qAYnqmsQ/2Gbt5OiF3QAXJCajqlBjRCTMTzw/r/3WqNvnqueb
	14og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f7YJCJm16xyYzs7CgHPOh3gVnMmGxV2mrW/Z7kNNiNM=;
	b=RD7F7ZN9GCjAHaAECtFnWFptoPsGRA03dvYkSpdlwIj+P7Ul3PNXu4SqGfMfs5lQz3
	N2E+1/zJ8qKLsnq3XTTF3s1uJU03JRKLI5BVPN0wv9utXoSOQrmCitFFs0+vj4iANoHx
	xx5FPqHPq/oFUotieHZLfPDrh/kAqftoM9Rs2cFZBTayByfA5M8/4lfTy4FaDr9vanHZ
	9b/DdCwRi7HT/tHhxb7m9UEG+b/2aNebUGVHRrV0R4dkREl2GKQFik5Q1mwtPulob/qL
	RjI5/llX0Lw/nCd0zl+YKcLOfId7DB5pO1EHRx96hmPhdzHleRkmQLSmaPesyT4z6F/d
	PoGg==
X-Gm-Message-State: APjAAAVLgcCDk0B3ctfDhB2wC+pNf6lm1seoywttCLmjau9eEMmOolQl
	g/n1TqodRFE+PjkAtGiI+gt4/ZNSmwI=
X-Google-Smtp-Source: APXvYqy1Ro/BnXIaGK/LTB0neb4XLTWc8U6cmPrh+9JFKjZK0S2muYw98muGA/LPbqSc0DVHy8lgug==
X-Received: by 2002:a05:600c:1007:: with SMTP id
	c7mr14658217wmc.158.1577962849455; 
	Thu, 02 Jan 2020 03:00:49 -0800 (PST)
Received: from localhost.localdomain
	(lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
	by smtp.gmail.com with ESMTPSA id
	q3sm57579765wrn.33.2020.01.02.03.00.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 03:00:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 12:00:41 +0100
Message-Id: <20200102110041.28531-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200102110041.28531-1-brgl@bgdev.pl>
References: <20200102110041.28531-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 2/2] libsigrokdecode: upgrade v0.5.2 -> v0.5.3
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
X-List-Received-Date: Thu, 02 Jan 2020 11:00:49 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Update libsigrokdecode to the newest release.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../{libsigrokdecode_0.5.2.bb => libsigrokdecode_0.5.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/sigrok/{libsigrokdecode_0.5.2.bb => libsigrokdecode_0.5.3.bb} (74%)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
similarity index 74%
rename from meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
rename to meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
index b8e1e4705..f9c1d1a3a 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
@@ -10,5 +10,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b9033bc7e68bc17fffffd4fdd793f5a1"
-SRC_URI[sha256sum] = "e08d9e797c54eccf3144da631b6e5f1498ac531e51520428df537a1da82583f0"
+SRC_URI[md5sum] = "7ba4ed4ef1f06ae96979751e096c2821"
+SRC_URI[sha256sum] = "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
-- 
2.19.1


