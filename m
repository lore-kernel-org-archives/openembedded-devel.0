Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22C0C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:44:30 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.1782.1716572665377039240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WmJ4J1QM;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e576057c2bso135547911fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572663; x=1717177463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7VswT+G63uEibXcbgPaOkSM+uQIniXeZTxq7Scr6H8=;
        b=WmJ4J1QMQ6YXchz77SpTVnl1mfh7I60Bd8BaBlHJRQxdpe38jN1anrnLHkawPZwVfK
         mi26G9T3jfN1XHBhUulzGe+RfZydtm2Ca8k/MeZMiF3vI7f5Ff2OTM+Ka80shvZvolys
         uF1wtq4S2x14Rq9bJ2eFNwWqdm+i0qaR8nsYrN9ZeVlagT8Q7eFViv21DbX9GRmfnM+/
         bcTXbgk3fAM7XilcZx1WvcR2+TnlUk48WirHN5WUZZkJU5YAXOTK/biCYGhw58ehiwbt
         bzZjmikjd90rde+0coS+PxMy1cvES+8d9wn6qauKRodHgFUkMYu1kP8YHWGyZ+Nr1mlQ
         4f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572663; x=1717177463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7VswT+G63uEibXcbgPaOkSM+uQIniXeZTxq7Scr6H8=;
        b=r2h2DXXycFVzOzjoxFlBCF1G19GTNKoeKQ8a8pl+L5qP2dyswh40yeiNPQ/qAck+Fv
         7pTTAuEb3/Y9ugwgglGZXKLYB7iXRPBC0CRdSMQc69PvcWEn9072nJGiunjQg96fdT2H
         nh/hz7lQJzNYhVMkwseDeXb/lfwvswQPnDEvVpehZqL5XU6swSYnuK8o/m1s16cELf0A
         Sd6S56UwzBFku1KPdnMGVlSRFCZ4sO1QkHHD3Ji/HnH1HiyGEXJkVMSxMEjapUaEXp0f
         RQdluTffgkFhQF1bMj0efrXQlnm7nGBLH2zd1upNlycWyNZWJ8CiquwjwHe8eOJ6nvTR
         UMfA==
X-Gm-Message-State: AOJu0Ywo4woAfgUMym0ULenDZs/R8KEb4ckIQpgYDF8+xnACwLSbMpKh
	TmzTJwZwbQaJ2Ad6z+ylB6dVFzMwCE5a5HtSN2OuKckrshQopQRGXHEQPQ==
X-Google-Smtp-Source: AGHT+IGyKjcE2QWrQCLq+39ZZuD6K7fhz7yV6o27gjyr11rpMyWoFBPBUfKSUqBrCj/OJY5W3ESDeg==
X-Received: by 2002:a2e:6802:0:b0:2db:a9c9:4c5e with SMTP id 38308e7fff4ca-2e95b096dbcmr25888391fa.21.1716572662440;
        Fri, 24 May 2024 10:44:22 -0700 (PDT)
Received: from control-center.home (232-13-20-31.ftth.glasoperator.nl. [31.20.13.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495e01sm1979737a12.63.2024.05.24.10.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:44:21 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-pytest-socket: new recipe
Date: Fri, 24 May 2024 17:43:44 +0000
Message-Id: <20240524174344.2105779-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
References: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110520

Pytest Plugin to disable socket calls during tests
---
 .../python/python3-pytest-socket_0.7.0.bb          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
new file mode 100644
index 000000000..86b03724a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pytest Plugin to disable socket calls during tests"
+HOMEPAGE = "https://github.com/miketheman/pytest-socket"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1752f63a3a8a02fed42e580e9b94a081"
+
+SRC_URI[sha256sum] = "71ab048cbbcb085c15a4423b73b619a8b35d6a307f46f78ea46be51b1b7e11b3"
+
+inherit pypi python_poetry_core
+
+RDEPENDS:${PN} = "python3-pytest"
+
+BBCLASSEXTEND = "native nativesdk"
+
+PYPI_PACKAGE = "pytest_socket"
-- 
2.34.1


