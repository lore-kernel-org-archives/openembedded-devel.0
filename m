Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B31A77D533
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 11:14:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h11so14631672wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XaonEX+ALaUtgHUpuUJd8FEUKytQDwNIscU77CeN6Ck=;
	b=cG8z6HXeh8bh8xbhtcce6hWhMcptgQrj+iDFTMMouA7EhmHa5MFhzLzRgfvwYOtaFg
	9LUh+b813lJcgxfG+IdmPtjL5oONpfd8ufP165dy2/AI1FQtSTw1oMAGK5mdFq0b4d19
	Wv9+vr+oSMuND+jlKZXMf1j5IM4DQ0BVzCS4AA2sbXCPxM4TRHytKDmuIoUFOWMJ9ARR
	EpDOc1mFCizpCn8+9ld8Lo/a9rI3jBSPOdcVGBQgGssoZuN1NaKYL9tJGgVU9LRHUYVD
	2mg9uuBFmarGpHC8kKH0zC4+hhBmUOXIZ+aQi/yMcLkzKz/I5KXqTx8jBFRp87x2n978
	UAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XaonEX+ALaUtgHUpuUJd8FEUKytQDwNIscU77CeN6Ck=;
	b=EiFKeQYt2+7/SBrrr27PEnHX2FW9Y9sqeq5yg3SyJlgvwrYxca7FLMSrt4KQ4RmduB
	YGlAfrCzqoOB66o2EbcV1kvqohWOvCiyRvxVIzDq1SpnOUJaS21x7qZdLk/NNIXGzplK
	Rca0JGpISJd4NJUltlETfkm99/4YDHMTPBCYZ864+jSXLLW242QMZbklOx9LmikacDYe
	3EPS12NIdfbpWd0SsrPwusOa8dBeONGBSasOc9Bjs01lFk7g9iTWoEGXF82HHsFAc6gL
	+RFSM+AY17QPLjaEWxtNotHxMG5hkOKy1w8GUcF1wblndNEcKZXmJlvlpvwmSRdaC4um
	V5bg==
X-Gm-Message-State: APjAAAXZ+PQihAvguK4ebaKPuHf+COSBaqCyE1ykgabIgITCVN13gqNP
	n4JCkcj9LbwXb9R0dq6kp/ahzBH6HsA=
X-Google-Smtp-Source: APXvYqyUd3IPkpFuZ5spMed5mjwCJVdYfNjkn0wXRAuAqiWyhfNvadHZNn+ZYy4vsnCZhRkaATHPzA==
X-Received: by 2002:a05:600c:2051:: with SMTP id
	p17mr5174448wmg.125.1557141257016; 
	Mon, 06 May 2019 04:14:17 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.75.114])
	by smtp.gmail.com with ESMTPSA id
	b10sm15910181wrh.59.2019.05.06.04.14.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 May 2019 04:14:16 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Mon,  6 May 2019 13:14:06 +0200
Message-Id: <1557141246-4799-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190206004547.32351-5-raj.khem@gmail.com>
References: <20190206004547.32351-5-raj.khem@gmail.com>
Subject: [meta-oe] [PATCH] mongodb: Fix build with gcc
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
X-List-Received-Date: Mon, 06 May 2019 11:14:16 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 53a9f66..0f90003 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -21,12 +21,16 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://arm64-support.patch \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
-           file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            "
+
+SRC_URI_append_toolchain-clang = "\
+           file://0001-asio-Dont-use-experimental-with-clang.patch \
+           "
+
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
-- 
2.7.4


