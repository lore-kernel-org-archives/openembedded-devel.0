Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id A030C77E44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:28 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id k67so145648694wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4JiuxajDExfYf+V77tBA178pbDUVlz+ZZoig/PLp+dg=;
	b=bh4aTJUMkpk0bBE7bk6x9UGeJAjdc+AQnnCvm+22Ik5MV6YSWe4a2D5cVia1dq0KtS
	KfkT4QEI/qgxwoQ+YujNx4WS7cWXA/bsIAVjicWOJJJGBJDm0CCvyX1Nrl2G8+dUjVIZ
	pa232qsLLpL45wLpaE884ojMDQEahzLLrPZCRVNiEDxa2+NutpVZFTi2LlmTBJ9sNpSU
	bTYBnKo+yQJg6ggu3UKJtFZWD/x5bNWLZFSONhRItLY6PA928enSKzV7uTRTNcvmckI/
	ISJJlhEqZn1JcppnMGXl36jIH3mhCW5I/mzNZYkEqOP8FEFaF8h4rJ3aXn1d0psYwmr4
	Y73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4JiuxajDExfYf+V77tBA178pbDUVlz+ZZoig/PLp+dg=;
	b=Twf8v3ERc+UbwGIRqhcciOEtMgllm0XUkENpD5Mgg5/9Si8Y/JB70DFiGDRzRGyhLR
	8oaIZiet+Uz7gX9kedmcviKL4crjbeZjCYwmBnXr5W8sK+0ySpQNeW2fykuqP982Zzmz
	ydm2K4/M1Nlf+aKhdMveZCZ4XhV/HQhtJcRdeRTeN7KilX/LQB+04NODlVrW4L+aVDI/
	R0GOiD7ZCkuNC77iFGma/6kCJ7tuQF2yij+/RN1rTxSODY2j+9iC3MrJ0NcQV3HjOGA4
	EuIlGeRY7RyKd8YCvCJeV2nCtgcTRWDVf5LEw2G77K3EglAXVzsUXks09m3oVj8mRyW1
	6XHQ==
X-Gm-Message-State: AKS2vOy/k+eHE9Oxgv2Ki7bdVkQjI6TbD+NUX2ORv5oo5tr50eI61GUv
	VTneo+21Y/PR9RnN5no=
X-Received: by 10.223.176.253 with SMTP id j58mr13386052wra.65.1498489889044; 
	Mon, 26 Jun 2017 08:11:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:10 +0100
Message-Id: <20170626151117.6221-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/8] meson: revert changes which shouldn't have been submitted
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:29 -0000

From Adam Foltzer:

  Apologies, this line was inadvertently committed. It was a fix I tried before
  learning that adding TARGET_CC_ARCH was the solution to linking the wrong
  ld.so.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 2c48a7eb9..cc9bc505b 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -75,7 +75,7 @@ endian = '${MESON_HOST_ENDIAN}'
 [target_machine]
 system = '${TARGET_OS}'
 cpu_family = '${TARGET_ARCH}'
-cpu = '${TUNE_PKGARCH}'
+cpu = '${TARGET_ARCH}'
 endian = '${MESON_TARGET_ENDIAN}'
 EOF
 }
-- 
2.11.0


