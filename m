Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 35BB877088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:45 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so34096296wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TRWadDGY+UwWL7uCP9Z/Pf12k0Z9oBS7qsAmeDhscFs=;
	b=UzxKkr+rrM534grOLitnT/U2FNtFYrkAyYgtU1ogIJI7EDsf/TiA0EBfNTCsvYrEwV
	Ltm/thyUASL+LLbZ6bAokjDN/BzEiNtgW55sHks8dbcV7Wg1GQk5gqzViLTcrftTK5H6
	gUzCSMufWbB/Bd/Qb4tkx2I3sXnZSKOCBCvUP/rjX0tnDTL30FKBVZPHFlK7mZK4Hpxq
	vzXcNxfD3RCO9aLcPkIt7tdMUSQ92DkFy7H9ldZXCB4l6i3/OcKHYHHdglYDf6JfvQBe
	cfBVQUAh7K2j22cFFJwE7SjJTohPsUVuK2BhKnaJghIkF53TET/7CLs8X3Jjl2upcGkm
	0nEA==
X-Received: by 10.180.92.230 with SMTP id cp6mr3735409wib.80.1443713385862;
	Thu, 01 Oct 2015 08:29:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka10sm6673743wjc.30.2015.10.01.08.29.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:28 +0200
Message-Id: <1443713428-8635-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 10/10] gtkextra: blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index 7901fa5..8ce6e94 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -14,3 +14,6 @@ SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53
 DEPENDS = "gtk+ gobject-introspection-stub"
 
 inherit autotools pkgconfig
+
+# | ./.libs/libgtkextra-x11-3.0.so: error: undefined reference to 'roundint'
+PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
-- 
2.6.0


