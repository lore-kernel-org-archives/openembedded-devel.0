Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7079D36124
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.27880.1730831936211828124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfXgxa0V;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64377447b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831935; x=1731436735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJZjeA8LY//jxyOqCfs1YPlvH2R4WcYK19yszbGlvqQ=;
        b=DfXgxa0VERnCYHgwncaKoBmPp+V5JEEE/G4zq1U5/tSSdLfc7kKGf3SLyRqS1LGDWZ
         4dI+cWSBYq8OCgbVQp+SVPCBvqbP9O35cXVuHqDFUg6rw3gy9nvnYU9fI5s6RrkXzfYM
         qxsAjy0O15ewM82YYKKR0FdtKE1NKbB3WVLzPVu8ZZCX/zwH/27Rm+qR3l1lesXU1GNw
         mLaRogYHJLeiojbh9jTb1ZDuT922JV3g1TKnkAOGST2mFVgR3XrBof/fsNtTE12o6xUP
         jAbWJ6GgfjKCD5hkicXrrRgOQ49MvR2ol8DObvw8xzxctJocYPI4VE+53etEDHUCwDsu
         ZlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831935; x=1731436735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJZjeA8LY//jxyOqCfs1YPlvH2R4WcYK19yszbGlvqQ=;
        b=gwBRrywvSoFtU0GrPI6HhUGDGx9efFVjJGr35iQ58t8t91HGv4YFIZgg14l7fNdyeo
         StCmVLeqbHdABG6Y+Yi3T26DuUk8ZCsLakybp4evh0AHiGMRuIOpRZ/YJm8CwkpiSR0U
         x2CmQsDnBj4087j7XB0nQEqnnpImr/EKK3+h3cJZri30/+3W6UmEFW0+qJNxQIbsbumy
         fdNauwIipGpHHhrPyhyM+vFL2+Vhl+7cP1Xda31SAtaBmh2z00VO7lcYYJvbDnosacSH
         F0tjhxLjrYhNjBD03Erh9Z6SLc97otjaButUsADNxAA0oj8Om2N6PekJr3JcNE7g9JuD
         1tMQ==
X-Gm-Message-State: AOJu0YwLn2Kt/lh/TByBsEqTCR2qhvN25W/pUhIbxHV46vkfx5TOgK5U
	RrVVciKF7LYKbqLm4ZnvX2jIO+nrH+7k1rKA9b6XxSGAkx+Qcj9/kt2PbR1p
X-Google-Smtp-Source: AGHT+IHe7ZjtvtTy/B2agUjFr7KzFHBuOyjBtEYycS7YlQF7SHLdoNSRJla7I/R7UCz9ynftZG5Wwg==
X-Received: by 2002:a05:690c:6186:b0:6e5:e6e8:d6b7 with SMTP id 00721157ae682-6ea64ab25c6mr177894437b3.1.1730831934832;
        Tue, 05 Nov 2024 10:38:54 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:54 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 069/161] libmng: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:45 -0500
Message-ID: <20241105183658.34982-71-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113584

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index f9d3496d9..c92696b8b 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -10,7 +10,6 @@ DEPENDS = "zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
 SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libmng/files/libmng-devel/"
-- 
2.43.0


