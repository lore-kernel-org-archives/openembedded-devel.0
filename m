Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BD53B7707B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n3so1223440wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9MiE4zKAsS8wMU+ZaT8KK8/fi8B7tUZrWTxoHi9Jf5E=;
	b=Xqa3vfWLUbTG4PHY27UIJFjUTLo4eWsycvzGaxCKvmHmAJfQKHg0XOAkD228L5E+WY
	QqhFEg5fC8U6yGv9stzhnU7LBhmBQseM6nvA+ntBbSxEhxMVE/PyAxT7Be4E5Tls/V3P
	DI544ud44zHlJJjefb0dB83tFBExppEg78UD9Y4dWYR6i16oClJt7girlq5UikLf6Vlj
	h8ypSGkZOFS0r7qNFApJMFQ01YTBh7wX1bDG2ceE2wcUx/eVgSnTxXRoXTsUvODZqGl0
	2Eltd3nNZCFeWBPvp6Vn2fhZY3CoyR27Wwg3BdF1I7t5fQVJHiUyMLbFJOE8q4YE7sb4
	roTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9MiE4zKAsS8wMU+ZaT8KK8/fi8B7tUZrWTxoHi9Jf5E=;
	b=ZgCetOBgrxyoHQMB9tZwbXpMwZBlyIJbHgTBKYvLd1TIY8PAKSBVhMw/+3+/a2SQVM
	z9Q1y+nf/i1/+mXHuBsaK6gl6uXIhOdF75h6o7SSofkSA4W0VtCThNqARlCx3AZVJzSd
	acWx1gc4MQMJkF3+biNhLakXlZAk/zYFhvUnBpmUGQQzokcA5ajtbgWvK6YAOfIv2MJ7
	fXIMPMDom0miiOw5T0C7psBOaXXzVtq3WuJp/YjHYVCu6K3L9lM2ox90PghanY/C0eNE
	mgztC+DnUQFW+Z4njLsM+k2me4UEwflKeHhTgoOSqNUooGMC/Q4YU9byfzDoesMPwI/B
	v0fw==
X-Gm-Message-State: AD7BkJKA7ErSFXNMomsQN0fBBDBf9WhDytF2Sgvv8pgLywcB0seSeETB4FL2Q2F0Y7qeUQ==
X-Received: by 10.28.175.201 with SMTP id y192mr16134559wme.54.1459834743146; 
	Mon, 04 Apr 2016 22:39:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:16 +0200
Message-Id: <1459834720-17165-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 07/31] qtsystems: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtsystems_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 868e051..f0131c1 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -33,4 +33,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
-SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
+SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
-- 
2.5.5


