Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.405.1610042569332413017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: vomegaz@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d26so6491821wrb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Jan 2021 10:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sS2wIbmmEv88nPHsSZFZgqA/1phNi+625YNwGIfO9Cw=;
        b=XUD4T6htCiTsW370kc9Nd1/ULt5ByLV1GRc3aKHh0J7hWct1VhglhJ8QTqstce3gqL
         DF3+gU8A6J702ayvYtAaB/uxFTT4nursNienAmf9IpELktogsq+Oy9AM26KI81vlvKMP
         46C7pFBXiL0OTMQ3bhcNQgfIcOPiTSE1S5iTfNPbAYZHBwgx4MpDwmbDd2Jtng3JHXS1
         wFIvEgm9YnxGdtUbhJsmbPPLsQ/H/cbcTG5ioEe6UMLxtYo8KUHdO58dvqI8PfhGn6cC
         4Y8+rO0vQMp8GmgZ9kwoTN4+Pt0DzCRLJ59e1cnJ7LyREJZXPgceGXK87EaRzlUdG7H9
         38yA==
X-Gm-Message-State: AOAM532GGgOuq06XYm4YCUeIX/kVeJ5UuHHwqUKvKVAHyajMTvEaP6U5
	ap1B77lGDjuQncBwh5igVnsFtiuJUgc2aQ==
X-Google-Smtp-Source: ABdhPJwVmXFMRQKZYKa5gofT1C4GVXeJHvBqwUFbJZe24S7yFOuYCbme5XrT5AD2yBR6pRKccJb1rA==
X-Received: by 2002:adf:a50a:: with SMTP id i10mr10076900wrb.123.1610042567568;
        Thu, 07 Jan 2021 10:02:47 -0800 (PST)
Return-Path: <vomegaz@gmail.com>
Received: from localhost.localdomain ([2a01:e0a:8a5:e0c0:c575:ed36:206c:6670])
        by smtp.gmail.com with ESMTPSA id b200sm9058468wmb.10.2021.01.07.10.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 10:02:46 -0800 (PST)
From: "tperrot" <thomas.perrot@tupi.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] go.bbclass: don't stage test data with sources of dependencies
Date: Thu,  7 Jan 2021 19:02:38 +0100
Message-Id: <20210107180238.1866108-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Perrot <thomas.perrot@bootlin.com>

As for the sources the dependencies contain test data, ELF files and other
binaries which aren't necessary for building and which lead to unnecessary QA
warnings.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 5b26378a4e..fa147892b0 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -116,7 +116,8 @@ go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
+	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
+		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
-- 
2.29.2

