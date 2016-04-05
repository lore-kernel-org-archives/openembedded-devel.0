Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12CDB605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so1224190wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VS26SplZCOyS1BFfksZAa9w32a0wm50V1QcLizpnNRk=;
	b=S9msJo004TFgYX+s//f2MaIWqEIsLSbJnSUpalzfzcPPPuRG1ABgQC3IY1heAma5ol
	xz28XCyQn2I5ojFOEZ7OT+MAM/1T0zBvZjbTyelproyVQuByOQXHC09kEXuJutGhqRYw
	AmKgg/gWbKWN4actV4w6m+rWz1wGSfUuOzv09mmB5RYQTaMh7aQEayjpLTntm2i0x7Vl
	P9hqt3Uz153tEEy//tFK+kef55Sa5xuRYoLYaz0qItXxN6erE0UoDcLGaVkKU/pj+6HG
	aUUG4ni7HE/OBN+ZPAcax0XdZKUgw7pP+cVwLU91GO/BlnbysUawvgxETsgW7OmH6pSW
	n1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VS26SplZCOyS1BFfksZAa9w32a0wm50V1QcLizpnNRk=;
	b=CEPOV0xpvEeU44VmENg979vZuZgkTgp4ltFf8F+QtySgpn8Kc9yGBJWHuHeCBCSJx9
	EWo+Q8G9PzrLglRluSmrBH9TAocido1MFXWNuBOsCNp+xu0YnZ2mdk/b2K4XU7IoSUC1
	vGd5dILWGcYdIE4hmRiMFMYBQmoarXu0LxxXV2xl3SceXxRMyBkRp7y823YmE3tJmZc8
	O5hrFXC+/C3XZCZ/l3zylfI/5FUpC6ZBjJcts5QKNp6ucuOVjNTrZraOGFe18KEipC1h
	hYVE6Tjtnmz5cYdl51AEyk8xss/O7mDsjyYMehGkbQci9YHwRsSjRLXRYv/occ6RQGxO
	oWCQ==
X-Gm-Message-State: AD7BkJLuNfV4r9PSXFKEz8qAeov48TrRzFFVgBvh7QKpdbO83lYHQVPSMsZrPtV9n4qJyw==
X-Received: by 10.28.127.4 with SMTP id a4mr9132710wmd.76.1459834753699;
	Mon, 04 Apr 2016 22:39:13 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:30 +0200
Message-Id: <1459834720-17165-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 21/31] qtgraphicaleffects: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index c35cc80..7d9636c 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "24f3fd69a2e953619c48b4a632262ce8419fee40"
+SRCREV = "4b8e9a348ca379b203c26ff14dd236267dd60646"
-- 
2.5.5


