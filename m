Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E424CC10DCE
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:41 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.113519.1701991473666410144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wm//hefx;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c66e7eafabso1240120a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991473; x=1702596273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlNVGRp7Zy/trSzm/rrOJNdUukYY6sE4+X1IX26iL5w=;
        b=Wm//hefx+jl2yjeNx/iWJS+HIsh8czjVffD1oq+FthRbCsLvig7zqq5PChGgjJQXWc
         Y6QyOM/xYGs09JFYv/T9h6tW9xLUgHH4Ycyzlc5QxY3zRgRfK4z+BeiIi/jIaEXFuK+b
         LEnYJXyFi9skIC18Wxe+ZVy6NSbJRvnzrrdlsPFLu8puJWk0EYty89E9JiuPONyMZVB9
         CY+xmT4cAVU5h7bmUbLULCX8Ij5/y7Ym69JWoiFPEA8bl6IubXI45vGcDlDjc53iNxor
         7ThX/Egs+z8Dr6zSHsLSLutnob/dMKV4UyQB+Esyuj0RgyIdbFBeOtYTr/rFiwsdQ1l2
         fdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991473; x=1702596273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlNVGRp7Zy/trSzm/rrOJNdUukYY6sE4+X1IX26iL5w=;
        b=nFoIeANAwr/AwgXsKOQ14KtXGgjWgILZFr2NYqL4sH+JgCNp+yYx0heNajikFO3Ths
         x9x4EiNaLGb/a7xcwSNtpal56CJACNJQD5KdoACxCw6d/7wV4GHLjpr44BnDG5fbUSpj
         LpOWqYJrABIwOFevH4CcTNea9KntNxLaJ3agXszBXUsZenfknxYEZUxdV9DGp7PIjKSX
         jRcJM0eFtVk79IeE0b6qwE6uarCrQ/F1/QXX2ckjBiP2mRD/TOG/xQkC8vLn1j1Rh5Kx
         /+wr9PT3TvAfBgT6nYbw2PXtFPWMzJYaGEuGfjHXLWMU2cmlqx5fVC68Oae1JSO7Anyz
         rc9Q==
X-Gm-Message-State: AOJu0YyiLqjEr4cPj/CztySEBtouJFfuORoYDzBJMzcUlz2LHHQ0pJlh
	Cq1E05dDdujH4fuB3C3L/QwkXccRs4U=
X-Google-Smtp-Source: AGHT+IEAoiDoY43PWQII5Zg6xt8hj87iFg2ICcHzBSFnrRvDiPT/Day4CwqYZPibf124GAgCQlSCtA==
X-Received: by 2002:a05:6a20:43a7:b0:18f:bf91:2938 with SMTP id i39-20020a056a2043a700b0018fbf912938mr4203654pzl.125.1701991472683;
        Thu, 07 Dec 2023 15:24:32 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/7] python3-dirty-equals: add v0.7.1
Date: Thu,  7 Dec 2023 15:23:54 -0800
Message-Id: <e6ebdfcb815cafccc8faf3d3722ea0e1ae6eea30.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107296

Dependency for python3-pydantic-core ptests.

"""
dirty-equals is a python library that (mis)uses the __eq__ method to make
python code (generally unit tests) more declarative and therefore easier
to read and write.

dirty-equals can be used in whatever context you like, but it comes into
its own when writing unit tests for applications where you're commonly
checking the response to API calls and the contents of a database.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-dirty-equals_0.7.1.bb      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb
new file mode 100644
index 000000000..ea9303b17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Doing dirty (but extremely useful) things with equals."
+DESCRIPTION = "dirty-equals is a python library that (mis)uses the \
+__eq__ method to make python code (generally unit tests) more \
+declarative and therefore easier to read and write.\
+\
+dirty-equals can be used in whatever context you like, but it comes \
+into its own when writing unit tests for applications where you're \
+commonly checking the response to API calls and the contents of a database."
+HOMEPAGE = "https://github.com/samuelcolvin/dirty-equals"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
+
+SRC_URI[sha256sum] = "a580513f3285e93656a770a04e428f8bfc513848877bf278282dbfbb907fdbb4"
+
+S = "${WORKDIR}/dirty_equals-${PV}"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "dirty_equals"
+
+RDEPENDS:${PN} += "python3-pytz"
-- 
2.34.1


