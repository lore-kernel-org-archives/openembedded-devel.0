Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EEE3E771FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y144so16734946wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H4X+D0Wo2A0Rahw/w8nIKO9GqB20AdOCEewSAO3mRr0=;
	b=GOHlsDHbkOAaQRKoIJ/G7gSdcNU4cZLEU3rd3NttnA7VHyLViNci/72uoG3h+BM3wf
	9W0aMRjwwsLdBFN1sDvIFR1o0LpfzxDYATeEQLdajC4K4e2at4ulMEvOjuS8iDviDZ7Z
	guhHs9BdVJrZZyr/BVijF/XokxInsTp2rgLzEpAjezCpnQNYsE/skls/xsh/rSzQSpZF
	ipYqrkzhsN4FUG3/Hwkj+GwKJhYdONddOLnNtNpWMgnou1mzztvORcnKFHzf9Fvb3KKu
	rOpHRD8VA1RbwaCPyRHB7F05+qLVzlEk99dNvYjXZFrEQbirA2X5ByEs0icBUDj3DvSP
	FdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H4X+D0Wo2A0Rahw/w8nIKO9GqB20AdOCEewSAO3mRr0=;
	b=Q2HoN7T0YuLaJ68EmWNHwowWd0s5AspnegNQpML5sxfkh9+ZVbXSMpQlj3F6fLEXc/
	00HVXkAKV7E2yxZpvD3wyy/CYiN+f2Z4Fa9lIAe9YOSifc/izoGKJi0qF/R+lGtn93Sd
	BhBoGiasCB42S23v6Sib2mJsmIeUI9TGIMsV+kFUAGJ32/ugFT6mHe4ngYcpaONlVcRJ
	2YVEtH5iMfFjdazWMOYhWBYwiDaPj87uLGUmR8TCYp9KIqxZVrn4j1MW7EIcaFU7k/t6
	l1KfvjGLb9HEbQS+3x+Cq8ZaOQ6nHtXHZDOo4FWqvdzJFVDnM32KW66qmFSbZcznd0zH
	Cs8g==
X-Gm-Message-State: AD7BkJIPE4ivRjibdwqDEqz0v/a6LP5Ad+sFLy/EU+24OY93LBTwaL/V++CAxy8Sk9U0Zg==
X-Received: by 10.194.176.129 with SMTP id ci1mr19639040wjc.166.1460317311598; 
	Sun, 10 Apr 2016 12:41:51 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:05 +0200
Message-Id: <1460317290-4787-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 06/31] qtquickcontrols: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquickcontrols_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 1e25d6e..900b57d 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
+SRCREV = "85c2d2cce4c7d49bc425ccd0be2bbd9841b7e79b"
-- 
2.5.5


