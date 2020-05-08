Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.555.1588961328812891279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 11:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMkdPk6n;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id 50so2416505wrc.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oFSFYBUEf9mbvu+pOQ8M6O+sgtqHCO69E4brdHEldbQ=;
        b=tMkdPk6nSC1MpiZuUwPlcYjdlHojwchXiETM8dQz7Ha9HXPycZtJb8xxoYmnhCemqu
         I7mOKl/dDj/lRtYYfJpNtjU4tm+0R9sIMs3yslSeJE6wCbA4UmaouEjRwSIe8oixaY0W
         aOkHwg3AwaI4ityvPQaUSJB0i6pWC3PGqR5d9WFdmX1A7TlUyfzLWE7zDyDS7MCOL1GE
         v/gnkQLCvmgcL1+18AieAruzrd+xaq8Keh6lhbcPw2AQkct1V/UZKrpaAKwfFNvcl65F
         dlRTmiwJ8Zq/9+Rej0C2zbD4orSS38pf2eyAd3N15b5sbCvlSYqK7vGLK8xZzFVsy0qN
         qzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oFSFYBUEf9mbvu+pOQ8M6O+sgtqHCO69E4brdHEldbQ=;
        b=qJD/z+/N347a85gdA6eh1BVeEV/bUBJIcNDHI4rictadorpK6hBkVI41fXerP6L9E4
         cFmesdgXIdmBNLiq/riWpOKMwmATWcXLqW2J1tnBdm9rcZBa+epycIpKBErLLZWKc10c
         LuNbO++hfuP5LeSbk1xI5or4U9uFuBr3r7X9uc7Emqp1LIBaRo/9GPZqbTcfksuIuIoy
         hp6BYqeUsqTOKwITfwfgoShY41Vg7oV/HoT+taSWlOGRy4YdELvWhW+zqkQ5bsY8G6mQ
         W+dYuv8ZoGWnErvPxHTPKY3kjzHsD057U1XxYqubCD5ZReI82VuP2A0kVyIDK12euO9Q
         rUMg==
X-Gm-Message-State: AGi0PuaQ1PybGOnjMYV6AXmj0iXxjXzopZp69KC6j/EJCQny9baqB1D0
	nw7BJQkwkUltG7Q8LRA6IvxU08u2hcLgVw==
X-Google-Smtp-Source: APiQypKbTpZDzvJ/k83cnM4s+gAxMz5qAffN3aXAllIzMzqVxvh53LbCSY56Ko9YF1mDgZzO3bgynw==
X-Received: by 2002:a5d:6605:: with SMTP id n5mr51112wru.198.1588961327056;
        Fri, 08 May 2020 11:08:47 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from t460s-2.res.training (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id s12sm3890659wmb.3.2020.05.08.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 11:08:46 -0700 (PDT)
From: "Robert Berger" <oecore.mailinglist@gmail.com>
X-Google-Original-From: robert.berger@ReliableEmbeddedSystems.com
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [meta-java][PATCH v2] icedtea7-native: host gcc-9, extra CFLAGS needed
Date: Fri,  8 May 2020 21:08:32 +0300
Message-Id: <20200508180832.8903-1-robert.berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1

From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 8d0dc71..b9ad2bd 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -28,6 +28,11 @@ CXX_append = " -std=gnu++98"
 # WORKAROUND: ignore errors from new compilers
 CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
 
+# oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "9"
+HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 2)[0]}"
+# if compiler version 9 detected, add more CFLAGS
+CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
+
 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
 inherit python3native
-- 
2.17.1

