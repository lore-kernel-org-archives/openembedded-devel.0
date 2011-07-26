Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1QloqV-0006lQ-61
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 23:07:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 362F120C9F4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:03:05 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dQ3zwCtMDDaW; Tue, 26 Jul 2011 15:03:03 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id A300820C9453;
	Tue, 26 Jul 2011 15:03:03 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id DD2F83136E; Tue, 26 Jul 2011 15:03:36 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 15:03:34 -0600
Message-Id: <1311714214-11748-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 1/3 v2] calibrator: Move to latest SVN rev 138
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:07:19 -0000

* The SVN repository for this project has changed URI.
* Upgrade to and patch the latest version for use with current tools.

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
v2:
 * Fix end quote on SRC_URI
 * Actually - it looks like the SRC_URI is correct after all.  Note that both the hostname and path have changed.

 recipes/calibrator/calibrator_svn.bb               |    7 +-
 .../calibrator/files/round_conflicting_types.patch |   91 ++++++++++++++++++++
 2 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 recipes/calibrator/files/round_conflicting_types.patch

diff --git a/recipes/calibrator/calibrator_svn.bb b/recipes/calibrator/calibrator_svn.bb
index bd7bb1f..4410dc4 100644
--- a/recipes/calibrator/calibrator_svn.bb
+++ b/recipes/calibrator/calibrator_svn.bb
@@ -2,11 +2,14 @@ DESCRIPTION = "The Calibrator, a Cache-Memory and TLB Calibration Tool"
 HOMEPAGE = "http://monetdb.cwi.nl/Calibrator/"
 LICENSE = "AS IS"
 
-SRCREV = "21"
+SRCREV = "138"
 PV = "0.9e+svnr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "svn://dev.bec-systems.com/svn/pub;module=calibrator;proto=http"
+SRC_URI = "\
+	svn://svn.bec-syste1ms.com/pub;module=calibrator;proto=http \
+	file://round_conflicting_types.patch \
+	"
 
 inherit autotools
 
