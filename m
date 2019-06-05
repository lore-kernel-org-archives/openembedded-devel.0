Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DCB2D7CE21
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 07:52:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c6so1215371wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2019 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dw7Tn+wVaItH+BWn26yRkCpdvlf5mb3Bil/QLf+TJ9g=;
	b=JVQE7iAy0/SxNNhQtOSCk9ClXomjqWyf8fx6etaaBipZowBvaWixZvxYUNHfhuRdpt
	EiLhD6n2qUs13SCpJjoBg4+8RitukThbZWVW3AnvdOZA2xqBUCInFz7NgcYF93HEwKT0
	OlXc1UMdgy7NonGMuEISYp+MtE7HQ44IMfMn/isv8hIqyOYxloaloui1ZccQTqj9+x+O
	ALkRACTbmzafvh/ryHrgcxtlDHVjblJeQ2m4naxl6mL65XNd5DJ14RUqjRo5Qisa9O5P
	AFEZ0wCT9/fNekZDTmJ1PrAIiN7SxPTsumILHD8ThIExCieCu+ThYfRf2JAcOiWGw0r8
	WeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dw7Tn+wVaItH+BWn26yRkCpdvlf5mb3Bil/QLf+TJ9g=;
	b=Y6uqkm1zh20YqLEXlBHeRVYjgLZpyJB8Tq6oLa+PwNUoex/IH0EN8bUrioBNSJqMcm
	GXGKtKVGwgDYPv06rggWpS0vCU1+PBJVNQH7k1W50BgLFx8Vk5cygHZ6OJdOLAIWHsdP
	WjG0npoOWWW5CR+HwVG0GuP69vUmb03PX8juxNXG4TFHvMjO26CZR66STsqMPV5sH0GJ
	cx0Z+ngyzHexEX5FAcV3dKMQgYhraSrlIlXtXKmPJ2OeG6YVi62FJsFDemShggp0sc8i
	dceJ6xE/OrZ1IsWCSsVCeXDeoVL2kZZPsSGNta4goRin8jCOtOndjhpZ4QJTg7dPWNfd
	Qt3w==
X-Gm-Message-State: APjAAAVI72OdyONy7mDNmeh0CpzshOYxP+vVVW5tbrmtp4XxX0GdKeg3
	sjGjxHT04B8BdXRzHwmrN7KKY4tZ
X-Google-Smtp-Source: APXvYqwTer6kHLuZoDCRDZmXCnSXqFObtYuXavW7eFDc8jqFBL6Qms5BBy9z+LY7bEiNgYMFX7E35A==
X-Received: by 2002:a1c:eb16:: with SMTP id j22mr8671160wmh.56.1559721149212; 
	Wed, 05 Jun 2019 00:52:29 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v63sm966121wmb.30.2019.06.05.00.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jun 2019 00:52:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 07:52:41 +0000
Message-Id: <20190605075241.422-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] spice: append to CFLAGS instead of +=
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
X-List-Received-Date: Wed, 05 Jun 2019 07:52:29 -0000

* so that -Wno-address-of-packed-member is used for all the builds not
  only for target builds
* with native it was overwritten with BUILD_CFLAGS and for nativesdk with
  BUILDSDK_CFLAGS
* this issue isn't specific for gcc-9 as the original commit said, I see
  nativesdk-spice failing on older hosts with gcc-7 with the same issue
* also use -Wno-error=address-of-packed-member instead of
  -Wno-address-of-packed-member so that there is still a warning, just
  not fatal for the build in combination with -Werror.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 6249b0422b..b0fab0d65f 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -36,7 +36,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
-CFLAGS += "-Wno-address-of-packed-member"
+CFLAGS_append = " -Wno-error=address-of-packed-member"
 
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
-- 
2.17.1


