Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3B8A601A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 13:18:12 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 82so12691714qko.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=plEi4MzUAkMjP+Gtre8NlB3dxAgBHBef9T8uDsLbank=;
	b=a9p8DQFjpfMYzAeNh7rByalouuZ+VPAZK8U5pEJgXyY1sobM//3uSIb8bGKVMdJhOR
	9L/SiRNnaywLtXc8B8XS2BCwslyfJniOEZ3e4KUWx1Ws6NcXceWEiXe3f5sIBA01RmIi
	DXeQxdq7+PcLLivCSmmMFHRyrGymnN2CmQcC7fBOh9adYWMYMAZwWp9r77AwTYwHIbsH
	IkDRznF9FuRyCE6yc45jlIu7f9ZgcXgPEmG/72rKQkWbroO6dSxRhaPA9nw2tJn3njmu
	JGVdrqvbmIVoPs2bdrvHMWkOzELWTRAGo1TmTjLl2E5NMbfr6EIvRG6Wca5Ow3c5x9mV
	rrhQ==
X-Gm-Message-State: ALyK8tIbUuV5xkyU9XQyR0k4HQESQtfdNrDhBieE0SHw2LTc/2FhnIXbNC2ouCCGc5FB6g==
X-Received: by 10.55.186.193 with SMTP id k184mr14402666qkf.184.1468070292806; 
	Sat, 09 Jul 2016 06:18:12 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id z64sm347758qkb.3.2016.07.09.06.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 06:18:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jul 2016 09:18:00 -0400
Message-Id: <1468070280-31432-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468070280-31432-1-git-send-email-derek@asterius.io>
References: <1468070280-31432-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-xlrd: add RDEPENDS to allow module import with a minimal python install
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
X-List-Received-Date: Sat, 09 Jul 2016 13:18:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-xlrd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index a0dfb40..a8fe8c7 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -8,3 +8,5 @@ LIC_FILES_CHKSUM = "file://xlrd/licences.py;md5=b59dace5cc1db604c4219100b0422811
 
 SRC_URI[md5sum] = "9a91b688cd4945477ac28187a54f9a3b"
 SRC_URI[sha256sum] = "0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
-- 
1.9.1


