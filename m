Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A4DC47255
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.156014.1703876564815833004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kUTJEPfL;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d05ff42db0so61632367b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876564; x=1704481364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNxV8R4hIsmqkW3HrB2usLgWr/am/JLU7yT8D5Y8H9w=;
        b=kUTJEPfLEwkb3SmXiw97hQwc/bhN7fnIh3eqGoT2tEOSDNKeBn3NX2cye7SrGIiveb
         17uX4xObsfxp373cnHQVZ4TifL7FZZiNdXQgSw6R2FyJftogMjPXl0MOHt2PzK+IthMi
         UmDDXq04qZ0/cDoRZR+3i2HNCDW2FOCsUNQBtQ6xeS73RXzGfgS3H0yocIYFImEW3VrA
         vGEvN4JTNeW4mCRik+4IIXofb2NsMcSFeGn7gbRPXsceyfYZGcHbUTAzeaKRyTUirzY8
         Qw7QoZDajJVbaysQaobuXReSAwC1hPrGU/DR8Se0VekD8a0y6JCNVMoivVEkxOAraWoF
         zBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876564; x=1704481364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNxV8R4hIsmqkW3HrB2usLgWr/am/JLU7yT8D5Y8H9w=;
        b=qWqUla1NfJFJZ44I9fb/CSUcs3Mk2TUVwBwFQySnB3t/sbr9H0FYl7NvaBx58ZSo//
         L+8qQr7hQ5/RQfZHIv0dcTd/FjdTiLcxvowPSF63TcJ4Ja4f4qHCJML7Fi0ta/1oUSPZ
         xWJjBSovgpUuRHekk/UVeV9+FIabhCIusbCqhBN9NxR1OT5hW3+nh/PJpOmDRidN2UNn
         CxdSoQEexVv/WLeQrTSYEw0ssjiMq0fHjXaJvCV13CkP8cayTXZgu9G1sS3SDgBu6ap/
         uX2gSDnj9TwVQl9bXu9oF84a6v3VaVi5G8PyafX36seCGQqWutahGuBwMRJXErfRD3DR
         I3MA==
X-Gm-Message-State: AOJu0YyrHcNxM3JhS3MCGz1ngYbeZCMSy2v07Wp43CnKORe0FMSh0Y5k
	UQwqrvgssmKlhvazwjNGCb+mBWCua7WXFQ==
X-Google-Smtp-Source: AGHT+IGiOjoD06hNshNfxv+R2JeSiMCouhKeJtGAraLO2KTancgdAy5Eklx3WmjybUs0+NiMRVAFzA==
X-Received: by 2002:a81:dc07:0:b0:5ee:d57e:edfb with SMTP id h7-20020a81dc07000000b005eed57eedfbmr2649173ywj.26.1703876563716;
        Fri, 29 Dec 2023 11:02:43 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Edi Feschiyan <edi.feschiyan@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 12/17] libbytesize: update SRC_URI
Date: Fri, 29 Dec 2023 14:02:25 -0500
Message-Id: <20231229190230.135480-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107894

From: Edi Feschiyan <edi.feschiyan@konsulko.com>

GitHub has been redirecting for a while, so switch SRC_URI from
github.com/rhinstaller/libbytesize to
github.com/storaged-project/libbytesize instead without redirects.

Signed-off-by: Edi Feschiyan <edi.feschiyan@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75bb23b3b03e225aa012be8bd5998223ae8f9b2f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
index 926a603b81..28e40f66e3 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
+SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.34.1


