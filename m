Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE44678A5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 12:50:53 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c7so24362204qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 04:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F0DjVSCPnKQvRVVn83EJsSIYXqod1vMKZgqJRAc32F4=;
	b=qMIoI/78ciuD8KEmwfomKbfeSFO81fG6tyWrmM7oD5bOBuL7H4gB7dvt/Sj4+heW7I
	xmGkgygt73KN7B0LlchVfqO2Pv+bJRsbBxkmQd9YmFx6dqkbrb30xPgC/E6Grcypv+5J
	0qLwJgzEjspPLGoYqldirEot8Q6qlIC6v5aNkflwjnIYQ34WlQSBYRa6F7Pl73epFXnB
	iCmljqWnfPWS01k4dJkrJg+/s0ISSErEL3q/7bhzHtl/P85EAbhAkWm32L4KiF26MK2O
	vaS24S9SvdqRPPAs2M+uzB4LIjD3dmET7fa13NfNiYCTIeIWesariG71jP/6qOmsV491
	qRoA==
X-Gm-Message-State: AElRT7EGPBu6pkGGgqRFP+OrgbvM1Qba3LgoXRlv8TxTOM+p9K8ZgJ9t
	OuwDk4Z9Wj0PqevGdTl3AqEnDOQX
X-Google-Smtp-Source: AG47ELtmlY3IGUuLY7rtgz4QeI4xlWjorFghl9t1DAxA2EJi3bi6OciOGfX7hRM40J2UrTEUiehy1Q==
X-Received: by 10.200.48.13 with SMTP id f13mr28552316qte.140.1520340654648;
	Tue, 06 Mar 2018 04:50:54 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f134sm9255600qke.78.2018.03.06.04.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 04:50:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 07:50:08 -0500
Message-Id: <1520340608-30412-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonschema: remove unneeded depends on python3-misc
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
X-List-Received-Date: Tue, 06 Mar 2018 12:50:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
index 5aaee68..9269907 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
@@ -1,6 +1,2 @@
 inherit pypi setuptools3
 require python-jsonschema.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
-- 
2.7.4


