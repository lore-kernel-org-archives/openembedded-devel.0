Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BE2C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.3056.1716315039586746913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZcl2k9h;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso3613355ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315039; x=1716919839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHRUHvIl2jL7NBJ/3Z/wNbfH4ya6PdwLEKK9YlB7KJ4=;
        b=fZcl2k9h64GX4xLVuwAXdmlQ7w00vJyMHLAdq8NVm5sQ9yCPSCxyfzuy0htpPJpsLG
         udG9KSHzF+adtLPfHyyXgtQUv69Cibh9SQnE9iC2UIn30Si42YM5O50fDM9nmOvWolT4
         W8fePGiE64BZD/GnSBZEtMO87NRjcjfXKaXKRkM2mqGvFYTh1b5W5FCyw8uhXP05Yu2H
         qkBkxwHp4WMcw+Uj6FgCNDDWPw53iiwSA6ArfFBLj10u2rotZs/IEI8EA5dOa0K3J/SY
         RY3u+kGN+Bu5CEpbNwyIqjhkcofp6gPuCYJocIx5fGTQ98TU/Sd9PfQZHrcQPri2eivE
         kQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315039; x=1716919839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHRUHvIl2jL7NBJ/3Z/wNbfH4ya6PdwLEKK9YlB7KJ4=;
        b=cQzvVp9fUxCp3LzBn4PrWl5cibWCexW3xbJ2WYh5fRUHKAREJJg6PJff6tgzKhlrqs
         fmiqCBbO35VMPR3UWCSMzdm3oo3Fw+Vh2lWhnaqFEFTCi3BGGXGY2iIWd2LVh1njEu7I
         2NlLH9GVTDJJ3fM/cAcH+WIVxlCfyQ2mc7D44meFwqxA38QRDY9O8pnvsIjgZ5p0K4Nu
         LfVCpCmaaTXEXbiW6YVlutWZRcxxb8J1Wl7XOSIgP7H7kWtwa+4+svF0sLSnwrAlOCQM
         EzWU/YXK0MC5RpgPTMU0XqZoVmzH0wh2/s0X1D2p4YrAGsJngN0V2Jg040ateQZ0PGJF
         VW7w==
X-Gm-Message-State: AOJu0Yyx8dn5rFTTRdaVeMFnP0WMUagcCmCAOoosWhd9oDJhh66dgpuM
	qOYH45g+pqQJXCzLN5DJG5myZqMkJ4j9VLnjW56ddYITmKCHk0Y95JH6ZGsqAXg=
X-Google-Smtp-Source: AGHT+IHGy1f9Iamf8IkEUPpywgjMn93hc66PNggjz6ijzOyLzisYFRGkw/WbmrmDJZ8/pDDLJCy8GA==
X-Received: by 2002:a17:903:244d:b0:1f3:a5b:9705 with SMTP id d9443c01a7336-1f30a5b9d66mr50501095ad.48.1716315038765;
        Tue, 21 May 2024 11:10:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][ 13/22] gtksourceview3: Use -Wno-error=incompatible-pointer-types in cflags
Date: Tue, 21 May 2024 11:10:14 -0700
Message-ID: <20240521181024.426176-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110462

Fixes build with GCC-14, hopefully we will be able to drop it when
it breaks again with newer compiler like GCC15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index e504186b82..0ab9b14692 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -15,6 +15,9 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+EXTRA_OECONF += "--disable-glade-catalog --disable-gtk-doc --disable-Werror"
+
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
 SRC_URI[md5sum] = "b748da426a7d64e1304f0c532b0f2a67"
 SRC_URI[sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"
-- 
2.45.1


