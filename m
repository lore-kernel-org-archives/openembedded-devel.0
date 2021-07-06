Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.7332.1625583206595087108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qwo+iIGg;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s18so6539307pgg.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cokT6XBiTS2Mr5iLrbv9LEe6aSstJJ6hS8jihRyglxc=;
        b=Qwo+iIGg7TfkozGDzFnD5BTG1o3P+THvMsNSUpkI+GWnr7QYesBiemO7OM1QvpYXCT
         KKj8GWC8IMFMcCmlN2Y85cSdL2g8y5TeHG3fwOlu5UXab8bKFL9u9MrJ+yYHGi+o02Ou
         Ku1V7hcGaCLzPvCYyBFXyNELaGxxT35JfRxfwJTZsibS3C4G4jvSKOYo2LxhOAv60dt6
         2i1kP+QMpPP9zkzfZmNl7YJEirKJFiWHRd7OjP6jdEkfKCFCTbj7wnioTgDq+pbRimSL
         5JYEhpbFOQTflhxDBDHhpD4Dwxovm/NusQC90vnY1HyaL/r+Bd2FA+ygFvParvlZ5kla
         HWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cokT6XBiTS2Mr5iLrbv9LEe6aSstJJ6hS8jihRyglxc=;
        b=C/IN9Y6sXLnYTHzo+0j5kIp9++Z9rymn+DAmxCtinMLabPQwFDxjI9vXljiLqu473w
         afB/IRlQ2pQU+hVEBthSmioAZGw4KUf8525tZuYGuF4in+cyk4vy6VEn9UlRjzsWs57A
         GGF0ZLATlxb4EW97G3UFy1j1eWQkOTAR/8VgLR/EIU8j6MR6GjQc4L3YLGn8Ng+F+36J
         s7niK1hALUbwtpOu8vDk8QcpS5uhrtbTQQi2/hbwDZxflipgK+4eY5XSmWuI5d1+h75Q
         sdqlaft7NfUsHAheaF54viCiz0DxH4DirAmwD71/eRZsINQCJpdKwkQxqW1IWV22coqH
         BlRQ==
X-Gm-Message-State: AOAM533GNJmJDJ9pR1Ozc8xcRS/9uSfSxpLOEdjxBNreh/AoHe8va7J9
	tov7ctlNQXSQIdZ+IaBqKFr4XewNCif0UQ==
X-Google-Smtp-Source: ABdhPJzadMFtn06SMAd1rD3nLV1n17ivpcNKlRJbuhZqwtzDofbNLH02Ij72mQ/lrSLgpOLOyf5H3g==
X-Received: by 2002:a62:7a08:0:b029:323:c5f:6503 with SMTP id v8-20020a627a080000b02903230c5f6503mr4089433pfc.59.1625583205936;
        Tue, 06 Jul 2021 07:53:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/11] add CVE-2011-2411 to allowlist
Date: Tue,  6 Jul 2021 07:53:14 -0700
Message-Id: <bbd2addbcf2e418f34529f0d7cd240b7695e35fe.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sekine Shigeki <sekine.shigeki@fujitsu.com>

This affects only on HP NonStop Server, so add it to allowlist.

Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb4a4f0ff8d9926137cb152fd3f2808bd9f961ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit d614d160a10b3c5ac36702fbd433f98925a9aa8e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 1a982368ec..d7b5864715 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -44,6 +44,10 @@ SRC_URI[sha256sum] = "7dcfc2aaaac565b959068788e6a43fc79ce2a03e7d523f5843f7a9fddf
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
+
+# CVE-2011-2411 is valnerble only on HP NonStop Servers.
+CVE_CHECK_WHITELIST += "CVE-2011-2411" 
+
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-- 
2.25.1

