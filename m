Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD38F74BE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:26 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id a22-v6so2931226pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8MSJvw1KU5D/cnONQdFmjW0ZY6ZKgY3sVQJdhc2cME4=;
	b=ZJe0ndQeimg++t7W5JWox9OZGOKEUh0STWrePPraudgnygsMQxfUqeSxQ1Us/9DoFP
	A9w0mIvBXGu7WBuidRkF9vrPYYNRa7AGIeI+ZHSFrLW6hpdhhyusbG4G5Af2nv8Xhw/1
	p5OWj+nHvQ6hDOLggD1CMK8Hligi5yN1Y5GTJsudWDEoQbDecPnlQo3gRml/RO+5D0Pv
	MSDp6T8gMSB8MH51z0ez7LXUbbrVrzAw2XcXN4bVIJCIks5j4xw3Z0VMNmgEvh0X0SBV
	leV8YxsmhK7J0Nm6EAPlNKbFEyzpylGlEAmg1CcWA6NqIfpve3rz2M7VoiYMLKSDjyKw
	Vysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8MSJvw1KU5D/cnONQdFmjW0ZY6ZKgY3sVQJdhc2cME4=;
	b=FyN7WHtirH6ojXR5LxHL4npEitznD7j8oTvabWwf+Y1wx6D94SRq3r5da+0HoLBW6y
	NGFvgmz8hI5CLsOtK6Wu6GajMgXJV+Iv28jN8YPJFYgCJjuTd6ZtLx5U7/yv5Soj75vR
	JDFTRB30dJ9uJ1IIdEUT9QKIWEyqgzImByOAOfpg47ZLY23ob9bzsT14LG9AX19purt8
	hc+eRfJjakhuPe42SbEVzHAc6tolnBDRvUea9TXb4vPpRYshp66xCxkMAq1Fbvtm9bFN
	7mYu90ZNjle7HasdGX/n9TsCU64o7hqapIt2K+8V+dyvEj2XbH0OFWor7QEdSF9pclvC
	BSRw==
X-Gm-Message-State: ALKqPwdGXqTNJJW9O9pN6314s4Xja/9UHyG1yxUXlQZQlhHc0bAsmxvq
	eXw39GBU0aBVnS50VlUsNbvmDw==
X-Google-Smtp-Source: AB8JxZowKl6H/cdofdN3UqVpf6YIjVgaJc5pbDo5ILOicHqPqNC0mEjX58rHHV+wMFZCM+QME5Yfcw==
X-Received: by 2002:a63:87c6:: with SMTP id
	i189-v6mr5676453pge.2.1526607087563; 
	Thu, 17 May 2018 18:31:27 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:45 -0700
Message-Id: <1526607046-8081-16-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 16/17] libtinyxml2: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:27 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
index 8b5ab44..c763a6c 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
@@ -12,6 +12,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-FILES_${PN}-dev += "${libdir}/cmake/"
-
 BBCLASSEXTEND = "native"
-- 
1.9.1


