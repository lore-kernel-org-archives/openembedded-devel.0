Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.3960.1617859048539017752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mhtPlOUU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859046; i=@fujitsu.com;
	bh=9BXisJC37AyLwbwe2QWSanELayOizgoCt/JeaCPAwUw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mhtPlOUUL5ttNuagbuwDojJBCZg5i85lXgIvyI//thi8/pnnsMhAvHbTB5H9/Av34
	 GQvENUMViO3IGBQfTyXAjMNIvK4aC/eB0LpE6KOTqpZsgvRt13AKJO/T52arivbaLC
	 +q+oCnlJSMVocRutAecLqkzI/ZlWshXnwVGZZWMv6+cdJrq/1P77CFO+3iblDb0j6G
	 QnzpWHeL1HXKbpddTqa4kW69aQQJllY6oLkMDPig9rMCwaItDBAfVFNQGJdYjl/pvt
	 R8KLB5OwndvbZiv6ifcsqeVlkVjHGDj6VuOzoQIThA2vgpXnni7oGCIkkeeDkf4Fw5
	 R4E6QIB5sq9RA==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 34/46-55620-6E19E606; Thu, 08 Apr 2021 05:17:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0X02MS/
  B4PRHIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPm9dmsBR+lKpY+38HYwLhTvIuRi0NIYCuT
  xMaGfywQznFGid5TB9i6GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBVwlznzoZQKxWQRUJC7Pb
  2AFsXkF3CTentoDVi8hoCAx5eF7Zoi4oMTJmU/A4swCEhIHX7xghqhRlNi+8wxUfZXE2dlfmC
  Yw8sxC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpYWukaGpnqJVbpJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgYGUUnDs+g7Gq68/6B1ilORgUhLltXuSmyDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvdCW16CkGBRanpqRVpmDjCoYdISHDxKIrxywMAW4i0uSMwtzkyHSJ1iV
  JQS55XuBUoIgCQySvPg2mCRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC/LBKApPJl5JX
  DTXwEtZgJaXHIwF2RxSSJCSqqBicVGy++JbfSnVXtCnU0fHHSxi3HIzj7nrSceWRq83W7SR82
  VN4PVExcXq02YVHnkva4ar5KDCVfn3/5ihcZU3UCJiXOac042Mj3Kl4y60nzp3/du1kV6574u
  tfir9zfkzM4PLxe86tKcyvU4X+Liu1ZTj/32VdX9NhnxtWbSF78cCq932PLZ0G/RHY9vT1jWL
  D52TKDNoeO1c+DpsuRVs1wK1/2fs6R8v+WFoM3pp25rG/p3ac+qkZu0dct6Z179W4t8k/X6r5
  UmX+ZfZnn48qcFZ4R0T/Z4JzUz7V6j4fV81+SAQIkmFaeI8ITlrt3JV6sXXopadjKi8NTeBYp
  XzVtWsyc8WcVzce7awAlPlViKMxINtZiLihMBcT7v3h8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-285.messagelabs.com!1617859045!613354!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24892 invoked from network); 8 Apr 2021 05:17:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:17:26 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385HPxF003230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:17:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:17:24 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] stunnel: upgrade 5.58 -> 5.59
Date: Fri, 9 Apr 2021 01:17:18 +0800
Message-ID: <1617902238-5085-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Refresh the following patch:
fix-openssl-no-des.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch           | 10 +++++-----
 .../stunnel/{stunnel_5.58.bb => stunnel_5.59.bb}       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.58.bb => stunnel_5.59.bb} (94%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 209b0dd40..aeb0bece9 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -11,7 +11,7 @@ diff --git a/src/common.h b/src/common.h
 index f7d38b0..bf485af 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -471,7 +471,9 @@ extern char *sys_errlist[];
+@@ -478,7 +478,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -25,8 +25,8 @@ diff --git a/src/protocol.c b/src/protocol.c
 index 587df09..8198eb6 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -66,7 +66,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
- NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
+@@ -67,7 +67,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+ NOEXPORT char *ldap_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
 -#ifndef OPENSSL_NO_MD4
@@ -34,7 +34,7 @@ index 587df09..8198eb6 100644
  NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
  NOEXPORT char *ntlm1();
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1175,7 +1175,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1332,7 +1332,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
      if(opt->protocol_username && opt->protocol_password) {
          if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
@@ -43,7 +43,7 @@ index 587df09..8198eb6 100644
              ntlm(c, opt);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1216,7 +1216,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1376,7 +1376,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      return NULL;
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.58.bb b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
similarity index 94%
rename from meta-networking/recipes-support/stunnel/stunnel_5.58.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.59.bb
index 1f1ca4e6b..e3704ae1d 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.58.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "d4c14cc096577edca3f6a2a59c2f51869e35350b3988018ddf808c88e5973b79"
+SRC_URI[sha256sum] = "137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f"
 
 inherit autotools
 
-- 
2.25.1

