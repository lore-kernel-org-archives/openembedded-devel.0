Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3801078530
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:45:26 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id j15so13983604wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MeKyWUgRapSuzTAJ8y0myCcM+mzdKOPAa8/b8jbxP+c=;
	b=ncPO3ykbjw208K6FJD1JiJmy4HWfI8S5bei/6+mGbrKsTORtRCCsdAeZ53sd6T5DzW
	sTKAExiyMJSnsOG9O/1b08hz4JNb6qDpC9Yk7slqKxWwAafor3tef49a6vYjDLzimzLv
	M2EfqE5QgLnUtcYMw9wsToGR8023eHudj8e2haPaSiZ59YrgNscTKPSvFs/T6+Fi6M/M
	RaPGvS9YqO8oWZ5GYJu00Eu7R+CaclAyhVQYllnFKOR4cvKG1saww33+h22RuxSMpzMl
	7Ka9Wx635ty/waQt5NV3es4IGA4EKOTshORajmOatVkEc/f/rgKjqEt3z/fy8YWvcRwu
	aJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MeKyWUgRapSuzTAJ8y0myCcM+mzdKOPAa8/b8jbxP+c=;
	b=Z/4Up9zUiseqz7d+NHFj1jYDwSpUSfrVFfmggbqBCg0eq54pgb2YOh6zX10xCPJj/5
	M9K3fwhzVc62s/0u3V79Ldas2iA9fWvWNBTEjD0sbspWVKiE8gevoASw8/f6aG4NMxSE
	dQsxPYbUwCbO3SngVlZXxp3t5JZ0uYhiEALJdWNUANoVHqJX4lCN9aZyGwlfW5Wf4JzM
	RgwLv3SsfSwngvK/WSpZWYtQws6F0nnwCunVDtMGkyYCyZbL12ODd3VlGFkJgEDhcMoc
	LraNmS0SggwFWLcpEMDZfb+WkpOxtn/zllzTU2aEZDHQ2utP1FwHj+snY8WqgfeV2KtR
	XIyQ==
X-Gm-Message-State: AJaThX7Ne2SzdBhOuk2StoHuf137ESjhBqQZjHZx/DuAdCZZOgZzEtwJ
	SF/IRoyfB7JVAa/VDRWs7sSKzG/R
X-Google-Smtp-Source: AGs4zMbDDJP6sK38sXQdHf1NjvsrPypGgx3gg1IBy59eX5F0ZaNztlxKCmMosqMT/8bSwzy1r6Ji7w==
X-Received: by 10.223.195.103 with SMTP id e36mr7189992wrg.10.1510569927595;
	Mon, 13 Nov 2017 02:45:27 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q124sm763014wma.18.2017.11.13.02.45.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 02:45:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2017 10:45:22 +0000
Message-Id: <20171113104522.3510-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171113104522.3510-1-ross.burton@intel.com>
References: <20171113104522.3510-1-ross.burton@intel.com>
Subject: [PATCH 2/2] cyrus-sasl: virtual/db isn't used by core, change to db
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
X-List-Received-Date: Mon, 13 Nov 2017 10:45:27 -0000

---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index eaa453d91..64d1a76d6 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "libs"
 HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
-DEPENDS = "openssl virtual/db"
+DEPENDS = "openssl db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
-- 
2.11.0


