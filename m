Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB08C624DD
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4061.1788429042335738083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=crLlKCAI;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853c947bfefso764646b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429042; x=1789033842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJc8GFdgocD5qlrAVZjY5VVNh1aL+ZloB8bpH0lk3Ck=;
        b=crLlKCAIRWGJngJSq+NqnU68oYZMZwHTKozODzmrSSpqz+XBuKILp82ijAJ5RU18RV
         GdfoTfh5JmVWSFRoDFETtXwMMNXcFFx30UYv38B6o0K1k+80oqzk6VO06XBFP2seajKk
         sTNhCzX6XshRahVvc6g3BOrREUfgfZnzuSbZppfw3d8zvsxjbjz1NWxyN+pf9J2eaIJB
         SS+AypTmIBnMFfexbGRnOJy+/LF6fhmBejnfGL80rXXaAn1hOjIgajltXp9tG8yZsDwO
         upZEpqxN/fvvNrsf2Z0mQri8neoOiDO2FcTxv976EjmwAS7dpVBA9gB709AixQ3pJEPS
         OcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429042; x=1789033842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJc8GFdgocD5qlrAVZjY5VVNh1aL+ZloB8bpH0lk3Ck=;
        b=izpbWk0y6s6IuLt9M6o4Z70Ai14hxn8lfUrExzqasVgGwHrWKZWEEJdUJApouJ0O+8
         nrYd3NLXsE8g2wsxNPL87X9K0brUsWGoiG4zpORuSyr3URmCj5uvHrhe69nGG3bQJU1J
         ahndVIA9w2+8GJ+QWvtdQb3ekJxNHqxsu06i9xu9UlTRlUNIddsuROf+mGj1eWEMKQkO
         KHo/3mfFEdFi+uJnqHAEXAIrye3PTIbGRMIaYeQxerMJ7G2UITPWoJlknBVPxiVzRl9W
         oNFW7bkNOJfil/RNREla2Z7/o83PAkGE7Ch/KbFBR3uWCU1cKgDaY9KKhQM6Ia0/yRxC
         go2A==
X-Gm-Message-State: AFuF++luUsHQVWGgozoxhJYRvvm1WxieWqzvx5tOBBm9SCYFIP8MPq75
	mLJtQTwmcOjQrm000R4a2wXXV1K1VCc2KZnR049H4G6NBY8N0l/KE/3xSPmidc+o
X-Gm-Gg: AYBFou3ft+WFhUkpJ4nivKHPWMkAN81SKJlYf+cfKj61qdQJsQvJUGOWiGvPdiLueKl
	514ksGqsu94BO0/KNp0NwfCCLn4AMf9aC/lChX9otkuKnzqQtvhzuqOZWCHxrDg8koypSxwhdSX
	R89lbPVKwEdpwDlbTPRKheFLm+vXyq7zd4aLRfIxs1MZj9RRmZ2Y9JnkH+dlercIbfkeYa5Ydea
	SpJXoo37wYdij4ISLYk38e1R7UahZfzFEZESU5n5CGsHrKZxX8sAlG8z6EPphRrBxLEuWI8K7Ld
	3Uwu/iU/nY7yiPTSyZrGOSsw79k0lrJJUKA9kljYJOKUzQZRUrK11oDzayVr67z3kxKXuvdUJOt
	lDaR9BEPGQ9uoUXj9zQdEe71+YPvjgSC8sYaXvMIo32fvpKvRovLVBdSfmG1/UB63NmYdlJZspd
	dfWdQjL+T8j3cqixc+t9dSmDXVYSj4BwlYPHBH/aOeEZUX4s/2arWWakuXF7g7G8qBiynPYFs1
X-Received: by 2002:aa7:8894:0:b0:857:73c3:446a with SMTP id d2e1a72fcca58-85fff0c85d0mr3902356b3a.25.1788429041560;
        Thu, 03 Sep 2026 02:50:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 19/22] libiec61850: patch CVE-2026-19206
Date: Thu,  3 Sep 2026 21:49:50 +1200
Message-ID: <20260903094954.3240723-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129735

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commits[1][2] in order to cherry pick fix mentioned in NVD.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19206

