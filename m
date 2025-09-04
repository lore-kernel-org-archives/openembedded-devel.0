Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B0CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:28:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.35861.1756981680100821758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agCw2p8r;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b88bff3ebso6265455e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981678; x=1757586478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaxHpAOUO+B0E17E61IrWYQ6p/WugKgr9ugfI+bpQHo=;
        b=agCw2p8rF4Ui60n2cYE6q5LL5pwdOKGD8+pfwY6P8d4TfqThRZBw6V0qt4uLhlNjJE
         ROf8OW6jNGiKDkOStqKFbO2cc0lJJYLdOxwt1IidR+3SRHGmRZJmWxoQhhhQIMrXgGh8
         CjKitiAC9uanRRuILJk4mSaz1wJq+KCB04gS245FsH4Doq0SMUWZBsVj5epFKwSxurNK
         DlLnrSs/2ytJH2zzxYYa1zFbWC6bB3mfjxRPyQ1dU7rqbLwekxtL0vR7SKPXzKjpFoXD
         F+iIIB4e1PV0RtlL/QriBLJg8CXwbUUxrvbKFGaS9o+mvLE5nm59e5LvFlhFaEIhOA8K
         wvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981678; x=1757586478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaxHpAOUO+B0E17E61IrWYQ6p/WugKgr9ugfI+bpQHo=;
        b=WdjI2Kwrcvqvm/SZ+tmawy2DQ9UFzWNuZ7vI88X4pO8Fq52PDaxNFKbyjQGvrMjD5T
         PhZbixsS6y/rhtAGKQ24BQXamVWAOSjm2cFscpFb/UQGoqExVqZ9a9ihQStGUd4lBa37
         RPzFu+Y5hAcmzkT/cOFYJrLT6IsQ30hdBTES+jOOffhYm9/wLu95aWWQIF6eH2dszsNS
         DO1RKEXSpLa4ZBRu2dt4gy5odsO/wrJMeyav07U9b0uKt5aHg0ybp3baju8aD0cTdFh4
         /xaV8Th+yKQoumHZkuKjyIGNYoW43r5abd7Jn/JjyTMyMxlIOoQKVq6o1dVOZ63c4Esb
         mvvg==
X-Gm-Message-State: AOJu0Yw2xm6/WEOBG5k6K/WRQ1ANsWzuYiNQaR5xYDsstPHM9GifovaM
	JCF7SSf4xeT7KFG7bLVBmOaEzYKqS2gAdeY3HnArRwdRq5w6pmD2o5+2KdIO4w==
X-Gm-Gg: ASbGncujQSgJ/DwFWA6js1WCYNk6kl31+3KuE0eiasuHP8fQgRDxYJdazfNLk6Ex8Gt
	HAuY8j8hmuW9OzyfxKa5sbvxXHstPqSD5yQF+E+YyuObEZC5Xz9O3S32f50sEqj9Dz3QMcFkm81
	r4o7DW3TQPks/LFCiBbiMHPGgWYZjFdaLoi2gHCT2cIdBOvaeNQ2LwewT+L7my7ALEodmFSTWLW
	2RMx1LBO3aNeECx6K9Cm4cIo7V+JO+oYaIZMC/OTFQ/Pnw/pMdb3RTmVBh5HC6g1dj2Lts9q7GU
	rU8U1Gwy7mGuBReeOX1cIHl5onQspcCLsvQehh+ttSLCkh20FVyZx4DieJp8j7VX9fIylQKa1ye
	hRqM18TiYvayGGhRCEyHzAsIeazu3FEpZQxZivLF2ooOFOtU9weM2HX0=
X-Google-Smtp-Source: AGHT+IHZJDFfnULBayLt7vLLvsRvKl+b21JAdk7wgXhPh5XaMrULWCv9ywthzV4zn/Wnvx+oYMIwIQ==
X-Received: by 2002:a05:600c:1ca4:b0:45d:98be:ee8f with SMTP id 5b1f17b1804b1-45d98bef03bmr26604965e9.26.1756981678134;
        Thu, 04 Sep 2025 03:27:58 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05faa9esm14925335e9.3.2025.09.04.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:27:57 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-pre-commit: New recipe
Date: Thu,  4 Sep 2025 12:27:48 +0200
Message-ID: <20250904102748.602126-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904102748.602126-1-zboszor@gmail.com>
References: <20250904102748.602126-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119283

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-pre-commit_4.3.0.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb
new file mode 100644
index 0000000000..f3116e6d0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.3.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A framework for managing and maintaining multi-language pre-commit hooks."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b53a93744e3ff841e5fc9a934da8e1c8"
+
+PYPI_PACKAGE = "pre_commit"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "499fe450cc9d42e9d58e606262795ecb64dd05438943c62b66f6a8673da30b16"
+
+RDEPENDS:${PN} = " \
+	python3-cfgv \
+	python3-identify \
+	python3-nodeenv \
+	python3-pyyaml \
+	python3-virtualenv \
+"
-- 
2.51.0


