Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F20EC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:42:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.6969.1720087596013011598
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=YJxkIbtV;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.49, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367a23462e6so84456f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720087594; x=1720692394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fV1zgGxpta679cpiaT9LuQAzB+5vOa+OyLpmyT7FLI4=;
        b=YJxkIbtVR7cA9+3+ygfEBqPqwzDE+wYDD3CIWSU/HAP7ZlJgoimO1tLv5DgPZw/NXW
         NU30vLNN5onAnXh/8PvscFQ3zjZjduKCReLlvMoig2kRXSEvACSTi8Qednbx+yZHFzzC
         AOasEJfDB581y6qOj//CEV8IZOs5iJu3JoGC+XUmfRCL8I8PCSMOzLtQUImKWqRWCiu5
         1QuQLGWw/449CAoI3G0NzOzXGKKayeUHWbcgMD14PLRpGGo+MP8uT60eeHO3nVaBOoaU
         Htnt509riaPWNQTqPVNJhtTVEKZOQwT2ZtuuJuKr3hZHyVNuhF9ogwbfL5deCmaM6isY
         OC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720087594; x=1720692394;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV1zgGxpta679cpiaT9LuQAzB+5vOa+OyLpmyT7FLI4=;
        b=lQyTfOVW1K4x37gShhqSJH2wWOQ1kItV8qYFMSNZwnTSMD2ei16W4Wv8UXn/WyfQ1E
         dafHd/VS0LYltlIoOdXo3nOzao30jCt8NW0r6Npn05nP4YAMPHSM12i4qfSB4HZLD/D/
         YRugdIy/u1VKqUWFjk0AmkjfRsFCOMXGTVMS4Z6sGNV/AGGwnMiGdK7qBal6Jwm3C7Z3
         +2bfqEN4mdEg9R0d4s0N8BFAIZPa5oEkEJ2IwbgOEYVWWOb97TgyEavf05qSZalmlZ3p
         U1YiNhafaoaAxiMTsgrqvnLh2zJgWMvbFwadK/a3Xj1E+ycndMljJMtKuh/vCrMGKK7i
         YcBg==
X-Gm-Message-State: AOJu0YykB0Nu6iZolSi34rUkMSjZgCCjZ/N/V3m293CUbylz1yilLAV6
	H6yuBbrD+ODJWirpChhEA6qc08mj6jPo0eXxkY1e6hC0O4RHakext8cHBa19SCOjQVNk/jduJHj
	v7E4=
X-Google-Smtp-Source: AGHT+IGyhz6W3URsG+wdPvAwy+RA6A3otAhtgsp/yafP0tuATR/f8ze9gftaHtKu1xhkcPBwA2eEDQ==
X-Received: by 2002:a05:6000:1245:b0:367:88c2:bcfc with SMTP id ffacd0b85a97d-3679dd15b9bmr954654f8f.1.1720087593674;
        Thu, 04 Jul 2024 03:06:33 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678a648dd3sm6034265f8f.89.2024.07.04.03.06.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jul 2024 03:06:33 -0700 (PDT)
From: alba@thehoodiefirm.com
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Alba=20Herrer=C3=ADas?= <alba@thehoodiefirm.com>
Subject: [PATCH v3] apache2:apache2-native: sort CVE status
Date: Thu,  4 Jul 2024 11:05:40 +0100
Message-Id: <20240704100540.7316-1-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <twxvjz2rxrxu57g4hngza34g3athhaqoppgxffg7jbtt77ectq@zh35actoa6xs>
References: <twxvjz2rxrxu57g4hngza34g3athhaqoppgxffg7jbtt77ectq@zh35actoa6xs>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 12:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111252

Signed-off-by: Alba Herrerías <alba@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
index 265313b3f..ab19ff1dc 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
@@ -37,12 +37,12 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
-CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
-CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
-- 
2.40.1


