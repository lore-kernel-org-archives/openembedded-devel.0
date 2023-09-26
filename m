Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB04E7E65A
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 17:54:06 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.26401.1695750839432850338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1/3M7/o;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53406799540so5852928a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695750838; x=1696355638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHs9JvVqLf6Ms7iOAtaX+fBpw4XQTU9Q7NB2KsLNX0A=;
        b=N1/3M7/oKlpljzgdivrsfIbYk2e4avSfh/vpWEjBtKHzFrf4SBw/ZH1tA74zaSzEA5
         9SwoJtj8G282irmtcqMafFCCNcMEgkvF2ocjsJ6ywMrs72nSXl0aK6ATSdUCLTyakKa7
         VBXYAlQhs2BfLw6Dv49sFH5t7hOb+bHNnuYDj0s4ILa4/am+t9S9XCfdQYrCgwpQpoLx
         oOLwkT4QxwhxsRlEgrHAskgrS4Ldl6M4r6KwarYpt/VPOIcSrn4JMN5kUEB62ii6Twlc
         zqfsVtQxO6bpgLa9qHEym1w0BP6Lu9CdEpWiicMQrexcAxNEaU5MWqMVRNpWQcKQtqcz
         j9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695750838; x=1696355638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHs9JvVqLf6Ms7iOAtaX+fBpw4XQTU9Q7NB2KsLNX0A=;
        b=DoN+Ol11FmfnTX807HzJUK1Uypljyu//eiF1jfnjtrUpzrtCSvdXGvWg4Rr/8IcsMH
         LJ6JbNkyoGPg4fLZkbblqYhqAAATRwLe3XPUZ8J4/D9xjrL0D8IjC6I6fh9E4R7WiKpf
         eB6I6/ybXQlW+EhHEUExvf9SZLYMIFF3K0lJWCzL7rUEMMyiaMoe8+kPJknt7qKKoe3i
         Y5p8Ay+Oab+4J+yM0wKUhyZUyrxsd+2jpEJJ6L41LPA6B9rR4I3CTqizR9dg1h0yYZ5Q
         kt8nxaAC51yFf814+S7P3GHvyJiPI33DoCqvdekbsgCEOT9HwU13zp9+ZO+Ts4UrFRvp
         ZUQw==
X-Gm-Message-State: AOJu0Yw63lTcNj/828gVjvw5Zc36IXmEHGs7lia3PlO/XvjAPF1thZ96
	yPJEiWpmUxpV+S7MlNFHeoXdraC/skc=
X-Google-Smtp-Source: AGHT+IFnYy5G0i9ICWinYLXK0ShvZtzaxA3E31DgXUCaDrHlXMesZuVPs/S/szUvcKSxMP0IB0xw4w==
X-Received: by 2002:aa7:d44e:0:b0:52b:d169:b374 with SMTP id q14-20020aa7d44e000000b0052bd169b374mr9201752edr.3.1695750837645;
        Tue, 26 Sep 2023 10:53:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s3-20020aa7d783000000b0053116e45317sm7019701edq.44.2023.09.26.10.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 10:53:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gupnp: fix build with meson-1.2.0
Date: Tue, 26 Sep 2023 19:53:54 +0200
Message-ID: <20230926175354.2297242-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 17:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105145

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...roperly-spell-provide-in-.wrap-files.patch | 25 +++++++++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.4.1.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.patch
new file mode 100644
index 0000000000..66f07094c5
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.patch
@@ -0,0 +1,25 @@
+From 7a4515a356a3d5eb2af1f602c77a42a544e71efa Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Sun, 9 Jul 2023 03:30:47 +0000
+Subject: [PATCH] build: properly spell [provide] in *.wrap files
+
+meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[provide]"?
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29323cbb8fbd36bc69d08097a2ae2cd1]
+---
+ subprojects/gssdp-1.2.wrap | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
+index 469c75d..466b83b 100644
+--- a/subprojects/gssdp-1.2.wrap
++++ b/subprojects/gssdp-1.2.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gssdp.git
+ revision = gssdp-1.4
+ depth = 1
+  
+-[provides]
++[provide]
+ dependency_name = gssdp-1.2
+ 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
index c21e7a05bf..efeb66f28f 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
@@ -9,6 +9,7 @@ inherit meson pkgconfig vala gobject-introspection
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz \
     file://0001-all-Drop-xmlRecoverMemory.patch \
+    file://0001-build-properly-spell-provide-in-.wrap-files.patch \
 "
 SRC_URI[sha256sum] = "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c"
 
-- 
2.42.0