[1]https://github.com/mz-automation/libiec61850/commit/c85175ddf7018beb753d85a740d4c2c77f61c96c
[2]https://github.com/mz-automation/libiec61850/commit/6178540e8cdd26b7884a482905140cc9084966a1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2026-19206-1.patch  | 129 +++++++++++++++++
 .../libiec61850/files/CVE-2026-19206-2.patch  | 134 ++++++++++++++++++
 .../libiec61850/files/CVE-2026-19206-3.patch  | 115 +++++++++++++++
 .../libiec61850/libiec61850_1.6.1.bb          |   3 +
 4 files changed, 381 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.patch
new file mode 100644
index 0000000000..b7b86b3f64
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.patch
@@ -0,0 +1,129 @@
+From 04f95bf3e54614122621b520eac29dea160de1c7 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 17 Mar 2026 12:41:32 +0000
+Subject: [PATCH] - fixed memory-safety issues and potential NULL pointer
+ dereferenciations in SV parser (#585)
+
+(cherry picked from commit c85175ddf7018beb753d85a740d4c2c77f61c96c)
+
+CVE: CVE-2026-19206
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/c85175ddf7018beb753d85a740d4c2c77f61c96c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sampled_values/sv_subscriber.c | 35 +++++++++++++++++++++++-------
+ 1 file changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/src/sampled_values/sv_subscriber.c b/src/sampled_values/sv_subscriber.c
+index 221eb1a8..bb82818e 100644
+--- a/src/sampled_values/sv_subscriber.c
++++ b/src/sampled_values/sv_subscriber.c
+@@ -423,16 +423,24 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+             return;
+         }
+ 
++        if (bufPos + elementLength > length)
++        {
++            if (DEBUG_SV_SUBSCRIBER) printf("SV_SUBSCRIBER: Malformed message: element length exceeds buffer length!\n");
++            return;
++        }
++
+         switch (tag)
+         {
+         case 0x80:
+             asdu.svId = (char*) (buffer + bufPos);
+             svIdLength = elementLength;
++            asdu.svId[svIdLength] = 0;
+             break;
+ 
+         case 0x81:
+             asdu.datSet = (char*) (buffer + bufPos);
+             datSetLength = elementLength;
++            asdu.datSet[datSetLength] = 0;
+             break;
+ 
+         case 0x82:
+@@ -471,22 +479,17 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+ 
+         bufPos += elementLength;
+     }
+-
+-    if (asdu.svId != NULL)
+-        asdu.svId[svIdLength] = 0;
+-    if (asdu.datSet != NULL)
+-        asdu.datSet[datSetLength] = 0;
+     
+     if (DEBUG_SV_SUBSCRIBER)
+     {
+         printf("SV_SUBSCRIBER:   SV ASDU: ----------------\n");
+         printf("SV_SUBSCRIBER:     DataLength: %d\n", asdu.dataBufferLength);
+-        printf("SV_SUBSCRIBER:     SvId: %s\n", asdu.svId);
++        printf("SV_SUBSCRIBER:     SvId: %s\n", asdu.svId ? asdu.svId : "(empty)");
+         printf("SV_SUBSCRIBER:     SmpCnt: %u\n", SVSubscriber_ASDU_getSmpCnt(&asdu));
+         printf("SV_SUBSCRIBER:     ConfRev: %u\n", SVSubscriber_ASDU_getConfRev(&asdu));
+         
+         if (SVSubscriber_ASDU_hasDatSet(&asdu))
+-            printf("SV_SUBSCRIBER:     DatSet: %s\n", asdu.datSet);
++            printf("SV_SUBSCRIBER:     DatSet: %s\n", asdu.datSet ? asdu.datSet : "(empty)");
+ 
+         if (SVSubscriber_ASDU_hasRefrTm(&asdu))
+ #ifndef _MSC_VER
+@@ -598,7 +601,8 @@ exit_error:
+ static void
+ handleSVApdu(SVReceiver self, uint16_t appId, uint8_t* apdu, int apduLength, uint8_t* dstAddr)
+ {
+-    if (DEBUG_SV_SUBSCRIBER) {
++    if (DEBUG_SV_SUBSCRIBER)
++    {
+         printf("SV_SUBSCRIBER: SV message: ----------------\n");
+         printf("SV_SUBSCRIBER:   APPID: %u\n", appId);
+         printf("SV_SUBSCRIBER:   APDU length: %i\n", apduLength);
+@@ -791,6 +795,9 @@ SVSubscriber_setListener(SVSubscriber self,  SVUpdateListener listener, void* pa
+ uint8_t
+ SVSubscriber_ASDU_getSmpSynch(SVSubscriber_ASDU self)
+ {
++    if (self->smpSynch == NULL)
++        return 0;
++
+     return self->smpSynch[0];
+ }
+ 
+@@ -800,6 +807,9 @@ SVSubscriber_ASDU_getSmpCnt(SVSubscriber_ASDU self)
+     uint16_t retVal;
+     uint8_t* valBytes = (uint8_t*) &retVal;
+ 
++    if (self->smpCnt == NULL)
++        return 0;
++
+ #if (ORDER_LITTLE_ENDIAN == 1)
+     valBytes[0] = self->smpCnt[1];
+     valBytes[1] = self->smpCnt[0];
+@@ -912,6 +922,9 @@ SVSubscriber_ASDU_getConfRev(SVSubscriber_ASDU self)
+ {
+     uint32_t retVal;
+ 
++    if (self->confRev == NULL)
++        return 0;
++
+ #if (ORDER_LITTLE_ENDIAN == 1)
+     memcpy_reverse(&retVal, self->confRev, sizeof(uint32_t));
+ #else
+@@ -924,6 +937,9 @@ SVSubscriber_ASDU_getConfRev(SVSubscriber_ASDU self)
+ uint8_t
+ SVSubscriber_ASDU_getSmpMod(SVSubscriber_ASDU self)
+ {
++    if (self->smpMod == NULL)
++        return 0;
++
+     uint8_t retVal = *((uint8_t*) (self->smpMod));
+ 
+     return retVal;
+@@ -932,6 +948,9 @@ SVSubscriber_ASDU_getSmpMod(SVSubscriber_ASDU self)
+ uint16_t
+ SVSubscriber_ASDU_getSmpRate(SVSubscriber_ASDU self)
+ {
++    if (self->smpRate == NULL)
++        return 0;
++
+     uint16_t retVal;
+ 
+ #if (ORDER_LITTLE_ENDIAN == 1)
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.patch
new file mode 100644
index 0000000000..e39cc3e17a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.patch
@@ -0,0 +1,134 @@
+From 62741cc994ae02ef95e664b9470a22089788cff4 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Wed, 17 Jun 2026 12:22:34 +0100
+Subject: [PATCH] - SV subscriber: fixed - null terminator for svId and datSet
+ overwrites tag and can cause OOB write (LIB61850-563)
+
+(cherry picked from commit 6178540e8cdd26b7884a482905140cc9084966a1)
+
+CVE: CVE-2026-19206
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/6178540e8cdd26b7884a482905140cc9084966a1]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../sv_subscriber/sv_subscriber_example.c     |  4 ++
+ src/sampled_values/sv_subscriber.c            | 56 ++++++++++++++-----
+ 2 files changed, 46 insertions(+), 14 deletions(-)
+
+diff --git a/examples/sv_subscriber/sv_subscriber_example.c b/examples/sv_subscriber/sv_subscriber_example.c
+index 0e3ff720..6487052b 100644
+--- a/examples/sv_subscriber/sv_subscriber_example.c
++++ b/examples/sv_subscriber/sv_subscriber_example.c
+@@ -30,6 +30,10 @@ svUpdateListener (SVSubscriber subscriber, void* parameter, SVSubscriber_ASDU as
+     if (svID != NULL)
+         printf("  svID=(%s)\n", svID);
+ 
++    const char* dataSet = SVSubscriber_ASDU_getDatSet(asdu);
++    if (dataSet != NULL)
++        printf("  dataSet=(%s)\n", dataSet);
++
+     printf("  smpCnt: %i\n", SVSubscriber_ASDU_getSmpCnt(asdu));
+     printf("  confRev: %u\n", SVSubscriber_ASDU_getConfRev(asdu));
+ 
+diff --git a/src/sampled_values/sv_subscriber.c b/src/sampled_values/sv_subscriber.c
+index bb82818e..97f881f6 100644
+--- a/src/sampled_values/sv_subscriber.c
++++ b/src/sampled_values/sv_subscriber.c
+@@ -81,8 +81,12 @@ struct sSVSubscriber
+ 
+ struct sSVSubscriber_ASDU
+ {
+-    char* svId;
+-    char* datSet;
++    char svIdBuf[130];   /* copy of svId - only copied when the user requests the svId */
++    char datSetBuf[130]; /* copy of datSet - only copied when the user requests the datSet */
++    char* svId;          /* pointer to the start of the svId in the ASDU buffer */
++    char* datSet;        /* pointer to the start of the datSet in the ASDU buffer */
++    uint8_t svIdSize;    /* size of the svId in the ASDU buffer */
++    uint8_t datSetSize;  /* size of the datSet in the ASDU buffer */
+ 
+     uint8_t* smpCnt;
+     uint8_t* confRev;
+@@ -432,15 +436,27 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+         switch (tag)
+         {
+         case 0x80:
+-            asdu.svId = (char*) (buffer + bufPos);
+-            svIdLength = elementLength;
+-            asdu.svId[svIdLength] = 0;
++            if (elementLength > 129)
++            {
++                if (DEBUG_SV_SUBSCRIBER) printf("SV_SUBSCRIBER: svId too long!\n");
++            }
++            else
++            {
++                asdu.svId = (char*) (buffer + bufPos);
++                asdu.svIdSize = elementLength;
++            }
+             break;
+ 
+         case 0x81:
+-            asdu.datSet = (char*) (buffer + bufPos);
+-            datSetLength = elementLength;
+-            asdu.datSet[datSetLength] = 0;
++            if (elementLength > 129)
++            {
++                if (DEBUG_SV_SUBSCRIBER) printf("SV_SUBSCRIBER: datSet too long!\n");
++            }
++            else
++            {
++                asdu.datSet = (char*) (buffer + bufPos);
++                asdu.datSetSize = elementLength;
++            }
+             break;
+ 
+         case 0x82:
+@@ -479,17 +495,17 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+ 
+         bufPos += elementLength;
+     }
+-    
++
+     if (DEBUG_SV_SUBSCRIBER)
+     {
+         printf("SV_SUBSCRIBER:   SV ASDU: ----------------\n");
+         printf("SV_SUBSCRIBER:     DataLength: %d\n", asdu.dataBufferLength);
+-        printf("SV_SUBSCRIBER:     SvId: %s\n", asdu.svId ? asdu.svId : "(empty)");
++        printf("SV_SUBSCRIBER:     SvId: %s\n", SVSubscriber_ASDU_getSvId(&asdu));
+         printf("SV_SUBSCRIBER:     SmpCnt: %u\n", SVSubscriber_ASDU_getSmpCnt(&asdu));
+         printf("SV_SUBSCRIBER:     ConfRev: %u\n", SVSubscriber_ASDU_getConfRev(&asdu));
+-        
++
+         if (SVSubscriber_ASDU_hasDatSet(&asdu))
+-            printf("SV_SUBSCRIBER:     DatSet: %s\n", asdu.datSet ? asdu.datSet : "(empty)");
++            printf("SV_SUBSCRIBER:     DatSet: %s\n", SVSubscriber_ASDU_getDatSet(&asdu));
+ 
+         if (SVSubscriber_ASDU_hasRefrTm(&asdu))
+ #ifndef _MSC_VER
+@@ -899,13 +915,25 @@ SVSubscriber_ASDU_hasSmpMod(SVSubscriber_ASDU self)
+ const char*
+ SVSubscriber_ASDU_getSvId(SVSubscriber_ASDU self)
+ {
+-    return self->svId;
++    if (self->svId == NULL)
++        return NULL;
++
++    memcpy(self->svIdBuf, self->svId, self->svIdSize);
++    self->svIdBuf[self->svIdSize] = 0; /* ensure null termination */
++
++    return self->svIdBuf;
+ }
+ 
+ const char*
+ SVSubscriber_ASDU_getDatSet(SVSubscriber_ASDU self)
+ {
+-    return self->datSet;
++    if (self->datSet == NULL)
++        return NULL;
++
++    memcpy(self->datSetBuf, self->datSet, self->datSetSize);
++    self->datSetBuf[self->datSetSize] = 0; /* ensure null termination */
++
++    return self->datSetBuf;
+ }
+ 
+ static inline void
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.patch
new file mode 100644
index 0000000000..75e476c6c5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.patch
@@ -0,0 +1,115 @@
+From 03841913e3b8220f1ceb2ab5493bc31b769113bd Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Wed, 1 Jul 2026 11:32:34 +0100
+Subject: [PATCH] - SV subscriber: fixed missing length validation of some ASDU
+ elements that can cause OOB reads when these fields are later used by the
+ application (LIB61850-574)
+
+(cherry picked from commit a96bd674e0238276dd1387d31d52e55229d0771e)
+
+CVE: CVE-2026-19206
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/a96bd674e0238276dd1387d31d52e55229d0771e]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sampled_values/sv_subscriber.c | 48 +++++++++++++++++++++++++-----
+ 1 file changed, 40 insertions(+), 8 deletions(-)
+
+diff --git a/src/sampled_values/sv_subscriber.c b/src/sampled_values/sv_subscriber.c
+index 97f881f6..55422d87 100644
+--- a/src/sampled_values/sv_subscriber.c
++++ b/src/sampled_values/sv_subscriber.c
+@@ -402,6 +402,20 @@ SVReceiver_stopThreadless(SVReceiver self)
+     self->running = false;
+ }
+ 
++static void
++invalidFieldSize(const char* fieldName, int expectedSize, int actualSize)
++{
++    if (DEBUG_SV_SUBSCRIBER)
++        printf("SV_SUBSCRIBER: Invalid %s size: expected %d, got %d\n", fieldName, expectedSize, actualSize);
++}
++
++static void
++fieldTooLong(const char* fieldName, int maxSize, int actualSize)
++{
++    if (DEBUG_SV_SUBSCRIBER)
++        printf("SV_SUBSCRIBER: %s too long: max %d, got %d\n", fieldName, maxSize, actualSize);
++}
++
+ static void
+ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+ {
+@@ -438,7 +452,7 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+         case 0x80:
+             if (elementLength > 129)
+             {
+-                if (DEBUG_SV_SUBSCRIBER) printf("SV_SUBSCRIBER: svId too long!\n");
++                return fieldTooLong("svId", 129, elementLength);
+             }
+             else
+             {
+@@ -450,7 +464,7 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+         case 0x81:
+             if (elementLength > 129)
+             {
+-                if (DEBUG_SV_SUBSCRIBER) printf("SV_SUBSCRIBER: datSet too long!\n");
++                return fieldTooLong("datSet", 129, elementLength);
+             }
+             else
+             {
+@@ -460,23 +474,38 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+             break;
+ 
+         case 0x82:
+-            asdu.smpCnt = buffer + bufPos;
++            if (elementLength != 2)
++                return invalidFieldSize("SmpCnt", 2, elementLength);
++            else
++                asdu.smpCnt = buffer + bufPos;
+             break;
+ 
+         case 0x83:
+-            asdu.confRev = buffer + bufPos;
++            if (elementLength != 4)
++                return invalidFieldSize("ConfRev", 4, elementLength);
++            else
++                asdu.confRev = buffer + bufPos;
+             break;
+ 
+         case 0x84:
+-            asdu.refrTm = buffer + bufPos;
++            if (elementLength != 8)
++                return invalidFieldSize("RefrTm", 8, elementLength);
++            else
++                asdu.refrTm = buffer + bufPos;
+             break;
+ 
+         case 0x85:
+-            asdu.smpSynch = buffer + bufPos;
++            if (elementLength != 1)
++                return invalidFieldSize("SmpSynch", 1, elementLength);
++            else
++                asdu.smpSynch = buffer + bufPos;
+             break;
+ 
+         case 0x86:
+-            asdu.smpRate = buffer + bufPos;
++            if (elementLength != 2)
++                return invalidFieldSize("SmpRate", 2, elementLength);
++            else
++                asdu.smpRate = buffer + bufPos;
+             break;
+ 
+         case 0x87:
+@@ -485,7 +514,10 @@ parseASDU(SVReceiver self, SVSubscriber subscriber, uint8_t* buffer, int length)
+             break;
+ 
+         case 0x88:
+-            asdu.smpMod = buffer + bufPos;
++            if (elementLength != 1)
++                return invalidFieldSize("SmpMod", 1, elementLength);
++            else
++                asdu.smpMod = buffer + bufPos;
+             break;
+ 
+         default: /* ignore unknown tag */
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index c0e6efedd6..c0a3d1d29b 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -20,6 +20,9 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;
            file://CVE-2026-18582.patch \
            file://CVE-2026-18583.patch \
            file://CVE-2026-19108.patch \
+           file://CVE-2026-19206-1.patch \
+           file://CVE-2026-19206-2.patch \
+           file://CVE-2026-19206-3.patch \
 "
 
 

