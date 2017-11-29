Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB79F6093D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 20:58:31 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id e2so6180667qti.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0CiYKV5+QmrPEXjh/44ZDhUXjksMQMA+hlMdRCbk8qc=;
	b=ax7/NJdFIm9MEq8WyuNkeB5N6po+oXp5PksWfgHyPUXgf5V9iWjorErXAJsD2mGS7M
	IQCbpoXuVR5SysAC7Ij0CDEfuOMDu3GmyLE5o5BMjZk9DmMzqMTPfSchw+NgaEzgsLGG
	4DKtCmhLxOaEU4zGwrCA9JCsFt1qv6nZBF3P693uvMfNhDdi0dJ4JiZVtWfckDij5DCB
	9GcqHkIfppTfVY/dqh3q/k/GUuZ+y+umg+fLXiBgWJiLTxp1VVBkzFCd724hMoG5nkWg
	jjX0Si/RgbOWZwP92CCiHAj6s3IO/RSmW66UcA5MrHaV4lS//+nSyJaSr0Sw/f+T6SuY
	jD4w==
X-Gm-Message-State: AKGB3mLhhGr6vF6f39Te3oAVlel6U5LSX0T2fCiLPWMBKWyTuIuMasxz
	PQ85elPZPErmPsJqp4pipKfWuS78
X-Google-Smtp-Source: AGs4zMbJDVbTKp1INgvoa/pUs1jUZK3YkIMiEnpbM1y84f+/JIOrJA+vam3HVHgr7HDv6P9vru1z+Q==
X-Received: by 10.200.34.112 with SMTP id p45mr303835qtp.240.1511989112463;
	Wed, 29 Nov 2017 12:58:32 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o26sm1927146qto.16.2017.11.29.12.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 12:58:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 15:58:25 -0500
Message-Id: <1511989105-20274-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 20:58:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index edde79e..486a4e9 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -7,3 +7,8 @@ SRC_URI[md5sum] = "4314f784ca3174d91956da9828248960"
 SRC_URI[sha256sum] = "c78f53e32d7cf36d8597c8a2c7e3c0ad210f97b9509e152e4c37fa80869f823c"
 
 inherit pypi
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-subprocess \
+"    
-- 
2.7.4


