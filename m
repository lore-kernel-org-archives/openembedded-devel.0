Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59015E9127F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15266.1770274810140901738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QeOZ+h5m;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so8019665e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274808; x=1770879608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sm3PBhbPMMtRbL5Lyrfz8MaQDj6hgYct+1lLARk/vVI=;
        b=QeOZ+h5mdyvMQycW9KDc7eX5XrF1/g6kH7ZtgHKtH2ec5k2OK3k47dzIM+rRZb8+Cm
         Db/ACRltwXWjnEVh1dqNYeJPQx69ZDKQyV5GFPQU5Cqvk5A6NfenJbcNre6MR7wr25rr
         xJTJUO+osSspGwkhZiGm76AYdp88Ag5Q2SIHZIM9RKrxT5n5qdFy0fjqXEKs7Gk8YY9p
         DtmrxKVoftVdvaf4r/iZ2WDl1rIz1QtjbmzwPJ1nUCKOeChgEqKo7Iw51zhgBPcr3mNI
         C+3lGGId3TBF1ddub3IAsIzuLSTSHV4mV+DF29RTEjxuBZrLXsOdvqYHex3xb3cVuvyi
         Uzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274808; x=1770879608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sm3PBhbPMMtRbL5Lyrfz8MaQDj6hgYct+1lLARk/vVI=;
        b=w9DSQkDQGpUJM4+QYSUPzN0rz/Zuyqo32bt/3GOMNr+7AiNOtUzO7AGiTS33jXmu/O
         dK9207Eumn2hPlzO2TyQpi8V1dALKo90QcwnlTdxDuo6yBbgFzQ9PyKVuHg56OZfKcCm
         0uEycZhOqum4rPda8ZO1psCD2hHGRf6JUxmBNm6nuPmssmVtTJMFSBAB6iQNpxzF5vXo
         PRQ6NoLHgEsdKrbIeUbG+NatuvnCToECulB2Bv1ZBX56Mczr/PvWpgZbVApALwO9X/25
         eUVphLX4aHePRUNx0Z9BwMMvBTKHtUwa3A19MIFuTVrPT5E09SXwemVFIGF8G5Fb5opR
         9guQ==
X-Gm-Message-State: AOJu0YymNbLy7DpSa14QLfudP90WrPjWKQCiSGlWfGd7Ooo0CKlPlPGk
	DYVHr41i6FYOvDEQE9TLST10I6537SW6IBQK5qNfac9+fzi01DV+HXOLYFA7wA==
X-Gm-Gg: AZuq6aLEx90icQeFyBK22+Y/ftYHFhx/Z9XqTqYtFi5OMMFFYTNojYS6cTOGIDGZU1z
	OndiPczJWvYE099pm0av8c9jpn10bTWtIb0fSDfGk3iXl9K1LcFvPXd0Mk05iSWdZiV47d57CbO
	0MVn7ar8xmQnVPfMhMVxHHvxeGNdxZPYS0z2/buPkWqmBTVVW0lv7R5DINnRso1MVn2PDwfp6xw
	qGNFIal9eVtqqqP2gYAE+AmTj5CG8uWESNDHdDKA3PZRTxYbJA3nQGf6b2w4nem+drphOOackco
	iC/jFem4iC7QG7+EAgitID1mw6kN77KSYl4qowL4Q2GOP4WeMHfUrTc10AcTth0HPP47CFwx0WQ
	Sfm55TfdHCD7PRO8TdPfHRkkn3TofZf12D5nQVNWJW2i3ROI1qrccOuJx6EvWu1393UPRoCxZdd
	9dttwEK5wg
X-Received: by 2002:a05:600c:1e1d:b0:480:6910:abd1 with SMTP id 5b1f17b1804b1-4830e966cedmr76890495e9.18.1770274808369;
        Wed, 04 Feb 2026 23:00:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 17/20] python3-werkzeug: upgrade 3.1.3 -> 3.1.4
Date: Thu,  5 Feb 2026 07:59:52 +0100
Message-ID: <20260205065955.1267785-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124193

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- safe_join on Windows does not allow special device names. This prevents
  reading from these when using send_from_directory. secure_filename already
  prevented writing to these.
- The debugger pin fails after 10 attempts instead of 11.
- The multipart form parser handles a \r\n sequence at a chunk boundary.
- Improve CPU usage during Watchdog reloader.
- Request.json annotation is more accurate.
- Traceback rendering handles when the line number is beyond the available
  source lines.
- HTTPException.get_response annotation and doc better conveys the distinction
  between WSGI and sans-IO responses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74aa2bdac6d658791af34881f291d91aa4dc57ba)

Contains fix for CVE-2025-66221.

From the release notes:
This is the Werkzeug 3.1.4 fix release, which fixes bugs but does not otherwise
change behavior and should not result in breaking changes compared to the latest
feature release.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-werkzeug_3.1.3.bb => python3-werkzeug_3.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.3.bb => python3-werkzeug_3.1.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
index 73029eccc7..2cfb5864b1 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746"
+SRC_URI[sha256sum] = "cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e"
 
 inherit pypi python_flit_core
 

