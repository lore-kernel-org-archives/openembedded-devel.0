Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 716B977558
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 18:36:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a136so1280052wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2016 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zEOVsMEZaKFIRTuIzfocXMwmqnbG56mt0jHi1O7s7H8=;
	b=XXTUQXoMDa7bssaU08QnoTwTWMXLK/52lzI5Fvz1wRSEJDkyvwEUGToO27aGo9L3SN
	H+ltL3FpYsHMQ2eoJ6m1Fq7w2dMdRrKyIaRc2lnHlwQIZ9/gCEXWCSZbvQgD09rLxHSp
	GyaBAsQeDIE92eNVRUtW6T6p1/CGYg0ZFSiPGv8ghNzm7S3xeFMw/LERPn9YvHfbpDPb
	dl94pWvdZu8ph6zVtfXZ5HXUUODXiAnoEPSMQDeyXybzuyk/k1NYTrQdUjNTODxD/Ghu
	amLp/ibbFjXgNH7p8+tR2Xl3+eVWUDdfdwDKMx1DC0CJh/X9TY0cfLzceT1GmqYRxno5
	fM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zEOVsMEZaKFIRTuIzfocXMwmqnbG56mt0jHi1O7s7H8=;
	b=ZaXXDADLgTdcw9SmzRKsYcmFuUoOmAy7KlSS2dUu/XRXRBOChkIw5lO8wBeRAm3oPa
	a52/ylJrAZMI+gyfUhexGMNJW67duvinW5CufCQcXZbrdFklAH3F/TpBf6tYKde3PO0R
	/uKypMr6plC9UhCBV6s5Nqrufj0XenLJzL9AQGZqtFhEzo/daaqRJobrm3MInES1AONE
	MPwz61Nn8yEkcH/dQWHzpn4GnIfu+ey+oVkFz7VH3R66g5xm856Z1Ow3gqXLs/ybdOU6
	3qqFeAEQvIB8eXKNmiK6mogbrrDRoLjlglrZ9pzOCCNjk48fav4zeZK5vSttXjJ0Ft0x
	Gc3A==
X-Gm-Message-State: ALyK8tIkaOlUlt8vTEjKIWAl7kKR6KH0WI8uYsx0BgcHQ863Kz0Aw6y0rOLrRV/ctLc38g==
X-Received: by 10.194.109.4 with SMTP id ho4mr4683535wjb.78.1464979011150;
	Fri, 03 Jun 2016 11:36:51 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	wb10sm6994842wjc.8.2016.06.03.11.36.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jun 2016 11:36:49 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jun 2016 11:36:44 -0700
Message-Id: <1464979004-19187-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] gitpkgv: ensure that we close our opened files
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
X-List-Received-Date: Fri, 03 Jun 2016 18:36:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

Avoids warnings like this with python3:

    WARNING: .../meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb: <string>:94: ResourceWarning: unclosed file <_io.TextIOWrapper name='.../build/downloads/git2/smbnetfs.git.sourceforge.net.gitroot.smbnetfs.smbnetfs/oe-gitpkgv_ace1c519d4' mode='r' encoding='UTF-8'>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/classes/gitpkgv.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 1cba00c..4866fac 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -87,11 +87,13 @@ def get_git_pkgv(d, use_tags):
 
                     if commits != "":
                         oe.path.remove(rev_file, recurse=False)
-                        open(rev_file, "w").write("%d\n" % int(commits))
+                        with open(rev_file, "w") as f:
+                            f.write("%d\n" % int(commits))
                     else:
                         commits = "0"
                 else:
-                    commits = open(rev_file, "r").readline(128).strip()
+                    with open(rev_file, "r") as f:
+                        commits = f.readline(128).strip()
 
                 if use_tags:
                     try:
-- 
2.8.0


