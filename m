Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AD6D3F28A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.29991.1729278836264865705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGomgrDr;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so2533686276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278835; x=1729883635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrFIDTsZU9B0gcgayH/h6IHl3cSdW2f7ud20hggKaws=;
        b=DGomgrDrHo8RKXB3RAQe413Y3rz/8J6Qynok/BLOx6xnwJEM7ZX3BSzp/cRA54rbts
         DjnYUWk/EFH8WDMcrVLgxmYilGpljlYkTt8j4sbYFSUfoPcm6l5UiC1yRPMIxUrb1ss7
         WEtYhm59aGBB9o82mJFyw85AX4cPeNgQH9cEDkoQttelAhpYTZMuMUA7KUUYVrkbw8Gt
         jH0Qy1nsG1ulw99f/qM85Alyeds0l0kNRYSgKRdD9IzLLQ3RBFdgBl6aMffETD0J7w59
         nRRVeOTNzNwrh0QtYq/jN+aAAuVsS/cxcbqqQzC5mopd1Y24kDIuw06g5ghsbG2z5qon
         IS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278835; x=1729883635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrFIDTsZU9B0gcgayH/h6IHl3cSdW2f7ud20hggKaws=;
        b=u6Ox7OCGxsvk4h3QsNq1TLbabO6woaCqbBOSpEYLYRKEzk5Nggee3t5OvAwEDtg9zQ
         8SxwqqvZ40BOA4Ica2UHO0pJb4wmkgeWtaWAL9lZMltC6iZxOHLNSK7cw6z4aqIEBChC
         jvA3L60HEj08SMirC3j38omCs10imToY9teIh/arNISBKN+xJ8M6rq4ll5BcAg4qJL65
         HAn2nB6d26L00n7qif9LsxWChe6z1gOdIM2yBqAgjjB8n9goh4E40xgQ6Fk8iS7obq5V
         Ec9Xzn8cnhPGlZMjOOmTtAonajRPwH5m2HAmiRyaAqkGNSEJ0NLAw8Ib8d2QJjdvwWiE
         x7cg==
X-Gm-Message-State: AOJu0YzVfBu2SZLhJKK5TBJAB8MNjHeLDm30OUY3A8dD5JhvNjAFVMm4
	1KK5Uf8I21d5LXA4Km4NnMlennpi5Kd33t4WPDuaSmszxCPZ/YsXmAqi5w==
X-Google-Smtp-Source: AGHT+IFj6ckzf+w0uWPmFbESkFLSZNVzmttqbXg4WiPsToPQxswnTDT6fxrd5KNbNDpjqvbGNUzG0w==
X-Received: by 2002:a05:690c:dc7:b0:6be:28ab:d874 with SMTP id 00721157ae682-6e5bfbe7f61mr39747767b3.2.1729278834873;
        Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 68/68] python3-wpa-supplicant: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:55 -0400
Message-ID: <20241018191101.25184-69-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113055

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index b9c62ced7..bb0007e61 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README.md;beginline=171;endline=199;md5=462586bcbebd12f5d0ac443be0ed3d91"
 
-SRC_URI[md5sum] = "c21c7841f5e03ff709a0564b2e094010"
 SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045f94776"
 
 SRC_URI += "file://0001-cli-drop-the-second-argument-from-click.argument-dec.patch"
-- 
2.43.0


