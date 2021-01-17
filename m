Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.21063.1610905028146722884
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nre9YGWN;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id i7so9476775pgc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Os3nG5Q/8M0/Ee1WBlPbPzKU+zkNpRxV6R/0Jo8IZcc=;
        b=Nre9YGWNQGG08sy54khWUZOZVHRfP+wzxC4brcDA1zGaWtadEISH1OOiSHEJKEIxUf
         d3Tx1QAwpcryO2ei3+m2Z9ZRtF6vTjofqzoINW8MUCPxKq1zoBPhtMEzpc79PtzX7XuW
         9bpZaocCD/RSvr1LCQy7N9g++NlmxZiEdekAiaBXUgE3X+rO2pk1CVlITk0dm3LS3s8q
         sVwxhTibsq2AICrjBupWJkPIug5myokLyvy3SOZyObLlE86n74KgJQhBLeenMV+ziKjo
         Sg27gidFC4oafHT4vo3QdTVzVmorlBjtvZ6DTHZ3/kSW1V9LMchPj8LxJXDbgZp/bFd3
         t7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Os3nG5Q/8M0/Ee1WBlPbPzKU+zkNpRxV6R/0Jo8IZcc=;
        b=tRwMd2zHEszQUwSTec7BFoRDs7xEdt+Wk2PJO9PH9mFAU8KL4K8ZN6gJAWs/9mqVCK
         M7u//FRO2yaWGErIoysmEb9KyKQ9b4W6qfVkAqHo/OYbu/n66h2Ax/lS+KtX7G7NxQ/G
         KspQWHKNdy3xfPVrEn4bBvZy/260zCabyX4DFz6EQt5xFP1Fi01FwdbhNtdWuu9cR7yj
         3ub+0Gtndc/xe2mCYCQUFJq8NQ0DwvwoSguFEkggPju9veBXT8YDVXpvuMjfwSZP3ffl
         +9BybUAuApfEXrJaIBDktFIRgnVse0b+iOlUCkSLlg9/in4LLWhp707wNW5oQKi2+s4x
         aK/A==
X-Gm-Message-State: AOAM533aeFARLyoPVMRDtk0O6NIlAw769PWUF/e7S8DMSVQy5r6RPkYU
	834Kz6MxmPZBQmp2YUqAKkaVYyKDcfTmdg==
X-Google-Smtp-Source: ABdhPJx0KH7fauRPyNcfNrdiWNB/6YAITLNqHZrvyooHQPpK+u9Gspuo3bQ4dpIMeuP/NvoX5sPgHw==
X-Received: by 2002:a63:d141:: with SMTP id c1mr22390522pgj.75.1610905027400;
        Sun, 17 Jan 2021 09:37:07 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:07 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 26/31] nodejs: 12.19.1 -> 12.20.1
Date: Sun, 17 Jan 2021 09:36:31 -0800
Message-Id: <ac6bc96e7da6b3c9d5b9c9272b487a926fbb462e.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Sean Nyekjaer <sean@geanix.com>

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cde1019804c2f7b67bf89d178eec9f4efafea414)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.19.1.bb => nodejs_12.20.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.1.bb => nodejs_12.20.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
index 8021fedf44..0673a3202d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=30e27bd6830002d9415e4a5da7901f03"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c66ff8861d9f96076a7cb61e3d75f54"
 
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d"
+SRC_URI[sha256sum] = "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

