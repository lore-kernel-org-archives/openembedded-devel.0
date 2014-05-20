Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f181.google.com (unknown [209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id EF51C66099
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 06:49:39 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id q8so21276lbi.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2014 23:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9g2/l/O/MNruOlSfmmA3yt2ZGYxWQ+Dk9/16/8gjgzI=;
	b=mTueSsXmUuHG8YzODF/eTT5Bf7uWA2FikLNlWby3bc6fO+U4n0TcEPDqP8Fy3Wdvqb
	xsBzYTRiQFZwKmZdI91pfAjFERdtXWICEyFQjmI7v3XNDLkfunMyKbZUWJ2H5+4l1ynP
	sg4HaDoBS0luxN6e6+oJLPRFTqqIfs5F74LU0LQOEF80pdLMhZRU8X0d9bYOXG3qi/Ut
	Bm+yqL5L/kP5Z3snSQRF6UZwPLpwC4JGtgLNSXItgXhecPNKE+DIgYTbaDDAJ7V8Prt+
	EcByUl+AdYNdLZuu64VGwIoG7LG/uSy87WHE914MqVZWnFRUfQT4ZHtcywxdFl+U+CMq
	OVjA==
X-Gm-Message-State: ALoCoQk43i7RBjN7aw5E+gdI4QmVdrjrmd0UBgfhHBL+0AdxRGqklWmW5jsYSR95vttq/TpleMLJ
X-Received: by 10.112.163.163 with SMTP id yj3mr126640lbb.81.1400568579624;
	Mon, 19 May 2014 23:49:39 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	ax10sm19802037lbc.7.2014.05.19.23.49.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 May 2014 23:49:38 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 May 2014 09:49:30 +0300
Message-Id: <1400568570-23824-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] pm-qa: update to 0.4.10 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 May 2014 06:49:45 -0000

Update SRC_URI, /tools/ is deprecated.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
index f6ffcb6..9243340 100644
--- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.4.9"
+PV = "0.4.10"
 
 BRANCH ?= "master"
 
-# Corresponds to tag pm-qa-v0.4.9
-SRCREV = "c54941a9bbaac33e44e6d0c7f5344e21102642cf"
+# Corresponds to tag pm-qa-v0.4.10
+SRCREV = "03a22d5ad7deb6021b2ec1d546a960d8a9878255"
 
-SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.3

