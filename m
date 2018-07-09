Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20CD7746E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:06:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q12-v6so15965773qtp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fzW2ojtcvQUvSiTd54VVq2pUGSbEADIbpmFl58MmeIE=;
	b=HH+fU2REScrmZ2aAiph5N0wLki/cC1p50hxdBWfVCrrwcLvcfoQMwyOJq1P8YpJirV
	kS/OuikpUwPtEutN29nvZ0jbv8hcxbCNetfPbX8OFUbWOxnbXrAz97qqpZRX8EqDx+On
	FsoN1QcaUbyS4sbdgJSUbdFzX2PEI/WJX0/WLFMSsVQH3AGeqHPcS6xTrakwOJDZaVEz
	FoiTgRe/Z5I6u+AmE4/SG4zRGoR6jlbfL0L2mpJGBjr75SZWXIj6ix+YwyEE6F0LVuXh
	bow8hpZtStfpAlPOWAek4kNNl6QCyZjiH7e9A0aOc/MbX2VwadCE/MrcpgDKw0iaIGAN
	FgWA==
X-Gm-Message-State: APt69E1rNOwUzEYBr0KY0s0MDdfuSbgKjqaQMiIg3XkVxCmo6XnPPiOL
	F2KnXpEchdaulCH7J4EmIEhvIsW/
X-Google-Smtp-Source: AAOMgpcbkwPS63ff8agYdpUfVi/7jcRhuLhDZT5QEIhmsWXqvChMtYV4p8P/HUbZLNDIV1fUyFwF5Q==
X-Received: by 2002:a0c:f58a:: with SMTP id
	k10-v6mr18313990qvm.225.1531155981624; 
	Mon, 09 Jul 2018 10:06:21 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	e63-v6sm11154435qkj.62.2018.07.09.10.06.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:06:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:06:14 -0400
Message-Id: <1531155974-11888-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.93
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
X-List-Received-Date: Mon, 09 Jul 2018 17:06:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.92.1.bb => python-pymisp_2.4.93.bb}     | 0
 .../python/{python3-pymisp_2.4.92.1.bb => python3-pymisp_2.4.93.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.92.1.bb => python-pymisp_2.4.93.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.92.1.bb => python3-pymisp_2.4.93.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index e53797a..468a801 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "7390fe6a8df25170059e32f1988d5447"
-SRC_URI[sha256sum] = "63a52b97981b0e3c0023e11ce22f097356cdc9ef7c28a3415a17a08fcd7e8984"
+SRC_URI[md5sum] = "6d549b36cbfa8c1a3323c5d6e299789e"
+SRC_URI[sha256sum] = "f4ed2000cbe1a314f1f88fd8a8eba4ad05974b351b96f1235c6e532158a39fe0"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.92.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.93.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.92.1.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.93.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.92.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.93.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.92.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.93.bb
-- 
2.7.4


