Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 17C847E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id r18so7714627pls.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YFqwYla75uQPesGG/TcPCAt8z3rl9wt/FdHpcZeAPzE=;
	b=QOFIJU+EiWdcIUlMqXc/vTGfukNBhL2uznpGNnWvCO4MbYZZhSfmhqrUJfFOMPH6W/
	bEJmGZ+vayPCo5TxkITjmZhm9foa29Lyv4JDbIsbDEGO26S4ers65ZOQdlu+BGc3eUvF
	Y35ta4AeXRQmS4jrgFmo8NFWEkLtZIcilE7JXBtfMq8T9/t7fTjpTavz2j3fGIG+UGIA
	1jNU3mr0S0JcCTFMNkKH5lVfaJHvE0qTElwAr9ypKt++lSGK6RDtfoWCMNvEL2YuVSzs
	aB7GwXJUZzzlgSuEDpSTecMRhvPllXQ085LLfIOiOtq7CuaUE3s08U9nUpqb3hTgafwb
	uR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YFqwYla75uQPesGG/TcPCAt8z3rl9wt/FdHpcZeAPzE=;
	b=RQt9jLA6B1Dps0BDoeVGywnBkyx1QLBArEuMEf4wthHvTLVMgVeteNeg8tgiulTC9s
	VV59VDFMMWOcAUlnARh2b7P4OC4fZ581aALubIdNaFtktxiCb+1PhL6lf83dQI/uG96v
	RMnTPG1ct8cQ6qZvecHODo4v6xLlXFTeFkASXeAUaR0+In+ZhBav6rTuAxVVw0Xs3CSz
	V0G+4OJlxfrfjJNaSLovOgZkCo+45ASa3PyP3TewuPg/pqoIDhfpNvLghTRBfsN1EJb0
	R42wgatfAMyrsFw4InKan/YatiB00iDDS1NZGH06MOtqtLA+XUYJuiL8KuPPCAhqTYA0
	r0DQ==
X-Gm-Message-State: APjAAAVSbgpETRGv5MR8c+N0o3HXySVBSvFD5d9mjmrunEB7Rl+dzUwU
	KYtWp6ZC3qU5Ju0boeTzHFw8ZcjW
X-Google-Smtp-Source: APXvYqxEqCa0QV6FRPW2XaWh9cxxV8UB6XKpKwtStxrqJa9el85i3b/PxWRQ/7Ct3Rw1HEgr4wnNsA==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3mr4896224plb.329.1558411010195; 
	Mon, 20 May 2019 20:56:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:14 -0700
Message-Id: <86d4b455a3989ec0b22717e4ca696c849d5fbdc8.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 14/34] python-urllib3: Set CVE_PRODUCT
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
X-List-Received-Date: Tue, 21 May 2019 03:56:49 -0000

From: Akshay Bhat <akshay.bhat@timesys.com>

urllib3 is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-9015

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 288ed8b..34f1478 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -16,4 +16,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
 "
 
+CVE_PRODUCT = "urllib3"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


