Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 222AC6025E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 22:20:37 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id u184so6512524qkd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AQroJOfa/ofNEtkbRXOmAF6A4MRuz0XvGf/Nj+vpiRE=;
	b=kxgpo2HI5n079FinkomTFqpqtHbkrmyCwlA0thHKfQ2HF/3ibXnkFRXLiow6pm2Ss1
	qy4JN29SHwtRR57jwFK0gh4JapM7oKRz2Qjul65uEWYmpQ7NBwEamXQDulRF+lWdpjXe
	qeanylvFtYyxTz1VePnpZQVILx5zhIOPYx9222EJANHaayarzRT1gj+p14g7r9aMAFN8
	mrMJnCZRBYQc1JZ5vySdZdtGMMonSh8gNRnFiRgi9hdS8zTCHwl9ADwmwunWz70/lAx1
	shVj0iX9t9DCFkvbqrbPqpVK5Hz2eRwyKwxApcRZ8oEUPj8Kcu8JHJ/TLRyCIGB8+HYq
	gkkA==
X-Gm-Message-State: AKGB3mKxVRAYotPihegljhhphd/dRXcb09FmOAS7L1mPLFCfFo0I5kIv
	K9nHd4Uz9u0bhYPB9LihYbV9nFMQ
X-Google-Smtp-Source: AGs4zMZxmhl7jLcNgRI7k92wJm9XEx6Wo/lw/0eHoGcoOW5qPh7W0TLvguU++vpzVXKxkrbYILI+7g==
X-Received: by 10.55.119.197 with SMTP id s188mr578890qkc.233.1511994038746;
	Wed, 29 Nov 2017 14:20:38 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v82sm1918286qka.44.2017.11.29.14.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 14:20:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 17:20:30 -0500
Message-Id: <1511994030-18446-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 22:20:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 5e6ca3d..6d8c05d 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -13,8 +13,14 @@ inherit pypi
 CLEANBROKEN = "1"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
 "
-- 
2.7.4


