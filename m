Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD15EC41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:11:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.57216.1720030306420766290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=kIBJwhFC;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.215.172, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-707040e3018so4138532a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720030306; x=1720635106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+YXAfmNjMgPucJ9vlAjrwcPj1bCuPh+BBjHA9sjep/8=;
        b=kIBJwhFCifRJdKKE0lk+0cS4xIKv7w7V2UkTrOHzKleIiTP8QtvDPjrBekw3HkvPLb
         iI5jMN6k5ZCUDz+9p4gku7KnmbTkdH/Ca+7jmtem3Aptl2f5DCf0f9r1nCvefGIPbKYj
         iX0rWTIUagURZjXdITHAnLsWQ0v0haBcuUxjoaEtVPIztaP57eJxSuikxN97bhJ+pVb7
         /ht3P1q0BSvZ2qV6ZaUk5uitgT3TUIcaJ8/2QwpRRyqmCWFbNEWLn7z4YnH2evCekGVm
         f0P2Fy8Ia+b8m868DEcxqGUC9cKx0iCC6quOOLGJgJUsIKQ7SjljqMxJLvw7mS4QCrNk
         BaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720030306; x=1720635106;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YXAfmNjMgPucJ9vlAjrwcPj1bCuPh+BBjHA9sjep/8=;
        b=LFI7Cm03iT5me1BxfJp5RIqvXwhN8B8UcxTKYxMKHAf7SB6HhBOQ+wWsL2wtB0vCqN
         ZDHwoarfHneU0p/zKse4LXxccqnjhJkXYHNfNV1DbQMkLq1rY//8dwr1/Sc2RXObZRHt
         zGz5VVYYamMHraWl1kIQZA+k+NsRrgnDU9WPMBSKm29p6kyCF6TDG5dbViFwnQf++KBB
         44M95boPgzKi7Jhpl2INuzyED+Ha9CS4qjY+OMpmhc6nAqw702VAglpbQcXBJap5/5by
         HzAr+PQ3ZycubT08fbMpXZDP6JVwJtSXtqNRGIUcBKLxwTGpTBSgkFtoY8v72EkBPM37
         IO2g==
X-Gm-Message-State: AOJu0YxRuCoQoueDggxQFiQLqfQsuNjjbvTWXi7GP7B7F5+o7VqG3Ipp
	TVJUjN5ws883Mf6Vg5/J1jfKXNHtOoPKIqH+AcmvFQvvltk6U8Pnio47k9SVaUBSUfeO0hm8GC8
	g
X-Google-Smtp-Source: AGHT+IHq4Pel1DE/EeOZsA5K2h/nFWscJYbf3MwhiDl7lN0o+dkVgxiVQVKGtsIV4WaNsrkO+ZyGnA==
X-Received: by 2002:a05:6a20:7284:b0:1af:66aa:7fc7 with SMTP id adf61e73a8af0-1bef60f5f1amr18700293637.3.1720030305811;
        Wed, 03 Jul 2024 11:11:45 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfef2sm10720352b3a.125.2024.07.03.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:11:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] yelp: CVE status update for CVE-2008-3533
Date: Wed,  3 Jul 2024 11:11:39 -0700
Message-ID: <20240703181139.92635-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703181139.92635-1-ninette@thehoodiefirm.com>
References: <20240703181139.92635-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111242

The current version (42.2) is not affected. Fixed in 2.24

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 1b3ded021..69c421662 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -39,3 +39,5 @@ FILES:${PN} += " \
 "
 
 RDEPENDS:${PN} += "yelp-xsl"
+
+CVE_STATUS[CVE-2008-3533] = "cpe-incorrect: The current version (42.2) is not affected. Fixed in 2.24.
-- 
2.44.0


