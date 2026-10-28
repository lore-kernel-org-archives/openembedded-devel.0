Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3685.1793212416306479791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 11:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20260707.gappssmtp.com header.s=20260707 header.b=VvShdSkA;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.208.178, mailfrom: nate@nkent.net)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98fc80925so15126621fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20260707.gappssmtp.com; s=20260707; t=1793212414; x=1793817214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jyd0AmVxwTWTVpV6eY+Zn6hv1fS5Eh6RqrIA9KQ6UL4=;
        b=VvShdSkAeaqbw8GXHJ81tDOvo67CDjBlCd6cc0oCBx/oW+kvsrRThnvsSi9CGSk7P3
         kWroz3ooYEpIM5EBqOfYlrgbrQHvvskERje4inUVzNkrpFrb4BG3BJV98U374o4Q/j/r
         remtl785ld77pigPh7nzNAF8d4rrYXIeYzl7FLiiivOrb6w2oYTLkDMroQbTwQiPzSbS
         Trz1U3oelrVBNDl2McxGKDp5FsDQUEzaL9xcBKXhVVbjVmtlK9AM+qomSAln/MWR9ybB
         oOsLLoVL/8GKTSKLu3LqStHwbMi6M9kWDQE7N2E6ep5ytwPFIk/6Wx8kTRuUiEJ1x4d4
         EPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212414; x=1793817214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jyd0AmVxwTWTVpV6eY+Zn6hv1fS5Eh6RqrIA9KQ6UL4=;
        b=sLFzlf6dA76Y172wDJ6KpGA4zh6g1VVSBqvLYaz1dr9dCb6K4Xo7rtF75g4EoUudWY
         3Xjnt6MeVrCM3PCrpK+5NheMFPQN3HJV5uU+X7fWXR11mTn9XceKTQepDIuUaZDzIQRP
         VjsaWWlofLGPDOnE9pLaBbuXun8SK98kTAKC1Egm7x6pJwaWgfA/dWdsvRjQ/mewPQbI
         WlT7WeC1jeQMdXghgKn9pfxCgMj4AQgu3+OWfkqmCWwAJW5NvtSclXZxylg7kaiCD4dX
         lUjzg5SrZ6gF20ag0WHwmAQsXYA7mzTzWXU+u/kyf34iYMcF9NbV6SW5TafN97xafTRx
         aV2w==
X-Gm-Message-State: AFq9FYL9pWNdUX5NtsHctLwPxtWwzsf3yLl0biOpF6hh90mSmTlb4ZjO
	QUoPWT4L/7k1nllbXtawgumVbMdoT9j4J+CS6yqOFJLSozWZr3vIbHC19RJvsBpJ/D/ddQZ2BJO
	pswPb+EAAr+1D
X-Gm-Gg: AYBFou3TT1I4uG7di3YrNHKQH7waWeOEfR1eVlxW9o6Kt41eGsdJRsHAcVYtwXO4ZTu
	tKBA9BdDE1wyaWcnuJadkixproEMkwUexFL1WKeF54j59r9kzyRgJrM3lqRDGKWl/aPz5yftJll
	v54YITFVDVwVddJnYL6yGI1PJAI9J23tNYzk/ZQHk6K0qRfd9rbl/PYnCBF0AfSrTXr7qB9PJwH
	fKnfn+ZWPxmhBWtDbjFpjSz0qYHfQopx/9YcQuMVvZCtQXxCmCXYYepTQtsxnFvKnhC1SmjuYxi
	5DkmKZv/xknZI/olHdrIKim23mUXXEDPw3q/XJuNNCR3o5v7JE7aLzNRduW2ivCEFRLaH6MtTDJ
	XvQdLSl3DfVSGsTI7+XaQxmXyzlWpFsUiAkwsXki3WX68ZALTXhOYdg/JR9meOhc5hcrsY7OWG1
	eJ/E2fQrUO863ZIlSEq3xXWBEf329HVTIp4hvQffXLV5SOVwdII0gdPTfQHej98Vv3hf4wEL7+4
	TZqVuqOQ+dwDuSPqDJzFZfcBZZGdJZADHccCdbjqeW/dBn3d0g+hrtxZb57+mqs7oBi4whgmwPZ
	lCHIo1yBWE1y7MuYHCOmz0O0X43MWsVJbZUagbd3CzcCvSMas6zXezIcrK+25xPlPF8w5jPDpvJ
	z1MvMYNZ58+zztyl8g4i9e5OAIjBqoBiQjlAr+c0zc+m11EQWDI8IOQc3lypTgdBW
X-Received: by 2002:a05:6000:2308:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-48e5e20139dmr6874253f8f.4.1793211975482;
        Wed, 28 Oct 2026 11:26:15 -0700 (PDT)
Return-Path: <nate@nkent.net>
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm30243029f8f.38.2026.10.28.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:26:14 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH 2/2] nng: upgrade 1.12.3 -> 2.1.0
Date: Wed, 28 Oct 2026 19:24:52 +0100
Message-ID: <20261028182452.3594321-3-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028182452.3594321-1-nate@nkent.net>
References: <20261028182452.3594321-1-nate@nkent.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 18:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131627
Content-Type: text/plain; charset="utf-8"

This is a major release for NNG that includes breaking changes to the
API.

Changelogs:
* https://github.com/nanomsg/nng/releases/tag/v2.0.0
* https://github.com/nanomsg/nng/releases/tag/v2.1.0

Signed-off-by: Nate Kent <nate@nkent.net>
---
 meta-networking/recipes-connectivity/nanomsg/nng/run-ptest | 3 +--
 .../nanomsg/{nng_1.12.3.bb => nng_2.1.0.bb}                | 7 ++++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.12.3.bb => nng_2.1.0.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
index 57888a77c9..c521d41082 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
+++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
@@ -4,8 +4,7 @@ RET=0
 cd tests
 
 for t in $(ls *); do
-    ./$t > /dev/null
-    if [ $? -eq 0 ]; then
+    if "./$t"; then
         echo PASS: $t
     else
         echo FAIL: $t
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
index 7f8a3986f2..0ed2299d51 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
@@ -5,11 +5,11 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https \
            file://run-ptest \
           "
 
-SRCREV = "73f715235967afc783e0b99c52d015dc10897fda"
+SRCREV = "0912dcbd63f2f44324fa974e9fc9695c7621abb9"
 
 inherit cmake pkgconfig ptest
 
@@ -23,7 +23,8 @@ PACKAGECONFIG[mbedtls] = "-DNNG_ENABLE_TLS=ON,-DNNG_ENABLE_TLS=OFF,mbedtls"
 
 do_install_ptest(){
     install -d ${D}/${PTEST_PATH}/tests
-    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+    find ${B}/src -type f -executable -name '*_test' -exec install {} ${D}${PTEST_PATH}/tests/ \;
+    install ${B}/tests/cplusplus_pair ${D}${PTEST_PATH}/tests/
 }
 
 PACKAGES =+ "${PN}-tools"
-- 
2.55.0

