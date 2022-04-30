Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DBBC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.26009.1651346323860598091
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QkX3D6Wm;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r83so8914553pgr.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qwuyCoopn0Oq8vGEC66guow0e1ilaQgRdqYfajucbg0=;
        b=QkX3D6WmXtjHS7+vBSKy0hgkPY4zwxSjmFta16sociF0F3/9Rlq4yjn9RarNhfk44E
         YiSrv851NGvchW+4yoncSOr0ExXNXy547cOzPOZUX4jG1PrFkdQYRDgHeHxICoQ0cX8b
         H7EU6MKlvgP55ZtViqiKq0tzhAsYIdU/w4S34gLWYE4Hz5bMz5mw2xOSnlT4sewGlyIx
         IMaYiAexAZLOJi/qN68hqnyXdVIdj9b3ZJwi9MaRmEGIUxdt/3if2PQEamjE+g1AzUAq
         SLkRWnFxqVDlbphBqVYgOp7TJ5tu1pKG3r2ikDSZnvrXoIG8g7ZFtDYaBiWnU3MR8XF9
         cHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qwuyCoopn0Oq8vGEC66guow0e1ilaQgRdqYfajucbg0=;
        b=agqUFUBd9DX0M98Y83peSik8BHY697cwHRIKonSWonTlVg1zTEGAMWEkidwHTk+sLi
         HLkG733k41NWuLgrO+7ZmUNQtLmB4+JdUtTROiOMuT0L2xpyk2pwRhAv1Hj98iOmjy0w
         jrUl81AsY7zo/4K6fes3B9iqyJp5ZtL8wsPH2feC9rt+aCo/Flkaict/IkQepjAVICQY
         jMvbnqHtGwY9Q8kD7n/XNRlpymCmCyX8CQK4tNERATEK9mu3yEnDYsYeERDewXPenNYe
         mw/a34bpVe7IZmyjbzPG8zDWnnf2CboT1uCKZg6z69CqGKqxijS9NlnNTGoEOcUIoZbc
         7G+w==
X-Gm-Message-State: AOAM5317isQYrlT82W37bCdDxkRQrbwWA4nLZDdENgRC6WaNoS3cT4n2
	OY1btHXdybGbe7tx0mgS1FAUOk2o4Ri0Cg==
X-Google-Smtp-Source: 
 ABdhPJzND8ef0yFRjOjSdilVdHapkziJANEaKyRtC7PKLMaKDziY6vxykARtzN4kEMQmlIvU16+f4A==
X-Received: by 2002:a05:6a00:14d5:b0:50d:6a8f:d0e2 with SMTP id
 w21-20020a056a0014d500b0050d6a8fd0e2mr4514303pfu.55.1651346323072;
        Sat, 30 Apr 2022 12:18:43 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 12/39] klibc: Recognise --dyld-prefix clang option
Date: Sat, 30 Apr 2022 12:17:52 -0700
Message-Id: 
 <eced65e6dcbf9c1789f474e35e0a58684d8d2bf4.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96879

From: Khem Raj <raj.khem@gmail.com>

This is added when usrmerge is enabled in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a52b84dbc41c8c831e5ce82b21900210ef1a8c4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../klibc/files/klcc-cross-accept-clang-options.patch        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
index 431c75e3af..a3a0695637 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/klcc/klcc.in
 +++ b/klcc/klcc.in
-@@ -207,6 +207,27 @@ while ( defined($a = shift(@ARGV)) ) {
+@@ -207,6 +207,30 @@ while ( defined($a = shift(@ARGV)) ) {
      } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
  	# Override gcc encoded sysroot
  	push(@ccopt, $a);
@@ -29,6 +29,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +	push(@ccopt, $a);
 +    } elsif ( $a =~ '-rtlib=.*' ) {
 +	# Allow clang options
++	push(@ccopt, $a);
++    } elsif ( $a =~ '--dyld-prefix=.*' ) {
++	# Allow clang options
 +	push(@ccopt, $a);
      } else {
  	die "$0: unknown option: $a\n";
-- 
2.25.1


