Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED6A7F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z4so16174930pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nNRQaZIiZSzsjyJmL6LwuJ1MIjHYWLVQvkcAzOVwus0=;
	b=lcCR0zadZVAzEWzH6BJoJ4Y4OYL6TvnMiS7Z91+eJBRWipawtaaKfj5btz26F6iTfM
	qbUAQfroXlol2c+n1UmgJC/BL5FhAR5OFqyCHSNwzfSUDnlynaNkpjvobaTdrVrLgeGt
	+g+lTU3utSQkbLqEwb7m2II01N5VrHj/2zuFlsNlrL/B2MDrma/hvcc3BpIbj9eZuONw
	rP7Aze6gov2x2gs+2bTZBabVAxc1yzejAEdIhcae7Zed3gSBYM1V19lURKMxo7WHGtSl
	wg4EOL40Acl/WBtxuE9e2dLZyfzZO8FJ2iKzmiz1aqAAg1xGWXsAqvALdBWXCPKEwV+o
	Uk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nNRQaZIiZSzsjyJmL6LwuJ1MIjHYWLVQvkcAzOVwus0=;
	b=V9wYvLL2Wz2tjw300p3JWWuHrckbEiOJoihhPnuGJGUyWn/tmjNZyMGzeq/V7RK4fQ
	4j6ETecK70o0/joYcl8xlk6ZNGaYOHFZgOYKgqJfwwuPLzxlDAruBJj84iugFQxnrZF7
	0ubzmqEv2q6Sp7+4E8DIeOERNJD4MBih2zztpiWjsqo1RA0pmSSa1EegI5hDKPE0TQMK
	5436bNTN4/w7eEVnKagNTe+wdZWwmogkYi5IMdLfmLsxokcn6nVluh+nN6mPA1ASrjtY
	aDV719pgi593ouVFMqOsZeCbptjDC1QKoH5PMyxWU1UZCHzQvRLyMQIuDmMAXp09/90P
	0aSg==
X-Gm-Message-State: APjAAAVNptUCsqSbBpmQhct36cdWsJaOr74ENiEmUS7mtOu0UIJ1sDLA
	lFxo493u8NLViXQLjSSZpgPEu/Z5
X-Google-Smtp-Source: APXvYqweKmoeo8WdbJn06vtX4HDgn7KwbKEHvlng4iGlVSaUOIjvxfIsm1M1mce3vmEdDh3ebwDCkQ==
X-Received: by 2002:a65:62cc:: with SMTP id m12mr21925916pgv.397.1575137453274;
	Sat, 30 Nov 2019 10:10:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:34 -0800
Message-Id: <81e1ae4657bde1cd843a219f99be4024b8b96f16.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 04/15] gitpkgv.bbclass: Use --git-dir option
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:52 -0000

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Avoid redundant shell working directory change by resorting to
'--git-dir' option for git command instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 2d9680a..22609f5 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -87,10 +87,8 @@ def get_git_pkgv(d, use_tags):
 
                 if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
                     commits = bb.fetch2.runfetchcmd(
-                        "cd %(repodir)s && "
-                        "git rev-list %(rev)s -- 2> /dev/null "
-                        "| wc -l" % vars,
-                        d, quiet=True).strip().lstrip('0')
+                        "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
+                        % vars, d, quiet=True).strip().lstrip('0')
 
                     if commits != "":
                         oe.path.remove(rev_file, recurse=False)
@@ -105,9 +103,8 @@ def get_git_pkgv(d, use_tags):
                 if use_tags:
                     try:
                         output = bb.fetch2.runfetchcmd(
-                            "cd %(repodir)s && "
-                            "git describe %(rev)s 2>/dev/null" % vars,
-                            d, quiet=True).strip()
+                            "git --git-dir=%(repodir)s describe %(rev)s 2>/dev/null"
+                            % vars, d, quiet=True).strip()
                         ver = gitpkgv_drop_tag_prefix(output)
                     except Exception:
                         ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
-- 
2.7.4


