Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E4BCCA475
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.53209.1759151079238861051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Imx28yY7;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7322da8so901095366b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151077; x=1759755877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp62psH3zfBM+QBVKw0HPkuAASM2nxNQ+CIVWj3HGCA=;
        b=Imx28yY7xMa5xPXYfYbnyFv2Dfvuj/4dXWUNKxZY+42AitNlXbxxGIwkM+0VkNCDdt
         twF527qMuDvkMc314Yl/4sFso56MqtbApf/kzxk0Y1iI6gplcbKOKA1BWnpp/SmhnXWo
         zvbMwgztiNHlcpE+zFSw7DgY0sO408/TIDcy53nGeuH9DoMF7VY0bxStcpV7dLYy/9mt
         Gz7U9L6uY6J4VlNDQ6ePZEjKNvhDnDH23FIWprXPUg1ZM/AD9VOmnZW6jAbrjOF7US0u
         braMBexIP2lQMc5OI/PgVh3pg7ddR79L8mBth8nqVYm3jBmaJ51EapI3S3e0cS5eMnlj
         IeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151077; x=1759755877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp62psH3zfBM+QBVKw0HPkuAASM2nxNQ+CIVWj3HGCA=;
        b=gIJSzMwVBUskBUXOhuKgArxopdkz6yr4xfG5hp1dDa+0lF18GC6Zd2vyUmx9iFY73Q
         2lSkxetL0ImaKJAuF9+kVvSuCO+jsz3e1Ml/Kx+S20Ab+SLNV/qlwTdSeNOdUHtZwnLM
         W6Co85gRpLB7Z3pgv9FFrWgVGkOuaj0rVZF6GVI5lOqX91Kb5LPL9cWWz8gQemhYrjVj
         hjTFeJh+ipJ++P4VdmNK7sLngW3mNGeyPSM6A0bmCANu78zP63ylBk+DWzcrifJAddWx
         m4z//THtx2U7+fahiHLfPGox8wraeYqvES94UuGjk2tMScOuvhdrIBw7/kOhJcpiWPJ7
         UM4w==
X-Gm-Message-State: AOJu0YyvfjXUD88no7EniJFnE0Jq3AMdeW0iL9778PsS06CMKodaqpUT
	UX47pj2slS+rjW2uk1Z40o7YZ5VRXZ9QDTlyxKAglMfJpwMD6Qnyok0AWP2iBw==
X-Gm-Gg: ASbGncsrAJSICsRtgHfpOb7dvDN2W9ytc/WQhCv030VO6AmgISQk99eIfcEH9KwfGZA
	ik7dQKkR6dLM00L9JG8mJm5knuNzvG1PFCF4E/JGNklTf+EM+dorOW6S59MjkAlmpCQeLaNXNaR
	e9/Lyc8b2XHGjtvAmyJY/ZR0azU87e0SxibtL/8BL6tljG+gMx0aFhzfgDGMiDZUTxTa/aZqS+d
	IzR/r2vZz5pgQF31p13YVBKjsZ6XSsMpqkbn9d8fvwhvT/Ycxzx/FG87KAf8hBRZigmuTqesbIV
	vCajlmXxCB91VlkCjlUWXFs/P4Apgbw0KY3iYQ/eqPlQiQ5ApUOALbR+a1apBQ/eMlV3Os0/xh+
	lEilxa7G4ifOEk3qnZrre/wprTz93q84=
X-Google-Smtp-Source: AGHT+IHnqd8p+uMj4XYV5rFgRi9DR04i2yFw8lp/nwvSFB6FRefNMl5fFY8q5nhzP48BIf7xvd5KkA==
X-Received: by 2002:a17:906:6a23:b0:b24:a0e5:eb47 with SMTP id a640c23a62f3a-b34bd440ed6mr1706479266b.36.1759151077379;
        Mon, 29 Sep 2025 06:04:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 11/22] uftp: upgrade 5.0 -> 5.0.1
Date: Mon, 29 Sep 2025 15:04:14 +0200
Message-ID: <20250929130425.2912077-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-On very low speed transfers (<10Kbps) sessions would time out due to a very
  large interpacket transmission interval.  Fixed by putting a lower limit
  on the advertised GRTT of of the interpacket transmission interval.
-Sending of ABORT messages on early shutdown would sometimes fail due to
  OpenSSL cleanup functions running before application cleanup.  Changed the
  ordering of atexit() handlers to ensure OpenSSL cleanup happens last.
-Fixed missing timestamp update when clients read CONG_CTRL messages
-Fix to GRTT handling on server to ensure it doesn't fall below minumim.
-Fixed bypassed checking of existing files on client for backup
-Various logging fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0a58426ed073d48533276688445df3777776886b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.1.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.bb b/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.1.bb
index 301e0fa607..6d5cf4b628 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0"
+SRC_URI[sha256sum] = "f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61"
 
 DEPENDS = "openssl"
 

