Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id D71297319C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:49:08 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id y89so8622436qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=frXq7v9ILHV2E5tO0cbsj2/pHNacoia7n7ibT+sMbgo=;
	b=A6qMQEh0GcWDQHnzxZBwCsiDn/4Xd/O714XtUFIuJv5BXhFaLpj8R6CbXLYKmNaME5
	l1FpDEWz3+T5vAec+MCoSQHZFdtVINCoyMYu7HTX9YZXBwezaaRwnjXzUWpfPO2/GCMf
	9InWgdaYoKUs/moNFhXaIc3dvTYirJ4eCikSOKgWYojeY1b8+6hnecHQG+on/o9sm87t
	MIEzUTfvjsTrl5FdEZUimn6PhCkIgcvGmFt1glp5n7ELcdS1DhqfisHwU2YbfibLD97C
	Rk6SAW/LPogB+lzY5rBzBCAz2n+o2zyS5PV5bWfOGk4L9TUGYTZL8zf7G5ELoODOYOQm
	il1g==
X-Gm-Message-State: AD7BkJIu8LlTfiaCeUXoI/5qyU6xP/Za9ENP77ENolg1Virw40D0BMcQZ/InnCw7ku5WQg==
X-Received: by 10.140.104.19 with SMTP id z19mr23895619qge.68.1459000149232;
	Sat, 26 Mar 2016 06:49:09 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id w1sm7696536qha.3.2016.03.26.06.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:49:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:49:03 -0400
Message-Id: <1459000143-5306-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459000143-5306-1-git-send-email-derek@asterius.io>
References: <1459000143-5306-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 2/2] python-futures: update to version 3.0.5
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
X-List-Received-Date: Sat, 26 Mar 2016 13:49:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-futures_2.1.5.bb => python-futures_3.0.5.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-futures_2.1.5.bb => python-futures_3.0.5.bb} (62%)

diff --git a/meta-oe/recipes-devtools/python/python-futures_2.1.5.bb b/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
similarity index 62%
rename from meta-oe/recipes-devtools/python/python-futures_2.1.5.bb
rename to meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
index 817a917..3eb1882 100644
--- a/meta-oe/recipes-devtools/python/python-futures_2.1.5.bb
+++ b/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e96d16356742ac95c07be571717e51a3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3d78c5bb15ac641d34f2ddc3bd7f51fa"
 HOMEPAGE = "http://code.google.com/p/pythonfutures"
 DEPENDS = "python"
 
 SRC_URI = "https://pypi.python.org/packages/source/f/futures/futures-${PV}.tar.gz"
-SRC_URI[md5sum] = "2fc924890ccd30a5fe676fa9bbcf0ab8"
-SRC_URI[sha256sum] = "8f5a627d3aee94cc1859a942965fdebb714be8cdd2366d819cb8fb9b7cc628a6"
+SRC_URI[md5sum] = "ced2c365e518242512d7a398b515ff95"
+SRC_URI[sha256sum] = "0542525145d5afc984c88f914a0c85c77527f65946617edb5274f72406f981df"
 
 S = "${WORKDIR}/futures-${PV}"
 
-- 
1.9.1


