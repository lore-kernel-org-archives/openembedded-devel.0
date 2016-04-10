Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5BA771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a140so16802237wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VyCOE6OkLpihNlgrVtCd39Af4iaIrVg+1S6pohGtpxw=;
	b=g4ITWJB02jL2OtSkXumAWx/V6Jb1vLszGBKzVFF3rJsAVgX7C79cI+wC4uD6or4B9r
	9uWo/aoJBoR6/Hge1FhbvhhBkDWLYTspde+m6XqTKgeHDODuHQa7Y8fszBa6Ebw0+G63
	kiMW18nlr4dZsOS2ndaYK1KJwRxkiAO7zC9n1Vd2MSNqvR4xin2SJ4RKm53UFhWQgyAe
	8z0TnS67VB2N4rYgSXBvgprdRRffVjsapPqKrQJpC7k5SIyItVRrzqhA8Nh5oAm/1sTU
	GMS0xe/a3bDXyHTJ4Q6slk//9heeWspuMAHaDkOQDwt3dbjC92/4ZI/K/GWVdWz+I/Ht
	5LPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VyCOE6OkLpihNlgrVtCd39Af4iaIrVg+1S6pohGtpxw=;
	b=WQhkZcdiptR53dqiCimjkPsbJa4M5BRa0wY87k3hTGAoSEY5VHvcCN76EanjgwDlF9
	FIVQPdu4yNMuV5xcgVdKHcUR1vh/lBoml6aZtS4OqjK6zwp2tVj2GgEugmFc3Bxw0Ucd
	6JAJU3cZZXQeOAMd0z6YBpINLzIAXgzLJIyvn/7rZmbPMin+2mwWje3haAuEOcJEjg9B
	ErddQvTHDU0BVitdciMubZbyzutEoTHPzY51d4W0WufSv6zlTvazWX86+5rsjkvIVB0R
	UPgyOHnTjsoMTe5pPCgnfrW4XbbrM1K67QQiKlYtLGEiLC6vCaDQDzjFLJX8QZ+grp/P
	Nn1Q==
X-Gm-Message-State: AD7BkJKeBG8mUWEL/UJmh/LBvNnyuq/eqIhKyQhcZmjm7TsWgTKKyLASkkH+5yiFwTRfkQ==
X-Received: by 10.194.216.227 with SMTP id ot3mr21577955wjc.69.1460317320940; 
	Sun, 10 Apr 2016 12:42:00 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:17 +0200
Message-Id: <1460317290-4787-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 18/31] qtconnectivity: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:00 -0000
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


