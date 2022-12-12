Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BBCC25B04
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:37:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.37632.1670830671299568327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mpo/X3gk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830669; i=@fujitsu.com;
	bh=34O1M7ld477kPXx1MaqUR9M8knh5Z3Bd0JVJO9sQ1BQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mpo/X3gkOFH7UIQYq2NIdx9F6S+DYaV3FOJiNLzkN90N6QnnHm4d2pbVFZyQOEw2m
	 N9HsmrgTfsV1Q2HKV1MNpvB/rWt53/1VysgVxGBSxerJU4w9poSr2/M3dmWdmwoC0b
	 utk6cLrJKU5mZhbuuIbAqcmSJ+PIsofPKtNvo5jg9N/zwlkcbiNS6zhsjYHNdl1/x0
	 V2Q5R/W5eyoJgBmGf7BYbMqR4puhaGxz0UtWYk2w3j2I8qvxFBoMGdx2UHFxx8Ln3m
	 mBj4e+/y9o3Ya8J8G9nw+UFs4TC/KwL35bMwioiqon35fLzPrEjAXhs37K611eY7Vb
	 smy4gvvrNJo+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqOt7a1q
  yQXsXs8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH1Tj9jwQ/OiubzN1kaGKdydjFycQgJPGGU
  +Dr7BhOEc51J4sXS7VDOHkaJ2d/7GbsYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCUmHjqNlCcg4NFQFVizX9ZkDCvgKPEvGvtTCC2hICCxJSH78FaOQWcJJZ2rwcbLwRU86
  rrHCtEvaDEyZlPWCDGS0gcfPGCGaJXUWL25WYWCLtCYtasNqiZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFukamuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZvSrHCpR2Mb5b90TvEKMnBpCTKW3llWrIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d4N14BygkWp6akVaZk5wEiCSUtw8CiJ8LqBtPIWFyTmFmemQ6ROMSpKifOy3wBKCIAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvzXWgKTyZeSVw018BLWYCWhz1cirI4pJ
  EhJRUA1PIwxeLNkfv+6j0J2WRVOixlas2Oef9vt3ZsXWppera45sDla35jGN2RRm7ztH763mr
  f2fm+87ndvNOZAXPeyKp+TOa89T53vDoHSfT3+5gF31n8Ud7Tr23XNGh1fNb0rTTLuaW3/r59
  42u6UmJgzcqJE4pLKj4ESyxclX6IWvjm0ZGgvEdK5+s+c5aZPKbxXJr0qer+fukU640GpWfmB
  P7o6R0esWNp7MmvPrLIVjV+0/Wou29m28gf6/Ou0+bQi5Iq/7udNpw/FdV2psUgSqXl+ahyR1
  +kcuD5hxkaNicp/dJX3uDD9/seXGH/6ry5Wr8m7jlcortwWNh8T/mn7x5ffLcOKMTC7amBfcu
  7+VVYinOSDTUYi4qTgQAyeUbZVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1670830668!181799!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9131 invoked from network); 12 Dec 2022 07:37:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:37:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BE263100188
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B2090100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:37:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.5 -> 5.4.6
Date: Mon, 12 Dec 2022 15:37:13 +0800
Message-ID: <1670830635-3098-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
References: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100047

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix MemoryError when decoding Tags on 32bit architecture.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.4.5.bb => python3-cbor2_5.4.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.5.bb => python3-cbor2_5.4.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb
index 43f5299d2..19d6cbf44 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "2256fdcc11613b0297a4b844e268d20db4f7d4be79d2002f51613bd8105366ef"
+SRC_URI[sha256sum] = "b893500db0fe033e570c3adc956af6eefc57e280026bd2d86fd53da9f1e594d7"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


