Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79C4C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6999.1651129424465155981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sgZ9LtIF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129422; i=@fujitsu.com;
	bh=HexSMJXChHSaQqKCDmKekpdPqWk9z1emsimNF3q1bag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sgZ9LtIFTC9pYyyaPLKDU2gGq082TeGFDWCSTZniE+GER4d5cHAeyJf+l/sAuJUD/
	 R5iRRppo909A4bECvxdMsFLdLOazNw7iDNXZR+Gl7UIKx7sQQkB+tcFSIkXKm0qb4X
	 4EB1hCr92g23YcYkJV7/jPsc2wDjSkA3c60TlmJStbpYOXR/GX+lx4/dLeXqcEs/On
	 q54JJULA3WadN/9NPz5rYrBTRXh5cmEfQ4CT8la69NB5gKunI4NzeNSXX+LLfPO8dh
	 dicGI3mZt/VOxyu8n56aFgU95NnqgOQAkjpLsJdBRev3MV9rOO+RyWUgYNha0n6o+X
	 SyvWCxa6Mswww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSdfPJiv
  JYO0icYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPF8vWMBfOFK07dXM3ewPhSoIuRi0NI4Amj
  xOlNM5kgnAtMEm/avrN2MXICOScZJb60cIHYbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwvESVzYvwjMZgGKb758kA3E5hVwkzj4fiFYXEJAQWLKw/dgvZwC7hItN1dA7XKTWHH5Pl
  S9oMTJmU9YIOZLSBx88YIZoldJ4sSKj0wQdoXE68OXoOJqElfPbWKewCg4C0n7LCTtCxiZVjH
  aJRVlpmeU5CZm5ugaGhjoGhqa6pqZ6RpaGuolVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM5pdhp/w7Gp30/9Q4xSnIwKYnyWplmJQnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4FWwBsoJFqWmp1akZeYAIwsmLcHBoyTCK2MMlOYtLkjMLc5Mh0idYlSUEud1BekTAElklO
  bBtcGi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4zkCk8mXklcNNfAS1mAlq8sigTZHF
  JIkJKqoGJ6WZevtSHM3tTL7/u8zzc4FyXyCJ0oukI/2mhWW4Fp5+sPLOibYb8sryJ2yMEXmx/
  W6cS5OnjN7c+IPjq/MZbUxbzLXu381chn+fmgFSB/06fFjmki4e3pf7d/fHsHZc5MkpHTtbO/
  9vlrzhT1u29rZ4k67l4p5oV54+GRnw8Lbssf2LU7lj37fNM57dMsijr+drUEdqx58rp+Elm9w
  LF6v4psJYuMzox6TyDU31g/fodus63N3BynZn0hGet6c7YGP6fhvuN704OKo82UJpT5PNVRna
  bZeKG2uzpjvfZZjQkpbSUBIhybD7+6uG6hfdfSArOLrs6I9043Tj2K9vPtTJ76x7dCcq5fe9/
  QmCWEktxRqKhFnNRcSIADc4trmEDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-532.messagelabs.com!1651129422!52147!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24090 invoked from network); 28 Apr 2022 07:03:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DBAD9100354
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CF6E81000FB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:21 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.43.0 -> 2.45.0
Date: Thu, 28 Apr 2022 15:03:35 +0800
Message-ID: <1651129416-8432-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96827

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Features
========
    androidmanagement: update the api 3d37600 (e691ed3)
    apigee: update the api aa29053 (e691ed3)
    baremetalsolution: update the api 629a968 (e691ed3)
    bigtableadmin: update the api 2d50872 (e691ed3)
    certificatemanager: update the api 40bf958 (e691ed3)
    civicinfo: update the api 95321d9 (e691ed3)
    cloudasset: update the api 3eee9ca (e691ed3)
    clouddeploy: update the api acd6b20 (e691ed3)
    container: update the api 7c592ee (e691ed3)
    dataflow: update the api 53c9c70 (e691ed3)
    dataproc: update the api 3119767 (e691ed3)
    datastream: update the api aea557f (e691ed3)
    documentai: update the api 9a6bad2 (e691ed3)
    file: update the api b527c56 (e691ed3)
    firebaseappcheck: update the api 3be993a (e691ed3)
    gkehub: update the api a77aded (e691ed3)
    logging: update the api cc08e8e (e691ed3)
    policytroubleshooter: update the api 3f20c2e (e691ed3)
    prod_tt_sasportal: update the api bacc9ef (e691ed3)
    run: update the api 1b566dc (e691ed3)
    servicemanagement: update the api 6d783b7 (e691ed3)
    vmmigration: update the api a0b42c2 (e691ed3)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ent_2.43.0.bb => python3-google-api-python-client_2.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.43.0.bb => python3-google-api-python-client_2.45.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb
index b6456869f2..070a5b5308 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ccd16b3aa92070d3777c4b188669820aacdd70695a87cfc8dbb330f6be9578f7"
+SRC_URI[sha256sum] = "375ce07994fdc187b25cc86788048ad30f8d55ff077d5e34cfcd6cbbea697128"
 
 inherit pypi setuptools3
 
-- 
2.25.1


