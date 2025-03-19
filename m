Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7037CC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:45:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12834.1742402715174614892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hc8s0o0s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2788561f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742402713; x=1743007513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3PD/ln2q4J+QC7JFehVCEbuz31bk4ou86amwD9UxZA=;
        b=hc8s0o0sjf6eDaDbuDvuAHfte8er/jrehzmqENlsI6k420Cmniyf/oPPrHD0yjd8Qq
         BVSJ2V0i9pEElMeIUf0QEz8yi+phJ9EqKRVFt4byv0UtKM47QDaysNksdZnQlTufrZ0m
         MiAhy+5YqvH2AGslNDeMTkkx3lFYGycvxjm1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402713; x=1743007513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3PD/ln2q4J+QC7JFehVCEbuz31bk4ou86amwD9UxZA=;
        b=PE+v/laqin8uHSgzrdY4U62aWQ8NBNPYOxU45xdIyLtIr965eRu+UK5VgA4jo7hVM1
         JLrDUbm/5VtGcnkuUGLiKTRFdiHNK23jWlnYBBA6o3utB/f8mTByVLseRExGAL4f52C0
         WRr8QPshNQO6dcdunRvmI0H6Asyd00EyEJXIeWGlf4UMFQRkGvBNaptqtz2m+6q2kOzH
         rq5R41NcbNX6XRwuvbt2pNZwKM2/81YuCoLeW0PmG3seGuxHTTXSBxpD5Vm7EFVGoAyU
         pRopS4lZ/NNOHfaGDKVTU9FwA6bfQ1qpicCu0tdSBx5oF817rQ48c9dQ2K872tKJKkEy
         zOzA==
X-Gm-Message-State: AOJu0YzYLYFfbo9DL9KWOa3AXSHlJBwmJJDOnLCVNhbdksfzryhndgKc
	nG37oiS07oN/3N0Yy821qDIv6ckuY3UKu4zWYBmNWXPf2Q2r5x3CXA2xdWnm7KHhrdRgnwFzjlz
	v
X-Gm-Gg: ASbGncuaDlru1E4YcI4H9t6h/NH9Pnm4gsQt+atmXbjSwtRPN4Nm4zoQaiDLVHVMkof
	p1iTVeDs59ZURi6YQC3F2fgQK5KaXyLQAEHGAqeeEZ4DEoYHV7yOKX/jK35SUuO3qZVIQxGY1Zj
	AAJD8/Jsq1/VX4KHeQ23loUjNDOqf56EWoAv/apfc5jJ/Gz23hAhSusS4bXZ8ADMWCBa/iVSFHO
	D/XFbnMrGqwPvn9ELTadCMXRNwGW76KURmTgAucOpitWmedUEEQNPZ1Sju6SuQUu71+Aow8VrrB
	R9m/FIHnqDUUytiNvSkDIyviXPHd54g2Sx9KSUl1JoAYepeIz2CmfXHXNIcz+izcBDHsyuCO
X-Google-Smtp-Source: AGHT+IEFeRYjqaoF7xDkQmZk7VWfXNLmNVdJVxWxSct6dkZ8c5DE6yQf0eYrvheVmplIFMy5QHV20w==
X-Received: by 2002:a05:6000:4029:b0:391:1806:e23f with SMTP id ffacd0b85a97d-399739beb1bmr3010773f8f.17.1742402712963;
        Wed, 19 Mar 2025 09:45:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55721sm23617585e9.20.2025.03.19.09.45.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:45:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] gitpkgver: Update to match bitbake fetcher changes
Date: Wed, 19 Mar 2025 16:45:11 +0000
Message-ID: <20250319164511.832211-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116083

The bitbake fetcher dropped support for multiple revisions on a single
url. Update the gitpkgver code to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/classes/gitpkgv.bbclass | 73 +++++++++++++++------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 5ab507969c..8c99518d5d 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -67,57 +67,52 @@ def get_git_pkgv(d, use_tags):
     #
     format = d.getVar('SRCREV_FORMAT')
     if not format:
-        names = []
-        for url in ud.values():
-            if url.type == 'git' or url.type == 'gitsm':
-                names.extend(url.revisions.keys())
-        if len(names) > 0:
-            format = '_'.join(names)
+        if ud.name:
+            format = ud.name
         else:
             format = 'default'
 
     found = False
     for url in ud.values():
         if url.type == 'git' or url.type == 'gitsm':
-            for name, rev in url.revisions.items():
-                if not os.path.exists(url.localpath):
-                    return None
+            if not os.path.exists(url.localpath):
+                return None
 
-                found = True
+            found = True
 
-                vars = { 'repodir' : quote(url.localpath),
-                         'rev' : quote(rev) }
+            vars = { 'repodir' : quote(url.localpath),
+                     'rev' : quote(ud.revision) }
 
-                rev = bb.fetch2.get_srcrev(d).split('+')[1]
-                rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + rev)
+            rev = bb.fetch2.get_srcrev(d).split('+')[1]
+            rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + ud.revision)
 
-                if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
-                    commits = bb.fetch2.runfetchcmd(
-                        "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
-                        % vars, d, quiet=True).strip().lstrip('0')
+            if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
+                commits = bb.fetch2.runfetchcmd(
+                    "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
+                    % vars, d, quiet=True).strip().lstrip('0')
 
-                    if commits != "":
-                        oe.path.remove(rev_file, recurse=False)
-                        with open(rev_file, "w") as f:
-                            f.write("%d\n" % int(commits))
-                    else:
-                        commits = "0"
+                if commits != "":
+                    oe.path.remove(rev_file, recurse=False)
+                    with open(rev_file, "w") as f:
+                        f.write("%d\n" % int(commits))
                 else:
-                    with open(rev_file, "r") as f:
-                        commits = f.readline(128).strip()
-
-                if use_tags:
-                    try:
-                        output = bb.fetch2.runfetchcmd(
-                            "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
-                            % vars, d, quiet=True).strip()
-                        ver = gitpkgv_drop_tag_prefix(d, output)
-                    except Exception:
-                        ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
-                else:
-                    ver = "%s+%s" % (commits, vars['rev'][:7])
-
-                format = format.replace(name, ver)
+                    commits = "0"
+            else:
+                with open(rev_file, "r") as f:
+                    commits = f.readline(128).strip()
+
+            if use_tags:
+                try:
+                    output = bb.fetch2.runfetchcmd(
+                        "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
+                        % vars, d, quiet=True).strip()
+                    ver = gitpkgv_drop_tag_prefix(d, output)
+                except Exception:
+                    ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
+            else:
+                ver = "%s+%s" % (commits, vars['rev'][:7])
+
+            format = format.replace(ud.name, ver)
 
     if found:
         return format

