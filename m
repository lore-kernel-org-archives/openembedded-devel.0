Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0F0771A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:30 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y89so110518229qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BOl0akLcYJNOqiWqDQxo/w+sN3ht7VdV8bV7exM3Wns=;
	b=e3J5NMMaIrz2Lw7TwDkAhFctoF7o5/SHGzw0W8CXYeHMoQjI8qvphnM5hjoU/rRlPM
	gFStFfb1bppTEU+1Y69+Ho+sWnt4/12wRRtJX9RpyLOWbx9XkbsD/ZxIRKIzCWx8ywty
	bSqAxSK8SdYqvKtSbi6QJg0WWhqOX7t6qt3w9D6vhdmhMmHmoWMxiK5pfL2z/DwZSvvN
	F6ldNSkxmJ6xHZgKFAKKk/9RDCZ8XGr+VPL/JXzT+4iOLzzBtZCDnbAyx9QJiT7hOnen
	mQdVCyAECnGl2I89i37cQIqnxpaGNkfbMXK8Snigid/1w5hbd99We9h1sFkjsOoObQz2
	qc2Q==
X-Gm-Message-State: AG10YOS8quWS+GwiVKwMefL9e65qaelJcz6S162R4O151s+Y+Cx7sOFtInH1Fdnb5rjbfQ==
X-Received: by 10.140.104.34 with SMTP id z31mr34418095qge.90.1456148131330;
	Mon, 22 Feb 2016 05:35:31 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:34:57 -0500
Message-Id: <1456148105-9644-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 03/11] python-enum34: update to 1.1.2
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-enum34_1.0.4.bb => python-enum34_1.1.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-enum34_1.0.4.bb => python-enum34_1.1.2.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
rename to meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
index 3227c10..5083bda 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "backport of Python 3.4's enum package"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
 
-SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
-SRC_URI[sha256sum] = "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
+SRC_URI[md5sum] = "025bb71b3f9d2fad15d0ee53e48dc873"
+SRC_URI[sha256sum] = "2475d7fcddf5951e92ff546972758802de5260bf409319a9f1934e6bbc8b1dc7"
 
 inherit pypi setuptools
-- 
1.9.1


