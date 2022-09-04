Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5E8C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11280.1662276881332047114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpIYPlcm;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id fs14so929739pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=alDAuWTEi3+stuDeW9E1B/SfGDr1fMaigsRoR2jfX6A=;
        b=fpIYPlcmLM2uv3ZjvbW8DFhjZ3LfC3UIhmLlCFDd7ujkx4QnYyjZGQXrENHZLL6C2W
         XVcwChcqvr+QZhHW4diQQHeRBs6wRPijppOEN9w+Bl56cG9pdV2R16MKrF7AMx7aZ03w
         JwHti54yKepHHey1zaom/HvWGIVX229TF//s9PFbi1ZRXwjuwyJRBeiQ0dhswYCVpx7l
         LY4G063k5NWq2uVIxumErn/VyZTtUzdCSaCOSS3zLsJBlp7a/xDHbDWlm0yY9YD3wnEw
         K0di9AvXNpap4BLxilNKzW1Lf0MqzOUgTLoIgoAYYOKvUDuqRdnkL8dav8njWWBJjZaH
         KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=alDAuWTEi3+stuDeW9E1B/SfGDr1fMaigsRoR2jfX6A=;
        b=Q7PEW7NkPOtu43b+hBhBpXz7vQPHLarDVrKlBV1Yqz2JClp7nxh9OVQgFXljZMA5M6
         AXvMeO3N2/nNDMUHjaG/z5cwsgiUbu/4SP6WhFpf3+O/UFgENbzNrbUF+2DjfgEqKtsq
         H7Cht36sBLM1YZI7tATSTRLK9IhumprMAfEeOwVWDMhXCT+yg7crb8DME8Wr+XCE0NJj
         c3hDsl4ogqJOdViFK1zXPohuMNPIwp2GRmdjGL4TiFzPdhlrgo2Yjr70MQANe9O9Wc5a
         kkSwjmMakHlv4MPptFrnG0MRmkVKUIidIUYXKnqAMOdLvI1xohcyhbMJZZs4zmu4MB8M
         jNtg==
X-Gm-Message-State: ACgBeo2/y/Y05nsXpBYrLoVsCVAY1/CbhwDySmzSYOLqHiz5zg2XGsYz
	+tlJRnltm4dnCFzVpOi15OcUHgAq7eCodw==
X-Google-Smtp-Source: 
 AA6agR4l7En7m3iIyHHtApOnWMdyQL4vWXjsuMAznYJDy4IC3TzLh9dooThveRiDNkuGkL91/cttUw==
X-Received: by 2002:a17:90a:7185:b0:1fd:768f:232d with SMTP id
 i5-20020a17090a718500b001fd768f232dmr13833278pjk.149.1662276908578;
        Sun, 04 Sep 2022 00:35:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 47/63] gtkperf: Define prototype for setup_appdata
Date: Sun,  4 Sep 2022 00:34:01 -0700
Message-Id: <20220904073417.3251865-47-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98641

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Define-prototype-for-setup_appdata.patch | 27 +++++++++++++++++++
 .../recipes-graphics/gtkperf/gtkperf_0.40.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/0001-main.c-Define-prototype-for-setup_appdata.patch

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-main.c-Define-prototype-for-setup_appdata.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-main.c-Define-prototype-for-setup_appdata.patch
new file mode 100644
index 0000000000..08e899b9a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-main.c-Define-prototype-for-setup_appdata.patch
@@ -0,0 +1,27 @@
+From 6b5f695cb206cd8b3cbcbcd7713e52772e89306b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 20:47:32 -0700
+Subject: [PATCH] main.c: Define prototype for setup_appdata
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index c226799..b4ce6d1 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -18,6 +18,8 @@
+ #include "callbacks.h"
+ #include "appdata.h"
+ 
++void setup_appdata(AppData * appdata_in);
++
+ int
+ main (int argc, char **argv)
+ {
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index 0c4f819892..a70d31fed0 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
            file://0001-Include-stdlib.h-for-exit-API.patch \
            file://0002-timing.c-Fix-format-security-errors.patch \
            file://gettext.patch \
+           file://0001-main.c-Define-prototype-for-setup_appdata.patch \
            "
 
 SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
-- 
2.37.3


