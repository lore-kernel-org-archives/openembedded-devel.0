Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 822F96093B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:10 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id i5-v6so3597972plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JrjftzkccYty7kczrBpnfpYfpyXD9IMkjMCdV5oMZgc=;
	b=TlYg2NCsnyijcB6NK01z+EKTAuOnHbNieDfuSO445lp0NWUJiLk9FGnmnVwLchQQj4
	f21lAx5opPaoK50My7vPHObsEADUGjaDkeijLGKxTfv4Zs/LEVivjUNIDquF5eIwFFkM
	bFI5n/7C3XHNB3/Ok8lnfDSK2wH4uXXwde5DKcVLq7z4sR8VRePA04aOWjSh2HsJlLkc
	DGXFLMyCGWcP1nOHSjcDcG+InW9n+QxQQh38sF9UYInIuxYofuyOThrqcnYgG3Bq/Gbl
	RkFky9/iPgYOpAVUx/tOq4xYHvJb2mrpA5c5hQLmnuBsnk6UhoCqkNykYgCWxQSjrpAE
	BMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JrjftzkccYty7kczrBpnfpYfpyXD9IMkjMCdV5oMZgc=;
	b=VGg6KNWFHgitvrZX/K5tjn0hLBerKZSlr4/PQzm0IWgeAzIV/i/N/dcKwF3GgdHQmV
	Q9OTWSYBNH/ADl9NQY3jIDGmkg+t3Idos8QfrnMr8YmPXuXM1JL7Mdq4Cn+jf4f+M2SP
	RJgWQNpfaKrGKCZB30UAXVEp2omFDmpolRLFkcycp4LypKr1YhoJ3h6kgQmxk7T72s4T
	7JWMOM5Uv4Sz/y88dOet7dahljY1C5M/kI4IBCGpd2jq375zM5Bdiaxvtoae3iOkp1tv
	9GzonYzxXOwIRgvySn7DCvKfdRDhtNOgyQhaSMN6OzzfNxR7t8Z5ZQITl8FCyy5ZqJHD
	9mGA==
X-Gm-Message-State: ALKqPweFTR4LsOF1HNYwcDBy7JrrDeRuFzXxEhZS+3+oGMPKdzXLYkUA
	exExZ9X4yneXKoHuYe78y+fEDQ==
X-Google-Smtp-Source: AB8JxZpdUeNhxzcvSgGv0+g+hoZ/Tj2ScVZvxKGN7gbu1C1ZP7viDcG1UQ4J4xZVi/18Y2yt27gypw==
X-Received: by 2002:a17:902:20c9:: with SMTP id
	v9-v6mr7434731plg.206.1526607071337; 
	Thu, 17 May 2018 18:31:11 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:35 -0700
Message-Id: <1526607046-8081-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 06/17] json-spirit: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:10 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index c7c1ad1..d6e42c8 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -9,6 +9,8 @@ PRIORITY = "optional"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=278ef6183dec4aae1524fccc4b0113c9"
 
+DEPENDS = "boost"
+
 SRC_URI = "file://json_spirit_v${PV}.zip \
            file://0001-Adjust-the-cmake-files.patch \
            file://0001-Link-to-libatomic.patch \
@@ -16,10 +18,6 @@ SRC_URI = "file://json_spirit_v${PV}.zip \
 
 S = "${WORKDIR}/json_spirit_v${PV}"
 
-DEPENDS = "boost"
-
 inherit cmake
 
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
-
 BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


