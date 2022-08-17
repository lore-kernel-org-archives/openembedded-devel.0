Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587D3C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 03:00:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.24459.1660705199885187852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 20:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vDL3lZpi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705198; i=@fujitsu.com;
	bh=lfXwocKoBLiEjGsj+EEsEbOYLO5XigmCdonBkJEJdig=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vDL3lZpihXquG9Pun00z+qJl3ipdf/pkxmRKhIRSp2bxEdZ+1tkaOX61BSipjSBaT
	 Vrft/DQbJ6Pgge2IMXVnnWSZBshxCwuONqUHfw0BifrkJUQyMWkFnmvsAUX78nmcNU
	 1/kOf6Bt80PLD2L1qAw1ntI9ssdguL26vBrP2fJiqpmdStBTg9gcajrQw1wWN7vnI/
	 OT0V38RI/wNWoN+TMIj0cn2B06kjTDCnkdnwRF6gKuL4AT/VVfV0d56p7UJ3xjMi0R
	 o5xA2srqP+LfJJR0ltDU/B2fRCyB7xfokBdbN8tzOk+iZhkqIffFtuK3ZZGyUoB8xY
	 Qwz3aw9mpN98w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxSXdt5J8
  kg+752hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bsM7cYCz5xVlx+eoelgbGXs4uRi0NI4Amj
  xPbFPawQznUmiYuf1rFBOHsYJc5cmgLkcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOArcXHRMbAaFgFViRs3/4DFeQWcJC5ObAGrlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54AV
  WjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRpukosz0jJLcxMwcXUMDA11
  DQ1NdS0sgZamXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGJopxcnlOxi3
  7/uld4hRkoNJSZS3n+lPkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3m/hQDnBotT01Iq0zBxgn
  MCkJTh4lER4ZQOA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEud96wNUJABSlFGaBzcCFr
  OXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzfge5hCczrwRu0yugI5iAjjh28TfIESWJCCm
  pBiYrX2auuPVf3/63sUvdqNvFn1lXW/tF83K8/Jks5vmyK7RWm6XZvereaxu/VaiUwTzOTfdC
  9Dfts08mvWg/v6Hk8tvVlQnOq/XFWuU3b3VOfC01i+nKdT72dz6XYgQtc9OLaw5KaNxbvt3pa
  XHAap5O6wLDRGGLusSmj/d2liklNIfxhXy5cu38lz1H7czFZiWt2TitVCbDql/lj2KAXOFdQ4
  sEkVnvDTucz9RcfrGtt8HOXLLbdW/kVg9e1rvLPFfx5EpcO2z5+6wC31/+jmupR1y3WE31mLz
  0FsOZGr8XISd/7/VdWSru5mC3V6zrfubMs2e+3xb4ErD0Yeak+/9kj7RGhT353+Ltw8KwU4ml
  OCPRUIu5qDgRAJlqg+VUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1660705197!55654!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15568 invoked from network); 17 Aug 2022 02:59:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:59:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2707D1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:59:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 19ED1100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:59:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:59:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.0.1 -> 2.0.2
Date: Wed, 17 Aug 2022 10:59:41 +0800
Message-ID: <1660705182-17300-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 03:00:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98284

Changelog:
==========
 Fix XSD 1.1 assertions effective scope
 Add support for Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.0.1.bb => python3-xmlschema_2.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.0.1.bb => python3-xmlschema_2.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb
index 68148b7b5c..eb9d4f511b 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "1460ba451b4084d4edd031b564f460f5c11b14b20764ce1f64691f8c69e1194d"
+SRC_URI[sha256sum] = "ce915696b3a819fe0f986824517b9281dbd5626fd2d213363fab40f34edf05bd"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


