Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF27F74BF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:19 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id z6-v6so3625137iti.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SaxEZ5sPVDj0KA/0gUnXh6nRwYfykuo/hD+/u44FB/M=;
	b=PmUcl4zK2nmwq58QAZu4h46nFDhMIO/oN3wcL1ov5B83R26bOMSKEmTf7rPGLPRmjs
	Ps7/5r9SZqSD83WkTnqp4WNPUxAwzHxNU4dAcp1f5cN7XJ6CXIcTFvNzBrR61tZyzVvD
	mGRnaRPN4mIm/8+e55XZlTwNYX3G70f12L6ObY5Fxflnbs7ViTj5TXN/tsaasXAtihY9
	1ytONnTzeuWYIDlWUJbSVHSo6oQ8GkW2G3Y5tZeu6PP0k0xTuUzlABeMl/udBSfaYsBP
	B0Ika93oCv0Na8Jsp6L0eUq5/VjCQr0i1GXjONgRjTBoEFs8A+LrCnY6tIt2I70CEHSC
	Kd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SaxEZ5sPVDj0KA/0gUnXh6nRwYfykuo/hD+/u44FB/M=;
	b=jIgmE4J8EYP5hikpzDFwaDiGnT224KQIl2++kIULb0RHVgw3skB7SITeAVCjyzk/L+
	nzyRGzJ1sh66HVU4bb4rs2LEr0hSybwsWAJgGPnqprScWTS0j/SL35ZvK0RbB4pZXPwB
	OrQm0UB0ap5nm1jYn72QqjinAbMbCcePTNQr1wwDHlFUZWlNmxZ+1ViG7/T7gI4fEQ/F
	t+4sFGXqQyQ8UVahL6Oj5nhIT4OUEy4CtPR/fC7YflvuJn1l+SteORq9HYVn8cGNZnPT
	itxbsgDqcUGYF1MxNHKNNHSqGQZyExlI6H8ktWY04rVDzyTMT9WO7qXQie6Edml7HS3U
	l7Vw==
X-Gm-Message-State: ALKqPwc8ovK9anPvjOKXnd1SDtV2MnuHDGhZvKtR4JxrP3y8exlTwWPu
	Pv0M4M/TEgviO746sudswUDg4ebc
X-Google-Smtp-Source: AB8JxZqlWEsBc02PSq0LbJuB9h8YkKvTDfxs/rCYc4CyggaxepfOiWq1aVTILygN41nuhflI6TlIRA==
X-Received: by 2002:a24:478b:: with SMTP id
	t133-v6mr10930957itb.145.1527186440327; 
	Thu, 24 May 2018 11:27:20 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:18 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:53 -0400
Message-Id: <20180524182659.19986-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 05/11] ceres-solver: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:20 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index a3444b934c..ad7c8f2a3b 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -1,17 +1,16 @@
 DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
 AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
 HOMEPAGE = "http://ceres-solver.org/"
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
 
+DEPENDS = "libeigen glog"
+
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
 SRCREV = "facb199f3eda902360f9e1d5271372b7e54febe1"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libeigen glog"
-
 inherit cmake
 
 # Only a static library and headers are created
-- 
2.17.0.582.gccdcbd54c


