Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB5FCA1005
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:06:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.48449.1756724786394827159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XrL0/Bnw;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0428b537e5so144165466b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756724785; x=1757329585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJbxA2/2wczbu+0pjzxZ5s9lhzbJRhK2D+VZe/dpSk8=;
        b=XrL0/BnwDh56pKZ3vpz8stiTfwNhFI+dthas9hD3V9Fg6Ccnn/gvXOMq9TYMoySsB/
         2rEqR3d/0HzKqqT1r6JBovjkG44pFt0yaPj9fEW8knVud3fVFFWl1khPv8PJDHFCAPof
         2aCsWE0ShclV5CEOUnZJukDPs9ne6BGczJt+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724785; x=1757329585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJbxA2/2wczbu+0pjzxZ5s9lhzbJRhK2D+VZe/dpSk8=;
        b=VLzCsK0visRow7xxJd7AxWOeBIwMaT1aRW1KnyhersRMIQo5gZJOQ/xMCM7Q6c2zKr
         SaoVgzIvnMysIakqJyhUk4dHnk2q2jln7M6RqL++CjeRoMwtJu/4+3kWXdCLzYEfJbmG
         EqBwJGzUq+pdNBQevnCbOnuXK4pqld2jXgS3HgEjclQQgf3t/I84okK21kvOop/Q9YNh
         j9Vb9qBuH6pCAk85UnHmuTvttlYcMVnGq+VkarETAcvnFfyFutgDyEVuj9wtatutD92W
         9KGKhcq76jCnY4Qnxd3Sx7NJlxDJnNrY1GYiATeUs1PIM+Rqg34Bh7hKaV6w++y2PVlD
         Ckhw==
X-Gm-Message-State: AOJu0Yx4bqnrSv0trojKrhrk54twLBQdg+MoZ6XqDiMfPDC3UzPz6kpk
	Xo8xDOvOqNs3mdFS0nobKnAxpUS28huHYnhPFQe4O3K+EUrM5R4qnGdH5v2uqh89Lds7wLGvg4H
	UthiT
X-Gm-Gg: ASbGncsYy68i3AABsmPc3cI1ldOz2VBLEnUYPkoBvTZlSUNiTUc0Fe/fnWoQptCCOgt
	5zqyuvk/FARgLhGRD3EJwgkpuYz2TCc0dA7wfz8rcXT0WFRS+W+rXHVSveplCKLPuPBU5lbk7WU
	TdKg7Xu+Qg502AZPgJdZnNDnTVU/BDhyAptQa16+bw78PO44IgBiowBb1AmGof/GLyQWtmD6zwt
	kWMLFzAWIRNaY714fhTUMOLrRzNgLyIgwN04TzFjTXFQuzDLUG6Exao7KIJr5nWvNclOvbrImYM
	qYle6ecEYjrdg6G3+FNYzZk2X+fN22obi2klpi4lZ1iP9rMgw6zY6knOyChaWwb6UbDR0n9XHyc
	qi8Yb1pig7yo5h79Oq5vdEvegQSOUUR8+PQL35q0CZuIwb0Y=
X-Google-Smtp-Source: AGHT+IHi+Xr4Sv+P0IicpFA99lZnX0hqMe70bzKJi9Eub0joK2EgCLyxmiWtQbGKvyFvqZ3K/Uc76g==
X-Received: by 2002:a17:907:80c:b0:af9:a5f8:2f0c with SMTP id a640c23a62f3a-b01d8c9275bmr709346666b.28.1756724784564;
        Mon, 01 Sep 2025 04:06:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm825856166b.69.2025.09.01.04.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:06:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-cucumber-tag-expressions: Add recipe
Date: Mon,  1 Sep 2025 14:06:19 +0300
Message-ID: <20250901110620.158572-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901110620.158572-1-leon.anavi@konsulko.com>
References: <20250901110620.158572-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 11:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119156

Add recipe for cucumber-tag-expressions, release 6.2.0. It provides
a tag-expression parser and evaluation logic for cucumber/behave.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-cucumber-tag-expressions_6.2.0.bb     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb
new file mode 100644
index 0000000000..6ddc489f8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_6.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Cucumber tag expression parser"
+DESCRIPTION = "Provides a tag-expression parser and evaluation logic for cucumber/behave"
+HOMEPAGE = "https://github.com/cucumber/tag-expressions"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[sha256sum] = "b60aa2cdbf9ac43e28d9b0e4fd49edf9f09d5d941257d2912f5228f9d166c023"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "cucumber_tag_expressions"
+
+DEPENDS += "\
+    python3-setuptools-scm-native \
+"
-- 
2.47.2


