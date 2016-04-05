Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4E3605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i204so1221778wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FNF5NMY1f1uOKJDigxBGNWV5NWTJRYmyUnRLAbp8GUw=;
	b=pg4qc7cwogF4pqQg/rKC6ynD12jqbnEKPq680eo5xqt8OVbJAu0m3zOUou9i5zFoxX
	VtZCofcdnrHTLJT4EIcTyOyYwvUYwt6xLZWRI7PObCr69An3UXBPJHfUNfqw3Wag/zlX
	zYbO8OT/oRFChni9c5mpP50Q3YelnKg5Ejfx36ux6okMlPWVANKMxlhexlQzCk99NelE
	QiTH6jrHUg0P0YgNTicBk+WH+NhNQou/WcYm2zgbv5AyF2LnacjCRmVcJkNPWWklD6JN
	FcmHpP0oxJl+U0XvhvJJMG+SAvHG1th/kBixHY6Q882l0E+uDZljvPhsBEtS7R/3kadk
	m1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FNF5NMY1f1uOKJDigxBGNWV5NWTJRYmyUnRLAbp8GUw=;
	b=EAZrucoJEc0Nh1otmjNjyF0Cqv1PXVadThlnKQu79pyp+6yRhdP0A3XfMHWhXAy5oe
	zjoYjNwjhgDKPZPsXfU2M3vkp7XrdHQuNbFwQex2/TNfm8YcO6nfoMCPd9rubOuvhrrY
	kHp1OFOXGIMlnAXjJoiGM7KsUfMBxfOgQV8WkKBTpCImGOnVNrN3p4Snpc8kV0m4euvI
	f++jYt7KlfSheoTVYU7blq8Zz3IGF2LwFvK10xS5a3Qmw+H/9121ujjwafh8K3qfEusd
	AcpwwSCuG1RBpdrhcxIiM2vjmjoxJ5bZleoaNhBbPMY7tRMcen+ebHFjqtc6VfBic5mc
	LD6w==
X-Gm-Message-State: AD7BkJIF6GGOQqCDI9rPmDwZPclmEhk59yuIFbkOunSbi+YmYZjwkrae2EwjinH8rygEMg==
X-Received: by 10.28.226.212 with SMTP id z203mr15995214wmg.73.1459834755149; 
	Mon, 04 Apr 2016 22:39:15 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:32 +0200
Message-Id: <1459834720-17165-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 23/31] qtwebsockets: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:14 -0000
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


