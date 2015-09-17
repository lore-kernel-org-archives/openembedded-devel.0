Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BF7B277010
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 19:55:23 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so38070911wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=hUPBhx7mP1PrcWbzZqeJiQG2Y3zUKFx8U/bhFFEIlrs=;
	b=zBO01CTkRwEJm+UYR/KpdrSr29kC4tbYniz4Yzuj3VUG0qoamqptY339LEL0NTa8vY
	7+/18KOfo+VkzCs2K/x9LkDU19Hsqt3E2ztu49A0BgWRGPAIyQJx75kc2f3oefRmO2W6
	5YycJlDvGslmfaV63mHEaYcwpPuPEjcAgDF8Oo7a8C860879bfjipyDa1LkZtcmCb075
	ClxzZ8q8YLH7sNQLMfssgqBr2o7aYKCi8i2Un3/sxiDDdfKq0bVGwFYjSg1BOzjIQhPO
	UO2qVzl6OKDW+9kPvQIhAfDyUR50bEm50ugM2NzBnRAlaguBW/zyv3qJ9mcg3o2byX7/
	3/Uw==
X-Received: by 10.194.84.129 with SMTP id z1mr1895791wjy.17.1442519723165;
	Thu, 17 Sep 2015 12:55:23 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1648.dip0.t-ipconnect.de.
	[79.223.22.72]) by smtp.googlemail.com with ESMTPSA id
	s9sm5068379wjy.16.2015.09.17.12.55.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 12:55:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 21:55:13 +0200
Message-Id: <1442519713-26541-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] mpd: update on 0.19.10 to fix build with gcc 5
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
X-List-Received-Date: Thu, 17 Sep 2015 19:55:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0.19.1 failed with
<...>/src/db/plugins/simple/SimpleDatabasePlugin.cxx:448:10: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
   return nullptr;
          ^
<...>/src/db/plugins/simple/SimpleDatabasePlugin.cxx:454:10: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
   return nullptr;
          ^
<...>/src/db/plugins/simple/SimpleDatabasePlugin.cxx: In member function 'bool SimpleDatabase::Mount(const char*, const char*, Error&)':
<...>/src/db/plugins/simple/SimpleDatabasePlugin.cxx:481:10: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
   return nullptr;
          ^

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.19.1.bb => mpd_0.19.10.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.1.bb => mpd_0.19.10.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
index a5cd557..577bcfa 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "d235f6e53e5442b6926c49946a303f8d"
-SRC_URI[sha256sum] = "8b3afcd440181c9bd18b229b5974e529d59648344dd371370d6f7d62ec2847c5"
+SRC_URI[md5sum] = "da4bc3e47afd0faf9e7a67168e012102"
+SRC_URI[sha256sum] = "c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800040ebf1791b15851"
 
 inherit autotools useradd systemd
 
-- 
2.1.0


