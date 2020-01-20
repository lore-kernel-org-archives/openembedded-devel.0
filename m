Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id E91CF7FCFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:53:35 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e11so243241pjt.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fDk+n9wCZiMcQyS8rgx8J9fZxA7ymGqiflmfLflJyLU=;
	b=YbKHjeJYlpSOLOo3f6oPuc/hOCay1s82piTUfwsCQZoqX24kDy3mCb9BtV2Xl9rmpZ
	khFUOhRJbvHCLWV5tDD7bT/S35YfdIX/VUZ8BVDx86B4Ql0d+7nsXr0TFE8zAoxhXqz9
	VMc2h57ImR1wkCTJ8VlUXOdw8BnNFVqJ+rHiL4kFOwbuMytUhtwmVRK6pxcj4DmBjRH0
	Z+kM3tLU6qdnPGRWCEdWXTTBYPGB3LB1ITOHB/IJeWRS502O8c2fnHHnfKny8JyY3zsu
	ZDCDVRlaZXAzMgHodv5Xvd4VhphwGiqltw/OINr1OCygUTlKJWFXnsCEf2v1GAY0yjBV
	coVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fDk+n9wCZiMcQyS8rgx8J9fZxA7ymGqiflmfLflJyLU=;
	b=DgNDL3OX1AxKzmTV1qzrXqYmerfPtK3NPmZO18Cae+vNmOzgzJDicbz9BiwrgR4rBC
	o4nI+es0sFr3Yfjb5wSKmMTyuJGVzHBMOkVuKtsO5ex+ylE/K2ASmW1dZXvGqC6OWOlI
	U/otMb4F3CidLwm/iKMlS53xD7MrGIPaGJZm6iXzW5mBX78LHckzyiuHyFVkHOYP+F9n
	oqJeRO6R7/RGY6O3ssEQz4UtyYUqqvpleJW0DTapMvosaz4vL5QQKfMGfhWq/bkNtrTj
	nsr1dOfuRtYB68Uzr2O+96UVmpm70vWBdFjWjg/cwMGDXoxHMKpIxrYy4sDcMugoG0Po
	Oe4A==
X-Gm-Message-State: APjAAAUxXaHexF1iBe7ly35yKxgOs4YDJoFiTgkbHVKiXbJsFBbNhRn4
	y225gMb+7t/bneLawYUWmfFW9O+E2/c=
X-Google-Smtp-Source: APXvYqwd0nnM2FdMaItNT6cBBPUQWGyHwndBEO34j7CbuaySpDqYaJbjTVxWW/AREpF4kKBFg07aYQ==
X-Received: by 2002:a17:90a:cf07:: with SMTP id h7mr735052pju.66.1579550016960;
	Mon, 20 Jan 2020 11:53:36 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	x65sm42189728pfb.171.2020.01.20.11.53.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 11:53:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:53:06 -0800
Message-Id: <20200120195306.10880-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120195306.10880-1-ticotimo@gmail.com>
References: <20200120195306.10880-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] python-parse: fix target RDEPENDS
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
X-List-Received-Date: Mon, 20 Jan 2020 19:53:36 -0000
Content-Transfer-Encoding: 8bit

Missing run-time dependency on:
  - python-numbers (decimal)

Move RDEPENDS to _append_class-target in case -native,-nativesdk
is desired in the future.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-parse_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-parse_1.14.0.bb b/recipes-devtools/python/python-parse_1.14.0.bb
index 6e03d4b8..1fd51163 100644
--- a/recipes-devtools/python/python-parse_1.14.0.bb
+++ b/recipes-devtools/python/python-parse_1.14.0.bb
@@ -8,7 +8,8 @@ SRC_URI[sha256sum] = "95a4f4469e37c57b5e924629ac99926f28bee7da59515dc5b8078c4c3e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS_${PN}_append_class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
     "
-- 
2.25.0


