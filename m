Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E9ECCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27207.1762704041904688872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNpfqxF2;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso182342f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704040; x=1763308840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcQAHxuOQAAQSbDEZCWm8iNZL2lWqtAxs+OJ827XJrQ=;
        b=JNpfqxF2O2PcCQJjEPPw2FM35kfvLO6imdI4NETj1e+jceilMspiZq0X8AAv3Qov1D
         AUHlt1+1fcZncqybRcBc8FvY9Igf9mIzPcnEvmaltaVug92hrLHr8MpI5NmojIbFqw0I
         H1lJWuZclywsCPkHGJEoJdgcYy3QLTSiXw2f9IOzkLRdpRJnvZPH7O3ZnokR7Ex49osX
         5frh0E5k9dRWCU3BStuRJGxP45Vdsc3QWfaFdXuxZLiXkzRYKQ4qvXPYg1VfzX+6ep4M
         mbDUUQX+23gSHOs7A2uZ4TpBy24SjIumLUfkcaoOZwXAHOZWhlFsqpT3z7NKKLoYl3Ej
         XOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704040; x=1763308840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CcQAHxuOQAAQSbDEZCWm8iNZL2lWqtAxs+OJ827XJrQ=;
        b=UHRNbYZ9FScu1FteEh83/XWthD7LkBo4hwrgaDMs0MXz+GSEzYN5gKCGHu5MVPFZjZ
         emxv95N2yKi+NaQmuUn7o54J5aDOFgi4FolUx3ZQC97Bl1XD51SJ/7KgPZ3iXzTnAFt4
         HgGfWl1/m5xLe9wcpMVHpru0qK3+MhrPMg8zA2dkuuq1ZMPisrEeaIHKtcfqgIC660Ay
         31i7GWnw5Xebjte731LpjYAzDs2ZlTCOqVERwIi5lI/wXTuCOCG0hJuPXXEs7VMUn4fx
         s4lMUaIioO18NffYcbLDlH65RGWuy0T0EcFjs9xaBrB5rmJ8LSsh6rfRWprAQW2evQin
         YEPQ==
X-Gm-Message-State: AOJu0Ywf+pUp3wsmNHr8rpKwSZFSuJxdPtqOAKIl/cnwxwRCy4bL8KGI
	I+OMkTrK9eZMOZelNYpVs50pDTtplfqeP4xhhzUmXqJcEPf8Ic57aiZ5qugVMAic
X-Gm-Gg: ASbGncsU/9bivOKDGquiVAeH78TU6jHjMZq3c4MBDlTFsY/xPGhFEmP8T4KjzkRIKSm
	47fcHR+0bK5zC2Hr4kpUpYndgpwbbIV8GH7MaWyPCMHg4Z6e8B/FB28udh/zqtfQmiK3iOBISLo
	BTgoJDhdpWkqqIF9A1xLqsIs1i2VT91OQmyYwykplukgezotXljdQ+aEGZMex7jYmGtBqJBxXwl
	TP9RTefd6lwu+aFVl67bvFv071Mg8oHpkr+3FTuQenj7VDC6TJAet5NFCgj7quEHuDwigi5xNEk
	bCGtrRl88yM5x6YcwkSf7wXjRNI453OuGZG6X0lWvYO90t/K7P8MYXvxWn+bLtBGx9nTNdXhgiJ
	MR1RKoRI2rGoKPlYZ9Jfelk3Pwt6GVS4ULqlvWKPCSj6W7bcjqz5sXkS741BIoG4KY9HC+gb9p+
	TQRB02VoYC
X-Google-Smtp-Source: AGHT+IFRDVkGLfzAYR69AQBMWL29bfnIwv0VBaUJ0YjYA946GeA7N5gehbF3MSW2P8jf4l5YA00d/g==
X-Received: by 2002:a05:600c:1381:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-4777328643bmr50214425e9.23.1762704040238;
        Sun, 09 Nov 2025 08:00:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 17/27] smarty: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:09 +0100
Message-ID: <20251109160020.2522353-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121433

The previous, support/4.3 branch is now called support/4.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
index 1caa4cd1bb..2f29cf00c0 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4.3"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4"
 
 SRCREV = "f4152e9b814ae2369b6e4935c05e1e0c3654318d"
 

