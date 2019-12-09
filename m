Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA2267FC38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 21:43:15 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id s10so6352603plp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 13:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n66HVtkaqp3sRsPPaTiwIk5t7z4TqBMHUvd/RFx0ImY=;
	b=Op7F4F0w6Wgs+X4BkZznfIWlYs4+Kc0CNa3UyC1n6fQ7Uqabv8HnwRWT0UJMvJ4KZy
	hZS8c8v+epMa8DbaXYSo2t5qbLjb+pRAD3w+AISHkjPziuSamGdHXcVSPTOnJEgrbaK6
	eW2JJ7styEtboYP0sB8CtxmTrc/lIJuhUilSQN4RK053Yq3y4NSYKqPqbYDKvKwUt+7q
	0KfnsusHsxKPCR20nG+3vN78Ey1UvOZkjnAbeNjxt0sDMSDK7W+ZwNc2HGGrHp5vvAoM
	zSIgtevSX9i9gde35aST78huFHXj2h9RyNb01jgJtqr45sbXHrNp4TPUB+Lw41qS/8PZ
	dpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n66HVtkaqp3sRsPPaTiwIk5t7z4TqBMHUvd/RFx0ImY=;
	b=a05D8dfRnV13zXkk1xXSyHZhCbad/JYj9ahl97ETPNjqq9gNFeVopSjuF1VRX/pw5h
	yj+GnxzZdLXBWFLRvPtQ2DAFGPWiAku50SPLiC3qOHdhEsFabee25+POxPQx51DlkfKu
	JscEo9kD1G4X0QvEyTAkfz74/GG64z/Jug6kWdRNJb97SBeXCJ/zcy03ct7dWBy6J4XH
	gT1tIzP2KEqXBYucLLDJXcS8oCFdic45PHfbLNeiD+kkTaxpgO4joWs6U+MrgQdouwLy
	srix3y8QYbYqHjp/5FW8veHvak47yc32+JteIRF4koIlkXPh1hU6qNigVQe9Es/6SRmc
	VxlQ==
X-Gm-Message-State: APjAAAUDjzjFC5XNCuCRaz6CwYbMgVUPnHWwseZcXDP6PaV3WWku3WGh
	X9Gpi91sepy7cgAjkzLgJ8dCqkvX3I0=
X-Google-Smtp-Source: APXvYqxfJPWk3q9usEFbR/91iLWtrsPyZNFJK7Diznd48uFK8jJ/nmCD2Ng1ZGe9NzTmOyfpOBrpWw==
X-Received: by 2002:a17:902:ff04:: with SMTP id
	f4mr29489662plj.275.1575927796361; 
	Mon, 09 Dec 2019 13:43:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id i4sm481861pgc.51.2019.12.09.13.43.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 13:43:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 13:43:00 -0800
Message-Id: <20191209214300.3928337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libsmi: Use right name for tcl license
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
X-List-Received-Date: Mon, 09 Dec 2019 21:43:15 -0000
Content-Transfer-Encoding: 8bit

Fixes
WARNING: libsmi-0.5.0-r0 do_populate_lic: libsmi: No generic license file exists for: TCL in any provider

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 3685c4aca0..98cc63eb3b 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A Library to Access SMI MIB Information"
 HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"
 
-LICENSE = "BSD-3-Clause & TCL"
+LICENSE = "BSD-3-Clause & tcl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
 
 SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
-- 
2.24.0


