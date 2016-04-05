Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 02822770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i204so1221516wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8QZq6Em/QyJ8xFCVnJVrg2ykYY30tEuQlH8SMMTMXA0=;
	b=Ss+OQCF+/awavkZ/Y0j40RIt/37Edc/XXbinbQRAepL24tkJsBqw9s+Mgnsa9yFAEW
	rEOxEEQlaSD+54JlsiV3bYbdsS0tNQvW4MtcLs7KZEDOeqf2EsEBrjo4tGZrWANu4So6
	sMBxErSD/3+JzGUjB+jh8Ax7fkULN5tw1F3UTbrwvGUQHadpj4B9ZLt/Hxgkzj8VFh6e
	qGFxwHlsNHKfgkMyrW07BErTTvbRTIN/7k3cTG+xwKX9coYQbyjaqrjdeQw1RFhpued+
	fEOmLyvCzLPhdlqLUAV9xp59lyKrNDdVsatCsVCfcekDlMt6c4vD6nmkFPwW++vieaKY
	IK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8QZq6Em/QyJ8xFCVnJVrg2ykYY30tEuQlH8SMMTMXA0=;
	b=c57170Bfmdm16Rg2l2H9uaka7ruVjsGM6Pc2GV2P3AK52wTq2/yHY07RZhSY7yeNrl
	ehhGX4U2eez0PmhzSPiqhy3U0hqlZuwYLROpyN601c83eZxAgl9mqg+ZMr5zXoxpfoFw
	5Q36CWeZ3WkAoqE57HuZW2tg0SAzyVe/1hThhax/hRBb8G4OT9839oTR1T98pUbpw/f8
	xK7tMuBUmaZNSf/bmhw99QbWuyVhUZzel60wFtn9lZeBAzmnEP5XPNj+7PZBlbD0OWk0
	RlSMwRDsTrmO7TysOmgYj/dMm93gYuVCbTh+rZQSlTN6C74ocia8fNw75QlxzMi2AHd8
	cGPA==
X-Gm-Message-State: AD7BkJJOdmai+duKWWjJoEhfvgZ+ghQLXigsL/d+FZxUD6zq+bE2WHy/fM299cADjUiplQ==
X-Received: by 10.194.216.227 with SMTP id ot3mr14554246wjc.69.1459834749116; 
	Mon, 04 Apr 2016 22:39:09 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:24 +0200
Message-Id: <1459834720-17165-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 15/31] qtwebengine: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8f5276f..af5478a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,8 +119,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "3f02c25de46f5ff296b8189af3435ce5800b39a7"
-SRCREV_chromium = "779a2388fc123a7f3a178ce2ced921ee4a307e2c"
+SRCREV_qtwebengine = "5c4ae298b0a3d75c4c5ea8aef0595914ab25607f"
+SRCREV_chromium = "cbe3845eff59c2d1726ed3dc0f934f7f483a1271"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
-- 
2.5.5


