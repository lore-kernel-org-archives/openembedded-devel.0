Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34B9C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:42:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11115.1742485345564071127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 08:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E9BSDRr2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso10533735e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742485343; x=1743090143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ksna2hr54cp84vlGnJl11FOuXO88JyhfNK5M3J7Y6f8=;
        b=E9BSDRr2bMBU2lPC+DCcOTvnZ74bj5Ns6viwOKKW/AHYm1GGoaagk96wCBnVVSaMav
         pNTaL2RelkWj0hKCFS+deiFmkhYHm1rT/yEas36DjHsglrobv374IV/GPRvcXhNjMbpW
         0ge+SAdmquAIvFUQMfBU1xZgHVF2kyvmKPSjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485343; x=1743090143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksna2hr54cp84vlGnJl11FOuXO88JyhfNK5M3J7Y6f8=;
        b=VHroPSTDn3PtU0NT6dEZ2HQvd5nMidzEn0A01Qikqeo14mlOx8TEdaADkgK4el6udl
         86JTL3fay+ZQFbV3tDtVMo0LDk0syxs+R42a6NoeMaZjOHgRO1uLrebNRsyuGaY+KoWR
         SqtdrXaErGNuCmknSubXbc9Y7pSB7WJJWdQyi5zqwxOdae+oHcLLuZ68M8YBW0qDFAKv
         VC7iHGXQ3Tzh509S+621kXqWCZd0uCjsFUEZyefsLokw8oFMfiY6YLZp1ffPIgVawBFp
         dQuFkM4cb5+Dp+hHg2cOM186x0dww8QBt+UymZgX00x44gUiaxyf0i1DvYvYgZQ/jhXZ
         Ca1Q==
X-Gm-Message-State: AOJu0YxtQ+LLVxMOPhbkOefp5nzOcnNXlRo0KvaagunD7H43TrHqhGTB
	j2RrWZNqAnCQJuS/rHHVtfWL/Fsh6Cwili2GCjEOIgIs/jzLPgg05iNH5hJ0/oeQTpThMm6SdrJ
	o
X-Gm-Gg: ASbGnctuvhVfp3YyGw+HinPgoXJFJjwTCAFot326dQff9KPUSFUUIKXCTCf5sgZpvqq
	ipArJ/8SuVqfZuUe0Lb94BDbQWroyqexzgaSqQa8MMkzitc6f8P9yaY7zUe6teOIQ7r8hhidKW/
	kYjtzm+wlxje/HlENYOSlKwfLH/y0FhyNEm+VLHZ39H/PcGkXZFmfI4QEnE1FCO7N3tkx+0bcg+
	ETkgh18KysK753V+3u0ouYfj6nRWsNBn7w3wJ2zNvsvyZhr9VhuGfbyi6n+/f30W2j+ddrftd0C
	cbzQt1GIRg99c4Beit5whe4hX3ymHUyel5w2vF3NGFBABBaIGWKzH0CYh9xkrJ0Yd3d0dQRntw=
	=
X-Google-Smtp-Source: AGHT+IEfW+NYnyP37i8uJTQoYBa7XzN4ssKuiVgabLjPG9keOz/3TdE9SrvHwHRLqDBizW+2pBz8nA==
X-Received: by 2002:a05:600c:511f:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43d4ec4666emr10569745e9.24.1742485343121;
        Thu, 20 Mar 2025 08:42:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a5fsm24517647f8f.79.2025.03.20.08.42.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:42:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH v2] gitpkgver: Update to match bitbake fetcher changes
Date: Thu, 20 Mar 2025 15:42:21 +0000
Message-ID: <20250320154221.968139-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 15:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116138

The bitbake fetcher dropped support for multiple revisions on a single
url. Update the gitpkgver code to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/classes/gitpkgv.bbclass | 68 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 5ab507969c..af98f256ab 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -70,54 +70,52 @@ def get_git_pkgv(d, use_tags):
         names = []
         for url in ud.values():
             if url.type == 'git' or url.type == 'gitsm':
-                names.extend(url.revisions.keys())
+                names.extend(url.revision)
         if len(names) > 0:
             format = '_'.join(names)
         else:
             format = 'default'
-
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
+                     'rev' : quote(url.revision) }
 
-                rev = bb.fetch2.get_srcrev(d).split('+')[1]
-                rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + rev)
+            rev = bb.fetch2.get_srcrev(d).split('+')[1]
+            rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + url.revision)
 
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
-                else:
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
+                if commits != "":
+                    oe.path.remove(rev_file, recurse=False)
+                    with open(rev_file, "w") as f:
+                        f.write("%d\n" % int(commits))
                 else:
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
+            format = format.replace(url.name, ver)
 
     if found:
         return format

