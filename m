Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66902CA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:33 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1479.1790722650567590265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZekCeHd8;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c4a0868b6so339394eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722650; x=1791327450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJjjKZzwTTRY7GI+4fKxfihQDxFSckPM1t2bBefVkX8=;
        b=ZekCeHd8OzihOWH/6x/L+lHIHqE15LfzC2C2NT0ILE0vgIMTi1v7jMBmkUKJxQMTpa
         D8EJ0QtZw529K1CgJlDXCqdr8EemsyVE+ujIaTGLnpb0lySQkNkNR8IeVomY8sjeca2g
         2DD9v7OaarQxL6+J4DO62THTQFVhJfSf+mP/f4SVt0Fpe6dWYDEstDUX54Tam6VBhKKS
         sdfhihVTdIFLYqhMgKnBzLu7DRi2e7LBoBr7I6tUdYBuT1H0ccqr3dy7CMtgKNGVdJJs
         okwD/5Wg5MJi2ph9xNGmTplFA41kvw/kxAHPb0B8O+wu1AYzUekjZ8BoRkemj9nIyFxX
         Oa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722650; x=1791327450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJjjKZzwTTRY7GI+4fKxfihQDxFSckPM1t2bBefVkX8=;
        b=f84/PCvDsiE2d+3tPL1GYWapI9stMXLQ/ncFnZF2Z8vJQcPLk1IIf8c6ytaePpLoMu
         3BjMPUHr0ma5YF3uBkjCrndWKgUr0dzFbXUBoffLJIfObqqcQH/v3muiJWhxowoBV92T
         jFKqWS/EDi7dLvm7ycMVdC578yVK6ST/Cf29cTon5RQQ0yJXc1pbZQ7X43Oju/DEUCEU
         vsaxSmpvNrGdMqHffMEtIBbPq1JSQWvtJaqJeD6dBfjoqXBTSQUA8n6zs81mPM/c6Avd
         BW041M8Oaq69pm3L6KRqeLqKL7GkgbpOxxZA5tdswR/mU2N82Dft4PcHM13b7DBLfUTg
         HQ+A==
X-Gm-Message-State: AFuF++kKYv9G5/Osxc41QcbhCoabFkWpIQWaLPiND//gjIDgfEw5B/Tk
	Zy4Lferk6qFJCEeBrxvbKRGhpJHukB4JL9Yqsg+AnxynyvG4ejFP1yp3MRABpyv36Kw=
X-Gm-Gg: AYBFou2WlU8RwirHF2D0CWh2TQVPZy0vGCoMBQxfqfHh8YHaRMylLqegXjMQJ+xqtvz
	REJKBT4WTEM4IJePNIj2K0LOBo8wpU2O3zEdcLJb1YPNaufupzDcgVdzSFFSqTJGdL147qcgqHJ
	dGKlpvlBhNNNLjwbixWMplrRnaswufoWH2KiT37Q0wgM/ubbXlc6fBfBXcKyRmKWLfZjN9ur8+Y
	nU4aVmWwCqWeU7Pa2P0MrN9VGQPUAIaO+mZNgD9+iA76nkqQ9AW0ejyEXHQgtLKPWil5K8hhTC6
	/VoRqCTy8XstDLgrDQmqPkJ0dajJ+LuZGkASEiL5mT5+2wVetZD46wH/VG54HJrX254vcYIkEYS
	D+abFEMhSUrUyJf7/bO5nfiDv9oxo4GcqB8BvyA+LZuaFdAYeBfrLuukquzWa7rOEFpQoX3gxr7
	3ahiJZaRq4RfufYaCC5WmuQjMwVRtq21kEgub0UVx+cLOGqxdVn28eV33aBZdN4YsaQrPjMJ9H/
	4H7Fa2OlS08VsoaZ4NY7T1DQta2ExgEv7DG6pqlzdZhYWFfexz/eX/jORejBxN7DlKWkmfD3YUZ
	fnAg0kLvrz2Voi7/jFPxI1LOsykl7LQIpJ7qxgeFD9jh+7HBjzUcA1ArX/eBvPwiYf3o4nMVq2e
	seS7OpXfpZk7+KthnzWBhaIg0Rpppf6OTtPa+vm++um8wo6ukkl6vH5/lIpDoUsMP6DVwQbHi8f
	4aRFnC7mVh3y3t7jixMLRtlBfxCO8sF9IMkFrCqg==
X-Received: by 2002:a05:701b:260a:b0:143:f79:f662 with SMTP id a92af1059eb24-14b2b6c1bb3mr4134610c88.1.1790722649762;
        Tue, 29 Sep 2026 15:57:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/26] minifi-cpp: add missing <cstdint> include for int64_t on musl
Date: Tue, 29 Sep 2026 15:57:00 -0700
Message-ID: <20260929225723.1046705-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130490

StreamCallback.h uses int64_t without including <cstdint>, relying on
a transitive include that only exists on glibc.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...h-add-missing-cstdint-include-for-in.patch | 35 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.2.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
new file mode 100644
index 0000000000..f19cea494c
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
@@ -0,0 +1,35 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:54:51 +0000
+Subject: [PATCH] StreamCallback.h: add missing <cstdint> include for
+ int64_t
+
+StreamCallback.h uses int64_t in ReadWriteResult and in the
+InputStreamCallback/OutputStreamCallback std::function aliases, but
+never includes <cstdint> itself. On glibc/libstdc++ this happens to
+compile because some other transitively-included standard header
+provides int64_t first, but musl's libc++ headers do not provide
+this transitive declaration, so the header fails to parse with
+"unknown type name 'int64_t'" (which then cascades into std::function
+template errors). This is the same class of issue already fixed for
+LibWrapper.h and RepositoryMetricsSource.h by
+0001-Fix-build-with-gcc-16.patch; StreamCallback.h needs the same
+treatment.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ minifi-api/include/minifi-cpp/io/StreamCallback.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/minifi-api/include/minifi-cpp/io/StreamCallback.h b/minifi-api/include/minifi-cpp/io/StreamCallback.h
+index 1111111..2222222 100644
+--- a/minifi-api/include/minifi-cpp/io/StreamCallback.h
++++ b/minifi-api/include/minifi-cpp/io/StreamCallback.h
+@@ -16,6 +16,7 @@
+  */
+ #pragma once
+
++#include <cstdint>
+ #include <functional>
+ #include <memory>
+ #include <optional>
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 88aa8adf69..5854483ba9 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://0001-Fix-build-with-gcc-16.patch \
+           file://0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "

