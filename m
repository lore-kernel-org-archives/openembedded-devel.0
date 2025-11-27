Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B417CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 22:21:45 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4597.1764282104032030129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 14:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddcdnE/I;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b21fc25ae1so116277285a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 14:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764282103; x=1764886903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1h6IRnNO4lIUVq59JiYFE3W0j3bCnRi7n9pBGTpYbU=;
        b=ddcdnE/ItMsBVjQlOkquiYRYVFa4hE/zLw0zU6I/LyTXvaoQzevK11nMqKKg3uEnAu
         uWbvH+dt+ypq9bUqGQmyNnut74+p2mJO+WYwYHXlQe7f3lo12raiZ75NDEwh+NzXxakz
         Op+tRDeN8LLHlbkz8nCllxCk6cN+g8Esjbo7D458cSpUHIoprCXqBOoq/7kMtvtRZ/0x
         03aq5H0/qMhYipcVi3sJtgT2VP7NjESX0opslNaY4VonTC/kpeRsvD+NKv+i5VWvloJ7
         lMtU1trcSBMrBC1P2OoUGorwaGD9U+bvBshLfqRxTAnlaNcpcAUjcUZhTLxp1Ie8KifN
         ueLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764282103; x=1764886903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1h6IRnNO4lIUVq59JiYFE3W0j3bCnRi7n9pBGTpYbU=;
        b=pMOlsQVkCK7/tclsLOGdexcFHxEOowq4K1mOO6v8/zC8IfxGrp2WW+9Fn81d4vu+lw
         yBtO7It2irXZU5Fc2AN1Krkd5FYeCx5+x8MpxAnAGdDRPWEjCzgEnl7qd+Gcx0aMqhX9
         0tkOveFgm3GHpwYYoZ+f5136BpMgxiKGpUXAYAH33qE5ZQrooG1Dk4qCuQjeaL16hwh6
         9oJmTPqPpdmvBCIdnINbUf3oJ3EaTFHISiesbsgOuot468VG+Sw3ez2EtvZgIVZWaRf2
         FcbBHXGtxcdmNEnzZhjsA3licgNbQjSuQwi7eyTm0McQmgzMaBky6J+OoRwgE8jMtr5W
         R0FQ==
X-Gm-Message-State: AOJu0Yz7vYMgHFRdrRyfTLgyAyKkD7PgJh11ceumkF4FkrUzDZjYmRQc
	BoiRgfVnTyUSFfoXLCqsC6YDu7ESEDLUABdgfA8jutc/+Is9eEj5EpLM7HeXFA==
X-Gm-Gg: ASbGncuXwc1WgWkouhXbtYkrZ0yQGpgBQAp1niAWw8tj+diEUVqlRGmuS2ZlTTtfhQg
	ayhsFaW0AskV4VrNz2X5DFflXTeALCAAWUD64lM3IKdP/01Cafjd+WHiEgCTovKhaeNECqr13G5
	DdbtwHMxop1OmfV110YVJpyAeK2JuPvA2MGjutRx8R0AqvyokBZZbcUiai/6GEB/XN+7AyAR7S3
	0OHcn6CbvzcfRkaPqOJs/Pd8+km/FsBzlJtj+Py3f5UCFGyyGNhqA6CnxjznjE2ZE3szU22dFWd
	bNITaZ6cEsaMpjx5pO69bbNYrG7JtT+TIWci+KeXyXHQJox7hXx1HSAiegi7sav2Cq06hYG1G3a
	oWl3zlSX7muvJ08Zc6+69ZU15eoadWW97b15Oua43X86DRvaYpfh+3Zp7TeQJ7m/cj8EQLkt8cH
	tPiEVqD0S0M5sMofPRfiXMcj/Cpwty0Ae0fe8xc0UVQcR/0TQ92HZh
X-Google-Smtp-Source: AGHT+IFR4JTfOfhIl18KAbp3i2lgIQZrjP+3YR6NwdrGRo7LqKlh0PO3saEM9/6burVsxjlyGzYRTw==
X-Received: by 2002:a05:620a:1990:b0:883:b565:1acf with SMTP id af79cd13be357-8b4ebdc0c08mr1591943185a.60.1764282102751;
        Thu, 27 Nov 2025 14:21:42 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529c90ccbsm187164485a.23.2025.11.27.14.21.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 14:21:42 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-requests-unixsocket: Update to 0.4.1
Date: Thu, 27 Nov 2025 16:21:41 -0600
Message-ID: <20251127222141.2161520-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <187BF47DBA4F18BC.286755@lists.openembedded.org>
References: <187BF47DBA4F18BC.286755@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 22:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122117

From: Anthony Del Frari <anthony.delfrari@vecima.com>

python3-requests broke the http+unix url scheme with version 2.32.
Their position is that it's the responsibility of consuming libraries
to adopt their new interface. requests-unixsocket 0.4 adapts to the
new interface.

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 ...ket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-unixsocket_0.3.0.bb => python3-requests-unixsocket_0.4.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
index 94497b609bd..4485b89de7d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4.1.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "https://pypi.org/project/requests-unixsocket/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "28304283ea9357d45fff58ad5b11e47708cfbf5806817aa59b2a363228ee971e"
+SRC_URI[sha256sum] = "b2596158c356ecee68d27ba469a52211230ac6fb0cde8b66afb19f0ed47a1995"
 
-PYPI_PACKAGE = "requests-unixsocket"
+PYPI_PACKAGE = "requests_unixsocket"
 
-inherit pypi
-inherit setuptools3
+inherit pypi python_setuptools_build_meta
 
-DEPENDS += "python3-pbr-native"
+DEPENDS += "python3-pbr-native python3-setuptools-scm-native"
 RDEPENDS:${PN} = "python3-requests python3-urllib3"

