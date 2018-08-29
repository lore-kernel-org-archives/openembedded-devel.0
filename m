Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id AC6397929E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 21:52:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b19-v6so6691965wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QtmZNAKQUza8PlzBBzbkzvuPXlRMV+DbjO2O3/TJNog=;
	b=bwY8kzujNworfBXK66ss2jLqBQ6RYX3aZf/8EEzHqJYzR37wWUgKRCUJk6gzcfmL6z
	NATss48Q8+bvou/NjAbW76tF/SERyQDg6yVi6SF8mK37OfkGsSaYlJ39JG7eZIYAXRLY
	Hd6Kt/nlUkcm118qcyshFaVHum72ZzxFvLIVw7yVtlYrsPyl3tk0ZemNYZlXDfq8UuOK
	Sl/eHcAaNkI6FZHLTYitNp2QruGHwoME5F+VeztkCdVZ7fAI35ZOt/LXsDn9uqzuy0Kn
	VXwNL0c93KCTNA/J0HZqPs/FPHhPVER6Qwcfni6jJ5owIPBJcS9W/2Lg8CmbutIYYB2x
	n4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QtmZNAKQUza8PlzBBzbkzvuPXlRMV+DbjO2O3/TJNog=;
	b=L984bXtSWbfCE7htKzBiuc4jtqwiAzj80fxmUxxZAUlLC2GoMo3qg+ba9dJB1kBzHa
	4VY0K23Pj0nWsElEu0VSctnlX10WKqCwXrdTohhToZtBO2JD7EUwdzMolMbt5EfeSUGn
	UiNPgjq16wjiXMKDsI0a5WTTEzEVbSWEvB4Scifx1wjp7L8yNOdlCtfsm2rKicUqQinl
	EyHx9BkWnRdlBUIXxbNeHR3dEKbAqbJ9pxz5H1py6QAB5Z7+P5orxfx6eSQv4lkR5lIM
	y40yRBkJCLiHrVQjAbqBhlQtgt2lpzgFhvOcrpu8/npfI8lRoLPAs2Guo4g7N9GLqHj3
	0aww==
X-Gm-Message-State: APzg51DKCyITHUzp0LdwearS17bJOYdT/rlQxEY09+VGS6RlS7qKtdE/
	AVGlPo/4XsNrl//n5hyg62I0/cPo
X-Google-Smtp-Source: ANB0Vdbeet4x4gVW2DaAvhK8MmewyaIBz+MlgkjnzKv6d+C/RV5KIcVh2tWIRKaHiGuq4TmX7wjdDA==
X-Received: by 2002:a1c:a60e:: with SMTP id
	p14-v6mr5678345wme.64.1535579540132; 
	Wed, 29 Aug 2018 14:52:20 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:1198:c038:2f3f:1b47])
	by smtp.gmail.com with ESMTPSA id
	34-v6sm8734151wra.20.2018.08.29.14.52.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Aug 2018 14:52:19 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Aug 2018 23:52:16 +0200
Message-Id: <1535579536-14562-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] spitools: 0.8.1 -> 0.8.3
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
X-List-Received-Date: Wed, 29 Aug 2018 21:52:19 -0000

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 3f6cdc6..af1cd60 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,11 +4,9 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-PR = "r0"
-
-BPV = "0.8.1"
+BPV = "0.8.3"
 PV = "${BPV}"
-SRCREV = "318bcae5249722873bf58b27afdd20473c7047cc"
+SRCREV = "a3f1f68a048d0d2321ee562b3744dd1162cad22f"
 
 S = "${WORKDIR}/git"
 
@@ -16,4 +14,3 @@ SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
 
 
 inherit autotools
-
-- 
2.7.4


