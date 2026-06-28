Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E105CC44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69126.1782634320134842966
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j+J4Nv91;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30cac93dfd7so944813eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634319; x=1783239119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJw0gBJVPTIt4S+9njmyCtrjXjErF6v2tthTJDw6DGU=;
        b=j+J4Nv91H3mDAuLZ+FZZkh5ySYoJG9hLlepHMpnnGwT59dKxVHr6PrcjwZG8WkfGnv
         /VUlqQsCTDbat3TG+axnMrNL7g6wnh1jp91Wh7PEPAnJA+9sVk6BeFasOxhUARs9D1Eq
         ypquimQ0yTIZR3NZJoncuYm8FTkoPn/BXGuu/N5WfSdpTFn1dQRPy7GjmsUkj49ADgkQ
         UAJO/CQGZ4uzHs0sZgbHjhdr9VDfMr1rjPm/gM4ziDHfkoutQqBAVCZHcOJ+fxSqM6iM
         f5kRRW/M/ypktvb7n3PE/wulKNZqVJJ1WwbU4paXdjNptGBFuscXhPI4JL0ZoYWbJFTN
         GtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634319; x=1783239119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJw0gBJVPTIt4S+9njmyCtrjXjErF6v2tthTJDw6DGU=;
        b=E8pNqENGxcho7VmqaK8yTSR7PJOe3elC+NKaxvPUVG1wouh6lAfDCM7SPJC5vYB8Up
         NryPdxBQHTVJV42a197TK5Afbc3LZp/XDzZ9Ljunc1BJOFIqTBV0CWcENPMwoGFBVIoC
         wVFQK8e+GkzfycLjZNtjPNXbsdAs7NGeQLzJCM7VopeoZL6DH50Ik5J0G2GDrmbbIv7H
         FCtcSWzuXNnHFQATXD8nsDXBwoqyfX3NmdpgMWKxGe0eknpfucr9tPr1mS7GReFcHUAr
         3GbgAdQunXxisDSJles0BEOMnaj44ouFZGK2kV/kk/ZqS0oNO7rqh9sCDZYZlFdwuxPi
         Y6Rg==
X-Gm-Message-State: AOJu0Ywm2vsdmXDVbMPmq8BhB85Fs8w+oNIqrZzjTEO9VLFmxe++DxFL
	amD51BFS7xp9XEfkYYQFErbM52JuoJrorAkqKtc9+qC+C6wWyYCeunMWasxXnS0R17t04A==
X-Gm-Gg: AfdE7ckvIKZgmvfPBZGk65MnWVCzLFeuvFXu5C+DmfKbHCwOe8yTw0ua0PtqmzrzKBQ
	OnmzMDu5ys7p3T/vg+JJrG8Nvyj/BiXNiJX0tEUOmU5IhJda7iDeeUBTbX3AmKfP14gShAzyy4o
	5YI9cq3uHwOPGSeZEe8c4xEn2iIBI3rPiTCcYJB/1mURe12iz+mVsq2BG9gUr+r/nOp7VowtXq+
	zQvGM75MyzUp/D8xiGFKT5RvT9ojtpQqXzbDW9d359UYQBwXjFL/NqiE3BRcRYeSLxpSzSSLBC6
	QOv9MWqSG9o86x0f/EwrDuLXV0tplgCtZfZ/WRIjsWAHuMkw19mYROraicS95DgFyZDHRJbseUB
	PH+xvG7fdOAz6PVRcK6P7LnKR94crQIddKPjBB1nRFH45MzM2JKJEETBwDo7nHzQV/S9ySsFfnA
	rkZXbZh1JIRj5q7qzVoysYMPAcI9ZOWiqulhSsuFTJzcdMf7iD2RRvSVNb9+VGCTHdyY6j8rtMK
	Ka12lVtXjNSHuDKQCgI9aw/jhhGH5IGx5nxiyyguJ9mihlrYu8X0N7/2ba7bkCCyYFo/LGcK2EL
	bQYIF9t7GZettmHD2FlTfVF5JEIavo3w7WfDGBt1
X-Received: by 2002:a05:7300:8cab:b0:30c:a0f:3bd0 with SMTP id 5a478bee46e88-30c85aec166mr11887880eec.13.1782634319519;
        Sun, 28 Jun 2026 01:11:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 037/128] abseil-cpp: upgrade 20260107.1 -> 20260526.0
Date: Sun, 28 Jun 2026 01:09:48 -0700
Message-ID: <20260628081122.178348-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127847

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{abseil-cpp_20260107.1.bb => abseil-cpp_20260526.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20260107.1.bb => abseil-cpp_20260526.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
index 128ed81556..d0d0d44610 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195"
+SRC_URI[sha256sum] = "6e1aee535473414164bf83e4ebc40240dec71a4701f8a642d906e95bea1aea0c"
 
 UPSTREAM_CHECK_URI = "https://github.com/abseil/abseil-cpp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

