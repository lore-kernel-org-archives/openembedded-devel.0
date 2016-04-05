Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5620C605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a140so1213471wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NgugCYVHgG22uo2roVZeGojJ5JzTeSbhPVwzMLSKIiE=;
	b=nO6Q2fm23SLBoEbIcQTecqN+Ye5ceIkBurahQg4p1tFLJ5zyrinODTHG8Rm6XFqvV2
	po/tpbbQpfz8/teZ2tdxojGyvAIWjRhWjdMuYUXbGU2kMMPO7MvEKyTTD37c+FhVZROP
	WyMtY60HyL2f46pTUrzfZ9PX1E9WSrg0Db6HH99GVio51RlGZKFlWclCvjbAlVPNJV3c
	FvIYomCCmNj+biMOLF6QuggKZAXdR8aP1QLQhdPb/Eqy8/jLua3PAlr1/kkpBNwTxdCN
	u4xjFgpSsBiQXHdAoitpPEHIvtNIFVBZKYt6aenMjWpbx+SQiFAh68l877kETE+7eQ0m
	CfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NgugCYVHgG22uo2roVZeGojJ5JzTeSbhPVwzMLSKIiE=;
	b=EuhLtQkuZIr0rrhGrF0HDVcek4SRzS1Hc+6TFjSVxeQUWidDiWniwBCbzon6v3aypo
	WQPfGkyeJTIF3FY8Mwvu4U0IzFgJaaO5APvd3GDeBgOFRCye2XeN3sJbuEZhhh/pnZ1J
	QW4kVMHON+BkI1rXJ+HLAJyJCuVi1BhgIVy+LMSrRiUDTUZflVrzpBIU2qrllqBowHf+
	EtvZUNmfJINbXMYJlz6vmA5qVAbQwJA6xdjRkI6drXEc49KnvtO21LRHCxkpQrnG98iE
	NGbXN5UuLOJUVEoDjDt0zZF/CAv+YPQtCXpBa8AEYjQxtFl7cGyxQMV9JBecpxtK9LuZ
	4xyQ==
X-Gm-Message-State: AD7BkJJXDSkDMY21takc63dnq7rDVMfnHv6VyzWBr8cQ/bEAlJwhjE0l69/95Ct9OmPhPg==
X-Received: by 10.194.80.38 with SMTP id o6mr22689945wjx.57.1459834752951;
	Mon, 04 Apr 2016 22:39:12 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:29 +0200
Message-Id: <1459834720-17165-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 20/31] qtwayland: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 78d8a3e..a5e3abe 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
-- 
2.5.5


