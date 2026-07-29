Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A90C54F9C
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3035.1785293076078556091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=svBA53sN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-caf45fc5202so336043a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293075; x=1785897875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmBu8dUzPs09zuLDJYJ3wvuOwcn08L7kP+cY2C96v9g=;
        b=svBA53sNok8wS7DczR8xA2GKA1EgAQ+ZaI+HpEyZHFsycE5nbqlDBnDC5Kt2XXjhsQ
         8Pn5ljZvBGYltpBGzx/WnbJgOzRHm9JB2JTegp0H36wXh1AxWd193Vxdu7QHgGAg3UnP
         MBfuPBn/JH0lYmXGYw2y6MgLuLN16bgSBu3JBxjStgIbWfopvuBWtakZU6/lGEx6JmUm
         r0w2ZhGY0xcNm23WujYlnTTS/KGso4zKtkLoVuKoJRsenHklsKgkXiyHRizEPZnNG2Nb
         kI+SsVjcALp1RfOskMWTHOMTWNnD/XoQW+ouiEgznwwEnOBvYeo26JcxsPjMxlGUjMEW
         UDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293075; x=1785897875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmBu8dUzPs09zuLDJYJ3wvuOwcn08L7kP+cY2C96v9g=;
        b=lyFqOOUrBZ0gN4s4Bl2shhPjySqR0W5XYSm46BrKPRZu7XHyCCmq88h4PzsNVcImsF
         G4fLy3MjbCGqQv6fT0bH3QEb6cv0jqdLzOtfOzY6dFkR8yivj2P/zkTt9vw3EV7lTD/b
         Hse92a4Bx5LnBecacwkCiRBClFoUB4We+rk5EpsKkmkhHJWb4btIGzYyTceqnjQPMgiu
         5l1qSljVNRS3vYCBeJCY9WtiTo1nve8UknHUHrRmMU5C8hdbkvulvA6Z+UhvsQSE8YBk
         zxPH02wsBJ4Jn5sra1/BsAs47l7YdP34HcthTUEtqSjBjQDkCkhgioD1jbjnIpbV7wvw
         jv6w==
X-Gm-Message-State: AOJu0Yy4N5dLWtp4yELBjAmJt/mM1DS7toftKlKnRl1ly009veKqfW8p
	fjtECs30YNOwt8iZDQb3K1vxfKtCMiQoOy76Ds+mJHr2Fxjckupnbsu5Be4kTV9e
X-Gm-Gg: AR+sD112MvY4MtST7CpBeA3yZI7KSO+wcoTTkvtUfqrLDYLBgtLBBlR2di3O0+fPw0C
	dH4Hs/+ek8PW72VflFzpynuRVJt4ZnThhlzQEXpEIyZ5CiFlMmylM0znrc9kloL3ihnFLJhjl+3
	WQHd5ln5JSy9bIxiEfknPyeN45YLp6syA0gM0sYb5kYv5BpQqH9I0YuOSZXyiokKBHVSNdVFZxn
	eF1tqtey+NNiAXPfeGAgCvqWN6ENUQNq2Ke9UUy54h3qU+3SM8WXEzgtB0ZjlxSz75HKHdCS+61
	dEP34XJRqa/mizih5RqFH/rJWn3uEOFTPh5bux8rZbB2GvF/Och0vTZwv//haf315ol4V+pw1IJ
	wzCv/ggvdFCrCcAn8e5Y3T8iV9MFZIK0NJ4jrC2c858HeODHttlIsvrfL5XhY76/eVcXEjXwb+j
	FkBIjs28QTA2j4Ndg6DI9tbUgsq733tb4mLOsxRw0LRd+typ2qlfmqmJYhMR1Rzmo3o7Pn/U4q7
	t7vPPqnWQ4Si99Lx73NDqsZnsz0VF1UoLJU9OEXItosRZ03+LBbPPEqjRSTwXSqFfPhdi/ACcbv
	qdBowNhvM26lkwKTBMqSbBbSgpV+DyV09iaV9u9RldST0Yazoa0TtyvNHkfAZjYmBefnK/2BMQC
	mNct1WwKeZMSDMw==
X-Received: by 2002:a05:6a21:2d8f:b0:3c3:8600:f0a with SMTP id adf61e73a8af0-3c8ba60f566mr5800896637.46.1785293075342;
        Tue, 28 Jul 2026 19:44:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/18] rsyslog: upgrade 8.2604.0 -> 8.2606.0
Date: Tue, 28 Jul 2026 19:44:13 -0700
Message-ID: <20260729024420.2328180-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128527

Changes:
- imtcp/omfwd: add experimental TCP stream compression (zlib/zstd), distinct
  from TLS-native compression.
- core: fix negated exact-priority filters such as local4.!=debug so they
  match all documented priorities except the negated one.
- rainerscript: preserve embedded NULs at C-string boundaries; warn on
  constant boolean AND/OR operands.
- imfile: deliver same-file monitors independently; RFC3164 parser honors
  parser.parseHostnameAndTag at runtime; invalidate the cached programname
  when a message tag changes.
- General hardening and testbench de-flaking across many commits.

8.2606.0 makes libyaml an explicit configure feature (previously
auto-detected) that is enabled by default.

Added PACKAGECONFIG for libyaml and keep it disabled

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-tests-disable-the-check-for-inotify.patch        | 8 +++++---
 .../rsyslog/{rsyslog_8.2604.0.bb => rsyslog_8.2606.0.bb}  | 6 +++++-
 2 files changed, 10 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2604.0.bb => rsyslog_8.2606.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index 728cdace0c..bf9a41c303 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -15,6 +15,8 @@ since 2.6.13 [1].
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
+Rebased for rsyslog 8.2606.0 (line offset only, no context changes).
 ---
  tests/diag.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -23,7 +25,7 @@ diff --git a/tests/diag.sh b/tests/diag.sh
 index a9c2a75..0b017c5 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -3683,7 +3683,7 @@
+@@ -5449,7 +5449,7 @@
  		fi
  		;;
  	'check-inotify') # Check for inotify/fen support
@@ -31,8 +33,8 @@ index a9c2a75..0b017c5 100755
 +		if true; then
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
- 			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -3698,7 +3698,7 @@
+ 			if ! grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h; then
+@@ -5463,7 +5463,7 @@
  		fi
  		;;
  	'check-inotify-only') # Check for ONLY inotify support
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
index 1019db69cb..0487259c9f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "2a04b1cd6f0a5e2b60eec231acce3cf9927c4ed02bc5fbbe5dc4c35fcf887b64"
+SRC_URI[sha256sum] = "2574b3f3068e6955eb94ef5643e2b6a5b8585cc8eaa77209ff5cbc1e2e5f71e5"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -71,6 +71,10 @@ PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
 PACKAGECONFIG[testbench] = "--enable-testbench --enable-omstdout,--disable-testbench --disable-omstdout,,"
+# libyaml became enabled-by-default in 8.2606.0; 8.2604.0 did not build it, so
+# leave it out of the default PACKAGECONFIG to pass --disable-libyaml and
+# preserve prior behavior.
+PACKAGECONFIG[libyaml] = "--enable-libyaml,--disable-libyaml,libyaml,"
 
 # default no in configure
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"

