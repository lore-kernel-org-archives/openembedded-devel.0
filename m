Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74035781DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 12:54:24 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f4so11678713qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 04:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+0uG99PPjKb+p58VGmk4feeQ379xAG3aqocfSgjhTo=;
	b=T2Hcb5XPDcaK6UqHbRI0hSGgzYhIBbEAlCIlbVsVORowHY8GqFyHPCA/lzSzDWdtKM
	/TBL0BscQMaKUXEsbHm2k7WECORrVUylhvERu4l5y2J0BMBng9akGf/FAt7gHb+51N19
	W01DEa+o3mR2py8YQSgbyycYzIba1sZkI/zMRuiSNB5wGW1DhgYfp2Umbx0UqDeYG3hD
	k0NDiCs0t3fpVFer3hxl+aib/aYzDo6mitbErJ8V9Fl0umTEMk6V6/MjLDQx4W1eRPNm
	98kkVg8D4v54s3HqIEM9GtSBMuDCSAul2AafphHDKBfBHbqXm7ax5hDnzU8swgpHH5g6
	nbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+0uG99PPjKb+p58VGmk4feeQ379xAG3aqocfSgjhTo=;
	b=ZuwV8+qrt72E6k43MFjpSQWkIH3B5iJjNU99MDQK/dkPZSDWejz/o+mzadzA4JSp9l
	a6mQbJD2C1I5xa13uuQ4gxYtL2JmmqRGNV6L3PttvOZo170LgrZ5gIl0WoBHtQUqMtKx
	mVBluY2kxyNYiCqkuTkYAYQT0oYFo2CjBAMnKZ+7tLj0WnA2d3+UVpAKI4yzyB5EPwTC
	NuhqHdKP4N1H1oVDc4U4diLCvBXA3F3qZjvmcuHKBb4RIXatROoiyFfkUMA2XOwwMZLs
	zL1MzR434PCqqSQ1iJpCMa3wH9Et7apcg8DFdiNi+ugdJn+/qWyaFAYAmz7xRqXo2M68
	ik2w==
X-Gm-Message-State: AElRT7Ee+a4R+vI862WaicOj0oldBJe4Pm3nyQT35PXowqXh7jmKMCSt
	VImgChiK84ocLax2/tlerZS7u3NQ
X-Google-Smtp-Source: AG47ELsxpHinrtB843W9lJns+tHadN9smc6Pin+kJIPgaCeVuA3MFiQl/bd1yAgctuj0GTqr/IYWaQ==
X-Received: by 10.237.54.103 with SMTP id e94mr7937503qtb.112.1519995265973;
	Fri, 02 Mar 2018 04:54:25 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	f79sm4594369qkh.20.2018.03.02.04.54.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 04:54:24 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 07:54:14 -0500
Message-Id: <20180302125414.7169-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Subject: [meta-python][PATCH v2] python-matplotlib: Change download name
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
X-List-Received-Date: Fri, 02 Mar 2018 12:54:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just having "v2.0.2.tar.gz" was causing problems with other
similarly misconfigured packages.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
index 5b1c3f05b..b7a3fcfc1 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
 DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
-SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz;downloadfilename=${BP}-${PN}.tar.gz \
            file://fix_setupext.patch \
 "
 SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
-- 
2.11.0


