Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE70070101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:48:24 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o187so21279358qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hnT4s4XGav21hiRijj+/qP3WXQTdstzUx6nC1+BNJfQ=;
	b=o3uqDmaoUnoxeYxVmYslQiBjs5RiwYNP6csxZXh/51jCYkf/7mnCByyYXAJQjxAVI8
	xcUSTFA1T9lfIQQeKXPv8phWpiHHI0ZeQmJvNswRLLuN4MYkYbC8x3RHEnLg4R7KU4Sv
	JZM643ZGtHwOcpqwM4vm/fVThsiZOpF6Q+4dCd3OfLl40RWakVyuhgvFpIExme1ZqsVl
	j+omURqVTFt6mKUT1cT/5sICO/huK+Rx8k5Zl9Kl5/KltaSdwo2Bx03mtjCyHPf+tzUf
	NHyI349gmWvB5f0VgHNev1Co62cATqQS3pRCfAes4oRjs3wbcwK+nIPQHBWo/+fuxMMn
	hjHg==
X-Gm-Message-State: AMCzsaXwCFPX8dvg8LhVOOgSjnpduZNdNceVf8zrEy70k/cPg5Wf0JiO
	BckmBjOrHL/OEV44vbkk819Q10sd
X-Google-Smtp-Source: ABhQp+QRzkvvZAXFJyFjcnKEM8jE41JE5zev5VQf3Tokd3/XQ8n91lNXkirOoZUOBGixrpqI5Mm8yQ==
X-Received: by 10.55.99.10 with SMTP id x10mr3843514qkb.112.1509468505430;
	Tue, 31 Oct 2017 09:48:25 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t18sm1163030qtc.58.2017.10.31.09.48.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Oct 2017 09:48:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 12:48:17 -0400
Message-Id: <1509468497-30801-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysmi: update recipe to use pypi
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
X-List-Received-Date: Tue, 31 Oct 2017 16:48:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
index aa234dd..33a387a 100644
--- a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
@@ -8,15 +8,9 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
 
-SRCNAME = "pysmi"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "f8754e9ed75698cc16b40f125df85b12"
 SRC_URI[sha256sum] = "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "python-ply"
-- 
2.7.4


