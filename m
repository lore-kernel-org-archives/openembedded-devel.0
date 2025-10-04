Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF32ACAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 19:15:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.15608.1759605302548630796
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 12:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AfXgUTEX;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so6781371a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759605301; x=1760210101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqqGzlpddfktLsO13jJDrWLoSUd1ESwMrBZI22LBrmE=;
        b=AfXgUTEXZCCU8Y4LWoOgU9ilEorxKIdwNDhW7QWPVqHacHCJ+tYyRPpZCCS5BCENTI
         XtvXudvQqJz5QCAj6NphGCHcWWlrTI+oexi6lze4t1vJKTOHnMHKkepMh/1srxiKJg+o
         gPSIfnuHbjv0aPkka4iutDX14P4UJyu4beFozYaIg1F99L5kxrOJoe5YQCfV+FCNmOYl
         ETDHFUhTWfGh2Gmmz2YvR/v3VaD7J73QyWV/O/Ylzarjir6+/ou3e1+ERmnXPBnTTbH+
         CSxv3oTqk19p0k4ymffvry8uetyRQtbs5gQEnL48sZMQbrk4Kst0+LNBW+GmMqoMrMeQ
         LyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759605301; x=1760210101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqqGzlpddfktLsO13jJDrWLoSUd1ESwMrBZI22LBrmE=;
        b=AfF14Xued3lSHTcsZnd8ppdYHGgdy2CpkMJERqdTRkysRxb7cAGg+N0KKBHTv9jDGv
         YWvxOhqRDu5Ce5b8z/Aitk4AHiK4v62hWvioTC8lHUHYlpxfuyOOJqrtfaIcXHDzP/ro
         laNLDjllZT+BMk60DnDajiRbxvuF8jgDzDG9TV2rqr2Niyqy36ng61LG3BNIYT+U3xBq
         M/nkZTtVeO0c+2ifEnpVbmr5IrUw3q4jH9fruHbrmpeZQDzAiLyxufWA/OUd8RZVI7Vt
         9kDWdqQtj1/Jm43trF78W1UMiVwyumXuFB6lofpLsfNty4SQsoZW/TkpG18k3JeTkg2L
         XHLA==
X-Gm-Message-State: AOJu0YzGfp971GwsVi2olHRW8X4EmaXs0zHtekcG6N0kMtOeAGjbzit8
	AturvWN7LncSCvmhJCWFtuvnOEpWFBzxdfXtmc/TrkcuES6KEe++2S014NEPlQ==
X-Gm-Gg: ASbGncsbU7cqk4j1D/IxI2NIgvUnaC7o0DtCiPfVnpHm5jZR/Im3zflurLTcolmMAtL
	2m+1tNqPKaOsjrGnYFH2kIMpHANK8BJ6ozs9km5BsHloT5irmUxTs6SP7a+kuSkzum4qgt6jmDh
	/qmFeC6QJECrXBswKAWJQhwFXN8BDrZUTxnsDBlXChf8FRduDx6nYYboBNN5AOtvkmsS1KGxw0F
	gcXR+v5K697ijwHf8M1BgdabmxiXEGiWmQhs15t1P1QYDbN/IE3qoMghD74By7RVFa7VoxCCV+U
	zoQEJTxLGoQtQW9klmDeA/Vsd3WAW/AIKK67b72OQ6Sctxvawl1EPaLxePG5EjuVylzUrcuU1qT
	LTz8hPASkGtQo5ospnWTJasQxqzwRj39+e+zSSlEPe2I2LMz6zKUZL5s=
X-Google-Smtp-Source: AGHT+IHH3zO0EgHn37gj+irCsYugEjm22Zwf4gHVRDnVkFgzciHeNAaFMUUuTr25eMPW4n8Si7hYlQ==
X-Received: by 2002:a17:906:9fcf:b0:b41:e675:95e3 with SMTP id a640c23a62f3a-b49c20531d6mr1002279166b.16.1759605300589;
        Sat, 04 Oct 2025 12:15:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a169555sm735605966b.88.2025.10.04.12.14.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 12:15:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] civetweb: update to the latest revision
Date: Sat,  4 Oct 2025 21:14:59 +0200
Message-ID: <20251004191459.3218696-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 19:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120238

This update contains a fix for CVE-2025-55763.

License-Update: copyright year bump to 2025.

Shortlog since last update:
https://github.com/civetweb/civetweb/compare/5864b55a94f4b5238155cbf2baec707f0fa2ba6d...b6ef58f4c4c7fbe90fd1065bccf45b143345f1a6

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/civetweb/civetweb_1.16.bb           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index bbf284474c..1d0207edb1 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -2,14 +2,15 @@ SUMMARY = "Civetweb embedded web server"
 HOMEPAGE = "https://github.com/civetweb/civetweb"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ce6ce6eb1b2fd59ee6bab219470442a3"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e5f28949b2d9ec1f4da8bb00aff8b6d4"
 
-SRCREV = "5864b55a94f4b5238155cbf2baec707f0fa2ba6d"
+SRCREV = "b6ef58f4c4c7fbe90fd1065bccf45b143345f1a6"
 PV .= "+git"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
 
+CVE_STATUS[CVE-2025-55763] = "cpe-incorrect: The vulnerability is fixed in the used revision"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

