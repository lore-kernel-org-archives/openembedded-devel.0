Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 852A960FC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:37:02 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so1339207eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 04:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k+pufMS8fvnHURZhoVrVdGoox3Zup9XPFC3U/B6hvi4=;
	b=E8/hzS7qbAuNBkkojJMcdrwQEKHwJejeUp0KH1XM55fdESHSweNo+KwS+Xvbm1TuHn
	v/ZAV0nY968m5HrKsjt5bdqH3DJ6S8xhhpFMrlueL/3GpEGOKI3JgrYAKoFVZrtzvujT
	/pmTQHHSwKetrLuXXxR9CCAYYwlwq395PTOESanaS9n3Y2iEAdZVlOkJuFmr1UnwbuIN
	wMhkWo+qbr/0SRUZ8Qp7xt63jgPmDAKGK5li2QsC3q1M5okm+KhsqqFl0ejEzbbrwde5
	m7t5Ily+3ZEB3tsIdSY63G0WLIU0PBDXku7u8uWD0kkyetQXNzbBd9lXHkCrWc8PQrI/
	XVVw==
X-Received: by 10.14.108.9 with SMTP id p9mr2684490eeg.8.1383219423958;
	Thu, 31 Oct 2013 04:37:03 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id d7sm7461471eem.8.2013.10.31.04.37.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Oct 2013 04:37:03 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2013 12:36:55 +0100
Message-Id: <1383219415-6769-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2] utouch-mtview: Add missing dependency to libx11
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
X-List-Received-Date: Thu, 31 Oct 2013 11:37:04 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/utouch/utouch-mtview_git.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index 0f72479..6ebeb9f 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -10,7 +10,7 @@ inherit autotools
 SRC_URI = "git://bitmath.org/git/mtview.git;protocol=http"
 SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
 
-DEPENDS += "mtdev utouch-frame utouch-evemu"
+DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
 
 PV = "1.1.7+git${SRCPV}"
 
-- 
1.7.9.5


