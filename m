Return-Path: <uvv.mail@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF61744C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 08:33:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 63-v6so1129066wra.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 01:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2q5KhKjnQXzDgBO6hA6T1G8gBi8BiNXGhE2QrJfEFyY=;
	b=cXAjK1pfowxvuGjOgUjOVJoEOfmGVEAtA9Y36YeiMA6+qnHjIxCO2YRB8evATyRSfR
	hau6ej7UwRfIFmz/93Rbadz606DF9lqFjegL/UQEcOpKq8VZtCY7Ui7fKZXvefPZYAWY
	nBR5dmZZwRDlPipfuwMy23aWXtSaU6l4zuSaooH8VEXpAVdc2bXYegHS3/KHuyy47E2p
	rYrH7UrHkTjF0a6CMyKSh3JFJ40ElzraVBUq1qB4qU544sAriSMySgHnhXTR0dFOpGEd
	dbBsabaC6JkcZE00/e3uIY4jw2HXpZt6eJSV1PnaA6udSjtbi3yJ+/f/cBKkRJurlkef
	IWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2q5KhKjnQXzDgBO6hA6T1G8gBi8BiNXGhE2QrJfEFyY=;
	b=UPeIpNP1ucJ3UMp5fqp1Jg30ZU7Iu68G2HsRcYn1MBW7rLWhj/pdNis3J+0VF7nENN
	SekGiurp5Ti4a830YhF2uuyam9jXMs7cUl9zRmPyUNIIXi8U/pIjeXDCjn88OZuqW2Sd
	c0oVphiUFT5qzkZXmVkLiwwJp2C8G4/j809VNqi5Mp/S361smA7l3XXttZlEI4Oj2onk
	WQyKVMRmSYFOPAR9e2+q+WkHlRmFXAA6Jci3zm4uPm40PdCarFfedJSK4rHxmPW1IEPb
	Taoh2W3aiOgLhLeabWlDSBqA54Ugxmq23INqazs9Az2wILB7H+tiInbYsqU6G+S5knpc
	+Q/Q==
X-Gm-Message-State: ABuFfohxZXNaMRAJ+9KZnqrrE0rVmbru6uys4yOokrvvjrVplHQ73r9+
	FO4OXvgceSaD4RptjaXPWmEd3EpTNu4=
X-Google-Smtp-Source: ACcGV63KRE7EVAWcV7H6YKo8Kos5bC8qrv9Vz8KqlN6+3DvwIkGhnWg/7ggF771VDEO63U6O8tQR7g==
X-Received: by 2002:adf:8bc5:: with SMTP id
	w5-v6mr10319032wra.110.1538469180521; 
	Tue, 02 Oct 2018 01:33:00 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-1-62.web.vodafone.de.
	[109.42.1.62]) by smtp.gmail.com with ESMTPSA id
	a205-v6sm6449392wmh.19.2018.10.02.01.32.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Oct 2018 01:32:59 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 10:32:38 +0200
Message-Id: <20181002083238.74140-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: allow empty packages
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
X-List-Received-Date: Tue, 02 Oct 2018 08:33:00 -0000
Content-Transfer-Encoding: 8bit

When libeigen is used as a dependency (e.g. in ceres library),
the build is broken because empty packages are not constructed be default

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
index 31a42a9d6..a59320655 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+ALLOW_EMPTY_${PN} = "1"
-- 
2.19.0


