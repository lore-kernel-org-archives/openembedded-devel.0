Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBC5C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 00:54:44 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.5345.1748393683033436412
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 17:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mJt7O/Ui;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e3e0415a7so4643257b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 17:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393682; x=1748998482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EohShUP2qUAP9kcpKAtw/2vurOxrmxWpnx8xxuxxk8U=;
        b=mJt7O/UiLm7EN8dpuldOwO09Eo3L0CiCmDBT7u8B3cizLCnz6lf/LHAgvwV8j8nrcp
         gTRY1g4KSGb6S4JZaaW3qKdxEtaV8uUiOsWpUu5I99LMxNz/VtP86EVNdX22Zt8HCz3u
         3wHByRvDNs9RdZAYsnocqCArJ6+PSFyQ3xguQAGQiVopFKMERYxBOp9jW9yjG78HCzQh
         nAUH9jeJAFipemYt86IlPKsdQgc/7RRsfnYuxS+nfgM1RnYfGgnP3NDuwSCZx2tAm0Lv
         IP1ilF/JnYt1EC/NXTF91rAdbbf4Rvz4O+vH+m28kPUuylGB+cVvowVOvO3GRGq6p4n+
         OHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393682; x=1748998482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EohShUP2qUAP9kcpKAtw/2vurOxrmxWpnx8xxuxxk8U=;
        b=mDCI7r4qorIh5EhHT+68Tr8r9VL9zn3fLtVfRHfeUIL6jwkqI8YDncLJ2I5YaIAb8l
         MctQlsu0KWD/75bcprjtlkJJecIdMlPNTQtxGSR/thkhDiqSfDURqQnv8f3XoqxBHzIx
         bG1WnEszuHZdVmeQFPk7RQc+oqQxjr2BA7bpTkMluO89VnNrIfI6fV9d13jxjgcq66T3
         /Ee0iOFjv5hceBcmY4cP8/676/kFgRwam222TLINJA4mxwNh6BTUda+VMASQ4TngiXfF
         aLpy8oQ9XbbaDlKyubTpqFLPN1/33smvG/1Zat0UYiQ9IdQZOu7gRf3JSDyuoqgbOqf4
         TBuA==
X-Gm-Message-State: AOJu0YxoZBIvZr0iv5RzPYUy2Ij9BKq+Gi7a6b04DAXDCY+pLcSAGZCP
	mgODly1Kalo0LBS3oVWI07SSD+N1r9zXr9jAaVf2ZLIl3KQFDtQrooc895w5j+EH
X-Gm-Gg: ASbGnctypKvS6nSCggs6mg2JbHsbl95Lk3JDT1Tca6rBJeBpxOYuGHdvJNmWno+3o1u
	Ygo6s2YvRJBvxAubOUCXbeMDBn3tU1IC9q7XKK0jMqxZPdgIC6Pq/n5yhfwqJgmaRtpl2RtbY85
	el0GAssmT2+nvAREhORitoKie2eYxYUtBpXZIfrwJeQx/LFq5KDZEQYqmFnZqBr3lYvII4+/Qqg
	YyOdyfgOvzOhXyQBxIguiDAtJd8+hq+21yVjkKb8fSCANBUiUN7UWv7mLzPxSFnI53+YUxEBU0D
	akBGUNUGuw+wIBush2+zUTw+pvvCCkF4iDZlleUSpLhbVWoYtZfr1Hgx
X-Google-Smtp-Source: AGHT+IHEpLXbgQZiwIaZ8ky6I/9xCOLhPqaAyth/sXjASDKfqMS8vD2wQUk5AVzrbRgn3K3m8hUZfA==
X-Received: by 2002:a05:690c:d:b0:70e:2804:9930 with SMTP id 00721157ae682-70e833a3d93mr43772837b3.10.1748393681532;
        Tue, 27 May 2025 17:54:41 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f67e4c7e1sm64297b3.107.2025.05.27.17.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:54:41 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] xerces-c: upgrade 3.2.5 -> 3.3.0
Date: Tue, 27 May 2025 20:53:43 -0400
Message-ID: <20250528005343.1254660-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117641

Release notes : https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12355023&projectId=10510

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xerces-c/{xerces-c_3.2.5.bb => xerces-c_3.3.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/xerces-c/{xerces-c_3.2.5.bb => xerces-c_3.3.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
rename to meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
index 9fd7e8fbab..2819366dc9 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2 \
     file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch \
 "
-SRC_URI[sha256sum] = "1db4028c9b7f1f778efbf4a9462d65e13f9938f2c22f9e9994e12c49ba97e252"
+SRC_URI[sha256sum] = "ef752578587e26013a933f16d76305c9b43ca32f869e3d3426986e03efb01d64"
 
 inherit autotools
 
@@ -29,7 +29,7 @@ PACKAGES = "libxerces-c \
 
 RPROVIDES:${PN}-dbg += "libxerces-c-dbg xerces-c-samples-dbg"
 
-FILES:libxerces-c = "${libdir}/libxerces-c-3.2.so"
+FILES:libxerces-c = "${libdir}/libxerces-c-3.3.so"
 FILES:libxerces-c-dev = "${libdir}/lib*.la \
     ${libdir}/libxerces-c.so \
     ${libdir}/pkgconfig/xerces-c.pc \
-- 
2.43.0


