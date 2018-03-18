Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C81C788F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r82so1038779wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JJ8gdjQiI2SDjx9YyMt1f/AO33asmuOJJLQD2nAa6J0=;
	b=i7WiM0Ekx1/W5Bi3gM+V8uu0ujrc7F6/ORIpg/bw/1YGWD3C+E3A1OQrzhpt1N0AUy
	GstrB2m0FfDR0Frmygnnos4u71Gb7Zw9U176vHGNB9IojnjexftBuGp65LYjPiBoQGVF
	clDTekr4hXvX6MHmiW4gfOGMxeDkmc0HEGkbOB8H2/34NHkchQ0rp3FZLJoZA/On0Xtm
	gEa2tnQHxfVAZv+FnrjyK1B7eNvTECWy4oOD5E9mYM4SNLDgaSWKjddxl8nPUDTgE0Q0
	meSJgD3tFqHF75/vCrdDhpcQRdSUYJGBe2GI9XmAk2jkpw/+qyB3al9vsf/sa/6c/2hv
	SDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JJ8gdjQiI2SDjx9YyMt1f/AO33asmuOJJLQD2nAa6J0=;
	b=JQKxcHNhH9aqkxbLPnvwwAGm2wr6enc7822f5LdktlFz6QgiHscG+tGopOpUIqAkAo
	BE2fO8pMT1PxOyfCVeJ7t+NVHFmNp2GPI0LJJzxVlzCoH1CU2tMaFeT4725kCydY9dG9
	F0QC05fhgZZHlerDeFeDFSfFpiovY1VcRbiy/t3JBGVBkaRuvxQHMbaaeujH2+UQG6D0
	hrivtgQuJA/4oP12/ZFql26jrP8YGDYCEc9f1U85Hrnfc/FP6M72+5tuDr4z6okJhOBY
	plHEAOjb++yZNXncmFx5X2l4B2uPGwmlivhC0lv9tpCWrEU/RZLpjgtwXBLDYrx6chbB
	Jc3A==
X-Gm-Message-State: AElRT7EFoFFL6dzMbFPdLbOy9SCkqLJh1BXXltFRu3xidIcp/RXGo0Lm
	vQnXEeY9BcgJ18irWFprcdthUQ==
X-Google-Smtp-Source: AG47ELt4cbgg0MQ3wZO4B/ArrxNeZeofwzV6jRc5OBHUQmoRIGrQ9IVK3u9951mjTgx7eBnGAGDTsA==
X-Received: by 10.28.228.131 with SMTP id b125mr6297144wmh.153.1521400130756; 
	Sun, 18 Mar 2018 12:08:50 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:31 +0100
Message-Id: <20180318190833.1393-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] xfce4-settings: update 4.12.1 -> 4.12.2
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index b98d8a799..093be0a93 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,12 +13,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.1 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.2 \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRCREV = "0766cf81daa9d41d0d0fed2fb73a8a26709a3bca"
+SRCREV = "e097ea5f95f8cbc3f23b6558aae2b772d6322591"
 S = "${WORKDIR}/git"
-PV = "4.12.1+git${SRCPV}"
+PV = "4.12.2+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.14.3


