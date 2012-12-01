Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TebWi-0005ug-52
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 02:05:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so405448eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 16:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=AYS52e6jeZLfFDRORaLNc5iGnUTc3pTVskATk9ZtM7M=;
	b=06YJxaMpgv+xNGY2I6ni3Uc5orHzxZxnUrbKCu5yF+odzdysBc+3a0J0Az0+3S3Cnl
	FVjwEwY5WQ3aABKDWC1GKiYORCg2OlGlzb8qzgVCOZxflu4ZXRvTGHUFpEADVAA9MSzf
	83z9QX8e0fGIzM6D2x2oxZX7WV0jyEzmgTHFSZLZpIVGsHBPcr//jiCaIvSoTetiFdtx
	wUNPzCf21sUffzHR3DZYpvwtTmCCGb4gVgnrOFV9IgP1fOTewQuIJZj6aQGKTjbgiun7
	v5ltHcIm06TH7dVCmc2ZiQklmhzXcsqwQ1LYgcCXyS9WCmPZdffO0/AyxEbVd3THfiMh
	BTlg==
Received: by 10.14.213.134 with SMTP id a6mr10132298eep.45.1354323094308;
	Fri, 30 Nov 2012 16:51:34 -0800 (PST)
Received: from localhost.localdomain (p5B0A35D2.dip.t-dialin.net.
	[91.10.53.210])
	by mx.google.com with ESMTPS id 43sm13899997eed.10.2012.11.30.16.51.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 16:51:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2012 01:51:19 +0100
Message-Id: <1354323081-8405-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 1/3] babl: update to 0.1.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Dec 2012 01:05:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../babl/{babl_0.1.6.bb => babl_0.1.10.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.6.bb => babl_0.1.10.bb} (73%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.6.bb b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
similarity index 73%
rename from meta-oe/recipes-graphics/babl/babl_0.1.6.bb
rename to meta-oe/recipes-graphics/babl/babl_0.1.10.bb
index 005b85e..689c4fa 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.6.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 inherit gnome
 
 SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "dc960981a5ec5330fc1c177be9f59068"
-SRC_URI[sha256sum] = "319b9004a5366101fd522da02cc983a5d0f50a17af0fa5cbce3535e31bce19a4"
+SRC_URI[md5sum] = "9e1542ab5c0b12ea3af076a9a2f02d79"
+SRC_URI[sha256sum] = "943fc36ceac7dd25bc928256bc7b535a42989c6b971578146869eee5fe5955f4"
 
 FILES_${PN} += "${libdir}/babl-*/*.so"
 FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-- 
1.7.4.4



