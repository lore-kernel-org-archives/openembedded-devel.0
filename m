Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D978DC54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 18:02:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2322.1700244132354721226
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 10:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFD9Cde0;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso2266771b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 10:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700244131; x=1700848931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTLLwNYpWAI77Al10sK50UNoJ14uGYlZwaV3uGuTmws=;
        b=SFD9Cde0AeFVlTz8xBtjSjE/3yec/UcWd53hkwk3TsJYTa5fnRA4l4eJR+wdB6OPp3
         evsros3bvTC+I+KRCIbVcz7n1Z7Ne2vxUfHb6s3rrUL7XhvpFt3R8V0Sc02I7U+cEcqB
         9KrIHD/kgqngba8A1WIlQ5Jalr0FNOi/0Zve0CLvhI7jyRI0rf6hvaufiZZc3967B2r+
         TenGy3UEB4w9LRWpjFwYAWkx2HHs0QrYNfkYIMlw+Kgy44rzYAWD/ZQ8jKq66ny7T4nf
         NgXA8Lht4s6LqDlfqyw4jQMMr6rkP+V5+UUVUHDZ/4hEjqZKZixfeTvy1XvrLacoWYPD
         TcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700244131; x=1700848931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTLLwNYpWAI77Al10sK50UNoJ14uGYlZwaV3uGuTmws=;
        b=vhx/RcfFUmgm6pJM2sChjismff0PwbsyuaMWssXoMDTPZtBPG49oLRJAeipweN3hhG
         p/aGpEG4SoQdoXkVmXSb27j8Cq2t2MEiScpZ3CJrE0HCN+H2Fh7VxvepnKQEhgrgdUrQ
         e0auCawrXI//RssL6VkGg4EYi2dFlX1uvC6JdGmXK99EViT02km79kK0Q18DvldDSne+
         j5LfgW6EJbZXoW4YccBT97RbsTq8lM0prW/n+skZGau7JPub/HqIFC8cDkTB454UJWrs
         EHvMuWa3I4pUXYDbwrTTaI9xr1RI60HsroCOO5vfkDgungtZ6Ww3dxMWI3zAB9m469eQ
         3N4g==
X-Gm-Message-State: AOJu0Yxx/D+8+bRgyN8N/NbkN7zLnE84OIXey3kd4Ti8BH+S0bFTmonE
	LdYd9kAABAMCZoPuyPLlepviqklHrL/Wtw==
X-Google-Smtp-Source: AGHT+IGXFZXC2CCWhodnt4tm3zeI+QerdHDM6+KvDhXVg5dN/SIT/Hhhopxr1J/kg4Nt1qXTIum/gw==
X-Received: by 2002:a05:6a00:8c5:b0:6be:4e6e:2a85 with SMTP id s5-20020a056a0008c500b006be4e6e2a85mr170815pfu.30.1700244131085;
        Fri, 17 Nov 2023 10:02:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id b6-20020aa78106000000b006c0685422e0sm1664614pfi.214.2023.11.17.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 10:02:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH] projucer: Refresh patch to apply cleanly
Date: Fri, 17 Nov 2023 10:02:08 -0800
Message-ID: <20231117180208.401854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 18:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106872

This was resulting on rejects on master

patching file modules/juce_core/system/juce_StandardHeader.h
Hunk #1 FAILED at 64 (different line endings).
1 out of 1 hunk FAILED -- rejects in file modules/juce_core/system/juce_Sta=
ndardHeader.h
Patch 0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch does =
not apply (enforce with -f)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
 ...r-Include-utility-for-GCC-12-compatibil.patch | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer/0001-Standard=
Header-Include-utility-for-GCC-12-compatibil.patch b/meta-multimedia/recipe=
s-multimedia/juce/projucer/0001-StandardHeader-Include-utility-for-GCC-12-c=
ompatibil.patch
index ae77aeef10..3efef247ae 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-=
Include-utility-for-GCC-12-compatibil.patch
+++ b/meta-multimedia/recipes-multimedia/juce/projucer/0001-StandardHeader-=
Include-utility-for-GCC-12-compatibil.patch
@@ -9,15 +9,13 @@ Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
  modules/juce_core/system/juce_StandardHeader.h | 1 +
  1 file changed, 1 insertion(+)
=20
-diff --git a/modules/juce_core/system/juce_StandardHeader.h b/modules/juce=
_core/system/juce_StandardHeader.h
-index fe164cdd3..cda6bbe86 100644
 --- a/modules/juce_core/system/juce_StandardHeader.h
 +++ b/modules/juce_core/system/juce_StandardHeader.h
 @@ -64,6 +64,7 @@
- #include <typeindex>
- #include <unordered_map>
- #include <unordered_set>
-+#include <utility>
- #include <vector>
- #include <set>
-=20
+ #include <typeindex>=0D
+ #include <unordered_map>=0D
+ #include <unordered_set>=0D
++#include <utility>=0D
+ #include <vector>=0D
+ #include <set>=0D
+ =0D
--=20
2.42.1


