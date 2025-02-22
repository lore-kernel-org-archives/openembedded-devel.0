Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36FCC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 12:15:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.45006.1740226530790593995
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 04:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b41WQk1p;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so23622455e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 04:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740226529; x=1740831329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoKxY9H2leytt40gTiksvQ8tsiA1Ml1+e9NYKVtqx+4=;
        b=b41WQk1puhmcvkSoMTO7P2IYTZ132AUAtKjtzWdsveMiI8DkDXqpl+spivpmg5DdWZ
         Es5SaZd+qsNNr5lP607ykq57OQBsvP3RNqiNlhIIoZGgufj4t+2ai7yho5WenOMNhRc8
         XV+vr7IoDZSeajOkmuldOdKWmn9M46ubXcLvRq0zbwE4LWn1hZqUsu7JKFksKVAKtN+H
         38ko2tdbkwKjqUmhpoxoPnW2eYSNcW4RvDD0c/xfjY80HnA5swZ4sEws7etq1wdOCO1d
         VGFfPlMvw/lZjbHe+wFehMnL8lzywfk7j854Kduy5ZqMwc+lKcvsLT00Q8uaNFOOv4OS
         PCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740226529; x=1740831329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoKxY9H2leytt40gTiksvQ8tsiA1Ml1+e9NYKVtqx+4=;
        b=Bso5AlI8NwasFkDJ6/o7Xx53Tz41lKhh7kZCACFOJRYHSSlgpVWT/bmz/fNMLRkvK5
         bOquk55SobO4PbznQkPuSKignecObcQx3hSb6VYg2Apmx1pwCgz/F0Rve+cApHwx/2ps
         5vbKPDymiFlrM8UIeCCF215sUA2L+xfYvrvPnH3eqGkXmLfyZhkPndSRdkoHDv44h+4U
         T93IfoLfcVFxuvQX2McizJqM5RhdjJ3cZ4atcyFyubj1ShM+yXYT7EjqtaT1azfOSF9/
         TpdWJpOjOJM2PfuawWH8vWa/DyoyexZDBrdnpDVqtaE29EC5onAj5VAFd9nVWFVh338D
         ablQ==
X-Gm-Message-State: AOJu0Yx8GmAlWRyWshEG1nc1ajAWn55rr03q4iRtPzuWvlMw3Q94VONo
	hsZI1XWTLBoVe+1MqCTJHNewt7iyfS45nOtFyo4oWORUrKBt2nlc4gv6Cg==
X-Gm-Gg: ASbGnctJCoz8Xdzf3moVNyw999bLkVL7qnyPv8losuINf36LjU2zpDXu8qY7UPkfFsV
	zkkDtZqf9hVVakldI3A+nEaz6c6LxqTIa/bgI+EHV1qyYIoRLG+10XQCOPCWQHLXgypFZ5pDLGS
	pq8zR/s0LWyVzq5hBZe6es1jUxEBuxosulay8dBw4NOblHrStsnf3R8gjdkHLEv3xZpKGyCnJj+
	Gp81na/hHwy0i7zAKy/WNiv7A7GSOqHb4cOqG0O7y5fDiGihC1xDWE3olWVcejWR5HLiYalKRHq
	yVzhyYNTBwlFaK/IMjyijvkUgbS3pwCMzwDcSMNq3ANb43TVDlbVp+qRuVRzhJ5RMKRPngl2+8C
	1cWiAz16gfOD7rZW2Mf1ehp0YlOHneHYf
X-Google-Smtp-Source: AGHT+IE/OEJzfTKalxsnFuD+HfloGJ0Tv8VeJaVdqqodXSFfB8qC7sDdNHWyE+IRjDqVyniYnaNq9w==
X-Received: by 2002:a5d:5f90:0:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38f6f51d885mr6159379f8f.24.1740226528822;
        Sat, 22 Feb 2025 04:15:28 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm25612758f8f.40.2025.02.22.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 04:15:28 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-networking][PATCH 1/1] wireshark: version bump 4.2.10 -> 4.2.11
Date: Sat, 22 Feb 2025 13:15:05 +0100
Message-Id: <20250222121505.291425-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 12:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115537

The 4.2.10 was not longer available at the SRC_URI

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../wireshark/{wireshark_4.2.10.bb => wireshark_4.2.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.10.bb => wireshark_4.2.11.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
index 4739c3961c..2e02f29eb2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "3fc5f88ae420bc5856d056324efb023abc4654eed4742140b0d0d36cb032b894"
+SRC_URI[sha256sum] = "dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18"
 
 PE = "1"
 
-- 
2.39.5


