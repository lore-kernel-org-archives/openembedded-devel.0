Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A290CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:27:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21044.1762378055166562177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M7L7wZ1d;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso378471a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378053; x=1762982853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ap96TWT26Wp2JFiB7cazXTo1IGztzvMGUAsYGv1ic8=;
        b=M7L7wZ1dhvimZ3Oklff6QiGytUCcPJmUFV1vHFGpGHBd8a484UhUfQZU6kgtCzTbks
         jkhaP0JxvFuZAkxTluippdADf7KeNUIS9xmMa3iwCCHqzJieQ2e7ObFmnodqcJMIpge2
         ed7Ma6TGwbZUKbIzM+LDTjcbeuNgA7oQ4Wo82O/U//hGCkyxRmwoieBJ2X+3+HXXuuH1
         Kyo34NYGfh8P3eWpEcRRDCW5GkCmh0w7+pAP6z9vos0kfHGtoVpWluodSr0HelOyqsTn
         Vqe2pbaGbwo13D2EY4kwD/j24jt5fflIjCajen0yEVRTGigzjmk1bF+Y5x/Yw6ODmuhK
         HXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378053; x=1762982853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ap96TWT26Wp2JFiB7cazXTo1IGztzvMGUAsYGv1ic8=;
        b=EKIcBq9qy5XgQ1Zi7+eT9QwDS7V3PBNBEQ3JUCAs2qV3I/RkhEddRwQftZNAi7lAM0
         vcwOvmLNZGy+Ercol7dv2j5qrGmiqJs3fASvLVY+vOjrkBUQixrvUxMw4+d3jshEiW5N
         j0j+nMvo2ZN8chiVMDHVnnRHzyXLn8HgGTSMyD4XqafA0yiy2rM3ljZAqORlb4liRXlU
         6FSwDf94dNMNbLfPqTCIXwitu6rp9briWL0R5YzaXPOdKD5nYhtVdnq/CNVXqEJd/kip
         IjpfNmLWzZK0tv5w6H88bhGrjBjxvgoKyRUplULV8XOg9c++WLdDoeuj7bQWxuqUoOhs
         /RQA==
X-Gm-Message-State: AOJu0YzCAg0igVi9TslbAMDG+UQArrBCqgZU83jW9JT5WwkptHmmiLoh
	7TS7EJjo3iQky5xjrPMlxM/jZmQSv2Gk3aoqyvvuRCF27MFKQXB5NYcw+PM2XnRS
X-Gm-Gg: ASbGncsrFffxZEZX/68lDdizDNetaYRH0hS4z1XddOBbTcXhz7rQc/T5LsQxf0TdWcS
	FKaWvWDxx2JjcZbXC2mAk9W2HCUpYqhmU3nc03wilK9q73rUTwg0pu7vj3cIGBT3YdQ4nvUPqED
	CkSJqxt3qgWCrWQ05BNycBdaSFJdy9yJpYYM3/HNRjENAKM5IThLBWWZFc8qEVm6kAMdVownVPo
	mUv/0ceVsiS1VtJdXI1BdXxitN3TcabZnmNltHJdf10pOOGXA+Q9VpigSsnKPYUS0YGfq+gClj/
	cF9UU43NHspZN2cl8zi5Sql/ZK/Fxa5g5/B1quJwtr29rYuLKgE1NCOUcbcvBf6BPA3QgEHo88u
	enH8BcHpw4ucFoiQvyt10vRuaZg8tLjhTIfVRi62fg3kIZwfNXIY7GHnYAoVI60AlPTZcPsduJs
	uhcWkrBL1kRaevV5H248IQNdEjD2HsG0RyhxyUzEhN8HsODxUzgESEXmrHVllG2uUOVlZO1llXh
	Qc6vxwslGM+pw==
X-Google-Smtp-Source: AGHT+IEUdwAUObOs2FbzUl9sKWz36Kdq1BXAF2org6SV5+62EDZuOAqkLhSYLBV9LMvR4llYf2aNhw==
X-Received: by 2002:a17:906:37c3:b0:b72:88b6:c8c9 with SMTP id a640c23a62f3a-b7288b6ced1mr74331966b.41.1762378053114;
        Wed, 05 Nov 2025 13:27:33 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:27:32 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/8] python3-sqlalchemy: add missing RDEPENDS on python3-greenlet
Date: Wed,  5 Nov 2025 22:26:27 +0100
Message-ID: <20251105212631.386242-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121331

When checking with 'pip check' on any target pip reports that this is a missing dependency.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
index 5bbd79a93a..d17901a031 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} += " \
     python3-profile \
     python3-threading \
     python3-typing-extensions \
+    python3-greenlet \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


