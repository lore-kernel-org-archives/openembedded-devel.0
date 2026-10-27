Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14857.1793092883576607826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oDzRXhEs;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so25199045e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092882; x=1793697682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR1kwyfkW+CyHd4Fpkb6q82efbTdR0i1IBT6io8D1yU=;
        b=oDzRXhEsrT3WDBm3m2QPkcJ/znLQHFF8BEioYHwxuZsao6ZI0yj4gIHJFIx1nD4gMu
         NBwMuqpaXNeG/iApqsOGM2jGslCBQgS/Ahau7H55rVY4L2r1+AhVm6mGee9KnqW7ax5r
         sBwVoot/LdhRjvp0Q3Tn+sVzu6BwZsbVo8mao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092882; x=1793697682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR1kwyfkW+CyHd4Fpkb6q82efbTdR0i1IBT6io8D1yU=;
        b=NeoNXyfvWXqp1/VGVKmxZq+9Hh2zvIkJHOSWY2xSei81ilEu/lm14QAypTm9ZQTLcM
         VOLjqQhuUZ3bCgb8MXSNA8H4iAqnlfqD14jVkRs5kryit66J8krsZNbGvGLeLUd4QZyL
         S4wRgr7mUSa78fhJ8d6xaeA/gLo3NssoOFl/rQxQa32z9uKLfDX7Xg72fYqco4ENG8SH
         TsfttHcEkKCVFE+K26Xn3FykY2idMdlKS1bvR5zEl1RFp8kUAqAFJNyeUguC/98J5NTU
         MTMluLR3qF6yDudwkChGCSbz2GNciAYmmprP+QrdWzBaXud0JCC+7ouhAEeKa+5D8scj
         VJvQ==
X-Gm-Message-State: AFq9FYJl1Ld+SAzrw++0608+OSnAMvkPXTmBenJr4LTDJpKn/EqGcdkV
	PUPFj2oBgqJvI1U4gf8X2o1D7I8gLkyRgHM/0NlFlIoHjvizxQUTBHqc4FwjAdRFffepILjbUKZ
	gD/7u
X-Gm-Gg: AYBFou1qJJ/9ASTqYYKozRbvBI+z1N5kQf5BpGOHznfLWDnz26l5fWIsGOate/TvKiX
	U2y+BdptDdVHK5luVsXpIW2ps/3RmoiliLAkyP1tUt0Fck0xxVdlAA9UvV6/Z0W1XF852A0PWdV
	EFTuqhoPDIzbtz2zczKHKE97C7QRQVBnhDKGPTfDyPsQeDKQUhrBnMF4ssi1ZEWXU5espCOKwE3
	KBjPH7Jscqqfc+mEHc+p3Sh1+WDZpQRyMfZRbbvXOsGG7iLJQfxCVD/CHI8T9Ytac982Up7HKjq
	4VvMBT5jRMrku8XdhOT5suO2CuRSSGxDBHSx1K3JBVv0jIGUm0MuI8Q5sJ7rTfrJeGugX20Xx0b
	2+IIl9frFUWWVKENSxgqKDscUpWIM47gU7zeavL2HH1l/eRcQMxueCLvdyMHrTlOmX9/2gXDvpJ
	z+mherzl45tKCNPBNi/cH2ZSkOmsR/Ah0L11ZeH+I5XIlVWaFMzRatN9prkaudZKiByfKvE/u1A
	Uy7AUfQNRMrnF9mfbstqL0F7mP/B3S5yhE6QW78ZHrvES2vOlhpHh9mGg2BYuQxMFGOdQ6atKqu
	PSmOJBlhRMjLH1q0Wkur5Kyq291Efr2IShrOg/2efNRlG1vrREFUF8quvlB9Bd8YWlM120cDAc6
	aAF+G
X-Received: by 2002:a05:600c:474a:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4a35acb586cmr179351095e9.23.1793092881844;
        Tue, 27 Oct 2026 02:21:21 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 42/61] python3-soupsieve: Upgrade 2.9.2 -> 3.0.4
Date: Tue, 27 Oct 2026 11:20:09 +0200
Message-ID: <20261027092028.782979-42-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131506
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.0.4:

- FIX: Keep own and descendant text separate when combining
  :-soup-contains() and :-soup-contains-own().
- FIX: Cache resolved directionality when matching :dir() to avoid
  quadratic time on deeply nested dir="auto" elements.
- FIX: Fix auto handling in regard to :dir() selector. When an
  element with dir="auto" (or a <bdi>) contains no strong direction
  characters, it should be assumed as left-to-right and not assume
  the direction of the parent.
- FIX: Match numeric input ranges correctly when values or bounds
  use scientific notation.
- FIX: Fix :in-range and :out-of-range raising ValueError for week
  inputs whose week-year is 10000 or greater.
- FIX: Fix :nth-last-child(an+b of S) matching the wrong elements
  when the first sibling tested does not match S.
- FIX: escape() now only leaves non-ASCII identifier code points
  unescaped, as defined by the CSS specification. All other
  non-ASCII characters are escaped.
- FIX: Allow unescaped U+0080 - U+009F characters in identifiers to
  match browser behavior.
- FIX: Fix :in-range and :out-of-range treating time and
  datetime-local values with seconds as invalid.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.9.2.bb => python3-soupsieve_3.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.9.2.bb => python3-soupsieve_3.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb
index e1c329d867..8175ba94df 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_3.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "4a55d8cf158a9c2e587fa4922f1bbb91d68ac829e2d6f25403a85747c71daf74"
+SRC_URI[sha256sum] = "924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

