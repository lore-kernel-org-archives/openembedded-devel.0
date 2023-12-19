Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBB6C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:41:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.13661.1702993267563635093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwPj3Mmc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c69403b3eso45363365e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702993265; x=1703598065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nnhL1qEqbjKjuWRLucVacaJyP21ALC7SIDb1uIrcIg=;
        b=IwPj3MmcizWlMfaqzfh5VNkseUvKHfLHeIhcV4jt5lUuRHu5zWw7hZap/CcAfAlo2O
         f9adNnPRGRZIyxd2CvU+sirXnTZWgRoM9ovi9+j0nChrFnNiP7TQyXZ7XIugpPylwZEd
         FUWnlSTK17iPTq6xOux2ynpw8HQf5/Cu+c1tTWbkWbYuSkn/1NZJRZ+08lM6AotA2TeC
         lHKwuEiJ1O/Zl4zLn6R/pPNKRm8htFlPwqbrUWzOYLANoxvZoiIi7eX5ZoiiWdn2yeIw
         LLYdYMmR5AommC/5TEBwobEIqCAfMT5gC8BBULieeb6Mp0ncKHSaAyqO20Qr4bj5Rzla
         qoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993265; x=1703598065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nnhL1qEqbjKjuWRLucVacaJyP21ALC7SIDb1uIrcIg=;
        b=PJrI5G8cW262FvTEOH0TZMeCa2AXIfBNC8otP0FV/mVz9hY04wMHVhfqjyyISGjJvs
         c9iB3oAaB1i1VEtqKAEmT/U/3JEoaMsd0KOxuDisQhUZQ/D6kDQpkWvakGnAbJzRGG3N
         GcKaUYaJICj6yT6gbEDKY5xb3xQCb14c4LHbdkcMIvtChzKK1jdJo74prKmXfwVKPSsc
         XOKo9fSJZsWphkVd/QVQAfjJlvfxp4acQdrjbSTfUoVMoNGyUq4OELLGCYYPxFOsMY0/
         Xd/X1u+iqzKPp+rvU8VDOZ7Aa9l/zkw4+qQgTx3s3SadrG5fgcjsoeq2vbIgDuN4toD4
         1zpA==
X-Gm-Message-State: AOJu0Yz7E5iY8cQjl9ZmemxfyUIwWyN+fs9KsKprXX6S2jRoU3s7Vj6v
	YNWjpqomlfUC9U09Z10D65FcyHMs5VM=
X-Google-Smtp-Source: AGHT+IE1oBB/5TD0rFC/G+aYqdVGBUV6D2POEUZeIu41a9EwJeT56XR/E3jdBMauVbT5WbsPYnjZrw==
X-Received: by 2002:a05:600c:4706:b0:40c:6b47:cb25 with SMTP id v6-20020a05600c470600b0040c6b47cb25mr4233579wmo.45.1702993265220;
        Tue, 19 Dec 2023 05:41:05 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:4094:b876:d37f:10a4])
        by smtp.gmail.com with ESMTPSA id n41-20020a05600c3ba900b0040c61ee0816sm6833405wms.0.2023.12.19.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:41:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] c-ares: Upgrade 1.22.1 -> 1.24.0
Date: Tue, 19 Dec 2023 13:41:01 +0000
Message-Id: <20231219134102.15916-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107630

Use PACKAGE_BEFORE_PN which is designed to introduce packages before the
final greedy ${PN}.

Changes 1.24.0:

Brad House (28):
      Nameserver parsing: replace another hand-written parser (#643)
      clang-format
      SonarCloud: silence bogus reported error
      ares_init_options() with invalid options values should unset the option
      Enable system extensions
      try to move AC_USE_SYSTEM_EXTENSIONS
      ares__round_up_pow2() work around bogus warning
      silence openwatcom warning due to qcache_max_ttl being unsigned
      Support ipv6 link-local servers and %iface syntax (#646)
      Windows UBSAN tests (#649)
      increment failures on timeout (#651)
      SonarCloud: make const
      enhance timeout test case
      enhance timeout test case to make sure it will re-use a previously downed server
      Rewrite sortlist hand parser for memory safety and bugs (#653)
      Clean up some Windows-only warnings (#654)
      clang-format and fix one warning
      remove redundant cast
      use IF_NAMESIZE instead of IFNAMSIZ to avoid warning
      Use external GoogleTest instead of bundling it (#655)
      remove dead code: bitncmp
      remove dead code: ares_iphlpapi.h
      Coverity: fix allocation size as reported in new code
      tag some functions as deprecated in docs
      reference alternative to ares_getsock() in docs
      1.24.0 release prep (#657)
      rand: allow fallback from OS (#661)
      ares_cancel() could trigger callback with wrong response code (#663)

Changes 1.23.0:

Brad House (21):
      Query Cache support (#625)
      ares_set_servers_*() should allow an empty server list
      Fix Windows UWP (Store) building and add to CI/CD (#627)
      clang-format
      cleanup some Windows warnings in test
      fix additional windows test warnings
      CMake: CXXFLAGS environment wasn't being read because C++ compiler was enabled after settings warnings.
      now that warnings are enabled on test cases, clear a bunch of warnings
      fix test case regression due to missing parens
      SonarCloud: fix minor codesmells
      more precise timeout calculation (#633)
      environment is meant as an override for sysconfig
      Fix MacOS version test
      Basic Thread Safety (#636)
      fix ares_threadsafety() prototype
      ares_init_options with ARES_OPT_UDP_PORT wrong byte order
      fix doc typo
      remove a simply
      clang-format
      add missing manpage to distribution list
      1.23.0 release prep (#641)

Christian Clauss (2):
      INSTALL.md: Fix typo (#630)
      Fix typos discovered by codespell (#634)

Daniel Stenberg (1):
      CI: codespell

Ignat (1):
      Support attempts and timeout options from resolv.conf (#632)

petrvh (1):
      ares_getaddrinfo(): do not use search domains if ARES_FLAG_NOSEARCH is set (#638)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../c-ares/{c-ares_1.22.1.bb => c-ares_1.24.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.22.1.bb => c-ares_1.24.0.bb} (86%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
similarity index 86%
rename from meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
index 8ba1b60995f0..2171002aa95e 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "36466bb240661fa8fdc2ffa47d229d92ac762286"
+SRCREV = "972f456f2808b4e4b1730c90ab506f6af5f4c725"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-PACKAGES =+ "${PN}-utils"
+PACKAGE_BEFORE_PN = "${PN}-utils"
 
 FILES:${PN}-utils = "${bindir}"
 
-- 
2.39.0


