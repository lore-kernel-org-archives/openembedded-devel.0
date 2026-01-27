Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC1DD2F00B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10167.1769518882791228738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LRj8fjvC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432755545fcso4222776f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518881; x=1770123681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/x0VxxHRrNZYjDI/hyMisGgYvG7tCXXV60jup7dyl0=;
        b=LRj8fjvCiT6ylXCsehBiVQVfL5kSkCm7ACkjYWEpzI3CK4JARG9ziEKbdjKK7YnCAc
         Iw/1040bExnZQK13qSya4JrTjRzSyzHQjyXXfA+j1NL7jpQw8kzLWThOcNFuxpBTmpBx
         1VbVNKAwDvVm9AT/EwCBMVE/M5U9/l8M95cyWn0s3zxA/3/B6WU+C9VXGnqZWVcQeuo0
         Ztk0OG4ibmdJThpvnY+iwFCc5qxj3T33YTDxUquo8BwIldXTkOzNvH/ZJFUBix4ZuMGY
         yYqiYVAELMv16dfyJyyO3tfZc2TimnKkx9iiyzvMoHc6pdZ+4ePq7Zs+GmBObPVWPKUJ
         jXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518881; x=1770123681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/x0VxxHRrNZYjDI/hyMisGgYvG7tCXXV60jup7dyl0=;
        b=IsamEqArgxuQFxU129y50qfcfVOosbupOAlwqicEtVli3p+Ma1MNRqPWovweg81BZI
         u8OhsSNKuGXISUl5H2kGtF852pjeczFIMQ0s7PFp2L7bWVEOlisFXkj0PZDOSIJu2q1Q
         lg9Nc4ahTwV7Q5wzD7TRiaRKZynW6zn+w5tggfRaB0KFI7naBB2b36PeuYEI3aGCB5QY
         NEb0AxjzrpG/9Z0naeSWXPsdnTvwDoOU6htKYVb6LJoxliq5tGZTZjq1nGIZW4FR9fAx
         X57AGJ/prEUVano8ew88DZ+mMto3PDS2RwBaqznZq+rQqEqOjreph6Zh4ypxQKGEbuIE
         jbyg==
X-Gm-Message-State: AOJu0Yy6/ts4OHk5UotIm/M9ZtgXQO9Dy8PD4hlrse55pyXubFUZMEuq
	Xl17UA8OC8pC7Y0a8y02COSGb+IFFOexCOC6XmrWHz1mf9SvYBvv+2UIh3ne4g==
X-Gm-Gg: AZuq6aIX5OVSIAI36Lnu4TLAzENFu1X+E4oK5hXI0F/BwP9b400aVvDZ6bPIazXyUq+
	x1vWBeGIyw7cQDBX+vo9BWV504O1VhrpHz0JeL9xOtQ+yTDKA96zHwyOIQ7y89J8gVPLnoPpEGj
	mIe0Rf0t/OmbVPnTIyfv7whyy38njaw4Un3qC5+rIFcVxiGxwVgdRFzG1A+2v47S0CiVRByeYg6
	tjYfvoVWLIMKh7C9WKToy3f8BR7s5lAi4gUucE9yITYYtV6qbvLYgjNoEpStOv5Go2nqixIvC9s
	q2+5GS0SDakMMvUiKexBuB0ua4K1L0u4BHX91TTrn6A7O/xwrtA6h2/4SbZ6ZruqI6rs/E0SB9v
	WqaQWOwptL73lcnSwBauIzy1nZG1zR6mUmhcfv2PEi6wTZBwpgTZtrmHkTzgMkN2Wjfd/4f0Thh
	firtGbIgrL
X-Received: by 2002:a05:6000:4023:b0:435:b728:c979 with SMTP id ffacd0b85a97d-435dd02da5bmr2100935f8f.8.1769518880982;
        Tue, 27 Jan 2026 05:01:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 03/14] tigervnc: patch CVE-2023-6377
Date: Tue, 27 Jan 2026 14:01:03 +0100
Message-ID: <20260127130116.1902238-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123943

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6377

Pick the backported version of the patch that is referenced by the
NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2023-6377.patch        | 80 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6377.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6377.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6377.patch
new file mode 100644
index 0000000000..d6dde0a9d2
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6377.patch
@@ -0,0 +1,80 @@
+From 7eb0da0f29e975f67a5bef4560759672b84c7d22 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 28 Nov 2023 15:19:04 +1000
+Subject: [PATCH] Xi: allocate enough XkbActions for our buttons
+
+From: Peter Hutterer <peter.hutterer@who-t.net>
+
+button->xkb_acts is supposed to be an array sufficiently large for all
+our buttons, not just a single XkbActions struct. Allocating
+insufficient memory here means when we memcpy() later in
+XkbSetDeviceInfo we write into memory that wasn't ours to begin with,
+leading to the usual security ooopsiedaisies.
+
+CVE-2023-6377, ZDI-CAN-22412, ZDI-CAN-22413
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+(cherry picked from commit 0c1a93d319558fe3ab2d94f51d174b4f93810afd)
+
+CVE: CVE-2023-6377
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xi/exevents.c | 12 ++++++------
+ dix/devices.c | 10 ++++++++++
+ 2 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/Xi/exevents.c b/Xi/exevents.c
+index 659816a46..fb6db8561 100644
+--- a/Xi/exevents.c
++++ b/Xi/exevents.c
+@@ -567,13 +567,13 @@ DeepCopyPointerClasses(DeviceIntPtr from, DeviceIntPtr to)
+         }
+ 
+         if (from->button->xkb_acts) {
+-            if (!to->button->xkb_acts) {
+-                to->button->xkb_acts = calloc(1, sizeof(XkbAction));
+-                if (!to->button->xkb_acts)
+-                    FatalError("[Xi] not enough memory for xkb_acts.\n");
+-            }
++            size_t maxbuttons = max(to->button->numButtons, from->button->numButtons);
++            to->button->xkb_acts = xnfreallocarray(to->button->xkb_acts,
++                                                   maxbuttons,
++                                                   sizeof(XkbAction));
++            memset(to->button->xkb_acts, 0, maxbuttons * sizeof(XkbAction));
+             memcpy(to->button->xkb_acts, from->button->xkb_acts,
+-                   sizeof(XkbAction));
++                   from->button->numButtons * sizeof(XkbAction));
+         }
+         else
+             free(to->button->xkb_acts);
+diff --git a/dix/devices.c b/dix/devices.c
+index e7c74d7b7..7776498f8 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -2502,6 +2502,8 @@ RecalculateMasterButtons(DeviceIntPtr slave)
+ 
+     if (master->button && master->button->numButtons != maxbuttons) {
+         int i;
++        int last_num_buttons = master->button->numButtons;
++
+         DeviceChangedEvent event = {
+             .header = ET_Internal,
+             .type = ET_DeviceChanged,
+@@ -2512,6 +2514,14 @@ RecalculateMasterButtons(DeviceIntPtr slave)
+         };
+ 
+         master->button->numButtons = maxbuttons;
++        if (last_num_buttons < maxbuttons) {
++            master->button->xkb_acts = xnfreallocarray(master->button->xkb_acts,
++                                                       maxbuttons,
++                                                       sizeof(XkbAction));
++            memset(&master->button->xkb_acts[last_num_buttons],
++                   0,
++                   (maxbuttons - last_num_buttons) * sizeof(XkbAction));
++        }
+ 
+         memcpy(&event.buttons.names, master->button->labels, maxbuttons *
+                sizeof(Atom));
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index fa0661dffe..7af347d858 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+           file://CVE-2023-6377.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

