Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECD971AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:36:47 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so219171857qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Uuo9DxP7CPRXDtFb/FzJ9jxqjX7H/cvfch8i66zGN0c=;
	b=OO8eDXmozISMKYCmIcK5qBucAlItuqaPwHhClbza4iRs9hJHFE7znk3f10/bLRx+KD
	Rhi+bShVbAWBhSYQwjNCw9s06u2S+94Zgi0+N4OMfZVMujEGnIPZiqfZzh5iVyt/3bB7
	oWpPaRlkKOw9o8uw8NKnk8o43zg4Ahzp5p8XE0jCPomkJT3us4NSZZahkYBC6+mORRFJ
	MpOjwuwUjI3DgIhIdrqkC2ZcxZE0pqz/gLhqW/DxALizaoVET3H7mHxtOePga3GbVz/l
	g1AkeK/llswzLSM0ZRgEeRf+1EREljxfuGX8u9apmiazribCNfgQ34EYEjIF6p4C+sRu
	QB5A==
X-Gm-Message-State: AKaTC00gw8LhN8EH5GulbPcU+FmpX7gVavORD79KHPwmDJX7D4tiSqy6jh8v+/VFTIss+A==
X-Received: by 10.55.166.77 with SMTP id p74mr29996008qke.113.1480531008509;
	Wed, 30 Nov 2016 10:36:48 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 5sm34048862qts.47.2016.11.30.10.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 10:36:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:36:41 -0500
Message-Id: <1480531001-26045-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ipaddress: add native and nativesdk
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
X-List-Received-Date: Wed, 30 Nov 2016 18:36:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
index 686d5fd..bfee254 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "8bbf0326719fafb1f453921ef96729fe"
 SRC_URI[sha256sum] = "3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716"
 
 inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


