Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B185E605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 20so1204766wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OwEwp+/VMdCSBbcGlln0lh7aihVk36KfhQO+X4qKfNI=;
	b=wjNEgbA/PWv1wmYdnNDOnxgFdpAoeZWv6+2ZtGTTAANh6uFAINIg1eIiHbj2tU+uQk
	JI2O2yIIgU3PK5wVIhBqOBn7PasVy7sNnxKnNbz45BpTSECnBXDqzDZu7j617IulHo3G
	vXvtR7rFEibUg36PnUEYl1hp+MUBEYXHKTuSje0EbIn/zurfZ+qVugfbxFCK/AuVa+rw
	0R3JtCge3AfAJ3HyTtKS5qKasuGimzP++AKNb6bbx98FgDRiShx+ksNbJbEWWfFgIEbe
	bdX0MYMlErHtaGu4abx6WTS9yYmbyF754/kn+PMVuC+hP2t2xJtHytFyuLot1WQH3z5b
	s5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OwEwp+/VMdCSBbcGlln0lh7aihVk36KfhQO+X4qKfNI=;
	b=ZpNTxCyzkYRwWrGZsCEA5OuZA/BW/rKDYMUgU5lyRwQCVeTzk4cdPB4ieYobd22Arq
	+SiG+o/hrSFpqR2wZF5E9BJWIMJebz+ekSdvHavTef4HkZWoWzZVohl+kAIzBAJywP3C
	1Qa3fivuLEQaT93qDVgYzNGljUEAxsK6V1sxw4GDCan85OkDvRillC816uima1kwpik3
	B8WEwwPdpPtnz7wK+qMSHKqgZzbjh+/3JwoW2ppmy3LnhZhB5GorH366tNqkI8q2AV/0
	zd0PhdIKUNu8NHIlW6dIk9dSIrqXg7n6j5ldzIdIXXnOXuygyLLOwLDMHEc61t6SGzP6
	uvgA==
X-Gm-Message-State: AD7BkJLGMhqvHkrkydOuF3NQKHgjXUWGqzvS/8bxHLLoP+g92Ns5JHU4Nii3xYZM3UmODQ==
X-Received: by 10.28.187.136 with SMTP id l130mr5289264wmf.23.1459834748356;
	Mon, 04 Apr 2016 22:39:08 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:23 +0200
Message-Id: <1459834720-17165-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 14/31] qtsvg: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtsvg_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index d2699f7..83abbe6 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a9ac71a443260de66f720f0184646847b03fcb46"
+SRCREV = "38777ea7451d55e9c3d32d88d46063016013f60c"
 
 SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
-- 
2.5.5


