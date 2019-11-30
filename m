Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB9F7F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:53 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v93so11526183pjb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HK9jt85VgrP6bl+vPV+4dKQXAubjE6W5av/8LPvHVl4=;
	b=U4RVzZ+wh8/hxepO3K1NC/DtLWhiPB06AAFFMEN4i+Io/yCFpuEVpHvPkqvkbXBkzp
	5abRtKAFEy4Q/fSTC9Q5ZnnqRZ3f7p6GCZPIvPYQsfB3hTDUYDKvO0dhe+Qc40x0ZsMo
	/+xJYIzKZm6KnqLL+63EK9tJIbwbdf8lNAEjnkasIzLKSkk3RAJho5iGqgf/v8m+asgr
	ATsZBojemPgXsUYTGwblFRSTP4e+FbcLAu1PqtdOduM6oD0akQJz1/LCWMOjUA4JQjFB
	/iYDhHZn0saU95Fgr6lZgeTZ0GNnr4WY+T6/inGux5AxOHfa7WqzCeMfmdpGqgv6HDg8
	PZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HK9jt85VgrP6bl+vPV+4dKQXAubjE6W5av/8LPvHVl4=;
	b=JCFUALid90/tgl+MZ6TGTrRo1bc1AZHb/onaD6h94dXdLwDQu/rLqPBl9bgQ3D6Bmy
	ujSnI7EPi/PEN80HyLorOIjyaGJUz1IEInuwQ+VAWK0/bSBvkm5KKJFkBATp7cy0ftk6
	meL8mNElV1o6kCDDFzVR3EyFOarQoxyevNKeYmN07z9RBvw5wLaaSgz00WOEqGZ5M0N3
	phwnOq6V1ET4svBrWKALPFEprjLQYrcIC0oQ6k6RB0IX8S/hFVhg/DdEvLAmRBGiEFz/
	l5hXH+KZkdTqKZczvDc05JQWNr07THf1EDkt2iNiaUKsWwH6LJdRSnWCjcUYdch4uJlf
	E2hQ==
X-Gm-Message-State: APjAAAUueJy8vesi2UZ9Lrug1UNmRAKEcYrNMPgzg30ER31kf7oO0G+4
	oLpDliaAzttkybGw9itCN1TlkzYO
X-Google-Smtp-Source: APXvYqwxsTVEGWrD82hRouKRQ8BRPPzIX7yUYp7NQQnQ8BZLMM9ezWaELQi3kNcfnkWVMIeZvM5xiQ==
X-Received: by 2002:a17:902:7c83:: with SMTP id
	y3mr12229390pll.34.1575137453990; 
	Sat, 30 Nov 2019 10:10:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:35 -0800
Message-Id: <e5cba1a54cb953cbfa570fb2c2f2fecaabe2c8c5.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 05/15] gitpkgv.bbclass: Support also lightweight tags
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:53 -0000

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

When checking for commit specific tags during GITPKGVTAG resolution, use
additional '--tags' and '--exact-match' options for 'git describe'
command.

This changes the behaviour so that in case an annotated tag does not
exist for the particular commit, then the latest lightweight
(non-annotated) tag is used instead, in case that commit has at least
one such tag.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 22609f5..ab591bd 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -7,8 +7,8 @@
 #   NN equals the total number of revs up to SRCREV
 #   GITHASH is SRCREV's (full) hash
 #
-# - GITPKGVTAG which is the output of 'git describe' allowing for
-#   automatic versioning
+# - GITPKGVTAG which is the output of 'git describe --tags --exact-match'
+#   allowing for automatic versioning
 #
 # gitpkgv.bbclass assumes the git repository has been cloned, and
 # contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
@@ -103,7 +103,7 @@ def get_git_pkgv(d, use_tags):
                 if use_tags:
                     try:
                         output = bb.fetch2.runfetchcmd(
-                            "git --git-dir=%(repodir)s describe %(rev)s 2>/dev/null"
+                            "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
                             % vars, d, quiet=True).strip()
                         ver = gitpkgv_drop_tag_prefix(output)
                     except Exception:
-- 
2.7.4


