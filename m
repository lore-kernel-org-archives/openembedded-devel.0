Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id C68F260CE7
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id p14so2427528pfn.4
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F0LjWFLOCA/ngqM9kLraCcYN/Vc/DOqZ0ktECDT/URs=;
	b=upr0j0CpmPcysTs9PJArreaCuygsLnNrBem/8WqON1UtA1n8H8+ioOFzlpT9ycVMho
	xi+9nmJlV7l3v/rg69s2y/SmbVoHyIv/zZoyZVO/FD06SghPmUJ6MWg1n2Hgb22hqtM/
	UDnMynTvKl8lcZ0iJGh8HCpuVNo7P/wnhGTzlosjN3ox9jT4NqtZyMRtsJCSXqIcj337
	LsdcKssboCcchSFf6QpwshPzKsNlW7UzBwzqICkw1Jjq2heaDqL3LIyZwaD2NUMiqIxL
	0oyjOEa7l/7TrnQfWgzCXl8Tpqe9tUzUmV6S0vbLDviNmmez1C/4U4KjtgHywd9WWqMe
	xdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F0LjWFLOCA/ngqM9kLraCcYN/Vc/DOqZ0ktECDT/URs=;
	b=lm71iKVYeHXHAwOwqEwEssG00R+vfIC667EkSGiCOHeVM5eOaYB/w0I6xLT4lno9K4
	H2VyrAfM+CsDKOUI7FAisWjXZMK+nCskN9DKrI/x8Qm+TFrkeBr8zBgOchF6pXw76o2y
	nJFZsml0zQSUoa678PAxNSAlh/jKIPI2OmT//wIJwwLaFSoJIu3bjMdpp25tbFZNhTBk
	UBhCOOFpwaHxAmSgmiQ562OhVuHM26S8FTvFVxN2zloCQpeQRe9kRwzLhYZhDLBSvjCg
	lsYcB5UXrIpo5TBiLa9s2gXG3wnXLzgaaRLF9a8t5PGbos/oo0ZoHqhjVbC0y3AFpcDx
	W5mQ==
X-Gm-Message-State: APjAAAUjISQO902HfxZY+/A4GdDmfxognpI3AUvFBwOY3b1YTh702RIn
	lFO8gF4V2RnkXtnCEn2a0hDimGZu
X-Google-Smtp-Source: APXvYqyro5zPIqNRkgJbzHshE0U8Nw0F/BPJ8JM3lP1v55M2q3epMEZyXL3d/bguoda2aAD/sPl15g==
X-Received: by 2002:a63:ad0c:: with SMTP id g12mr6237802pgf.228.1581265048638; 
	Sun, 09 Feb 2020 08:17:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.27
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:13 -0800
Message-Id: <b95100003df03c22eebe6ae5e4342b5281a2ef64.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 05/11] gitpkgv.bbclass: Add support for extending the supported tag formats
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 16:17:27 -0000

From: Peter Kjellerstedt <pkj@axis.com>

Introduce GITPKGV_TAG_REGEXP (which defaults to "v(\d.*)") to support
dropping other unwanted parts of the found tags than just a leading
"v". Any matching groups in the regexp will be concatenated to yield
the final version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b51af6b5b7a41b44d3539f44c10d21624c4cc4a7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index ab591bd45c..180421ed35 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -40,10 +40,16 @@
 GITPKGV = "${@get_git_pkgv(d, False)}"
 GITPKGVTAG = "${@get_git_pkgv(d, True)}"
 
-def gitpkgv_drop_tag_prefix(version):
+# This regexp is used to drop unwanted parts of the found tags. Any matching
+# groups will be concatenated to yield the final version.
+GITPKGV_TAG_REGEXP ??= "v(\d.*)"
+
+def gitpkgv_drop_tag_prefix(d, version):
     import re
-    if re.match("v\d", version):
-        return version[1:]
+
+    m = re.match(d.getVar('GITPKGV_TAG_REGEXP'), version)
+    if m:
+        return ''.join(group for group in m.groups() if group)
     else:
         return version
 
@@ -105,7 +111,7 @@ def get_git_pkgv(d, use_tags):
                         output = bb.fetch2.runfetchcmd(
                             "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                             % vars, d, quiet=True).strip()
-                        ver = gitpkgv_drop_tag_prefix(output)
+                        ver = gitpkgv_drop_tag_prefix(d, output)
                     except Exception:
                         ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
                 else:
-- 
2.17.1


