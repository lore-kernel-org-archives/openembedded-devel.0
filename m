Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FCDC4332F
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:13:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.6773.1643116409791398886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Pid3hwCc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116406; i=@fujitsu.com;
	bh=u0F3fI/JmRa4809jdniLPByM4bqkAfiWQZ8QsxHF9Sk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Pid3hwCcIqkz1KXOOEipyFPDYMqoCUsRTr7Sk0lyGJrAuTNDOd1m+CXTqPmiv9GZI
	 3v6XHmWIPJxLjyUOO1GpscgVP81jXjBA/ps5mjxlytDq9lxn3X9FwKUGi+MkX9U3/0
	 4jegCBp7+pZ7J16nNAs7s+tZw6GkEjg6XWttWHPz3et1lGM6KH0hG5Xyn2/eDhqNuM
	 Ca6vG42ApPPDxpo4kXcXPhWXYJMdQv/Fe/m6+PTAXHJdH/cpxctU25pRvIn0BdE83s
	 B0IFNk+SoJxTNUGBOfNqIOxmdBYdR5pSiWzXvvpdNucy7Z/nGxtIStGxDAA/F3weG3
	 royVA622FUMbg==
Received: from [100.115.38.159] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 6F/3E-14616-677FFE16;
 Tue, 25 Jan 2022 13:13:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqFv2/X2
  iwaO3whYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZj0+YClq5K7ofb2ZvYGzm6mLk4hASeMIo
  cfjIA6YuRk4g5wKTRNO9GIjECUaJ/WvvgSXYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCXeDTjIQuIzSKgKnH4cg9YL6+Ao8S7nTPBaiQEFCSmPHwP1ssp4CRxrWczI8RiR4nOBw
  vZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hob6Rqa6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfm
  Juek6OWllmxiBAZxSrEC3w7G5lU/9Q4xSnIwKYnyJq57nyjEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgvfVJ6CcYFFqempFWmYOMKJg0hIcPEoivMrfgNK8xQWJucWZ6RCpU4y6HJevz1vELMSSl5
  +XKiXOKwxSJABSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzfv8KNIUnM68
  EbtMroCOYgI74ff4dyBEliQgpqQamtKe8hxcYmP5bV7UuW0tti/PGm3PuZovXnJEuZ6yXyC3+
  X7XO8furcqmmLb5cu5pWHhL5IP2Z49sRCbkH024tkVYvFz4ssFD2nvTCvr8FwT+7/zvHRzaEr
  Dhw36jx7PRT2vvFHiaKiOyafXSz5NkY70NbpO4cvtwvWh/nM7vs1JO11i80WwQOtcW892/os+
  HasGjGyxhhR4vOa4+6Fj7QMlqwYpv4mvcnTO5dOijrt+DJt+zGjYtLT+9cf/jc4ZXysrkq1nz
  rhUxzNwhNu/3khXEMz4cXduohUpbu3y4GM2t0JP3WqhNe5zuV/2HnobKLXmrzpmvoXN9tEzpB
  Q+9+wJ2mZxqH5UTav6ZtMp9RqcRSnJFoqMVcVJwIAAZMwFdpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1643116406!15158!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32474 invoked from network); 25 Jan 2022 13:13:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:13:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D34F8100198
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C6EAF100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:13:10 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] botan: upgrade 2.18.2 -> 2.19.1
Date: Tue, 25 Jan 2022 21:12:46 +0800
Message-ID: <1643116367-7352-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
References: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:13:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95060

License-Update: year updated to 2022.

Changelog:
=========
Fix a compilation problem affecting macOS XCode (GH #2880)
Fix a build problem preventing amalgamation builds in 2.19.0 (GH #2879)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_2.18.2.bb => botan_2.19.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.18.2.bb => botan_2.19.1.bb} (87%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.18.2.bb b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
similarity index 87%
rename from meta-oe/recipes-crypto/botan/botan_2.18.2.bb
rename to meta-oe/recipes-crypto/botan/botan_2.19.1.bb
index c41667b45..4b072fc5d 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.18.2.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=a02e03c8fa2c5e7b9b3fcc1b9811fd3b"
+LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e"
+SRC_URI[sha256sum] = "e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


