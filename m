Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5133ECA0EF5
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:41:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.8393.1725007308935175770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dcQzhB/Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso1459953a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007307; x=1725612107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YrlSJ6ClxFBIAfstDZVgAd0u0dKu+wtsbdzjCapNDYw=;
        b=dcQzhB/Q2FAtBN0V/2tLubWWj5Ly2Z4YDWZwUeNBwXycMSLKJFZ1onN5YKe/FCAg4I
         qYgML6ok+nxBeXNKvns/qtyGOI9a9KCWelMj2dMdGuKATyPNqyV46Em5w8TH2VWSQ4mc
         A1HdvnXqi3CmQpkNadKKZs/4EH1TdTNY3U2zPVvwWnNR9GqDYDy1fworIVqurkTU5tx+
         f5mNaTW914+433SSaFF291IWl4G4BNYkPgGYB/HpMGCx5UV/hpiawUD6Hl8HS5N5piOP
         4Dyli6tIB9fiplOx6aHRIGQFAm7q+Xf9jwXFdLzMTuW1ZSPMxgJDiu58sxgEaUy4vZPd
         Yamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007307; x=1725612107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrlSJ6ClxFBIAfstDZVgAd0u0dKu+wtsbdzjCapNDYw=;
        b=kcA54xsbwgbQym9Y0q+IsvgOLqRcK7aHCDVPZNmwQ1HCt++/r3TPMoDwgxv/y0DD+H
         WiPAyZb7S2ai85VIxCasRJrs02l5w0epJPsoShASkJZD3OYYhaZ/VnA1+BL0xHrINAmD
         lYF/PAQvMKdYHH7gCvebmfjntQohc4VnwArRvTXoA14HsRz8a5hNH4jTFcm5dzBQsQ1p
         815Y9sqrhDdHw1MTceyUefPaIr+YPRm3nKtETrwr5b5hMX6CR5i0x6uDt9NIFvzLnaQS
         wXoBlh0bxetgoRdKFwbSMz0AdmL7NZ8dUHC+EAHbsyXhMtO6dSSzJHqJl/WZQgl+opOn
         +tQg==
X-Gm-Message-State: AOJu0YyR6A1NdsscJfEtk+oSYsoYM8S/+Y//yuhr1aYdcH2n9CZV74F4
	cDYTNblS8R4knt9mBXi4gWLRkQ7T5PUjdthwlNUK5OyO4GdyY8KMqMZlFw==
X-Google-Smtp-Source: AGHT+IHeKCTJRpPQXVq0/oFefFLyVUH55eDXZsHmeYFXJ+4yoplbryLfGT2XEg18iR4bn6zknzI7cA==
X-Received: by 2002:a05:6402:280a:b0:5be:eb9b:b72a with SMTP id 4fb4d7f45d1cf-5c21ed3811emr4687414a12.6.1725007306608;
        Fri, 30 Aug 2024 01:41:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7cfdasm1687596a12.58.2024.08.30.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:41:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gpm: fix buildpaths QA issue
Date: Fri, 30 Aug 2024 10:41:39 +0200
Message-ID: <20240830084139.2931958-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112051

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 25e5414a35..a066488649 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -24,6 +24,10 @@ inherit autotools-brokensep update-rc.d systemd texinfo
 INITSCRIPT_NAME = "gpm"
 INITSCRIPT_PARAMS = "defaults"
 
+# Avoid line statements with bison/yacc
+# ERROR: lib32-gpm-1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530-r0 do_package_qa: QA Issue: File /usr/src/debug/lib32-gpm/1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530/src/prog/gpm-root.c in package lib32-gpm-src contains reference to TMPDIR [buildpaths]
+EXTRA_OEMAKE = "YFLAGS='-l'"
+
 do_configure:prepend() {
     (cd ${S};./autogen.sh;cd -)
 }
-- 
2.46.0


