Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABDD577168
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:42:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x189so4952313qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uxh2/1lL/srbpE8xLP6dsA/W1DkneDrHAaLCJWwORnM=;
	b=FmEpWTHlDBqE8xeLurLFet3gotmAJj0A2e29HjdbkW/ZvaGXOX0RuZVnAsyAMyXgd3
	mbXPdSFmhbKjtIqajw75H3TqdYPD24eB8as6RwAD4e0gfCNhCrXJLbfkqK7+k3prBGUn
	6SM6zR3vKycX8jIur30scoCQY65QUiCb3RGcpt43SF4O5xwoYhiZSWHbepaubfOmhb9I
	BCq3YRMp6q9ynLHEOUldx0jEAsTPyBExj6HJSOt8e9LUe/GsEHW5i/ddGg+Dx+EdglZC
	wQyZGQit/sTbJURcY64SUiIO81QQH5Q/JUOkPASxcyLNQCeeyGIv3VtzRUpCMzVSSkj9
	gB1w==
X-Gm-Message-State: AEkoousg7Ihf8MYcxhDBHfEJQ+u9ZJFWznKcTiSPUfUySDD2rhuz3x893RsasGaYivLtag==
X-Received: by 10.55.99.195 with SMTP id x186mr33487843qkb.26.1471290161875;
	Mon, 15 Aug 2016 12:42:41 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	r29sm13157430qte.48.2016.08.15.12.42.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:42:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:42:33 -0400
Message-Id: <1471290153-4504-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471290153-4504-1-git-send-email-derek@asterius.io>
References: <1471290153-4504-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-monotonic: fix RDEPENDS for minimal python install
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
X-List-Received-Date: Mon, 15 Aug 2016 19:42:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-monotonic_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.2.bb b/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
index 66183ef..e5c88b1 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "c0e1ceca563ca6bb30b0fb047ee1002503ae6ad3585fc9c6af37a8f77e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-re"
+RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
-- 
2.7.4


