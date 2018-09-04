Return-Path: <tomjoseph83@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7730475392
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 11:07:08 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 7-v6so1509600pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ulRGllf/IE7NdobOE0uBSF6SP0/V2GxGiu2a8A7R8x0=;
	b=iIiMNiSjuwVgzGGhRWYbHqF+I3SAGyFloj0mlHW3zHNisuqEwutczNQUkjbAm5sHFC
	MIAz8STQ7bmmGCpbuy4xkJLZ6GKFTdmuwJnQDqgPlIbqZMDTlrM/cyAxSIi81Z4NttjU
	ilYijpncsmDJAlu3yQCGnhrS27a0v/863Bgvc6dwjsyxB09QmUaS/sExTIG/p7kCTM1J
	f4NvD+FqPHUIOwgzIArBKFOZc4wAH6a5eWQY++u+NSW04QU1S/xIpUCJrv/jEMWXZ5bK
	gOHXXK80NwK/bbcgwrt5t32xIQr3VvcsGDC/DrnNyH3puxjTsPbaaKaUNCPZTuJ1/L4o
	h/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ulRGllf/IE7NdobOE0uBSF6SP0/V2GxGiu2a8A7R8x0=;
	b=eeoGY2tshble6jY+IZVBsyTlimGMUMm10J447BsnvIfzWDL5N+NOIbkMu16tfSCptY
	I225N1d+t3K78hi5OHIkDba0aNJEGBU5GxCmFkjswz3zWSIVjt1E1DydnxXvM/jEfFis
	sN33e/4UfrrvIdfvWhppex/b/MUTSPa4mvbMRLJ37hCUmCkGpNj5NnUk190GxDHEliYB
	45589VefrrMdJ7ftPrcTviUVVEz7m+ECYwp9FpbEQwIzjV97P8hf5fyF5jkhm3IlG/nj
	0kRA0bXfSnrtbxCR9Q90cLSef0TJ1HIjnxghF7usqVOm4ZNYp420nZ5XxeDpXVGMipd0
	fXhA==
X-Gm-Message-State: APzg51AFWgZd0g/VOoPvloE6BAn7Shi5z3H4YVb41FE2O2FwxSW6jplB
	uJB6FSPPkBwzSz+mrFxvODlgGefp
X-Google-Smtp-Source: ANB0VdbjP1RljHIyFuVhOARszubYLBLAqCFc+mnr17YMaof1XDLXmpnU6yXHpDG6Lq9tB6CvO/WgAQ==
X-Received: by 2002:a63:df04:: with SMTP id
	u4-v6mr31067743pgg.434.1536059228987; 
	Tue, 04 Sep 2018 04:07:08 -0700 (PDT)
Received: from tom-VirtualBox.in.ibm.com ([125.16.236.159])
	by smtp.gmail.com with ESMTPSA id
	m25-v6sm10082932pgn.1.2018.09.04.04.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 04:07:08 -0700 (PDT)
From: Tom Joseph <tomjoseph83@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 16:35:27 +0530
Message-Id: <20180904110527.7125-1-tomjoseph83@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] PAM: Add python library pamela which supports PAM
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
X-List-Received-Date: Tue, 04 Sep 2018 11:07:08 -0000

Pamela is a python wrapper for PAM. Compared to python-pam it has
wrapper for account management apis in addition to authentication
apis.

Signed-off-by: Tom Joseph <tomjoseph83@gmail.com>
---
 .../recipes-devtools/python/pamela_0.3.0.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/pamela_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/pamela_0.3.0.bb b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
new file mode 100644
index 000000000..8071fcb04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bfb663f37eb99232bc8ccfa4ea8f1202"
+
+SRC_URI[md5sum] = "de6516118d51eb5fc97017f3b6d5c68b"
+SRC_URI[sha256sum] = "1e198446a6cdd87704aa0def7621d62e7c20b0e6068e2788b9a866a8355e5d6b"
+
+PYPI_PACKAGE = "pamela"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "libpam"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.17.1


