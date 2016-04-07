Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 149C8760AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:10:42 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id k197so5823303ywe.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2016 00:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ow8+hFz+TFdDIU1FRFTlcEhKR2Ech05PnN5Kuxday64=;
	b=hLwlLU0gqIeS+IL8e/Q8DKKPLE+wZtrBrV+ml0KHFf4RYigYzWGIKubjj7H3eKOOC6
	JnR2PHHh9MbdWLb4ns81ZAijSZbPQ/tqunefEu9TY6OzjrigTiVtR5eH5hj7cR8AglO8
	Na3uzQd3zMo1VSgK9pPT+1w0Bt+n1GDtkWWqAHSlhaPtUAZh2QhIDF1fvUQflqrJNN8G
	3SVXUEtsTNxeTM3ZVKBaJdI+GTNuvVSlqe0ugK/TGP7ygyOgGUz5EVPjSqvwMza6a6/L
	JkYixm4i+MZ1WFy1VN4sJAtTJCkJlOudh7/hclsHu+zIo5/UXnEJXXn3HDTiruwqIN++
	yUPA==
X-Gm-Message-State: AD7BkJJcrivfksjl3uI12UlXIBvUst4tie+nRbedt16RuOKRsDGPt0QcU+bK6zz9rNVeTw==
X-Received: by 10.37.13.15 with SMTP id 15mr317547ybn.16.1459997332913;
	Wed, 06 Apr 2016 19:48:52 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:15 -0400
Message-Id: <1459997302-25271-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 04/11] libcrypt-openssl-random-perl: update to 0.11
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
X-List-Received-Date: Thu, 07 Apr 2016 07:10:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ssl-random-perl_0.04.bb => libcrypt-openssl-random-perl_0.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-random-perl_0.04.bb => libcrypt-openssl-random-perl_0.11.bb} (56%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
similarity index 56%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
index 1f99be0..8456e31 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.11.bb
@@ -2,11 +2,11 @@ SUMMARY = "Crypt Openssl Random cpan module"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
-SRC_URI[md5sum] = "c56ac5dbdd46122eb9b8da59613b7b0a"
-SRC_URI[sha256sum] = "acf7eb81023cd1f40d8c60b893096d041513df2be2aefe145cc7ae1a3dcc78c7"
+SRC_URI[md5sum] = "5d71337503e0356ce1ce1481504e5885"
+SRC_URI[sha256sum] = "bb8c81c6a39b9b13a22d818ee9a746242f136f0fadceb6b9776ae615e7524c7a"
 
 S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
 
-- 
1.9.1


