Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id ABCE86C108
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:58:56 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c13so7737643pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2+IfnCWtFu1LYWjDSrfY6V9dGwCnRlEswPr4Fzxd/f8=;
	b=GwQ8y5LTjyESiA5+jPbMsuxpUUQCijC3FZS4ohGdYrN2LkTdSXMtckDezlgOvRw2lN
	F7wFE2pQ/+/+5TrUWHK1BB0OA1B+W0aXn/WAAyD4BEzu4KSsmXAh9KOkm/FhCFDpeZ00
	tHdagjvaBMxkiCMvsspx54Vq+NYlsvqk28VcGqbCtqrW0SMy+Fqd3XiZjox/L45Uz+kT
	ccNcwcWVybXYHSMaL6WHE4rj7s4UJ/d7aM1Eh1/5/r+oCnrjSo59XZ0QQsRjXrTKti6y
	yKgf4nGqmdaAWYrwQKwc+htJUQQjVKRaZI2g4y7cYPq2SVtNZgjU6b7fZ/ZRxeGdb0vF
	aYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2+IfnCWtFu1LYWjDSrfY6V9dGwCnRlEswPr4Fzxd/f8=;
	b=sIYdj7/vFNGo8fzy3i0MtvrvTRX8sy9Ti/JjJS9e6enRGmBCvmhJEYiQxO1Ipg9Ih1
	gUyQx1oHTlUKtmfzwA6aTmWp5sIsgKTx7jlx6+IEShG1Yc2yET6vqxMQuENbf/2cskOW
	P5xtZSNKA7v+yg40bRl3NHPAJy0B79va+GUlx3rRrDkM6cWvSmdRnJTGXe6da9R2Seoe
	ATCsQ/peT3v0bbRZgck5T9ykLIoBEw64OMQJSa8WIupJkEDdlC9nn3l9wqCUir8wlFh3
	8nljMfSssNUEAn1g3gm+tBa/oJCKmNFe/Xg0HF9eCO+EwtcYrYfVp32ALsIxlHWnyAps
	8VEw==
X-Gm-Message-State: APjAAAXlwkZ//aXWI9CTp+MeQ2rhfHkaJTektq2pDtl6VtBq73iWkO24
	Azk2yZX0H/EwL9u0jbHV1oUQuiiVHW0=
X-Google-Smtp-Source: APXvYqxgNawr4OM94ZIUsZlrw9vAW8e2Zs/8DKgVUywuFTQxZDuPVuBwPeNpPTu0uSzZyNjHMJdrOg==
X-Received: by 2002:a17:90a:4d02:: with SMTP id
	c2mr1864707pjg.94.1577141937338; 
	Mon, 23 Dec 2019 14:58:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id c2sm526448pjq.27.2019.12.23.14.58.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:58:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:58:44 -0800
Message-Id: <20191223225846.2277629-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191223225846.2277629-1-raj.khem@gmail.com>
References: <20191223225846.2277629-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH 2/4] dvb-apps: Replace stime with clock_settime
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
X-List-Received-Date: Mon, 23 Dec 2019 22:58:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Newer glibc 2.31+ removed stime.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../dvb-apps/dvb-apps_1.1.1.bb                |  1 +
 ...ate-Remove-Obsoleted-stime-API-calls.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index 3f491181de..f354ef3872 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http \
           file://0004-Makefile-remove-test.patch \
           file://0005-libucsi-optimization-removal.patch \
           file://0006-CA_SET_PID.patch \
+          file://0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch \
           "
 
 S = "${WORKDIR}/${BPN}"
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
new file mode 100644
index 0000000000..9035b56f4a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
@@ -0,0 +1,32 @@
+From d6817dbaf407f65dd4af12c51736153fae8b217f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Dec 2019 08:36:11 -0800
+Subject: [PATCH] dvbdate: Remove Obsoleted stime API calls
+
+stime() has been deprecated in glibc 2.31+ its recommended to
+replaced with clock_settime()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util/dvbdate/dvbdate.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/util/dvbdate/dvbdate.c b/util/dvbdate/dvbdate.c
+index f0df437..492ed79 100644
+--- a/util/dvbdate/dvbdate.c
++++ b/util/dvbdate/dvbdate.c
+@@ -309,7 +309,10 @@ int atsc_scan_date(time_t *rx_time, unsigned int to)
+  */
+ int set_time(time_t * new_time)
+ {
+-	if (stime(new_time)) {
++	struct timespec ts;
++	ts.tv_sec = &new_time;
++	ts.tv_nsec = 0;
++	if (clock_settime(CLOCK_REALTIME, &ts)) {
+ 		perror("Unable to set time");
+ 		return -1;
+ 	}
+-- 
+2.24.1
+
-- 
2.24.1


