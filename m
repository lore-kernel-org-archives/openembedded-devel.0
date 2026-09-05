Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B806C79F82
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 01:52:55 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.871.1788573173923372495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 18:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ls5wXs21;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d91ded8174so13228805ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 18:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788573173; x=1789177973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39OEXEHpQWuCH8EORp8l4f3V3hMujW/z196Mryu7vKo=;
        b=Ls5wXs211NtfpCco/Bnq1KE/NJZP0HarIt6fJrsiTNROCKQbblh/VIOgFIZABt0rMh
         7Ln/2Y4uS64Q0qALHowF1d+eGQco+FpUkE7e1x+KECxPsR5eIGJfa4xdMlX1ruVHpu22
         Xk7xXydFeA1ko6ljET9BE3jQVNT4c8NkOJtr4+Bw0RCJ1YjJmq7mIB+TWqWKycDYFFfJ
         MMsrvhbFNn6OE9ScOt3igTp6f4l8Gydywmyo4h8MKZP6er7dTNG0xUqaLnrpBuoY+Hli
         QG8Hx3vwXbA7zp9jXz3fpAHPW46vhUoZ7stgVyLQTVujDHIw6uJA0rpX3QNlsXFRwSnK
         2HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573173; x=1789177973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39OEXEHpQWuCH8EORp8l4f3V3hMujW/z196Mryu7vKo=;
        b=jcMVLf8LpenyZDTN5elvbDT7JdPCpLGk8GmYl6fns7Wf43C6VnM+OoZF9CUwluDLjq
         P8ec0InthLp1qhWq2jYphocyvaZM27BBqs89FRUFqK+SipSueUCe9gvjWcJF5t6wR0q9
         LfO8jCcsM0Dr0UKhsBPlwBQET5KMMLKyCdYu3/JtBT85EdQka2o0sqAjJwVbx5XmxNdJ
         De3J7Ji0pr792nYS5Axn1SyzvUJVna9xqEj48+bMwkrqV6XjeClFCplp5VGEKvv/xliL
         9T8sNyklb68kluCmhsK+Lm7s4c9J0WZhPSJRPMg6wWkxvcm/odaCH2iVv32z/RdXTzXw
         9Pow==
X-Gm-Message-State: AFuF++kKyn2FuNNC8C1yZpLeyFwUuAwhgte0gcjZnES2s5BXf+y/92xS
	cbegQv1Rt2QM6UU8Oc+tKOE3pJwpjxSQuS1VsfASAy3jUeHDKjylVtjgDDJRbQ==
X-Gm-Gg: AYBFou2V+04bZCz9sA3YIL47v/aEuiGhE8dIoXZEkYwjmogkliuXsqTDxAYJhpYg4yE
	VAFhiAhgZNdqLY7GsrpY44lSxYvv857MGrDiEj70Ix9+U4ad3bcbbbb02qM9n7qbItiZJG34e67
	zv8SssCn3r0uCNypq1M7fOYYBXNtxkzWeGTHGtfpsEHvE/IghEOPTs5LRqmjNSV1GyG53vTcdqt
	pPg5o2lIp+wwmMOAnzLxxCYJHfIeiFgvtu4elgqRcM1bUcoWlDaLZvy3NBdkH/KagzSHZ/RzLU6
	AuHtaiXCyNlJIc7oVcgROi6qvFVwfJ7D7kARuXwVFTVDr/ZHzVDUO54KruA8ovgmPUZQxLY2qSI
	7Rx8s4pfiGdc0iK/eSg19raelZ7eglZAJnpqyntK8H11BflqNoeu8cywXBDNwlYH/Ake5O9GPuc
	Cc7++8YPTUCFIgvFygo9TsDCX0QeQNwE5p597adaolpmU1rV0PH5z0kUoCnT8wkT3D9zlJeAskn
	6nA/MtiL3SbBxB9QKOmbP5OeI6szzyqbgzl02YN0iIzwhLBQunsrOEY2PBwuBnv7NpkKxCzU+4I
	hWzBus1lBzg3nC4paJbM5/FPovfBSYWkB6NzU8V2ftOIovhIV0wlQXTq+7y0M2avuaFaeJwhTCP
	p71n3AxlU2RtAXKqutd/CgMQDFKWupKZEidkuS2i0ZzZ4gI+rhF1JAcEz
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr14625529a91.16.1788573173220;
        Fri, 04 Sep 2026 18:52:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm9273446eec.27.2026.09.04.18.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:52:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] thermald: Fix build with clang 23
Date: Fri,  4 Sep 2026 18:52:49 -0700
Message-ID: <20260905015249.598172-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 01:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129773

configure.ac appends -Werror on top of -Wall unless --disable-werror is
passed, so every warning a newer compiler learns turns into a hard build
failure.

clang 23 added -Wunused-but-set-global and enabled it under -Wall. It
fires on the "static gpointer <t_n>_parent_class = NULL" that glib's
G_DEFINE_TYPE() emits, which is assigned in the generated class_intern_init
but never read unless the type chains up to a parent vfunc. PrefObject in
thd_dbus_interface.cpp never does:

  src/thd_dbus_interface.cpp:48:1: error: variable 'pref_object_parent_class'
      set but not used [-Werror,-Wunused-but-set-global]
     48 | G_DEFINE_TYPE(PrefObject, pref_object, G_TYPE_OBJECT)

Pass --disable-werror, the escape hatch upstream added for exactly this,
rather than suppressing the individual warning - gcc does not know
-Wno-unused-but-set-global. OE's own -Werror=format-security is unaffected.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
index 937e9a5705..275fbf2b41 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
@@ -29,6 +29,7 @@ do_configure:prepend () {

 EXTRA_OECONF = " \
                  --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                 --disable-werror \
                  "

 FILES:${PN} += "${datadir}/dbus-1"

