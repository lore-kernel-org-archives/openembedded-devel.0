Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2190271E1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:42:44 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id z127so6822419lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=iE/GtDEqeNomKhL1brnvhInjyv5h+e7d+z7VwIKrHPk=;
	b=EwfCjookKUfq1xb2btql8JcEJxRl6dapRwv3th6CC2QkyHlXdaszXDzZyQ5A4tjOb1
	aUPWRpfXpqivqER+fzndJl8i9J+jVAb5UtRRH/nf00cFcCYy4+/VYI4ZeQbvh44GI6PE
	jrK5BKU7izctyjyjLonjtRkmcZyvupx8aHRP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iE/GtDEqeNomKhL1brnvhInjyv5h+e7d+z7VwIKrHPk=;
	b=Yjc9kwex+gRGtmave5uQxUVlJgt/5HgOdrjZ817XK8g9EkO2Hy0eAsnQj/dsK1u46/
	R8ExxlAj1Z5TH026nJqUN15CUK3yIc529E3OMZ2GN6XAL1x2FMfrGi4rWhd/gpE45Y55
	r1k3bOtt53RD2ZykiV403Iz4QGr47vUiijpLuNJEpO/AYKLlxB67i0aH4oE3NQPSr1LM
	fHqvFjwdPjpV3BSMHrBLItYXhjZE2MYnh5y7OATK2jICEmidJPamL53zkUkYUYGNEJ5J
	cIKkpftP4x85vOClt3kx3lSf1YWf9iKSMHoWfEb0cDMuPTijb4DUvZyQS5BpZzXU4+Kx
	gSSQ==
X-Gm-Message-State: AMke39lCcfDvRlqTvuvqjRZAGf28EdJSsXqUb09e/dktMzJI/xOsDnAokBocXgyOUkX77hzF
X-Received: by 10.46.14.25 with SMTP id 25mr529957ljo.55.1487245364395;
	Thu, 16 Feb 2017 03:42:44 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	i186sm1624965lfg.38.2017.02.16.03.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 03:42:43 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 13:42:38 +0200
Message-Id: <20170216114238.21210-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] fwts: upgrade to 17.02.00 release
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
X-List-Received-Date: Thu, 16 Feb 2017 11:42:45 -0000

Update PV and SRCREV to match 17.02.00 release

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 6c4cd483e..6df6cfd52 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "17.01.00"
+PV = "17.02.00"
 
-SRCREV = "0d44a57aab82c9861b6d36d73dc2c7c8a6696c21"
+SRCREV = "b5a7b3c478f9438343ee63ad0cd93610161515c5"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            "
-- 
2.11.0


