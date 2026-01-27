Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DEFD2F01B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10492.1769518893043810735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIH0ZDMY;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d2670932so5177310f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518891; x=1770123691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ApeJWrwTBNQK9E7IMXT0hPS2Cl1WmGJ70dQ6DWpmCg=;
        b=jIH0ZDMYnCw6sD5cloqg1d44Kw98aEU+BTdmHcNEwpnMQuvClBJqK7NjljHWd+k+Ie
         KWwKGhRNcG7zVidVlPxUeom5H+SaJNeaAKicLlx8ovK2yVKGbjlYnEligZfmmn5nmgr4
         jUpfTWhSEr7fSF6zbjZhcWWR7wbQbEtHljxnhCn4VPGKnZI2HaZL67uIU+Zfx45/c36T
         q2JRibFqt2lIyYfEKeGBVK9FiLaKMskPi2HTmUgtgXM5+0fdgsjjjYbuKwCQ0lpY2ZH7
         ga3QW4jafYC7VBbq7863GO8Pq3ND0xB9tFTgDFGfjvuZanUh9wJCqqEUxjsCBtWNmu3P
         hsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518891; x=1770123691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ApeJWrwTBNQK9E7IMXT0hPS2Cl1WmGJ70dQ6DWpmCg=;
        b=pRCPv5h2feID9gI+EtCrDIeb8Ow8UzmPSIFvEACqnQovBh9+73WxlqQlOFrUM9FD3N
         QmOKIlBh8/IvVpXdqwByFF2tmhDJH25wuC7+psf4Su/UoxgWpTDpUaHTOkyO+QHne7zD
         /+6gMCHwLn6JXclx5SumLyjenGu2cfFqu5G9FFxv1vkcAutsDGWgbQk62ASpTkJbJagJ
         Y0Hb4XhTzufTqEIHhlmkIS95rxW1vDYN6Cid4nJQnio8UXGzUQBp8/ctJlmmBngaYQ8G
         U4zpSGvxcnBTA9U8BXHCR3afkq9rajfOwepm00XJzx3RLb+8BimiWbzOZv419Nxuo6Cc
         u8kg==
X-Gm-Message-State: AOJu0Yx6AwP6+GmBohglAlMt7May5mQ/6LJoSiyA0PkDa1+lsyx6O/RU
	l9Ifo1ehZRcv/RKsQpC1NcJiooNZRsnSGvB0OxNagM8/slUR3giP45Qe6xX4TA==
X-Gm-Gg: AZuq6aJ+nknWc/5yUP/oqv1Lo/bdMx0ctgxvEpyI/EW94fori0AGGQAN1psoLcv5+D6
	l8VUpZ4ppcJTdEAX3AZvbo63g4B2LtIa6xZB4TZMeSp6c93vaLlRNJ2HjIdJXrnqtpvYM+aMMRa
	/O87ow2/sYceD+rhDOZA9pJaAmP6B8lRXn3Od2MjkhO8vkBecqY0ghz5C2SEAG0wIwpPU1xqne8
	AxXM4v80LGOTim0D4mCC2QNzTvUj53NY+AWIctklVv13q4Z0nsdhH7Zhg83/LfM9EIKL7N1vqBC
	x0d6oFsYMC9kI8yMTkObxuTraEI+QPG9N4wNMOE1IFy34YLsNTqLfWbr9cOOJTDMq5S94+F7txe
	RMNguoQFyclUut5KVpQZEmzR4GZEQzSqolzAdci0k0k2lOc6MGGtybvD7r71IvjZgWQHHFlzunl
	8a7cr7cZl0
X-Received: by 2002:a05:6000:2310:b0:435:bbda:3f4e with SMTP id ffacd0b85a97d-435dd0b0889mr2270311f8f.31.1769518891192;
        Tue, 27 Jan 2026 05:01:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 14/14] tigervnc: patch CVE-2025-26601
Date: Tue, 27 Jan 2026 14:01:14 +0100
Message-ID: <20260127130116.1902238-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123953

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26601

