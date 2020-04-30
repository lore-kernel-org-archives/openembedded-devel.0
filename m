Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.6780.1588252586777350430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 06:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXfJmpHx;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id l19so6410210lje.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KDARLef5EBdTOKrz2zPcTPvTZus3lzF3vPml5/uPyxk=;
        b=IXfJmpHxDrJC6xsJlukOlojcpUo4NmGE6cjQ0KAlvmykhNcpp7zcVyZFs2pd2VIcuM
         UvLQ2O1HencsmVmuU9rtzYwjay5/Rv+v0agl4v01AI4+66X+VJNyMod+dl6zb3E/rWb8
         7UFm7VDEkw1ccSSBFIoWQZDqL7tDHWYKvqQ0nZrcm56NOXVs+qqyhOR3AhuddCauAsYC
         pW3y7gcgJNpqwMtR6G4gfJHNUFiozdgysN3iO5JVVxwFdMTjCno4pjecMDjze6gP58FH
         Mad5bFhU93DjBpyo56/UtFAb6JieaSXO96zYTHa9jhh8hrItDLtFv2PbfydhjyDv+ins
         N+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDARLef5EBdTOKrz2zPcTPvTZus3lzF3vPml5/uPyxk=;
        b=r3Dxgao/smwgaxcR84FqPEE06jN1GYfndoA3gvfM4s9ml8+310bUnOQXTU599fG5/q
         nN/6nGKMpnlwaqKyKCvG3xgJStNyo/l+Y97NBSzpaEeddUjqpYSZwS++dXzf79Zuvqz5
         sLFwmUhHBb4vUn6b5G4vCpw5RPHAvrPCLOtD2Mp0NCYORie7KWo1fOJYNbTOYUDWy4Kr
         lInUMh7fIQP/h7keWnODlx3URWMfiSz4coM7N9OHX6RJFAoWdDYsoC971u87GkwzQ9Ub
         MzHwlaJvH6jlNBkrKzHhkcFLTLDAG9I0NJnF0LwgLOaMLVOHojRskLhfyhwg54WsLhxv
         hdlA==
X-Gm-Message-State: AGi0PuYMNKYxFXaEI/s+9kHx7UPbcmZg4YmgVJ5ZO0tRzpsgKE6SBTyE
	QLW4yBkTZp+vbuXsk3l2wnPQAb4iU48=
X-Google-Smtp-Source: APiQypLvTz73EUbTjTyXFoKlkw9ZcPmTU2/gyGrDrOSlS9AEyASHeQm1tSX1xtOApl2vR76t0qHLfg==
X-Received: by 2002:a2e:3209:: with SMTP id y9mr2096930ljy.154.1588252584764;
        Thu, 30 Apr 2020 06:16:24 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id q6sm4824506lfp.28.2020.04.30.06.16.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:16:24 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-java 3/3] openjdk-8: Fix building with GCC 10
Date: Thu, 30 Apr 2020 15:15:56 +0200
Message-Id: <20200430131556.2150334-3-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430131556.2150334-1-jacob.kroon@gmail.com>
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index d8b30b8..5228338 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -176,6 +176,10 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+FLAGS_GCC10 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+
+# GCC 10 defaults to -fno-common, but OpenJDK 8 is not ready for this.
+FLAGS_GCC10_append = " -fcommon"
 
 # flags for -native, and for bits that need a host-tool during -cross
 BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
-- 
2.26.2

