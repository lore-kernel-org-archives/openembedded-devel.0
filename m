Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBB2D6ACD9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:40:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38108.1766050796610881643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvlKMIK/;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6495c4577adso532650a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050795; x=1766655595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54Jg+Sn8W8iscf/xYqkVqc9Qo4nL9APkrrkftDM22SU=;
        b=XvlKMIK/E8zXP5qS6aQvyS/Wvyu9tOGVhuIm4+IYC0qiwhRtGwFoVAfBnq7U4jrrFs
         ndxYRsK7e+Jix+kV0F0/1z1mEwmk9hDqAYcxaEtRmMyknEp4c/n1e6ZycaayYQv7P5cC
         PFODlNHOj9TxzjJXud9yYTxIUXO6Zhb78zRjoDgpETfe3OuUBpMsOTLOxtZhW5aEg27i
         aJ4Eoc+qpy0d/tCz0FBC//F/q64p/I4ikdwN+TnOfK7O5CtPvCdtrGQ1pNBwbVtm/8rm
         OjrMroefv7leqi9sN5bX1DNfAke4ivkrLCsJSWX/TxEu+VKyMCqrSS9uQNdZlgmCt2CD
         OFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050795; x=1766655595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54Jg+Sn8W8iscf/xYqkVqc9Qo4nL9APkrrkftDM22SU=;
        b=fk6vq8FEGxipBuit8Cm73d3aj4/WYyDebEUfVCjArA/eUtoLQGz2pbCdktKRqvffKK
         6a+iDW70drc39SxsJIdCFdS4CKRgQRwvaAqqIlwVqmMVJ4elY4qfTBj0MpsILxfGqw2H
         w6YhPRRg9bF3epuqxh1LkmkXJeBU4Mkxc+sAC+XluT5uniWdbRkHLxmt0iFU+LJMzf5A
         i80dIJi2UQgbcblqwgi7iDFtNDaK0JCH60ef+c0XcVBi+O4H3EDmVnCY34HgQoXVaDM/
         ob4nWBeb4Xdx3ISQRYZGQRpfxClIVMchy7U6DlvDq5/Y0Vpb8iY2fDj9E4Fc5htozeTW
         MHyA==
X-Gm-Message-State: AOJu0Yyc3Y2iHXnW+nnuSdM56hoBWQ61r69BPwtzkVgJojdVB2h0X50N
	9Z8GR4AKN+yD90+eqkSihWutP1MKW4hLtwh5V/FzXzM37xE2hYGS9oDWnUXwQw==
X-Gm-Gg: AY/fxX7m+YjUTbdaMyikYaTxOjjhbUlFHOhYItKIn73UPmbYm9qk+chcLrO8JMw66xv
	01qtnJbpf6M+EIXWmKms+Lj2XcB+is+ZjU0U04Vhnoz491K1vybSI+CmNluhgL5M/b726jacDcn
	QO/sPX6cI/AlDoK3i3k5a79B0tXtYviVAmQ68y3S6XSfDN2haWJE6z1POVkv3E8fS3pzFtKX9bC
	M1GT3z4lorMscxebLPtn4sXXty+iPrqQVT/NN6E55/X4+FXHjwnviTMDszoEmpkcsbfuMdBwbwP
	9HJqjnQzpVbUzzOoHpQSdID1LKsmeErTtkjPofS663ZG61XJRfLJyGOpXjTqtR/OH2QfDJugV9X
	hamELRqCETd2xP4EqnJuj9qcYv8Kcr3mQyjdAUC7ypdCFGczat64IBBZzctdmYx1iVHywvgf72g
	efuQDbnoHykwItXX9X6+A3Y4m1RN226fwDZPMLzQbtxeZRReHzUGouVG3Gm5XPzA==
X-Google-Smtp-Source: AGHT+IFg+7sCarN6EwABgep3LoDVqHMxjVcK0qX9PCja5RMRzssMGPdHbY9JIMZD0X3AVimqdpzfGg==
X-Received: by 2002:a05:6402:51cc:b0:64b:6e43:eae6 with SMTP id 4fb4d7f45d1cf-64b6e43ebd7mr744368a12.2.1766050794798;
        Thu, 18 Dec 2025 01:39:54 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.46.bredband.3.dk. [77.241.136.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5887d4a0sm1914984a12.23.2025.12.18.01.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:39:54 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v2] dbus-cxx: upgrade 2.5.2 -> 2.6.0
Date: Thu, 18 Dec 2025 10:40:17 +0100
Message-ID: <20251218094018.793955-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CADySD0HpaQvwErZrPLqBt57SqWV1hr4EB_qqCLGZ9ihprb95Tw@mail.gmail.com>
References: <CADySD0HpaQvwErZrPLqBt57SqWV1hr4EB_qqCLGZ9ihprb95Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122757

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb} (95%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
similarity index 95%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
index 0908409e1e..cfa476cd1c 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
@@ -5,8 +5,8 @@ SECTION = "base"
 LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRCREV = "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "b705ad73bef724de0ed33f60462c70b380b6b300"
 
 DEPENDS = "libsigc++-3"
 

