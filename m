Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3678.1792750184579137025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Jq8oc0dw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261023100939d1317e2590000207c0-js5oxr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261023100939d1317e2590000207c0
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 12:09:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QSdrEggi0TmI5kHhZ+xeYtpXx7pPI1Xcdyq4eBTWGhA=;
 b=Jq8oc0dwEfG0G0S+k/PmwT5Hc1XM82GKFfOBaFnEZB9s8G+maa9mr6sdWVwZm8bSgmZ5XF
 YxAh39um4AU7MDxH0mFReu/30hGycyIlwlMkyJPWFmkt0MJZjONy0QX2dtSQYwKRyke5e82G
 aupBqvvvvXVubmZ/Oz83lb+71U0WcjJo8pLjPvWuWaLxO+WcEB67RjS7mEuG7G2ekQyH6Tjc
 ZaRJKQkS7RmNG4KVTTrXksknyWecxZUdi3k5SmbKEL0Thxv+Jzf2hrXXdmcKv2wLrvhFGXFn
 mchw05c7yl1sywqYk7cvv/Vxo1KY3p/rRzI3ZuCMdle379bP4CamfIfQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] nss: upgrade 3.126 -> 3.132
Date: Fri, 23 Oct 2026 12:09:24 +0200
Message-ID: <20261023100924.2643583-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131359
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Amongst other things, this addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...bl-add-a-configure-option-to-disable-ARM-HW-cryp.patch | 8 ++++----
 .../recipes-support/nss/{nss_3.126.bb => nss_3.132.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.126.bb => nss_3.132.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 2a14dffbea..1d2d7b4f38 100644
--- a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -17,16 +17,16 @@ diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
 index 0ebfc92..3ee7623 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -136,6 +136,8 @@ endif
+@@ -142,6 +142,8 @@ endif
          endif
      endif
  endif
 +ifdef NSS_USE_ARM_HW_CRYPTO
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
-     ifdef CC_IS_CLANG
-         DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-@@ -178,6 +180,7 @@ endif
+     # CC_IS_GCC covers clang too; the Arm crypto extension intrinsics need one
+     # or the other.
+@@ -214,6 +216,7 @@ endif
          endif
      endif
  endif
diff --git a/meta-oe/recipes-support/nss/nss_3.126.bb b/meta-oe/recipes-support/nss/nss_3.132.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.126.bb
rename to meta-oe/recipes-support/nss/nss_3.132.bb
index f26e70539f..4d24497eef 100644
--- a/meta-oe/recipes-support/nss/nss_3.126.bb
+++ b/meta-oe/recipes-support/nss/nss_3.132.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "7aa07c758be1453d82d739240b249ffb7aef0041be488067e1c0f348e1f9e337"
+SRC_URI[sha256sum] = "ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
