Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490C6C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75148.1782663750182752184
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qJ4BOfq1;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so4915148eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663749; x=1783268549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ijRvBqBy/UucNCBvvQB1fYUSXCZN7HAdAo3KwDKPQ=;
        b=qJ4BOfq1tfJ3RFu0/Jde0UK9jt6G7FvliaizQZqNac7BMnkMI5ojUSGESAuluSi1Cz
         dfQeJxphVtD2GbeS6sNcbNAUgywuQPm6bw+pOs12ptph1cS0eVR/uxAJmA3f41L+IuWt
         dWjbsZKiJTEDTYmQlEe3wepfyedH6oMmXjcisyGjXC65xMTtGsAYDLS9tKViOfnVr202
         bj+i+aSLvcao9lNim00eJxjvX3WBxy+hKP6gdS4O06QxBN04GMIvQfHglAAdQr/fJyTB
         T0bPq8iYnRNbb6LBFXly820iiOWkcEN+rOOQQubv8S6SCcTXrb+/FKCMNTEpt/OTczxR
         t0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663749; x=1783268549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1ijRvBqBy/UucNCBvvQB1fYUSXCZN7HAdAo3KwDKPQ=;
        b=fc3QPBJg3CgH3AMYHuFJ282+3gB2i8+5ZAdBU3kFAUKjjvUHNcakyM4wrsQyHsiQmM
         Q9kXnH85CeePW5+UXb+avUZueIOp+iOr+EzjHrK4mICnsKial5W88g6iSCrNlmrqdsGN
         w/UNUniGuQTO7mkzFncq9n1/QkOo07WtE1RrStp6zK9cTYkScsn1QY/MqUXWnGmUN+oM
         AFwPbCvJA/tVOunChhQGRavuahS2NpVeQQIHfBU/QhCJAgeNraoW9wN0AZb4A9FNte47
         B2NnWLXujhAR5IovrPj4XI3uGYOTuAX5nh7eIKkXR5yQ+j3fup+Ev83XIWtyvSowArBG
         yu6Q==
X-Gm-Message-State: AOJu0Yx9RnTCRKuYK8AbP7oVevFVrSW0upVF/9K/abomklEMTgM0PZHz
	HFxFWx3bT4A++xBdRUpJoDeGyJsXIhKPIk2C3hubXHfVo5ukJzjdjBQhokvXnWLbNP+5Og==
X-Gm-Gg: AfdE7clDQr86T5hHBWvaZcedrFP2VEivsrKFYNOfQuDTv1VqrEMHmaJVeDqYcr5/BVB
	oMZoEpJFjPD1JA3nmENKQh90tPgUEoiOIyVR/evlV1kYQIuDA7HwzBIDskADrn7/bA9LiSEOECC
	QvxqSOZN4ZTmwW3imMMnEc9cMX2MpyRIIcJARsLDCwG0JE8fICHD7WpJq8dE9+WYuu/LC+1xSb5
	XbuSpTGByJSwHrW+PNdz9wjJcSneUus1COvVizOySPCwydVxZ2R6l+Ev7BZfa/uPLit91k4NbGq
	zc/cmMqcBHoAETLH2LP9jBjVw5D5DYGYqBLIF9LyE6Ay1Qgr6wfLB31jAaQgnTF08KRopynHQUH
	5Oug3VN933svhuMJ/ZYOSstDpYQKD7J1JFpYtGzfgzW+2cF12yNfKhm8zoGXYApacK+dQCJkmLt
	DSPyaEOfyfIx/ERGWnle6allUMokF/2uGgvFvNfRZ7G2VD1dzlXbrElfBqTiIA1YwHKSMP5r/qU
	f2rqX8wYDxt0NmOmQ7XoVmwOQ13d1um/QWP1DvPUL+1Qie7tMzYhAgA7KjH8Jb2o4YDImL4qVhK
	t+oosVa7sN6pJe6jjJkRCF8mTada7Q==
X-Received: by 2002:a05:7300:7647:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-30c84d70176mr13597650eec.31.1782663749380;
        Sun, 28 Jun 2026 09:22:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 103/128] android-libboringssl: Use discarded-qualifiers that works with clang
Date: Sun, 28 Jun 2026 09:21:57 -0700
Message-ID: <20260628162222.4081517-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127913

clang names this -Wno-incompatible-pointer-types-discards-qualifiers;
the GCC spelling is an unknown -W option under -Werror,
which broke every configure try_compile (including pthread detection).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../android-libboringssl_14.0.0+r45.bb                     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
index ebf125c735..271a786e14 100644
--- a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
@@ -23,7 +23,12 @@ S = "${UNPACKDIR}/android-platform-external-boringssl-${PV}/src"
 
 inherit cmake
 
-CFLAGS:append = " -Wno-discarded-qualifiers"
+# -Wno-discarded-qualifiers is a GCC spelling; clang names this warning
+# -Wno-incompatible-pointer-types-discards-qualifiers. BoringSSL compiles with
+# -Werror -Werror=unknown-warning-option, so an unknown -W option breaks every
+# configure try_compile (including the pthread/Threads detection).
+CFLAGS:append:toolchain-gcc = " -Wno-discarded-qualifiers"
+CFLAGS:append:toolchain-clang = " -Wno-incompatible-pointer-types-discards-qualifiers"
 
 OECMAKE_TARGET_COMPILE = "crypto ssl"
 

