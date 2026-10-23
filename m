Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12659.1792777449809114607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CUX5/0iG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d885929so722184f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777448; x=1793382248; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbRO8+TxJIH9XtxHTH1F5spj+HDQcw9feAgldbAqgpk=;
        b=CUX5/0iGUqZxkxSM9G8zXRudbmO2UnID4p1axxBTEGN0ExnbBRs3KB92YNQWYTghsi
         LR0lOg5xAPgM9syftOuQ0Ld5WsGA6Pru0q7Vk/BbmteX8JPK0n3yU7ld0Q+GtsCgPw40
         39fM+dzVhRMJcrtBcc+UIhJJG+fp5Dx/iveSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777448; x=1793382248;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbRO8+TxJIH9XtxHTH1F5spj+HDQcw9feAgldbAqgpk=;
        b=TW2YsTSopYdhpi4+usww+S50rjwNgHfhqq9aR8NtKfW/jTYu8yyxU6TOBjC9OaFD21
         +OP2qKcB7L4PhUbHmOJMVwOQkrhsCrtLO5m2cRVle3LpDVvpgwn8BUUQuMzO/udflLLb
         PiIKdHytzHzIlhdDzSjTbfmQaOtMnKsqQbuwSxJ7DIUO7s/bHTu0rIH6HDOJ2Ysm+wD/
         kxnA3fgMENowke8gzT3vl4ZiThR9S54/CvAb/+7nJZT9N60y6SSeXbtqyM/8E+7NQRJ7
         Mmpv78g3jMQ/6VFmU1L5fsTinbC1Pbv7XCjsMFmDlHOlHeAcCvYQ6p0D6yQmuV3NOemX
         ITMQ==
X-Gm-Message-State: AFq9FYLWimViYUwHXW+967MYudof78qncHSDIE6oPPa1JdjJ4zaCpucC
	khPhRP1nADx+6eURBRRPYSMXKCmNz237ZkUVkCYZrw5L/sXPD4+p4s7IJXr6WjhGc00i28e9vCv
	29Enr
X-Gm-Gg: AYBFou037ejhN3U0Flzt7QAcnMDA22uTVBvyfh0BK8vWaKMWlJf+ysHXjcZFLU9O+wu
	/QL/PjQE0S6ylAKUHQx4ZNRYG/GN2U/0HR2WMDgU8eZ32/hlEG4AhjjesRy2HY+BIXXMbmEUCGb
	DF/F+sPvzU/2VBcjp8zuvn8rWB46igN3fq2czRDDFkmaDLyRh2n0LdR9emNRVFzAmLADV4bcx9+
	C2qa1bLlAaJQaCxlcUZ7Zs8B77BRQ6iJhC0YbwGjDz4p2ykvT3xlqCMBv6Rg56lZ9Jkd3XUKBzm
	qannKOjcrEyp480+CXyVsEr7uZffef5+E0EU8sGw5JTqbtHPYGqRBsqP2KDgPaPynVTiadp0T2X
	EZtnfKDY3ioi2K+As8NuG7j6AaSVQcKsCYL9NZz1EKlen1FZM/Iaki5JzUB9OEdEPNYb2gPo2HT
	1sNHUgf3ub+islsYXgmLcKe7RzxzU14nF0vV3hYebd5X/zct8W1TEbuMfSW8wOu061+G9ccRUJf
	YU6VR5cWCFqqkpjU9zEbLMdw1Cdjf3tLwWcqJhcAH1oVM9CmNRAYuYtIx1eaOXsqYk1sHzh1eFa
	w7w1aIaNRlsDzJX8oFTC9qxbAXR6LDaQRSVWY7MX3t+i4Q7PuRNQXcfI3fK//PzcmP3fdO/oflR
	9fDgx
X-Received: by 2002:a05:6000:25c2:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e385949bfmr5299083f8f.18.1792777448028;
        Fri, 23 Oct 2026 10:44:08 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/9] python3-coverage: Upgrade 7.16.2 -> 7.17.0
Date: Fri, 23 Oct 2026 20:43:56 +0300
Message-ID: <20261023174401.3617912-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131383
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.17.0:

- Dropped support for Python 3.10.
- Binary wheels are now provided for iOS and Android. This allows
  the use of the optimized C tracer on mobile platforms.
- Fix: three or more levels of nested with statements could make a
  with line look like a branch with an exit that can never happen.
  Using the sys.monitoring core, these phantom branches were
  reported as partial. Other cores hid the problem but still
  counted the phantom branches in the total.
- Fix: a comment or string that merely mentioned if True: or while
  True: could mark its line as a branch that is known to be
  partial, so a branch that never ran was reported as taken. These
  built-in patterns now only match at the start of the statement.
- Fix: region detection missed functions defined in unusual places,
  such as else and except clauses. This is now fixed.
- Fix: recent versions of the lcov tool complain if the same
  function name appears more than once in a report. Python can have
  multiple same-named functions in a few ways, for example,
  getters/setters or conditionally defined functions. These are now
  disambiguated by adding a @<line number> suffix to the function
  name.
- Fix: The "Can't combine statement coverage data with branch data"
  error now names the two data files it couldn’t combine. The error
  description in the docs now lists common causes and how to find
  the process that wrote the file.
- Fix: at coverage totals close to 0 or 100, the XML report could
  get incorrect line-rate values like 8.333e-05 or 1. This is now
  fixed.
- Fix: a parallel data file saved more than once kept the hash of
  its first save in its file name. Combining could then skip it as
  a duplicate of another file that had the same data at that point,
  and delete it, losing the data recorded after the first save.
  Each save now updates the hash. This had been a problem since
  7.13.1.
- Fixes for obscure but legal file names:
  - File names (and plugin names) can contain control characters,
    which are legal in POSIX paths but unsafe in reports: in XML
    1.0 they make the document non-well-formed, and in a terminal
    they act as escape sequences (colors, title/clipboard
    sequences, cursor moves that forge output). Now the XML report,
    the text and Markdown summary reports, and coverage debug data
    replace non-printable characters in names. Printable names are
    unchanged.
  - A file pattern (from include, omit, or a [paths] alias)
    containing a newline sent the glob-to-regex translation into an
    infinite loop, hanging the process. Newlines in patterns are
    now handled like any other character.
- Fixes in the implementation of the C tracer:
  - If a plugin’s dynamic_source_filename method raised an
    exception, lines in that function could be recorded as
    belonging to a different file. Also fixed some minor memory
    leaks in the C tracer.
  - The refcount of None was mismanaged during function calls,
    including comprehensions. This was unlikely to cause an actual
    problem, but is now fixed. Thanks, Andrew Dalke.
  - The C tracer held borrowed references to dictionary values,
    which was unsafe on free-threaded Python. Now it takes its own
    references.
  - An internal error while recording a new file could be reported
    as a confusing SystemError instead of the actual exception.
- Performance: the text summary report (coverage report) held on to
  every file’s parsed source until it finished, so its memory use
  grew with the size of the project: ten times or more what 7.14
  used on large projects. Now it keeps only what it needs to print.
- Performance: HTML reports should be about 5% faster to produce.
- Kept the political banner in the README.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.16.2.bb => python3-coverage_7.17.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.16.2.bb => python3-coverage_7.17.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb
index d5efa1b0c8..34c3d9487e 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "ca64d9f1f384f151b9511bec01126072acd2f313439f8ed015a22d8790aab6fa"
+SRC_URI[sha256sum] = "cc010a0a7fbdd9bb8bdfd0d3f04a5151275860213cbd7e2b876b29778489c712"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

