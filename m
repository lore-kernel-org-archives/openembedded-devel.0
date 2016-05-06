Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8423373286
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:58 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f92so56340205qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=diU8AKWICjDk2w2eMq+ZV+lg9IjKGOT2x/R1ZVnolvA=;
	b=LFmrybmicjBgy/MGOyVf/vWlOgLPCYVTKwPf0CllOPYFq5+f6j7yVs9T5+2pebUHJp
	5zuUlrQzI228LA96sqflWSTixvWVVspYx/E1kKihFHTSOdl7WzVIVAhr7Mn3oR+BF+pH
	BL31r49O7m3USGEKEA506HG6Gqc1PYL5xZ6Fp1xwMdWWWtzjEDIRucBQJ8RZiomLFPct
	97aRTbTQRz4ZBlPtR1IYEypvHvPnKpG+b14N/v5wLH5yhTS/va7YbFWfaMIe/dgwzXDO
	1ro3FiiVpWP3OjVOqWxzr6rDhbOj9S4XqXGVdULt28RkD2rfbEhCD3RZPDcBKLs8uVIF
	nZIQ==
X-Gm-Message-State: AOPr4FU4ouZo2U0FqpgneiLIjEkiLA0CCb43/+5eRGddeZBRIQlUfJLOn55/x2pFIvqNWw==
X-Received: by 10.140.235.14 with SMTP id g14mr20164075qhc.86.1462543319344;
	Fri, 06 May 2016 07:01:59 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x202sm5749262qhx.30.2016.05.06.07.01.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:47 -0300
Message-Id: <1462543259-7206-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 10/22] fbida: use separate builddir
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
X-List-Received-Date: Fri, 06 May 2016 14:01:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

Separate builddir from the sourcedir.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <sujith.h@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index 8d3da69..c14fc9b 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -14,7 +14,9 @@ SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
 SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
 SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
 
-EXTRA_OEMAKE = "STRIP="
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE = "STRIP= 'srcdir=${S}' -f ${S}/GNUmakefile"
 
 PACKAGECONFIG ??= "gif png curl"
 PACKAGECONFIG[curl] = ",,curl"
@@ -26,6 +28,7 @@ PACKAGECONFIG[webp] = ",,libwebp"
 PACKAGECONFIG[lirc] = ",,lirc"
 
 do_compile() {
+    sed -i -e 's# fbgs# \$(srcdir)/fbgs#; s#-Ijpeg#-I\$(srcdir)/jpeg#; s# jpeg/# \$(srcdir)/jpeg/#' ${S}/GNUmakefile
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
     sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GNUmakefile
 
-- 
2.8.2


