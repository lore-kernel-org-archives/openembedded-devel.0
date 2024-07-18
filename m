Return-Path: <alba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9FEC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 15:11:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.17431.1721315455151906481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 08:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=NCjXbSSb;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.45, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso598363f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1721315453; x=1721920253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6RXce4naF8+yXajWSMyyGZrgW03PGTfbCOpxKlzUYVc=;
        b=NCjXbSSb5uCEuiEpJT04Q1vbal9TZR/77EZYsDPmC6RIFkVeCfaUP6Z/oC6ZNLgfuU
         sLq5TXohzn/7g/+/qfuOUIZuxH45yu7L524+rf812JTyw6hnAIoy7hh5PJAykC9ysD3j
         CvXvxbMbWk3ubNGxSfEi47NiyhugL4YsPviU91lxmr0aWfIUFXPzEfwz61Wc9I01GE04
         upg//IyxLXGiSXlaXBY8Vc+FqqYuk6B0ifR/yr8dU4IVXRsclaMcOotXDJdrcErYQzQd
         HYIwiNVrGDo5AgzGUYxcZwMUsJB1uHVdTSEokFjfELJ5V5GMuHq7WhkF5Li1Me2QYx0i
         x/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721315453; x=1721920253;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6RXce4naF8+yXajWSMyyGZrgW03PGTfbCOpxKlzUYVc=;
        b=cZ6OgyWLGuOH4YgCyXT16w8ciK19jgL/qNDshoErTMrYfyb6OBh72vmQJi8kDea6a3
         Jlw3YQNMzb+L4j2DnmFtFKYXFv2Z+0cW6qEoCVpBGSRYptGqxumE08mCq2RVM2QcjzjE
         HfwZuiFUH1SD6HWI/v9Y3W1TJgWsZzl6czwh0eoyolbFOinqRhPTH855S2J7M85+p3Z4
         5d5h7FEBOBYphWy5hqZElZmfLadKk7Gu4j44pz7bGYo6UzI9/Q91i0H2Ii6CkUQxrO+k
         YCEzf9goZuKRqMOpYmlYJrKwb8kyiNLjSFl0y+kYHgDrWXog8lVkT9rnDZLObl218q0D
         6wDw==
X-Gm-Message-State: AOJu0YxgCQxUIWi5CCJOnW+zf6BhCIHTHDmr1VLK+85/Ibk/MYfRaRz0
	o7ZSEcwnT3spUnNYoi0QAzpybJlibGY7RVQfH89q6TeEg0Thv8klLNudDTNWzCK/Cyatt1j+Xuu
	CsyU=
X-Google-Smtp-Source: AGHT+IEKSY9+opMSFKhdGPw3cdacquRU0ZElQKHjNTMGYgIKwizV3XZTZW2dMsj4AaLmI/gQ+lhDEw==
X-Received: by 2002:adf:ebcc:0:b0:367:9624:f369 with SMTP id ffacd0b85a97d-3683163d5afmr3292849f8f.16.1721315452946;
        Thu, 18 Jul 2024 08:10:52 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685834365asm1765989f8f.64.2024.07.18.08.10.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jul 2024 08:10:52 -0700 (PDT)
From: Alba Herrerias <alba@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] imagemagick: Update status for CVE
Date: Thu, 18 Jul 2024 16:08:58 +0100
Message-Id: <20240718150858.15859-2-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240718150858.15859-1-alba@thehoodiefirm.com>
References: <20240620161048.75491-2-ninette@thehoodiefirm.com>
 <20240718150858.15859-1-alba@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 15:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111401

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Update status for:
CVE-2016-7532, CVE-2014-9822, CVE-2014-9823, CVE-2014-9824, CVE-2014-9825, CVE-2014-9826, CVE-2014-9827, CVE-2014-9828, CVE-2014-9829, CVE-2014-9830, CVE-2014-9831, CVE-2014-9848, CVE-2014-9852, CVE-2014-9853, CVE-2014-9854, CVE-2014-9907, CVE-2016-10062, CVE-2016-10144, CVE-2016-10145, CVE-2016-10146, CVE-2016-5118, CVE-2016-7513, CVE-2016-7514, CVE-2016-7515, CVE-2016-7516, CVE-2016-7517, CVE-2016-7518, CVE-2016-7519, CVE-2016-7520, CVE-2016-7521, CVE-2016-7522, CVE-2016-7523, CVE-2016-7524, CVE-2016-7525, CVE-2016-7526, CVE-2016-7527, CVE-2016-7528, CVE-2016-7529, CVE-2016-7530, CVE-2016-7533

CPE is incorrect, the current version is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 8dc3cb267..5407c4e40 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -100,6 +100,7 @@ ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
 
+CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
 CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9805] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9806] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
@@ -118,7 +119,47 @@ CVE_STATUS[CVE-2014-9818] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9822] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9823] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9824] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9825] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9826] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9827] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9828] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9829] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9830] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9831] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9848] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9852] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9853] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9854] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9907] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-10062] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-10"
+CVE_STATUS[CVE-2016-10144] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10145] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10146] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.6-8"
+CVE_STATUS[CVE-2016-5118] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-7"
+CVE_STATUS[CVE-2016-7513] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7514] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7515] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7516] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7517] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7518] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7519] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7520] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7521] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7522] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7523] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7524] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7525] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7526] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7527] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7528] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7529] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7530] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7532] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7533] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7534] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7535] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7536] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
@@ -128,4 +169,3 @@ CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
-CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
-- 
2.40.1


