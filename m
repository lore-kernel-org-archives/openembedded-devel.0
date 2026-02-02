Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DBBE7DEF7
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57420.1770050237679138043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHoJc/yV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so39723715e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050236; x=1770655036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkvszOsFlcL462+M/rvk0apByoITa+uutHQrkvCykS8=;
        b=HHoJc/yVSpzkruvdecbK96Vl5Jo42d9nJ8bQdDp6hbxNdx/b6XBDxbw6m3mhocEPj5
         /Z4kmayUgE9u5FfvouFfKE+mTBSX1r0fnN5Tj54Yg6Pga73XFUJNt2DqhjYn/74W7P+p
         JPyfzO0mMHTV7FVTZ8uvD1yYorjJ72jO7X6BxLIULw5p8EQc5Esfd053Jt6qFmEhBVFr
         cf7qA0nL8A3uOkJXhsTLgNRtLErtsvWI0cSAHmugegeYk0A8/r/9gxCqEEo2vpQN3m/r
         R+v7pSUzUBVb6tReZ5UyrJtsXH8IogAdPPzU2bPwM0zjioIGZ015QnjXS5WGd84dt2Yn
         i7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050236; x=1770655036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkvszOsFlcL462+M/rvk0apByoITa+uutHQrkvCykS8=;
        b=Ay7ykOr9zku/Kh9252G1Oq+AuH/kUQsuFMhPoC6CrhG4IDPR8prhEWFB98EyaUBNZ2
         PQLeK4DVimVVvG/05EeqKnZiFjxPWWRZGHb8ASeun6GCKvKvvPluj9uMrGZUeF7OPKuI
         mJfoRRwjr0PkiGO4+YtkKWmOygMiTOyqH+fhkUF5zNOiw3/HdBEkJOeMH0pCBggkediu
         V0oDg+lefCsZVJSlTDYMcfq8pDrsPHxQRggEHXW9OP80kP2Y2bt7jZujxWYo8dTIlB0/
         ESeVaekuGDrAK8j0K6LdQx2G2Ur0vayoOue6rblXmYncagX6+lsvz+X6ZFlsrcaJ9vgJ
         Enkg==
X-Gm-Message-State: AOJu0YywRP3iCeujRBPLJSK45LOQNLZt51dKVh1SrITQ4GNFMBUizewS
	+XZMSUVvMGQHgaHqxbVf0KN7IpSZUfdYbjqMC1pDMbIVda+CWbM2HWQndy8T5w==
X-Gm-Gg: AZuq6aJmuV/D7DCuicO7BLLd4vrObQipw9znn9GCIe+JAB17t9sR5r4/7SNuTC9HxMs
	ABOXVWFX9HRVywVUm5iv8evRjhDakli8gnCDSbofXOW3Zmxng8Gw952gAEIXJnTRs1wFqGYH13v
	nKFuTa6tas64cNgqBS+Ly+8M0ib4qVAaV6bYOqNWZpybgzelupqaxcnXDM7JH380AlQpd1T0F/2
	eyI0mGbt71WH9/A9XxHFTFAU+0idD8b70zLCg8yl/aHJnfKkxbrMAGd1Wh5NCs4PqkLq5z00X4Y
	Jg87qTwmR4mEznv4yxSU0+PXyI1fm6PhlrYUKGMnVax1TNFfu5NqSuEP3B1lj4YgNpj1VwDQp7C
	LZ/c3aMJiaHgarNYVqQcfEpN9+EHMTEYy7J5/IDWRWivU1WmR/0m2lzyQqrTzhpOHS5wgcodLiy
	Tc4Hzou08+abb3O5UOKTY=
X-Received: by 2002:a05:600c:35c6:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-48305150654mr456955e9.16.1770050235741;
        Mon, 02 Feb 2026 08:37:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/9] gimp: mark CVE-2025-15059 patched
Date: Mon,  2 Feb 2026 17:37:06 +0100
Message-ID: <20260202163714.2359370-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124062

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15059

The patch that is referenced by the NVD report has been backported[1]
to the recipe version, and is included already.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/c9eb407485f6c085adf70c8a334f75ea31565c60

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index a5e892c508..863d9a1667 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -134,3 +134,4 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
+CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"

