Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B86A774DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:54:44 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n141so21444185qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6F0AX976fnS5uRuvrI9VcX1M8Wq4UTMcpxSQ3WxCnQM=;
	b=YmiPW6teV3HE0yEQKgMlnPTNHYmEQl47HLcd7KOtuRP7beQQNjoklNJ1xe9dDY3hXb
	qNww65ZvD4Du6ucN/O9FxNPJcZVWMpW8JAA9DhAHYD84pgSw7DPrcmUmj9on7tSGZ8Qz
	mhBf32mx1hgXOkxqJrKdz9kMOEHp4viYvxGnGJIP3vnqtLq1aaafHUQMonfzMXm4s2ps
	x9NTfb7/TXqTcTEYGDZrr35xMD69a6dLPxx68kZGcDT/b3mHNVc3S8oYs+Wfc1yGqeSt
	/XFUJ4OV/Pizmj0ZTkd9XqXOXyDaIHV9Hj9NdSAsLUg8zIFdKaxpTkxN26gwnc38IfRf
	jaBw==
X-Gm-Message-State: AMke39nGKdZrbpGATj8nS5R4/72aiq2FtD+hdq1uWdOeSnaq8CibRJnvjqnw4cqKfQ2nHw==
X-Received: by 10.55.103.10 with SMTP id b10mr15358763qkc.207.1488815686357;
	Mon, 06 Mar 2017 07:54:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d189sm3356243qka.12.2017.03.06.07.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:54:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:54:34 -0500
Message-Id: <1488815674-23600-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488815674-23600-1-git-send-email-derek@asterius.io>
References: <1488815674-23600-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python-werkzeug: set clean as broken
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
X-List-Received-Date: Mon, 06 Mar 2017 15:54:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e469bf3..e55f56d 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "455d7798ac263266dbd38d4841f7534dd35ca9c3da4a8df303f8488f38
 
 PYPI_PACKAGE = "Werkzeug"
 
+CLEANBROKEN = "1"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-difflib \
-- 
2.7.4


