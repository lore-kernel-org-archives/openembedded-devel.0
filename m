Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.24637.1629941627728674466
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AwzH4dnq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629941625; i=@fujitsu.com;
	bh=TFaoqbyVvQ14DKzxBZ5DuKFP+YEgDg+KOPrIzVOe4G4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AwzH4dnqUKEA4Lt8mmJIA7kWfe/s4dLycFBUMZLtg35Evx7+4V9g1/hMWy5Xg8Meh
	 7ddL825KPmK6cqm3XVFI+8/zKf16K3/aTj0TpJGx+3IafOv6U2dvY7fQiPhnkbN9VJ
	 U6TxMPQaZ3bTMmieDDbkhW+MpDtjbsU0AhDtN5Vj7/N2walHIx3iJfGjH3zlB99CYP
	 muf7Um9YbdpdKXUxKfZ+4MMWkVpPvSKVKCzDuN4UlwjrhQtakE65GhIKnEpbAOtJ2D
	 juxQReToDCLA4yhFA6M5jm+v96kHLEdAfIqH3lxiOBVOC29BsK6k7vhcR5pmkETeMG
	 eKuv4podCiAcA==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 57/71-28286-87FE6216; Thu, 26 Aug 2021 01:33:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxVbfivVq
  iwd6FMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+f2IFjWIVB16vYGtg3CHcxcjFISQwm0ni
  ce9/dgjnBKPEow3NjF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0D1MDBISzgInHtT
  C6IySKgKvHySB1IBa+Ak8TRI5PBpkgIKEhMefgerJNTwFni15nTrCDlQkA1V+dGQZQLSpyc+Y
  QFYriExMEXL5ghWhUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGho
  Y6BoaGusCSWMDvcQq3US91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmAophQyNO1gfPfq
  g94hRkkOJiVR3vkH1RKF+JLyUyozEosz4otKc1KLDzHKcHAoSfB+ew2UEyxKTU+tSMvMAcYFT
  FqCg0dJhHfGW6A0b3FBYm5xZjpE6hSjMceEv/MWMXO8+7l4EbMQS15+XqqUOO92kFIBkNKM0j
  y4QbB4vcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcJyBSezLwSuH2vgE5hAjqlgE8V5JS
  SRISUVAPThCT2IwXbvaafdVVMinz05IKzaeVK02UMMgdv1bNKFqf+mOMQMDPswudjd49cDKvv
  4/pdfmgT1/+lvwsDRZb/Cs54Of1Nzn1JKabV7cKz1hT0/E8xjm1lSny65fIf41XN8yPe1zem2
  /RmvlD4wrswJ02w74val55ai6n7s3uknt8N0rrf9rWn/Z2HxOq/ywqOhGgmWzxPXrH6iKPoCh
  WvgwIuilV9i66/uPFf/IvHtIzqD+phq4X0o+VyLD5dXmb6JqHnd8aP1fMeyUyfnLkoqGZqbnw
  SQ/U9nZpVSW4P3OWaahyLKs8K6284/3HTP2Xj+Nv3Gau7opMuf3u2xXYps8t0kwwrwyOne1gc
  xNcqsRRnJBpqMRcVJwIAh8FDxlIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1629941624!9143!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18532 invoked from network); 26 Aug 2021 01:33:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 01:33:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q1XZj0018832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 02:33:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 02:33:35 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sedutil: upgrade 1.15.1.01 -> 1.20.0
Date: Thu, 26 Aug 2021 09:33:14 +0800
Message-ID: <1629941597-62033-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
References: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch
removed since it is included in 1.20.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...edDump-Add-typedef-name-to-the-union.patch | 34 -------------------
 .../recipes-extended/sedutil/sedutil_git.bb   |  9 +++--
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch b/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch
deleted file mode 100644
index 4be3353c66..0000000000
--- a/meta-oe/recipes-extended/sedutil/files/0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9db49b94336f65453e06fb6a6bc4e6edf9403fea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Aug 2020 17:22:09 -0700
-Subject: [PATCH] DtaAnnotatedDump: Add typedef name to the union
-
-This is found with clang
-error: anonymous non-C-compatible type given name for linkage purposes by
-typedef declaration; add a tag name here [-Werror,-Wnon-c-typedef-for-linkage]
-| typedef union
-|              ^
-|               CAtomHeader
-
-Upstream-Status: Submitted [https://github.com/Drive-Trust-Alliance/sedutil/pull/332]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Common/DtaAnnotatedDump.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Common/DtaAnnotatedDump.h b/Common/DtaAnnotatedDump.h
-index 2749365..734c8eb 100644
---- a/Common/DtaAnnotatedDump.h
-+++ b/Common/DtaAnnotatedDump.h
-@@ -20,7 +20,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
- 
- #pragma pack(push,1)
- 
--typedef union
-+typedef union CAtomHeader_t
- {
-     // four bytes in big endian (network) byte order
-     uint8_t     all[4];
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index 53330c0675..99e358648f 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -8,12 +8,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
 BASEPV = "1.15.1"
-PV = "1.15.1.01"
-SRCREV = "565670749ef6947a905c451477a3a9a15e7e0ba5"
+PV = "1.20.0"
+SRCREV = "d3de8e45e06a21d31cca0046ceb16ced1ef3563a"
 SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git \
-	file://0001-Fix-build-on-big-endian-architectures.patch \
-        file://0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch \
-"
+           file://0001-Fix-build-on-big-endian-architectures.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

