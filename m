Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4234770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so1224083wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VyCOE6OkLpihNlgrVtCd39Af4iaIrVg+1S6pohGtpxw=;
	b=OVm4OAK7hAu6OmhvHl7I6kx6peacXDUFQL1zk9qIPXFovO93wyWEz50kLF4MeQm0hE
	W6h3wXF2/obeaPVKNNpYNUpvlZ90ByqVJx5kr2e5u1caKpKJrAGPzgV+ofgBqsYgoS9k
	yjqS3PbRtviZ3tmWIA17tvd0LMqDKLxbBYZJcCjLyLljQjlWno/Go5vfVb6NVVg+Ziay
	B68FJyZT8Zei1LLQW6yFf0SKixApYkQXHnfG/KfSC2XwDKyyZx8E15/UDUCy797HlJlv
	mCh9GzSY7a/DFQIt4ThM64yOslicUD94lv2DMdbMuqZlMn8mbMP+Oy8/EK4ZmAjRUyjU
	wmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VyCOE6OkLpihNlgrVtCd39Af4iaIrVg+1S6pohGtpxw=;
	b=mw3nVnCNnpalhZAR41zFXkWuR7mqZX+ZZUZHxrvy8/aNxGNNE9cXQTwd/dUmqt/PSt
	pw81HIGi0EMEdVsG7OkgBU0Q/doLdclop0dFif5X0wu3iUDMJ/4/CbAyz94G4CsilDw9
	8OroozOxuZfaUt6vx1QlxzD6erkELnFlcDvlqjV2VSRN1BVjSzaS4/cdjvbgzKu/91YW
	BztZ6YREqGuwK2zYCh2mp9Hg0nRDV7Okhq4JuVfOkafs8UW01f04NeAKAlts1r4EUdmw
	Inrt/XPKLl26BInx5CyHx1pH91nx4G858KQWPFEXinJBdOvYMEbmBooQtnmBXvH4H0QB
	i2wg==
X-Gm-Message-State: AD7BkJJM7mhsc3Di4u4Q2spNmYDVnfQsc4H4w/tTw/oPQvlS/UUpXbNyji55h+q/9Qq1mw==
X-Received: by 10.194.71.46 with SMTP id r14mr23197791wju.100.1459834751440;
	Mon, 04 Apr 2016 22:39:11 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:27 +0200
Message-Id: <1459834720-17165-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 18/31] qtconnectivity: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtconnectivity_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index cf6d3c5..e311384 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dec32076b9153febc575a0418af702f8cb400258"
+SRCREV = "8b550f0a7508ed413cded71a20485e61010b0aa3"
-- 
2.5.5


