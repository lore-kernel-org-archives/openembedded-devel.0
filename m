Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30942CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33751.1792414582990633653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PBCYxa9q;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b060ec084so1383713f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414581; x=1793019381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO8+BEqIABcCucM4H8WDWJukuYTtvHyZBsMI21rgLRw=;
        b=PBCYxa9q0ZXJ9TsQH0YhGIZccQH1Fo7iRQBcRwoRaQcFDW/bhALmq2t83wpRH/JHSE
         btVmY6cRlm+jw71Xh8OG+4x38sB5BCJ1j+8JSQ0uunW/4HQAx+grAIGidPy+yTxyXjK0
         IaTt+FGlsxiJvVq0o576Y8DGXntYhtPu7CCEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414581; x=1793019381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO8+BEqIABcCucM4H8WDWJukuYTtvHyZBsMI21rgLRw=;
        b=ntmKwCIUMYF3NoWWCFvf3A1KORuIYhQR7OJRkpqofbPv9HPcGZps9EWRQOr4SToHPn
         6ygzVSFwxpZH4X0rvkB8akm0MVIpz6gWpNNCFnMgF6nD4OvoWYhJoiceI40AaupVHPQg
         ivdS3kTT/bxpnVfsU6f7D/l690mOD1A2BG8Gk3Qqz1UvDvmcIv+RFOpYr/2vakXkBxj/
         wgP0oIYpk4tp3voD3u6J2SCk3tcgsTjuLBwMwf729vp7UA6XyB7Sr7i6DWLAzycEQFbl
         4YTxNeQgmd8+b2bJv16lh+HfFN3uitbs1boCnCyrZPbhWfkzOEFVf0prJ3tNJdADkWAA
         Cosw==
X-Gm-Message-State: AFq9FYLfhS/UTx+GCRhMn5TrG3lSfKx3oCyA+r+CfLRgR8qD5pOof5Kj
	WO5WmmZ6rr9TkztiwJaupjQpv3cbVhcOGsrQ4DLOajPez1WKWsod04AGRfOsG9qJRpbVoKNCEK9
	sq87C
X-Gm-Gg: AYBFou0plB9Xh6BVSQrZSwZ4mdK58pPQsRamQUhKx4feXtGQvpR44nO3pm+jHmzEyMK
	8GVYB7E3h2sCPpsO9yavYfgC/LdiWYi+CTAmsDxv4wWiEO8WiocXGs1eCBgIoDmkQlh8QuLEmMM
	G3/bB/1WpuSwmkEfYIiPKcCNtyRkuedE3oj9O8i6RaL8swOgk5FekiN7gj5D8LTuaqg43pJk9w+
	WeKLm+lqqIeS3Hs3bSsbAeM8eYnrD6zNutwVESxXLx1Ucb/PeOjdK4EQ8i4i8KYdFrLDDE23LCk
	15zE/QGm9e+Cq51Uv80MajGwQN0gWQrRXejWYmJAgGg8qwhQksV+XQkJcXJ+PbhfHvbjCwRxP2g
	YuEjsoeP+sx/WsSBV0jlg+IqL/0HsGjFEKr/+ohHK883J6uZB0cvO2b9eg5ntKMte1sQpaRk+Fw
	wu+aeoUL5+fXywwxsdAZNArJ4V7AE27Y/heF2nu99B0tjkZ4LlNyhuEr6SJFSDIVm2f6vlXxdVT
	I3V5GPQpy4NIZ3n3fvIBpYFD3U4WPKObAdTgrBqknPzTTsfGW22VCV/rL3OdZ+IFWyjS3upG3Jj
	aOjrxkmEWYDUcSzMpv5jD+s=
X-Received: by 2002:a05:6000:987:b0:48d:fd5b:504d with SMTP id ffacd0b85a97d-48e07f9d7e2mr15363877f8f.31.1792414580868;
        Mon, 19 Oct 2026 05:56:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-black: Upgrade 26.5.1 -> 26.10.1
