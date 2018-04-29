Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCD360402
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 16:18:09 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v15-v6so5933653wrm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0EM3DTMsBs3RkSPTr6DbOtx0FTVg+39la9xbgs24AUU=;
	b=bVa5Au3N39yGaNlK/ZmeO4n1qaLJBGGrVBZrGYR5kdRnO4Hipyn8h+xEPDkc9sRHEU
	G2+K+IDtfYjEpSIdm0fmnGI+EVrJ0yL+CsCqmcV9jaiTvat0u/C16RDtQZ1YIqyhZDGk
	+LbCwxYmeolGyIvmdMUZ50GTQm0OzVuDD3851TuOKNArJGmYMR1HSITveb3DmlAHc1iq
	gBwPeLP/I3GZcks/fT+lwk+gQlO0E/hMFh26PFwDzvbj9zsCzU1gLMzEh4t82xJjzDIn
	XR3nRVHQa5v8AhNbKr/DxLn51a9N1G72kSet+cMY8X1G80KaX9Os3nbHuSCzlrBDDWVV
	vzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0EM3DTMsBs3RkSPTr6DbOtx0FTVg+39la9xbgs24AUU=;
	b=N6RLs4Q/ckr32nCQm9w40Z+kw+e0BTgI/Zl2oHITBHyQk4XKP1gKH68jZ9DT70dsdT
	ttL8hrkL1LgFXiyWCC2FyLmGWHG6u1LEQXCmVwYaROFRmyyBSkYgzXT3yKY8Shz8E0Ky
	6rWfBzhh1TQEmaHtVZQ3gU0mnK+vZINHCdGAkvvWzLpFcihxMCS71XY2fbUItimW+qBX
	/30zLoeH2vEHrGBu8gHZpYOeXsM3SO99bMy7VTF1siWdZOQjbWu9VS5hQSpjsJ3SyM+S
	wQULvMXsRbM6oyVS0vSwiHrLoQsO9nChgHq0nd8YDeXBN/x+Lg3uQsdGAvXdYV2IPNn8
	aqfQ==
X-Gm-Message-State: ALQs6tDq29Tndj9P2X9L2Cr8GCDg7/d2WwVw+4i7NEZg1QMlphoj4OL7
	IHFp/JGxs0yfy6wSUFJ6GuSaTpY8
X-Google-Smtp-Source: AB8JxZpbvMwoRoQekLJoAmv3vBxsRx5dkJjSDtbHFtGMud8krdobglGkMJ8PgSZZFT9mEdf2p3KhhQ==
X-Received: by 2002:adf:9814:: with SMTP id
	v20-v6mr6989048wrb.93.1525018690266; 
	Sun, 29 Apr 2018 09:18:10 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	d12-v6sm6050870wrg.2.2018.04.29.09.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Apr 2018 09:18:09 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Apr 2018 18:17:49 +0200
Message-Id: <20180429161749.29535-1-gizero@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-python][PATCH] meta-python: README: drop outdated/confusing sentence
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
X-List-Received-Date: Sun, 29 Apr 2018 16:18:10 -0000

* declaration of independence from openembedded-core and meta-oe conflicts with
the current state of the layer, which does indeed depend on both of them for
building several recipes (as correctly stated a few lines below).
* anki was removed from meta-oe as well
* gateone lives in meta-python and is one of those recipes with dependencies in
meta-oe

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-python/README | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/README b/meta-python/README
index 0566e4992..705b035d9 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -5,10 +5,6 @@ Introduction
 -------------------------
 
 This layer is intended to be the home of python modules for OpenEmbedded.
-Modules in this layer need to be independent of openembedded-core and
-meta-openembedded/meta-oe. Because of this, modules required by 'gateone'
-and 'anki' are not included and remain in:
-        meta-openembedded/meta-oe/recipes-devtools/python.
 
 Dependencies
 -------------------------
-- 
2.17.0


