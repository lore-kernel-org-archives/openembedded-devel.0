Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746D8D5B846
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.115.1730140099342466367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PkazhRI4;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e290200a560so4715867276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140098; x=1730744898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQjlvFoSlOQywYWnOKYjYYhcX5fYzytgN90VcymOg+Y=;
        b=PkazhRI47hOZm5V+eOOSxt69FjrAfZ4bPbS+cGjYUhfiB/EPVuCZu59eDOFuucOo1w
         l/vE8zV/9hXGmOsq8LTqf6QSOGfGXz+9/JtffG8c3UNshIdPIGTtgTRBpNMZYMPGyZdQ
         hMnl5DE2fcbDcDDKW1YoozglKLxn6HFAh7nw6iZDMTqugMHOfdRjCQ5jp+BcXiEmt1xG
         s3K/ViYC39+TrJSKMgvpwnG5iBrQJnESD9SJY0rjAUbEdcir3M2ZN1pzuZsRBe0fGJ/z
         aZHD8fh7H6yIOg46jIO4CG3wxkFsu3yQwYkn/1oUcbV9wzz3hQmy+C9JLRPO0IHvkhU4
         aWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140098; x=1730744898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQjlvFoSlOQywYWnOKYjYYhcX5fYzytgN90VcymOg+Y=;
        b=f9OCfDNVODU3B8OcQeHYGsyfdW0TkwnfMqKqsm4WItdGJJN6HFFWT/9q4tmke1TajQ
         ODsnAUnh/wXRfBcFQlC5tvsqrexOSPCB/jIIP2MGtTgfrtnbPMh4pWGsnq91k3iWKtHC
         YSPCUiUCgoBgYJfP9mTFjxr7S34A2qTJL+FOlyWe17ovWWqPHBFBWFGYWcI6Fn1fGLQi
         hadbibCtALZjE2Ngt1y8WjNylp7QOIwbrzPQ8VkRPJWmUnKNv8tX9t/3qrWKWol0Slcf
         BVWF4VFzOZtAVSEhURN5a7D5EEgMqO0SdqnJz8zIXmKJuqEHpelJyrtdA6/E93vsITCi
         ctEQ==
X-Gm-Message-State: AOJu0Yyi3mSJClHFhvmt7FQe9SqgKFqqrEd09Hf5AonaeB3u7YTL7vQT
	NlYTgrDoXmYTA9++MGP/9Y+shwZ9HUYfHt4ubAyBnhri23/TOtBW8e+VIQ==
X-Google-Smtp-Source: AGHT+IHuGrBl6azgCJRXlFxlFQ1RkpDpgP8CvKTWlWdiJuSkcrRppdT4OVttxp/ITEy9Mn3Jm/6+Rw==
X-Received: by 2002:a05:690c:f96:b0:6e7:e009:2c2d with SMTP id 00721157ae682-6e9d88b8a96mr82037907b3.5.1730140097958;
        Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 11/22] libipc-signal-perl: Use
Date: Mon, 28 Oct 2024 14:20:27 -0400
Message-ID: <20241028182749.5058-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113279

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index ca49b304c..43a6ff652 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3
 
 S = "${WORKDIR}/IPC-Signal-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
 
-- 
2.43.0


