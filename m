Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id D327B7807A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:47:59 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v190so89428ywg.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MoILLBGe8x1Y1zjd7WyHaqHbsmimkwBeqGnBc1KgAz8=;
	b=JOUGOX6LvLQhjblwffFXMfc4SJo4U8TO+4g0VXjY7vwbmxXWMPKH5VXS93X8oHy6yn
	c/xxcTTjgifwAKRJNK2gduXdViyMe91W5ra0qn8OdsKAuv1pA9VMsCprmL6pzyHgzCsv
	NBBCSK5uqjH9ker4nAJho53BH1LGx3rOf9IF+o9NCpVonmDek966YYHBTJAluGOgLGMV
	NL5+9MWfI/kJvzxtg+neyeW5DsRK+UQMG5aHYsCDtyXp7K79nv7AsVCcvwebEoreUuzf
	Oz40+24MF5sbCNaYJEBmUaFFw55JgtrnKtoZpdNEAm87UqvLPnGLeMkxO7CTkhAU+Vcy
	m4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MoILLBGe8x1Y1zjd7WyHaqHbsmimkwBeqGnBc1KgAz8=;
	b=Z/g+QIcHTowvVJIi5QnXxmORxrR+mcep76KCeCg99e+RQLAhxrTpz52giNfuDuvx5t
	/JEJmzw6eQhRrqhzydPq2nKw9mnw9bSBgeMqFnLRALY+avy/QIbhxxdJVixkAQ2h7IZ/
	+bqaiu8zv72WHnpGpFfgsOzacS2r2p5+IuloiGziz7d5FU7F4kdDx6e0+0mZaOEjDhTa
	3wku47+itZ4O8DVaAyTJnxkg17VKJzLBwUIjgC4iXdlf1A8OyDSpiDtPanOqhnM7aFn+
	EUcRpMzsPxcu+l186jAuLM7R8w3NLHeAZYIv+abW3IOHdorbTR/5dHMTrp5A5cy2WU7i
	mysA==
X-Gm-Message-State: AKGB3mJaExqRyT8kT5THuMoZm4TjtfU3VQ6DsbKm7eY/bDabccTY4jVW
	dwPvEBdG8prjR+a5Z3Z4Jy6OvzKV
X-Google-Smtp-Source: ACJfBougERXv8BQAXHfvI1mZ7nE4kbt6hyO+SzVvvoP674IVjsP6oKBlsF3JiL9OgSQcrRvWutVKtQ==
X-Received: by 10.129.58.1 with SMTP id h1mr34745049ywa.2.1514944080799;
	Tue, 02 Jan 2018 17:48:00 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:48:00 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:27 +0100
Message-Id: <1514944050-12039-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 4/7] commons-codec: extend native bbclass
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
X-List-Received-Date: Wed, 03 Jan 2018 01:48:00 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-codec_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/jakarta-commons/commons-codec_1.3.bb b/recipes-core/jakarta-commons/commons-codec_1.3.bb
index 0377168..fa74f6c 100644
--- a/recipes-core/jakarta-commons/commons-codec_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-codec_1.3.bb
@@ -11,3 +11,5 @@ S = "${WORKDIR}/${BP}"
 
 SRC_URI[md5sum] = "af3c3acf618de6108d65fcdc92b492e1"
 SRC_URI[sha256sum] = "12effcf3fea025bd34edbfec60a6216ca453fb27e781d8e5783caf75fd33d90e"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


