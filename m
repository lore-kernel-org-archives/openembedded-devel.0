Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A34D6AC85
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 20:49:08 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id ft15so9367364pdb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2014 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jh5/mvXwPt0LJv63UTWRc00LSkjmDsNnB1LtCLX2aHY=;
	b=kc6m7GIpxU20gH+jtWQQKTst/dzc6FS1URZ6e3NySvB5EXrxVzKtVaTnSQsKF21upI
	o5fo2ZZyLIXOgxPZvEoUK8Cyq6SvdJ+Z9hz5g1pKfW3uyicABjmCa98n/z/Mws2mF3GW
	6jkSPVv2asOPPfRk/aLO5QVJuoVVZiyTZrpYjmogvjIJTSULrcbGlRhmOftym5xYXllY
	vM+JNQGV7LcXtmND4ph4bGSJ0HUS8dygX+AdDR51VWBhAQcI8JF0vKpGpHkUJAwx/t73
	kk5rcCdeeVRdPqlzfmoZ0wqen5klg/aOvnoCTRaxPpjqFnu6VBIj/zB5NW17KrApc8MP
	1b4w==
X-Received: by 10.66.182.227 with SMTP id eh3mr51251350pac.68.1409690949637;
	Tue, 02 Sep 2014 13:49:09 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id qy1sm4895955pbc.27.2014.09.02.13.49.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Sep 2014 13:49:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 13:52:57 -0700
Message-Id: <1409691177-24556-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH 4/5] subsurface: Adjust dependencies to match eglibc -> glibc move
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 20:49:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/subsurface/subsurface_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index 0632f21..fc50eb6 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -28,5 +28,5 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg"
-RRECOMMENDS_${PN}_append_libc-glibc = " eglibc-gconv-iso8859-15"
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-iso8859-15"
 
-- 
2.1.0


