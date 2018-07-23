Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3F775062
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:58:21 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id f6-v6so272988plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qxA/wJMDdwmBCQXhFS5tOKQCE6+AiS3+bqDA1NUdz50=;
	b=FDTxSvfgkHqbwrqNlX0hzi1ruRJvhYhjbZmTfkyFRaEO0dZlIBuSnR6XtbHkMmyjr/
	Rkee8OF7b7Qc81J68kOEAszWcu4EFhC7GFDer3qI/5JPpTovILcLpRSrYSaxJeK4T/VS
	RH+rbPlPpsJ1tC45H1XRstVyco77ns6TtAYPY1cPvhZ7PcEb1aN7D42CMnlAuYT9tqFy
	S4aZCWZ90CB0O4BCKEloprcxJRMo//XdZUx2gT7VTMXro55codvrxrJqO8qveTzIn9Gh
	OTQekeiruOj2E6hi7ewXjAxblCH1/DbKrn7737UAkgXznAhf9SAo7BHIzZgBTBsAw0Ff
	Q3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qxA/wJMDdwmBCQXhFS5tOKQCE6+AiS3+bqDA1NUdz50=;
	b=Ucvi0RiLUsqupmM59df60kAHxnewqZwRu5cXJc95MokJqwoJgbqNfFpuynZF7NKAWo
	49OX6MfgTWKNgiKjcsjXsGJ0J3f5c/JP09ZIBh7LNCMGtsB8kMklit1HCJ+WjWhPFfim
	glt0j8eeXLFo6Sy3dk+cQyg8XMc+luEt392U//Q2/vrvUfsnBikyLjAevJyFIfDI/PCP
	SYUOQLgurWGalO19fXNBNnV2Ur57nNvxEc3gu3rhVoJTPzOo6IdCdQBiH7HZ/8L0/fCP
	HWbSD6ITIx05/fohXvjAkJ8eS5vbyqyWEsukrNvZbGBlxxlnmc64AqsZ0Y0xF4opafOX
	0AMA==
X-Gm-Message-State: AOUpUlHZxT7AeoVPgnCa90KpuNyJZ/Nz1Lxg+C9zRFJDx8P/By2ZzAlA
	FoRkD4O8+z3VSJd97r1bMmp7KGSksQ==
X-Google-Smtp-Source: AAOMgpfN9JI4cSCa0Sf8fqudUR+vma13rfkE1c+QZ6OJaCtsltA3l95BVFXChyzrF/llDW2ai5k/PQ==
X-Received: by 2002:a17:902:bf06:: with SMTP id
	bi6-v6mr7212371plb.76.1532354302292; 
	Mon, 23 Jul 2018 06:58:22 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	j5-v6sm2895496pff.139.2018.07.23.06.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:58:21 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:40:08 +0800
Message-Id: <20180723134014.4815-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe] [PATCH 1/7] python-isort: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:58:21 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-isort.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
index 6d13e5f7c..359b18012 100644
--- a/meta-python/recipes-devtools/python/python-isort.inc
+++ b/meta-python/recipes-devtools/python/python-isort.inc
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


