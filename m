Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582CFC001DE
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 16:35:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.47478.1691771747823705158
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 09:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ad2IAKbF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bdb801c667so6354795ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691771747; x=1692376547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuHTJ4C+WRoRbsBNXge3cLF0tFBRQLJaSaRCivJI1kU=;
        b=Ad2IAKbFuhYN8Oj9TJlhwlf/c+yKmNITjlIuECOqHohgnKkr2rIFItUx0SojB9z2ts
         JmIjgBVDiTThfslE9EP+L4zyUiIzcRrz3i6EIc8jId56IShd9RGk40iYeV/J3iYd9/yM
         wroKfmYG5IuuSbrqsz/B9q7hYZ7iiP+YGVreC3DuEJjw2N/BCBg5HYd5x1qEaKiUMcnO
         2VCBJxQKwsycgzy70kMfWtdiQ2yS+sIgH7ISo0Oce/YWN0t2tuZ7Uilk3P9ZepnnIfJg
         XbIAfqIC5Tg/9VAAJDzw9uDn6sQ2U4XvA/+BNpjof4ZkmmpFDxEB2uM+ZqHeTR0h9kRX
         z/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691771747; x=1692376547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuHTJ4C+WRoRbsBNXge3cLF0tFBRQLJaSaRCivJI1kU=;
        b=NsYURA/MUpkQqlrn1dujuNx8vJlOMAD826cW8hlMGJasxdqbRUTUEgBXapYII68x7k
         dyfYsS5me94i3A3e+yH19tqlcBwqdlD/iM3N3ykRKTJEXRurYBBnlGLdY32S4JnIFKVT
         YX+yO6fVdkMeLmAvYUrSBdIC9FComWJemtOGjwIMejYOi9P5yvgzMySUOuRtG4iViDI0
         RZfYvrPRkWSbVsiQMAQkgETbff0uu6e31/EMrf1LQ0DxoLbfzeRpmUvG5zaybA+X3P09
         eib0P5maJWnNrjRULTmtDwSghlLZx6N1JuluXKsgIRF6w0tzQiKUcmxgLZcRaeo3XAQC
         M5Sw==
X-Gm-Message-State: AOJu0YxRGXVs6VxK0qxW0YKUl33Vs6R4RNpj1sNWBG9GAeBiZ6ci1AOj
	WfR1itguomgiwVpQdAqttNbb6IABQ0F6aw==
X-Google-Smtp-Source: AGHT+IEzNzR8FBSmF6DFJfUJAYyYRcRrw8VloRPBENNMra+Vj1CiLOSxpUlwXzYd6IPNrDzj05ekEw==
X-Received: by 2002:a17:902:ee44:b0:1b0:6038:2982 with SMTP id 4-20020a170902ee4400b001b060382982mr2409603plo.41.1691771746964;
        Fri, 11 Aug 2023 09:35:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ee8900b001b1c4d875f5sm4142272pld.44.2023.08.11.09.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 09:35:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] perfetto: Add SRCREV_FORMAT
Date: Fri, 11 Aug 2023 09:35:44 -0700
Message-ID: <20230811163544.724396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 16:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104340

Recipe uses multiple SRC_URIs therefore its required to define
SRCREV_FORMAT so it can fetch on changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb  | 3 +++
 meta-oe/recipes-devtools/perfetto/perfetto.inc | 1 +
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 4ab7a93714..7e9408b0b2 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -39,6 +39,9 @@ SRCREV_libcxx = "f8571eaba606bde2eb8cd34b30104ca33e7c207e"
 SRCREV_libcxxabi = "8dd405113a4f3694e910b79785dd7fb7535a888a"
 SRCREV_libunwind = "aabcd8753678f1536e15eb6385a948470debdae4"
 SRCREV_zlib = "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
+
+SRCREV_FORMAT .="_bionic_core_lzma_libprocinfo_logging_unwinding_protobuf_libbase_libcxx_libcxxabi_libunwind_zlib"
+
 SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
 
 require perfetto.inc
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index de871d4f3d..4b06c5bf04 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/google/perfetto"
 SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
 
 SRCREV_perfetto = "b8da07095979310818f0efde2ef3c69ea70d62c5"
+SRCREV_FORMAT = "perfetto"
 PV = "31.0"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


