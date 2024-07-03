Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EA5C41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:30:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.58362.1720031446362588180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=dApv2Dwc;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.215.171, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso3394738a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720031446; x=1720636246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXLLVpNw8P3ZMHyXDMrzncTQvhSuynB9sq2cAoDJ6TI=;
        b=dApv2Dwc3ggbwY5NbvBbr7+LopUD4MQJM5PPDRfKbURGFOYeOwV18BjwrhN/iRne6W
         PKrRkKEEKRrbHp6SOOFlYYRLnfq8Tm8wRHIZOr2iNeOHcAV35M8q1KGZWc29qyLV0UTT
         hpRniOGk7YNbmp7w5XK3ZyM/OIqPnAUVBDooepltdG+VNs+13RRhthtf/jJVy/9MD6iN
         ebbqS3WpwFbOXxlr/mssUsvFzdal0K1PM53dJwOVGu7KEU31o36ZwG53RfhDWnUDD2uI
         MZOHd7QQ4r7egzPDfpgkALPiTDWynGewdvL0MPjzVedmWHnnwYScjs7VA3ntQulNXKiV
         xSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720031446; x=1720636246;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXLLVpNw8P3ZMHyXDMrzncTQvhSuynB9sq2cAoDJ6TI=;
        b=wZFebaHOothDc9qi+NjBdhe7OHXGqraiMxLZ8+WE4WSWIuy85EyPkRsz81HdWx4n/Q
         BAOTnnfcjqJYNrwvQ0PHv1YvfQ1PJ+TmiTL8htNBZhuwQGpjDo2ploDJYdLTmL7ASY/J
         CI+h/9Vzp5KqsVC1hfqoRJPKlV9rSZGhCppMJ3tfUm8phpkSXKdAT1DBrt+OqZcIH1B3
         x4AINvqjelh0zamHw8lh6RFtnxJhfbr/jpUPiNZKrj6DXH/ciBeVgVuLx6PuMB6sJOaG
         AZGfoWBWmK5jwlcdhGZrFHKXftOs7XRU1hgxthD9d1XAZLturg3SolD1ISjmhrkEbpqs
         jw4Q==
X-Gm-Message-State: AOJu0Yxm2kEvjdx3g3GsnMzzvNshn1L6u/TIZqlrvQKLAdQN9k0Rp/3E
	Lfmj1u7804Tu/pOs2RUQZUExey2SPaKjGf/y8GlTINpQNsOOxWx8Mh7RwhXUIm25ggEVc8WhHir
	W
X-Google-Smtp-Source: AGHT+IH9/4ycQd5Xbg4VEcpD23qVM4Z3Dm+OQVTag/Y4Y8X+rFP1++VAE4nP/FhWbFZW2U39csm4Cg==
X-Received: by 2002:a05:6a20:8425:b0:1be:cfb:cdd1 with SMTP id adf61e73a8af0-1bef61ed43cmr16965865637.39.1720031445707;
        Wed, 03 Jul 2024 11:30:45 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf652sm11082210b3a.99.2024.07.03.11.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:30:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] monkey: Update status for CVE-2013-2183
Date: Wed,  3 Jul 2024 11:30:41 -0700
Message-ID: <20240703183041.8844-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703183041.8844-1-ninette@thehoodiefirm.com>
References: <20240703183041.8844-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111246

Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 5bf6373a8..f10262366 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -90,3 +90,4 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/plugins/auth/monkey.users \
                    "
 
+CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"
-- 
2.44.0


