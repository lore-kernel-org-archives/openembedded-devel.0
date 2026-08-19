Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDC9C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.845.1787117855749300089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hmvMkB+j;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so639034a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117855; x=1787722655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vvuKgTXIp2Te7kYJF29OcfUo9SaR/3GU6mCbJFtsT0=;
        b=hmvMkB+jPiO6zLzSEOqRNzDbWUXr+gnxs0wJWx0vo7/0FTTHQ9U1pqggmFqenAINYt
         Y/zveUlzpfP61Ot+u/XqzggKEYOXrJ0P5WcZ4YCZvT6U038m8M/HpxwYPnzHEioSKpNP
         sy9wV4rA5tJJlFRjz1g7n4W1YnJUwS9t9dNP0wYYgvrYUdYZuF8OQWkOfivGuIKUcCkw
         Zc5pBXtX7chz39Y2rcHUyZy89+uceH9ODAlLtTQj3VE9IqQIYRgsoTFoR9Pfn1BqvCPu
         mT5ycWclkEnuZYjmvKtPuib0N4ioWMQL65WOLfHtuocVAzo4ZkzEGydu9E59H0FsyT0r
         wvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117855; x=1787722655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9vvuKgTXIp2Te7kYJF29OcfUo9SaR/3GU6mCbJFtsT0=;
        b=X+YA/y2hQqJLyQVh2HcgWn0K5WgeLV4eROIS2mK64Jd1dYc+qxWJS9/c/UBopr7Wy1
         uOt65kKhJEd/kGfON37MjDLSOkicChwbA10MZElxq2cyiZefK5LSgVQPS9i1HT45uOY7
         m+yend6ijDOqK5kPel8vDyfDc3lJC58bl2XH1AxSCwu03RTSZ/NjE5/2Adj99XR3Y0Qq
         9iP7cCdBLGtO9G+4NAC9dvfTKSzTbzt6tR7yWTzWutTj6KHik57gtmGcMp0sWWgMP34D
         WaK1BvuVkAMj6B3HHuFemTHWDPF/8WtVr0CVnAcyQp8ytI5WsQl4jFLrWucFRGLdKwAE
         ilxw==
X-Gm-Message-State: AOJu0YzBT9UeYIDItBnuOiZygxk4+EvQRQ6d0AWLtKq8+AhIq3bHplzw
	APsuNGbusHGyr4yCEFxK/IxRheMnoCGJbTJvT9w0qYB0pQPgAyh1NlEBdYC/UgJq
X-Gm-Gg: AR+sD108gjQBOU5SH6f0cLLCRGLT+CYVIO7AHgxTSjHo+sTED538z5Ba3E4d5dgvfNj
	DovB/U1KrYv/gFw5+uoXicw3QoqvbbWPqiAxgmK9amXTwslPjF0ZBScqgrq0pyAvJNP3cPDKIYo
	HVbwAx+9TYETCegMYhtO/a3xmlo9tfmfL4cfzZQdqJvvOW7MT/+GuUWGdfBif37z8rnLn4bgkl0
	KSdDtita8oqZrQ3y/uF7TOgK1E1JyBGvbe3gQTF4n+8Gd4oeDj9lKoZV85GSu+wRQs+5lhlpovj
	dPqFM2crUqUH6hPhbojykgUlOypN2RxO+IAA8BwLe/yKxLfuCV2CMlpd4L8ZnC6W5d3kRUzYm8G
	5RbkF8lm8eie4RKQizz/tcaEC1i66P1V7VDkW7V6yeopz9vAfx6X0pPCYXhLnryfHjDiC2e5daW
	XEUajLDN0cQNoamziI4+vvcgqeg/gG1+eRVuxfTYUsf3dr85Ae2g1ain766ENut+haScCPq5gbd
	A==
X-Received: by 2002:a17:90b:1dd0:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-39580f3bcffmr4230867a91.9.1787117854978;
        Tue, 18 Aug 2026 22:37:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 23/25] boinc-client: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 19 Aug 2026 17:36:27 +1200
Message-ID: <20260819053629.391864-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129267

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version boinc-client
...
INFO: Current version: 8.2.15
INFO: Latest version: 20120110
INFO: Latest version's commit: 8af68eb7391f3b1a3e0a4eef5a41f9887a5502bf

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
index 9b77e6833e..62aa757a59 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH};tag=${TA
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
 "
 
+UPSTREAM_CHECK_GITTAGREGEX = "client_release/8.2/(?P<pver>\d+(\.\d+)+)"
 inherit gettext autotools pkgconfig features_check systemd
 
 REQUIRED_DISTRO_FEATURES += "opengl"

