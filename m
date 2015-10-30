Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 574BC76F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:18 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10456942wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=NqalWzBHCnZGbpcGfL0eZwa0GmabfLgWAr68JvUtH1k=;
	b=Vrt0ZRW2VG5oxeXfazbNp3JJNX649CFj9zVwCUZl0wdnsO2VDKj975geQd5bda2g8l
	W3wmzlCtl9X46XoWQgLhpBPfwnm7OB2PicxIxs4HZ/es9xBvERZWziI48zvJ7M+6/0vU
	a/x4HIAHoNd9qhlZCSX2dV+Ke5SMk/IMqiHhQxVsnJs1EAymHQ7C3HW2MUDOKCW+sj+W
	cNQ8coMGbcdg3nBltzbmH5wOMPsZK+7pMJaWkuZzQlNv/n6plFNhpm+IizmyE0KHAJfw
	sbIRoQJ1YXn8gH+gWW9fv3UyVNr7yhBfMb7aQIPmoPwR7eMdkGYA34rjN4RWtMG099uF
	bzgQ==
X-Received: by 10.28.140.213 with SMTP id o204mr3294850wmd.12.1446207258872;
	Fri, 30 Oct 2015 05:14:18 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:35 +0100
Message-Id: <1446207225-15386-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] packagegroup-xfce-extended: xfce-polkit
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 04934eb..ccd6f45 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -50,6 +50,8 @@ RRECOMMENDS_${PN} = " \
     xfce4-hotcorner-plugin \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     \
+    xfce-polkit \
+    \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
     \
-- 
2.1.0


