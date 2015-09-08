Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9956B65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:46 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so125229521wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=SQuwGhf0wG7Yl1cO9nEfy1yAULcoyhO3hr5AbUcV4mQ=;
	b=GZX0UOpmNwZCOiFAPH7gGY9kuryUt3qqY8nGLZFzUof+cV7HTpOpQDrqQdbrxoqCV8
	NZgSEQr41DE7ce5DmIP6p9C92oLzv/4kAtmCcuoYh7tIMpQM/igqbeDzYHNCW/5r3PRk
	lt317KlTOhbODGqZaJlFnm4weoRuP+VSAMm3lMulZ/ZkUxv31rkd/m8SHb4CiOlMNJup
	X6r6iP6wawi3Xsmu4pyyESzZM20z0fOpvE3xFtW8/+ANnlcPtw+Cl0Lo7JdHV3KU98Rd
	bPD8F6kleDdPlmJU2CokvcpZTi2oRRhQSXXx6doj2EqtvmEVI+0a8MYD5kUV+gg4NiWW
	MOZg==
X-Received: by 10.180.11.176 with SMTP id r16mr45604368wib.87.1441727026475;
	Tue, 08 Sep 2015 08:43:46 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:43:00 +0200
Message-Id: <1441726980-32656-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] libgtop: update to 2.30.0
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/libgtop/{libgtop_2.28.2.bb => libgtop_2.30.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.28.2.bb => libgtop_2.30.0.bb} (52%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
similarity index 52%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
index 2816e00..51c51d4 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
@@ -3,8 +3,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
 inherit gnomebase lib_package gtk-doc
-SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
-SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
-GNOME_COMPRESS_TYPE="bz2"
+SRC_URI[archive.md5sum] = "ee29a9ef60659ebf4b075ac281f71cb2"
+SRC_URI[archive.sha256sum] = "463bcbe5737b1b93f3345ee34abf601e8eb864f507c49ff1921c2737abafc1e5"
 
 DEPENDS = "glib-2.0 intltool-native libxau"
-- 
2.1.0


