Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.11337.1629036414653152535
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=StH2+Es6;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c4so1659824plh.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9aZ8l1rAIb4FNoGYav+fl1KNygxdCOKexoNJX2O87Mo=;
        b=StH2+Es6VPaF5fMYdRCVrbQyFORLM+mjo8tkn2uDxr8N1mPIWo90c/9oNGsyQUEZfD
         LROHup4iss9hGKBwk8uukDsi91E6jqPBYI/4TcQDKg90gM2bthetJM3xQVN/ECCmk5vj
         WQLNctVFDSMSdJwX6FdyxMT40sL6EdMSJNOCrEIK2Z8/LpKwncngdFuPNKkaZfVcl7hj
         mySBLXmGHb+p6/wmVY7eUgsZykWoc2XrC0gXcv2hAtS66jPkjhXJKLhJqBP0mNq6GhbX
         ITtcO9grnMif6sfZPt9L0t+ck1xBgQp0ZxDhRmimaMhHrnnPZNOd2p2hydq7hKoS74R/
         Wdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aZ8l1rAIb4FNoGYav+fl1KNygxdCOKexoNJX2O87Mo=;
        b=jTrhTABhb13S+/q1frOYOsEpmQbdVPxvoKlztdfJxmj17WVQpHZQXSZspaDcN5kHW5
         4PO7Eb4YuXOtMvecKc3z/bcEedSf6n/duZttIOCdtrPtSJ+eSZWLL+llHVrqyuerG+u/
         tkEZmisXPnbMJQXFBJCqo5nBwMM8VHApMOl2/3QbkZAgKuvASrpJK3afA1oeS5mCleEZ
         /bJfdNXeZKQY0Sf+FZCwBYfQh9oL1/6t3x86dvhIIbLh3MDbZYQgPmP/Kn3Lvj9WHNEw
         ORoo1zwbD3a0p5BeZrsXWsqTCmqGsNZs/AfiO6Ytw2FRscDFqVEVLunA0OmzSs/iW+7D
         jBCg==
X-Gm-Message-State: AOAM530H7ia9rHON8TaNKqV0mIJ5Mcp65pQhx3GjRNtCvWl47JTdfWs7
	kmibIiqDEj26EcJIJBv5000Zi8T/dtVYcQ==
X-Google-Smtp-Source: ABdhPJy73RYcoWiORU1tS7zGAcV74EF/Gje8ViH1HwHanJbhvCurroOEnn4yYbsgSzhCSAcDzAi44A==
X-Received: by 2002:a62:178f:0:b029:3e0:35c4:f0f with SMTP id 137-20020a62178f0000b02903e035c40f0fmr11726930pfx.64.1629036414124;
        Sun, 15 Aug 2021 07:06:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 16/18] ldns: fix QA Issue after LDFLAGS change
Date: Sun, 15 Aug 2021 07:06:28 -0700
Message-Id: <2e794f33a43d71bb98619f3d7efaa460ebd7e12f.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Battersby <tonyb@cybernetics.com>

Adding -f*-prefix-map to LDFLAGS caused the following issue:

QA Issue: ldns.pc failed sanity test (tmpdir)

Fix by filtering out -f*-prefix-map from *.pc files.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a4791bf2f37de55dd51971d34ac2252d3cf68f30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
index 2a52dd688a..2ce669154a 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
@@ -16,3 +16,10 @@ PACKAGECONFIG[drill] = "--with-drill,--without-drill"
 
 EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR} \
                 libtool=${TARGET_PREFIX}libtool"
+
+do_install:append() {
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${libdir}/pkgconfig/*.pc
+}
-- 
2.25.1

