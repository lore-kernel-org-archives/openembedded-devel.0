Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8224.1795739742397690982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YjwSUmny;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5373544eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739742; x=1796344542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3egIXyh8w0jLHDB4tXKYcSJgqJb1FHb694xBGgTl30c=;
        b=YjwSUmnyMNe05S55ldwZFvtWnC4bAY7FGWSYAUCKEgI7w5eM0quOBWuPPpjgVJYXUi
         BKPLEnjTCBRs2+Hqiydw0rk3KXnJzZeL9kiZeNKAK5V0fYxjWRhNJ8FHcLnVLZJG+lQp
         bzkXtDgYPE5AvXpZm9LhSRT0tWUOWxDDmECLt0/YJsXeRHn4IuWpFftS5mNZKyH3wKdO
         ET0pYfj8yMWdTFgAOiq6M/JhF+hp7cYdjNTfz1tcwUK4J8dcWvsGrca49Yo6x2509lpr
         luCIwDPlF9qRjhs+a+bh43RjejUCs4PKKjozLcGiH12iEzg0htSA8yGoC+HAFn910LtH
         dLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739742; x=1796344542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3egIXyh8w0jLHDB4tXKYcSJgqJb1FHb694xBGgTl30c=;
        b=b15UbW9hzK3EnaCtROARk3lX3t+ko85S1UNfk1vcTZyoiogNIkrQPjFe/Ex8dDX7ZB
         v5dHz0l/9fMvWj44vUBOgSZdcp0BRgKvjEYwDUIltXd20DPyiZd41B2EbonhTlvZu1+M
         li/QM/jjeXJr8PXEARtRHObrjTbT9/mRmZ/JmCRq8zq3k7koceNWUVLdbuIYpLT3rDsX
         7S8FdnI498dYLMIDNkIwcF+IlpuwsymuAl7WJLmLxvESvGqThKMyIrN64XjWExXz5BSC
         bu7oxsBBYjbaD34/zKKLIVCQPspIGSu84ewsx1YLAl5UKrIm741+9q6oSN08A/2SiM57
         AGfw==
X-Gm-Message-State: APuU4Z/AgN/6ACshYNEMB3llwHW3aKgsvYECvONHnXhiBfQcEy02vzPi
	706jbLl1m3WSkMQL8QQpt2J77MZVLV4nZgGzfXeU7u8Ze/X0oAE685IQWYAtd24M
X-Gm-Gg: AZFdTZcyfm+4rrtCuvlR6lMStr3fjtpLGahfShqSA3VbCQx6785vzweReod38wS1okj
	eiJ7cg6G+hO5F3HRIgPEKW7SX504+t7NRjnNPFtg41863pZcVg3kZTNRYuhr7Rbf2bfclHYiueV
	/IRjApaswbYzpIwr517wIeD/Fty5qarBquysBziCuVJ8p4zgb40EWvrsMfL2c0jX7bWId9n9u5K
	tFN90IyqdUEzBUMTajub5bN4XBDfBfRjOFmMAOwZpux3NkO2MbLt+hkiBRDhfl/7wg8rHVi9kHL
	GGLNkePR2+1DQAoprC1hF/vvD/0vrquFAavCU08jU2dUek27BuKeUdBK3qislAa4UioUkBF048S
	sTaQ7iZ4Alb5ZIhXf8KhM8w4m4ApAMwPfYD4NH/Gdsjqsqnhz0mwxwFJ5pqWiBmbt8G+lO9y7lV
	RizJ2iVOspSb5FPnEARwoPFt7Je8cVV4cvtq31UPjq9EUyGrXi39lV0WGV6w/99FnrO7vzmaNjx
	9GYk/klGlGJQrTd4plG+i96ckTI6jF29CdpEE5CbPfNL8ob3x69VjQaOWayfqYw3pSdAaybB7pI
	mOdZQBycoiMa3DrtIbTZLPAItz4P1S5zi3cyC4DJ1ykpzaS4yT7nJvu9t+HYg/J0izri3A9qbvZ
	cVMZVHDIqbiYOQhQRAmAXjRbSPsud1sa5IBBOBGEjoL7d21aymfcvRfdPsSIrCrp9ws3ISBsFuY
	E6BbDymRmg5A1HGgq+iohSSYIep230TRz+vaSTwaaRAH8Y5i9piPXPQWcX4Jc96914EZXxgVeVX
	w/gfXSF6cdUKATYn9Em7uUk/aqxUxFxLBJtPQA5paHzLYzt8+XnKY8lgXQhBNaChFbUro5EeoHy
	lP7a
X-Received: by 2002:a05:7301:6e9a:b0:383:71a:2b14 with SMTP id 5a478bee46e88-3856f14bb69mr21240022eec.10.1795739741703;
        Thu, 26 Nov 2026 16:35:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 68/69] protobuf: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:24 -0800
Message-ID: <20261127003425.2166632-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133168
Content-Type: text/plain; charset="utf-8"

PV is the libprotobuf version (7.36.2) while upstream tags the protoc
version (v36.2), so the check reported a bogus 36.2 update. The git
check cannot map one to the other, so set UPSTREAM_VERSION_UNKNOWN; the
tag regex is kept, so oe-core reports the newest protoc tag with
KNOWN_BROKEN status rather than a false UPDATE.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
index b83597965b..f200aff1d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
@@ -24,11 +24,8 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH}
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
            "
 
-# Upstream dropped the language-major prefix after v6.31.1: releases are now
-# tagged vNN.N (v36.2 == this recipe's 7.36.2, cf. PROTOC_VERSION above). Match
-# those two-component tags so the real latest release is reported; the leading
-# C++ major in PV means the comparison stays off-by-a-major, so this reads as UPDATE
-# rather than MATCH even when current.
+# Tags are vNN.N (protoc version, v36.2 == PV 7.36.2) but PV is the libprotobuf version, so tags never compare equal to PV.
+UPSTREAM_VERSION_UNKNOWN = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+)$"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
