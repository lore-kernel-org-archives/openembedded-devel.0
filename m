Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8042.1793701466563428148
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eGTpXjWz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso37905455e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701465; x=1794306265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWmcsRiQkv/qTs9zrrrsbWUSpBmSCMtozz9++HPruqs=;
        b=eGTpXjWzzDFt1w+WL8ip07XakQRP9W4QRcr7WcxJs14ciG1HUQfzRSLqzcc8qxo8FM
         JPNed/lfECPxXMMj+xzcQW6qTfS/2uX7WTCj/JYqN+Zxuncff4cewDGmn9/AQF2ILKg7
         oOgqWr5YDe9bZlOAhT7fN7TjL6W+/InwTUu6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701465; x=1794306265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWmcsRiQkv/qTs9zrrrsbWUSpBmSCMtozz9++HPruqs=;
        b=WH7lHrjjYSLX6OXluZjxlE6n0nezXvqwaNGibX+MegFE5OsrH13DWbipPO3rS1sCUt
         VjG/BYNOM/6pq0EbV6XxfYSmragYDix46hBmIjKF/kjVfNrReNQCF2LoI7T7G59OrRMb
         XuN5VS4NLpogZTbKv5iRUgYRryGKrMyYUk89Y/dHe9vkOf5TuBtmZQM+BHGorDCjJyIb
         oswNpzIwE6ys16CKKYyYmI6PhuAvQmfoJixXBZHNoNuo4aqxFjW98oV4uOBp9VqTrKgI
         b/7o/27XWJsqgLo9Zz4okoW4mmsUqBohToOnvrTGd2ZV/QfCfoNU5qxD24F+DdzlMavL
         MrCw==
X-Gm-Message-State: APuU4Z9dSk6fqisE8woY8c8Q1r5giSCKnN0/b9IhiON5cmMdwTVhk7q8
	Q+TeKaTwXdr/cG0v2emL3/uT1IR/iOpxHQFZ1X7XbhKItCrz1USvPbD+js8RYqxIEC/zQJSDQ3j
	Y91bz
X-Gm-Gg: AYBFou1+KQTM+8h7UHvg2HZcZdzdtDabNNtbNVyIyzEf7upeNiybkukbm1+N/D48x27
	bU2MUDLZ/b53zjPaWZQ+Nc2ODZaHNkV+La/TgssiH3DEiRqdTipne6tiYRmmd3+FnjzQGwzHyS2
	+T5eOwCRPWKakiRMOeN7pS7vEmZDyThZQ8hBhgSfUKxh3SULDqpzK4w5TcJDSwjEL5ho7VA7Geq
	ft3IinaMUIwNB2sgWNogwUvXBKB235oK+RePsy2V4/MolM950trkxiyVC4uDA+aBzkrMRhCBthG
	4rwkpmfnI13uf0ghK8mZ1CAWxS25DgAtvEO2qW+3KRId8dDvcUBGI2P5EI5nNGFj+KLLolFFPTM
	mE3aq8DKw5099f3Qh0xoBcpU16qel0KBoW/KvVHeys5Q+5diAcAf+R886oRd3l5tTG6kE8l4W2/
	QBGmrQ5CY73I3RVj/YeWmD07ffupE93iEQXS7Ffx5+OavIBJTSxyKDuoNuXcoCjIgENgY9auT5r
	pAs0+BelW7cjfCfVLdo1cBf4YreWF+8BJ1ME8DcnQugX5VVDM5H7OmsXP9KG98gFNH1tPMJcOM6
	o6tyK4Y/CIe01ehRL83yNHxIXqnuHldSKQEheEjBynyh1LYsrmab9OWRdSkTZy4ewMg+nJs3Zj0
	eLoe7sP9cfFbqeEBH6FAD/2yCXV+HWsyPgPMPHiiWjJCrbJZUYtpaIg==
X-Received: by 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr298392995e9.17.1793701464846;
        Tue, 03 Nov 2026 02:24:24 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/22] python3-python-multipart: Upgrade 0.0.32 -> 0.0.33
Date: Tue,  3 Nov 2026 12:23:44 +0200
Message-ID: <20261103102350.1952237-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131779
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.33:

This release lets you cap URL-encoded form fields as they stream in, and
fixes several upload and decoding edge cases. It also drops Python 3.10
and adds Python 3.15.

- Limit URL-encoded fields while streaming. The new opt-in
  MAX_FIELDS and MAX_FIELD_SIZE options for FormParser raise
  FormParserError before oversized data is buffered. Both default
  to no limit, and multipart forms are unaffected.
- Nameless uploads no longer crash when spilled to disk.
  Uploads without a filename used to raise AttributeError when
  UPLOAD_KEEP_EXTENSIONS or UPLOAD_KEEP_FILENAME was set.
- UPLOAD_DIR accepts str with UPLOAD_KEEP_FILENAME. A str
  upload directory used to fail on the first write to disk.
- Decoded data is complete before callbacks run (#336, #355).
  Content-Transfer-Encoding decoders are finalized at the end of
  each part, and quoted-printable escapes split across writes
  decode correctly.
- parse_options_header lowercases content types with parameters
 . Multipart/Form-Data; boundary=abc now returns
  multipart/form-data, the same as headers without parameters.
- Faster opening boundary matching. Complete boundaries are
  matched in one step.
- Faster parser state lookups. Parser states are
  module-level enum members, so their repr is now multipart.END
  instead of <MultipartState.END: 12>.
- Faster querystring callback dispatch.
- Python 3.10 is no longer supported. Python 3.11 is now the
  minimum.
- Python 3.15 is supported.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n-multipart_0.0.32.bb => python3-python-multipart_0.0.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.32.bb => python3-python-multipart_0.0.33.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb
index 97b68c82e4..b196f40183 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e"
+SRC_URI[sha256sum] = "b8112424a6abd162ec08d390565dd113ad699f2fe6fef3c987b8bbcbfe9e390d"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

