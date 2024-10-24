Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CF9D1037A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.6073.1729801143576732515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZapPPcuy;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2772f7df9so11787007b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801142; x=1730405942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdH1TT3/qCGCYbpdsWoWdWV+ZgARfGitNur/2MODxxM=;
        b=ZapPPcuyQtZPn0Bu3/MZa5yaHNE2u8TITtJ/lMxALxQmyJrhou4xvCIJM+9oyppHcN
         NJObrM2QGDi30xdxOXLCpgNoBM/6TWkm9vgln1KufJfoJc6QROcVq7KXJ1QchyAAGyy0
         MExGALExVlbhNsjkmtGG0GQqSo8+oiN1wYp72DzVZPYa1sv4YkAmaDVmVwdonRnLbhGy
         5+4+7EtdLCiKI0v24eZR8N8DUCi2ENThCofXenEiEfOUWlg9L5RNhDdSBYbwVjphG13R
         W9E9UzWlPaCMifLbizw3YKSWmItvhDtxW+jBMKuNMhJ4i7V8P0tE1GBwCbVSw6bilJ3O
         xHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801142; x=1730405942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdH1TT3/qCGCYbpdsWoWdWV+ZgARfGitNur/2MODxxM=;
        b=Fdg3DQzOBE+drcGW1JRKUDHawtHXuQgQoMujr2cK8qbpmgr5RCNV+GFEn5gGmNq5TP
         aMMHa/Lz8QSTDeDIffnn+jwLl9C8FzLgU7XwnQhDslOJlItVajSBc/7/Ne1ZJA8Oetd1
         hTXMZXxocB50cbr91hk8keyz54Bpn3xfJoeBuYYdH4H28HDLgWp7cEYglNZJuPqzarr/
         5j5sfepj+taieWVadgpUWJx6c7RdfkKFOfMD2IkXjhkGw6VTkjyvp3K2nfLluAfcoMnE
         tN56LFpn1Jb4kEWNvLxAlI16daCwQMp11hbDpAkLMdC4+kgZ+2lLKINhzaRAqnR2Kb1b
         IhhA==
X-Gm-Message-State: AOJu0YwXEGfiJ2DHiCXgZ7vEK69WAewu/ZsL00aszKBmyq0Xo3eTiDts
	5cZkaa3PXzQrRXh4Lm2wrG18YJU24B3MaZNTNXpzBKEl8AFgduIqbsfq9Q==
X-Google-Smtp-Source: AGHT+IGK8/g6QztUyyhEvAAhvMytVz+h45YpgF7ff/E/ko3qEQ9KP34/bws75Vy8wLfawWRWN6qlJQ==
X-Received: by 2002:a05:690c:660a:b0:6e5:de2d:39b1 with SMTP id 00721157ae682-6e7f0dbbf37mr86360737b3.5.1729801142165;
        Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 14/42] libextutils-helpers-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:33 -0400
Message-ID: <20241024201806.440273-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113192

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
index 3ee9df730..e03496d78 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
@@ -2,7 +2,7 @@ SUMMARY = "ExtUtils::Helpers - Various portability utilities for module builders
 DESCRIPTION = "This module provides various portable helper function for module building modules."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
+HOMEPAGE = "https://metacpan.org/pod/ExtUtils::Helpers"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0280160e4f26faafef507664884bf63"
-- 
2.43.0


