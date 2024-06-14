Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BADC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 07:53:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6407.1718351617392333655
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 00:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6895a578d0=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E7BTZd026605
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 00:53:37 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg5uq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 00:53:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 00:53:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 00:53:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] tnftp: fix lib32-tnftp build failure with gcc-14
Date: Fri, 14 Jun 2024 15:53:34 +0800
Message-ID: <20240614075334.3571696-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 92TFNt6d6jhKN6idCp6XciLcF4lyoTzB
X-Proofpoint-GUID: 92TFNt6d6jhKN6idCp6XciLcF4lyoTzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406140054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 07:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110902

From: Changqing Li <changqing.li@windriver.com>

lib32-tnftp do_compile failed with gcc-14:
../../tnftp-20230507/libedit/terminal.c:597:56: error: passing argument 2 of 'terminal_overwrite' from incompatible pointer type [-Wincompatible-pointer-types]
  597 |                                 terminal_overwrite(el, &el->el_display[
      |                                                        ^~~~~~~~~~~~~~~~
      |                                                        |
      |                                                        wint_t * {aka unsigned int *}
  598 |                                     el->el_cursor.v][el->el_cursor.h],
      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../tnftp-20230507/libedit/refresh.c:114:38: error: initialization of 'wchar_t *' {aka 'long int *'} from incompatible pointer type 'wint_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
  114 |                 wchar_t *firstline = el->el_vdisplay[0];

For 64bit system:
wchar_t is defined as int
wint_t is define as unsigned int

For 32bit system:
wchar_t is defined as long int
wint_t is define as unsigned int

In 64bit case, it works well, but in 32bit case, gcc will take it as
incompatible, and report above error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ease-conversions-between-wchar_t-and.patch | 77 +++++++++++++++++++
 ...ease-conversions-between-wchar_t-and.patch | 29 +++++++
 .../recipes-support/tnftp/tnftp_20230507.bb   |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp/0001-Add-casts-to-appease-conversions-between-wchar_t-and.patch
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp/0002-Add-casts-to-appease-conversions-between-wchar_t-and.patch

diff --git a/meta-networking/recipes-support/tnftp/tnftp/0001-Add-casts-to-appease-conversions-between-wchar_t-and.patch b/meta-networking/recipes-support/tnftp/tnftp/0001-Add-casts-to-appease-conversions-between-wchar_t-and.patch
new file mode 100644
index 000000000..bbd6c7843
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp/0001-Add-casts-to-appease-conversions-between-wchar_t-and.patch
@@ -0,0 +1,77 @@
+From 46477eb182af51b5da8299b295a6d61e566e3693 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 14 Jun 2024 06:27:19 +0000
+Subject: [PATCH] Add casts to appease conversions between wchar_t and wint_t
+
+Upstream-Status: Backport [http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit/refresh.c.diff?r1=1.57&r2=1.58&only_with_tag=MAIN&f=h]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libedit/refresh.c    | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/libedit/refresh.c b/libedit/refresh.c
+index 093f993..a6d4574 100644
+--- a/libedit/refresh.c
++++ b/libedit/refresh.c
+@@ -111,7 +111,7 @@ re_nextline(EditLine *el)
+ 	 */
+ 	if (el->el_refresh.r_cursor.v + 1 >= el->el_terminal.t_size.v) {
+ 		int i, lins = el->el_terminal.t_size.v;
+-		wchar_t *firstline = el->el_vdisplay[0];
++		wint_t *firstline = el->el_vdisplay[0];
+ 
+ 		for(i = 1; i < lins; i++)
+ 			el->el_vdisplay[i - 1] = el->el_vdisplay[i];
+@@ -340,7 +340,8 @@ re_refresh(EditLine *el)
+ 	ELRE_DEBUG(1, (__F, "updating %d lines.\r\n", el->el_refresh.r_newcv));
+ 	for (i = 0; i <= el->el_refresh.r_newcv; i++) {
+ 		/* NOTE THAT re_update_line MAY CHANGE el_display[i] */
+-		re_update_line(el, el->el_display[i], el->el_vdisplay[i], i);
++		re_update_line(el, (wchar_t *)el->el_display[i],
++				(wchar_t *)el->el_vdisplay[i], i);
+ 
+ 		/*
+ 		 * Copy the new line to be the current one, and pad out with
+@@ -349,8 +350,9 @@ re_refresh(EditLine *el)
+ 		 * end of the screen line, it won't be a NUL or some old
+ 		 * leftover stuff.
+ 		 */
+-		re__copy_and_pad(el->el_display[i], el->el_vdisplay[i],
+-		    (size_t) el->el_terminal.t_size.h);
++		re__copy_and_pad((wchar_t *)el->el_display[i], 
++			(wchar_t *)el->el_vdisplay[i],
++			(size_t) el->el_terminal.t_size.h);
+ 	}
+ 	ELRE_DEBUG(1, (__F,
+ 	"\r\nel->el_refresh.r_cursor.v=%d,el->el_refresh.r_oldcv=%d i=%d\r\n",
+@@ -361,7 +363,7 @@ re_refresh(EditLine *el)
+ 			terminal_move_to_line(el, i);
+ 			terminal_move_to_char(el, 0);
+                         /* This wcslen should be safe even with MB_FILL_CHARs */
+-			terminal_clear_EOL(el, (int) wcslen(el->el_display[i]));
++			terminal_clear_EOL(el, (int) wcslen((const wchar_t *)el->el_display[i]));
+ #ifdef DEBUG_REFRESH
+ 			terminal_overwrite(el, L"C\b", 2);
+ #endif /* DEBUG_REFRESH */
+@@ -1097,7 +1099,7 @@ re_refresh_cursor(EditLine *el)
+ static void
+ re_fastputc(EditLine *el, wint_t c)
+ {
+-	wchar_t *lastline;
++	wint_t *lastline;
+ 	int w;
+ 
+ 	w = wcwidth(c);
+@@ -1132,7 +1134,7 @@ re_fastputc(EditLine *el, wint_t c)
+ 			el->el_cursor.v++;
+ 			lastline = el->el_display[++el->el_refresh.r_oldcv];
+ 		}
+-		re__copy_and_pad(lastline, L"", (size_t)el->el_terminal.t_size.h);
++		re__copy_and_pad((wchar_t *)lastline, L"", (size_t)el->el_terminal.t_size.h);
+ 
+ 		if (EL_HAS_AUTO_MARGINS) {
+ 			if (EL_HAS_MAGIC_MARGINS) {
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-support/tnftp/tnftp/0002-Add-casts-to-appease-conversions-between-wchar_t-and.patch b/meta-networking/recipes-support/tnftp/tnftp/0002-Add-casts-to-appease-conversions-between-wchar_t-and.patch
new file mode 100644
index 000000000..c041d0a9d
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp/0002-Add-casts-to-appease-conversions-between-wchar_t-and.patch
@@ -0,0 +1,29 @@
+From 5c8334f86d139de987c716a0d5acc0f40d8d3b7d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 14 Jun 2024 06:38:37 +0000
+Subject: [PATCH] Add casts to appease conversions between wchar_t and wint_t
+
+Upstream-Status: Backport [http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit/terminal.c.diff?r1=1.43&r2=1.44&only_with_tag=MAIN&f=h]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libedit/terminal.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libedit/terminal.c b/libedit/terminal.c
+index 19cee48..13f7bcd 100644
+--- a/libedit/terminal.c
++++ b/libedit/terminal.c
+@@ -594,7 +594,8 @@ mc_again:
+ 				 * NOTE THAT terminal_overwrite() WILL CHANGE
+ 				 * el->el_cursor.h!!!
+ 				 */
+-				terminal_overwrite(el, &el->el_display[
++				terminal_overwrite(el,
++					(wchar_t *)&el->el_display[
+ 				    el->el_cursor.v][el->el_cursor.h],
+ 				    (size_t)(where - el->el_cursor.h));
+ 
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
index bdd9759f2..4ab694fbb 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
@@ -16,6 +16,8 @@ DEPENDS = "ncurses"
 
 SRC_URI = "https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
            file://0001-libedit-Include-missing-header-stdc-predef.h.patch \
+           file://0001-Add-casts-to-appease-conversions-between-wchar_t-and.patch \
+           file://0002-Add-casts-to-appease-conversions-between-wchar_t-and.patch \
 "
 
 inherit autotools update-alternatives pkgconfig
-- 
2.25.1


