Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0B860667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:14:53 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id i22so18148096ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jW9bndGFEtWIMG6ZXCglxVDLan5+Zp2HxWmlHvqXre8=;
	b=mW8CGWh1hdWyEi1w+SYMpU3wzBfaGH6CKI4Y79fmAaJTTBXRned991RA6L+nAiGxIN
	zjh7AtW4VjZPx7WIZJqcus8xZe8bXrHQjHZMcgVq+bR3N3XQPrVUUz4M1VHa2I0N85IJ
	pWuczYZSt3O2Kw8muSmWAPRm2lMVPTs/Aecp76tYT7/827PtPIL08NRONtljtZW5S4ZW
	htQeGOEHniLBYMnw4+Bdsd5lAu7E8xO1u8kKN4AKHoKKPTUy25ZizGThLBRKLI9iPe0k
	9NbGTXai9p3tJi/EGP8AoCGdQp+j3J1limePZieneX9fqg8AXLUX7K3BxYkKm/8Mc2GB
	5reA==
X-Gm-Message-State: AOPr4FWBc9WOoddG1/zEu/UOkNSjiq901ZWniVIGkmzOAxlxwNulBzlI1UHBjdyP+ifB3g==
X-Received: by 10.37.4.216 with SMTP id 207mr4337257ybe.17.1463836493987;
	Sat, 21 May 2016 06:14:53 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.70])
	by smtp.gmail.com with ESMTPSA id
	i133sm13990256ywe.4.2016.05.21.06.14.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:14:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:14:46 -0400
Message-Id: <1463836486-9491-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pip: update to version 8.1.2
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
X-List-Received-Date: Sat, 21 May 2016 13:14:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_8.1.1.bb => python-pip_8.1.2.bb}              | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_8.1.1.bb => python-pip_8.1.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python-pip_8.1.1.bb b/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-pip_8.1.1.bb
rename to meta-python/recipes-devtools/python/python-pip_8.1.2.bb
index c0c263b..18bb4ce 100644
--- a/meta-python/recipes-devtools/python/python-pip_8.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
@@ -2,8 +2,9 @@ SUMMARY = "PIP is a tool for installing and managing Python packages"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "6b86f11841e89c8241d689956ba99ed7"
-SRC_URI[sha256sum] = "3e78d3066aaeb633d185a57afdccf700aa2e660436b4af618bcb6ff0fa511798"
+SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
+SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
+PYPI_PACKAGE_HASH = "e7a87556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13"
 
 inherit pypi setuptools
 
-- 
1.9.1


