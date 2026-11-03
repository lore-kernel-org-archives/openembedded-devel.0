Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7966.1793701449535328280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uvpTNyVr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so304426f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701448; x=1794306248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDjZASqV7LgAflmHFuEH5oZmrGTEXT/I6tcMwUbWgv8=;
        b=uvpTNyVrmf9tSxZDLWoJf9C7fN4XETmI5oa5B0kEgVwEV/Ww6S3CSW5N18ndW9S99i
         7J8U0L8WYDj1bRS6tI/OetrWPd00ODuLJIdBkYdDAT0gJmlyszhXzKT27QAg87c5JMLg
         NPl1CI0OG4lbyz+kgeyyl9G4rpMMFpzdsinBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701448; x=1794306248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDjZASqV7LgAflmHFuEH5oZmrGTEXT/I6tcMwUbWgv8=;
        b=PNMYsY8pt53J07Dse0vmUfljRl9f6mWNpyANnap698eRkP3OR4AljkcsVk8muxTObX
         uPnX2Yy1SoGtG/kyJhMvDRInMems/3QuOgBwoSlIcihFfBS7JaUM3bqXtRAt2+SEn7ZO
         eF2AXtNKRxoxkEs6JgFDa3MCyTCY+gEFi31PhXr0o8q3cvqMYQvXXCBiZZm1DIxq6f8a
         AhF+urxz82+yISVDCB+QF9XfiQNbqJINGwXfV6Mrqk9Kgcv20tNgk5fS8Hj+HMK05LoY
         yaClKPSMAclQE7iYSDWrsg3ovC9kV7sgH5YKt5v4bfeYgoBHJUJ0m/Xaap5cHljggvtj
         52xg==
X-Gm-Message-State: APuU4Z8X0wC4U21w2vunq6QwZZnwpCqjj9q6+TVHJqyaJfmEeeKpFU9n
	eC4taG7AqcoNzJwTFY5JelYbiViV1SkQKk5bHR4bxbOtXRbpUQDE5umLCqCajxEuex2+yK/XPTO
	OlJDU
X-Gm-Gg: AYBFou0NjcwFiwZjcPZQatO+RlhjXlLK9JRYVyFLzeijt7h9wU8s6gLjK9CA6suIcVv
	DDa+szPwRVPH98+NXI9tUhwshuDwYwqXBeakJo2UwzgTlpxkbqw3wWxh02moS0We27MgZru7pfZ
	tAOv4AHiU65VfQs2fLpFdmrFGoJy2BZZkGLSkZg14RolzA9jTMdqGZlaF5t4YBQR+UoT2q9qyXM
	EhW9pI09LZy/fMxU4kfLZ4WPLMRCyn9PkKID4mS2qsZDVyxgK3LhSf4zh5XcC72AWss9zjWLlg4
	ZL9YUBMmpvVyASYa65KkKM3dJxI32YSdv/ERwZ0ETzhz3Eo/6SiFFHvpNp56KmSmi4gcbqMKrei
	3eY3Ctjxy9nOeIA9F8jv8LWVjRqO794U6VYOIIjZK5Qc1iTisp9zK9Srv3m7pnI7/KgCbAiWG7J
	hLfEvQiTbAKN7KcLFu595U/2UMZ6eCXzImmfJEI7cBh+mrk+OkcwrQCxM6yjcaTAapaek4pkGY/
	yYh39P8/yNnrUHNNlKAyI6b2Vdp8ydDROMH0O4FcNO9eVrHCasE/z1k5l/2R33SKomZjd3Q6W5p
	8ETbhCwPzBV2ugDPLpP/8rg4PYqDl+MpOeUz1oCWUKuoA/GAokiXJc0XlUXzqwHvRoFc6oQPlTu
	0R+Dj8a3AUTG+u2dfcbcK5Hx1u+WwNMMGEi0fhrUIAoUAZo6kxoOmHA==
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr294505885e9.6.1793701447623;
        Tue, 03 Nov 2026 02:24:07 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/22] python3-cmd2: Upgrade 4.3.1 -> 4.4.0
Date: Tue,  3 Nov 2026 12:23:32 +0200
Message-ID: <20261103102350.1952237-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131767
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.4.0:

- Fix history ranges starting past the end
- Fix History.truncate() leaving session start index stale
- Flush window title updates without waiting for a prompt
- Fix two races behind the flaky pipeline job-control test
- Add security policy naming the Security Maintainer
- Preserve history session boundaries across list mutations
- Track history session membership by entry instead of index
- Preserve live history while persisting a bounded copy
- Address review feedback on persisted history copy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.3.1.bb => python3-cmd2_4.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.3.1.bb => python3-cmd2_4.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb
index f7f256e5bc..07fa8f46e8 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "708592210dc382510ee090ad7928147060bad1b460cbefb1105f8d1251376ed8"
+SRC_URI[sha256sum] = "6655b92e0231a43f20eadb6fb9a1ad54f8b9c9e716b4ce493542044f0d3ca926"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3

