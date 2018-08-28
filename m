Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id AF6AA755AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 18:48:10 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c14-v6so2915235wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RP48A7QYkfBwg0jZj7TbDGQWt/3jV9eY2XrtVEtZyBU=;
	b=ELS72vcZjq/R+Ok9F6Giae6I14UL4r66cNe3VEIKJBcU0wAJuORNmnPJXlF9vPqo0O
	o82jvUwoWO/MDV31+VZsD57xK854KZfelM+faYhz7gah2ZV/ZRuyciN+0qyfpq7K0pI0
	GQtUL9MjjqIRyRuQnAo4q02QGVg/IHzyiYoCWaSSoMd+JKEsibwkjq7m5RlwRHop7Q03
	zKFxigChDq0HLiLr98CsZfqzb3EDFTF7OmmiZulLcNamoMT0vTpuQpVKvMjFpu3S8N/J
	lSVdile/8yQxRyB9o2XA/80VMkGTxCrGaf/0M/M001AgKajejdB7UKTueUQPyZ5Rn96s
	6rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RP48A7QYkfBwg0jZj7TbDGQWt/3jV9eY2XrtVEtZyBU=;
	b=LE+qRb+DA/qizKx1/TUrPwYtqM7b4EZrdd4ExH8RwZisvHAFsMPhYmex79K5EZFJ3r
	1GjQg6RL5owBWORV+iHD0WtSZycajDWkZ85DuXVXrIT8g0LEIYg1RsCHl5jqfLhn3Gi8
	qRtrxgehZ0fcvhG4djTN78G9odUi++Mt87iwTnYALKNR6JAuFoetbRFf1aPEmbzD0FZt
	PFJ8xu4jrfbStVd3UPesR1j6bcY/1lSDhahExIft9LeT99opmdMZ7kG1wj4/+2wafKyr
	lSStITta87rS2p/8EnHTJQ1EDOM1B1A9DsatQJVh0ElwF3eWlRXeDT0fo1fI6WFlRB54
	fyRQ==
X-Gm-Message-State: APzg51B1ckX9OhCxWfj6OMEnusgWmMqvEbrie0qlxkomq8sxgof8mEOf
	B1HjYiiSxJMax17ftJA000FscicW
X-Google-Smtp-Source: ANB0VdYCusxzLMuBh9mwGlt+YSagw7jbeSbS/Od0mHe9iNZDFBFZQLsQNYcMI2roY+uv3wsDrf5R2Q==
X-Received: by 2002:a1c:7412:: with SMTP id
	p18-v6mr2121115wmc.49.1535482091220; 
	Tue, 28 Aug 2018 11:48:11 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:bc4f:281b:73be:395d])
	by smtp.gmail.com with ESMTPSA id
	v21-v6sm3044938wrd.4.2018.08.28.11.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 11:48:10 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 20:48:07 +0200
Message-Id: <1535482087-19250-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] spitools: 0.8.1 -> 0.8.3
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
X-List-Received-Date: Tue, 28 Aug 2018 18:48:11 -0000

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 3f6cdc6..4944e25 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 PR = "r0"
 
-BPV = "0.8.1"
+BPV = "0.8.3"
 PV = "${BPV}"
-SRCREV = "318bcae5249722873bf58b27afdd20473c7047cc"
+SRCREV = "a3f1f68a048d0d2321ee562b3744dd1162cad22f"
 
 S = "${WORKDIR}/git"
 
@@ -16,4 +16,3 @@ SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
 
 
 inherit autotools
-
-- 
2.7.4