Pick the patches that explicitly mention the CVE ID in their
commit messages.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26601-1.patch     |  73 ++++++++++
 .../tigervnc/files/CVE-2025-26601-2.patch     |  87 ++++++++++++
 .../tigervnc/files/CVE-2025-26601-3.patch     |  54 +++++++
 .../tigervnc/files/CVE-2025-26601-4.patch     | 134 ++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |   4 +
 5 files changed, 352 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-2.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-3.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-4.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-1.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-1.patch
new file mode 100644
index 0000000000..b55689d5a8
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-1.patch
@@ -0,0 +1,73 @@
+From cdbf898b00c53929b6c262f2f089317a67743bc2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 20 Jan 2025 16:52:01 +0100
+Subject: [PATCH 1/4] sync: Do not let sync objects uninitialized
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+When changing an alarm, the change mask values are evaluated one after
+the other, changing the trigger values as requested and eventually,
+SyncInitTrigger() is called.
+
+SyncInitTrigger() will evaluate the XSyncCACounter first and may free
+the existing sync object.
+
+Other changes are then evaluated and may trigger an error and an early
+return, not adding the new sync object.
+
+This can be used to cause a use after free when the alarm eventually
+triggers.
+
+To avoid the issue, delete the existing sync object as late as possible
+only once we are sure that no further error will cause an early exit.
+
+CVE-2025-26601, ZDI-CAN-25870
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 16a1242d0ffc7f45ed3c595ee7564b5c04287e0b)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit e708ad021753d603580d314c48b93d3adf459c5f)
+
+CVE: CVE-2025-26601
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/e708ad021753d603580d314c48b93d3adf459c5f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xext/sync.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index fd2ceb042..e55295904 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -329,11 +329,6 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+             client->errorValue = syncObject;
+             return rc;
+         }
+-        if (pSync != pTrigger->pSync) { /* new counter for trigger */
+-            SyncDeleteTriggerFromSyncObject(pTrigger);
+-            pTrigger->pSync = pSync;
+-            newSyncObject = TRUE;
+-        }
+     }
+ 
+     /* if system counter, ask it what the current value is */
+@@ -401,6 +396,14 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
++    if (changes & XSyncCACounter) {
++        if (pSync != pTrigger->pSync) { /* new counter for trigger */
++            SyncDeleteTriggerFromSyncObject(pTrigger);
++            pTrigger->pSync = pSync;
++            newSyncObject = TRUE;
++        }
++    }
++
+     /*  we wait until we're sure there are no errors before registering
+      *  a new counter on a trigger
+      */
diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-2.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-2.patch
new file mode 100644
index 0000000000..fcf75cb2c6
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-2.patch
@@ -0,0 +1,87 @@
+From cf6bdfc924b9891fc4095876161e5140667235c3 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 20 Jan 2025 16:54:30 +0100
+Subject: [PATCH 2/4] sync: Check values before applying changes
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+In SyncInitTrigger(), we would set the CheckTrigger function before
+validating the counter value.
+
+As a result, if the counter value overflowed, we would leave the
+function SyncInitTrigger() with the CheckTrigger applied but without
+updating the trigger object.
+
+To avoid that issue, move the portion of code checking for the trigger
+check value before updating the CheckTrigger function.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit f52cea2f93a0c891494eb3334894442a92368030)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 330b4068212c02548b53d19c0078ddc75c36a724)
+
+CVE: CVE-2025-26601
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/330b4068212c02548b53d19c0078ddc75c36a724]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xext/sync.c | 36 ++++++++++++++++++------------------
+ 1 file changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index e55295904..66a52283d 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -350,6 +350,24 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
++    if (changes & (XSyncCAValueType | XSyncCAValue)) {
++        if (pTrigger->value_type == XSyncAbsolute)
++            pTrigger->test_value = pTrigger->wait_value;
++        else {                  /* relative */
++            Bool overflow;
++
++            if (pCounter == NULL)
++                return BadMatch;
++
++            overflow = checked_int64_add(&pTrigger->test_value,
++                                         pCounter->value, pTrigger->wait_value);
++            if (overflow) {
++                client->errorValue = pTrigger->wait_value >> 32;
++                return BadValue;
++            }
++        }
++    }
++
+     if (changes & XSyncCATestType) {
+ 
+         if (pSync && SYNC_FENCE == pSync->type) {
+@@ -378,24 +396,6 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+         }
+     }
+ 
+-    if (changes & (XSyncCAValueType | XSyncCAValue)) {
+-        if (pTrigger->value_type == XSyncAbsolute)
+-            pTrigger->test_value = pTrigger->wait_value;
+-        else {                  /* relative */
+-            Bool overflow;
+-
+-            if (pCounter == NULL)
+-                return BadMatch;
+-
+-            overflow = checked_int64_add(&pTrigger->test_value,
+-                                         pCounter->value, pTrigger->wait_value);
+-            if (overflow) {
+-                client->errorValue = pTrigger->wait_value >> 32;
+-                return BadValue;
+-            }
+-        }
+-    }
+-
+     if (changes & XSyncCACounter) {
+         if (pSync != pTrigger->pSync) { /* new counter for trigger */
+             SyncDeleteTriggerFromSyncObject(pTrigger);
diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-3.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-3.patch
new file mode 100644
index 0000000000..2cfc0388ab
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-3.patch
@@ -0,0 +1,54 @@
+From 9350505d96d74f8960e842c1950e85e5b4e889ee Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 20 Jan 2025 17:06:07 +0100
+Subject: [PATCH 3/4] sync: Do not fail SyncAddTriggerToSyncObject()
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+We do not want to return a failure at the very last step in
+SyncInitTrigger() after having all changes applied.
+
+SyncAddTriggerToSyncObject() must not fail on memory allocation, if the
+allocation of the SyncTriggerList fails, trigger a FatalError() instead.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 8cbc90c8817306af75a60f494ec9dbb1061e50db)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 043a4e959b8590ff37b72cd3440328ec3e39699f)
+
+CVE: CVE-2025-26601
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/043a4e959b8590ff37b72cd3440328ec3e39699f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xext/sync.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index 66a52283d..8def4adbf 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -199,8 +199,8 @@ SyncAddTriggerToSyncObject(SyncTrigger * pTrigger)
+             return Success;
+     }
+ 
+-    if (!(pCur = malloc(sizeof(SyncTriggerList))))
+-        return BadAlloc;
++    /* Failure is not an option, it's succeed or burst! */
++    pCur = XNFalloc(sizeof(SyncTriggerList));
+ 
+     pCur->pTrigger = pTrigger;
+     pCur->next = pTrigger->pSync->pTriglist;
+@@ -408,8 +408,7 @@ SyncInitTrigger(ClientPtr client, SyncTrigger * pTrigger, XID syncObject,
+      *  a new counter on a trigger
+      */
+     if (newSyncObject) {
+-        if ((rc = SyncAddTriggerToSyncObject(pTrigger)) != Success)
+-            return rc;
++        SyncAddTriggerToSyncObject(pTrigger);
+     }
+     else if (pCounter && IsSystemCounter(pCounter)) {
+         SyncComputeBracketValues(pCounter);
diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-4.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-4.patch
new file mode 100644
index 0000000000..79766000bd
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-4.patch
@@ -0,0 +1,134 @@
+From f66811bfc42942f5acde2ec3dca63aa49effd066 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 20 Jan 2025 17:10:31 +0100
+Subject: [PATCH 4/4] sync: Apply changes last in SyncChangeAlarmAttributes()
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+SyncChangeAlarmAttributes() would apply the various changes while
+checking for errors.
+
+If one of the changes triggers an error, the changes for the trigger,
+counter or delta value would remain, possibly leading to inconsistent
+changes.
+
+Postpone the actual changes until we're sure nothing else can go wrong.
+
+Related to CVE-2025-26601, ZDI-CAN-25870
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit c285798984c6bb99e454a33772cde23d394d3dcd)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit a2c0f84c1cd0c92918f08f83f562c2e324cd4cbb)
+
+CVE: CVE-2025-26601
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/a2c0f84c1cd0c92918f08f83f562c2e324cd4cbb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xext/sync.c | 42 +++++++++++++++++++++++++++---------------
+ 1 file changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/Xext/sync.c b/Xext/sync.c
+index 8def4adbf..e2f2c2774 100644
+--- a/Xext/sync.c
++++ b/Xext/sync.c
+@@ -799,8 +799,14 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+     int status;
+     XSyncCounter counter;
+     Mask origmask = mask;
++    SyncTrigger trigger;
++    Bool select_events_changed = FALSE;
++    Bool select_events_value = FALSE;
++    int64_t delta;
+ 
+-    counter = pAlarm->trigger.pSync ? pAlarm->trigger.pSync->id : None;
++    trigger = pAlarm->trigger;
++    delta = pAlarm->delta;
++    counter = trigger.pSync ? trigger.pSync->id : None;
+ 
+     while (mask) {
+         int index2 = lowbit(mask);
+@@ -816,24 +822,24 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+         case XSyncCAValueType:
+             mask &= ~XSyncCAValueType;
+             /* sanity check in SyncInitTrigger */
+-            pAlarm->trigger.value_type = *values++;
++            trigger.value_type = *values++;
+             break;
+ 
+         case XSyncCAValue:
+             mask &= ~XSyncCAValue;
+-            pAlarm->trigger.wait_value = ((int64_t)values[0] << 32) | values[1];
++            trigger.wait_value = ((int64_t)values[0] << 32) | values[1];
+             values += 2;
+             break;
+ 
+         case XSyncCATestType:
+             mask &= ~XSyncCATestType;
+             /* sanity check in SyncInitTrigger */
+-            pAlarm->trigger.test_type = *values++;
++            trigger.test_type = *values++;
+             break;
+ 
+         case XSyncCADelta:
+             mask &= ~XSyncCADelta;
+-            pAlarm->delta = ((int64_t)values[0] << 32) | values[1];
++            delta = ((int64_t)values[0] << 32) | values[1];
+             values += 2;
+             break;
+ 
+@@ -843,10 +849,8 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+                 client->errorValue = *values;
+                 return BadValue;
+             }
+-            status = SyncEventSelectForAlarm(pAlarm, client,
+-                                             (Bool) (*values++));
+-            if (status != Success)
+-                return status;
++            select_events_value = (Bool) (*values++);
++            select_events_changed = TRUE;
+             break;
+ 
+         default:
+@@ -855,25 +859,33 @@ SyncChangeAlarmAttributes(ClientPtr client, SyncAlarm * pAlarm, Mask mask,
+         }
+     }
+ 
++    if (select_events_changed) {
++        status = SyncEventSelectForAlarm(pAlarm, client, select_events_value);
++        if (status != Success)
++            return status;
++    }
++
+     /* "If the test-type is PositiveComparison or PositiveTransition
+      *  and delta is less than zero, or if the test-type is
+      *  NegativeComparison or NegativeTransition and delta is
+      *  greater than zero, a Match error is generated."
+      */
+     if (origmask & (XSyncCADelta | XSyncCATestType)) {
+-        if ((((pAlarm->trigger.test_type == XSyncPositiveComparison) ||
+-              (pAlarm->trigger.test_type == XSyncPositiveTransition))
+-             && pAlarm->delta < 0)
++        if ((((trigger.test_type == XSyncPositiveComparison) ||
++              (trigger.test_type == XSyncPositiveTransition))
++             && delta < 0)
+             ||
+-            (((pAlarm->trigger.test_type == XSyncNegativeComparison) ||
+-              (pAlarm->trigger.test_type == XSyncNegativeTransition))
+-             && pAlarm->delta > 0)
++            (((trigger.test_type == XSyncNegativeComparison) ||
++              (trigger.test_type == XSyncNegativeTransition))
++             && delta > 0)
+             ) {
+             return BadMatch;
+         }
+     }
+ 
+     /* postpone this until now, when we're sure nothing else can go wrong */
++    pAlarm->delta = delta;
++    pAlarm->trigger = trigger;
+     if ((status = SyncInitTrigger(client, &pAlarm->trigger, counter, RTCounter,
+                                   origmask & XSyncCAAllTrigger)) != Success)
+         return status;
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index f8f53c4c91..0b54720947 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -34,6 +34,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26599-1.patch;patchdir=${XORG_S} \
            file://CVE-2025-26599-2.patch;patchdir=${XORG_S} \
            file://CVE-2025-26600.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26601-1.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26601-2.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26601-3.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26601-4.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

