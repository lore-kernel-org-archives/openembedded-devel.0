Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF27A746B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f15so6766925pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A4HwijTtS/6t89I9Thbp+1iK6xCMiWHx54pVGJ7HFSM=;
	b=ifFAbpwVruc0BH1gdc+MFLsghUniK90WCYC4tlpWqcbUxEi/4Mg+58G4iowaken24j
	qicxZCDbhEzpyTO2s5xmUpdEAkVMTssTEPcs9A5v2xPhGxOSXyIk6S6Y5jVXe1xz5Gnf
	LANLETVvkz6w6tHCc7Yag0j3aLtLWSoMAAQyer0LMETq3YFJRWdQSKRgMVJ6jEjo3Njs
	epu53vin/tXLZ8G0I5Q+iGxgnTAeYLidc2ktFN9AKyDOU1SQCy6A7ABeeS4T9uoXii5g
	AyGVPXapOedILHSn3NGLGPq42X3xW3DtLQMRLJWHfDSNPh01KVPoui2ILoQ4MUcrkR+Y
	Bing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A4HwijTtS/6t89I9Thbp+1iK6xCMiWHx54pVGJ7HFSM=;
	b=Q9ehpghrCgdl3gQpex+Bgqla1tgJKkSDvK7jgM0OILPtZpqjELjknMSAj5ZtOoBdqK
	62RYfTJiRlZ3ImUwB25HpCdrFHXsEvO/35CbtyldWwjfmjr5s3MrD5P9uk4ccvCrmsu+
	wS1g95XvIRPJuito9x9lkm4/PhV3sInQ8a4J+euGrKEW3j4t03y3fpQ3LviCuPtJl8du
	/86whzsnGUnzrTe0fvol9ASsOH2pi4AejaY9tRxOqRGq2OIlbhEFbhexaZdARD9ec+zY
	2m1K+o2Sr126u9oUqY47z5c/Wh3kE8vDnEFY7obqfUnLnwjFgHixZIzxn4NsZvQApNRS
	q2mw==
X-Gm-Message-State: ALQs6tA+nvgK3LdxZLjaNoJgNtOD+c7Jj4JgiJUrPv9l9GepsrRgxBTc
	U3Ly0N+zbuMUauv+Zr5A1asang==
X-Google-Smtp-Source: AIpwx4802KwefY5ULm/1n8h+yIg23zvFcIawu1880zDW6esPZOkXuKHtiQJYVWWlF91iz+5+0Muk+g==
X-Received: by 10.98.166.196 with SMTP id r65mr860604pfl.110.1523319765344;
	Mon, 09 Apr 2018 17:22:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:33 -0700
Message-Id: <1523319756-8431-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 07/10] packagegroup-xfce-extended: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index cc231b4..b73c9ee 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PR = "r10"
 
-inherit packagegroup
+inherit packagegroup distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # mandatory
 RDEPENDS_${PN} = " \
-- 
2.7.4


