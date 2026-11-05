Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32758.1793879733830263881
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P2EFMXQZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso13225405e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879732; x=1794484532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsEU4enMMcGfzzjKC3LhRLIO0S9rKjdd7rFS/+H4pI0=;
        b=P2EFMXQZT/uQ3269VU9uETLcyc6sIeVDJUwy1pPGZrzheSlyEojmdcZAqZzjnXVycs
         fZoYUVkOn1cvDUXkrntlVYvsuLrh96Mm7wkoMPRQtESJpvwTegHkhRtSz1urshyvPKzt
         KE89a6y0+xWiwMAtcjRW8C8W4BU/c31eSXlZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879732; x=1794484532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsEU4enMMcGfzzjKC3LhRLIO0S9rKjdd7rFS/+H4pI0=;
        b=ylspmGUYZF1wkzYt1LY7cdEs9eNNkOkVw/QNo0zppdnfjDNjnOgNQZT9848+mEzh6P
         lHxTGXVw5NbHTUh5RdHSNfx72bIKgd+WhqEejykq+d5Fft94vwlCiS2HZQrKd0a7YW7y
         AB40/oY5IcTvl/qq+Cm7FSms+IG0sIDtaqGWs99/2FLuT+cDa6Ug8bRFvUHvYFwXhvUl
         n+X8FuVBC5Qlts0n9Nr0teRvZXdu9PfTSTXb1VArKlsdzAPOsAYHRl/MucKfRNcSt4EH
         bR6/dDnTgVyIrANosrWEWBHNqZXS5n5Gg8/xaFVB8gdTTBn3iQ9iN1loZuROzfg/W6ar
         pDhA==
X-Gm-Message-State: APuU4Z/SjFN6qZ9c97lL+9LoVhKipNHhWNAgWlUPhdE8To3lDhTR8bkY
	tQLzU2GGODUCNzi2QWJOU+84RPr9R7CflrbIU88y515IOPO6bXz48t4W7rLn4kDtFr9rnmpYTdx
	G7v3k
X-Gm-Gg: AYBFou1u22FF9+bHwoP/Pc0vMF4tCy2M5aY6CnxcJhjxqN6mR5FNQRiVmKvSpfBwjbW
	j2tSK41ybtwaVhIj/C9tLZXpVZPE1f5y1ons5a6vtnSe+oFfY99EEYUqiX+fgpZhldxrE9juE3W
	Og77MwdSDqjp59YVVkT1n5yvaoHpFQVbpqnEw6hJJ0DAzAWpUaCxrq4L7iESWTQe3QujxGEdXJq
	x+G/NdfOfKizRZXu5t+S4KNa1qP0MtGli0jKKudC7ZhPdE3g/MVhvlgtrTFph64/MFSV/x1JsAB
	gNas/P/cMzq7CogGxoSaAmeAzT8SntpP/PB1sVyzyF/TmO1I0dYgiBUo/q96CKv9Q+p9+Lh1ZM8
	vwXsk+20EIeiya90hDWvzjQi3iyOl0Rh4KjQsSWhs1t2FMVVHCMgMVb5F5P+YTGIOZd37PTLL0R
	w8n7m98mLN9fUy3qf5odoXpNUyxfCht+jlXynGuV2Kd1VX92Wil1yWvowA5EOwilPLNTFU9zLSC
	5deZLduhrEHAIcWJVoDlanBVscUuMPYlGRShgrUJs/07bnft48MeryJzazuLfT2Pog84nkO761d
	UMv7M/jvuXULze2GsUq6hkI04237z+44Dk4kVdbN6QaV7PJ6e1f16uqVJioZQodSwsTzoclL8X/
	KJW3qSXR/4x+5AkQOmXFge7mC/2hpFPlsv+8/ERaoAe5eYAuwnN7cC58TqPuoTqkjctFy47VFik
	A=
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ac17191009mr416542385e9.11.1793879732014;
        Thu, 05 Nov 2026 03:55:32 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/19] python3-coverage: Upgrade 7.17.0 -> 7.17.1
Date: Thu,  5 Nov 2026 13:55:11 +0200
Message-ID: <20261105115526.634289-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131904
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.17.1:

- Fix: a one-line class or function body immediately followed by
  another statement (such as class Foo: ... on its own line) was
  incorrectly reported as a missing branch when using the
  sys.monitoring core. This is now fixed.
- Fix: the HTML report only rewrites a file's page when the file or
  its data has changed, but each page also links to the previous
  and next files. When the set of reported files changed, unchanged
  pages kept their old links. For example, with skip_covered, a
  file that became 100% covered had its page deleted, but the pages
  next to it still linked to it. Now a page is also rewritten when
  its neighbors change.
- Fix: --fail-under now uses at least the decimal precision of the
  threshold for both the comparison and failure message. With
  precision=0, a total of 0.4 now passes --fail-under=0.3 and fails
  --fail-under=0.5 with the message "total of 0.4 is less than
  fail-under=0.5". Previously, the comparison rounded the total to
  zero and the message could claim "1 is less than 0".
- Fix: the HTML report escaped file names twice, so a name with &,
  <, or quotes in it was shown with entities like &amp;. Now they
  are properly escaped only once.
- Fix: --source=/ measured no files. A file system root can't be a
  source directory, so now it is an error.
- In an abundance of caution, prevent forged SQLite journal files
  from deleting files they shouldn't.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.17.0.bb => python3-coverage_7.17.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.0.bb => python3-coverage_7.17.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb
index 34c3d9487e..cfa7fe8fa6 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "cc010a0a7fbdd9bb8bdfd0d3f04a5151275860213cbd7e2b876b29778489c712"
+SRC_URI[sha256sum] = "5c5c77f95a0e83e6b79eff948d251c9911cfd61d67f5059159fc25b7bc4aec27"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

