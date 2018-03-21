Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2F67896C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:16:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g12so1978361pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BMxPJ8YaYZ+HrGvFP3thAExomgmlpkLCVTfAauKvUyU=;
	b=ilbBnkRcf8kbelLhognAkVt8uNBhRNSkRjSbGTaFcxErIfHnCHHGgvD3FyVcmKD4nC
	xrb7g6SIXbCLpGXLCTb4MKNIb6oohhSNuZNecvbXEL+Tc90ZHC+mm7EtgcmV+Y+5D7s4
	AsM8XCogTz2oU08fuHXsC7iWUeAn9oumiKCs4Ziko9JN9CCSE3/LXn5BMt9creKOI0/r
	xW3dlNky8edOARPXqEl0WgeUchJShtrx3/VTGL79MKkOftb/R81eT0av6RjZcheT2edM
	HE/OW+hNnXqEoyvhMXOte54VXu4TL1qXXcz6NtWz2g3uz/T946IRwSzVGRyQx8dk8eHZ
	csBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BMxPJ8YaYZ+HrGvFP3thAExomgmlpkLCVTfAauKvUyU=;
	b=YXQQ5/nSaZ8SgDuo+FEg/sBBh/IkyJEtCi0j3dTFBNPhhVaN3tJU9fSgsqpHXWE/wi
	qRQz7GD6tCY9SKAtwMR9JuHxnW1Jl/q/nfxO1nqDnU9D6QPmEdmxp7UYm28a3nPeGmTK
	0RzaN2by8h18dfq0zCL89yMHt7OMIBWbPOpK5BvTlIs+Xh4x2pe7AaDGIWsb0NNvhNh2
	i2ogzR06tiYZvVoif+VyNybGMn3zg3/U3m0bA6X1+CVavORYNAFoNsfhAmZvqGGzsMuq
	g9tfLoTJTwduBI8WTT0pqk/pE/ck4qGCUeBZm0ul5eFWyveUblwabgLbkHpI+KI7GiA7
	aRtg==
X-Gm-Message-State: AElRT7EU//Ui+eb+ukMokshxMTU+itcR0nseHmvYdtCCbuG5U+Ts01dg
	mjdXlGhl2yCPI/cR0/XJNr11eQ==
X-Google-Smtp-Source: AG47ELsUkAUT3PeebY6t8B4NabGHI38PlV5lDRWzCIC8UwKNzo0ICDHEJui22Aa2HZLUyooeUqRf0Q==
X-Received: by 10.101.100.9 with SMTP id a9mr15166978pgv.209.1521641778529;
	Wed, 21 Mar 2018 07:16:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	v18sm8138907pgb.23.2018.03.21.07.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Mar 2018 07:16:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 07:16:13 -0700
Message-Id: <1521641775-2171-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
References: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/4] rocksdb: move to recipe-dbs
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
X-List-Received-Date: Wed, 21 Mar 2018 14:16:17 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-bsp => recipes-dbs}/rocksdb/rocksdb_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-bsp => recipes-dbs}/rocksdb/rocksdb_git.bb (100%)

diff --git a/meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
similarity index 100%
rename from meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
-- 
2.7.4


