Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14296.1795013547800281127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OHFb6m0y;
 spf=pass (domain: snapchat.com, ip: 209.85.128.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12862135e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 06:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1795013546; x=1795618346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Sen5+Ak9GwHHOZKxdp3j5afrHdsDbSAoQ3VrVIRCAU=;
        b=OHFb6m0yXg9NYM0iIeVex//aSbW+40j7od9v9JD/vA8wn6ZSN97JreIK+ELGOKsgYD
         Ei7yo9x3zIvJIz5PBeSwZGh02HSbTd0AKZRAB+6dfYl8IQPOxyLGAL6wmKjSQ5I+zlDt
         3iT/Ius8kofPiCCSVHff8k6Z93IwB8bYDNNac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013546; x=1795618346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Sen5+Ak9GwHHOZKxdp3j5afrHdsDbSAoQ3VrVIRCAU=;
        b=spmdPZS2aOyFAclU/wCgLlf2zNqPdIdlef0CuVb62+JsQdPCTssQggVwJsDErjkh7M
         w7YJn56j8ngAxJOGjIfa8ji4OyZbYbtLWjJH6KIEh2lkKNhvzJfxxiY42j0us4FYbAt/
         iJr/Jla9GUi0r9Gnx9tZyK3c5OVp7RPSuP4JSXl2pHdrdrgXRvzdTrCHmMCS3XEano0u
         ciqzr379q4bLaWEZhwvivkDtVo5nLia6ipJOl0e9GAA0FUwq5ioBncGHC4TPRgb9mI4w
         vDXds8+jM+VGo2dKDOwXc05GoDG3U/yxwFrwW+6qq5x8RcmZYjY//tGvvUXjkD6cINRV
         gOfg==
X-Gm-Message-State: APuU4Z+PliK7pfcgz6Au768bm545o1Bh3oAhKzsHsXe2EWNS3jjpOKPC
	6fHk6wYIT9fcLZIIXNkV0cE6gpgKWIH+/DLQFyx/Qx6bN9GRe3zu+UuLyqMwBvpEI1NHQLp4W8N
	dBayxQUw=
X-Gm-Gg: AYBFou3VfGxVqeyuTk5ZZ48uKtI6GJerB0mfEy2rm9cAgl1+k65b2tiCCstFj7RoDr6
	NpC+NcRe3DrhyWhkxRzkiMVeU8eEvdZfdVdioCZlC5yqD39N2PKRy9SRJwnLPfeDU9c7ygOcwNL
	xI1GrQmkVS6mkyUvAL/1F56vGEQ3Hh70GZNr5gYRWrLnEuJplFQVyX62p/duS1XNVHANZHPLaDY
	BKR9oxWXCiK1xT0Fl/FaQBnsWLldvsHgqGsiMaO3DenhGXMtViY9iYVkthlG8lBbKK1vaGwRu+n
	vIupCOOGh5nqJSbe7zfG6wiWcf0ZjQj2ALPeNtq5aT9dLR2Kz7qO49jljrOm41rYQfjPnAS1agR
	iR7DUd/Yt950AGfbTDEUGMc71uAlzMjaTfSKVMmNZlu1BNjhRqxBA4ax/1zkETQ3Z7kDFWzLAeQ
	EuXh3CM9hX9BU7ejq3g3G5zonCDlPDbvePrm04uoSbyjTj4rw/eqv7WZCCTUUy63zPtgZofxDEg
	9c+XRvmI8F8znuzjSwdqPnAIPFthYe34gVNfagvJTFV+ldGGb+zDkflOnynTWZCj6fZ+8hZ66Dk
	kXHU9kVKbacyCf4fh2w8R+ZAin/ExI6ScYMXdc+fVcA91cZcbgMs1J3ZlkMET2ABBhkYoIQnyPK
	ujIPSexAcccL05n7CxO67etha7zbciJ/5Ig==
X-Received: by 2002:a05:600c:83cf:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb7d6cd41amr52346865e9.4.1795013545763;
        Wed, 18 Nov 2026 06:52:25 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm130346255e9.2.2026.11.18.06.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:52:25 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] android-tools: drop android-gadget-setup call from android-tools-adbd.service
Date: Wed, 18 Nov 2026 15:52:03 +0100
Message-ID: <20261118145203.2577227-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 14:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132655
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

The unit calls "/usr/bin/android-gadget-setup adb" from ExecStartPre,
prefixed with "-" so that a failure is ignored. The android-gadget-setup in
this layer does not read its arguments, so "adb" has no effect. That adb parameter
is historical: it is used in meta-smartphone which is where the meta-oe
android-tools recipe was imported from.

The call made sense while there were two android-tools-conf
implementations. The sysfs-based one installed only android-gadget-setup,
so the unit was what ran it. The configfs-based one ships its own drop-in,
10-adbd-configfs.conf, which runs android-gadget-setup, android-gadget-start
and android-gadget-cleanup. Commit 55cc6751e426 ("android-tools-conf:
replace sysfs implementation with configfs") removed the sysfs
implementation. Since then android-gadget-setup runs twice on every start,
and the second run first tears down the gadget created by the first one.
The unit also refers to a file that is not installed when android-tools-conf
is not.

Remove the call from the unit and leave the gadget setup to the drop-in.
Layers that replace android-gadget-setup and remove the drop-in, such as
meta-android in meta-smartphone, whose script takes the USB function list as
argument, need to run it from their own drop-in ( see https://github.com/shr-distribution/meta-smartphone/pull/204 ).

AI-Generated: Uses Claude Code
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../android-tools/android-tools/android-tools-adbd.service       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
index 7c16b5cea2..f8c8bc7f33 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -6,7 +6,6 @@ Before=android-system.service
 [Service]
 Type=notify
 Restart=on-failure
-ExecStartPre=-/usr/bin/android-gadget-setup adb
 ExecStart=/usr/bin/adbd
 
 [Install]
-- 
2.43.0

