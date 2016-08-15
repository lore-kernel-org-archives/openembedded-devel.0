Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF3157713C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:09:21 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q11so2422100qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o9H4odyGbFFpyZHYDrRrW7yZKzwKGBoMH2WmC0LHSEQ=;
	b=Fx9bUmZGBs2yVfuTifN0u6DeeUbR3RwJlbWwKM8vOpkd+oBL8VnluQEAnL5JXCq+zF
	nz1uBRiYvKPI8BQqicgQV/95rAYMezkqvrsmC6kE+78mpTlknTX94qjirKHKyrHUMgce
	yS5YE8h1210pe/EhZC3eux9Cks3a0ZLv5pIPOWDMqWNpmyat4MbDUfSa/Y7k0ralP/CK
	UI76xTZ+D2PWdPsrGln3a1MWZES33Rd82+xUvDYhj9lGXQztd1C0lmxGYBkJ6ku/O6xL
	gO5sSkJm17qSHQ5RvbIXNiknAvje3YOkOJSK3SQTSRMqBsc7AZSCsylF/fnsNyMbReN+
	ElvQ==
X-Gm-Message-State: AEkoouuucnrP1eNBu2riT7EUqqM43ET1UKaUiiybsv/7ySEmwBDBVPP4nBWC1WIEov5qvQ==
X-Received: by 10.200.51.251 with SMTP id d56mr34777185qtb.36.1471288162053;
	Mon, 15 Aug 2016 12:09:22 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	m13sm11856544qkm.11.2016.08.15.12.09.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:09:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:09:09 -0400
Message-Id: <1471288149-24953-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-daemonize: update to version 2.4.7
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
X-List-Received-Date: Mon, 15 Aug 2016 19:09:22 -0000

 * Confirm NetBSD support
 * Close unused fd: devnull_fd
 * Fix exception handling

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-daemonize_2.4.6.bb => python-daemonize_2.4.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.6.bb => python-daemonize_2.4.7.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb
index b17b366..98f23ab 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.7.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
                python-resource \
 "
 
-SRC_URI[md5sum] = "17bc788a8524b104d4639a68623461e3"
-SRC_URI[sha256sum] = "8aa66bad9aa10c682302a4ea9675874191304adeb3239e0776f1ca3041d30619"
+SRC_URI[md5sum] = "6759005b12dfeea0d4305f8536b4b0c2"
+SRC_URI[sha256sum] = "c0194e861826be456c7c69985825ac7b79632d8ac7ad4cde8e12fee7971468c8"
-- 
2.7.4


