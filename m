Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB6177043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:20 +0000 (UTC)
Received: by wikq8 with SMTP id q8so9668146wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3yweUf+Pm8SFHGffoZG78oRRgsI33HaSGMKKCFJHaBI=;
	b=qtJiXxgdab93v+/UInvnPbc0s8rsXILG4RUTrXsVT1gavLAcUhsabGtSUlImfyzBBA
	Z0Cj5s90W4OudcKlAcBjSWZLMZOAgHA1pTnkTxnC0LjaEDQHv49jZC8YakoU3Bp8MMSu
	OIvEFDn607FBlEFUJNe8dVIxEJpoNQW5Psc8/JiS25GkAWmmwDQtZ9wSYySzsjqgTtMM
	NJMvSmxPfWxuRmMots7sUZxw461mYpJNDmD/+ETWo3i/w6ypRIQtHiVsGTQg7VGPUtfA
	RVeGOBlWX8QJs19lX7/9dtt41TdGVietaN9Gr5VfReBsYj4BUKAZXcJvrE2ETKY+5MO+
	wpiQ==
X-Received: by 10.28.137.211 with SMTP id l202mr2875722wmd.18.1446207260574;
	Fri, 30 Oct 2015 05:14:20 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:37 +0100
Message-Id: <1446207225-15386-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] gparted: add gtk-icon-cache to inherit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 12:14:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index d77d1ed..0fe95a0 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gparted.org/index.php"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
-- 
2.1.0


