Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5608177224
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so16812562wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CDVUXB422CuE0u0vvH/cv/R590aHI5ko5Y+wzXViiRk=;
	b=Gt9csYaM0/uRjYT2L8MZP6R41aXFwwKq5LkDex+Z6oDT0QRZEGuYxQ6hZJI3Rnss9i
	aI/JmUWdYrWvxjFcINYs9IsnYa5dhKNeTmaJVvJrlAUcKPFyFJgSUbligpfewtyohQVG
	mdnxHxr0QHtH35BSqkteGQ26MAXAax2/VDy7NWmvXun/uOxckxUSTaUj2R83KodADlfL
	lRJHcDIoSNeK75OUrFre0GMuZCm7d2sFRWUONXU4XFPxPWvjgZVZyfWS0BqYxH+zFKZE
	UuolEt+vInPeUPuq8+7CTLb8oUPNoP7WzVw8CwsGNFLGGfwadAfHkHE7VEog197jjCi6
	0QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CDVUXB422CuE0u0vvH/cv/R590aHI5ko5Y+wzXViiRk=;
	b=IZ2ZSiWQvYia1oLv5k5pRvixH+Ah6zpl33TGXXi8+y+eJ0QNI0wxQae6vGwg09/Ec1
	MSUuTfriZn1CBOFfnd9ay+oayKfW9rjbuoMOh6/b5eu7hHIEJdY57Lz/QDO3m/nZ+zRI
	kiI+g7OfeI8w7Tw9MVyJxQU2VtixXRAsXIEu928eZVVB1+suIMyU3A3J9Ynrf07kyba7
	SMsx5f9j2cN06hIfpwLSoaYmnmOu4k1NeW8WiTZi7FDhceznZvU/doi4esJ1V9bqhwh7
	ji3BfX7GODC9BQzp7GIQneSuVLeNoeUD2aqTNqPR1abyMUNXnGNtvJRwwPErwq7pNhr0
	TVaw==
X-Gm-Message-State: AOPr4FVEiKltjfUzrjxf30aRG9BqxR362S69eH65yAISNbKX5wg07NP/UcegAHRxKqlojA==
X-Received: by 10.194.60.134 with SMTP id h6mr11008113wjr.115.1460317323987;
	Sun, 10 Apr 2016 12:42:03 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:21 +0200
Message-Id: <1460317290-4787-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 22/31] qtimageformats: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtimageformats_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b49940b..0a97f12 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "58f19cf8d51e06f1781f3142e6d872e5feb0690e"
+SRCREV = "0bd46d5861fa7b48c87cd3a734d00671df929869"
-- 
2.5.5


