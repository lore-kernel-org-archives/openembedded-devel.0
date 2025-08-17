Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E005CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 09:17:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.49953.1755422268214965174
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 02:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnuvNPoS;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a2befdso462485166b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755422266; x=1756027066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgghVo0UJLJeuSl3DBO+i3fFb0dlmyKvh53WUoGeeMQ=;
        b=GnuvNPoSYS2VBeqQWiRdYsCEIcWZVSN+HTz0815nnVWaaH09OsWU6c3XtPzYbNvttr
         albwlH1w3Lito68IuPL80l3G3P/UHtqRxeYiytpOV86g6qWG2fYR0fraYsmsyCITEw0a
         XA97OjrqhzV0Jw3kKLI7O+4+xF5m+aQdJ9SqeDsW5OWX8NXacUQSxsQ+6FfqeZP1yNin
         j6eLDUyeOl+WUZey+qhLg3Ex510AraRMvRQ5OOEwSBxPu16YFClqGDHjajrwchJNC/eg
         frnro78W0Pc5bq3IT/g2F3xbXBjitxrvhjZ7WpqKMSXz+VoIB5xNDROjZg2ES+UkWi/m
         B/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755422266; x=1756027066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgghVo0UJLJeuSl3DBO+i3fFb0dlmyKvh53WUoGeeMQ=;
        b=mIKKvlddbBwcgmTM82PtiJi9V4gVylC7+fIGF5o1rDQAaWPx+3O/CL1ChTdfcra8sC
         RIlYOtwvSKmag/5eYclkPrCuU6tCSEWbPUe53yCskmPrSUTQNdienTRmiB460YMYI2d5
         AL6P9AoF4pTv3MC3J1tV35us/dTvqk/QZVtl/GZ75+FEpt8toePYTzOYG3zrXfn6fKCE
         SkxyiN/Hf2YtcAahxl/V/xTXjJn8k1LbeLKFfxLkFHcJkIVEkohXKdah1dAvVXUY02sm
         aUDlq88BVu0BWh5ForZ29BZMaD4uYAU5dL4cAJBiqhtaFFkxRR+EwSPBUdiscchfSP1y
         6PSw==
X-Gm-Message-State: AOJu0YxTSf66hhPD4EaWzvkZxHWn/NszYQsJmALc2K+/UTl7FpWxc5hg
	yALjmCJkDmJBs7jNYkt5XeTkzywRxhnI+C5fNkgwxKVyDSd+tX3yokzdfxbz0A==
X-Gm-Gg: ASbGncvXV5rFTspYrRfnMjU2iyOixdsGjrcr9PAoEEO5WQqTvPSR3jwPw6qGfok1Pki
	ChhLIlFcNHgbvRBopf7o4vzjGLtuTOnuqPxA3uZv9kQcvACMmQepgM04sLVh/K5k+bl13Km77qI
	mFSSD9GOiXUw2kVBNJGRXTG7WerbOBaJyVBO97m4R/tGup2YDUaOhD0gIN6RVPmkzGxxd0Z5y1Q
	IWQR5bcpuZ3KKFcrS/BoWSBwTAZCxDgaj75yu9Tkf2V877/InhQ4JlsboVbliY3iYlPQAsHTJV1
	Rwpa+M/5E2iEYI5eb8efuLUXblRaJaZiMP4806YbjhfT4WGEy2tMGWR9kIxoyTTmu8XOSF09fSo
	wbuksK+Nqz+9uIMa5aaJx
X-Google-Smtp-Source: AGHT+IHrRZgUIlp5bVLQuy3XtpSHRApc0T9YaI7u8bB9VqH/UfNkYXNkJjImfXGe4mQBuyXLiIvtiA==
X-Received: by 2002:a17:907:9405:b0:af9:610e:343e with SMTP id a640c23a62f3a-afceaca9916mr458316266b.11.1755422266226;
        Sun, 17 Aug 2025 02:17:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04e0c5sm557786866b.117.2025.08.17.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 02:17:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: WXbet <WXbet@proton.me>
Subject: [meta-oe][PATCH] gitpkgv.bbclass: inspect repository in UNPACKDIR
Date: Sun, 17 Aug 2025 11:17:45 +0200
Message-ID: <20250817091745.1170336-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118981

When BB_GIT_SHALLOW = "1" is used, the unpacked gir repository doesn't
exist in the download folder, and the class isn't able to instect the
details of the repository.

Instead inspect the repository it the UNPACKDIR.

Reported-by: WXbet <WXbet@proton.me>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index eb4b1eae9a..1afe9c53d8 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -59,6 +59,9 @@ def get_git_pkgv(d, use_tags):
     from shlex import quote
 
     src_uri = d.getVar('SRC_URI').split()
+    unpackdir = d.getVar('UNPACKDIR')
+    def_destsuffix = (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git") + "/"
+
     fetcher = bb.fetch2.Fetch(src_uri, d)
     ud = fetcher.ud
 
@@ -78,20 +81,24 @@ def get_git_pkgv(d, use_tags):
     found = False
     for url in ud.values():
         if url.type == 'git' or url.type == 'gitsm':
-            if not os.path.exists(url.localpath):
+            destsuffix = url.parm.get("destsuffix", def_destsuffix)
+            subdir = url.parm.get('subdir', '')
+            destdir = os.path.join(unpackdir, destsuffix, subdir)
+
+            if not os.path.exists(destdir):
                 return None
 
             found = True
 
-            vars = { 'repodir' : quote(url.localpath),
+            vars = { 'repodir' : quote(destdir),
                      'rev' : quote(url.revision) }
 
             rev = bb.fetch2.get_srcrev(d).split('+')[1]
-            rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + url.revision)
+            rev_file = os.path.join(destdir, "oe-gitpkgv_" + url.revision)
 
             if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
                 commits = bb.fetch2.runfetchcmd(
-                    "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
+                    "git -C %(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
                     % vars, d, quiet=True).strip().lstrip('0')
 
                 if commits != "":
@@ -107,7 +114,7 @@ def get_git_pkgv(d, use_tags):
             if use_tags:
                 try:
                     output = bb.fetch2.runfetchcmd(
-                        "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
+                        "git -C %(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                         % vars, d, quiet=True).strip()
                     ver = gitpkgv_drop_tag_prefix(d, output)
                 except Exception:

