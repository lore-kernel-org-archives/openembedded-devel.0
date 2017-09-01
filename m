Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 124F9784A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:05:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a2so356535pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NQNM2oXqqlq9ImIhGDRMFMgy6hIhqxL77VjpEMIwX0s=;
	b=oOowaJgfyAfKkxobiBrR/uacOKOYt6ZgI9WDvCRLZ5zRWX0N6BOl9hphs4qaY1uslT
	QD5uO+J4jnC7xT9HTYlYNRMYElQegBYfDJ7zlqn/mAOkx68H9bwehkq6bEuvEemLS3Ux
	p/nfPI/FObzcct9DQ5LB0lC5mhjS4keroaX3BjwvdmwyLiAVYCSSv9wyTGVoLS/1wWBs
	uZI6IzsrCzYg74j5njNUPfYYeYkvgZW3sRdfC8jgpTKZ7NNcPxkmRUBaCq30sN2eAsf9
	koZGjJMXjg7O0uECeQKedb41Bp8Hsu2PyLBhST8K9X6/3vR9sHguTpfCciBeZjbW3EmE
	qn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NQNM2oXqqlq9ImIhGDRMFMgy6hIhqxL77VjpEMIwX0s=;
	b=K2FJZCy+ggzbWSdrrE/F/LjysMweNxLl7lOm8G390VK/7dQcYHNPnHaBN0NfTPgZ2o
	s4P1iAR/itkBSrLjQfIBBbrVzcazG0AdSwdH6xAXhZIT59wE/UvF4wFFVI3CsH7DAXB1
	3Gx2TzP9a8/R2qrg3JkQjn8xMx0oYazu2tNYi8S90G0AWCe2rMym8dY0DtOf7YUaZDbq
	KIxSry2dI7+bmnAP5+wuRWBI/PupSNNu+pKa6D++ew8e+j3vjf5XXMP004uOAhjAIr9M
	0kZVF9Lfr3/TI6aoUZA4pY5HuYLTzSVkbhfPsc8/hyRg/o5HNyi/uGe3nGBvEnrd4jme
	pZvg==
X-Gm-Message-State: AHPjjUizTXWCX5qxmX/ao+womMISkop1t5qyqJN1OMt1umDSkcIpXPcx
	F3UFcvvrDFh4/5gO
X-Google-Smtp-Source: ADKCNb6s8mu1zKIc395Y0HK5ZbgGbHYAztvSzRx5v/1KSMIGhDjpoX0aCppoXgkScXDrGLz4Qh72ew==
X-Received: by 10.84.231.200 with SMTP id g8mr2960171pln.94.1504281946051;
	Fri, 01 Sep 2017 09:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id z8sm692808pgc.92.2017.09.01.09.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Sep 2017 09:05:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 09:05:34 -0700
Message-Id: <20170901160534.24992-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] pam-ssh-agent-auth: Get newer version of config.sub and config.guess scripts
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
X-List-Received-Date: Fri, 01 Sep 2017 16:05:45 -0000

helps compiling on newer architectures and libcs like musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index 42b648e8b..ff88533ff 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -30,6 +30,8 @@ inherit autotools-brokensep
 # these functions do not exist.
 #
 do_configure () {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf --without-openssl-header-check  --libexecdir=${base_libdir}/security \
                ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
 }
-- 
2.14.1


