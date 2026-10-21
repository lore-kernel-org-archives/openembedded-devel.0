Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8727.1792580497831140583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=splq3WG+;
 spf=pass (domain: konsulko.com, ip: 209.85.208.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso825442a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580496; x=1793185296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hBrANeFk7GY2f9YEl6njVCmiAx9zK1XsJoJec7I+Fw=;
        b=splq3WG+8oRPBxndZW7KlscM4NzwfDNZe0RJotnHSNHSPQa45JaPdn5vXZzdufuPUC
         WcSUnxQdbnDuvBkUJ2DSqZ1GphXc3/ZuaLeTnINkkOH2CtAL7LLDmh6SJGsYAnw1JVum
         9Eo4Yi375Vy0F29Z2JvKNqfE2GWhT6bGzfOBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580496; x=1793185296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hBrANeFk7GY2f9YEl6njVCmiAx9zK1XsJoJec7I+Fw=;
        b=glH+Kd3wdXji4+PccRAz+0iyJpM7RrDSLm0/cV7KSY76ykyTbuHErtQWVs1U1kVoG7
         ayvOETZdnCDHcgR1SK9k27vfd+06DRzs/geFzBOOx7N91pP7kCYoW0jkLOz3gCRv0FTh
         UNUMIU2m4uOegBlg0isuwnEK8GOkrOxEmRUOGz5lcC5epsXu/STjIpp6sZTOu3joBSWe
         Y7K79kTjfWEACEMK1MxezCzj2PSBxljLjbxrZjEL2wFDMxyGaRDNtGcJFxRuBSyh1AlK
         9MCAEor6NRhJSkwjseGCKX2X2+vFq4DWqKfGhnAEee/S/pNwDqAZkWtxC4yu7egY/ubS
         vyKA==
X-Gm-Message-State: AFq9FYL0DL8KzO6SMysFSE7uRVF0GnI1jsrIo1yL8AYFFeYVCoS4TmhV
	GkaTx5pb8TUUzOaR4iy+VuJgPIACrOIYW2k5T+dO+aIlsvucXlQ24r86L4k8Rw9unyf0Aiz+Ry/
	N9Lgt
X-Gm-Gg: AYBFou24jpPf0CovPRr+wcs3RERiL60hiwsWAQa7Mcp/NJxgnMgKmv8mGSDiGOiL5Pv
	qvqbrkl+mJDDRfRp9EciWDIOmOTugF4yGkSqSUU32fxlytl1X1nQEe6/e308gv+7cwuh6+NptiR
	GEF1JbrrWAdi1Lp2dyI0qM49p99qKRd19ewAc+g1aIPBkM4a0CLywN4pHe04vijl/8yWzJbYPst
	2ygzAGE+EuAWGpIUhZiGlaEJhEEv2g2DSKvmQCbmG87pZhvVjTkEpxOXM+cMsqP5sVZ6fGf8GCc
	DNjo/UMBFlG4PJTQRX6gtkKr5SWrLVj9LnIvP16hc2Uw1DFr8a0AWXNbJAZKgRnHrGCvTXRB+4N
	XqFd3MAt2cpMykTOyJT0jAZ+rUxkkLYUE7HUNXEtOG36eAHcCOsRcpNzEOqnyrFcp1CdVEg5L9L
	mTZ3/wvBEWQUgjU2aTYxX0wHfY//SEffMFfSNt/iZRPUOCg31Ojuyx6AhV3Ro3xdB4bLRNOJcHV
	Q7UzoZig5c7B6Sw4uM/yfo9XZAizSlxpkGadpdk1xwfyMJJkhzA78iJArkruUoj9OBBn7lKq8/g
	1csncsA2tKXeTdJkT7k7sF5qLICjpNs4y4EAIKhcAeATz0dSfHjTWiR4HsjZ2G+S6bDIODLOU1A
	dbVRi
X-Received: by 2002:a05:6402:4587:b0:6b3:84c7:efbc with SMTP id 4fb4d7f45d1cf-6b408f0c236mr1178193a12.43.1792580495696;
        Wed, 21 Oct 2026 04:01:35 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/36] python3-grpcio-channelz: Upgrade 1.76.0 -> 1.84.0
Date: Wed, 21 Oct 2026 14:00:38 +0300
Message-ID: <20261021110103.1943456-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131273
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.84.0:

- Fix -Werror=unused-result error triggered by Cythonized code.
- Release Python 3.15 wheels publicly.
- Fixed reference cycles.
- fix: remove ghost key in grpc.aio.Metadata.delitem when last
  value is deleted.
- Fix the StatusCode Enums to be int.
- Fixed the parenthesis placement.
- Removed UsageError exception from registered method.
- Added registered methods support in AsyncIO stack.
- AIO Part 4 - Typehints fixes and add Pyright for aio/_channel.py.
- grpc-status: Relax protobuf dependency lower bound to allow 6.x.
- Observability plugin fixes.

Fixes:

WARNING: python3-grpcio-channelz-1.84.0-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml specifying
backend setuptools.build_meta, use the correct class [pep517-backend]

License-Update: Use LICENSE file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-grpcio-channelz_1.76.0.bb     | 16 ----------------
 .../python/python3-grpcio-channelz_1.84.0.bb     | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
deleted file mode 100644
index 97184c89a8..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Google gRPC channelz"
-HOMEPAGE = "https://www.grpc.io/"
-SECTION = "devel/python"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
-
-inherit pypi setuptools3
-
-DEPENDS += "python3-grpcio"
-
-SRC_URI[sha256sum] = "2ab15ef7b2252a9ba31df500bbe295ce5310a8b01ea6f6d67a17172d914a41a8"
-
-RDEPENDS:${PN} = "python3-grpcio"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb
new file mode 100644
index 0000000000..18e94b0475
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Google gRPC channelz"
+HOMEPAGE = "https://www.grpc.io/"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "84220ef2e7ec0a3792a151b6ffbc70691bf0f09cd009fe734f2946b917565694"
+
+DEPENDS += "python3-grpcio python3-wheel-native"
+
+RDEPENDS:${PN} = "python3-grpcio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

