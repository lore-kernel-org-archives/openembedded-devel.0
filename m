Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95682D3E799
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.30067.1730837383933833255
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kx13a379;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e3c3da5bcdso54280957b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837383; x=1731442183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIkIkLiGcbAfbLLF2KK7jM1hjXnOGo6pCX93uQvR6Fs=;
        b=kx13a379m1keeGBdY/j8b1yj6cqwHlfhBXlo4TXEHMLcAqSeil9oBofvZMfd75ZlCk
         a11SJIzJgk6ZRzgpVsZCbwzs6rGPUT2g/GFlM/0+6UO51HESAC+41q3A8rEQ7BPWLz92
         lBDEMbR/QjTPtLQwIFhzGAVs5qDBAubrnEsjZwlNyxaij9TtOMP9PNI2HjhII7+LbHQG
         8GhbpHRwn55bLMomY0ANjEVvDCh/zfBwfPML44zrwV+RxPrXFqk0MZuB+ciz4udNuzTD
         NHjBloL/uNDNSQolFq7cFGY5GRaw5NvZHtmNqwRIGQ4V2cvsAFTnEK/Iu2ghheDl/CKO
         oylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837383; x=1731442183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIkIkLiGcbAfbLLF2KK7jM1hjXnOGo6pCX93uQvR6Fs=;
        b=YDF291fkovnoIc8+5ZAGwvez3e/hMbUpNujCllf1aaWXl0zLeZRfBJMK/jWORSOtd4
         uBWbEizIMZe5GpD3bcCSiCNJFU/iEcigSMAlAhRNoS0ra+790gQpSYBLrNzml/YX/rFk
         w0BGRjW5hPL7w/wJdvg+ulqEmCv456tSCNVhCBv2e/CjM2Bz9Qx8diaNl5K6odicGxTs
         A1hKBeWxk2ZTyfCbDp8yhxK6zRG2jruCakrlxfGZ6R7vdK4xzxBFeN2eCk29GAS6ly3u
         KtGpm9jVqUM5TuZTec7Sz9h6N/8RmSAycKbk6cwesjd7wYfHLz0dPOwJj17jkPb4zP6c
         9I2A==
X-Gm-Message-State: AOJu0YxYd0rNCMRTbqkEScpeUX1/QgHCWkMNjykvUGPYbSeREgCk0XK8
	v+RpSGsAAb7+1SccEUvoEvhP4qxfeCNfUVag5ZDpA6XY49VFJhWUiHzLhJ8w
X-Google-Smtp-Source: AGHT+IGozS4NzWdf1evCcMFQ/x/hsUY/rvy12tuaze4XJSJDJWvD4/t+oKRnK8LHGddyBnip/KLKyQ==
X-Received: by 2002:a05:690c:438d:b0:6db:db51:c02d with SMTP id 00721157ae682-6ea3b8c363emr168919867b3.25.1730837382666;
        Tue, 05 Nov 2024 12:09:42 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:42 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 106/161] libmms: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:56 -0500
Message-ID: <20241105200651.39395-106-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113624

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
index 62c20c612..9fcb8a1dc 100644
--- a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
+++ b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
@@ -6,7 +6,6 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "d6b665b335a6360e000976e770da7691"
 SRC_URI[sha256sum] = "3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f"
 
 inherit autotools pkgconfig
-- 
2.43.0


