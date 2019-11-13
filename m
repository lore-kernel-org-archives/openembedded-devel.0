Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1115B7CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:09:56 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id z23so1428633qkj.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=sppZ3RLIxhm+qwnYViwEN3TusJOP4JTzgdbqdfqhbf8=;
	b=uFKTf7PGfw/TCScMgrLrmE1WrZQf6xq+DVGFhk17TXykijAfejBcYDOdAYyXX4cEHv
	PIwTHVNaFajrQ8UwUwrSC7Q6x3HoQ+e7Vnviht8GfsHL3ElLLfHy8g+YP2OzdmGOE5kp
	yLMqzT/hBWYOjAvFkdrKleTQJ8GjsGH8DFL5ilFUhWgKmHrxc9nPEhHiOFyvybX33CNc
	AqCodpU8Xnym87aLoFjvPhWG0SHz4RHZPXgpZ89VogJLxdmEOHgstNU3TvE+HnAJUObL
	uXMhLeHOyCDOGR/70/iMUh4pPJKTW+zR0xEceQjM8JBuhtzfcnJ9GIC6bzHh/7I5vPu4
	XD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=sppZ3RLIxhm+qwnYViwEN3TusJOP4JTzgdbqdfqhbf8=;
	b=VX5UE5JvHxWms7asY8y216mT+gosU28/cldpyIBLrqDSApCTqus/XLOpc548zBrIFf
	MmN0CPRKeqMfuDrLuy3idiMsNyNHQ33lBPI/nO4REOFzEiUFnkyD9pyYg79toUdkzV21
	uFz4ZxZo1x1k8zDAsQYI2O0nwON1Aqn8Ne1V6o5UXPY1EYaTAxy8Rxjj/s/mus87gsY/
	IZXfjr88P8iyCNQGt/Ena6sr282acHoDJ2O7IxGzlPP7vbRPv1X38NGElVq9d4dDxSFV
	jK7HGOoK4WYGQ0STNlrvCvS3ItVab3/jtGo4pZfLCgxV8cZAChzqeP069GqDmDTE67rq
	UyVA==
X-Gm-Message-State: APjAAAWZeZ+dHBkNM3WBwHr+OTlJ0BCwEHYeaVAFiefKgRUGmGFIRK3J
	bhBk2zX7doLmcdeDltCm/Txn7VJCq/2PNw==
X-Google-Smtp-Source: APXvYqymQzPCwQ78FvVwTQnt+PkNmgHX8OY4hCQvWoy98QpW6SDf8UyA/gDhL1hFttKNz/WTgYE3pA==
X-Received: by 2002:a37:a9cc:: with SMTP id s195mr1924166qke.428.1573646997134;
	Wed, 13 Nov 2019 04:09:57 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	a137sm830252qkg.75.2019.11.13.04.09.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:09:56 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 09:09:40 -0300
Message-Id: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 1/5] python-importlib-metadata: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 13 Nov 2019 12:09:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-importlib-metadata.inc       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
index 9eb5da954..a53537aa7 100644
--- a/meta-python/recipes-devtools/python/python-importlib-metadata.inc
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "aa18d7378b00b40847790e7c27e11673d7fed219354109d0e7b9e5b25d
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


