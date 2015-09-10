Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8C8A6E26B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:01:19 +0000 (UTC)
Received: by ykdu9 with SMTP id u9so66823951ykd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pKSEZWhaPebF4VOhFTmLPaed7rS5+ZDCkxG6Ib9XUx4=;
	b=N7v9eKTqQs0VWFASyU2mQ81VS0MJbTOtQ0A8jTs48azKbidmi8bUPFd0hV+ZKAQ7YL
	LR3T6dp9SGzdtfgFTk5OmnLDFCFg59Ft+Nrt24MGdMMebmWE6+Aehx9Ei6gae8l7cjfP
	IKjYotavE+6UKaPNII3YPzl/3EjKj5VTG/tUDOPjXkSrjQ3uqA1PeJ80gXxos9BEcO2P
	MBe/7V96J+AOCsUeubqMDi6cvmuncOIpbAx8o0W10a0U3vIVazuFWyH2R1EWZNRGUIvo
	gPj4b+qpgMhxmq+KjWOAR24pXMmv6vDy+zLkLjltLWirzMrlnzelL2GXpsFUiza3hqj0
	f1yA==
X-Gm-Message-State: ALoCoQkvOjproIahSKRpSExo2ZvgrehCMLCEZJwbJ+ECcYxDDVfUB/cSydU+miHeQTRgQdXUwLk9
X-Received: by 10.13.217.129 with SMTP id b123mr47929034ywe.127.1441908079686; 
	Thu, 10 Sep 2015 11:01:19 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	d136sm10089400ywb.53.2015.09.10.11.01.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 11:01:19 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2015 15:01:03 -0300
Message-Id: <1441908063-29340-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441908063-29340-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1441908063-29340-1-git-send-email-fabio.berton@ossystems.com.br>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH v2 2/2] python-cffi: Upgrade to version 1.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 18:01:19 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/{python-cffi_0.9.2.bb => python-cffi_1.2.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_0.9.2.bb => python-cffi_1.2.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb b/meta-python/recipes-devtools/python/python-cffi_1.2.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.2.1.bb
index 90d8099..0d0958c 100644
--- a/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.2.1.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "b1bf4625ae07a8a932f2f1a2eb200c54"
-SRC_URI[sha256sum] = "1988ce7ff9c64ecd5077776175e90fd8f0a8c827cb241a23647175ce08126bb2"
+SRC_URI[md5sum] = "faca1e420e80433db409bb1bdd0a3f45"
+SRC_URI[sha256sum] = "eab571deb0a152e2f53c404c08a94870a131526896cad08cd43bf86ce3771e3d"
 
 inherit pypi
 
-- 
2.1.4


