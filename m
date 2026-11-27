Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8231.1795739772842868956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=voPSlcT2;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05bc71e01so31761015ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739772; x=1796344572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sZ+zIHSOEt4RV13YKZLv9JmmrjTmGyWo5F6UBO1ILM=;
        b=voPSlcT2pl1aDW7LbA5CaUPORt9pSNxcE3f5NKKEauEYOo8nGXeqOeOqHZWioSmPTd
         JVMYGGV3yj+Sun4Oxxdze1ZWe0tQpYRtPxaDcKbGJTrsSInAxS4obWBtFEQ8F6vgrzHM
         GUPy/wiCn6acYdelA4twkMFD6GSQrUdWToFh68m2K4Br++EP1QKkfHuWiRDdQpNGqm6Y
         eVnUgztbiCrh70l1zj7Nuils/USPjUAMLGdJPthkQLKYwFFDsID6nC4AV8F+p1NWibvA
         3+oquZDrvvw2JJXp7zc+YHU6wm9pzGGljA4xMqG48Axu/gCDfLJZq/BDi8Wt3DPoQjCP
         7Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739772; x=1796344572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sZ+zIHSOEt4RV13YKZLv9JmmrjTmGyWo5F6UBO1ILM=;
        b=IgDdE2HIeKIT1B0ycQzBMwW/7tzHbq8AYeN2tiyhCyB0kgPc/sU8u9mS5IMWnUOPzo
         8ncf4OVDsm06pWx+yFjdHQFSs/0ZQLhur5bTfheJ6l2DHPU4ABagvOHzzhjUVZ8VQKKj
         CEV2t5kacju7Z/KVPG9Q3pK5cwpacIgPA7TWfcdreDawlmXdFFvmLqGGrkOU6ZTvaqBi
         BKuoKMGXfx8AfcvIshw3QVKuAe04Nwk4FbSBSnyUr/V2wrPVWs8b6i37QPBrIrW3ZC8B
         leXpUTmnrkBbH6JlbMJyS4JGmfF6IJT+0UWLg64pcxJ1z2enMR2a74ecguAzLhpo5JHD
         rQVw==
X-Gm-Message-State: APuU4Z8JiuZMuevxjb8VZjaJz9RcgBOoeRWGN43XaZKNK5622q9DXCiI
	a35hTGzAm+YURt4mdIAUBKIcfEo1NXJRq0bLkkzADfnBUzxLJUBGznRQs5sYltT+
X-Gm-Gg: AZFdTZfSggNumGeiVyeTHI1PQQRHompTpWaj95Ci5pMyg6Z1seR2bznaXp2+d+uyQG4
	JUd1tkeLxkFGj3FB3CUUZsJSYH2hETDhYICYfR+EpZ/IJkxtf4f/MntOPKAZW/ka0uuIl0WCJ9A
	oXRepoBxHSjAghgKq78Qdy8s5F1UrGf2rC1+tJo41eBS/BjBaOSkOJD+EB45/T5WI+OSg1/lMac
	UaiziCXFsOWrlEGj5cVpTtjC/mdn9vATfw0jy+F4skSrN/bTzPT6o7pZ3fpmtvW8uqhXFgwC472
	PT+TcaweqObDgL0ZCn3pC8yup1icfO/G6ltORlJqfLPPtUjdJOrumghI2LYrlkPLrwc7UZn3IlF
	ulNRRZBcOpFcU9yDNuDlLWMfzXffgirVmWsUXEhIdiHc6CYKsoCSKz5cU/ofmR1EpKICUxZS+5c
	IioKCLzHmgxvzqzcoJsTeGtRonW5/+wD6+6EAf2qsTzJ2hOIfrsGyGaD476iSgKQtZnQnK2yy4a
	jtmhF8EoDJB7AqYFsrQJ2f6sdK9N30uhhCkACeUicSxfDjYTY/s4s6owsjiFVxlTQsw+DPdjknC
	uSRYDDF/Dyk/UCAXhWzIOWSlUZP/XNmeBAA2eK6O2N2OdNskqCKbxRgQw3NJIONn2jXZDQZw847
	Gx7p+OaMvM/zV1SdNX9LLifV/co29YUU6r188dkKDLVK+og4k5XEdzk1YjHA+X+xSEh9064VjYA
	6YwIUxvqbXtlGpzHVx35BdwXD9ZdYjUOoPQXSJmfw/Vyk2yDHc84su0OjdGD0KHsAxMxgiVaJ+n
	umJjjIvohv52bkhiUSp8Tbz2sKFkAIAaM5VfU+S4VtIg+XMnzwV0j01+ZRb589vVJUa0n+OV6z9
	tAYKwQ==
X-Received: by 2002:a17:903:2f07:b0:2f0:a027:7226 with SMTP id d9443c01a7336-2f0a027731fmr139533105ad.57.1795739772156;
        Thu, 26 Nov 2026 16:36:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/39] trace-cmd: Fetch from the main trace-cmd repository
Date: Thu, 26 Nov 2026 16:35:11 -0800
Message-ID: <20261127003543.2167775-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133177
Content-Type: text/plain; charset="utf-8"

rostedt/trace-cmd.git on kernel.org carries the same master branch but
no tags after trace-cmd-v2.9.4, so the upstream check could not see the
3.x releases and the recipe set UPSTREAM_VERSION_UNKNOWN. Fetch from
utils/trace-cmd/trace-cmd.git, which has the 3.x tags, with the same
SRCREV, and anchor the tag regex. The check now reports 3.4.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 221a1701f9..7b3bcfdcf2 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "User-space front-end command-line tool for ftrace"
-HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git"
+HOMEPAGE = "https://www.trace-cmd.org/"
 
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
@@ -7,15 +7,12 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
     "
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master;protocol=https \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git;branch=master;protocol=https \
            file://0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch \
            file://0002-Drop-using-_LARGEFILE64_SOURCE.patch \
            file://0001-Do-not-emit-useless-rpath.patch"
 SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
-# The kernel.org mirror we fetch from only tags up to trace-cmd-v2.9.x; the 3.x
-# line (PV 3.1.5) lives in the newer trace-cmd.org repo, so no tag here matches PV.
-UPSTREAM_CHECK_GITTAGREGEX = "trace-cmd-v(?P<pver>\d+(\.\d+)+)"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "^trace-cmd-v(?P<pver>\d+(\.\d+)+)$"
 
 
 DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native swig-native bison-native flex-native"
