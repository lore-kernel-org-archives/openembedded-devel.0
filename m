Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69250770C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i204so1221087wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Dusgw+PXlib4f8Hg5bqSK4AGdc/VxBIIah+fEwci/NY=;
	b=EzztNxDsPnr/yDljRQUJQsc2QEzumESemzs6Axzo0YhzjDv4sc8p5ivHS/gm9VZvhX
	wTPAYf3619DH7ikNGku8eDA3STfVMBMvj/RCUszcbtugM6LZAR2b5ElOHesrxD0SGthd
	nJoBohEiw7wh2yCEMaoqGxGzWLLwsMsxG2lCgTrXH06fb38AHsHB29p1cdu6DtuVsUsW
	0oUXDSEA2jnzNOu7WR6ciSVmVcdiRevw6WDNI3CppAIS6IBQrajdQBxSsJKUacNOipYt
	MafZWrWQLcRkn5esCFJ2SpuOhaGnREwPduRInFh26UOpqpibX7KfCJTHvtE2eZxVWrbA
	DGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dusgw+PXlib4f8Hg5bqSK4AGdc/VxBIIah+fEwci/NY=;
	b=PKnjGnGALDjvAYDWr4Cn8OK53JBI2CO+1jWx6iHkMOI4tmm4Fe3Y7Pr7P7a44m8hRn
	JAH3S+VLgZTmWm6ByxgYRfZtosJ/QOkTuR2KG/++tO+hQAsCylRTRv/FuPTbTsSZs5lD
	b5r73eWO/0e7vTdY4i6r3ycBzYiJbIb+wnBLjL3FbWxm38xC/nZf/FyrY5aJMzjCRI+Y
	VQTCfP9v5YWy4/PKca97HsK8uZTww4AY1QQJut8xOHum5CWFmfFuuploA78S1HI1w7NA
	ZUk3QsObZCWCoL+BdDbbFC+nNthvTNJ+ugJ7Ma3dZYNqYjUpH+bDUnnwsoG6V8Omx9JK
	2ayg==
X-Gm-Message-State: AD7BkJIzgoF0nI8WoI7Yq7f4aKPNYh9QjcGtaY3fWlCp/BUNyLtJ5UzUycjw4tF0YyWrrQ==
X-Received: by 10.194.246.194 with SMTP id xy2mr16970430wjc.65.1459834746063; 
	Mon, 04 Apr 2016 22:39:06 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:20 +0200
Message-Id: <1459834720-17165-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 11/31] qtenginio: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtenginio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5590abd..23b9417 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "60a135102aaa37d0d817883e4d6aed456372709d"
+SRCREV = "2a19257a5eef7a25a05d5cf7ea69ecc4184226f3"
-- 
2.5.5


