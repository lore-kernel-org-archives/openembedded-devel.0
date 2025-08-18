Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02D6CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.68097.1755494306875971599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 22:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mZo6Gd0N;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61a1c6a5338so1222270a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755494305; x=1756099105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr7O5Xa8Iadzl6WAJPpy1tOUZwU2kNtZ0y98qajJLO8=;
        b=mZo6Gd0Ngt9e6nBxHUMMZ6mg6DZciJPTofE5F9zTe/6oTUhl5q+25Ke9YtZvBn6kA2
         b1nbRjMdGl9qJpi3ZBUA7g2/tRRDl7apV/Dc/gECCydYi6AuHNPQpst6h1aYT5NsbRM/
         dBr8Eq9ZcKP4v4xGMrwPtsd5nce/jmB2DAj61DlXi0AOBplOAg38Z0cE4rSHKYYpVQWf
         rnveTLRWf6VePk31UkJDQfHi9Fl+r6Ts3whCvbo3mJY+eLZ9/yfvzRuxslIB0atnd2i8
         1goX9WyQR0k04uBLZDPkiiwDVx1m5zEEaYcJoXqsYuTS0WD530Ec+AN69+x+yNjpdTaj
         ZyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755494305; x=1756099105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr7O5Xa8Iadzl6WAJPpy1tOUZwU2kNtZ0y98qajJLO8=;
        b=aj5vU36puJ5XMHBUdBVJ0V4lvxOKZtI2lPRFL8d9yBfUilJ7Ezj/2X6JLtBA9Xb+Cz
         J4B0tv3KYBMjz3fjR/4Dn2RVDpXEurjiLvaga6KDVqH8PEIgCXhZPIyjZNh2uXnpJ7N3
         2Ctn5CsurfhksYDPfIXUYTbRDOpteMozzFKftxwcbj3tueAyTpRPtxeN4/IBVYwER6a0
         iURKkwJUMX7XO5KVSRBJ3hvX5n2rK1z3Ul4SZEl2N6lm1ViV9wbji8Vno8xCD8M9UrMt
         oTngS82pndkEhDT9Bv1MrrQfNnrqRvuYrzP5fTJINQcs4am4enftkiCsH6m+B+Et5nDd
         b0Ew==
X-Gm-Message-State: AOJu0YziD6bF+JVjl27w6Vzt/xAeOqnXSw27QNBSuWmv9vOiGC33SY0c
	0k8GzDY4LindyEsjrZEmyyAs2YylhUzJj4Z6IMlvGkIuc22YxOs4VD8kGJkgCg==
X-Gm-Gg: ASbGncvJXblRtOVZ/6fT2SBeckExeiD/j2UnyFg1ntNA6BFgZWb8LwXz0T7tUAtPBA3
	OwCWhr5ZAZdl0eiLJNyyC9UF8VAeFSXuf/l9AMS4iPuSDrGU7fPyEgzx7e4dKWMG69YnFlJTSov
	04hVAajhazo6vhctEm8704kUrD1QjEh/Nij3E4CwtHPmbmjyKJiyMHfHYvPsumVInCgT40RJR0l
	RNAgXf75CGvPEqqfdhpGlKETBDE98MW03yz5xgX3aHv3xHgGOCbH8boVoGYDetCqhv0OTDggQux
	PvoIg0wgVAzEneLc0a+FD0QS5Xt9/KQ68RAdmSV8SZT8XHpTrn6jHHmsM6n6DaF/pHnX0+kz1Cq
	Z2M7JLX5uP+d7ZYPr1o3O
X-Google-Smtp-Source: AGHT+IH34E93YMPw4RN+gDVRKDx0Sk1zpWl4UV5OgsM1n348DkQfNR7kJgBHr/ZrQmnDKe4x/ZZFiw==
X-Received: by 2002:a05:6402:280a:b0:618:196b:1f4c with SMTP id 4fb4d7f45d1cf-618b0558f4dmr9481336a12.23.1755494304960;
        Sun, 17 Aug 2025 22:18:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-619dc61f326sm4526260a12.57.2025.08.17.22.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 22:18:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: WXbet <WXbet@proton.me>
Subject: [meta-oe][PATCH v2] gitpkgv.bbclass: inspect repository in UNPACKDIR
Date: Mon, 18 Aug 2025 07:18:22 +0200
Message-ID: <20250818051822.2020242-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118990

When BB_GIT_SHALLOW = "1" is used, the unpacked gir repository doesn't
exist in the download folder, and the class isn't able to inspect the
details of the repository.

Instead inspect the repository it the UNPACKDIR.

Beside this, since BitBake fetcher performs an actual initial shallow
clone of the repository when this feature is enabled, it is not possible
to determine the exact number of commits. Add a warning about this.

Reported-by: WXbet <WXbet@proton.me>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index eb4b1eae9a..c3d98cb2e1 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -21,6 +21,11 @@
 # v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
 # path to v2.0 revisions
 #
+# Another WARNING: Since Walnascar release BB_SHALLOW_GIT will actually
+# perform a shallow initial checkout, which makes it impossible to determine
+# the correct number of commits in the repository - thus using this class
+# is not recommended when shallow cloning is enabled.
+#
 # use example:
 #
 # inherit gitpkgv
@@ -59,6 +64,9 @@ def get_git_pkgv(d, use_tags):
     from shlex import quote
 
     src_uri = d.getVar('SRC_URI').split()
+    unpackdir = d.getVar('UNPACKDIR')
+    def_destsuffix = (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git") + "/"
+
     fetcher = bb.fetch2.Fetch(src_uri, d)
     ud = fetcher.ud
 
@@ -78,20 +86,27 @@ def get_git_pkgv(d, use_tags):
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
 
+            if d.getVar('BB_GIT_SHALLOW') == '1':
+                bb.warnonce('%s: Shallow cloning enabled - gitpkgv.bbclass will not generate sortable versions' % d.getVar('PN'))
+
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
@@ -107,7 +122,7 @@ def get_git_pkgv(d, use_tags):
             if use_tags:
                 try:
                     output = bb.fetch2.runfetchcmd(
-                        "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
+                        "git -C %(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                         % vars, d, quiet=True).strip()
                     ver = gitpkgv_drop_tag_prefix(d, output)
                 except Exception:

