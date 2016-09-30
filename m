Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0856B6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 22:30:28 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q2so5475488pfj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IWK6MrbiJ4Sa7ocv7GToO3conYimh7YEDROmgbBiJ0A=;
	b=ckizxDuZ0Am3yZynown8v3RsPEudeGWeqrjR4bUGX2hHgsSb81CHPT5AydU8gKpSRS
	hcoUqO6b5cS5pMbX3+vLyKRG+8NVxB9CN4S6GrJr/aIrnZ6pvnc4V/6s6Lh6F7Dv+A1t
	wdEpaS6pjo7XuTJQhMDJaoxbAp5YVMTck9m/njIkIV4yuD98zG5TsYyYvDjgiBpOcMMX
	i4vvTNdv82wtt53n+2pt9EbJv+I2F/L/Yhf+Sfvepe5wcEufs4kDcIkQbrz15tlXy2iQ
	WdbKBcrNihrOMquXvk2ZO6wycczuvWzlxXkdkz5Z0yPsRhuZz5lhSFCZV8tiBBLDG+Vt
	+JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IWK6MrbiJ4Sa7ocv7GToO3conYimh7YEDROmgbBiJ0A=;
	b=gGp5tHqM9ZCXQ2JxIDNxjHOgZZohPGq6Q4l8ZwvoPlD2KTXLkjdtpX2na4B1E4Lq9E
	MXPWh6hUQKdNutxfyT1s+eDw7vAyblixXa8RzkKb6D4hAqbrZJoU3S774E8RAv4BacKB
	gAl1kXDEjN1C7TvBX/iMg6kYRpmr7oFOQPUH67f58c4vdSKvLf87HHHMTcKYjofrMIyx
	tSUXxlZgUQOuSjU8CXA75WxUzww6QKVxaBcg6kFXtVlz3LeDJGkFmJwrO4wdsUMEd7nz
	WXW4zSMo8hr2DWhtlcEpRac0BTnNdxUAZn3y6EpGpDLpttTNfGxiGRV5dj1tJcVvBymc
	67xw==
X-Gm-Message-State: AA6/9Rl2uuHOf5aWw9eKEOXK1ReKbu3FzyiOzUsyoWbkJT+9DVpT8Oehs717S9ytxHVxGA==
X-Received: by 10.98.9.215 with SMTP id 84mr15815677pfj.44.1475274629867;
	Fri, 30 Sep 2016 15:30:29 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h82sm30125150pfh.22.2016.09.30.15.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 15:30:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 15:30:13 -0700
Message-Id: <1475274614-10777-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
References: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/3] onig: update 5.9.3 -> 5.9.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2016 22:30:29 -0000

  2014/12/12: Version 5.9.6

  2013/11/27: [impl] add onigenc_end_unicode().  (thanks Takenori Imoto)
  2013/11/27: [impl] add onig_add_end_call().    (thanks Takenori Imoto)

  2013/10/21: Version 5.9.5

  2013/10/21: [impl] escape warnings for -Wall. (regparse.c)
  2013/10/21: [bug] fixes an issue on Windows x64. (thanks Anatoliy Belsky)
                    The issue was discovered in PHP, see https://bugs.php.net/64769.
  2013/10/21: [impl] remove unused variable. (regcomp.c)

  2013/04/04: Version 5.9.4

  2013/04/04: [dev]  remove Makefile.in from git repository.
  2013/04/04: [dist] add oniguruma.pc.in file. (for pkg-config)
                     (thanks Giulio Paci)

  https://web.archive.org/web/20150702035706/http://www.geocities.jp/kosako3/oniguruma/HISTORY_5X.txt

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/onig/{onig_5.9.3.bb => onig_5.9.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/onig/{onig_5.9.3.bb => onig_5.9.6.bb} (82%)

diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.6.bb
similarity index 82%
rename from meta-oe/recipes-support/onig/onig_5.9.3.bb
rename to meta-oe/recipes-support/onig/onig_5.9.6.bb
index 416c2bf..abbaf98 100644
--- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
+++ b/meta-oe/recipes-support/onig/onig_5.9.6.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/ko
            file://do-not-use-system-headers.patch \
            file://configure.patch"
 
-SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
-SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
+SRC_URI[md5sum] = "d08f10ea5c94919780e6b7bed1ef9830"
+SRC_URI[sha256sum] = "d5642010336a6f68b7f2e34b1f1cb14be333e4d95c2ac02b38c162caf44e47a7"
 
 BINCONFIG = "${bindir}/onig-config"
 
-- 
1.9.1


