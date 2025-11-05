Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B3DCCFA13
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:28:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21075.1762378096853716490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWWBJgv5;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640c48b3b90so418287a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378095; x=1762982895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH5ovi7XtqcphVl4+TYTUywa/syXi+pFucG3HxOmM8E=;
        b=fWWBJgv5cbD3xX9gJjvnjQqniREmllveeTXzKg779/qbELCNTWEj/SPvF7Fk2dkd73
         sZMZEkxVJEc12JGd0nZ6FK1REzr+eJGVFkVEU/NpCtirWn3HrLIf2XcQsLkCZQG/K/ob
         ZV4zgrp/Tmk5QeJwXxXClewiH+affBy/+c3JjpMVd9UdejvblWa7lF3L/HFbZB7YGnE+
         hfEq9LLcTwNdF5+BHMF41L/o6R+Z3xO/gDXYglVZl562YJvmeN7Ir8J2E+YAQNZDvxnU
         PQyW9dViAChfHQgPZg1M4E5rQqDPmpitFMl+obwJTjy4z/wU0Bko9Fv1AOSUExwAYn+U
         2uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378095; x=1762982895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH5ovi7XtqcphVl4+TYTUywa/syXi+pFucG3HxOmM8E=;
        b=oCYJjAVHbrpM8KjZydTLhdLpTbTXM7iGGfzv4HAe/DITiQtumQUk/x2+Rt07NG4mLQ
         FG9kHrtjnn5gpTM90s/c0ELGZZEqyTLi8hbwNoks+ptDYa6EeGnvgeVr5ZmOkcCo1W//
         QMIcyW8DXOHyQx2RzgPF1sfdWbd2ltecHntlrh4dJhJ4crQxee+APZ4QGoPHkAtp8SJ+
         DZ9vDHiGvqv+AxYXioK1eKkaZQgA8HeKOQXrMxwYIiTzhFfJIcjHbt0nfTHz+7i/YpOW
         2myhCMaxhn2tCkw/SObBL7tKXNOoWOLgGrF0wCfnMNl8+OBf7n3kOO7rfv9lg7QM+vwz
         fGOw==
X-Gm-Message-State: AOJu0Yy377DEOhOoLcOiCQn6+vL5DUNbBVASl/7uF0ZzxLaVYCrCWTiq
	lUwXe2JhqJgW78yABagZeRpDN2bLlXX0TYChfyfHkeulX4tzOL+LlTuGUKhGF26Q
X-Gm-Gg: ASbGncuT+zfnGMy31RT4uK9zlqgw8gtEP+Jen2QBZdui2cg1IkrGnfIPE4R6AZLhCdu
	l4UHkiCGThoq0ADtk0YYjQN0LzSZNXTym4D2xTWj4zZYiM5fkyV4grLVEfa0NTmvRRPaJ6roXK5
	VLRHZCeDq+9tdYEQuYr+NHtWVVYtCPo3oEKdjSmFvywFunGxcbxov4tV58thyDxXyFTS+iz+MFS
	HHMHY0X9VCD7svqHbQwAyhONc0S0z53uM0/fA2TPo50sOntREvaEkKCtG+u9w/hh9xD2u0fvO9q
	sdBVi7Pq+mo1Q3iP8473XGm7ZuawQB5wQjyOKJu8SD8/XH6t5nP3CuCbnx/JDE6OAcwPTrwoejN
	k0lOzq82OEpzyNvHffn1nck6PqAqvvpBWmwkTs4MhKwtRImUpFe9nONiBAtZkQ+uL8RaTbdDj3G
	l7/Uece6NQVc1DQdXQLlCESazXCTb/KcyQMXnSu0fCggra4tCfwKuFQ5oOmqQ5trVZ/fDVXXo3s
	zcKEDjBcUiQGg==
X-Google-Smtp-Source: AGHT+IErCTBJfklc9XrlpqtEhP7mawvczMq686WVwibp+vfKp3XpFm3fOFzQ/CtNNZdGoq4zJoGZvw==
X-Received: by 2002:a17:907:6ea5:b0:b40:8deb:9cbe with SMTP id a640c23a62f3a-b7265155625mr411799466b.2.1762378094827;
        Wed, 05 Nov 2025 13:28:14 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:28:14 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 6/8] New recipe: python3-pytest-httpx
Date: Wed,  5 Nov 2025 22:26:33 +0100
Message-ID: <20251105212631.386242-10-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121335

pytest fixture to mock HTTPX

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pytest-httpx_0.35.0.bb         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
new file mode 100644
index 0000000000..45a6ebdf16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Send responses to httpx."
+HOMEPAGE = "https://github.com/Colin-b/pytest_httpx"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=80d06bde9296c367ea063b11e9518842"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+SRC_URI[sha256sum] = "d619ad5d2e67734abfbb224c3d9025d64795d4b8711116b1a13f72a251ae511f"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pytest_httpx"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+RDEPENDS:${PN} = "python3-httpx python3-pytest"
-- 
2.43.0


