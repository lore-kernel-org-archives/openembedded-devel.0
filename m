Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0902460796
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 01:33:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x64so4885989wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 18:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k+t9Aq0PFvwASQ1edXap14VIEQXnz9NsalEaVWN70wM=;
	b=buHQUJvfTdH9y9hcbJuTX06mR3g7v79La9zRIroxSkdQGN1sF6Tv2FuNGp/rIMHP0K
	vl9Gov8cM1mDSaqwHpffU/UeS7dbO1VgGIUI2lJiDXLEw6uVaqdH/gVt4WdjWEQg7+bA
	7ZW+K0ZwtkErA1HE8teHW1fuoBQnPcfyURHctIUVI5SgZKZwJWqapDyUCelitMh+A4sB
	SzRf55n2iuHYCkaztOfR9bFtnJo4JyP8sYEbzuWDmKWpmT9V61xDdYMuXSHU44Dfk/iK
	5FcS0FRB2l5KK7TUuZUkdsQuJKqhPX7T9s8PSPzqoKL+7heMgiPWhMpaf5t6Ghr4jJPk
	Njjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k+t9Aq0PFvwASQ1edXap14VIEQXnz9NsalEaVWN70wM=;
	b=JN2NX4XcY1LhKqdlyQD3p7nPnWKMLSaGGlD6ZXSGYdDYTEBgCE2OTDlc3AJ5Fw6qxw
	vJjUAvzMCLkJEnpYOnxrGkdO9M7WBM2zxYg7qXJ0yna8VqN5wZFoikpXHBsecbXerzgy
	xEzZVhDTAtjtK+ZNUIK/7TtN6Qe6XGYCqXB8im4HhqXEq0jgPpaXjfC3m8FmhaZGaMZ1
	uNAHQf0xpKlQUTzyk1xZyipPk92LY9VKhg8fMoyVbv3piTv0Rvx6SHzsjun6ePvog2YE
	i207seFoKDCFDXFHo+91YkK71AmFcQTGHFtNKaihTujvTATdLJTw2y9inJYiDda8iLvG
	2d2w==
X-Gm-Message-State: AHYfb5hS3WAsdGhUtc9NbSweOEzZkobEIgy/CM2eDsw+c4vZwBkv8pat
	YEN0PwW8iDcTzIYt
X-Received: by 10.80.128.197 with SMTP id 63mr13669700edb.206.1502415182641;
	Thu, 10 Aug 2017 18:33:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240]) by smtp.gmail.com with ESMTPSA id
	h64sm3392104edc.55.2017.08.10.18.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 18:33:02 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Aug 2017 03:30:05 +0200
Message-Id: <1502415005-30828-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-qt5] [PATCH] qtbase: remove qtbase-native from DEPENDS
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
X-List-Received-Date: Fri, 11 Aug 2017 01:33:02 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

qtbase-native has been included by QT5TOOLSDEPENDS, so this line is
redundant and leading multiple qtbase-native existing in DEPENDS.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5cfbcfa..f4323e7 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -30,8 +30,6 @@ SRC_URI += "\
     file://0008-configure-paths-for-target-qmake-properly.patch \
 "
 
-DEPENDS += "qtbase-native"
-
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
 
 # for syncqt
-- 
2.7.4


