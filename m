Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E63E2770C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a140so1212766wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6JfjdR7DFWyLlbQNJwDPmFog1QcKRCcnkw/xXVzLfIU=;
	b=IEej5z2/cSsfDcQ6K4fQ8+Ar/OLoiTg37JbKlKpTzjKOBdJK7sNbrNrbKO72+NOVKB
	FfkKZ6KfRVTVm1WAMLPX8rAeA8gteYRLsagQ/RPTbgKuolvYiAzgjQWocdUXMCV3fxME
	pg9BufO6+It19OkmtFkbrFUuCW7Z0g6FIIKE6jDIc1dZJoFxA2hsIlNxxbN0iWQelk8n
	mFU0R930lFbacfp4kr9Ui+TvWHUZ4njUUYRKLM+dqAR33fE0bRRuoantM82a9yd6V+vJ
	/qRm1i5kqJK5AiCWtuFCvQQfBsZcg2TIE+b6zwffTUpEPd4FU6XgSp/Kaoszpij00En+
	KRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6JfjdR7DFWyLlbQNJwDPmFog1QcKRCcnkw/xXVzLfIU=;
	b=DeMBIQ/IB2k7SXPZn8D+MgDqa3SXIZvVzeglPYJSjvUXBiEF4Wr20+7VusLPAjtosB
	ErvZwvRqHTZ4smi0LaRQFBOEPhWtKxulloKhZvvJO3StbpkE1DtZhucWshKmL8oVXEDw
	1W9u4WSyd8XL4Q2Liz7GiYFNM68C/4qdDK18EEVrAvZuMgpBoCN6vcHqfCwFpIaUbo3M
	2VHkEQWz2KDDWZkS9e07Wcvge7kdAylMSHENaxV4ZvbMc5CnzvX3UOPvjy/Hon60m1cn
	55UStxhg+xUnoFuDFoERgl2HCZKDOIVlm+ZiFYzpTpjmMXcppxHKaZdMLeoGLxfmv7Z2
	Ktjw==
X-Gm-Message-State: AD7BkJKZ5wWRikSlhIsGBp7tn7PmH/kckbLcu4nMIMxC3bu1Hkgq2e/n/HO4bNvm/AT8vw==
X-Received: by 10.194.185.108 with SMTP id fb12mr5691249wjc.89.1459834744534; 
	Mon, 04 Apr 2016 22:39:04 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:18 +0200
Message-Id: <1459834720-17165-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 09/31] qtxmlpatterns: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtxmlpatterns_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c424562..2f24933 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a8d103a05bc195dd045779f3aebdf67bd0140df1"
+SRCREV = "de2dadb8af67f9d425c3a8d2353a7d5b07588915"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.5


