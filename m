Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84B1C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:26:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4924.1750501558773039873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QTfreAxZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so3483199e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750501556; x=1751106356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBYzPHk+EILRreG0Igt9a5OwrSLC6LUvcfneVeNnB/0=;
        b=QTfreAxZ1nWsdyu6vXjPVD8Tv684KNTIhI+TUGO4+KZnlosFTlru9EtEj5czSE0HmZ
         /5vJRGxIL7yvJ8L6wlw5oCxqNsIRMFfZoEj+VC6e4yl7ea1ndzC0Hj1OptHovtnAKMzf
         56j6oVA/MijQppXu/iyNQSwJEy8PFk5ayCwm/aK0gYJCi8jKr78v74cyLG7NoXKI3qRd
         61w/PEEKduZWH7qnxtadHtNxpfxL5AFfgJ2Cey68tWnIoBF79qWTW9zToQrNkelENlmQ
         qLctQvlJNDLlIkEr2slofmfmLMorTI/8cTM69EkjU8itNPZxWWQ8pVum9t67OH3TG/TX
         dDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501556; x=1751106356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBYzPHk+EILRreG0Igt9a5OwrSLC6LUvcfneVeNnB/0=;
        b=lBsW901wjPEPI46sTpme7DevGb9LsKB5xbzOTggfPPezadAOlZxadn+bamWnyyeGiW
         UwMgg4kfFCdKdckMhzgpb4CQD2IkuDa8kjrgW0tRQ36xWccUSuFC+wBHjiTP2IdThMiq
         iyTCRCnbfct4tqOc4QN25eL51E/c2foTjDKXZWWhPkHX+FHJWum/mSUk4d+D1VPYfMID
         Csm3Sq2obljFJhyzp90LPwP/spZcS+TzmiP+6vthColzExwRB3u7QeCN/RHbhfr/tU6r
         93eakcOEa/xs84Cs4YTUBss7dHWNsf8ffavFSTi6NSuRC5i47ghXb7+sQlF0r5z0IOVt
         0aXw==
X-Gm-Message-State: AOJu0YyW5vdR82e8iPWNZ1TgV3Vj+M9fOfzCLaGG9Swm2a3ZEwgfzAMR
	r9SJXA/AwdbCRWIxnWuNx2PvV+Fn1WgmKLTPKJjO38w98t0jQXXKq1II4cNEafqJ
X-Gm-Gg: ASbGncv3b10Xr2HGs7T9/0I+QcYvY0G23YlFxA8Nmprgnz+0+swLa1e+eMPf0bCy9CQ
	Apvqqfd4Xd6qYAbOciRQHsQ+lk+q5Rn0sOdxufnZSfq4FSpXFCX00Sv3YYPGhik7BpkgNom/5gS
	NPRpo2z3qvyFvNqLgiEGZgziZOxQWmLgWCrKTe/Ee+ROhd+nrk8YgpLVX1vM/w9z0vVfDWF9EPY
	JGsTqZctbYLU0LTagKM3pnMsjjcHx7TPu3MrZZNdhFKsAjPRqVqAnaZTd7bpRu6FVY/0zEa2X2G
	5fc59A97Oae+LwlhAL9+Yi4LSI+homjVV7svFBirBZh82NmArt59/0tQ/tttPVzf2XN/80vGfCg
	DoIg7GV5o1UnGJA==
X-Google-Smtp-Source: AGHT+IFR6LdNCr6WZBEbhkWzk3vQfkly42Pf/8nZF/tWO3VcblXJtx8tOL2w8eOXTjgtiOyAY+Gy4A==
X-Received: by 2002:a05:6512:6ce:b0:550:e648:182a with SMTP id 2adb3069b0e04-553e3d0c94cmr1892954e87.55.1750501556172;
        Sat, 21 Jun 2025 03:25:56 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c4448sm616639e87.187.2025.06.21.03.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:25:54 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] ace: Fix contains reference to TMPDIR [buildpaths] error
Date: Sat, 21 Jun 2025 13:25:50 +0300
Message-ID: <20250621102550.1523918-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117996

ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Compression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ETCL_Parser.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_ETCL.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_Monitor_Control.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libACE_RLECompression.so.8.0.2 in package ace-dbg contains reference to TMPDIR [buildpaths]
ERROR: ace-8.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index b730b0a86c..e62ed39d0b 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -27,7 +27,7 @@ export ACE_ROOT = "${UNPACKDIR}/ACE_wrappers"
 inherit pkgconfig
 
 CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
-CXX:append = " -ffile-prefix-map=${UNPACKDIR}= "
+CXX:append = " ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${UNPACKDIR}= "
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib} install_rpath=0"
 
 do_install() {
-- 
2.43.0