diff --git a/recipes/calibrator/files/round_conflicting_types.patch b/recipes/calibrator/files/round_conflicting_types.patch
new file mode 100644
index 0000000..520c945
--- /dev/null
+++ b/recipes/calibrator/files/round_conflicting_types.patch
@@ -0,0 +1,91 @@
+round is a conflicting type ; rename to custom_round instead.
+
+diff -urN calibrator.orig/calibrator.c calibrator/calibrator.c
+--- calibrator.orig/calibrator.c	2011-07-11 16:40:32.000000000 -0600
++++ calibrator/calibrator.c	2011-07-11 16:44:22.333626120 -0600
+@@ -128,7 +128,7 @@
+ 	exit(1);
+ }
+ 
+-lng round(dbl x)
++lng custom_round(dbl x)
+ {
+ 	return (lng)(x + 0.5);
+ }
+@@ -890,16 +890,16 @@
+ 	fprintf(fp, ")\n");
+ 	fprintf(fp, "set y2tics");
+ 	for (l = 0, s = " ("; l <= cache->levels; l++, s = ", ") {
+-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
+-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, custom_round(CYperIt(cache->latency1[l] - delay)), NSperIt(cache->latency1[l] - delay));
++			else	fprintf(fp, "%s'(%ld)' %f", s, custom_round(CYperIt(cache->latency2[l] - delay)), NSperIt(cache->latency2[l] - delay));
+ 	}
+ 	for (y = 1; y <= yh; y *= 10) {
+ 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
+ 	}
+ 	fprintf(fp, ")\n");
+ 	for (l = 0; l <= cache->levels; l++) {
+-		if (!delay)	z = (dbl)round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
+-			else	z = (dbl)round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
++		if (!delay)	z = (dbl)custom_round(CYperIt(cache->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
++			else	z = (dbl)custom_round(CYperIt(cache->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
+ 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
+ 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
+ 	}
+@@ -986,16 +986,16 @@
+ 	fprintf(fp, "%s'<L1>' %ld)\n", s, TLB->mincachelines);
+ 	fprintf(fp, "set y2tics");
+ 	for (l = 0, s = " ("; l <= TLB->levels; l++, s = ", ") {
+-		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
+-			else	fprintf(fp, "%s'(%ld)' %f", s, round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
++		if (!delay)	fprintf(fp, "%s'(%ld)' %f", s, custom_round(CYperIt(TLB->latency1[l] - delay)), NSperIt(TLB->latency1[l] - delay));
++			else	fprintf(fp, "%s'(%ld)' %f", s, custom_round(CYperIt(TLB->latency2[l] - delay)), NSperIt(TLB->latency2[l] - delay));
+ 	}
+ 	for (y = 1; y <= yh; y *= 10) {
+ 		fprintf(fp, "%s'%1.3g' %ld", s, (dbl)(y * MHz) / 1000.0, y);
+ 	}
+ 	fprintf(fp, ")\n");
+ 	for (l = 0; l <= TLB->levels; l++) {
+-		if (!delay)	z = (dbl)round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
+-			else	z = (dbl)round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
++		if (!delay)	z = (dbl)custom_round(CYperIt(TLB->latency1[l] - delay)) * 1000.0 / (dbl)MHz;
++			else	z = (dbl)custom_round(CYperIt(TLB->latency2[l] - delay)) * 1000.0 / (dbl)MHz;
+ 		fprintf(fp, "set label %ld '(%1.3g)  ' at %f,%f right\n", l + 1, z, xl, z);
+ 		fprintf(fp, "set arrow %ld from %f,%f to %f,%f nohead lt 0\n", l + 1, xl, z, xh, z);
+ 	}
+@@ -1023,9 +1023,9 @@
+ 	FILE	*fp = stdout;
+ 		
+ 	fprintf(fp, "CPU loop + L1 access:    ");
+-	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), round(CYperIt(cache->latency1[0])));
++	fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[0]), custom_round(CYperIt(cache->latency1[0])));
+ 	fprintf(fp, "             ( delay:    ");
+-	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            round(CYperIt(delay)));
++	fprintf(fp, " %6.2f ns = %3ld cy )\n", NSperIt(delay),            custom_round(CYperIt(delay)));
+ 	fprintf(fp, "\n");
+ 	fflush(fp);
+ }
+@@ -1047,8 +1047,8 @@
+ 			fprintf(fp, " %3ld KB ", cache->size[l] / 1024);
+ 		}
+ 		fprintf(fp, " %3ld bytes ", cache->linesize[l + 1]);
+-		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
+-		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
++		fprintf(fp, " %6.2f ns = %3ld cy " , NSperIt(cache->latency2[l + 1] - cache->latency2[l]), custom_round(CYperIt(cache->latency2[l + 1] - cache->latency2[l])));
++		fprintf(fp, " %6.2f ns = %3ld cy\n", NSperIt(cache->latency1[l + 1] - cache->latency1[l]), custom_round(CYperIt(cache->latency1[l + 1] - cache->latency1[l])));
+ 	}
+ 	fprintf(fp, "\n");
+ 	fflush(fp);
+@@ -1075,9 +1075,9 @@
+ 		} else {
+ 			fprintf(fp, "  %3ld KB  ", TLB->pagesize[l + 1] / 1024);
+ 		}
+-		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
++		fprintf(fp, " %6.2f ns = %3ld cy ", NSperIt(TLB->latency2[l + 1] - TLB->latency2[l]), custom_round(CYperIt(TLB->latency2[l + 1] - TLB->latency2[l])));
+ /*
+-		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
++		fprintf(fp, " %6.2f ns = %3ld cy" , NSperIt(TLB->latency1[l + 1] - TLB->latency1[l]), custom_round(CYperIt(TLB->latency1[l + 1] - TLB->latency1[l])));
+ */
+ 		fprintf(fp, "\n");
+ 	}
-- 
1.7.0.4



