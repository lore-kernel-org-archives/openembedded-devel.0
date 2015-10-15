Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EF66A770AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:06:32 +0000 (UTC)
Received: by qgez77 with SMTP id z77so59134785qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NFTAp3fNUBh62EQ2F5YJU9A/Gv9yKuAjCD3lbThMLkU=;
	b=LfQQLAxw4K42mg4vOpxksfjuqBsUuOxLtGrxn7TZOmTNKFebysfS9MhRXV7K40JMiJ
	Bs67at7jHv6HxbT19Mzz0oB/JfKT3lLEi1umGldodh8HUB/gsdf506zDRvtQBXIea61o
	MaXwP85HvrJKp8HsisATeu+q/tqin+nKrXRF77eZcBubc4P59Lj0P3r8Qo+8es71ppsB
	i+uFAt6TJJExoQF4idbBTS87uEAJgG1PjmwSBV4xrgkvi+5LT8QAV2s3Exn+XE8n9NhX
	p8EcxzkFBbTXKczSMjsuTTdP2e1DX3/mPeqqlDspPM3izMSENnLnSDUkTqLCF7P8HEAV
	ax6Q==
X-Received: by 10.140.109.6 with SMTP id k6mr7945533qgf.28.1444871192247;
	Wed, 14 Oct 2015 18:06:32 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	x81sm4436197qha.24.2015.10.14.18.06.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:06:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Oct 2015 01:06:25 +0000
Message-Id: <1444871185-1173-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH] plymouth: Disable documentation
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
X-List-Received-Date: Thu, 15 Oct 2015 01:06:36 -0000

It need docbook-xsl built natively and right now its not in its deps
disable the documentaion generation completely to avoid the build issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index b8c82ed..01f633d 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -20,7 +20,7 @@ SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
 SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk \
-		  --with-logo=${LOGO} \
+                  --with-logo=${LOGO} --disable-documentation \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
                 "
 
-- 
2.6.1


