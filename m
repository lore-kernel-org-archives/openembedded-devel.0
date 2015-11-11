Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBC376E4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:48:24 +0000 (UTC)
Received: by ioc74 with SMTP id 74so23878657ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 20:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9dqgFFbj/pJwKWBsAjk5PyZZlt0TdV28I3Y0GSzCRx4=;
	b=D5Mgubo79grG+atuZAHcpwssPm2jjwDsw8Vh2NtA17vV9UxS//E/obdQhA9+le4c+H
	AfzNPfWXTfhiN6OUKpHr/fiUWfGKCUZXfl5U7dSVl7RIWB9oITEo6j5v71Eh9pNkcFp4
	vmtnupJVgFOP1tuhipjwhtPnXTkDq8/Y01uUq8jmEEcXAVGV+p4CfpCVdI+SGabHsuyR
	zw/jAKOQ++VXcaywx0m6eaUMuQoY7nurANm4rAYZ9xtfv94T8/WA5WRFznbZF2BlsqpQ
	rjyhmYUjBhnwHrBvHWNwPGWyr11+FMlh9cgcnvPzYF1u4ggqwHIumyFv62O34krGeRJ3
	rwGg==
X-Received: by 10.107.170.213 with SMTP id g82mr7168104ioj.178.1447217305006; 
	Tue, 10 Nov 2015 20:48:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ie20sm2628295igb.10.2015.11.10.20.48.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 20:48:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 20:48:15 -0800
Message-Id: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Wed, 11 Nov 2015 04:48:26 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index d827b8e..6872e5b 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -60,5 +60,5 @@ do_qa_configure() {
 }
 
 do_compile() {
-    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
+    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
 }
-- 
1.9.1


