Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B3B5A74A37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:21 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id p3-v6so2666651itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BQklaH/VeFVwHEJ87gyZgtZetEMvqxU3g4pYOS1yaFc=;
	b=LSn2Wz7nupQpbOJHwzCna1lMNPXPUqrAL0A3fMJOKtaUJaPlBU0txS2aSQOP4cQeqg
	5Q9EggEd8jZ0DtJ3wuXVVnTVGn15JUm8v4svy2u/NHIxV+gPf7Vfd6ahEQ1DlHPxJ+QF
	wq6K01Ut8b3edPO9qbl2GeO1m19R4VRK6p68UgSS1CXZ/6yXcdnNgdl2bxMczCIi8aph
	NktEjZWnlY185zL7sjgcTNPPF/VTSmmsCBmQylDXq63NLE5qE4012fOPrUPwuhpPfUGS
	o5wLuXnWmeC+Nwf3RqTII4r7TkTa9fIc4ninsNJOOLsecHEqEMs8z9aYp3gvJX0eZciR
	JuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BQklaH/VeFVwHEJ87gyZgtZetEMvqxU3g4pYOS1yaFc=;
	b=Z44CElJtqy3HxkvRc0XsCASfpn/s5Tx/R7i/Yp/Uc3ZUDrzOpgGluPEHzi2tYAa54g
	GFEAGBSWeVvh2G3RIjg7L3x0hBej1jWw/iPOTkI7MN7EeKQ4AJHYvlbhVra8gk5Mf2JP
	zM63edqkMGdvTutZQPiD3WymtXAfjGgP3ixQPN2+dxDv+QnWEpQYK33oFuLiSiknOBlj
	d4IZ3NSWaUj6XPg9rZgVg0uluVsSdj26jT3tr0gCFNkilAlzxkttog6zc8uUyrVYTEj1
	2VsqZkA7qJgmDffAHYU5FsFrWm29vFkuVp3Ow+XeDc9IiuwkSF/6Py5hcMqQv076Fi2A
	r+Ew==
X-Gm-Message-State: ALKqPwfnE3B5QCtLJbYrWjZHXRxICgSWYuPVd7nd2xLJMSkeZH7oo2th
	DNAX3wVxY0kYrInRSel5LvPi8q2o
X-Google-Smtp-Source: AB8JxZqxAz1J1jZ9zPmRYpM8I7WV69ZWf1YQw7pV4Ii32yudJrnjAbuaCuAFaH1ARwWiAt3en+1sMg==
X-Received: by 2002:a24:641:: with SMTP id 62-v6mr8954426itv.89.1527172762664; 
	Thu, 24 May 2018 07:39:22 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:21 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:47 -0400
Message-Id: <20180524143854.24096-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 10/17] ceres-solver: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:21 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index 29917c8a14..a3444b934c 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -16,5 +16,3 @@ inherit cmake
 
 # Only a static library and headers are created
 ALLOW_EMPTY_${PN} = "1"
-
-FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.17.0.582.gccdcbd54c


