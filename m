Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC386FFED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:37:16 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u206so36437512wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tvhheYraGuQ9uagk/DxfPvE6P/ZodI4RvwooEcugPXo=;
	b=KyqCxg/SKDJ2pz0uCENv38ZqhicGCfTLXiZKeRx75MTvCiQvQz7vqYrKTyjlVQMcaQ
	aCYwWKUROFFB9baAEZQxdrhIO23J2LyPcznd0Zd0VjmNrkUr8+gyXQROI0Xgu+aWj6iQ
	qjOLl5zcclk8G1rf066EO9ywhqSYMPqbT/fPmQAh+l6oNH7sg37gPV1OHXpYdVlgHzIe
	bDmZTTFq/sw35QzhPTIY4dFOWSOV+H9kMdu8zNcHBb3K7Br3xEuwUEisVmICO4S6YZna
	9G9sR3tt1O0Lu5nRyeOqlSJantP8UXr8XNBC2BGhefjLeRp8LiakWH1sbImdMK1xS3uO
	vtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tvhheYraGuQ9uagk/DxfPvE6P/ZodI4RvwooEcugPXo=;
	b=FcEJc3xBn8yPvyYc3NBv6H+V249IULLZxOx9dYsfluiKWjfgkBwh/cgSLsBPSyUnEA
	5tuVguX9FJA/HqoW4ZY5laAzTJDWHfj4ZA2V4JnWKaPOUcO4fyH3CUjGke0kRPBeqWoY
	LyTyZ5J4bDfRLX/LJpasFwF5KKFkyOKB+TLLDzg1CnE8fgAWrH9mJTuxwYzzU8rd6lB8
	Za2hSmTUh2KjR07Hbn3tW8c4Vxo1555+39WbRwv3RY1eSVqya6vqNEcxs4S79U+PTPSD
	lA+T50gdcdTm+UZUVlCPdQyJoVZma0tKmfJi581Q+fU3rzf1MlLaYmQF0kl+92ZfppYX
	exOA==
X-Gm-Message-State: AOPr4FVx6QUPUgNMJB6XvgFDr8oH6eqXWk+963acwfqNmugtTrKIJJC4pmAO8oWiw8qzBg==
X-Received: by 10.28.15.74 with SMTP id 71mr4431474wmp.34.1461080236925;
	Tue, 19 Apr 2016 08:37:16 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id v64sm4952474wmv.1.2016.04.19.08.37.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 08:37:16 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2016 16:40:18 +0100
Message-Id: <1461080418-9229-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
Subject: [PATCH 2/2] protobuf: Split package to main and compiler packages
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
X-List-Received-Date: Tue, 19 Apr 2016 15:37:17 -0000

Protobuf has two main features, a compiler and a library. Run-time
applications only need the libraries to run.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
index 049f9d4e8f18..f52f22aca3e8 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
@@ -8,6 +8,8 @@ LICENSE = "BSD-3-Clause"
 
 DEPENDS = "zlib"
 
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
 
 SRCREV = "bba83652e1be610bdb7ee1566ad18346d98b843c"
@@ -22,4 +24,6 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
+FILES_${PN}-compiler = "${bindir}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


