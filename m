Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama3.dnainternet.net
	[83.102.40.155])
	by mail.openembedded.org (Postfix) with ESMTP id 571AE7FCAE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Nov 2019 13:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 7CE6528B70;
	Sat, 23 Nov 2019 15:46:50 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.155])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id 5CIZQzdOrjTa; Sat, 23 Nov 2019 15:46:50 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 13C77288B6;
	Sat, 23 Nov 2019 15:46:50 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 381088F;
	Sat, 23 Nov 2019 15:46:45 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Nov 2019 15:46:30 +0200
Message-Id: <20191123134631.81271-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][warrior][PATCH 1/2] gitpkgv.bbclass: Use --git-dir option
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
X-List-Received-Date: Sat, 23 Nov 2019 13:53:37 -0000
Content-Transfer-Encoding: 8bit

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Avoid redundant shell working directory change by resorting to
'--git-dir' option for git command instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 2d9680a35..22609f584 100644
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
2.20.1


