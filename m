Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CCD106B518
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20832.1774441273253267124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Daq7aiwy;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso44609825e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441271; x=1775046071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlsE09915ESMPqKDEMDOBJpTC09wtD6nOVneY5C8aaI=;
        b=Daq7aiwyjeN6D45KUb1ib2+W87AdtsDLtDe0CrU6qAumuQMvjv7ZK+gnS1FfbGev9r
         H8rmojBlXwJMRxMhDzOMtvlNPEf6qD5fhIg8RWfauI87QTNEt0OhuEJmvsWkqFeYYRlP
         IvG3119+4jhex+cJ5eiCVj8Y4ANGFTktUfTQLy+Gt/fZxSV0zp6NwIGdbbGPsmh0dNx9
         aPVhIM3YJuXHS5XJseejMxluaq3afKeYg07Te4cZmF949W20J7WsTHDEeNUnp0hQ4JBS
         Qa1cI5BSDoVgB3+N1a15CB2+5BAL6BKiij9ewkuGZrfgrX9q5gczl9T/a2TWmc0D47AV
         bgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441271; x=1775046071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlsE09915ESMPqKDEMDOBJpTC09wtD6nOVneY5C8aaI=;
        b=WsNkACjHjNIYDiTJprMY1jK7FLJvlP3Ecl7wgQXRv4lwNHQDasXQvKiqDZsjSOnfA+
         8XVOSjlPeV3Mpd48wXbp/SEpgGqqRQ7EOgPLkNfZUnq/TVYmlpBmxzb3WHXOL6jModHM
         AjtnyXJItVjUtCqBJTtF0KCTvlCV1Mzjgt1IfbKpAkHDgXTanvrskHFMnwcCNPVTh2Iu
         F5h2R9YwkJVYSo+0fkONFjz5qMAakuoPjVM+AVCZjL8haR0YJuksYR+WGCdlHl4Icp4S
         m4vi1fDdJ/T7wqk3MzICMdTYcEpuudBoSlbVifrmsfRsGXvxgT2VocC7dGM5XiVaYbZ4
         4brA==
X-Gm-Message-State: AOJu0YxnvH/nq7xBXG9og2YPpYaJ0sdia8TGYat6PTfqxbLL1dgj3jG3
	kdSNqoNMy38uHEgSAjj+c9c1C0ew0CyIgCV5+Inr88gSdikKtChwtJZKgd18/g==
X-Gm-Gg: ATEYQzwEcC+yDCpPFKwxvZMjCoT5E3p73DkwAWOI3AxvTrsLlBoFAYHNUTBEywDKwMX
	QGMt10R73CwplA+KdtawpxAldud383VX433RMY8b+CkPEyrFkPSI6HZvlEfjpMRq04bdd06N8AJ
	uGbH8Enxh8tcGZTZrXIZTH5hyweQtOwfDIp1fI9/LigMQ+6i+wI+BJiDejAT99SaZgZqJBI4L/A
	VAlxmaMEnMVRaNJlu+3J3hKOCsVcsjwrBlWQ69KpgNuWDa4+dEsxWkWcIHR/gffophlWVwmmkQX
	VEq773EJNQpEjLJ4HMK0Od/FSBX6h4zvJ4inTcslgQ5eglJskm/QPdS5QXYknuJhm1WBamcilcV
	D1h/PlVU9piGf2MV3xFwNSTDcDXkMV3KpVTdbVx+7OF8yNlAhjjKUyPI8wkS+u4tKdbNV3WVScg
	4S5MPBk47efI5yFw==
X-Received: by 2002:a05:600c:a4f:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-487160350d6mr45134035e9.22.1774441271277;
        Wed, 25 Mar 2026 05:21:11 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 08/15] libpwquality: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:34 +0100
Message-ID: <20260325122046.1211090-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125615

Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION.
The former now contains PYTHON_ABI. This makes the python module
to be installed into the correct location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 7ec01ecd3f..86d23f1427 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -24,7 +24,7 @@ export PYTHON_DIR
 export BUILD_SYS
 export HOST_SYS
 
-EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
+EXTRA_OECONF += "--with-python-rev=${PYTHON_MAINVERSION} \
                  --with-python-binary=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
                  --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR} \
                  --libdir=${libdir} \
-- 
2.53.0


