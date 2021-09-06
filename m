Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.16860.1630890749598171596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vmyW0cWl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630890747; i=@fujitsu.com;
	bh=sllpBqttxRUG7KSbD4o1mjRGipQkGLeacJI5j3R+JUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vmyW0cWlg7VScHobmKyoVjSbuQo8+DY7uVAOiobaSZ7HxUb71s3BO3onHLV4Hp84+
	 R+qxW0lVAziHbNXcPgomsDYTVCRYw04kz4vJEJjA/+yMGqZiq7BfA4H38PgxKY7DTE
	 3ZFhw3PWQT2V1IHggcDdBD6aHj9Fk4a6i/EQCEnH0VHYBW8uhjuS2V+glPoG8DanMJ
	 9jbVqCAUKSR/OlYAkbCtqsMlqZyphoHdvxbNlk5Hnd3xh0AkOzejxwpQnmxSV8j7aD
	 k3JHJztsTNmDd7ASHIZ4N+MhxppSONOwArol7V7FSHgmR/C8VnEjmDTaZns4m6smoM
	 7DSFC3iXlneHg==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id B4/DF-21838-BFA65316; Mon, 06 Sep 2021 01:12:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqvs7yzT
  RYJWGxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCaMXn5a9aCfewVlx99Y29gfM7WxcjFISQwi0ni
  Wf9DRgjnOKNE37LfQA4nB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2MIC9hKLJncxg
  dgsQPGzxw6ygNi8Ak4SD78dA7MlBBQkpjx8D9bLKeAssXHiNLD5QkA1++6+h6oXlDg58wkLxH
  wJiYMvXjBD9CpKzL7cDDWnQmLWrDamCYz8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqG
  hka6hpZmukaGJXmKVbpJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgOKYUHLm2g/HA6w96
  hxglOZiURHk17EwThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwlqUD5QSLUtNTK9Iyc4CxAZOW4
  OBREuG9lAmU5i0uSMwtzkyHSJ1iVJQS5z0AkhAASWSU5sG1weLxEqOslDAvIwMDgxBPQWpRbm
  YJqvwrRnEORiVh3tZ4oCk8mXklcNNfAS1mAlrc9tAEZHFJIkJKqoFpsdfRpauqNSfIvrpYdFL
  s9dKHnd8deCbnxtbMzYudsPei/YnOwBlhVYtu7H9Q/CXpefSWPQGsJ0+cn3Cz6cBya5PLz5uc
  bkiXS8lf5FRx2fN3bqj9z6yV9fscxT/N18tSq1oQ8F9FW/dVzoFEns+/KiY2yhsGP3LeFhC44
  6HadHvmj2/vibhc2yP9WMYi4V9eyOFNzXsK/nxX+P4uZZqL9yOTLfue/5HK6r5SrRAzb0H7nB
  t609fJ7cyd5PWns+7UR6HbXyfadylc8D+6T3ZlyeFplZc+rebf/njTqd8FLDs7G4ryjr5W9OH
  wXfzh/ILL993FQ0qj1iXOeuEvfWn7+TPsixvftrTuVRWx2KHHrKXEUpyRaKjFXFScCADZesST
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-287.messagelabs.com!1630890746!226868!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17137 invoked from network); 6 Sep 2021 01:12:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:12:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861CQHL020968
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:12:26 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:12:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.28.1 -> 5.29.0
Date: Mon, 6 Sep 2021 09:12:00 +0800
Message-ID: <1630890720-12064-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
References: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.28.1.bb => monit_5.29.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.28.1.bb => monit_5.29.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.28.1.bb b/meta-oe/recipes-support/monit/monit_5.29.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.28.1.bb
rename to meta-oe/recipes-support/monit/monit_5.29.0.bb
index 9833c0cecf..9528fe7354 100644
--- a/meta-oe/recipes-support/monit/monit_5.28.1.bb
+++ b/meta-oe/recipes-support/monit/monit_5.29.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "57d8885f66e58a0a4ca6a967f2bb7e8c15ed988a25b5ca6ba6733f919ef07a5c"
+SRC_URI[sha256sum] = "f665e6dd1f26a74b5682899a877934167de2b2582e048652ecf036318477885f"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1

