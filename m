Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B64FD40D1E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.31205.1730840504297096884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIeQt2Ob;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3c3da5bcdso54795737b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840503; x=1731445303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHgNVp0ah3xvA7i64EH4KbTbS8tRY6RYi29KlsBxRa4=;
        b=nIeQt2Ob94XZM1KW6xuwo87lIVpDNiiheLIkZ3R3MGLp5sBNADS/QNgBv+cbSFwgqy
         Lqj2JiWNZtgXr9viE5PgFyUwS8Nile9BPXARFLZGtHxfkZdK79zwN/EqLIOnI2UZ/+ok
         J6Pdq0z8f5DsEacGIQmiQT3sYtZ6xVy4PvLmSj+J2XtjHP4SJ8ufLgZI3p1e1UORilxS
         B86HAJHxqOxDxdcTxbMqoOGMIC2mh0yjKX2luNh7lFhp1+IG85vNJyRI2ZL08H+ZEtOw
         JyIDJkN7X8rgTS0m9RHCVmtmK99WhZvo2CIP4h54aclCQ5lNTW6UdAftz0JAM61kU6Cb
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840503; x=1731445303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHgNVp0ah3xvA7i64EH4KbTbS8tRY6RYi29KlsBxRa4=;
        b=WBbb7oZ0l29wOzpH1zLzwZEEGKc94yMKM4uvgEsl2SJhveQhyiEhSRLDR1vnlanPBG
         36h52d4DU7GYk8eorqzuEyKuCFVR9BEKbAifBszyTj6Gw36IIbeakDTY9K9iWbTp98yD
         HNHx+We8Dxu3cAkFBl5TovRbbYdEj+wg4XoKbZXAzzX0k2CDtmIrHreERFaogp8kSSfi
         0rW57V97quryPworIRi1mcg8/9+fcs52tKhoPbKHw0EbwkywK17lG3prk9xNgTmK15zB
         CVeGyTfx7b7z4zldip9mi8U6+QcTaBiAKw7oW6x1WyBaHf8C0VxAQD0Qj8d2HbNKf0tg
         CX1A==
X-Gm-Message-State: AOJu0YxS0tRiKWSurx9FvS1t5g7piyjCIHCTNJOKoIfN5wQYm+0VYOKr
	OFkYZahOfZuGR7a7Dc6bH73aX/i+Xgkh+sNd9OPsllWn9R3RYtatNJgo18Tm
X-Google-Smtp-Source: AGHT+IG6OeONlHJidVCfNDAfzfdYMqp+GT6aL68dHheDHv5Qmgu/DGzikwefQaE01N8/I3d82iHx4g==
X-Received: by 2002:a05:690c:38b:b0:6dd:beee:9218 with SMTP id 00721157ae682-6ea3b96ad1cmr253728107b3.30.1730840502836;
        Tue, 05 Nov 2024 13:01:42 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:01:42 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 156/161] usb-modeswitch-data: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:02 -0500
Message-ID: <20241105204707.4155-156-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113672

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../usb-modeswitch/usb-modeswitch-data_20191128.bb               | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
index 351fe44d7..2dfcd886c 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
@@ -7,7 +7,6 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
 SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
 
 do_install() {
-- 
2.43.0


