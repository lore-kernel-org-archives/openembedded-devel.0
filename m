Return-Path: <joshuagloe@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1126E7ECB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 15:46:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so21540368wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wR3yBGW+DNC4HKmZBPJ7XqXfwtr58/H7lOMIHE3x/f8=;
	b=CNTWMVgKhQvxciilragmjNb1Vi7nhsFE+D509lo/83grqah617Os2ELWd7UpDoiCBf
	kgIAMaUJO/2f0s7d6i9oPV0i5nNqAANxGcUlImQHBOsuaib1XSlxkmgnxJozkXMsSrpc
	gs5iVS46MhZJPaQCoedWVcEh1WEk77yjljfV3jH25n6G5rJ+A/jX7AvDO/FL7wozGwzm
	380lXUblUCmN+VaQiOnsu2rAA4Qyf6HPnUj4snFgvrZVcL2bBnrJMaFELERqWgorjnQU
	D3yI7GFtLzB2+RAJ90ZLTiYUlfr0JwAQL/jfyAkYUMlAMqaElWkvhf2hc4Wic63NbCem
	Z5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wR3yBGW+DNC4HKmZBPJ7XqXfwtr58/H7lOMIHE3x/f8=;
	b=e63rv2TzD93eg6jBxdv9Daht1CQIHmsdyYwG5UiWyPq1xjNX0oKEu9RQwdYfAsxSSH
	TlRSHxN4FCBcuVFGQf0Vr2d0DvrOsTKn9z06eMpJhpfjHtu5V/WpdtJ2G7ymYHf1/KOa
	lry22jtXa+/44eMjamtEHgKcaCsLoG9sPkb30oCSumcz0WmhlrEvoxLfcoYY8vILM/yQ
	9L2zhVFfTYUS6H/wWkXVDt7hYgEAvPnmMeM3YiwgJAimKIf3cWGnf8CNimzQfFi3wv8V
	RbpTKtAzhxM+20NuSR7e7BP584LGj+N5AL8UWFeu1AVEX8MJOybJ5EW0FZr7YqcenrpL
	CLVQ==
X-Gm-Message-State: APjAAAX3m6E3jZWm0fFJlfAUyLiEOAz5im39JJYGX96Cmn3BmQHvFnlD
	9nYSIc3hyIuLYyoAwHSuAp5QZuvs1Og=
X-Google-Smtp-Source: APXvYqze7jEMOLCdEkRT8Ihwo61n2ciE7aljRoDo8k4RbBegbQ2po47rOTE/qJMa7kXdsR9/jHlFAA==
X-Received: by 2002:adf:f601:: with SMTP id t1mr36915695wrp.337.1563291978181; 
	Tue, 16 Jul 2019 08:46:18 -0700 (PDT)
Received: from localhost.localdomain
	(host165-120-157-205.range165-120.btcentralplus.com.
	[165.120.157.205]) by smtp.gmail.com with ESMTPSA id
	o6sm39537200wra.27.2019.07.16.08.46.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 08:46:17 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <jlock@vmware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jul 2019 16:45:44 +0100
Message-Id: <20190716154546.3601-1-jlock@vmware.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Joshua Lock <jlock@vmware.com>
Subject: [meta-python][PATCH 1/3] python-cffi: add missing RDEPENDS on pycparser
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
X-List-Received-Date: Tue, 16 Jul 2019 15:46:18 -0000
Content-Transfer-Encoding: 8bit

pycparser is a dependency as listed in the installation docs:
https://cffi.readthedocs.io/en/release-1.12/installation.html

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index d86306bac..818d23815 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "041c81822e9f84b1d9c401182e174996f0bae9991f33725d059b771744
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-shell \
 "
 
-- 
2.21.0


