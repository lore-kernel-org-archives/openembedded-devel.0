Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9C83B7E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id u17so8310859pfn.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dLD3r3CB5NaP+5L9DfmG/8tPO5/Kdctswm4iu8GvwEA=;
	b=pSXro4NbHGkgEqpjxJ77h334OtdkeLCl0j4TVRegaIgTXvW8G7AzGUXcAJOtwfDpS2
	QoxrMA9XZoneCyAaxztHovrqIWCM5WLqt2xH6nlNmWVvrwF0JdH/c9+ClVmYKGrHB5xS
	/6cZldhAGI1nFemlz2zDo5NBfpSzREOn7JiqMvmq3MCDR7PgUbMSXe0R6/ZLTPtAfDKX
	Pqh6uvXKK8O8sPlN0RMNoFFt0y3DJPL/P/IqdfMoCffL3CK6kJnd2Xa3heIPKJHBHz0i
	d161K4NdXPDZ4A7sdFpnAzdGkaha+HrlT8+7T9Fa7K0S8iuc2UqKv1hq9ddEyLGdPJhB
	yH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dLD3r3CB5NaP+5L9DfmG/8tPO5/Kdctswm4iu8GvwEA=;
	b=Xsu4GdAFNJdEzkENFdqE76JzH/UT0x94SU5k5Sj/f2Mr/QvAZpZ4y2ubpITAhNbQjj
	8uL/vG9VVKZIgGMuSXW212r2NYsRDuum3/OX1ZaONSaWOeSmhgLq1DPS+i5WCZ1kJdi2
	k7mRftmGc3ch6IMdMw8xjcgZ6Ewqha8oJbp6hNHCi4Y+dhUTkHUj23zZBzIGrvv9/R8w
	cphqQ26miAU1CY6PKqzxa4W54GU+t6eqcUWia5ZdUm2tEQN1yHZAYw2jiQn3sRbxpk83
	9p1ojVtLCjXG/TIgNOuajhS9OSzmAoxCDICD2QDItmPDrQZ0q9Y4tguVavSAYSCL54C7
	m7sA==
X-Gm-Message-State: APjAAAXTteFJy7lIPYXQ1vNbyR3S4ygqCqmGB9devZUcT6WfTXYqtZXn
	dV5sSJ2T4i9ln6Y20kZNzjhWxWHF
X-Google-Smtp-Source: APXvYqy0vVAbEnG2cn5u0BZtWeK8sXuT//J4tspcvdZW8MOkQ3/41aaagce1FJpw8KVfJV4Pf2AQ2w==
X-Received: by 2002:a63:950d:: with SMTP id p13mr79948036pgd.269.1558411011705;
	Mon, 20 May 2019 20:56:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:16 -0700
Message-Id: <d0ff0867436a8180ec069c5c6bcb4e9902513126.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 16/34] python-requests: Set CVE_PRODUCT
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
X-List-Received-Date: Tue, 21 May 2019 03:56:50 -0000

From: Akshay Bhat <akshay.bhat@timesys.com>

requests is used in NVD for CVE's like:
https://nvd.nist.gov/vuln/detail/CVE-2018-18074

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-requests.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index e6337cb..53504d0 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -23,4 +23,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-idna \
 "
 
+CVE_PRODUCT = "requests"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


