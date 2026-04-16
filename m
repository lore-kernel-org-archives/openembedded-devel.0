Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A902BF433F8
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7041.1776318673534167211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kjGRPLmn;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c565dd3a7so69555c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318673; x=1776923473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1gW81LkUW6svJFVU+ujPX2/sasYTyCS0uvviz5i55g=;
        b=kjGRPLmntRs5KfUeNni0myjm7EmskHAHlv/Ffyr17Iu+lZUGLRuw1KMUbuM3e8wtMZ
         NvNu1EaH4YQNcljHBTDMJG2cuVAeFMRioczvEpMqzOm4Cqg6c6YND1/6qLUiLGmyNpVX
         OUGIBUSxAPK/G5iWhxNksIsHuSO0zz5U+JppfTmN//APnij9aecGtIjkoQwDIzBjS9B2
         tqV4ev3T4mva5/y9ORTw1GFLAuuz5t58o/qQYXbEZD/BLhaQoHe10VdF38G6TNJcSXGJ
         xGaM8y9LoGR819xtNQ6zpYHJZS+rC6q0/Rn3rvAyHdZ3F8Ha1Cpgs7jbX+Dck0d0O23o
         b6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318673; x=1776923473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1gW81LkUW6svJFVU+ujPX2/sasYTyCS0uvviz5i55g=;
        b=YKRVp9EYhZ6AU7Tad0umzG9Od1bD77OgCraDDYh2/o5CEKHlCFBdggyo7Efyle8R9n
         0DnfYGcE30nKR80s9Na9lfJduWtUdH8QQGESrJyk6wEAb8x6fbx/VPlFGT0r9GfS6ZyH
         e4p4g6gIEA7dmH1liYqxFdAuFur4rbM/biOZ1smC85EimYjsXqeqqDS7lNtbXKgIk9ST
         PwtkHpnj9P0W5U8SVpGnz8a8Cp7zOd7h8i9qilBJ7SEG0riQKd4XHMvFOIAaLpDPxyRF
         MQntTnzRYNFwtr7YWF23xVVgIFTMfuEl1zew3v5ofjc/aSfSkIB8BeXSQy7ojsuYBMT6
         5I2A==
X-Gm-Message-State: AOJu0YwIlVqb6aXpBD8sQCXQQStEzQtOlOr2CBg4hgQNr5ebntnipjys
	rm9i7pStkM2hOWI05VZ9eUnw5Vz6fvsahT1iZXaospULIOwtZfuIcjWYroJPp9Rb
X-Gm-Gg: AeBDieuf+G1u+zfkLhIbD2d4cjtDXDJkbiDljbu67EAjubMEiVWsv1oIeYCxPPyZqVJ
	3AbTlGUqv0Y5acKbSXRtX8g1ApQGttD0qpyTOsc8hr6+imiJw3X2aOF13tiAVCKfOL2b6XFltaN
	abRlxRjX7by0eLBMJwthy1sDup1Ttt9vOumvIOEaX4sFQMDzl7rUiUalrL3m9l2pPfG85muduYc
	j9/C4+e0CWwbM5dJkd94zqXyN0fom5mRX1sggNlFq5IGkUmfogSffKaogHEh6ZDHPN4zlGm7u6p
	GR/GbRLieeTkawQ9ngZ4zxIOTneVhTQrfbliuKICmCH1T7jA10FhMKmypjdIr8Sj/FZ4Sb6pF4Z
	R4pRI/bX2qE0arX6zrIUipLYL1rmgdEGjp4QZz6+kbsbFVssaFGNzNOpQezP1wkqJ/h4dgKxiPt
	Cg79LbrSKhsZEELp6wpM6AdK6je5tpDnTVFn9xCL6HoYSvrWjusvJ9dU3cSkkbzp66vmYPFjk+h
	Aqjqbocj49mFr81hyh6adqqVkY3w8zkz3512hkRWSjo7y8oyVLYPXDYa/II9S17arl6gFr9SryT
	bxBPvIGXUfARCmG4aCwGyN4/eX3EeV+55PKHdbXbr98jK5R62+k=
X-Received: by 2002:a05:7022:2229:b0:12b:ec67:3529 with SMTP id a92af1059eb24-12c34e83e4cmr14383526c88.14.1776318672576;
        Wed, 15 Apr 2026 22:51:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/18] audiofile: disable C23 support to fix configure check
Date: Wed, 15 Apr 2026 22:50:50 -0700
Message-ID: <20260416055058.792189-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126389

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Drop enforcing -std=c++14 as thats no longer needed

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 6ebb54e261..c837dad87c 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8c

 inherit autotools lib_package pkgconfig ptest

-CXXFLAGS += "-std=c++14"
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"

 DEPENDS = " \
     asciidoc-native \

