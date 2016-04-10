Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E706771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so16812609wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FNF5NMY1f1uOKJDigxBGNWV5NWTJRYmyUnRLAbp8GUw=;
	b=n+0/DhB0HkxvtCGbHv2v1Nldxcy44eNTkhMcOJniKd8JlUu9DJNBEED8++ORiJnIjH
	pygucK3MY908z+NrFb4Mvzqa8sESVcweYAqD0vN6Z6q8BB1a+MuaCpEvmsQiznCXHHB7
	SEis+c5i7SIwKlWdZLVeHrQQRWGR2rKEAcBQD3PqH/66dVkbIfEjjPn0Rnue7OqOzEDx
	EfYLsGAeGunWQynNdf1/XhT0tmyUOJ6b4M4h+ntfXrvcWQ/YcfZQOtU3z97wJesSwbjA
	PHu2zsKWPvaqNlIiXuE2YK/uoODKl5OORCKV8yXbPiMfvpxCMed7wXoDZhpnm5+sQsJd
	7L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FNF5NMY1f1uOKJDigxBGNWV5NWTJRYmyUnRLAbp8GUw=;
	b=kHaZnmNNu9KRy/TkdM/XX7zGiZvxVeP615OKYcwL08z/dH0w7l+4xx2JsfPz+C9oFR
	BY76QdwzF2QN0gj/5hkBNeQ+1vUQ9BkYWx74UfP7GG9bV3nJx8sxLluh7SP0gyBYnsgJ
	HKHFsG7+ZfekpYUOFg2+cxmVjVxx7lZmViR5j832fSpiIvUKn/px74AS6dAXpAoTEzmS
	SCB/uwM9g51xB+7IZQ1VkRqYnIlfknJhNSJUANmsWSYZBtaaYLMNJ8DXIt4quBu+a+WZ
	mITDzlk+J6CVkz2pNko2TOTjV5MGMnD3spST8/apJCnrly1ZJKNYD92yZyg/mnRHk2Tk
	DgPg==
X-Gm-Message-State: AD7BkJL2bK5IxqQzuwTtz7ExFA3muuDEWF4zAvtgsD4iTRonA8WnuYEGXYOIkmAQg6FRxg==
X-Received: by 10.28.60.197 with SMTP id j188mr14284448wma.68.1460317324776;
	Sun, 10 Apr 2016 12:42:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:22 +0200
Message-Id: <1460317290-4787-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 23/31] qtwebsockets: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebsockets_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index fbce6be..cac3884 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "2d8c94cf11097b61689757f8a0162bb7dd9d7d0b"
+SRCREV = "88946bbe209cb6148b4a3284077bb9a06c7bc1ef"
-- 
2.5.5


