Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AD0C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:40:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3726.1672803634314138057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FehKoI/9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803632; i=@fujitsu.com;
	bh=icfelUGePk08BHngfP22ggOLFhvjqW1k/Rg65QE29Vs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FehKoI/9KF5FKt5fQPOdxDUVAvloltAP3J64OUFAWEwOvub31/2DrAhNA+xLy61GA
	 FBBRGhPy5snzkF/2EPsVMiePpCd2GutwTwaPTUyMk10U+yVCveCaBp14642e1R9UKk
	 2onEdKEh7AT+CLOtVf8UDisGrETsOSnbvmGb89vVAnZAlayMDSD+1NU6Nggk7el+8R
	 dA/oQ1E+/BrPlFF9emzndpYOTQcmAYm5MJixbZzzDAOCphQvl0NCZ82knRmL5pHbYb
	 3suRc5A2nBL/IXsBuYKW3C9/RgkUJ0AINrVGB9ixA4FWwISWZqeUkOj0VTjay3eSu0
	 r8olpr0v1MzyA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSVf/65Z
  kgwnzJCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxtl+YwFlzlrdj2Lb2B8Qd3FyMXh5DAE0aJ
  jd/a2CCc60wSr36vZ4dwdjNKTHy1g7mLkZODTUBK4sb9/2wgtoiAvsTS2XvA4swCKhIvfvewg
  9jCAo4Si449BathEVCV6JxwmwXE5hVwkmjcvQ+sXkJAQWLKw/dgNqeAs8S31zvBaoSAav4cfc
  oMUS8ocXLmExaI+RISB1+8gOpVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bQ4tagstUjXUi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHRTitVVdzCeW/ZH7xCjJAeTkihvyectyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeNU/A
  eUEi1LTUyvSMnOAcQSTluDgURLhzQJp5S0uSMwtzkyHSJ1iNOa4u3DvXmaOTfu6DjALseTl56
  VKifM+BSkVACnNKM2DGwSL70uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlXg0zhycwrgdv
  3CugUJqBTktZsBDmlJBEhJdXApLDwkeP7x0uummzbfsYuxnG5whzfKQoKPfNCjHftfdlpOGWb
  5qlVVTFs93VnCEW1HvRZz5ghNW/Zk08q9nnbLI6nqZZapbkxuQX/3XE6W2R5e3vAk5g0mSjTE
  sNFK10uCbvenMcTKHTEbJ3Apsabfpyb62uaOd/8mRV455ZReruUzoUZxcWv2Pbo7z97fv/6ky
  rrnvA9scgsEz1Tv9JcRJq1K2/Ko9ehwUpTTI8HO/GapT2KfTXZSGETz8OZ5xVWPF+iPuv6uqU
  /clfc5pXrzNErjm3k+tm7a1VgpbDv1HUmHUm3Sw2OzbWePtUz8zzvn/jMF12VScLMkzuu/JRJ
  e5lfq51zRH5Tsd2Wbc6flViKMxINtZiLihMB0EEQmmoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1672803631!383422!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31675 invoked from network); 4 Jan 2023 03:40:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:40:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 204A21000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 136731000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:40:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] openwsman: upgrade 2.7.1 -> 2.7.2
Date: Fri, 30 Dec 2022 12:56:51 +0800
Message-ID: <1672376212-25291-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
References: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Security
  - call setgroups before setuid or setgid
  - harden systemd service (https://en.opensuse.org/openSUSE:Security_Features#Systemd_hardening_effort)
- Bugfixes
  - wsman-win-client-transport: initialize certificate pointer
  - iniparser: fix buffer size
  - wsman-win-client-transport: plug leak in error path
  - memory.c: fix memory cleanup
  - Improve handling of HTTP 401 Unauthorized
  - Fix serialization tests
  - Fix Ruby bindings warnings
  - Fix Ruby plugin loading test
  - Fix rpm packaging
  - Allow to run tests from 'build' directory
  - Add Python XML test
  - Enable CUNIT tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 0776ea2f6..39a9c52a4 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "6cdf3bee50388d8e5f70850322a4df57fd685a5e"
+SRCREV = "0120e256faa255d997d9a49d5207662c0b73d430"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.25.1


