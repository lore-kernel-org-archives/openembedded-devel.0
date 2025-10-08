Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE6ACCD186
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:48:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.656.1759934880924156831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JqTzs9j5;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso13873674a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934879; x=1760539679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnaeYiQmxqD2HS1kZ3olbvx4Xsuz3RZpB3Sd10w9elE=;
        b=JqTzs9j5DgM3q7lmZtJGri+l+7AlCp+ao9ZdwvlMJodZhBEqFMJVO4b5yWNKWEwdS2
         hYLvS1321k7hKA8tDi3Z1P+OU8ElmohXrxHk4aMC9Nw9ZQYxIbpdRv0JoBZltZX87VN4
         xxhf18MkyOB5s/0bL+wOWH+Tw7oU23uJNdombipwF6wNlIHsMBeEh4ZwWyNRQkMMq82l
         ITtkKvl0h+qHo6j5ObcBkUVViN4wloy0TzaSbNl5WhPMBPcQ2BrAPdP5NrRdRm3lVaws
         BzBlwNQwh/zW9UGXOY/5sOSZ0i2AMkt2vXbZ9SOkoHEoGwiTFmf3TCkYCOTQjbjBt8sT
         3OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934879; x=1760539679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnaeYiQmxqD2HS1kZ3olbvx4Xsuz3RZpB3Sd10w9elE=;
        b=rpkhegnMruUz/QSq1UHXStfyKOGSuyk9rh+RwtZtxwYB6ZYuMB5deB2tS2gGCpT9xU
         WQYcDKrveKGi68ydehH4VqW617wksd5RnNtm696THBjjCWhHShS2SLUn6BC1Y2SGEqr1
         eNqvwQkpSoArNbO60VudPkl9WQds1KsqG4z1nXsuYz9mzAkBnaWvYccl6Up8Ikz1Jhos
         7cZV2NEIaCw6pyczRwJKm5JVqyIRjWv3OQNmVCjihX2ZvTfj/nmcZPRCPPjlqrVvMNWi
         FgC9wZKo8U+3HSmyLPFrw+XiWvq2HrcAPGJNSzZP/d2vpm2BYdybLjXEUDwpQHewEeJe
         V+oQ==
X-Gm-Message-State: AOJu0YzaE/dZD4lTCy2AHma5lHubeLBrBPUbH9Ly+dihRbNiHMP7g5EH
	eGoJ6yJYp2J3DRJRalnqtZqD6y6dszfDWE9etwRzwsUlgAKmM5Gu/CcbnsvKngEM
X-Gm-Gg: ASbGncsudv5GAkZD8Die0Krt9ai+CoTW2Gg67/0BEJvXZnP1MAKnlTtHMaPZ+/MprRf
	peRfA9pRdc+wM7VM3h9qpBpMdguLVUsLvC4PxFbnNWZkOruBSnQAzqqPeNxdpvEqVmzyx9TDgLO
	sUAULlVduoLzXtyHPAZdTdxadDg7HFB18ooQLlkjd2+zM5CFUrrS8ke43ivAM3lIl/bmLgdLJWO
	M+1NEBl/7Dv9MQKhsaXBoDV9hXNKypOrFugiUtDej2uJDjUJlX/FsnFotv1QfgGMt/TqF2s6v+R
	mr5TL/UxgDpxPfPbmNZKpj5fSod8EtbHb5Qt/LdL4rI5sk4ruphrq4l9n3wgrxAcWoUZHhoBcvx
	fHy09Jxc4SZg3uERcqdBd92OvsixJJQG9fiNcnP6vokVm
X-Google-Smtp-Source: AGHT+IHVCztKHFMM8GijfKc8igkD/z3+h/9HM0v0O8MRmdlbSgo7cAPIMge0WtyINEEeNLzuqTWiGg==
X-Received: by 2002:a17:907:3f14:b0:b07:e3a8:5194 with SMTP id a640c23a62f3a-b50aa48e3c9mr436881966b.22.1759934879201;
        Wed, 08 Oct 2025 07:47:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83e3dsm1637724366b.29.2025.10.08.07.47.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:47:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/3] exiv2: patch CVE-2025-54080
Date: Wed,  8 Oct 2025 16:47:56 +0200
Message-ID: <20251008144757.411347-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008144757.411347-1-skandigraun@gmail.com>
References: <20251008144757.411347-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 14:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120367

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-54080

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch | 77 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
new file mode 100644
index 0000000000..6a4c80f8a8
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
@@ -0,0 +1,77 @@
+From 6a0c63f1362dac8badfad5d2dcc55fb4ff04fc60 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 29 Jul 2025 18:58:46 +0100
+Subject: [PATCH] CVE-2025-54080 fix
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/e737332427711f15bcdc4e903203d6b7493eaec0]
+CVE: CVE-2025-54080
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/epsimage.cpp | 40 +++++++++++-----------------------------
+ 1 file changed, 11 insertions(+), 29 deletions(-)
+
+diff --git a/src/epsimage.cpp b/src/epsimage.cpp
+index 2e2241b69..bb4aa3303 100644
+--- a/src/epsimage.cpp
++++ b/src/epsimage.cpp
+@@ -241,6 +241,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+   uint32_t posTiff = 0;
+   uint32_t sizeTiff = 0;
+ 
++  ErrorCode errcode = write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData;
++
+   // check for DOS EPS
+   const bool dosEps =
+       (size >= dosEpsSignature.size() && memcmp(data, dosEpsSignature.data(), dosEpsSignature.size()) == 0);
+@@ -248,12 +250,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+ #ifdef DEBUG
+     EXV_DEBUG << "readWriteEpsMetadata: Found DOS EPS signature\n";
+ #endif
+-    if (size < 30) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "Premature end of file after DOS EPS signature.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
++
++    enforce(size >= 30, errcode);
+     posEps = getULong(data + 4, littleEndian);
+     posEndEps = getULong(data + 8, littleEndian) + posEps;
+     posWmf = getULong(data + 12, littleEndian);
+@@ -285,29 +283,13 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+       if (write)
+         throw Error(ErrorCode::kerImageWriteFailed);
+     }
+-    if (posEps < 30 || posEndEps > size) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posEps << ") or size (" << (posEndEps - posEps)
+-                  << ") for EPS section.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
+-    if (sizeWmf != 0 && (posWmf < 30 || posWmf + sizeWmf > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posWmf << ") or size (" << sizeWmf
+-                  << ") for WMF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
+-    if (sizeTiff != 0 && (posTiff < 30 || posTiff + sizeTiff > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posTiff << ") or size (" << sizeTiff
+-                  << ") for TIFF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
++    enforce(30 <= posEps, errcode);
++    enforce(sizeWmf == 0 || 30 <= posWmf, errcode);
++    enforce(sizeTiff == 0 || 30 <= posTiff, errcode);
++
++    enforce(posEps <= posEndEps && posEndEps <= size, errcode);
++    enforce(posWmf <= size && sizeWmf <= size - posWmf, errcode);
++    enforce(posTiff <= size && sizeTiff <= size - posTiff, errcode);
+   }
+ 
+   // check first line
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 81e9954c1d..947d13208d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -6,6 +6,7 @@ DEPENDS = "zlib expat brotli libinih"
 
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Revert-fix-copy-constructors.patch \
+           file://0001-CVE-2025-54080-fix.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

