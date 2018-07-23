Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66ED874F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:53 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 31-v6so258013plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IlvxSYSrZ5Ln2M0DRjQByWfYana1jg+ts8R6HuVSO3w=;
	b=MpyCOdk5Rw5s48SGGVhBA7+uK+q8OXANpxei1gxpsvlQ+qfbLQY7fQb62f1j8NkeBl
	qqevddQtquOd1YnP0OwCgfiS35cipQXYR0h6L/9argH6pCmWk3yCFTwt8hCiS/BzTnju
	lMOmu2qhFkbE7W8ndeIRxy+VtEsJg4jYWfn5qgWg2UGzkKEIiPAuG4Urhq//0TPV6ywc
	rdZZe322oUX369rRVSRLMsUMtxn4ZMlEMF4gruAoI4OmCEuAQwX0ONTMB4Yod/CRzHsf
	KAxEor6baTnQnx8JSqbc7fWHz7Gxu2HcnTX0ZhpGvVoEKABLlskzOjFwZZhdmoqG4QfU
	I9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IlvxSYSrZ5Ln2M0DRjQByWfYana1jg+ts8R6HuVSO3w=;
	b=olXY/OO1ssIy6nIn7GI2V2WNocALz/KXOcvClGT4c7dCrpWLv7EHUntK4NtWnpvLpx
	g8qvRGGwvBj2MotSJvN5n0wXVrH1tN1XMPC9YaqodPBwKhcRMbu4VUd+rEwrQ3Kx7FWN
	CYHJ6rtSa3BJHhYhMAHRug82YxZEi4jJZglOsmCWRbRwNZrN+vlfwUsVG3PwbMfv1Z4O
	7G25ubHDhMhMu8rDqTiUcFp6fDrmCzzUxvChnHoco30rHd6Z78445ZlrU8aGzc+2xK8V
	Mt7CWvuOSmsL/NjQkyMxdzlwp2kxfB2V718Bn6Po+IzB2BxD3dH0aEGfvJO0p3+y/Qd6
	fAOA==
X-Gm-Message-State: AOUpUlG1Z/Hux5yHjk6NEC8seijsOjJq9K2IhvgOYofCt2U3nXcZIZ6d
	uz6eA7Ch2a2rufy3aRJXVREQucWZDA==
X-Google-Smtp-Source: AAOMgpdnXl00I9LfWacvYUPvTqZgUTTC4rg+1b0xcaNScA3VvnoWJdGcoS4SBd5Foo54yQW8iOgHOA==
X-Received: by 2002:a17:902:b48c:: with SMTP id
	y12-v6mr12810276plr.97.1532353794472; 
	Mon, 23 Jul 2018 06:49:54 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:53 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:49 +0800
Message-Id: <20180723132950.4543-6-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 6/7] python-prettytable: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:53 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index 6f4390e24..406555ac3 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -23,3 +23,5 @@ do_install_append() {
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
 UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


