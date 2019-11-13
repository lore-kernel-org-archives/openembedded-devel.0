Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 607CE7F369
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:09:57 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id p20so2289762qtq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=zsIXwle7EnRZjO1Hsw9OtFNeu8JCaREbfrS9N+hcPFs=;
	b=jvKaoAhCzfnodgVcHWyg+9mW9IqBXMDemD/+xnXpA9vCbJMasUHadm1wE9qWsieNrN
	P8+oZerCHt9vbxSPZfBuiX6Y3pKTPbE1f2PS8hq2c3A4BSyJpWtxN/3BwvtmmhTYSyp1
	SMcdyddrH6wBdT1jSo5awfY6GEOhFY0Y+z5cj02qL3zh+sXMdA5xPjHjsxcbjg4nPdtR
	zIU6UkkoKpHRnfyed9QRNaLSW8cv6fic0C6B3clnwGO+LSqbilkO7vNK2u7YzeMglYtL
	fB8U/EKgYL/hhErcJ5+/6+l9zey9b+rBK/zSaaVF4DqT5FMjaEsP774imcprIwdtIYQE
	y7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=zsIXwle7EnRZjO1Hsw9OtFNeu8JCaREbfrS9N+hcPFs=;
	b=lJzw0Q6h5xhOwrwjJ+qJRt0XFv1STNEcioSFxHhA0EOxzeebperzvx/bDhH6eSP5xL
	53m09lUpIGOuRg3ImmUeFfGF98hK2Th20/naHpihj2pWz3YEYSVWWyJLKaCZRpTbu0YU
	wJQAo9B3WL1QSAmTeVngowwxD66jowY+VxfKdK53ZFD/4tWN+WJTi6JCQeVQ7wQkf5bT
	1sN/+N4OAKIJ1airLRxbaPYixLSEh8prI8la6E0hRk5+jhciUQ52C3k0CY3lCeH/Y0Nv
	CygXFK5hC8U6AfBYExrjKNVbq6+ty9aYXbT5zQR//Kf6+PQjTaSQOyl+85AWvHkV0Tj0
	NTGA==
X-Gm-Message-State: APjAAAU2joRf6YEAdwwHkD1HnURXTaBWSnlAVuBc8+t907+KarzMe3xY
	rKgicZqbSejzTtxSebPLoQBrCtOZO4Uk5A==
X-Google-Smtp-Source: APXvYqwsRYcjJflcm4GzllmF8S2/fgzpoMVN7J7dU0vKyuMCvazhLSvoKC1M3bcdb1qWp5OEZjuvMw==
X-Received: by 2002:ac8:4510:: with SMTP id q16mr2143500qtn.316.1573646998531; 
	Wed, 13 Nov 2019 04:09:58 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	a137sm830252qkg.75.2019.11.13.04.09.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:09:58 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 09:09:41 -0300
Message-Id: <20191113120944.10668-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
References: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 2/5] python-more-itertools: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 13 Nov 2019 12:09:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-more-itertools.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 33095b3d3..8dcf00b3f 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -2,3 +2,5 @@ DESCRIPTION = "More routines for operating on iterables, beyond itertools"
 HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


