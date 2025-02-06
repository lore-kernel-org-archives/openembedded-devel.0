Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F6C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 03:19:52 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.31794.1738811983935850247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Feb 2025 19:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NVuKy+Pt;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-219f8263ae0so9766015ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 19:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738811983; x=1739416783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7r3nijpiThzINOzoA2+20B4GJSkXOVw8OprHNXr4KU=;
        b=NVuKy+PtJgrdDgC69Q/zakCv2bNeQHz0uMyxOUQw5NxjtJwzI7Kq1a8wCuF5gsuKsk
         iUgTLYcKVAlMCzSgEJOIfCusJssUYJPa8JElr2k44fAM4M+PbNw1IHnsVd3H/YDakcmY
         b6i0M5ducXu+fKUYADNkNLqTUTdOQYvW5yv6brsOnePfPsaSlx2HZGoGg/aYMbBR5WY9
         u+Iw3FxEeb2a8gRFXNuCV/oPGs0b+vLZt4QnF84BQphbV4U5/BbZMS0eTBKXcjnSpuJt
         aSzXA852rIQS75cgndpVr5lwoD8+yrfs8IyDLbvHDM0XBc2BGbiRRepsryc+5mlNMObh
         rM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811983; x=1739416783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7r3nijpiThzINOzoA2+20B4GJSkXOVw8OprHNXr4KU=;
        b=HcsHXlYtFXLa1xX4Q+NgzwnEk4c2SNbjSVSLfwStWU0slszV46H772Bn8E/vyt/eOJ
         lb31/m6sNKtwVetddHLObwF/AqxIUioJcdAtoxfmOFO+VD0OvdcV3DbW/FBzTPoyXsLi
         w2D0n+t3W4quDgJrHnucWinRPgR8t0hwg+ikOYIM7FSYskMs4GR6Msf3Sm4Cis1yVtm6
         h/QU5cXelAuPcMFA9OPFyipK4vP6TGxHFWoNtLLqJOPx7UYzOjUTFsxLVKPm5bSEJe4F
         ApZFWEahoHm3Cbg+VbEZabFqsP3Bbj0axrYBk3VpJZE6YOsS074QZE6wp8eQ74qxzAAL
         3asQ==
X-Gm-Message-State: AOJu0YzLZU8j9eljSJ8H5F1SUdzhvw7I4GoH9JS075Ozid5whZpB93tq
	QzEmy/o+Ole59Sy2Z0D9/WdXcdd5G1nNAuN+fWQEa6vazWCJcJhfdJCkHRyd
X-Gm-Gg: ASbGncsBbYQFCBigM7CbN/z/2WlREHeLMkFyb4W7CFGWsBdh2hjdalakbwTAEwRG3CM
	iJ8RmoDlSGyYvKVT6Gfd9hiKtoj3KvpWU2bbeU2ziyj240E1nZNAPMRPejseC+s6XKk2oEUWu3K
	Yg6p2lAr4k8IxlehTYTmW+/WC+TyvjmcipayT5INcM3f0xQFf1IJmWNhqaVT55mpWweDQ8DyuGk
	zu6TjuIUuV/W7WOpyDlxd6NNsj161EJGC333F0lF8RNqlQzVE3S277K2Gy9gHAs1W/6vxjaZ5dX
	SJ15POQ=
X-Google-Smtp-Source: AGHT+IH7oFYu572bQk6tG5rxTZAg7SLwJ9/6ep5WPyloEyaZwIacSZkxQSjdTDHgpl8BRLdEXlfOLQ==
X-Received: by 2002:a17:903:298f:b0:212:67a5:ab2d with SMTP id d9443c01a7336-21f17f01c0fmr109338535ad.44.1738811982968;
        Wed, 05 Feb 2025 19:19:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::f923])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f435sm1632305ad.16.2025.02.05.19.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:19:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-lief: Disable ccache
Date: Wed,  5 Feb 2025 19:19:38 -0800
Message-ID: <20250206031940.2247517-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 03:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115284

* ccache with OE does not work always

* Use RelWithDebInfo instead of Debug build type in cmake
  Some modules are built in /tmp and if /tmp is small < 2GB
  the build may run out of space especially with huge debug info files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-api-python-config-default.toml-Debug.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch b/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
index bc38a63726..cb8d4e921d 100644
--- a/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
+++ b/meta-python/recipes-devtools/python/python3-lief/0002-api-python-config-default.toml-Debug.patch
@@ -12,17 +12,19 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  api/python/config-default.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/api/python/config-default.toml b/api/python/config-default.toml
-index 519bc046..49477864 100644
 --- a/api/python/config-default.toml
 +++ b/api/python/config-default.toml
-@@ -1,5 +1,5 @@
+@@ -1,8 +1,11 @@
  [lief.build]
 -type          = "Release"
-+type          = "Debug"
- cache         = true
+-cache         = true
++type          = "RelWithDebInfo"
++cache         = false
  ninja         = true
  parallel-jobs = 0
--- 
-2.39.5
-
++extra-cmake-opt  = [
++  "-DCMAKE_MODULE_PATH=/cmake/linux/",
++]
+ 
+ [lief.formats]
+ elf     = true

