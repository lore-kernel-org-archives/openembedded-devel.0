Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14672.1793092885652649561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kZvKq49M;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so21439535e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092884; x=1793697684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=240aewT2YSEhrihVwR8fGoWj0j+nJ9b2++8bpvwk1j0=;
        b=kZvKq49M8/ygNzB55UeN4SkNh8WLhC0ANqvpcBTPHcqdt6x+QlmUdliKWiTZVyE9O+
         t92LyWDC78sltt+q6Io7Bj2Rf/oOl3WZCutTKpwXU8qWO1MYIGJoHKHMRIHyR3LT5M++
         7Ee3pWmWmV6DC101epKxsezF3l9x4JwOtJPuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092884; x=1793697684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=240aewT2YSEhrihVwR8fGoWj0j+nJ9b2++8bpvwk1j0=;
        b=vALFtf/gFPqASm/kUUANmXirU2nIUyW5PEPaqQr4DJe8gQBDLExaxVjzCxUz0zalMe
         L34ZsS/u95iUP1wJ2ImXW8msEfcSmXuvE14Mb/nuvyfjigsqAiIlApV9Gkxxl4oXLHov
         klk3HYRISmEzOQJLPglO/WKyp1UCOwahWSHrJJBIu9pWXRePODB1lq+b9U9AYt70U2gN
         GnRSkkU4r+5U66z4ozK7BFsgwUaQWJZRZ9vkLT0cEX0BXkS7QvanxPeZ23V/avzqQmei
         N0USow+y/edTNkG0v7gmn82PRJ1Yf9qUQeRyUBbQbFAoy3X3j22yesHwIRoBrDcd5RdF
         suMA==
X-Gm-Message-State: AFq9FYKBuVo5947EFP60JARgDznhU0hIgAh08JDZNLXbFp6YuRaJfd4R
	A3ApIJa3PLnTHYUW8aIPKcWxDDsUa7Umcnv9V6SHaCRC9nKNNIy+2IFptcf8Bs2cb9s8JhRQfrm
	tjhRd
X-Gm-Gg: AYBFou10mg1LMTXqhZJReGhqhAFD1p1jibjdS8taGXFIzMCOaumoAZ1EXnkNSNCEGAq
	rzMjyyoBMAPm9xCOez07FYBQpzGQsBIscTANmoT0UYTZcbeEt6CSmXgmk2B1xLYp0JecvEosFXT
	QAYsFscPdIKKNqJxPgdCdTsB6lbu81/wyuUlAyC48iS2av7l1bP3iFMz1xjU6wJRkiPiBCWfnO7
	m3552TVobZ9deWnWVMLvzTMLnB6oVFNQATPkh8s0ASj/uLUqzH212uNHQ/1TjCVDSrP+akVGgMr
	IoMFszzivIqBHG5hOIbLq23hH9p0Qa7QW9neH9NCHQtckCU4415f8gPjarVp5EXoEq9ld40U2wT
	jgNxP8TBa8IvGKNYp2jZiOW6Z+3MnVBcM5mWdEEzpFZnYV54vrCyusaYLv6NWJOSsqPwIGwxn4f
	//Hq5p6cFvYrfKbAwiKOm5PSNx6LJNke2F10pZ3SDfM1ay0zKCsaouubal6WKZKWauRPfPCfK3x
	Aod9bnF7f3ImONMYJGhDkdfAeXO+Asl186LSGOa99GXsCRwVfzKaxWwbq4o5pQRa5moCDep0qOn
	pDlj3BqLWKIytFIIucWb3+x+xm5HWT6ZQVkG2ybxSX+ldKYL/dFaAPUeJ6fcsVqVmfV5459McDg
	5k2Ds
X-Received: by 2002:a05:600c:1c22:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4a790440cfdmr63463555e9.27.1793092883988;
        Tue, 27 Oct 2026 02:21:23 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 44/61] python3-svglib: Upgrade 2.0.2 -> 2.3.2
Date: Tue, 27 Oct 2026 11:20:11 +0200
Message-ID: <20261027092028.782979-44-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131508
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.3.2:

Security:

- A long run of digits in the arguments of a path arc command (A or
  a) could make parsing take exponential time, so a tiny SVG could
  block a process for minutes or longer (CWE-1333, CWE-400,
  GHSA-249c-7rgc-f52h). Arc arguments are now read one token at a
  time, without regex backtracking. Parsing of a malformed arc
  stops at the first argument that does not fit.

Fixed:

- Accept explicit plus signs on arc rotation and endpoints, and
  tab, carriage return and line feed separators in transform
  arguments, as allowed by SVG.
- svg2rlg() no longer unpacks a .svgz file to a sibling .svg file,
  which overwrote an existing file of that name and then deleted
  it. The compressed data is now read as a stream.
- A <use> that refers to itself, or to a cycle of elements that
  each <use> the next one, no longer crashes with RecursionError.
  The offending <use> is skipped and an error is logged, as already
  done for cyclic references between external files.

Extend RDEPENDS with the runtime dependency python3-reportlab.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-svglib_2.0.2.bb => python3-svglib_2.3.2.bb} | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-svglib_2.0.2.bb => python3-svglib_2.3.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb b/meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb
index 2144ae52dd..9403e7d49e 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb
@@ -8,11 +8,17 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 CVE_PRODUCT = "svglib"
 
-SRC_URI[sha256sum] = "455e473dbe7066eea55c39de8194a6a3b646b6c37a255700257fd32115ddb218"
+SRC_URI[sha256sum] = "625b62cf440ab57f5def42d5be47a0d6b73c02711ef86ab1545650a98ac1ad5f"
 
 inherit pypi python_hatchling
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} = "python3-pillow python3-html python3-cssselect2 python3-webencodings \
-    python3-lxml"
+RDEPENDS:${PN} = " \
+    python3-pillow \
+    python3-html \
+    python3-cssselect2 \
+    python3-webencodings \
+    python3-lxml \
+    python3-reportlab \
+"
-- 
2.47.3

