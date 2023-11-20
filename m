Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF457C54FB9
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 07:26:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.45544.1700465193058383246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 23:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PjVco41N;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-280165bba25so2702434a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 23:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700465191; x=1701069991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM8DP/OAKpVGfvADkNS5cf0ptWeg00gniX4/wVWNbI0=;
        b=PjVco41NOOm+JHU8ihTZUKJquXz20QoaVqZakTGLNCe1FLaOWupvcyJ/BUXSfPY7+g
         Fer0gBnIEqbRIxy3ksFREM8na3M7HsQs8vRznDtJpkc0zk9ceByxD/P6s4GIP2PwCHex
         8G2jyeHIEqbZgG5LAPflkI/FvoWMBTwxL3OY1suCQYTzGfKbbPPAUhDbak01kLlnpwKf
         /VQDlRnKZK20qpAPbOohjlEFSWS2nsZv3Yxxxg7Pa13jXIdWUfA5NTBJnrNdY7hjj6gI
         1RDeMFKEGHu7QJJjChfoOhUo3wGiOR/xKUHsyNZlD/rvzPLZZmMxHEOBlxGMIRBoEsfy
         UVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700465191; x=1701069991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM8DP/OAKpVGfvADkNS5cf0ptWeg00gniX4/wVWNbI0=;
        b=Z8RJGgG/79DQIcdjzoSB9bF0t/cPuLmJ/eCVVTTnop+gdZ/FRht/0aYi6nxvqnHIE2
         prMzcGU4UczZL57k5WGLA8AWZwZM2RDVL9pgre6ijz23uafeRhwxe6ZP+O3uGrtQ/XJw
         lU5nBUVbBGKEq5KkjnnPDXUKN+Nrh5YFOVL080pEvQ8SAnw/O7NIlnb2uTNKYJwPGDac
         HnnSciSWb6++CyBnqrgAFUZK9H9q1QNORKAJjbef+YkipghnsybO7pRizSo1zVGwJLGF
         Syr0GP+/3VjKpnsZLaKdhjKpGGqkcJ7OYieZA6YEoUaNF63CCECYDiY9isbpCP5/bFlq
         Gv4g==
X-Gm-Message-State: AOJu0Yx6RcgzttlJnZxVTKBqvMzli1fXU4nr9nmj3hJIbIeNdPkDY6Tg
	sYflxn/fgdvpXMxLLZp4tplt3thL8/A=
X-Google-Smtp-Source: AGHT+IFgF8Hz5gsjA7b+8lnz0B9UGDCa7PwBlHxwKchz4f0H0KNlnoqDN+98HfmUI81S++A2s0ee/g==
X-Received: by 2002:a17:90b:1d0f:b0:274:4e9b:7a1a with SMTP id on15-20020a17090b1d0f00b002744e9b7a1amr4180154pjb.44.1700465191564;
        Sun, 19 Nov 2023 23:26:31 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902d38900b001c8a0879805sm2332104pld.206.2023.11.19.23.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:26:31 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 2/2] idevicerestore: Upgrade to latest master
Date: Mon, 20 Nov 2023 15:24:16 +0800
Message-Id: <20231120072416.2556340-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
References: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 07:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106960

Upgrade to latest master.

ecae6c6 Change path_get_basename arg to const too
acecac3 Change path_get_basename()'s return type to const char*
83600e9 restore: Fix UaF
85ea337 asr: Fix sending payload without checksum
10c15d5 Fix update restore by making sure the premanifest is properly generated
6085ed7 Print progress for large components (e.g. Cryptex)
f87ab8b .gitignore: Add src/idevicerestore.exe
8664de0 Print device Product and Build Version and IPSW Product and Build Version
c871c59 Extract OS component when using older ipsw archives
4072cd9 tss: Add USBPortController1,* entries to parameters
503bdd0 Improve debug output by suppressing libimobiledevice and libirecovery debug output by default
6806495 restore: Also print checkpoint warning messages
f17f520 restore: Add Ace3 as known updater name to suppress error message
523e567 restore: Skip adding FirmwareData to FirmwareResponseData for Rose
7e5860d restore: Improve checkpoint log output again, make sure to always check for errors
1405a9f restore: Refine checkpoint log output
e4e5512 restore/tss: Prefer DeviceGeneratedRequest for Rose TSS request, and add missing tag
064daea restore: Add new SE,ChipID 0x36 to list of known values
ca76f44 restore: Attributed status code 50 with SEP load failure
c96f60b restore: Handle SepStage1 (SEPPatchImageData) in NORImageData
cf22a1c tss: Add Ap,SikaFuse to TSS request as seen for iPhone 14/15 devices
dbe7313 Refactor ipsw code to transparently stream images directly from ZIP or extracted ipsw
17969ef [github-actions] Updated to use upload-artifact@v3
cc9c68e autoconf: Link against libusbmuxd too
9546654 [github-actions] Updated to use checkout@v3
5a00bbd tss: Make missing ApNonce non-fatal for IMG3
7943b63 normal: Don't do unpair before entering recovery mode, remove pairing record afterwards instead
4191036 restore: Remove plist debug print for non-existent UniqueBuildID
c8b9f3e fdr: Fix a debug log message
9b9bba7 tss: Bump auth client version to match iOS 16.5
ed5463a Add generic TSS request generator
a351513 Add SE,ChipID 0x2C
da22dd4 Display iBoot boot stage
73438a6 Add support for incoherent iBoot parameters
609f7f0 Use DeviceGeneratedRequest plist for SE TSS requests

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index 2a0a129fe..3dbd8db63 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue opens
 
 PV = "1.0.1+git${SRCPV}"
 
-SRCREV = "163a1647dedb7ca4656c0f072e4733573f9f982b"
+SRCREV = "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


