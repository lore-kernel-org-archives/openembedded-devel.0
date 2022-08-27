Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D2C0502F
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:15:34 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.51435.1661624129777759794
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ekvhPzBr;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id m2so4353311pls.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GWtX55xDUjRszD6kMs4A2Ps/cJA90gj3BJWxNFKwBjQ=;
        b=ekvhPzBrlYmUoVsYHlGl39lnat2nOupvzClDeLMvuboqD+nATeiKJShEsor61kdRJc
         RRVuV+5OIemfPCVGx9yKf7gmjJ426FOAuFvWtwE0sWqf0K7+X+2I+G1XXHximx/Ypvfe
         7WgsCuoxC1cOqjvv5vqcOYA+rWTjzjyW+0CaIQ5HHk/Kk3MudNtGUNowtu646VHbQNm4
         ClMwKUbO/QO6WMHK/TQcKCS4KjxR75ap3hgA22O3XjmFl/DZ7kJOa5RNkuMEDSIRa5Yh
         or9G7za281mzGCEw2/KcGHYfaGm4HvnUATrWBFinmcGMQoUu2BlF1r5ykfAkasgG1sIY
         cIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GWtX55xDUjRszD6kMs4A2Ps/cJA90gj3BJWxNFKwBjQ=;
        b=QlozLPFhVTt/KKG7DKJ7PdN5zjfaZrgW1JuwQhhx53nRsktJLdXmLqBMjrWefX0urQ
         H3dxVLl5JKW39elYG2gxFm4U9hHPR6CbkqtuVLTVSgF+jh1hy++sBa0eOBhrZafrHyhg
         FFnh3Bs4cUimGsjcTSmlnAx5lERyDTn2IIGUle4N7vQmiBfvqWY4AvgmjnXmmasxO+5I
         +6RbzMsr99THfhmlBgN45Sm96OviTliAbt3dNUTthQwkA4Qo4bVNQJsrm7vdipNzf4Y7
         LZ1WQan+FZnOqld8GBshCR97chgkPUjg9k6OR428FuKnLW4EB9ycynciHzRZetsMksFr
         yq7Q==
X-Gm-Message-State: ACgBeo2IzUwXvP563rqOy2uz+iMkt6hJLq4LtVaZ11qcBrdUCsGkFLUZ
	KeA/7gMJENPUAEQ51610ZCBJsGUh250LBw==
X-Google-Smtp-Source: 
 AA6agR65iSAYtY/sRYHgxs1Wlao/z0o71nAy3Rxnx13dwQIbM57yK3dqxqtMWlIAyrDnlvJu4t+onA==
X-Received: by 2002:a17:90a:66c7:b0:1fd:7ce2:c905 with SMTP id
 z7-20020a17090a66c700b001fd7ce2c905mr6059805pjl.236.1661624128954;
        Sat, 27 Aug 2022 11:15:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 126-20020a620484000000b0053617cbe2d2sm3997477pfe.168.2022.08.27.11.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:15:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] dvb-apps: Use tarball for SRC_URI and
 fix build on musl
Date: Sat, 27 Aug 2022 11:15:24 -0700
Message-Id: <20220827181524.2847883-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827181524.2847883-1-raj.khem@gmail.com>
References: <20220827181524.2847883-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 18:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98496

Convert to using tarball for SRC_URI, this is only recipe in
meta-openembedded needing mercurial fetcher

Fix the stime replacement patch to fix type errors on time_t

| dvbdate.c:313:12: error: incompatible pointer to integer conversion assigning to 'time_t' (aka 'long') from 'time_t **' (aka 'long **') [-Wint-conversion]
|         ts.tv_sec = &new_time;
|                   ^ ~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...b-apps_1.1.1.bb => dvb-apps_1.1.1.20140321.bb} |  7 +++----
 ...dvbdate-Remove-Obsoleted-stime-API-calls.patch | 15 +++++----------
 2 files changed, 8 insertions(+), 14 deletions(-)
 rename meta-multimedia/recipes-multimedia/dvb-apps/{dvb-apps_1.1.1.bb => dvb-apps_1.1.1.20140321.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
rename to meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
index 98970d5b71..90a69e5e23 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
@@ -2,9 +2,8 @@ SUMMARY = "Linux DVB API applications and utilities"
 HOMEPAGE = "http://www.linuxtv.org"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRCREV = "3d43b280298c39a67d1d889e01e173f52c12da35"
 
-SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http \
+SRC_URI = "https://www.linuxtv.org/hg/dvb-apps/archive/3d43b280298c.tar.bz2;downloadfilename=${BPN}-3d43b280298c.tar.bz2 \
           file://dvb-scan-table \
           file://0001-Fix-generate-keynames.patch \
           file://0003-handle-static-shared-only-build.patch \
@@ -13,8 +12,8 @@ SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http \
           file://0006-CA_SET_PID.patch \
           file://0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch \
           "
-
-S = "${WORKDIR}/${BPN}"
+SRC_URI[sha256sum] = "f39e2f0ebed7e32bce83522062ad4d414f67fccd5df1b647618524497e15e057"
+S = "${WORKDIR}/${BPN}-3d43b280298c"
 
 inherit perlnative
 
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
index 9035b56f4a..e89f9a3cdc 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
@@ -11,22 +11,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  util/dvbdate/dvbdate.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/util/dvbdate/dvbdate.c b/util/dvbdate/dvbdate.c
-index f0df437..492ed79 100644
 --- a/util/dvbdate/dvbdate.c
 +++ b/util/dvbdate/dvbdate.c
-@@ -309,7 +309,10 @@ int atsc_scan_date(time_t *rx_time, unsigned int to)
+@@ -309,7 +309,10 @@ int atsc_scan_date(time_t *rx_time, unsi
   */
  int set_time(time_t * new_time)
  {
 -	if (stime(new_time)) {
-+	struct timespec ts;
-+	ts.tv_sec = &new_time;
-+	ts.tv_nsec = 0;
-+	if (clock_settime(CLOCK_REALTIME, &ts)) {
++	struct timespec s = {0};
++	s.tv_sec = *new_time;
++
++	if (clock_settime(CLOCK_REALTIME, &s)) {
  		perror("Unable to set time");
  		return -1;
  	}
--- 
-2.24.1
-
-- 
2.37.2


