Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3019.1794218399332432819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 01:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aJlhm+bs;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so1202737eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 01:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218399; x=1794823199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYI0MwjeG6y4FF3h2UYa9t5ZYCLKZO/M5cLgiC2/3Fw=;
        b=aJlhm+bsWzdtFRrkZpC5Kbn3QVaGcq24wKZLjPM8DvzVg11m0NwfKWKXwyy088pcLy
         HWUT/tB0h0fVPDQL0Gd8k5rk8VUU3ZtnBy40nB9LYssaAM9Ze/INnuztdO1Gf9o0n/rq
         chaUY8fNQIfmD9T+GvfqLTuXNGImkr8ylbwXaaqZh81AgF6Q15gLmc0f1g7pYzbCzOWX
         COX9SNLEgdHDbvl8HJvxamoop6+2K6s5+PTgzstkzFX7MoUSFh2rUcAF5ZPLtVLvi683
         Fb9m7qb2xG+Xqb38dGz1r9u8mKdqdXp66NKOcjk2mx78KTJUNk2afTmmxdajVhZ7/ZEU
         eAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218399; x=1794823199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYI0MwjeG6y4FF3h2UYa9t5ZYCLKZO/M5cLgiC2/3Fw=;
        b=oIBWiskLA5KJ0HEoJOU9xMECDq27VYa56fWbnAyDA26ublNoNAb69cpp5vrC8/+bSr
         RBRpElRbMAK/kDpGjghNePdv1gFFq4ra082uPWrL6/Rw5LOtapOqrOhLsMlUSTUixSbn
         xftY2/SqkAHGX0NcsRHTn2AWY8P/d9+xdbti7A9lVhQgzAHZN/FqKq5MrUrI7ZAGk7XA
         29BowE1kkuP5LqmDxYqtCBgI96ra+RD2sPWegkN9vNJx7oxar/REZzBuHsxoPG6Exr+N
         td6PoaOV21q89wsxRwK9o6Mr6+yIrkpKFJTKHR6VjYT+VnFPyw8vLZKdEBU/TlEyhwZ+
         TT7Q==
X-Gm-Message-State: APuU4Z8T+WqXkJW6pqDlt4oG4YPmULOaurxaM5LAhf50h7WA7mWlyAyS
	eLSSJDeTFnN2vs3ad6z8wNI8Tu6Ycxjfd57ok68Lrt1ci26xmdu/V/V1s4xZDBHL4l4=
X-Gm-Gg: AYBFou0d9XPKkVFEH+6e0/GSMq9U8ZmerW2sLaEYsmMrrUXnLuRq2KdWUq5zvKnWC32
	ByI4m14CGnCVULtW0EuWzzx9BRikt/zh4vlmInpyaqa+nNRkWQYIMcC5n6Xl83D5A5sufeyY2jm
	Mww/PkVjf0U+L59bLANEuYAVkqrWya+MntInzjXqehoahpkL3yJ1BymXSXAzSLmS8WSqXImFReQ
	cieu0JYIGLLB7oJxroLrlVknDnm47YVRoC4Dg1rfcf0laRor+EVvgg3s+dcCf4nmLpJbEEQ2nrk
	j/5kj7gq6RcAvzBu9/Q2vGARml0RohslLRhHQClZv2JuRr8VomewqOfcPBUxDxE3IapQGY1B2AB
	AMp5SB2fI8ViXaT6u5bdALw6DLl+WZAg0Q2cEggBAwajUokQY1Di9O0NzS/90UVIO06q8n354pr
	8mZkTKZvB5qZ0+hicioqWcJ3+mKsWzOHmxpX6091gLO3a7FxuJi06N2vcuxQUxLt1dJzhhQYTWZ
	b2SmAbmMlpqNyqi2DJwInDToEoD0tEcgSj1Rhk84ucCPglV+SxBjCTMyVyrcI/jBNGEJZ4rrDMm
	M3XV5Mx82Bd23sFQ6p1Sd59chvMhM7ckGB7KwlTPVMHMJRTUje7ah4Z4V/SSowFW5UQiuRk10lu
	+fmEWtSl0bZHzZFUkvQEkUZPbtd3RYoCA8kcrZX6DgW2kG89tAjgYEPIHKq4UKG66y9sUTWg5Ad
	NV+jtjEvZgyZefQtg0+Gahmrz5cC6FHg0fyCiEDiCQ27qBcm0RaLtNZPPliQOcegxBkX+K1nvCm
	dTVIK6+SNqtKQnxypXF/4oh2cjpNX9SsORfRvabzWc83xzXRM7OE/Zdtpa5gdt39xuCJ1qEGBaJ
	f3vP
X-Received: by 2002:a05:693c:69d4:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-3725807c474mr7109032eec.23.1794218398418;
        Mon, 09 Nov 2026 01:59:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm10962331eec.23.2026.11.09.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:59:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] wireplumber: Fix scripts ptests after the 0.5.19 upgrade
Date: Mon,  9 Nov 2026 01:59:54 -0800
Message-ID: <20261109095954.2498187-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 10:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132057
Content-Type: text/plain; charset="utf-8"

0.5.19 moved the script tests into subdirectories, so ptest-list now
has entries like linking/non-default-device-node.lua. run-ptest
redirects each test's output to $arg2.out, and that directory does not
exist next to script-tester, so the redirection fails, script-tester
never runs and all 28 tests are reported as failed.

Flatten the path for the output file name.

The new node/suspend-* tests also require suspend-test-utils, which
upstream finds through WIREPLUMBER_DATA_DIR in the source tree. Install
it next to test-utils.lua.

All 64 tests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest | 2 +-
 .../recipes-multimedia/wireplumber/wireplumber_0.5.19.bb       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest b/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest
index a3682bd2b0..d987f77766 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest
+++ b/meta-multimedia/recipes-multimedia/wireplumber/files/run-ptest
@@ -16,7 +16,7 @@ run_scripted_test(){
     while read line; do
         arg1=$(echo $line | cut -f1 -d" ")
         arg2=$(echo $line | cut -f2 -d" ")
-        if ./script-tester $arg1 scripts/$arg2 > $arg2.out 2>&1; then
+        if ./script-tester $arg1 scripts/$arg2 > $(echo $arg2 | tr / _).out 2>&1; then
             echo PASS: $arg2
         else
             echo FAIL: $arg2
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
index f925aad8c3..f17fb1576e 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
@@ -77,6 +77,7 @@ do_install_ptest() {
     install -m 644 ${S}/src/config/wireplumber.conf ${D}${PTEST_PATH}/data/config/
     install -Dm 644 ${S}/tests/wplua/scripts/lib/testlib.lua ${D}${datadir}/wireplumber/scripts/lib/testlib.lua
     install -Dm 644 ${S}/tests/scripts/scripts/lib/test-utils.lua ${D}${datadir}/wireplumber/scripts/lib/test-utils.lua
+    install -Dm 644 ${S}/tests/scripts/scripts/lib/suspend-test-utils.lua ${D}${datadir}/wireplumber/scripts/lib/suspend-test-utils.lua

     # this is not a test
     rm -rf ${D}${PTEST_PATH}/examples
@@ -176,7 +177,7 @@ FILES:${PN}-scripts += "${datadir}/wireplumber/scripts/*"
 FILES:${PN}-modules = ""
 RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"

-FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
+FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/lib/suspend-test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
 RDEPENDS:${PN}-ptest += "pipewire-modules-protocol-native ${PN}-scripts \
     ${@'dbus' if d.getVar('WP_DBUS_TESTS') == 'true' else ''} \
 "