Date: Mon, 19 Oct 2026 15:56:08 +0300
Message-ID: <20261019125616.3888504-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131117

Upgrade to release 26.10.1:

Highlights:

This release fixes a security issue in Black's bundled GitHub
Action. Repositories that use the action are encouraged to update
to the latest version of Black immediately. This update is received
automatically when using psf/black@stable, and is independent of
the version of Black installed by the action.

When the GitHub Action reads version specifiers from
tool.black.required-version, it now only accepts released versions
of Black, as it already did for black requirements in dependency
lists. Other values, such as URL references, are now rejected. This
issue has been registered as GHSA-cg8m-r9f2-5wm2; a CVE identifier
is pending.

Stable style:

- Fix a long Jupyter notebook assignment magic (for example x = !ls
  -la) being wrapped in parentheses, which IPython can no longer
  run; such cells are now left unchanged
- Keep repeated lines outside the selected --line-ranges unchanged
- Fix --line-ranges formatting lines that follow a statement when
  formatting joins or re-indents that statement
- Fix --line-ranges crashing with an internal error when an
  unselected statement has a # fmt: skip comment on the last line
  before a closing bracket
- Prevent moving an encoding declaration (for example # -*- coding:
  latin-1 -*-) onto the first two lines of a file
- Fix adding an extra trailing blank line inside a multi-line
  module docstring when its last line is near the line length limit

Preview style:

- Do not split short expressions on delimiters (such as binary
  operators, comparisons, or comprehensions) inside brackets when
  preceded by a standalone comment
- Fix the unstable string_processing feature removing
  backslash-newline sequences from raw strings, which changed their
  value
- Avoid adding unnecessary parentheses around unbreakable
  right-hand side expressions in assignments (such as annotated
  assignments or subscript targets)
- Parenthesize expressions with parameter comments when they exceed
  the line length under --preview
- Fix wrap_long_dict_values_in_parens dropping the parentheses
  around a right-hand side that contains a dictionary, leaving a
  line over the length limit
- Fix the unstable string_processing feature adding a space after *
  or in a PEP 695 type parameter (* Ts = ...) when it splits a
  string in the parameter's default
- Avoid unnecessary line splits of trailers (such as
  indexing/subscripts) when an earlier bracket split exceeds the
  line length only due to a trailing comment

Configuration:

- Add --cache-dir to configure the cache directory from the command
  line
- Don't cache a file as formatted after formatting or checking it
  with --line-ranges, which made a later full black --check pass
  and black skip the unformatted lines
- Respect a .gitignore that starts with a UTF-8 byte order mark.
  The mark became part of the first pattern, so that pattern never
  matched and Black formatted files that git ignores

Performance:

- Avoid quadratic runtime when splitting very long lines with many
  trailing bracket pairs (such as consecutive subscripts)

Integrations:

- Fix the GitHub Action crashing on dependency-group includes when
  use_pyproject is enabled
- When the GitHub Action reads version specifiers from
  tool.black.required-version, it now only accepts released
  versions of Black, as it already did for black requirements in
  dependency lists. Other values, such as URL references, are now
  rejected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-black_26.5.1.bb => python3-black_26.10.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_26.5.1.bb => python3-black_26.10.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-black_26.5.1.bb b/meta-python/recipes-devtools/python/python3-black_26.10.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-black_26.5.1.bb
rename to meta-python/recipes-devtools/python/python3-black_26.10.1.bb
index 22f6deaac9..631429d67d 100644
--- a/meta-python/recipes-devtools/python/python3-black_26.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-black_26.10.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
-SRC_URI[sha256sum] = "dd321f668053961824bcc1be1cc1df748b2d7e4fa28086b08331e577b0100a73"
+SRC_URI[sha256sum] = "5f9f83beae62437e060dafd53d7f1fc327e3d3494f74d72ee5c2b73eb90fc4e7"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


