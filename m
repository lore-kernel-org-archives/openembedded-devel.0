Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id E350474B8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:11 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id c41-v6so3583178plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pxxhzwCgHLY4O6y8PEPfvIJViL83I3iMG9W9i6IUbco=;
	b=RzgFnJAp5pmXsK28o3CEwgtw26DEV6kgCMsnoeELboyQL78jeAsKU81e7KNCx8P8Tu
	97YSt/S3PRAaCTlFYobBoJfXPjt9bDDZCFUh181QAXBgJ3EiOkAWKVfQsTrfBDBxq66T
	Omb1LFHXoM1r1Kh/Rv0QoXdcOe1g5FZDjK1EyvCNxplHctvEL8Hc5aLqZRsxP1l1RUY+
	UIHI/NbQhysPu+ws8347l3iOvl0yqwspqytjyymkmxNit2EYAZIIjCmnyUBBC++GOtz/
	KFQCzOYy9Jrk3qEp8MukX9uEz0QLAbEfvvJdEyYJ9fAOWEvHESexRO690XzagFdw7bpx
	rHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pxxhzwCgHLY4O6y8PEPfvIJViL83I3iMG9W9i6IUbco=;
	b=seSyrJZ+P6rHqUDwrEVYEQeY+gRdm47yjP7zHUmWcMpgRrTeuuOLkCO2pTllBrzw/r
	WLZmdT4212m8s6j9SiH0q9tLS9m3dZRalEvAwPpH/IyuxdHZhl4UbHWn69LbO/JgNl1f
	9DyIbH/cGrnP+4VRCG0qkd8kaKs0P6TCsZR1TbumW+3qaxqFMsO7m9vzOXZgPB5Tx8V4
	ciD4XHFGnRPh5FuNKNJxZfOK7WG6G04JoPahebI4YPxKDfuq8xeyqLzkpwvOOB3FiE8b
	xYi+5a1XMzsBwy6JbglDLe0l3C6LbVNtXAat6QqLgbtUznYIQ2rChXsf83Ul3mZLAEoH
	QnyA==
X-Gm-Message-State: ALKqPwfSlQ15sKbRTA+FhQw4EnjZfGOn78uL64uIajELWbR4qaO8+WXx
	yaq6PXU+oFw1MfZq7312Dcbtrg==
X-Google-Smtp-Source: AB8JxZrkQVOlNQoPG1gU+sdkNVE9TgrWmDNF/Z7xk5D0LFny3+Wbfr+P/WhfqNy1Jj1zj2zOK1tLlg==
X-Received: by 2002:a17:902:848b:: with SMTP id
	c11-v6mr7453000plo.132.1526607072908; 
	Thu, 17 May 2018 18:31:12 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:36 -0700
Message-Id: <1526607046-8081-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 07/17] librcf: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:12 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 267c0e7..dcd47a4 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -47,7 +47,6 @@ PACKAGECONFIG[demos] = "-DLIBRCF_BUILD_DEMOS=ON,-DLIBRCF_BUILD_DEMOS=OFF,"
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d)}"
 
 FILES_${PN}-demos = "${bindir}/*"
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
1.9.1


