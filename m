Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15258.1795015861415966937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U9KiBUuw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10975225e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015860; x=1795620660; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7oSaRsM2tNr8K7dWsEPZe7aVlyA3DMxKxtHWilXhCM=;
        b=U9KiBUuwVZbsmfzmHS+dz7G4gVUUtYnB+RdyL/v8s2lHBKsfdtxdlu+mMrzLtmjVPd
         j+/9WdCeLMDgv2VQjAH7i0RyH33QGHEMnm3thy1I7WmM4HW3rnwZNVBSwKmbUhM1Ajqn
         NgVN42AjFof2HRE9ZMcEohkDSBM0ecWNj5h7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015860; x=1795620660;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7oSaRsM2tNr8K7dWsEPZe7aVlyA3DMxKxtHWilXhCM=;
        b=ziGsKkX/7FzzSfREJfF9QIatD5zg0VUVxjLrqQz33+B8hYBmC/1tZAb/rzsFPg7x7Z
         Q7xXZDW4tUdqRGHOmZsnAe3xPrJNXetsu1rplvavuC3UlfWxecTchplmDGp2cRTM4ZSN
         c5PNpxUVTcH9mD1IjpT4FI2IvmrgIRU4UJUC10LrawhtVjWT3DkTCNwby4rtO6+YzcJL
         m4UwzI+zY/SiOU59HMbApmcMpk9lqWj3OVLVr0eLSzFFc48plOFFhTCP/3vAkIjYLyQP
         mPiNo+txM0/863qiHJoFUI3+RpjTap0J8wA7tPF8eUFDwJ+GpnonxCZddDzXdcQ7izs6
         pvlQ==
X-Gm-Message-State: APuU4Z8r/9XEigO4pfCRrUsqhEBh51dVq1Utlvb+t5gP4IG/fCSClrKw
	8uYm3mGSMLro//lCCVs0atuUX3jBsQbh+TsbFnxDqrLj5g5Wy6vL2Fc6awhKqWfMjM5CPmsk+aM
	zQeNY
X-Gm-Gg: AYBFou0sy8rFwM45t/QG17R8NCzD6ub7CkIYBulCThGQFqrsaL1326mE6aSITchkHXo
	TjruQFkaV9iE/nnO75/L/XUEwKignA34LkP+NUwOiONq6YxMeL3BKmkFUMfdwdKGNu1Wx6325uQ
	RkcttZvWoVZn1nQCh2lntl2V/NwAp9MDu5QREveW2vgQ88ElNr10vs6z1vC1owVVeine2x6Q15z
	n8pj+sczHsh0u7gSGpLF/uT4pNwNNcYO/keeF20WLoZ8EdX0yuAeGefk1GpWq2i1v2+6Z9e/Wmb
	GpooUaTtKym4p26t4tgAw/K9GZki1gV47ZTgaKq7xaEgBqNYpiwBv1Il+GlGFKJTaP1edZTytME
	AOtHPH5e3GP1wCno9hNrbcI/jO8J/D8mi0a370DsPpW+Yav03+S+Sd/tOaFT1mS2fQCWGl0g16m
	k1RNkqLvy2xD9zY6OlHNXZY4uyztzG7ZKmD33GDlnJQC6qwCYHqmoTH565hdj5a2GVbwIP7dsKE
	fya2PBfO9ZsN2IpT7yfjE6oy5x0yguk9oEQczDFydd0tkJg+SfqYyZg6GHEFTgVKdjP7ThYbvn9
	PxeRAm+CFwTuKtrCvc2wIz2GHN5HZEx4ke8gnI/0v2uYAJgG/SRhdWjMS8bmRDBa2TNGbR7jDAr
	pja2vDY/GDueWsrOUdpnxeT2ZA/WILg6F6aSp/Zk+Kq2jgar0g/gVEQ==
X-Received: by 2002:a05:600c:1d0f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb7da349e2mr58559875e9.23.1795015859568;
        Wed, 18 Nov 2026 07:30:59 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-dateparser: Upgrade 1.5.0 -> 1.5.1
Date: Wed, 18 Nov 2026 17:30:52 +0200
Message-ID: <20261118153053.922769-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118153053.922769-1-leon.anavi@konsulko.com>
References: <20261118153053.922769-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132660
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.1:

Security fixes:

- Prevent quadratic regex matching on long whitespace runs in the
  Jalali calendar (GHSA-rq5p-ww4m-666c)
- Prevent quadratic parsing in search_dates() on a long run of
  skipped words after a number (GHSA-c83m-fh72-x3jp)
- Prevent unbounded recursion and quadratic parsing in
  search_dates() on many quantities written in words
  (GHSA-8hqv-h88c-f367)
- Prevent quadratic time in search_dates() on a long text whose
  words and Unicode-normalized words differ in number
  (GHSA-wr9g-q4w6-fp42)
- Prevent quadratic parsing in parse() on a long run of separators
  followed by skipped words (GHSA-5g92-f88x-gwj5)

New features:

- Support "less than a minute ago" in Russian, which was not parse

Fixes:

- search_dates() looks for the words of a quantity written in words
  among at most 16 words, so a longer quantity can give a different
  result
- search_dates() yields at most eight dates from a run of more than
  eight quantities written in words, where it yielded all of them
  before
- Keep a full stop that belongs to a date inside the date in
  search_dates(), so "Sept. 5, 2020" is no longer split at the full
  stop
- Use the reference date's year when a custom format has no year,
  so PREFER_DAY_OF_MONTH="last" returns February 29 in a leap year
  instead of February 28, and skip invalid leap days instead of
  raising ValueError; with PREFER_DAY_OF_MONTH or
  PREFER_MONTH_OF_YEAR set to "current", the day or month of
  RELATIVE_BASE is used when it is set
- Leave out a time span that does not fit in the years 1 to 9999,
  instead of raising ValueError in search_dates() with
  RETURN_TIME_SPAN, so the other dates of the text are kept
- Treat digits that the regular expression module matches but int()
  rejects as not a number, instead of raising ValueError in parse()
  and search_dates()
- Do not raise KeyError for a month or weekday name in date_formats
  that is spelled with a letter the regular expression module
  equates with a letter of the name when ignoring case, such as the
  long s for "s"; the date is read as that name
- Stop the Vietnamese year simplification from eating the month
  name "năm", so a month name such as "Tháng năm" (May) followed by
  a year parses
- Fix parsing time-only strings such as "3pm" when RELATIVE_BASE is
  timezone-aware, which returned None

Cleanups and internal improvements:

- Stop a test from depending on the current year
- Move the pytest and coverage settings into pyproject.toml, which
  requires pytest 9 or later for the tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-dateparser_1.5.0.bb => python3-dateparser_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.5.0.bb => python3-dateparser_1.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.5.1.bb
index a4db2d495a..8954a9d894 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "08d62f2c00d3a1e806fc59d40c79e7554e31d84d3b8c6145820af051c92e7292"
+SRC_URI[sha256sum] = "1c3d4a568b4f4d615adfc2945b54596adffc14f955c9b435030b5236226a4366"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

