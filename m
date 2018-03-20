Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B949F6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:20:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w6so1546421qkb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PX2omWs29V6DchMo0JgAjjXxQDjo238wYNF40Wh270Q=;
	b=i4DwyJz2tMfEfLuRXR7T1xyfq57RAag86lKdz6ZIIrbXQpNm6pjNL8GR0u0C2W9pnn
	Cwv9pipcSYhjz632ub1uLPgUJ7DA1CtNtjoD8FVPkevjBUYpA0ECiTmcjs8pSHkkML/h
	12RJY1TbpBHHpCIeWUUoHWotdJsZcSdsIooy8OD12aCZXV51NTWcQ9HBVL5jt3VWVPw3
	FLIZumdDXBjkUHuTDkCuz3XBradUjln/iXrVnDUBnFOKUWmEjM66c9OVxn50Vbmx6m3J
	/Ed+bi3aKdMMGWfl44apZR9DEwUaTClmWLGq6JJcQpk/yARLQHwSmEeqsHBfeXwHS33v
	uuZA==
X-Gm-Message-State: AElRT7GCOhHhcD3CTOZjzQfgM7tNj11H6T8Awb6R8yiubqcqGiIZcmEg
	G7WNWiHtDZO1Kr/AGIlnElWYZNLX
X-Google-Smtp-Source: AG47ELtBtZ2PnN3j3rde2A4w9oCawO+nrAZLZE3p0NfRRBRDg1ohb4hcCpsOEIw9+QeSL4M/M86O1Q==
X-Received: by 10.55.18.226 with SMTP id 95mr23295952qks.282.1521552035065;
	Tue, 20 Mar 2018 06:20:35 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	i82sm1628465qke.44.2018.03.20.06.20.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:20:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:20:27 -0400
Message-Id: <1521552027-7569-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ndg-httpsclient: add initial set of RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:20:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index b556432..d743023 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -13,6 +13,13 @@ DEPENDS += " \
     ${PYTHON_PN}-pyasn1 \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pyasn1 \
+"
+
 BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_REGEX = ""
-- 
2.7.4


