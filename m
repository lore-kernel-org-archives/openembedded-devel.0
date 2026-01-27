Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EA2D2F01C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10164.1769518881086798465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqIfIyAm;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3338948f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518879; x=1770123679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fW0D/CYl2n2n2OSUFzf+4vxRHBbEONdmuWy6YfGnF2c=;
        b=BqIfIyAmmb7o4RsmNt7JnLVkh5lGLIk+OQZkdwf8VmXUWENSNetdST8GMZ/xDbq5SU
         v9/jh6UpNp7WZf3FNgcsGEu0cmuNA2Nm43Cu0MfaRP1Tp47LH5vfw1wjbS3NsB1TfEI+
         eHiacsyzKKMQWLujE+/edWJZOmddJCB6KKWn11v7psmsIo+kLU/3Ks+KS19Es9S0dUXK
         t868U7J9rGme5bm0//kCND+PFxatM4xe1uGYpfV5cCEgHzS5EpFb+WNnc091WIzrki0i
         9J6vojNYUBOhod3BPF/ZVDZwsqS+YEU/NdpTPYeSbVjE5PyjT6dcp87AxnkDCdQS6hc0
         JHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518879; x=1770123679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fW0D/CYl2n2n2OSUFzf+4vxRHBbEONdmuWy6YfGnF2c=;
        b=FQwzYEHpROjuiftuhUuPMUG93GThWow6SFGV6K/PeRst4HpfOfH64zDK9f+r72rIXJ
         RNUfruLaC2igroihSHSeEnPzfATtr5X7yo2woarqtNlN870Gg1E056Egn6gxpdmhMgst
         GvhDInz5N/bmPFfzFqtDDEMKg83zjFJNB0jecekixMw0o+K21S9VPG377xmYA2rxTxX1
         50PP2qBQ+q8zs0K5/22jJFE+ILQ0lE/1jPKsK+ozzNE4nVt+Cbj2xYMK95RNxW6AD0Jv
         06DjMBxzJqxmTsocCV0iBHS0JN/LO117kHfBw3QdO8c5itewHFOtYZuOreVmcRUNDK47
         mz8w==
X-Gm-Message-State: AOJu0YyuWkD9fTZw0I9bxPBmdtlaFy21HcG2VWN8rOVQeip+6qiSUkL8
	fKI1/RXYTfMl6UQjRu05JIjoGIUyvJekpltE2a/y/UfBldN/rt1qhKpz3VycbQ==
X-Gm-Gg: AZuq6aIzJZk2aoc/ChEMMVtcU4z7iRiCjQI3G+4cLbreSlfSb/ToPWkNACxzbx1mo3m
	kJlCgy/PRijqv+VQR5n7KlcIJjW+4h9gN16vqvDKgvCbgCPPIKXl1bbdy/DecXR1rdSy2DxYMbv
	9IqP3FtZTQhgMccZg6BkEGIGh/QvjRcB0LAY2Tp4JVZ2SAB5QW5r7cjWLKK8Cx9RkkUTLeofGKf
	DXiYEocm51WawDnTEm9Nq4v7kn+d4Zj+oyOP1a5R6yq3RXxuVTfs7RpCe4lVVBg9MNuZ8P9J8E9
	s7xx6h4Vs/W8sInL4cVho6KIi2Tnn6I4t5Qm2y+RXGoQfK6Z0k0yAGHugEwr+qbmoTUtuBFliKu
	AbpKJpszRUL0j9LLflgj6NyMvPhbjz14upZlrBoQU/xQ4dD64kPl8Ug8606JJbhkCXo3DanR4gG
	Y2qxEDiNDq
X-Received: by 2002:a05:6000:288e:b0:432:5c34:fb22 with SMTP id ffacd0b85a97d-435dd05beb0mr2282343f8f.22.1769518879289;
        Tue, 27 Jan 2026 05:01:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 01/14] tigervnc: upgrade xorg-server component
Date: Tue, 27 Jan 2026 14:01:01 +0100
Message-ID: <20260127130116.1902238-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123941

Update xserver to the latest dot version of the used series.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 5cde7c9fb4..e3e2b6ee16 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -25,11 +25,11 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "1.20.6"
-SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
+XORG_PV ?= "1.20.14"
+SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
-SRC_URI[xorg.sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
+SRC_URI[xorg.md5sum] = "46f571adb51ebadb6981bc25d771f2b9"
+SRC_URI[xorg.sha256sum] = "5cc5b70b9be89443e2594b93656c60bd5e82cd7f01deb4ce4faf81dcf546a16b"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.

