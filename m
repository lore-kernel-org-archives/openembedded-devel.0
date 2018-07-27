Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA4B78CDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:21:00 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id b15-v6so6171589qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+e2Om5yTKez5AS7yPjqiIHIUjSE8/yHz4wR/Ya40MCA=;
	b=YZWDGOANwA/3zhJ8ivqQVPacMxhRfASmNM7vS1TM/XQdXHBVu9TxMtW9ouJSfWqkE5
	xEkYsUrDFj6nL8ThXnrwppCZvoY0BLcNdJBWniUk4cjmNRhskArjYxoau8DzrP1LLvl5
	qDJjgCXsTMRuuimZ65FeCG/+mlGR1HuIgvLOAVm0TbxE82I+Hjxb2I/pSIEeDg6ewG6m
	ZB0QDQoXTF1xfadlGpGPcuerdIuILnCgmMb9p1RdP8yTiHjugydCXna+B20/sGoCT7zU
	CtWDPCZk39LcpPAxBD/zIBFVHGt1ocaYrJM+LSt8FjtdBROXftS7kVzMB11KdUlF1oLY
	wLnA==
X-Gm-Message-State: AOUpUlEe6BzGqZ5NPXBrgdgARoSi4K7npVqG+zlWYwvdFm5hX9GXGknB
	Qt+CnxKRGxpJM2ltiIxfUsUWqyerBVU=
X-Google-Smtp-Source: AAOMgpcXY0Sz613sPupr4rjZh/E2pO5PLopupsQASeo4iTEz65EBIUxfqeb5PkzPZ9/gNMHbFNql5g==
X-Received: by 2002:ac8:31cd:: with SMTP id
	i13-v6mr7459022qte.144.1532719260799; 
	Fri, 27 Jul 2018 12:21:00 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	j128-v6sm2556942qkc.50.2018.07.27.12.20.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 12:21:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 15:20:53 -0400
Message-Id: <1532719253-10531-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-meh: update to version 0.47
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
X-List-Received-Date: Fri, 27 Jul 2018 19:21:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-meh/{python3-meh_0.46.bb => python3-meh_0.47.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.46.bb => python3-meh_0.47.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.46.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.47.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.46.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.47.bb
index 40e2cbd..95d6d18 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.46.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.47.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 "
-SRCREV = "bb1156728a4f76e5e3638ab20b9454a1568a99db"
+SRCREV = "78d868d99104317ce8820f39f61d207566e61a55"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 FILES_${PN} += "${datadir}/*"
-- 
2.7.4


