Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A6F657199A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 18:38:05 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a8so13206695qkb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 10:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XqEIytAGboImlH5NH+kgZsa6NDGbnZ2fZiQSIN+ZdCo=;
	b=PRaOTBlO2o8HsWTgQKfigYn0kt+n1mY7V5SlElhADzLjH0EDDXt+/HiMus4jPqZTcE
	W6jFKr6Grn9myvTb3/Y5IePL3unc9PjUQScgvJ+4JzvYaTWshQz28r6kz9TfwFNzG5NI
	qL7y1CQ8dzmeBcOJHtCOCffY8V1ggnwY7uHzbFVPP/niRBVReQvG918HyluL3OdV6LYp
	6RFWKzoX3oa/TIXj9pKSe/qXlo6oYFXvn3JA7wfi+lkx4Flr+yKtoz5QCuixtH4gqW3u
	zomDK3/IWgE0OKgFeKZS7CMskGQ9MsMJ2H8OsYy19RhUG+yuDfumGm9HCacyDPB0idt4
	Lcuw==
X-Gm-Message-State: AKGB3mIdl0xg0PJLLWbyjHI3+MMYAtBIKqRK9dgLCSntTmC9cccaUeHP
	+0I9uNywxbpfgrtvaQo8YvMI9+LD
X-Google-Smtp-Source: ACJfBotReWEYcLMsQ6BoeJUzbXrthsyDlZCHyiGbZNbjAQyTjWts2s4D537/E5nPzauCjo+xEOOATw==
X-Received: by 10.55.47.70 with SMTP id v67mr8003704qkh.16.1514486286358;
	Thu, 28 Dec 2017 10:38:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q15sm13195600qkj.31.2017.12.28.10.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 10:38:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 13:38:00 -0500
Message-Id: <1514486280-5718-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update RDEPENDS to include datetime
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
X-List-Received-Date: Thu, 28 Dec 2017 18:38:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 4b38aea..1fab2cc 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -11,6 +11,8 @@ PACKAGES =. "${PN}-test "
 
 RPROVIDES_${PN} += "zope-interfaces"
 
+RDEPENDS_${PN}_class-target += "${PYTHON_PN}-datetime"
+
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
 FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-- 
2.7.4


