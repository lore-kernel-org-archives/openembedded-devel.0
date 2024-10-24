Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C3DD1036C
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.6089.1729801155892453263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bsvw2fE6;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so1514511276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801155; x=1730405955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI9vZz1VBiKx3XYWnkxEpbHCD7BasWiE5HxFtWd0shc=;
        b=Bsvw2fE6oekVnJyvHY0dtW8yz7+19T7McmC/JC3AAsETwpFGWDWA8LCJ0PjPYhorKt
         uKGuuR9J33XrX8rqfQHGJhW7+3v9BFSiNTAbMPvbyL4hPjSYhUCiqPzuj2DRJwNQ0SBD
         5CwkHePYZrI2GyHKWxcpN1qfOrGdD5ESCDJjPz1QMftf0eKtLkCOnB2OOhknHCM9z/i/
         QX25bSyvTtGLJoAGc4pPirlu1XX6OowPFdglYTQkB9yfncgt+9M45C2hrIjIT0Yi0XUa
         RcxmkL1kCKLSDajTcs5uuOz35nOa4ljhlJGEdAcmbqdrvOhvpPKrueYvNOKo+2Mj1t9F
         QdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801155; x=1730405955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AI9vZz1VBiKx3XYWnkxEpbHCD7BasWiE5HxFtWd0shc=;
        b=b1k2/D1eiJcp9+Jbk7HAyfegh0g4+wRwpbenaknp9Zgq/+bdHjaIHk8whd64rrUIKc
         EHXzZb/AMfZALn/zoll7ral5x48dovJdGTE99nwypl9EyNTsye4fW4DnOgw0EpyITDz6
         7Jp/su4MN5fdFhvkeiSxMduaHyhSmypo9jzZdKHgs6RNFk3fvTWC+0PLcq5BJEjaV0hr
         lxvrF0PtPBR4X4nHP63nD/T/yLJYvFuTrtEB2fW7+RGmum37hOUTz8McARL/uSa859GL
         mfcBVTObbiwDy+vmigXYmWSEMkdbc0QVgpb/9+1gwGs5yNiR8/EpkbuXerNrv/zdUQ+i
         bVOQ==
X-Gm-Message-State: AOJu0YwpMbA757iACLgAJ47dnDSOl4g/3LjYBgRLzAnHdqra8iOep/3K
	xgn1c0jKvX2fl5kXOLjvbfj9WJh3pJRzfmknxUcUL7oCO8V+s8pLy/YMuA==
X-Google-Smtp-Source: AGHT+IFF4MW4qv2s1SVh3Nw25yR1yzeCrzBj3RFDS4WCRLDjFuxRwZ3FD5Yc1iv7BGccd4vQ4uvv/g==
X-Received: by 2002:a05:690c:6609:b0:6e7:d974:8cd4 with SMTP id 00721157ae682-6e7f0db262amr81868247b3.3.1729801154599;
        Thu, 24 Oct 2024 13:19:14 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:14 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 33/42] libterm-readkey-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:52 -0400
Message-ID: <20241024201806.440273-34-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113211

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 831ea1a8f..3f184badf 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -6,7 +6,7 @@ handy functions for working with terminals. One of the main goals is to \
 have the functions as portable as possible, so you can just plug in 'use \
 Term::ReadKey' on any architecture and have a good likelihood of it \
 working."
-HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
+HOMEPAGE = "https://metacpan.org/release/JSTOWE/TermReadKey-2.38"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.43.0


