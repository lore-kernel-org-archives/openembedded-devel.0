Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B795BC5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 07:26:37 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.45543.1700465191521178703
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 23:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rb7z02BW;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bdfbd69bd5so3714356a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 23:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700465190; x=1701069990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0UetSLCTmgGi44n7PvJFY5US+BXJJ/veYat5zg8mTc=;
        b=Rb7z02BWftNksgpsrz1gwJZBqu8p3J9fb3iXylZI+pwwrjKZRgQqbk9ZtY4Ql0dnDT
         B4nTZ63Li3DZgd7nBy13t9Mfp+pi4eSWutglVAQUR7FnNDlZN1r/+gzdqSfbsGg2fxkq
         uagJpgmXLzVKbabqtBWbnCXYxEohcxW4C1z5tp5AHv9H5Sj8prorI0NWWjDLlQfCEwpO
         O0d74HRDYfI7LY9rTVo9hK9PE9VYxFPVpX0MLa5FjsixdCTLnKtMzh1hT2wkBBkMgEzv
         nK4CL+YW2GdvYKxtLa05zXplDfQAWVdH0H6Qlm+N6aaltQ2VwuaYaEjxMTGj1tqqXiZR
         VBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700465190; x=1701069990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0UetSLCTmgGi44n7PvJFY5US+BXJJ/veYat5zg8mTc=;
        b=CbPwE9DJ6KIAghoplJEOG6MmmGWJXlAsYUfO0hea9w6zNgbZ3RQMGlHL7dGVXYKZRg
         TDoQU4XnGje4DTixJnH4z2eUjfbLsZ/yFnLTYXw5m8W+XN3BhKqTJDbhDVhh5WHEUE5R
         Qo7ZtombCQEnbQZHV49hGcd9ZRyHh5PJKwvxAiSjEp8M1GrWIP5d1WZr3NG2fXC+WNXQ
         sLqKWcsaV6EaxNO6am6Hst+8e2AgrfOvzymiSeKs7PEaBXsqHHxE+Rqh0AkGpuOsqa5u
         H1CkPVoEWDh8nmfOOTFbIYlfR34JNqo29Yy6Jj50gG5hMyK40OApB7FnocsUn5XtOTRE
         C+aw==
X-Gm-Message-State: AOJu0YwGoLOZ3GaZ8PaNNpGQZ06GQXWDnOpUcf7pcjOjmYWoHdoIRtfc
	w4HK3uMb9DQHwZ7yWCt4bkQ9WsRbqSw=
X-Google-Smtp-Source: AGHT+IFbTeYL05+JbVFPQsc73GPGbC3uw0NUmmKAFzzKtlfmlTCTVMEA3OiYfJUccNlbGkV81q+ndQ==
X-Received: by 2002:a17:90a:6c8f:b0:280:963d:9c5 with SMTP id y15-20020a17090a6c8f00b00280963d09c5mr8846398pjj.21.1700465189992;
        Sun, 19 Nov 2023 23:26:29 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902d38900b001c8a0879805sm2332104pld.206.2023.11.19.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:26:29 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 1/2] libplist: Upgrade to latest master
Date: Mon, 20 Nov 2023 15:24:15 +0800
Message-Id: <20231120072416.2556340-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
References: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 07:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106959

Upgrade to latest master.

2cd858c test: use unique output file names across tests
d45396a Prevent adding NULL items to array/dictionary nodes
2d8d7ef Plug memory leak in plist_write_to_stream()
f28cf0f Add explicit casts and fix return type mismatches
d772fd7 Add an explicit PLIST_FORMAT_NONE value
50255a2 autoconf: Remove unused function checks and fix constructor/destructor attribute check
21a432b bplist: Move realloc from parse_unicode_node() into plist_utf16be_to_utf8()
b7d7459 Make sure function signatures match their declarations in the public header
ff00100 Windows: Use winsock2.h instead of sys/time.h when using MSVC
af51970 Add space before PRI* macros, some compilers do not like it
91c0aa8 Move PLIST_API to the headers
834bb31 Silence another false 'shadows builtin function' warning on MinGW
ff842f7 Silence false 'shadows builtin function' warning on MinGW
1d45b85 Silence more compiler warning on 32bit systems
57a7f14 Silence compiler warning on 32bit systems
954b3e4 Update doxygen config and document undocumented macros
4d08422 autoconf: small update to configure.ac
5d65599 autoconf: Allow disabling build of test suite
61f01b1 Add a PLIST_OPT_NONE value to plist_write_options_t

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 3a10b40f1..f8e7f98df 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -8,9 +8,9 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-PV = "2.3.0"
+PV = "2.3.0+git${SRCPV}"
 
-SRCREV = "b8fcc89b74c9128a13b07cc15a0ce25dca0cd97e"
+SRCREV = "2cd858c679d25633077ca78b67182a9b77653816"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


