Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8718.1792580485374918318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LMT3dh74;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so503902f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580483; x=1793185283; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XM7Zh8P4MAbpys1eblRoz7KHJUNYLa1M71088+Wi8vc=;
        b=LMT3dh74HIC5BhBHyY/tV0qMttOOZS9xmrDMQzZ8BCoW0WkeJhPlPy3XYomUVsfYNM
         a96gy3R34n9l5+lxDhjiAbYJ3Qo8RrQY7t4Eynp6j1oPEuLnk0MwjJUXZJxm+WuEqjbT
         5pkPvd9ok5ZS2sUiHWz5l3jM+jAVoDAnARSs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580483; x=1793185283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XM7Zh8P4MAbpys1eblRoz7KHJUNYLa1M71088+Wi8vc=;
        b=Y4huPO1H++rwCr8z2hO8UurixupJQ7inuxetQPcuMJjAp/N/1qpiv5LKDrUdonKMUL
         VGxm775zxH/altfHSFJJsN8K2A9FEuNmz/k3S7N+Eg7+oKZ5PKrCEL+zM91NMccOEwHw
         6JGeaHgMXQ5p1Kr3P2DIegjQNBweV3m0VM+0/ke893AUEcOsZC7gySqTpmQoV27/QzbU
         TXEv7eOngfpHxnvR0JKTwM65twjGl6yHUaxaOL2yFvSsxjAMEf223+g1v7nnhyYbxro1
         EuR/PqQWBZcxer99RKJgLWCI7AICr1iZjcm/X5KTG02/mD31AkgcVig1al8L0DzFZ8QG
         vF8Q==
X-Gm-Message-State: AFq9FYKB7PvFqcwAscf1uikpyBmP97zYNDkpiV+ahcUXVdbA0JXQ0PbD
	yM86taEpHR32V+OfvoZRG9PC1C6W2R+KnBJtKXlboP5iRjChAfUucVRDNjitWtOCR32qZ0XqU0S
	5HULu
X-Gm-Gg: AYBFou3nt2nPcbJVEY6S0rALQnZpO9Ce7fR+8w8jnfgkxqbYUQlGkJMIOIz2uH0dXML
	90FVcXN7Fot9lUaBS1gYd1vlR9MjxyY2wpS/pWQI3b4eokFgaQEsObg/K6I3MMIGRpZTqYhhZl2
	/DtvY1qtpqNuxAcEC+bqCGuAXC/T6d8E1ZTTmG8HLGcZIR+O68aCvMFY+MXgRihjh8X2ESU2Usd
	GoTOkFHS35HAChAvtvmUEXJxy/Y5WhmUcXn8+WgY4wvW5f+MWM07kh66ashjKR+DCgCFI9Qpb4c
	JMlTD32iWlhtm+9dC5fOFBAn3ruByg8b5cGwuZSeQwSqYFcske+qk1i7swHzq2BLLlb3PMHz37Z
	4KlTDWuSF5/NQ/jdi5IAr0bEddtndGtOCS1cMK2P+Y+hxmeG3ZDIcnXzMt3HIXE5S6ln9LOwQ/h
	5ViFyxog833Bukq+EViWKZCUjjvDLtKM2/6DUtMGnhLt2pFPTl1GB32heVI/ojJXVVT9Dzzz1s1
	kZe7APN9IEPTPA4SjjHRm/auadtA4jfhIOm6hj55fnoN5aw1nDv4yFv7CN9aSdG/z/TIxgIG9C4
	yOnS1QvIammFD6BmGiZnDLEv6NQaiikv4jZ2HLkReS9S4ukfv4VCHG1h+pc5X3c9DYq5bKG2ZpD
	IVcu9
X-Received: by 2002:a05:6000:1867:b0:48e:1399:a13 with SMTP id ffacd0b85a97d-48e264a1d00mr3618350f8f.9.1792580482047;
        Wed, 21 Oct 2026 04:01:22 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/36] python3-gevent: Upgrade 26.8.0 -> 26.9.0
Date: Wed, 21 Oct 2026 14:00:32 +0300
Message-ID: <20261021110103.1943456-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131267
Content-Type: text/plain; charset="utf-8"

Upgrade to release 26.9.0:

- Fix gevent.event.AsyncResult re-raising an exception with a
  traceback that kept growing by the frames of every previous get()
  call, instead of starting fresh from the traceback captured when
  set_exception() was called.
- Make gevent's file objects properly report the full mode string.
  Previously a ‘b’ or ‘t’ suffix could be missing.
- ThreadPool workers no longer call the profile and trace setters
  when no hooks are configured. This matches threading.Thread and
  avoids unnecessary PEP 578 audit events and thread coordination.
- An exception while preparing a ThreadPool worker to run a task,
  such as an audit hook rejecting sys.setprofile(), no longer
  leaves the caller blocked or leaks a pool slot. The exception is
  raised in the greenlet waiting on apply() or spawn(), and the
  failed worker is replaced if other tasks are waiting.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-_setuputils.py-Do-not-add-sys_inc_dir.patch          | 4 ++--
 .../{python3-gevent_26.8.0.bb => python3-gevent_26.9.0.bb}    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_26.8.0.bb => python3-gevent_26.9.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
index 68ef5d6d9a..02dd01a33f 100644
--- a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
+++ b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
@@ -1,4 +1,4 @@
-From 21b8f74c3d0006c80549452743d50e6f012aa7ef Mon Sep 17 00:00:00 2001
+From f3d1cf5b05decc4554676dcba5eb831cd404729b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Oct 2022 17:37:01 -0700
 Subject: [PATCH] _setuputils.py: Do not add sys_inc_dir
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/_setuputils.py b/_setuputils.py
-index 4c25e00..23fdfe1 100644
+index 652ebc8..53980e5 100644
 --- a/_setuputils.py
 +++ b/_setuputils.py
 @@ -164,7 +164,6 @@ def get_include_dirs(*extra_paths):
diff --git a/meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb b/meta-python/recipes-devtools/python/python3-gevent_26.9.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_26.9.0.bb
index 3207dc351b..c7b1a7bf3d 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_26.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.9.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "96039f41bbde6dcd72559e5ffbd408a04f46774b47d991d4cf032da8fa79e5a0"
+SRC_URI[sha256sum] = "4dd4703d71737a456c1c9df5cd43a82934e5b10c87549caa02495f487d1ef0b1"
 
 CVE_PRODUCT = "gevent"
 
-- 
2.47.3

