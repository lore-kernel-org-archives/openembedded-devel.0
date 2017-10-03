Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61D0171A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 17:00:56 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w63so4677630qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 10:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G/peIyOY8UM1WkWIFBD+Q3OYmn0JGfGPgADw2G6GjDA=;
	b=lYRAN2Og3/MHtwQS8c9s6qAh5hu+iyt5iiNpekplLfL/SlZcivDHWzFJTW2QYsqG/J
	40GbneNjfNYWtSgUIA5BGmF0yfBx25SDuMnIPsJfsT1k8tg1CNdOD+9kU0kTdeX9+bvt
	jAZG6g3M2rPa3H+9mQvUgrH2ez2RsM2xtWw0IAdXoaZkBfc8dGT2VRxsieDIJDLk1+xr
	FyWXXKQSqYTnqI/WA3IRvGLM3NZZKldm8IIrBmVOoR1v5kSb/+6BnOXuh/sUK01tG/A6
	WtahG3BoqM+hpxUuwRJwCSWfqYtTkgQr5lHSi/JZopO7zf5wiHORpxL/sW3i7Mw9IXxc
	E5Xg==
X-Gm-Message-State: AMCzsaVuGJZIAu0bJkLLWVEJoDyS9wRqRZ9c2DtckI9bpgIBGK8pEhs6
	GSJ2SDv9nVONPLC7gu3pXN+zcPoX
X-Google-Smtp-Source: AOwi7QArhqwa143TfZRMm5uJDhwNb0oyiCJCmHnJfqlwRECYe6JrEkm+0ltYZB6PbwgrQ0FzsEb3rw==
X-Received: by 10.55.156.141 with SMTP id f135mr11349322qke.309.1507050056472; 
	Tue, 03 Oct 2017 10:00:56 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	z187sm8477900qke.0.2017.10.03.10.00.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 10:00:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 13:00:50 -0400
Message-Id: <1507050050-4458-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parse-type: update to version 0.4.2
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
X-List-Received-Date: Tue, 03 Oct 2017 17:00:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-parse-type_0.4.1.bb => python-parse-type_0.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-parse-type_0.4.1.bb => python-parse-type_0.4.2.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb
rename to meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
index 84a9901..b516c59 100644
--- a/meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
@@ -3,8 +3,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
 PYPI_PACKAGE = "parse_type"
 
-SRC_URI[md5sum] = "3697afc1b29f2857f6c7dc9590f25ce1"
-SRC_URI[sha256sum] = "9a624f3b51604423f5de5321da11b0ae73f368b2a3cb4b383a6cf84ca4e4d495"
+SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
+SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
 
 RDEPENDS_${PN} += "python-parse"
 
-- 
2.7.4


