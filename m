Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49E707888D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:14:57 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j4so15488337qth.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JNpJLTJAuVBS8dpSFRIYdEzihB375pErunlCzVdRC7Q=;
	b=eaSFP7lUag/63+7pteTFIHmJBeg1p318jIJ9yqLkbUZC4Riz4V3gSPVc/GEGoT7mnV
	euLS50WxpgegKkJBioY+KLN1lVD+/vlM5WqLy24RvyQOxAvvcEHthOxi8EytFw2+QYkY
	PPxb1Da0JYUKiPvwP/DEAOszqiaQ4vtg5Reh+CyDGCLauPd75zooEgOiuGUFP/q3PkTb
	EfbfJruBLH3P1JG4Maq42zNEcia2xh/o7sZCFH2hkyN8WiqBIBQtl0QqhNgH5+evOH5o
	FhW57tJlr96OsJCCqOGxxSnqO6SKu4qo3vClXNK0eGjvxEbyv4GCZPOmChb7TGc5q3NO
	at5g==
X-Gm-Message-State: AElRT7FoH48Km5MigF1TBMcCkjkdrs6//qbqnkruEVw8nIQj/2LUYNbN
	fWwu2Dcqb6BfaKw8mZ+3sHVTC0Z1
X-Google-Smtp-Source: AG47ELvXmphM9Cz2tA1QHFwQvRc44PxfFeHWEtb8Xw0eHCIIsjp25BNXvIzm/mKo27fDNlciYhYflA==
X-Received: by 10.200.40.219 with SMTP id j27mr12968371qtj.331.1521382498957; 
	Sun, 18 Mar 2018 07:14:58 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s186sm8207143qkf.70.2018.03.18.07.14.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:14:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:14:52 -0400
Message-Id: <1521382492-24677-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pip: update to version 9.0.2
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
X-List-Received-Date: Sun, 18 Mar 2018 14:14:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pip_9.0.1.bb
rename to meta-python/recipes-devtools/python/python-pip_9.0.2.bb
index 5ddd8d5..fa709a1 100644
--- a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
-SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
+SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
+SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
 
 inherit pypi setuptools
 
-- 
2.7.4


